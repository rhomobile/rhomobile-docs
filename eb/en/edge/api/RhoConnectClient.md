#RhoConnectClient


## Overview
<p>RhoConnectClient is used for synchronization with RhoConnect applications.</p>

<h2>Enabling the API</h2>

<p>In order to use this API you must include the following extension in your <code>build.yml</code></p>

<pre><code>:::ruby
extensions: ["rhoconnect-client"]
</code></pre>

<h2>JavaScript Usage</h2>

<p>Be sure to review the <a href="/guide/api_js">JavaScript API Usage</a> guide for important information about using this API in JavaScript</p>

<h2>Ruby Usage</h2>

<p>Be sure to review the <a href="/guide/api_ruby">Ruby API Usage</a> guide for important information about using this API in Ruby</p>



##Methods



### addObjectNotify(<span class="text-info">STRING</span> sourceName, <span class="text-info">STRING</span> object)Add the object notification by passing in an object ID.

####Parameters
<ul><li>sourceName : <span class='text-info'>STRING</span><p>Source name for object notification. </p></li><li>object : <span class='text-info'>STRING</span><p>Object ID to get notifications. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded
* Windows Phone 8
* Windows Desktop

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.RhoConnectClient.addObjectNotify(<span class="text-info">STRING</span> sourceName, <span class="text-info">STRING</span> object)</code> </li></ul></li></ul>

### cleanObjectNotify()Removes callback for object notifications.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded
* Windows Phone 8
* Windows Desktop

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.RhoConnectClient.cleanObjectNotify()</code> </li></ul></li></ul>

### clearNotification(<span class="text-info">STRING</span> sourceName)Clears the sync notification for a given source.

####Parameters
<ul><li>sourceName : <span class='text-info'>STRING</span><p>Source name to clear notification. Use '*' to clear notification for all models. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded
* Windows Phone 8
* Windows Desktop

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.RhoConnectClient.clearNotification(<span class="text-info">STRING</span> sourceName)</code> </li></ul></li></ul>

### doSync(<span class="text-info">BOOLEAN</span> showStatusPopup, <span class="text-info">STRING</span> queryParams, <span class="text-info">BOOLEAN</span> syncOnlyChangedSources)Start the RhoConnectClient sync process.

####Parameters
<ul><li>showStatusPopup : <span class='text-info'>BOOLEAN</span> <span class='label label-info'>Optional</span><p>Set to true to show status popup. </p></li><li>queryParams : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>Parameters to be passed to server. </p></li><li>syncOnlyChangedSources : <span class='text-info'>BOOLEAN</span> <span class='label label-info'>Optional</span><p>Sync only sources that have local changes. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>STRING</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded
* Windows Phone 8
* Windows Desktop

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.RhoConnectClient.doSync(<span class="text-info">BOOLEAN</span> showStatusPopup, <span class="text-info">STRING</span> queryParams, <span class="text-info">BOOLEAN</span> syncOnlyChangedSources)</code> </li></ul></li></ul>

### doSyncSource(<span class="text-info">STRING</span> sourceName, <span class="text-info">BOOLEAN</span> showStatusPopup, <span class="text-info">STRING</span> queryParams)Start RhoConnectClient sync process for a given source name.

####Parameters
<ul><li>sourceName : <span class='text-info'>STRING</span><p>Source name. </p></li><li>showStatusPopup : <span class='text-info'>BOOLEAN</span> <span class='label label-info'>Optional</span><p>Set to true to show status popup. </p></li><li>queryParams : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>Parameters to be passed to server. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>STRING</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded
* Windows Phone 8
* Windows Desktop

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.RhoConnectClient.doSyncSource(<span class="text-info">STRING</span> sourceName, <span class="text-info">BOOLEAN</span> showStatusPopup, <span class="text-info">STRING</span> queryParams)</code> </li></ul></li></ul>

### isLoggedIn()Returns true if the RhoConnectClient currently has a user session, false if not.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>BOOLEAN : True if have logged in user session, false if not.</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded
* Windows Phone 8
* Windows Desktop

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.RhoConnectClient.isLoggedIn()</code> </li></ul></li></ul>

### isSyncing()Returns true if sync is currently in progress.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>BOOLEAN : True if sync has started but not finished yet, false otherwise.</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded
* Windows Phone 8
* Windows Desktop

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.RhoConnectClient.isSyncing()</code> </li></ul></li></ul>

### login(<span class="text-info">STRING</span> login, <span class="text-info">STRING</span> password)Authenticates the user with RhoConnect. The callback will be executed when it is finished.

####Parameters
<ul><li>login : <span class='text-info'>STRING</span><p>Login name. </p></li><li>password : <span class='text-info'>STRING</span><p>Password. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>INTEGER</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded
* Windows Phone 8
* Windows Desktop

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.RhoConnectClient.login(<span class="text-info">STRING</span> login, <span class="text-info">STRING</span> password)</code> </li></ul></li></ul>

### logout()Logout the user from the RhoConnect server. This removes the local user session.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded
* Windows Phone 8
* Windows Desktop

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.RhoConnectClient.logout()</code> </li></ul></li></ul>

### search(<span class="text-info">HASH</span> args)If you have a large dataset in your backend service, you don't have to synchronize everything with the RhoConnectClient. Instead you can filter the synchronized dataset using the RhoConnectClient's search function. Provide callback, which will be executed after search is completed.

####Parameters
<ul><li>args : <span class='text-info'>HASH</span><p>Hash of arguments passed to search. </p></li><ul><li>sourceNames : <span class='text-info'>ARRAY</span><p>Array of source names to be included in search result. </p></li><li>from : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>Default is 'search' </p></li><li>searchParams : <span class='text-info'>HASH</span><p>Hash of key-value pairs to be included in search result. </p></li><li>offset : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><p> </p></li><li>maxResults : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><p>Maximum number of results to be returned. </p></li><li>progressStep : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><p> </p></li><li>syncChanges : <span class='text-info'>BOOLEAN</span> <span class='label label-info'>Optional</span><p>If true and there are local changes, client sync will be triggered before search. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>OBJECT</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>Resulting status of search. 'ok' of completed successfully, 'error' otherwise. </p></li><li>search_params : <span class='text-info'>HASH</span><p>Search_params originally provided for the search call. Typically you want to forward the original search_params to your view that displays the results so you can perform the same query locally. Please see examples section. </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>HASH : Will return value only if threadedMode set to false. Otherwise search results returned in callback.</li></ul>

####Platforms

* Ruby
* Android
* iOS
* Windows Embedded
* Windows Phone 8
* Windows Desktop

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul></ul></li></ul>

### setNotification(<span class="text-info">STRING</span> sourceName)The RhoConnectClient system uses notifications to provide information about the sync process to a Rhodes application. Notifications can be setup once for the duration of runtime or each time a sync is triggered. Once a sync is processing for a model, notifications are called with parameters containing sync process state. Your application can use this information to display different wait pages, progress bars, etc. setNotification will set notification for a model.

####Parameters
<ul><li>sourceName : <span class='text-info'>STRING</span><p>Source name for which notification will be enabled. Use '*' to set notification for all models. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded
* Windows Phone 8
* Windows Desktop

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.RhoConnectClient.setNotification(<span class="text-info">STRING</span> sourceName)</code> </li></ul></li></ul>

### setObjectNotification()The RhoConnectClient can send a notification when a specific object on the current page has been modified. This is useful if you have frequently-changing data like feeds or timelines in your application and want them to update without the user taking any action.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>OBJECT</span></p><ul><ul><li>created : <span class='text-info'>ARRAY</span><p>Array of created objects. </p></li><li>updated : <span class='text-info'>ARRAY</span><p>Array of updated objects. </p></li><li>deleted : <span class='text-info'>ARRAY</span><p>Array of deleted objects. </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded
* Windows Phone 8
* Windows Desktop

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.RhoConnectClient.setObjectNotification()</code> </li></ul></li></ul>

### stopSync()Stops any sync operations currently in progress.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded
* Windows Phone 8
* Windows Desktop

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.RhoConnectClient.stopSync()</code> </li></ul></li></ul>

##Properties



###bulksyncState

####Type
<span class='text-info'>INTEGER</span> 
####Description
Set 0 to force bulk sync on next synchronization cycle. After sync is complete, bulksyncState will be set to 1.
####Params
<p><strong>Default:</strong> 1</p>
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul></ul></li></ul>

###pageSize

####Type
<span class='text-info'>INTEGER</span> 
####Description
Page size for RhoConnectClient. Default size is 2000.
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>Rho.RhoConnectClient.pageSize</code> </li></ul></li></ul>

###pollInterval

####Type
<span class='text-info'>INTEGER</span> 
####Description
Sync poll interval in seconds. Setting this to 0 will disable polling-based sync. Sync process will be triggered automatically according to this setting.
####Params
<p><strong>Default:</strong> 60</p>
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>Rho.RhoConnectClient.pollInterval</code> </li></ul></li></ul>

###showStatusPopup

####Type
<span class='text-info'>BOOLEAN</span> 
####Description
Enable or disable show status popup.
####Params
<p><strong>Default:</strong> true</p>
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>Rho.RhoConnectClient.showStatusPopup</code> </li></ul></li></ul>

###sslVerifyPeer

####Type
<span class='text-info'>BOOLEAN</span> 
####Description
Enable or disable verification of RhoConnect ssl certificates, true by default.
####Params
<p><strong>Default:</strong> true</p>
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>Rho.RhoConnectClient.sslVerifyPeer</code> </li></ul></li></ul>

###syncServer

####Type
<span class='text-info'>STRING</span> 
####Description
Sync server URL.
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>Rho.RhoConnectClient.syncServer</code> </li></ul></li></ul>

###userName

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description
Current username of the RhoConnectClient session if isLoggedIn is true, otherwise returns the last logged in username.
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>Rho.RhoConnectClient.userName</code> </li></ul></li></ul>