# RhoConnect.js API Reference

RhoConnect.js API is implemented as public fields of a global *RhoConnect* object. Those are methods and *ERRORS* hash.

If you have properties in the class, list and define them here.

## login

Returns a jQuery promise object.

Authenticates the RhoConnect application on the server. On success, the done handler is called. On failure, the fail handler is called with the following arguments:

 * `errCode` - The error code value from RhoConnect.ERRORS.
 * `errorMessage` - More detailed error message if available.

The syntax and parameters are as follows.

	:::ruby
	RhoConnect.login(username, password, doDataReset)

<table border="1">
	<tr>
		<td><code>username</code></td>
		<td>The user name to authenticate with.</td>
	</tr>
	<tr>
		<td><code>password</code></td>
		<td>The password to authenticate with.</td>
	</tr>
	<tr>
		<td><code>doDataReset</code></td>
		<td>(optional) Boolean. If true, do a database reset before login. Default value is false.</td>
	</tr>
</table>

### Example

	function loginRhoConnect(username, password) {
		persistence.store.rhoconnect.config(persistence);
        return $.Deferred(function(dfr){
            // login with username, password, and a DB reset
            RhoConnect.login(username, password,
                    new RhoConnect.SyncNotification(), true /*do db init*/).done(function(){
                // Init DB for the user on success
                initRhoconnect(username, false).done(function(){
                    dfr.resolve();
                }).fail(function(errCode, err){
                    alert('DB init error: ' +errCode);
                    dfr.reject(errCode, err);
                });
            }).fail(function(errCode, err){
                //alert('RhoConnect login error: ' +errCode);
                dfr.reject(errCode, err);
            });
        }).promise();
    }

## init

Performs rhoconnect.js and data API initialization.

Returns a jQuery promise object. On success, the done handler is called. On failure, the fail handler is called with the following arguments:

 * `errCode` - The error code value from RhoConnect.ERRORS.
 * `errorMessage` - More detailed error message if available.

The syntax and parameters are as follows.

	:::ruby
	RhoConnect.init(modelDefinitions, dataApiType, syncProgressCallback)

<table border="2">
	<tr>
		<td><code>modelDefinitions</code></td>
		<td>Model definitions array. See Getting Started for a sample.</td>
	</tr>
	<tr>
		<td><code>dataApiType</code></td>
		<td>(optional) - A string value: 'extjs', 'persistencejs', or 'custom' or null.<br /><br />
		'extjs' - Do initialize ExtJS/SenchaTouch data API to use as application data storage.<br />
        'persistencejs' - Do initialize Persistence.js data API to use as application data storage.<br />
        'custom' or null - Don't initialize any data API, perform data API initialization in custom code.
		</td>
	</tr>
	<tr>
		<td><code>syncProgressCallback</code></td>
		<td>(optional) Progress update callback function to use. Receives the argument notificationBody, which is a hash with the following fields.
		<table border="1">
			<tr>
				<td><code>sourceName</code></td>
				<td>The name of model just synchronized.</td>
			</tr>
	        	<td><code>totalCount</code></td>
	        	<td>The total *objects* count for the *model*.</td>
	        <tr>
	        	<td><code>processedCount</code></td>
	        	<td>The number of *objects* that have been processed so far for a *model* may be *0* if all objects have already been processed.</td>
	        </tr>
	        <tr>
	        	<td><code>status</code></td>
	        	<td>Is undefined while *inProgress* value is *true*. When finished it is a string value:<br />
	         	"ok" - Synchronization of exact model has been performed without errors.<br />
	        	"error" - Errors happened during synchronization process.
	        	</td>
	        </tr>
		    <tr>
		        <td><code>errorCode</code></td>
		        <td>Code of synchronization error. Is undefined if no errors happened. Look at RhoConnect.ERRORS description for details.</td>
		    </tr>
		    <tr>
		        <td><code>errorMessage</code></td>
		        <td>Synchronization error message. Is undefined if no errors happened.</td>
		    </tr>
	    </table>
		</td>
	</tr>
</table>

### Example

	// RhoConnect.js initialization
	function initRhoconnect(username, doReset) {
	    return RhoConnect.init(modelDefinitions, 'persistencejs', doReset);
	}

modelDefinitions is a hash, such as:

	var modelDefinitions = [
			{
	            name: 'User',
	            fields: [
					{name: 'username',    	type: 'string'},
	                {name: 'email',			type: 'string'},
	                {name: 'first_name',	type: 'string'},
	                {name: 'last_name',   	type: 'string'},
	                {name: 'title',   		type: 'string'},
	                {name: 'company', 		type: 'string'},
					{name: 'created_at',   	type: 'string'},
					{name: 'updated_at',   	type: 'string'}
	            ]
		   },
	//...

## logout

Disconnects the RhoConnect application from the server.

Returns a jQuery promise object. On success, the done handler is called. On failure, the fail handler is called with the following arguments:

 * `errCode` - The error code value from RhoConnect.ERRORS.
 * `errorMessage` - More detailed error message if available.

The syntax is as follows.

	:::ruby
	RhoConnect.logout()

## isLoggedIn

Returns true if the application is logged in on the server.

	:::ruby
	RhoConnect.isLoggedIn()

## syncAllSources

Synchronizes that application data with the RhoConnect server.

Returns a jQuery promise object. On success, the done handler is called. On failure, the fail handler is called with the following arguments:

 * `errCode` - The error code value from RhoConnect.ERRORS.
 * `errorMessage` - More detailed error message if available.

The syntax is as follows.

	:::ruby
	RhoConnect.syncAllSources()

### Example

	function sync(){
	    RhoConnect.syncAllSources().done(function(){
	        alert('sync successful');
	    }).fail(function(errCode, err){
	        alert('Data sync error: ' +errCode);
	    });
	}

## dataAccessObjects

Returns the hash of data access objects which are data API specific. The returned hash contains:

 * `key` - model name.
 * `value` - An instance of one of the following objects.
  - [Ext.data.Store](http://dev.sencha.com/deploy/touch/docs/) - for 'extjs' type of data API
  - [model](http://persistencejs.org/objects) - for 'persistencejs' type of data API

The syntax is as follows.

	:::ruby
	RhoConnect.dataAccessObjects()

### Example

	function pull_data(model) {
		// passed a model name, returns hash of data access objects.
	    var store = RhoConnect.dataAccessObjects()[model];

	    current_model = model;
	    persistence.loadFromRhoConnect(function() {
	        storeLoaded();
	    });

## setModelNotification

Set the handler for the exact model synchronization notification.

	:::ruby
	RhoConnect.setModelNotification(modelName, callback, removeAfterFire)

<table border="2">
	<tr>
		<td><code>modelName</code></td>
		<td>Name of the model to listen for notifications.</td>
	</tr>
	<tr>
		<td><code>callback</code></td>
		<td>Handler function. Receives the only argument of notificationBody, which is a hash with the following fields.
		<table border="1">
			<tr>
				<td><code>sourceName</code></td>
				<td>The name of the model just synchronized.</td>
			</tr>
	        <tr>
	        	<td><code>totalCount</code></td>
	        	<td>The total number of objects for the model.</td>
	        </tr>
	        <tr>
	        	<td><code>processedCount</code></td>
	        	<td>The number of objects that have been processed so far for a model. 0 if all the objects have already been processed.</td>
	        </tr>
	        <tr>
	        	<td><code>status</code></td>
	        	<td>Is undefined while inProgress is True. When finished, it is a string value.<br />
	        	"ok" if the synchronization of the exact model has been performed without errors.<br />
	        	"error" if errors happened during the synchronization process.</td>
	        </tr>
	        <tr>
	        	<td><code>errorCode</code></td>
	        	<td>Code of synchronization error. Undefined if no errors happened. Look at the RhoConnect.ERRORS description for details.</td>
	        <tr>
	        	<td><code>errorMessage</code></td>
	        	<td>Synchronization error message. Undefined if no errors happened.</td>
	        </tr>
	    </table>
	    </td>
	</tr>
	<tr>
		<td><code>removeAfterFire</code></td>
		<td>Clear notification subscription after notification event if true. The same if handler function returns true.</td>
	</tr>
</table>

## clearModelNotification

Resets the handler for the model synchronization notification.

	:::ruby
	RhoConnect.clearModelNotification(modelName)

<table border="1">
	<tr>
		<td><code>modelName</code></td>
		<td>Name of the model to reset the handler.</td>
	</tr>
</table>

## setAllNotification

Sets the handler for all models synchronization notifications.

	:::ruby
	RhoConnect.setAllNotification(callback, removeAfterFire)

<table border="2">
	<tr>
		<td><code>callback</code></td>
		<td>Handler function. Receives the only argument of notificationBody, which is a hash with the following fields.
		<table border="1">
			 <tr>
			 	<td><code>inProgress</code></td>
			 	<td>Boolean value. True if synchronization is still in progress, undefined if synchronization is finished.</td>
			 </tr>
 				<td><code>status</code></td>
 				<td>Undefined while the inProgress value is true. When synchronization is finished, it is a string value.<br />
 				"complete" - Synchronization of all models have been performed without errors.<br />
				"error" - Errors happened during synchronization process.
				</td>
			<tr>
				<td><code>errorCode</code></td>
				<td>Code of the synchronization error. Undefined if no errors happened. Look at RhoConnect.ERRORS description for details.</td>
			</tr>
			<tr>
				<td><code>errorMessage</code></td>
				<td>Synchronization error message. Undefined if no errors happened.</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td><code>removeAfterFire</code></td>
		<td>Clear notification subscription after notification event if true. The same if handler function returns true.</td>
	</tr>
</table>

## clearAllNotification

Reset handler for all models synchronization notifications.

	:::ruby
	RhoConnect.clearAllNotification()

## setObjectsNotification

Set handler for all object change notifications.

	:::ruby
	RhoConnect.setObjectsNotification(callback, removeAfterFire)

<table border="1">
	<tr>
		<td><code>callback</code></td>
		<td>Handler function. Receives the only argument of notificationBody, which is a hash with fields.
		
		
		<table border="1">
			 <tr>
			 	<td><code>updated</code></td>
			 	<td>Array of hashes for updated objects. Every hash object has form of {objectId: objId, sourceId: srcId}, where:<br />
				<code>objectId</code> - The id of the updated object.<br />
				<code>modelName</code> - The name of the object model.
				</td>
			 </tr>
			 <tr>
			 	<td><code>created</code></td>
			 	<td>Array of hashes for created objects. Every hash object has form of {objectId: objId, sourceId: srcId}, where:<br />
				<code>objectId</code> - The id of the updated object.<br />
				<code>modelName</code> - The name of the object model.
				</td>
			 </tr>
			 <tr>
			 	<td><code>deleted</code></td>
			 	<td>Array of hashes for deleted objects. Every hash object has form of {objectId: objId, sourceId: srcId}, where:<br />
				<code>objectId</code> - The id of the updated object.<br />
				<code>modelName</code> - The name of the object model.
				</td>
			 </tr>
		</table>
		</td>
	</tr>
	<tr>
		<td><code>removeAfterFire</code></td>
		<td>Clear notification subscription after notification event if true. The same if handler function returns true.</td>
	</tr>
</table>

## clearObjectsNotification

Reset the handler for all object change notifications.

	:::ruby
	RhoConnect.clearObjectsNotification()

## addObjectNotify

Subscribe an object for changes notification.

	:::ruby
	RhoConnect.addObjectNotify(modelName, objectId)

<table border="1">
	<tr>
		<td><code>modelName</code></td>
		<td>The name of the object model.</td>
	</tr>
	<tr>
		<td><code>objectId</code></td>
		<td>The id of the object.</td>
	</tr>
</table>

## clearObjectsNotify

Unsubscribe all objects from changes notification.

	:::ruby
	RhoConnect.clearObjectsNotify()

## RhoConnect.ERRORS

RhoConnect.ERRORS are defined as:

 * ERR\_NONE: 'No error'
 * ERR\_NETWORK: 'Network error'
 * ERR\_REMOTESERVER: 'Remote server access error'
 * ERR\_RUNTIME: 'Runtime error'
 * ERR\_UNEXPECTEDSERVERRESPONSE: 'Unexpected server response'
 * ERR\_DIFFDOMAINSINSYNCSRC: 'Different synchronization domain error'
 * ERR\_NOSERVERRESPONSE: 'No server response'
 * ERR\_CLIENTISNOTLOGGEDIN: 'Client not logged in'
 * ERR\_CUSTOMSYNCSERVER: 'Custom sync server'
 * ERR\_UNATHORIZED: 'Unauthorized access'
 * ERR\_CANCELBYUSER: 'Canceled by user'
 * ERR\_SYNCVERSION: 'Synchronization version error'
 * ERR\_GEOLOCATION: 'Geolocation error'
