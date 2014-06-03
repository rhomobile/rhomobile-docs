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



### addObjectNotify()
Add the object notification by passing in an object ID.

### cleanObjectNotify()
Removes callback for object notifications.

### clearNotification()
Clears the sync notification for a given source.

### doSync()
Start the RhoConnectClient sync process.

### doSyncSource()
Start RhoConnectClient sync process for a given source name.

### isLoggedIn()
Returns true if the RhoConnectClient currently has a user session, false if not.

### isSyncing()
Returns true if sync is currently in progress.

### login()
Authenticates the user with RhoConnect. The callback will be executed when it is finished.

### logout()
Logout the user from the RhoConnect server. This removes the local user session.

### search()
If you have a large dataset in your backend service, you don't have to synchronize everything with the RhoConnectClient. Instead you can filter the synchronized dataset using the RhoConnectClient's search function. Provide callback, which will be executed after search is completed.

### setNotification()
The RhoConnectClient system uses notifications to provide information about the sync process to a Rhodes application. Notifications can be setup once for the duration of runtime or each time a sync is triggered. Once a sync is processing for a model, notifications are called with parameters containing sync process state. Your application can use this information to display different wait pages, progress bars, etc. setNotification will set notification for a model.

### setObjectNotification()
The RhoConnectClient can send a notification when a specific object on the current page has been modified. This is useful if you have frequently-changing data like feeds or timelines in your application and want them to update without the user taking any action.

### stopSync()
Stops any sync operations currently in progress.