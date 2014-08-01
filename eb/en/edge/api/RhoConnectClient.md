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
<p>Add the object notification by passing in an object ID.</p>


####Parameters
<ul><li>sourceName : <span class='text-info'>STRING</span><p>
<p>Source name for object notification.</p>
 </p></li><li>object : <span class='text-info'>STRING</span><p>
<p>Object ID to get notifications.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

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
<p>Removes callback for object notifications.</p>


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
<p>Clears the sync notification for a given source.</p>


####Parameters
<ul><li>sourceName : <span class='text-info'>STRING</span><p>
<p>Source name to clear notification. Use &lsquo;*&rsquo; to clear notification for all models.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

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
<p>Start the RhoConnectClient sync process.</p>


####Parameters
<ul><li>showStatusPopup : <span class='text-info'>BOOLEAN</span> <span class='label label-info'>Optional</span><p>
<p>Set to true to show status popup.</p>
 </p></li><li>queryParams : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>
<p>Parameters to be passed to server.</p>
 </p></li><li>syncOnlyChangedSources : <span class='text-info'>BOOLEAN</span> <span class='label label-info'>Optional</span><p>
<p>Sync only sources that have local changes.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

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
<p>Start RhoConnectClient sync process for a given source name.</p>


####Parameters
<ul><li>sourceName : <span class='text-info'>STRING</span><p>
<p>Source name.</p>
 </p></li><li>showStatusPopup : <span class='text-info'>BOOLEAN</span> <span class='label label-info'>Optional</span><p>
<p>Set to true to show status popup.</p>
 </p></li><li>queryParams : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>
<p>Parameters to be passed to server.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

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
<p>Returns true if the RhoConnectClient currently has a user session, false if not.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:

* BOOLEAN : 
<p>True if have logged in user session, false if not.</p>


####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoConnectClient.isLoggedIn()</code> 


### isSyncing()
<p>Returns true if sync is currently in progress.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:

* BOOLEAN : 
<p>True if sync has started but not finished yet, false otherwise.</p>


####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoConnectClient.isSyncing()</code> 


### login(<span class="text-info">STRING</span> login, <span class="text-info">STRING</span> password)
<p>Authenticates the user with RhoConnect. The callback will be executed when it is finished.</p>


####Parameters
<ul><li>login : <span class='text-info'>STRING</span><p>
<p>Login name.</p>
 </p></li><li>password : <span class='text-info'>STRING</span><p>
<p>Password.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

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
<p>Logout the user from the RhoConnect server. This removes the local user session.</p>


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
<p>The RhoConnectClient system uses notifications to provide information about the sync process to a Rhodes application. Notifications can be setup once for the duration of runtime or each time a sync is triggered. Once a sync is processing for a model, notifications are called with parameters containing sync process state. Your application can use this information to display different wait pages, progress bars, etc. setNotification will set notification for a model.</p>


####Parameters
<ul><li>sourceName : <span class='text-info'>STRING</span><p>
<p>Source name for which notification will be enabled. Use &lsquo;*&rsquo; to set notification for all models.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

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
<p>The RhoConnectClient can send a notification when a specific object on the current page has been modified. This is useful if you have frequently-changing data like feeds or timelines in your application and want them to update without the user taking any action.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>OBJECT</span></p><ul><ul><li>created : <span class='text-info'>ARRAY</span><p>
<p>Array of created objects.</p>
 </p></li><li>updated : <span class='text-info'>ARRAY</span><p>
<p>Array of updated objects.</p>
 </p></li><li>deleted : <span class='text-info'>ARRAY</span><p>
<p>Array of deleted objects.</p>
 </p></li></ul></ul>

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
<p>Stops any sync operations currently in progress.</p>


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

<p>Page size for RhoConnectClient. Default size is 2000.</p>

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

<p>Sync poll interval in seconds. Setting this to 0 will disable polling-based sync. Sync process will be triggered automatically according to this setting.</p>

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

<p>Enable or disable show status popup.</p>

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

<p>Enable or disable verification of RhoConnect ssl certificates, true by default.</p>

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

<p>Sync server URL.</p>

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

<p>Current username of the RhoConnectClient session if isLoggedIn is true, otherwise returns the last logged in username.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.RhoConnectClient.userName</code>



####Platforms

* Android
* Windows Mobile/CE

##Remarks



###Notification Callback Parameters
<p>When the notification is called, it will receive a variable called @params, just like a normal Rhodes controller action.</p>

<h2>Common Parameters</h2>

<p>These parameters are included in all notifications.</p>

<ul>
<li>source_id &ndash; The id of the current model that is synchronizing.</li>
<li>source_name &ndash; Name of the model (i.e. &ldquo;Product&rdquo;)</li>
<li>sync_type &ndash; Type of sync used for this model: &ldquo;incremental&rdquo; or &ldquo;bulk&rdquo;</li>
<li>status &ndash; Status of the current sync process. See below for the possible values:</li>
</ul>


<p>In the following sections we cover the different status values and parameters available with each status.</p>

<h3>status: &ldquo;in_progress&rdquo; &ndash; incremental sync progress</h3>

<ul>
<li>total_count &ndash; Total number of records that exist for this RhoConnect source.</li>
<li>processed_count &ndash; Number of records included in the sync page.</li>
<li>cumulative_count &ndash; Number of records the SyncEngine has processed so far for this source.</li>
</ul>


<h3>status: &ldquo;in_progress&rdquo; &ndash; bulk sync progress</h3>

<ul>
<li><p>bulk_status &ndash; The state of the bulk sync process:</p>

<ul>
<li>start &ndash; Bulk sync has started for a specific partition</li>
<li>download &ndash; Bulk sync file download has started</li>
<li>change_db &ndash; New bulk sync database change has started</li>
<li>blobs &ndash; Bulk sync blob files have started to download</li>
<li>ok &ndash; Current partition has completed</li>
<li>complete &ndash; All partitions have completed</li>
</ul>
</li>
<li><p>partition &ndash; Current bulk sync partition.</p></li>
</ul>


<h3>status: &ldquo;error&rdquo;</h3>

<ul>
<li>error_code &ndash; HTTP response code of the RhoConnect server error: 401, 500, 404, etc.</li>
<li>error_message &ndash; Response body (if any)</li>
<li>server_errors &ndash; Hash of Type objects of RhoConnect adapter error (if exists):

<ul>
<li>login-error &ndash; An error in adapter login method</li>
<li>query-error &ndash; An error in adapter query method</li>
<li>create-error &ndash; An error in adapter create method</li>
<li>update-error &ndash; An error in adapter update method</li>
<li>delete-error &ndash; An error in adapter delete method</li>
<li>logoff-error &ndash; An error in adapter logoff method</li>
</ul>
</li>
</ul>


<p>Each error contains a &lsquo;message&rsquo; key with the error message.</p>

<p>Ruby Example:</p>

<pre><code>:::ruby
@params["server_errors"]["query-error"]["message"] 
#=&gt; "Error connecting to backend server: http://rhostore.herokuapp.com"
</code></pre>

<p>JavaScript Example:</p>

<pre><code>:::javascript
params.server_errors["query-error"].message
//=&gt; "Error connecting to backend server: http://rhostore.herokuapp.com"
</code></pre>

<h4>Handling &lsquo;create-error&rsquo;</h4>

<p>&ldquo;create-error&rdquo; is a unique situation that needs to be handled in your sync callback. See <code>RhoConnectClient.onSyncCreateError()</code> for more details.</p>

<h3>status: &ldquo;complete&rdquo;</h3>

<p>This status returns only when the sync run is complete (all partitions are done synchronizing).</p>

<h3>status: &ldquo;schema-changed&rdquo;</h3>

<p>This is present if a FixedSchema model has changed during the current sync run. A new bulk sync run should be triggered (by setting bulksyncState) and the user should be alerted in the UI.</p>


###Backround Sync on iOS
<p>On iOS, if the application is backgrounded, it will be suspended. This also means if a current sync is in progress, it will immediately terminate. To prevent this behavior, set &lsquo;finish_sync_in_background&rsquo; to &lsquo;1&rsquo; in rhoconfig.txt. When set to &lsquo;1&rsquo;, the RhoConnectClient will attempt to finish synchronization before the application fully suspends.</p>
