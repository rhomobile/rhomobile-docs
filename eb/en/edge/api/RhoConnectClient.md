#RhoConnectClient


## Overview
RhoConnectClient is used for synchronization with RhoConnect applications.
## Enabling the API
In order to use this API you must include the following extension in your `build.yml`
    :::ruby
    extensions: ["rhoconnect-client"]

## JavaScript Usage
Be sure to review the [JavaScript API Usage](/guide/api_js) guide for important information about using this API in JavaScript

## Ruby Usage
Be sure to review the [Ruby API Usage](/guide/api_ruby) guide for important information about using this API in Ruby
        


##Methods



### addObjectNotify(<span class="text-info">STRING</span> sourceName, <span class="text-info">STRING</span> object)
Add the object notification by passing in an object ID.

####Parameters
<ul><li>sourceName : <span class='text-info'>STRING</span><p>Source name for object notification. </p></li><li>object : <span class='text-info'>STRING</span><p>Object ID to get notifications. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoConnectClient.addObjectNotify(<span class="text-info">STRING</span> sourceName, <span class="text-info">STRING</span> object)</code> 


### cleanObjectNotify()
Removes callback for object notifications.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoConnectClient.cleanObjectNotify()</code> 


### clearNotification(<span class="text-info">STRING</span> sourceName)
Clears the sync notification for a given source.

####Parameters
<ul><li>sourceName : <span class='text-info'>STRING</span><p>Source name to clear notification. Use '*' to clear notification for all models. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoConnectClient.clearNotification(<span class="text-info">STRING</span> sourceName)</code> 


### doSync(<span class="text-info">BOOLEAN</span> showStatusPopup, <span class="text-info">STRING</span> queryParams, <span class="text-info">BOOLEAN</span> syncOnlyChangedSources)
Start the RhoConnectClient sync process.

####Parameters
<ul><li>showStatusPopup : <span class='text-info'>BOOLEAN</span> <span class='label label-info'>Optional</span><p>Set to true to show status popup. </p></li><li>queryParams : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>Parameters to be passed to server. </p></li><li>syncOnlyChangedSources : <span class='text-info'>BOOLEAN</span> <span class='label label-info'>Optional</span><p>Sync only sources that have local changes. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoConnectClient.doSync(<span class="text-info">BOOLEAN</span> showStatusPopup, <span class="text-info">STRING</span> queryParams, <span class="text-info">BOOLEAN</span> syncOnlyChangedSources)</code> 


### doSyncSource(<span class="text-info">STRING</span> sourceName, <span class="text-info">BOOLEAN</span> showStatusPopup, <span class="text-info">STRING</span> queryParams)
Start RhoConnectClient sync process for a given source name.

####Parameters
<ul><li>sourceName : <span class='text-info'>STRING</span><p>Source name. </p></li><li>showStatusPopup : <span class='text-info'>BOOLEAN</span> <span class='label label-info'>Optional</span><p>Set to true to show status popup. </p></li><li>queryParams : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>Parameters to be passed to server. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoConnectClient.doSyncSource(<span class="text-info">STRING</span> sourceName, <span class="text-info">BOOLEAN</span> showStatusPopup, <span class="text-info">STRING</span> queryParams)</code> 


### isLoggedIn()
Returns true if the RhoConnectClient currently has a user session, false if not.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:

* BOOLEAN : True if have logged in user session, false if not.

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoConnectClient.isLoggedIn()</code> 


### isSyncing()
Returns true if sync is currently in progress.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:

* BOOLEAN : True if sync has started but not finished yet, false otherwise.

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoConnectClient.isSyncing()</code> 


### login(<span class="text-info">STRING</span> login, <span class="text-info">STRING</span> password)
Authenticates the user with RhoConnect. The callback will be executed when it is finished.

####Parameters
<ul><li>login : <span class='text-info'>STRING</span><p>Login name. </p></li><li>password : <span class='text-info'>STRING</span><p>Password. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></p><ul></ul>

####Returns
Synchronous Return:

* INTEGER

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoConnectClient.login(<span class="text-info">STRING</span> login, <span class="text-info">STRING</span> password)</code> 


### logout()
Logout the user from the RhoConnect server. This removes the local user session.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoConnectClient.logout()</code> 


### setNotification(<span class="text-info">STRING</span> sourceName)
The RhoConnectClient system uses notifications to provide information about the sync process to a Rhodes application. Notifications can be setup once for the duration of runtime or each time a sync is triggered. Once a sync is processing for a model, notifications are called with parameters containing sync process state. Your application can use this information to display different wait pages, progress bars, etc. setNotification will set notification for a model.

####Parameters
<ul><li>sourceName : <span class='text-info'>STRING</span><p>Source name for which notification will be enabled. Use '*' to set notification for all models. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoConnectClient.setNotification(<span class="text-info">STRING</span> sourceName)</code> 


### setObjectNotification()
The RhoConnectClient can send a notification when a specific object on the current page has been modified. This is useful if you have frequently-changing data like feeds or timelines in your application and want them to update without the user taking any action.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>OBJECT</span></p><ul><ul><li>created : <span class='text-info'>ARRAY</span><p>Array of created objects. </p></li><li>updated : <span class='text-info'>ARRAY</span><p>Array of updated objects. </p></li><li>deleted : <span class='text-info'>ARRAY</span><p>Array of deleted objects. </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoConnectClient.setObjectNotification()</code> 


### stopSync()
Stops any sync operations currently in progress.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoConnectClient.stopSync()</code> 


##Properties



###pageSize

####Type
<span class='text-info'>INTEGER</span> 
####Description
Page size for RhoConnectClient. Default size is 2000.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.RhoConnectClient.pageSize</code>



####Platforms

* Android
* Windows Mobile/CE

###pollInterval

####Type
<span class='text-info'>INTEGER</span> 
####Description
Sync poll interval in seconds. Setting this to 0 will disable polling-based sync. Sync process will be triggered automatically according to this setting.
####Params
<p><strong>Default:</strong> 60</p>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.RhoConnectClient.pollInterval</code>



####Platforms

* Android
* Windows Mobile/CE

###showStatusPopup

####Type
<span class='text-info'>BOOLEAN</span> 
####Description
Enable or disable show status popup.
####Params
<p><strong>Default:</strong> true</p>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.RhoConnectClient.showStatusPopup</code>



####Platforms

* Android
* Windows Mobile/CE

###sslVerifyPeer

####Type
<span class='text-info'>BOOLEAN</span> 
####Description
Enable or disable verification of RhoConnect ssl certificates, true by default.
####Params
<p><strong>Default:</strong> true</p>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.RhoConnectClient.sslVerifyPeer</code>



####Platforms

* Android
* Windows Mobile/CE

###syncServer

####Type
<span class='text-info'>STRING</span> 
####Description
Sync server URL.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.RhoConnectClient.syncServer</code>



####Platforms

* Android
* Windows Mobile/CE

###userName

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description
Current username of the RhoConnectClient session if isLoggedIn is true, otherwise returns the last logged in username.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.RhoConnectClient.userName</code>



####Platforms

* Android
* Windows Mobile/CE

##Remarks



###Notification Callback Parameters

When the notification is called, it will receive a variable called @params, just like a normal Rhodes controller action.

## Common Parameters

These parameters are included in all notifications.

* source_id - The id of the current model that is synchronizing.
* source_name - Name of the model (i.e. "Product")
* sync_type - Type of sync used for this model: "incremental" or "bulk"
* status - Status of the current sync process. See below for the possible values:

In the following sections we cover the different status values and parameters available with each status.

### status: "in_progress" - incremental sync progress

* total_count - Total number of records that exist for this RhoConnect source.
* processed_count - Number of records included in the sync page.
* cumulative_count - Number of records the SyncEngine has processed so far for this source.

### status: "in_progress" - bulk sync progress

* bulk_status - The state of the bulk sync process:
  * start - Bulk sync has started for a specific partition
  * download - Bulk sync file download has started
  * change_db - New bulk sync database change has started
  * blobs - Bulk sync blob files have started to download
  * ok - Current partition has completed
  * complete - All partitions have completed

* partition - Current bulk sync partition.

### status: "error"

* error_code - HTTP response code of the RhoConnect server error: 401, 500, 404, etc.
* error_message - Response body (if any)
* server_errors - Hash of Type objects of RhoConnect adapter error (if exists):
  * login-error - An error in adapter login method
  * query-error - An error in adapter query method
  * create-error - An error in adapter create method
  * update-error - An error in adapter update method
  * delete-error - An error in adapter delete method
  * logoff-error - An error in adapter logoff method

Each error contains a 'message' key with the error message.

Ruby Example:
    :::ruby
    @params["server_errors"]["query-error"]["message"] 
    #=> "Error connecting to backend server: http://rhostore.herokuapp.com"

JavaScript Example:
    :::javascript
    params.server_errors["query-error"].message
    //=> "Error connecting to backend server: http://rhostore.herokuapp.com"

#### Handling 'create-error'
"create-error" is a unique situation that needs to be handled in your sync callback. See `RhoConnectClient.onSyncCreateError()` for more details.

### status: "complete"
This status returns only when the sync run is complete (all partitions are done synchronizing).

### status: "schema-changed"
This is present if a FixedSchema model has changed during the current sync run. A new bulk sync run should be triggered (by setting bulksyncState) and the user should be alerted in the UI.

                

###Backround Sync on iOS


On iOS, if the application is backgrounded, it will be suspended. This also means if a current sync is in progress, it will immediately terminate. To prevent this behavior, set 'finish_sync_in_background' to '1' in rhoconfig.txt. When set to '1', the RhoConnectClient will attempt to finish synchronization before the application fully suspends.

                