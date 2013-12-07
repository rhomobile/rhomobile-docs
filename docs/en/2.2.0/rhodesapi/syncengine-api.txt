# SyncEngine API

Synchronize data for the Rhodes model and handle updates between the Rhodes application and the RhoConnect server. [Refer to the Rhodes Developer Guide under Synchronization for more discussion.](../rhodes/synchronization)

## login

Authenticates the user with the RhoConnect server. [Click here for an example in the Rhodes Developer Guide under Synchronization.](../rhodes/synchronization#sync-authentication)

	:::ruby
	SyncEngine.login(login, password, callback_url)

<table border="1">
<tr>
	<td><code>login</code></td>
	<td>The login name for the RhoConnect server.</td>
</tr>
<tr>
	<td><code>password</code></td>
	<td>The password for the RhoConnect server.</td>
</tr>
<tr>
	<td><code>callback_url</code></td>
	<td>url to the callback method that is called when the login is finished.</td>
</tr>
</table>

## logout

Logs out the user from the RhoConnect server.

	:::ruby
	SyncEngine.logout

## logged_in

True if the user is logged into the RhoConnect server, false otherwise.

	:::ruby
	SyncEngine.logged_in

## dosync

Start a synchronization with the RhoConnect server and show an optional sync status popup.

	:::ruby
	SyncEngine.dosync(show_sync_status, query_params)

<table border="1">
<tr>
	<td><code>show_sync_status</code></td>
	<td>True if you want to show a sync status popup, false otherwise.</td>
</tr>
<tr>
	<td><code>query_params</code></td>
	<td>Query parameters passed to sync server.</td>
</tr>
</table>

## dosync_source

Start a synchronization with the RhoConnect server for a given source id or source name and show an optional status popup.

	:::ruby
	SyncEngine.dosync_source(source_id_or_name, show_sync_status, query_params)

<table border="1">
<tr>
	<td><code>source_id_or_name</code></td>
	<td>The source name or ID.</td>
</tr><tr>
	<td><code>show_sync_status</code></td>
	<td>True if you want to show a sync status popup, false otherwise.</td>
</tr>
<tr>
	<td><code>query_params</code></td>
	<td>Query parameters passed to sync server.</td>
</tr>
</table>

## lock_sync_mutex

Blocks the synchronization call to wait for SyncEngine lock (useful for performing batch operations).

	:::ruby
	SyncEngine.lock_sync_mutex

## unlock_sync_mutex

Release the SyncEngine lock started by lock_sync_mutex.

	:::ruby
	SyncEngine.unlock_sync_mutex

## stop_sync

Stops any synchronization operations currently in progress.

	:::ruby
	SyncEngine.stop_sync

## set_notification

Set notification callback for a model. [Click here for an example in the Rhodes Developer Guide under Synchronization.](../rhodes/synchronization#notifications)

	:::ruby
	SyncEngine.set_notification(source_id, callback_url, params)

<table border="1">
<tr>
	<td><code>source_id</code></td>
	<td>The source id for the RhoConnect server. If -1, set notification for all Rhodes models, and the callback is not removed after the sync process completes.</td>
</tr>
<tr>
	<td><code>callback_url</code></td>
	<td>path to the callback method called when the sync is complete.</td>
</tr>
<tr>
	<td><code>params</code></td>
	<td>parameters for the callback method.</td>
</tr>
</table>

### Notification Parameters

When set_notification is called, it receives a variable called @params, just like a normal Rhodes controller action. Below are the common parameters for all notifications; 

<table border="1">
<tr>
	<td><code>@params["source_id"]</code></td>
	<td>The id of the current model that is synchronizing.</td>
</tr>
<tr>
	<td><code>@params["source_name"]</code></td>
	<td>Name of the model (i.e. "Product").</td>
</tr>
<tr>
	<td><code>@params["sync_type"]</code></td>
	<td>Type of sync used for this model: "incremental" or "bulk".</td>
</tr>
<tr>
	<td><code>@params["status"]</code></td>
	<td>Status of the current sync process: "in_progress", "error", "ok", "complete", "schema-changed".</td>
</tr>
</table>

#### @params["status"] = "in_progress": parameters for incremental sync_type

<table border="1">
<tr>
	<td><code>@params["total_count"]</code></td>
	<td>Total number of records that exist for this RhoConnect source.</td>
</tr>
<tr>
	<td><code>@params["processed_count"]</code></td>
	<td>Number of records included in the sync page.</td>
</tr>
<tr>
	<td><code>@params["cumulative_count"]</code></td>
	<td>Number of records the SyncEngine has processed so far for this source.</td>
</tr>
</table>

#### @params["status"] = "in_progress": parameters for bulk sync_type

<table border="1">
<tr>
	<td><code>@params["bulk_status"]</code></td>
	<td>The state of the bulk sync process: "start", "download", "change_db".</td>
</tr>
</table>

#### @params["status"] = "error": parameters for sync error

<table border="1">
<tr>
	<td><code>@params["error_code"]</code></td>
	<td>HTTP response code of the RhoConnect server error: 401, 500, 404, etc.</td>
</tr>
<tr>
	<td><code>@params["error_message"]</code></td>
	<td>Response body for error (if any).</td>
</tr>
<tr>
	<td><code>@params["server_errors"]</code></td>
	<td>Hash of Type objects of RhoConnect adapter error (if exists): "login-error", "query-error", "create-error", "update-error", "delete-error", "logoff-error"</td>
</tr>
</table>

For "login-error", "query-error", "logoff-error": Type object is a hash containing a 'message' from server:
	@params["server_errors"]["query-error"]['message']

For “create-error”, “update-error”, “delete-error”: Type object is a hash each containing an "object" as a key (that failed to create) and a corresponding "message" and "attributes":
	@params["server_errors"]["create-error"][object]['message']  
	@params["server_errors"]["create-error"][object]['attributes']

## clear_notification

Clears the synchronization notification for a given source id.

	:::ruby
	clear_notification(source_id)

<table border="1">
<tr>
	<td><code>source_id</code></td>
	<td>The id of the source on the RhoConnect server.</td>
</tr>
</table>

## on_sync_create_error

Perform an action upon a synchronization create error.

	:::ruby
	SyncEngine.on_sync_create_error(source_name, objects, action)

<table border="1">
<tr>
	<td><code>source_name</code></td>
	<td>The name of the source on the RhoConnect server.</td>
</tr>
<tr>
	<td><code>objects</code></td>
	<td>One or more error objects.</td>
</tr>
<tr>
	<td><code>action</code></td>
	<td>:delete to remove the object from client, :recreate to push this object to the server again at the next sync.</td>
</tr>
</table>

## on_sync_update_error

Perform an action upon a sync update error.

	:::ruby
	SyncEngine.on_sync_update_error(source_name, objects, action, rollback_objects)

<table border="1">
<tr>
	<td><code>source_name</code></td>
	<td>The name of the source on the RhoConnect server.</td>
</tr>
<tr>
	<td><code>objects</code></td>
	<td>One or more error objects.</td>
</tr>
<tr>
	<td><code>action</code></td>
	<td>:retry to push the update object operation to server again at next sync, :rollback to write the rollback_objects to client database.</td>
</tr>
<tr>
	<td><code>rollback_objects</code></td>
	<td>must be specified for :rollback action. Contains the attributes for the objects before a failed update and send by the server.</td>
</tr>
</table>

## on_sync_delete_error

Perform action upon a synchronization delete error.

	:::ruby
	SyncEngine.on_sync_delete_error(src_name, objects, action)

<table border="1">
<tr>
	<td><code>source_name</code></td>
	<td>The name of the source on the RhoConnect server.</td>
</tr>
<tr>
	<td><code>objects</code></td>
	<td>One or more error objects.</td>
</tr>
<tr>
	<td><code>action</code></td>
	<td>:retry – will push delete object operation to server again at next sync.</td>
</tr>
</table>

## set_pollinterval

Updates the SyncEngine poll interval.

	:::ruby
	SyncEngine.set_pollinterval(interval)

<table border="1">
<tr>
	<td><code>interval</code></td>
	<td>number of seconds for the poll interval. 0 disables polling-based synchronization (you may still use push-based-synchronization).</td>
</tr>
</table>

## set_syncserver

Sets the RhoConnect server address and stores it in rhoconfig.txt.

	:::ruby
	SyncEngine.set_syncserver(server_url)

<table border="1">
<tr>
	<td><code>server_url</code></td>
	<td>The url for the RhoConnect server.</td>
</tr>
</table>

## set_objectnotify_url

Set the callback for when the SyncEngine notifies when a specific object on the current page has been modified.

	:::ruby
	SyncEngine.set_objectnotify_url(callback_url)

<table border="1">
<tr>
	<td><code>callback_url</code></td>
	<td>The url for the callback method called upon the SyncEngine notification.</td>
</tr>
</table>

callback_url - the url for the callback.

## set_pagesize

Set the synchronization page size for the SyncEngine.

	:::ruby
	SyncEngine.set_pagesize(size)

<table border="1">
<tr>
	<td><code>size</code></td>
	<td>Size of the SyncEngine synchronization page. Default is 2000.</td>
</tr>
</table>

## get_pagesize

Returns the current sync page size for the SyncEngine.

	:::ruby
	SyncEngine.get_pagesize

## enable_status_popup

Enable or disable the show status popup.

	:::ruby
	SyncEngine.enable_status_popup(true_or_false)

<table border="1">
<tr>
	<td><code>true_or_false</code></td>
	<td>true to enable the show status popup. Default is false, except for Blackberry where default is true.</td>
</tr>
</table>

## set_ssl_verify_peer

Enable or disable verification of RhoConnect ssl certificates.

	:::ruby
	SyncEngine.set_ssl_verify_peer(true_or_false)

<table border="1">
<tr>
	<td><code>true_or_false</code></td>
	<td>true to enable verification of RhoConnect ssl certificates. Default is true.</td>
</tr>
</table>

## get_user_name

Returns the current username of the SyncEngine session if logged_in is true; if false, returns the last logged in username.

	:::ruby
	SyncEngine.get_user_name

## search

Call search on the RhoConnect application.

	:::ruby
	SyncEngine.search(:source_names, :from, :search_params, :offset, max_results, :callback, :callback_param, :progress_step)

<table border="1">
<tr>
	<td><code>:source_names</code></td>
	<td>(optional) list of source names for when you wish to search the RhoConnect server over multiple sources.</td>
</tr>
<tr>
	<td><code>:from</code></td>
	<td>(optional) Sets the RhoConnect path that records will be fetched with. Default is 'search'.</td>
</tr>
<tr>
	<td><code>:search_params</code></td>
	<td>hash containing key/value search items.</td>
</tr>
<tr>
	<td><code>:offset</code></td>
	<td>Starting record to be returned.</td>
</tr>
<tr>
	<td><code>:max_results</code></td>
	<td>Maximum number of records to be returned.</td>
</tr>
<tr>
	<td><code>:callback</code></td>
	<td>Callback to be executed after search is completed.</td>
</tr>
<tr>
	<td><code>:callback_param</code></td>
	<td>(optional) Parameters passed to callback.</td>
</tr>
<tr>
	<td><code>:progress_step</code></td>
	<td>(optional) Define how often the search callback will be executed with 'in_progress' state.</td>
</tr>
<tr>
	<td><code>:sync_changes</code></td>
	<td>(optional) true or false(default). Define if the client changes the send to server before search.</td>
</tr>
</table>
