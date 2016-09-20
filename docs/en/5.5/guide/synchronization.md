# Synchronization with Rhodes
As we've shown in the [Rhom section](../../2.2.0/rhodes/rhom), adding synchronized data via RhoConnect to your Rhodes application is as simple as generating a model and enabling a `:sync` flag.  This triggers the internal Rhodes sync system called the [**`RhoConnectClient`**](../api/RhoConnectClient) to synchronize data for the model and transparently handle bi-directional updates between the Rhodes application and the RhoConnect server.

This section covers in detail how the RhoConnectClient works in Rhodes and how you can use its flexible APIs to build data-rich native applications.

## Sync Workflow
The RhoConnectClient interacts with RhoConnect over http(s) using [JSON](http://www.json.org/) as a data exchange format.  With the exception of [bulk sync](../rhoconnect/bulk-sync), pages of synchronized data, or "sync pages" as we will refer to them here, are sent as JSON from RhoConnect to the RhoConnectClient.

Below is a simplified diagram of the RhoConnectClient workflow:

<img src="https://s3.amazonaws.com/rhodocs/guide/synchronization/sync-flow.png">

This workflow consists of the following steps:

* RhoConnectClient sends authentication request to RhoConnect via [`RhoConnectClient.login`](../api/RhoConnectClient#mlogin).  RhoConnect calls [`Application.authenticate`](../rhoconnect/authentication) with supplied credentials and returns `true` or `false`.

* If this is a new client (i.e. fresh install or reset), the RhoConnectClient will initialize with RhoConnect:

	* It requests a new unique id (client id) from RhoConnect.  This id will be referenced throughout the sync process.

	* It will register platform information with RhoConnect.  If this is a [push-enabled application](device-caps#push-notifications) application, the RhoConnectClient will send additional information like device push pin.

* RhoConnectClient requests sync pages from RhoConnect, one model(or [Rhom](rhom) model) at a time.  The order the models are synchronized is determined by the model's [`:sync_priority`](rhom#property-bag), or determined automatically by the RhoConnectClient.

## Sync Authentication
When you generate a Rhodes application, you'll notice there is an included directory called `app/Settings`.  This contains a default `settings_controller.rb` and some views to manage authentication with [RhoConnect](../rhoconnect/introduction).

### `login`
In `settings_controller.rb#do_login`, the [`RhoConnectClient.login`](../api/RhoConnectClient#mlogin) method is called:

	:::ruby
	RhoConnectClient.login(
		@params['login'], 
		@params['password'], 
		url_for(:action => :login_callback) 
	)
	
Here login is called with the `login` and `password` provided by the `login.erb` form.  A `:login_callback` action is declared to handle the asynchronous result of the [`RhoConnectClient.login`](../api/RhoConnectClient#mlogin) request.

### `login_callback`
When [`RhoConnectClient.login`](../api/RhoConnectClient#mlogin) completes, the callback declared is executed and receives parameters including success or failure and error messages (if any).

	:::ruby
	def login_callback
		error_code = @params['error_code'].to_i
		if error_code == 0
			# run sync if we were successful
			WebView.navigate Rho::RhoConfig.options_path
			RhoConnectClient.dosync
		else
			if error_code == Rho::RhoError::ERR_CUSTOMSYNCSERVER
				@msg = @params['error_message']
			end
				
			if not @msg or @msg.length == 0   
				@msg = Rho::RhoError.new(error_code).message
			end
			
			WebView.navigate( url_for(:action => :login, :query => {:msg => @msg}) )
		end
	end

This sample checks the login `error_code`, if it is `0`, perform a full sync and render the settings page.  Otherwise, it sets up an error message and re-displays the login page with an error.

## Notifications
The RhoConnectClient system uses notifications to provide information about the sync process to a Rhodes application. Notifications can be setup once for the duration of runtime or each time a sync is triggered.  One a sync is processing for a model, notifications are called with parameters containing sync process state.  Your application can use this information to display different wait pages, progress bars, etc. Below are two flowcharts describing the notification process during sync along with details of each of the steps. Each part in the flow chart also has an associated section below the two charts for even more in-depth description.

### Notifications Flow
The flow charts below shows the logic flow for notifications concerning model sync. Bulk sync and incremental sync are handled differently and therefore are illustrated in two separate flow charts. The details of each step are spelled out further down this page.

<div class="row-fluid">
	<div class="span6">
		<p style="text-align:center"><b>Incremental Sync</b></p>
		<img src="https://s3.amazonaws.com/rhodocs/guide/synchronization/incremental-sync.png">
	</div>
	<div class="span6">
		<p style="text-align:center"><b>Bulk Sync</b></p>
		<img src="https://s3.amazonaws.com/rhodocs/guide/synchronization/bulk-sync.png">
	</div>
</div>

It is important to note that, for bulk sync, the value of `@params["status"]` will only ever be "in_progress", "error", or "complete". There is no step in the process that will return an `@params["status"]` of "ok" status. Instead, `@params["bulk_status"]` (described in detail below) can be accessed to get the status of the bulk sync job. This is done because of the asynchronous nature of the bulk sync process.

### Set Notifications
To set a notification for a model, you can use the [setNotification](../api/RhoConnectClient#msetNotification) method using this syntax `RhoConnectClient.setNotification(STRING sourceName, CallBackHandler callback)`:

	:::ruby
	RhoConnectClient.setNotification(
		Account.get_source_name,
		url_for(:action => :sync_notify),
		"sync_complete=true"
	)

Which is the same as:

	:::ruby
	Account.setNotification(
		url_for(:action => :sync_notify),
		"sync_complete=true"
	)

In this example, once the sync process for the `Account` model is complete, the view will be directed to the `Account.sync_notify()` action (with params 'sync_complete=true') if user is on the same page. The `Account.sync_notify()` action is scaffolded by default in Ruby, in JavaScript, the action must be implemented in order to use it.

**NOTE: In these examples, after the sync is complete the notifications are removed.**

You can also set a notification for all models:

	:::ruby
	RhoConnectClient.setNotification(
		"*", url_for(:action => :sync_notify),
		"sync_complete=true"
	)

**NOTE: This notification will not be removed automatically.**

### Notification Parameters
When the notification is called, it will receive a variable called `@params`, just like a normal Rhodes controller action.

#### Common Parameters
These parameters are included in all notifications.

* `@params["source_id"]` - The id of the current model that is synchronizing.
* `@params["source_name"]` - Name of the model (i.e. "Product")
* `@params["sync_type"]` - Type of sync used for this model: "incremental" or "bulk"
* `@params["status"]` - Status of the current sync process: "in_progress", "error", "ok", "complete", "schema-changed"

#### "in_progress" - incremental sync
* `@params["total_count"]` - Total number of records that exist for this RhoConnect source.
* `@params["processed_count"]` - Number of records included in the sync page.
* `@params["cumulative_count"]` - Number of records the RhoConnectClient has processed so far for this source.

#### "in_progress" - bulk sync
* `@params["bulk_status"]` - The state of the bulk sync process: 
	* "start": when bulk sync start and when specific partition is start syncing
	* "download": when client start downloading database from server
	* "change_db": when client start applying new database
	* "blobs": when client start downloading remote blob files
	* "ok": when sync of partition finished without error
	* "complete": when bulk sync finished for all partitions without errors
 
* `@params["partition"]` - Current bulk sync partition.

#### "error"
* `@params["error_code"]` - HTTP response code of the RhoConnect server error: 401, 500, 404, etc.
* `@params["error_message"]` - Response body (if any)
* `@params["server_errors"]` - Hash of &lt;model&gt; objects of RhoConnect adapter error (if exists): "login-error", "query-error", "create-error", "update-error", "delete-error", "logoff-error".
	* For **"login-error"**, **"query-error"**, **"logoff-error"**:
		* &lt;model&gt; object is a hash containing a "message" from server - `@params["server_errors"]["query-error"]['message']`
	* For **"create-error"**, **"update-error"**, **"delete-error"**:
		* &lt;model&gt; object is hash each containing an "object" as a key (that failed to create) and a corresponding "message" and "attributes":
			* `@params["server_errors"]["create-error"][object]['message']`
			* `@params["server_errors"]["create-error"][object]['attributes']`
		* These errors should be handled by their respective on_sync_*_error method in the [RhoConnectClient API](../api/RhoConnectClient)

**NOTE: "create-error" has to be handled in sync callback. Otherwise sync will stop on this model. To fix create errors you should call [RhoConnectClient.on_sync_create_error](../api/RhoConnectClient#mon_sync_create_error)**

#### "ok"
* `@params["total_count"]` - Total number of records that exist for this RhoConnect source.
* `@params["processed_count"]` - Number of records included in the last sync page.
* `@params["cumulative_count"]` - Number of records the RhoConnectClient has processed so far for this source.

#### "complete"
This status returns only when the RhoConnectClient process is complete.

#### "schema-changed"
This status returns for bulk-sync models that use [`FixedSchema`](rhom#fixed-schema) when the schema has changed in the RhoConnect server.

**NOTE: In this scenario the sync callback should notify the user with a wait screen and start the bulk sync process.**

## Server error processing on client
### create-error
has to be handled in sync callback. Otherwise sync will stop on this model. To fix create errors you should call Model.on_sync_create_error or RhoConnectClient.on_sync_create_error:

	:::ruby
	RhoConnectClient.on_sync_create_error( src_name, objects, action )
	Model.on_sync_create_error( objects, action )

		* objects - One or more error objects
		* action - May be :delete or :recreate. :delete just remove object from client, :recreate will push this object to server again at next sync.

### update-error
If not handled, local modifications, which were failing on server, will never sync to server again.
So sync will work fine, but nobody will know about these changes.

	:::ruby
	RhoConnectClient.on_sync_update_error( src_name, objects, action, rollback_objects = nil )
	Model.on_sync_update_error( objects, action, rollback_objects = nil)
		
		* objects - One or more error objects
		* action - May be :retry or :rollback. :retry will push update object operation to server again at next sync, :rollback will write rollback_objects to client database.
		* rollback_objects - contains objects attributes before failed update and sends by server. should be specified for :rollback action.

### delete-error
If not handled, local modifications, which were failing on server, will never sync to server again.
So sync will work fine, but nobody will know about these changes.

	:::ruby
	RhoConnectClient.on_sync_delete_error( src_name, objects, action )
	Model.on_sync_delete_error( objects, action )
		
		* objects - One or more error objects
		* action - May be :retry - will push delete object operation to server again at next sync.

For example:
	:::ruby
		RhoConnectClient.on_sync_create_error( @params['source_name'], 
				@params['server_errors']['create-error'], :delete)

		RhoConnectClient.on_sync_update_error( @params['source_name'], 
				@params['server_errors']['update-error'], :retry)
		RhoConnectClient.on_sync_update_error( @params['source_name'], 
				@params['server_errors']['update-error'], :rollback, @params['server_errors']['update-rollback'] )
				
		RhoConnectClient.on_sync_delete_error( @params['source_name'], 
				@params['server_errors']['delete-error'], :retry)

### unknown-client error
Unknown client error return by server after resetting server database, removing particular client id from database or any other cases when server cannot find client id(sync server unique id of device).
Note that login session may still exist on server, so in this case client does not have to login again, just create new client id.
Processing of this error contain 2 steps:

When unknown client error is come from server, client should call database_client_reset and start new sync, to register new client id:

	:::ruby
	rho_error = Rho::RhoError.new(err_code)
	 
	if err_code == Rho::RhoError::ERR_CUSTOMSYNCSERVER
		@msg = @params['error_message']
		end

		@msg = rho_error.message unless @msg and @msg.length > 0

		if rho_error.unknown_client?(@params['error_message'])
			Rhom::Rhom.database_client_reset
			RhoConnectClient.dosync
		end

If login session also deleted or expired on the server, then customer has to login again:

	:::ruby
	rho_error = Rho::RhoError.new(err_code)

	if err_code == Rho::RhoError::ERR_CUSTOMSYNCSERVER
		@msg = @params['error_message']
	end

	@msg = rho_error.message unless @msg and @msg.length > 0

	if err_code == Rho::RhoError::ERR_UNATHORIZED
		WebView.navigate( 
			url_for(
				:action => :login, 
				:query => { :msg => "Server credentials expired!" } 
			)
		)
	end

### push_changes Method
If at any time you have records sitting on you server that have yet to be processed you'll need to use the [`push_changes`](../api/rhom-api#push_changes) Rhom API method to force the server to process those records. The reason for this is that the server will not process records that are in its queue unless there are new records to sync. To artificially send a POST to the server and force it to process those records, you must use the `push_changes` method. For example, if you had a model called `Product` and you needed the server to process all pending product models sitting the the queue, you would use `Product.push_changes()`.

## Examples
### Notification Example
Here is a simple example of a sync notification method that uses some of the parameters described above:

	:::ruby
	def sync_notify
		status = @params['status'] ? @params['status'] : ""
		bulk_sync? = @params['sync_type'] == 'bulk'

		if status == "in_progress" 	
			# do nothing
	
		elsif status == "complete" or status == "ok"
			WebView.navigate Rho::RhoConfig.start_path
	
		elsif status == "error"
		
				if @params['server_errors'] && 
					 @params['server_errors']['create-error']
						RhoConnectClient.on_sync_create_error( @params['source_name'], 
								@params['server_errors']['create-error'], :delete)
				end
		
			err_code = @params['error_code'].to_i
			rho_error = Rho::RhoError.new(err_code)
	 
		if err_code == Rho::RhoError::ERR_CUSTOMSYNCSERVER
				@msg = @params['error_message']
			end
	
			@msg = rho_error.message unless @msg and @msg.length > 0   

			if rho_error.unknown_client?(@params['error_message'])
				Rhom::Rhom.database_client_reset
				RhoConnectClient.dosync
	
			elsif err_code == Rho::RhoError::ERR_UNATHORIZED
				WebView.navigate( 
				url_for(
				:action => :login, 
				:query => { :msg => "Server credentials expired!" } 
			)
			)                
			else
				WebView.navigate( 
				url_for(
				:action => :err_sync, 
				:query => { :msg => @msg } 
			)
			)
			end    
		end
	end

**NOTE: If the view was updated using AJAX calls, this mechanism may not work correctly as the view location will not change from one AJAX call to another.  Therefore, you might need to specify the `:controller` option in WebView.navigate.**

### Sync Object Notifications
The RhoConnectClient can also send a notification when a specific object on the current page has been modified.  This is useful if you have frequently-changing data like feeds or time-lines in your application and want them to update without the user taking any action.

To use object notifications, first set the notification callback in `application.rb#initialize`:

	:::ruby
	class AppApplication < Rho::RhoApplication
		 def initialize
			super

			RhoConnectClient.set_objectnotify_url(
			url_for(
			:controller => "Product",
			:action => :sync_object_notify
			)
		)
		 end
	end

Next, in your controller action that displays the object(s), add the object notification by passing in a record or collection of records:
	
	:::ruby
	class ProductController < Rho::RhoController

		# GET /Product
		def index
			@products = Product.find(:all)

			add_objectnotify(@products)
			render
		end
	
		# ...
	
		def sync_object_notify
			#... do something with notification data ...
	
		# refresh the current page
			WebView.refresh
			# or call System.execute_js to call JavaScript function which will update list
		end
	end

#### Object Notification Parameters
The object notification callback receives three arrays of hashes: "deleted", "updated" and "created".  Each hash contains values for the keys "object" and "source_id" so you can display which records were changed.

## Binary Data and Blob Sync
Synchronizing images or binary objects between RhoConnect and the RhoConnectClient is declared by having a 'blob attribute' on the [Rhom model](../api/rhom-api). Please see the [blob sync section](../rhoconnect/blob-sync) for more information.

## Filtering Datasets with Search
If you have a large dataset in your back-end service, you don't have to synchronize everything with the RhoConnectClient. Instead you can filter the synchronized dataset using the RhoConnectClient's `search` function.

Like everything else with the RhoConnectClient, `search` requires a defined callback which is executed when the `search` results are retrieved from RhoConnect.

### Using Search
First, call `search` from your controller action:

	:::ruby
	def search
		page = @params['page'] || 0
		page_size = @params['page_size'] || 10
		Contact.search(
			:from => 'search',
			:search_params => { 
			:FirstName => @params['FirstName'], 
			:LastName => @params['LastName'], 
			:Company => @params['Company'] 
		},
			:offset => page * page_size,
			:max_results => page_size,
			:callback => url_for(:action => :search_callback),
			:callback_param => ""
		)
		render :action => :search_wait
	end


Your callback might look like:

	:::ruby
	def search_callback
		status = @params["status"] 
		if (status and status == "ok")
			WebView.navigate( 
			url_for( 
				:action => :show_page, 
				:query => @params['search_params']
			) 
		)
		else
			render :action => :search_error
		end
	end

**NOTE: Typically you want to forward the original search query `@params['search_params']` to your view that displays the results so you can perform the same query locally.**

Next, the resulting action `:show_page` will be called.  Here we demonstrate using Rhom's [advanced find query syntax](../api/rhom-api#advanced-queries) since we are filtering a very large dataset:

	:::ruby
	def show_page
		@contacts = Contact.find(
		:all,
			:conditions => {
				{
				:func => 'LOWER',
				:name => 'FirstName',
				:op => 'LIKE'
			} => @params[:FirstName],
				{
				:func => 'LOWER',
				:name=>'LastName',
				:op=>'LIKE'
			} => @params[:LastName],
				{
				:func=>'LOWER',
				:name=>'Company',
				:op=>'LIKE'
			} => @params[:Company],
			}, 
			:op => 'OR',
			:select => ['FirstName','LastName', 'Company'],
			:per_page => page_size,
			:offset => page * page_size
		)
		render :action => :show_page
	end

If you want to stop or cancel the search, return "stop" in your callback:

	:::ruby
	def search_callback
		if(status and status == 'ok')
			WebView.navigate( url_for :action => :show_page )
		else
			'stop'
		end
	end

Finally, you will need to implement the `search` method in your source adapter.  See the [RhoConnect search method](../rhoconnect/source-adapters#source-adapter-api) for more details.

## RhoConnectClient API
Find the full list of methods available in the RhoConnectClient API [here](../api/RhoConnectClient)

## Backround synchronization on iOS
On iOS, if application is put to background, it will be suspended. To allow application finish sync after application goes to background, you can use 'finish_sync_in_background' parameter in [`rhoconfig.txt`](configuration). When this parameter is set to '1', if sync is active in the time of background transition ( e.g. started from app_deactivate handler ), application will not be suspended until sync is finished.