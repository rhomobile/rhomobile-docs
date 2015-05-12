rhoconnect-rb [![Build Status](https://secure.travis-ci.org/rhomobile/rhoconnect-rb.png)](http://travis-ci.org/rhomobile/rhoconnect-rb)
===

A ruby library for the [RhoConnect](http://rhomobile.com/products/rhoconnect) App Integration Server.

Using rhoconnect-rb, your application's model data will transparently synchronize with a mobile application built on the [Rhodes framework](http://rhomobile.com/products/rhodes), or any of the available [RhoConnect clients](http://rhomobile.com/products/rhoconnect/).  This client includes built-in support for [ActiveRecord](http://ar.rubyonrails.org/) and [DataMapper](http://datamapper.org/) models.

## Getting started

Load the `rhoconnect-rb` library:

	require 'rhoconnect-rb'

Note, if you are using datamapper, install the `dm-serializer` library and require it in your application.  `rhoconnect-rb` depends on this utility to interact with Rhoconnect applications using JSON.

## Setup the Model
Now include Rhoconnectrb::Resource in a model that you want to synchronize with your mobile application:

	class Product < ActiveRecord::Base
	  include Rhoconnectrb::Resource
	end

Or, if you are using DataMapper:

	class Product
	  include DataMapper::Resource
	  include Rhoconnectrb::Resource
	end

## Partitioning Datasets

Next, your models will need to declare a partition key for `rhoconnect-rb`.  This partition key is used by `rhoconnect-rb` to uniquely identify the model dataset when it is stored in a rhoconnect instance.  It is typically an attribute on the model or related model.  `rhoconnect-rb` supports two types of partitions:

* :app - No unique key will be used, a shared dataset is synchronized for all users.
* lambda { some lambda } - Execute a lambda which returns the unique key string.

For example, the `Product` model above might have a `belongs_to :user` relationship.  This provides us a simple way to organize the `Product` dataset for rhoconnect by reusing this relationship.  The partition identifying a username would be declared as:

	class Product < ActiveRecord::Base
	  include Rhoconnectrb::Resource

	  belongs_to :user

	  def partition
			lambda { self.user.username }
	  end
	end

Now all of the `Product` data synchronized by rhoconnect will organized by `self.user.username`.  Note: You can also used a fixed key if the dataset doesn't require a dynamic value:

	def partition
	  :app
	end

For more information about Rhoconnect partitions, please refer to the [Rhoconnect docs](http://docs.rhomobile.com/rhoconnect/source-adapters#data-partitioning).

## Querying Datasets

`rhoconnect-rb` installs a `/rhoconnect/query` route in your application which the Rhoconnect instance invokes to query the dataset for the dataset you want to synchronize.  This route is mapped to a `rhoconnect_query` method in your model.  This method should return a collection of objects:

	class Product < ActiveRecord::Base
	  include Rhoconnectrb::Resource

	  belongs_to :user

	  def partition
			lambda { self.user.username }
	  end

	  def self.rhoconnect_query(partition, attributes = nil)
	    Product.includes(:user).where("users.username = ?", partition)
	  end
	end

In this example, `self.rhoconnect_query` returns a list of products where the partition string (provided by the rhoconnect instance) matches the `user_id` field in the products table.

## Configuration and Authentication

### Running RhoConnect Manually

Configure RhoConnect in an initializer like `config/initializers/rhoconnect.rb` (for Rails), or directly in your application (i.e. Sinatra).  Here you will setup the rhoconnect uri (the location of your RhoConnect instance), the api\_token (see [rhoconnect:get_token](http://docs.rhomobile.com/rhoconnect/command-line#rake-tasks) rake task), and app\_endpoint (the location of your ruby app):

	config.uri   = "http://myrhoconnect.com"
	config.token = "secrettoken"
	config.app_endpoint = "http://myapp.heroku.com"

If `app_endpoint` is defined, your Rhoconnect instance will be configured to query data from the endpoint using the rhoconnect_query method in your model.  For example, if your `app_endpoint` is defined as "http://myapp.heroku.com", RhoConnect will query data with:

	POST http://myapp.heroku.com/rhoconnect/query

Example:

	Rhoconnectrb.configure do |config|
		config.uri    = "http://localhost:8675"
		config.token  = "mydevtoken"
		config.app_endpoint = "http://localhost:3000"
	end

Example with authentication:

`rhoconnect-rb` installs a `/rhoconnect/authenticate` route into your application which will receive credentials from the client.  Add block which handles the credentials:

	Rhoconnectrb.configure do |config|
		config.uri    = "http://localhost:8675"
		config.token  = "mydevtoken"
		config.app_endpoint = "http://localhost:3000"
	  config.authenticate = lambda { |credentials|
	  	User.authenticate(credentials[:login], credentials[:password])
	  }
	end

### Using the [RhoConnect Heroku Addon](http://docs.rhomobile.com/rhoconnect/heroku-addon)

If you're using the [RhoConnect Heroku Addon](http://docs.rhomobile.com/rhoconnect/heroku-addon), then you can omit the config.uri and config.token (they are managed for you):

	Rhoconnectrb.configure do |config|
		config.app_endpoint = "http://myapp.heroku.com"
	  config.authenticate = lambda { |credentials|
	    User.authenticate(credentials[:login], credentials[:password])
	  }
	end

## Rhoconnect-rb API

### Overview of the API

The Rhoconnectrb::API module contains routes to all the resources available in <a href='http://docs.rhomobile.com/rhoconnect/rest-api'>Rhoconnect</a>.  At a high level the API calls take on the following syntax:

	Namespace::Resource.verb_action1_action2_...([resource_id,action1_id,action2_id],data)

Some of these values are not used for every API call such as resource_id and data.

### System Resource

#### `POST /rc/v1/system/login`


	data = {:login=>'username',:password=>'password'}
	Rhoconnectrb::API::System.post_login(data)

#### `GET /rc/v1/system/license`


	Rhoconnectrb::API::System.get_license

#### `POST /rc/v1/system/reset`


	Rhoconnectrb::API::System.post_reset({})

#### `GET /rc/v1/system/appserver`


	Rhoconnectrb::API::System.get_appserver

#### `POST /rc/v1/system/appserver`


	data = {:adapter_url=>'http://test.com'}
	Rhoconnectrb::API::System.post_appserver(data)

#### `GET /rc/v1/system/stats`


	data ={:names=>"*sources*"}
	Rhoconnectrb::API::System.get_stats(data)

### Store Resource

#### `GET /rc/v1/store/:doc`


	Rhoconnectrb::API::Store.get('docname')

#### `POST /rc/v1/store/:doc`


	data = {:data=>{:id=3},:append=>false}
	Rhoconnectrb::API::Store.post('docname',data)

### User Resource

#### `POST /rc/v1/users`


	data = {:attributes=>{:login=>'login',:password=>'password'}}
	Rhoconnectrb::API::Users.post(data)

#### `DELETE /rc/v1/users/:user_id`


	Rhoconnectrb::API::Users.delete('user_id')

#### `PUT /rc/v1/users/:user_id`


	data = {:attributes=>{:a_user_specific_attribute => a_user_specific_attribute_value}}
	Rhoconnectrb::API::Users.put('user_id',data)

#### `GET /rc/v1/users`


	Rhoconnectrb::API::Users.get

#### `Get /rc/v1/users/:user_id`

	Rhoconnectrb::API::Users.get('user_id')

#### `Get /rc/v1/users/:user_id/clients`


	Rhoconnectrb::API::Users.get_clients(['user_id','client_id'])

#### `DELETE /rc/v1/users/:user_id/clients/:client_id`


	Rhoconnectrb::API::Users.delete_clients(['user_id','client_id'])

#### `GET /rc/v1/users/:user_id/sources/:source_id/docnames`


	Rhoconnectrb::API::Users.get_sources_docnames(['user_id','source_id'])

#### `POST /rc/v1/users/ping`


	data = {
	  :api_token => token,
	  :user_id => [array_of_users],
	  :sources => source_name,
	  :message => 'hello world',
	  :vibrate => 2000,
	  :sound => 'hello.mp3'
	}
	Rhoconnectrb::API::Users.post_ping(data)

#### `GET /rc/v1/users/:user_id/sources/:source_id/docs/:doc`


	Rhoconnectrb::API::Users.get_sources_docs(['user_id','source_id','docname'])

#### `POST /rc/v1/users/:user_id/sources/:source_id/docs/:doc`


	data = {:data=>data,:append=>false}
	Rhoconnectrb::API::Users.post_sources_docs(['user_id','source_id','docname'],data)

### Read State Resource

#### `POST /rc/v1/read_state/users/:user_id/sources/:source_id`


	data = {:refresh_time => 100}
	Rhconnectrb::API::ReadState.post_users_sources(['user_id','source_id'])

### Source Resource

#### `GET /rc/v1/sources/type/:partition_type`


	Rhoconnectrb::API::Sources.get_type('parition_type')

#### `GET /rc/v1/sources/:source_id`


	Rhoconnectrb::API::Sources.get('source_id')

#### `PUT /rc/v1/sources/:source_id`


	data = {:user_name=>'username',:data=>{:poll_interval=>25}}
	Rhoconnectrb::API::Sources.put('source_id',data)

### Client Resource

#### `GET /rc/v1/clients/:client_id`


	Rhoconnectrb::API::Clients.get('client_id')

#### `GET /rc/v1/clients/:client_id/sources/:source_id/docnames`


	Rhoconnectrb::API::Clients.get_sources_docnames(['client_id','source_id'])

#### `POST /rc/v1/clients/:client_id/sources/:source_id/docnames`


	data = {:data=>data,:append=>false}
	Rhoconnectrb::API::Clients.post_sources_docnames(['client_id','source_id'],data)

### Resource Resource

The Resource class is used for API calls to user defined dynamic or source adapters.  The resource name is passed in as a parameter.

#### `POST /app/v1/:source_name/push_objects`


	data = {:user_id=>'user_id',:objects=>data}
	Rhoconnectrb::API::Resource.post_push_objects('source_name',data)

#### `POST /app/v1/:source_name/push_deletes`


	data = {:user_id => 'user_id',:objects=>'object_ids'}
	Rhoconnectrb::API::Resource.post_push_deletes('source_name',data)

#### `POST /app/v1/:source_name/fast_insert`


	data = {:user_id=>'user_id',:objects=>data}
	Rhoconnectrb::API::Resource.post_fast_insert('source_name',data)

#### `POST /app/v1/:source_name/fast_update`


	data = {:user_id=>'user_id',:objects=>data}
	Rhoconnectrb::API::Resource.post_fast_update('source_name',data)

#### `POST /app/v1/:source_name/fast_delete`


	data = {:user_id=>'user_id',:objects=>data}
	Rhoconnectrb::API::Resource.post_fast_delete('source_name',data)


## Meta
Created and maintained by Lucas Campbell-Rossen, Vladimir Tarasov and Lars Burgess.

Released under the [MIT License](http://www.opensource.org/licenses/mit-license.php).