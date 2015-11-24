Source Adapter Controller API (Ruby)
===
Your RhoConnect source adapter controller can use any of these methods to facilitate handling of the incoming requests.

## register Rhoconnect::EndPoint

`Rhoconnect::EndPoint` is a [Sinatra extension](http://www.sinatrarb.com/extensions.html) which adds the Controller into the application's URLMap.
The Source Adapter Controller becomes available at the root path `/app/v1/<Source Adapter's Name>`. 
One exception here is the Application Controller - which has its own special root `/rc/v1/app`.
All of the Controller's routes are registered relative to its root, for example:

  GET '/my_custom_route' declared inside of the Product Controller expands into GET '/app/v1/Product/my_custom_route'

NOTE: You can see which routes are available for your application by using `rhoconnect routes` command inside of your app's root directory.

## register Rhoconnect::Handler::Sync

`Rhoconnect::Handler::Sync` is a [Sinatra extension](http://www.sinatrarb.com/extensions.html) which adds default SYNC routes into your Source Adapter Controller. When used, it adds the following routes into the Source Adapter Controller:

<table border="1">
	<tr>
		<td><code>GET '/'</code></td>
		<td>Main SYNC route responsible for data query and downloading the changes to the client.</td>
		<td>Handler: <code>:rc_handler => :query</code></td>
		<td>Options: <code>:source_required => true, :client_required => true, :login_required => true</code></td>
	</tr>
	<tr>
		<td><code>POST '/'</code></td>
		<td>Create/Update/Delete route responsible for handling incoming changes (creates/updates/deletes) from the client.</td>
		<td>Handler: <code>:rc_handler => :cud</code></td>
		<td>Options: <code>:source_required => true, :client_required => true, :login_required => true</code></td>
	</tr>
	<tr>
		<td><code>PUT '/:id'</code></td>
		<td>Update route responsible for updating a single object from the client.</td>
		<td>Handler: <code>:rc_handler => :update</code></td>
		<td>Options: <code>:source_required => true, :client_required => true, :login_required => true</code></td>
	</tr>
	<tr>
		<td><code>DELETE '/:id'</code></td>
		<td>Update route responsible for deleting a single object from the client.</td>
		<td>Handler: <code>:rc_handler => :delete</code></td>
		<td>Options: <code>:source_required => true, :client_required => true, :login_required => true</code></td>
	</tr>
</table>

Also, the `Rhoconnect::Handler::Sync` extension adds the following Plugin Callback routes (requires API Token):
<table border="1">
	<tr>
		<td><code>POST '/push_objects'</code></td>
		<td>This route is used to upload changes (creates or updates) from the plugin (or any 3rd party application).</td>
		<td>Handler: <code>:rc_handler => :push_objects</code></td>
		<td>Options: <code>:admin_required => true</code></td>
	</tr>
	<tr>
		<td><code>POST '/push_deletes'</code></td>
		<td>This route is used to delete objects (called from the plugin or any 3rd party application).</td>
		<td>Handler: <code>:rc_handler => :push_deletes</code></td>
		<td>Options: <code>:admin_required => true</code></td>
	</tr>
</table>


## @model

@model variable is available implicitly only inside of the Source Adapter Controller's routes that enforce :source_required => true condition (which in turn requires valid session cookie upon the call).
Access your source adapter model instance variable inside of the route:

	:::ruby
	post '/my_custom_route', :source_required => true do
	  "Hello! I am - #{@model.source.inspect}"
	end

NOTE: Application Controller doesn't have the @model variable available, since it is not a Source Adapter Controller.

Alternatively, you can construct the model's instance by using the following method inside of your route:

	:::ruby
	post '/my_custom_route' do
		source_instance = Source.load('<source_name>',
			{:user_id => '<username>', :app_id => Rhoconnect::APP_NAME}
		@model = Rhoconnect::Model::Base.create(source_instance)
		"Hello! I am - #{@model.source.inspect}"
	end

Here:

<table border="1">
	<tr>
		<td><code>source_name</code></td>
		<td>name of the source that you want to load (for example, <code>Product</code>). Source here can be considered as the model's run-time meta context.</td>
	</tr>
	<tr>
		<td><code>username</code></td>
		<td>name of the user whose source data you want to load. Source (and model) always operate in the context of a certain user.</td>
	</tr>
</table>

## Sinatra context

You can access and use any of the standard Sinatra objects defined in the context of the request: params, request, response, etc.

	:::ruby
	post '/my_custom_route'
	  log params.inspect
	  response.headers['my_ret_header'] = 'This is my response header'
	  status 200
	 end

## Sinatra framework

Source adapter controller is a Sinatra app - you can use any of the standard Sinatra features: 

* [extensions](http://www.sinatrarb.com/extensions.html)
* [middleware](http://www.sinatrarb.com/intro.html#Sinatra::Base%20-%20Middleware,%20Libraries,%20and%20Modular%20Apps)
* [conditions](http://www.sinatrarb.com/intro.html#Conditions)
* [helpers](http://www.sinatrarb.com/intro.html#Helpers)
* [`before` and `after` blocks](http://www.sinatrarb.com/intro.html#Filters)

Look for more info in the [Sinatra documentation](http://www.sinatrarb.com/)

In the below example, you can register and use custom defined logger.

	:::ruby
	module MyCustomLogger
	  def my_custom_log(message)
	  	# do some interesting stuff here
	  end
	end

	class Product < Rhoconnect::Controller::Base
	  helpers MyCustomLogger

	  # use my_custom_log before the route is called
	  before '/my_custom_route' do
	    my_custom_log("Calling from before")
	  end

	  # route definitions
	  post '/my_custom_route' do
	    'Hello World'
	  end
	end

## Pre-defined conditions

Some of the most commonly used features and helpers are exposed to the user via pre-defined Sinatra conditions.

For more info on what is Sinatra condition and how to use it - [look here](http://www.sinatrarb.com/intro.html#Conditions)

### admin_required

When installed, this condition enforces presence of the `api-token`, thus, making the route accessible only to the admin user. Typically, all `system` routes using this condition:

	:::ruby
	post '/my_custom_admin_route', :admin_required => true do
		puts 'Only admin can access this route'
	end

### login_required

When installed, this condition enforces presence of the `Session Cookie`, i.e. only logged-in user can access this route. Typically, this condition enabled by default for all user-defined Controllers.
If want to alter this behavior, you can enable/disable this condition for any particular route:

	:::ruby
	get '/my_custom_route', :login_required => false do
		puts 'Hello World - no user required to access this route'
	end

### source_required

When installed, this condition enforces presence of the `source_id`. This condition is enabled by default for all user-defined Controllers - since they by definition based upon Source.
To customize behavior of your route - you can disable this check and load any desired sources manually inside of your route. Also, this condition initializes `@model` variable:

	:::ruby
	get '/my_custom_route', :source_required => false do
		other_source = Source.load('<source_name>',
			{:user_id => '<username>', :app_id => Rhoconnect::APP_NAME}
		other_model = Rhoconnect::Model::Base.create(other_source)
		puts "Hello World - using my #{other_model.inspect}"
	end

### client_required

When installed, this condition enforces presense of the `client_id`. This condition is enabled by default for all `sync` routes - because they are called from the client. Also, `client_required` condition implicitly enforces presence of the `source_id` parameter and therefore is used together with `source_required` condition. You may enable/disable it in your custom route:

	:::ruby
	post '/my_custom_route_many_sources', :client_required => false, :source_required => false, :login_required => false, :admin_required => true do
		puts "Admin is required here - this is my admin route and client is not required!"
		# my custom sources_data is a JSON hash-table 
		user_name = @params['username']
		sources_data = @params['sources_data']
		sources_data.each do |source_name, source_data|
			# do something with data
		end
	end

### verbs

You can use this helper condition whenever you need to make some functionality available only to routes with specific verbs. Typically, this can be helpful in your custom `:before` or `:after` filters.
For example, if you have two routes using the same path, but different verbs (POST and GET) and you want to execute `:before` filter only for the GET route:

	:::ruby
	class Product < Rhoconnect::Controller::Base
	  # use my_custom_log before the route is called
	  before '/my_custom_route', :verbs => ['GET'] do
	    puts "This code will be executed only before the GET route"
	  end

	  # route definitions
	  post '/my_custom_route' do
	    puts 'my POST route'
	  end

	  get 'my_custom_route' do
	  	puts 'My GET route'
	  end
	end

### default settings

Every user-defined Source Adapter Controller has certain conditions enabled by default. This means that whenever you're defining your custom route inside of the Source Adapter Controller, it will implicitly install several conditions. Below is the list of the conditions installed by default:

	* :source_required => true
	* :client_required => true
	* :login_required => true

NOTE: If you want disable one of predefined conditions, then you should do it manually inside of your custom routes declaration.
