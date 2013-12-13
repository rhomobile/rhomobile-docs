Using RhoConnect without Rhodes: Objective C Client API
===

The RhoConnect Client is a library that adds sync data capability to your non-Rhodes applications, such as applications created in XCode or Android Java. Using this library, you can enable synchronized data between your Objective C iOS device application and a RhoConnect server.

Source Code
-----------
The source code for the RhoConnect client store example is located here.

 * [rhoconnect-client\Samples\ObjectiveC\store](http://github.com/rhomobile/rhoconnect-client/tree/master/rhoconnect-client/Samples/ObjectiveC/store/)

Pre-requisite Reading
---------------------
 * [iOS development](http://developer.apple.com/devcenter/ios/index.action)

## Features supported

<table>
<tr><th>Feature</th><th>&nbsp;Ruby&nbsp;</th><th>ObjectiveC</th></tr>
<tr><td>Property bag model</td><td>yes</td><td>yes</td></tr>
<tr><td>Fixed schema mode</td><td>yes</td><td>yes</td></tr>
<tr><td>Model associations</td><td>yes</td><td>yes</td></tr>
<tr><td>BLOB attributes</td><td>yes</td><td>yes</td></tr>
<tr><td>Bulk sync</td><td>yes</td><td>yes</td></tr>
<tr><td>Sync</td><td>yes</td><td>yes</td></tr>
<tr><td>Notifications</td><td>yes</td><td>yes</td></tr>
<tr><td>Database reset</td><td>yes</td><td>yes</td></tr>
<tr><td>Authentication</td><td>yes</td><td>yes</td></tr>
<tr><td>DB partitioning</td><td>yes</td><td>not yet</td></tr>
</table>

## Setup

The RhoConnect Client is part of the Rhoconnect-client repository; it contains files that you will need to add to your Xcode project. You can get the client [on github](https://github.com/rhomobile/rhodes/downloads). (Select the latest 'rhoconnect-client' package).

Create a new Xcode project or open an existing one in Xcode.

### Adding RhoConnectClient to your Xcode Project

Do the following steps to add `<rhoconnect-client>/objectivec/RhoConnectClient.xcodeproj` as a dependency so that the RhoConnectClient library will link with your project.

1. Drag and drop `<rhoconnect-client>/ObjectiveC/RhoConnectClient.xcodeproj` from the Finder into Groups & Files for your Xcode project. RhoConnectClient.xcodeproj should now appear in Groups & Files.

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect-objc-client-tutorial/rhoconnectclient-groupfile.png" alt="RhoConnectClient in Groups & Files" /> 

2. Under Groups and Files, open the Targets icon.
3. Right-click on your project-named target.
4. Choose Get Info, then click on the General tab.
5. In Direct Dependencies, click the + button.
6. Choose the dependency from RhoConnectClient.xcodeproj.

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect-objc-client-tutorial/direct-dependency.png" alt="RhoConnectClient Direct Dependency" />

### Adding Xcode Libraries

Do the following steps to add libraries:

1. Under Groups & Files, right-click on your project (the name at the top of the list).
2. Select Add->Existing Frameworks from the popup menu.
3. Add the following to your project: `libstdc++6.dylib, libsqlite3.dylib, libz.dylib, CFNetwork.framework`.

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect-objc-client-tutorial/add-frameworks.png" alt="Add Frameworks" />

### Adding Schema Files

Do the following steps to add schema files to your Copy Bundle Resources build phase:
1. Copy the folder `<rhodes>/platform/shared/db/res/db` into your Xcode project folder.
2. Drag the copied db folder into your Xcode project, onto the project-named icon under Groups & Files. The db folder should now appear in the Groups & Files list.
3. Under Groups and Files, open the Targets icon, then open the project-named icon under Targets, then open the Copy Bundle Resources folder. You should see sync.schema listed there.
4. Open and edit the sync.schema file. Add a create table statement for every model you will use in your project. For example, for a model named product:

	:::term
	CREATE TABLE product (
	 "client_id" VARCHAR(255) default NULL);

** NOTE: Do not use NOT NULL statement in column definitions. RhoConnect client delete object attributes by setting value to null, when all object attributes become nulls, object deleted. So objects with NOT NULL columns will not be deleted. **

## Coding a RhoConnect Client

This section discusses the general steps you perform to code a RhoConnect client in Objective C, using the store example. It is not a tutorial for coding a complete Xcode application, but instead discusses the RhoConnect code that you need to create.

### Initialize the Database

Call the RhoConnectClient method initDatabase to initialize the local database for the models. You must do this before you initialize and use a RhoConnectClient object.

	:::cplusplus
	[RhoConnectClient initDatabase];

### Initialize the Client

Call the RhomModel init method for each model. In the Store example, initialize a customer model and a product model.

	:::cplusplus
	customer = [[RhomModel alloc] init];
	customer.name = @"Customer";
	product = [[RhomModel alloc] init];
	product.name = @"Product";

Call init for RhoConnectClient to initialize your client.

	:::cplusplus
	sclient = [[RhoConnectClient alloc] init];

Set up an NSMutableArray containing the models for your client.

	:::cplusplus
	NSMutableArray* models = [NSMutableArray arrayWithObjects:customer, product, nil];

Call the RhoConnectClient method addModels to add those models to your client.

	:::cplusplus
	[sclient addModels:models];

Set the RhoConnectClient property sync\_server to the URL of the RhoConnect server for your client.

	:::cplusplus
	sclient.sync_server = @"http://rhodes-store-server.heroku.com/application";

Here is the Store code for the initialization process, contained in RhoConnectEngine.m.

	:::cplusplus
	- (id)init
	{
	    if ( sharedInst != nil ) {
	        [NSException raise:NSInternalInconsistencyException
			format:@"[%@ %@] cannot be called; use +[%@ %@] instead",
			NSStringFromClass([self class]), NSStringFromSelector(_cmd), 
			NSStringFromClass([self class]),
			NSStringFromSelector(@selector(sharedInstance))];

		} else if ( self = [super init] ) {
			sharedInst = self;
		
		    	[RhoConnectClient initDatabase];		
			
			customer = [[RhomModel alloc] init];
			customer.name = @"Customer";
		
			product = [[RhomModel alloc] init];
			product.name = @"Product";
		
			sclient = [[RhoConnectClient alloc] init];
			NSArray* models = [NSArray arrayWithObjects:customer, product, nil];	
		
			[sclient addModels:models];
		
			sclient.sync_server = @"http://rhodes-store-server.heroku.com/application";
			sclient.threaded_mode = TRUE;
			sclient.log_severity = 1;

			loginState = [sclient is_logged_in] ? logged_in : logged_out;
		}
		return sharedInst;
	}

### Log Into the RhoConnect Server

Call the RhoConnectClient loginWithUser method to log into the RhoConnect server.

	:::cplusplus
	[ [RhoConnectEngine sharedInstance].syncClient loginWithUser:txtLogin.text pwd:txtPassword.text callback:@selector(loginComplete:) target:self];

Here is the Store code for the login process, contained in LoginViewController.m. It contains both a login method that calls loginWithUser, and a callback method called by loginWithUser, that checks to see if the login is active.

	:::cplusplus
	- (void)loginComplete:(RhoConnectNotify*) notify
	{
		if ( notify.error_code != RHO_ERR_NONE || ![[RhoConnectEngine sharedInstance].syncClient is_logged_in]) 
			[RhoConnectEngine sharedInstance].loginState = failed;	
		else
			[RhoConnectEngine sharedInstance].loginState = logged_in;	
	 
		[waitPage loginComplete: [notify error_message] ];	
	
		[notify release];
	}

	- (IBAction)doLogin:(id)sender 
	{
		[RhoConnectEngine sharedInstance].loginState = in_progress;	
		[[self navigationController] pushViewController:waitPage animated:YES];
	
		[ [RhoConnectEngine sharedInstance].syncClient loginWithUser:txtLogin.text pwd:txtPassword.text callback:@selector(loginComplete:) target:self];	
	}


### Synchronize Data

Call the RhoConnectClient setNotification method to call a callback method that notifies about the state of the synchronization.

	:::cplusplus
	[ [RhoConnectEngine sharedInstance].syncClient setNotification: @selector(syncAllComplete:) target:self];

To perform a bulk sync *bulksync_state* configuration flag should be reset to zero. If you don't need bulk sync then just skip it.

    :::cplusplus
    // set configuration for bulk sync, it means "next sync should be performed as bulk"
    [RhoConnectEngine sharedInstance].syncClient.bulksync_state = 0;
    // after sync performed the it should contain value 1.

Call a sync method, such as the RhoConnectClient syncAll method or the RhomModel sync method, to sync your client model data with the RhoConnect server.

	:::cplusplus
	[ [RhoConnectEngine sharedInstance].syncClient syncAll];

Call clearNotification upon completion of the sync.

	:::cplusplus
	[ [RhoConnectEngine sharedInstance].syncClient clearNotification];

Here is the Store code for the sync process, contained in WaitLoginController.m. It contains both a loginComplete method (called from the loginWithUser callback method) that calls setNotification and syncAll, and the setNotification callback method that calls clearNotification when the sync is complete.

	:::cplusplus
	- (void)syncAllComplete:(RhoConnectNotify*) notify
	{
		if ( [notify.status compare:@"in_progress"] == 0)
		{
		}else if ([notify.status compare:@"complete"] == 0)
		{
			[[self navigationController] pushViewController:homePage animated:YES];
			[ [RhoConnectEngine sharedInstance].syncClient clearNotification];		
		}else if ([notify.status compare:@"error"] == 0)
		{
                if([notify.error_message caseInsensitiveCompare:@"unknown client"] == 0) {
	                [[RhoConnectEngine sharedInstance].syncClient database_client_reset]; 
	                [[RhoConnectEngine sharedInstance].syncClient setNotification: @selector(syncAllCalback:) target:self];
	                [[RhoConnectEngine sharedInstance].syncClient syncAll];
	            } else if( err_code == RHO_ERR_CLIENTISNOTLOGGEDIN
	                    || err_code == RHO_ERR_UNATHORIZED) {
    	
	                NSLog(@"GO TO LOGIN PAGE!");
	                // real code to trigger view transition goes here.. 
	            }else
	            {
                    //This is mandatory:
                    if([notify hasCreateErrors]) {
                        [[RhoConnectEngine sharedInstance].syncClient onCreateError: notify @"delete"];        
                    }
                    //These are optional:
                    /*
                    if([notify hasUpdateErrors]) {
                        [[RhoConnectEngine sharedInstance].syncClient onUpdateError: notify @"rollback"];        
                    }
                    if([notify hasDeleteErrors]) {
                        [[RhoConnectEngine sharedInstance].syncClient onDeleteError: notify @"retry"];        
                    }
                    */
	            }
		}
	}

	- (void)loginComplete:(NSString*) errorMessage 
	{
		NSLog(@"Login error message: \"%@\"", errorMessage);
		[indicator stopAnimating];
		if ([RhoConnectEngine sharedInstance].loginState == logged_in) 
		{
			[ [RhoConnectEngine sharedInstance].syncClient setNotification: @selector(syncAllComplete:) target:self];
			[ [RhoConnectEngine sharedInstance].syncClient syncAll];
		} else {
			lblMessage.text = errorMessage;
			self.navigationItem.hidesBackButton = false;
		}
	}

### Processing unknown-client error
Unknown client error return by server after resetting server database, removing particular client id from database or any other cases when server cannot find client id(sync server unique id of device).
Note that login session may still exist on server, so in this case client does not have to login again, just create new client id.
Processing of this error contain 2 steps:

* When unknown client error is come from server, client should call database_client_reset and start new sync, to register new client id.

* If login session also deleted or expired on the server, then customer has to login again.

Example:
	:::cplusplus
	
    - (void)syncAllComplete:(RhoConnectNotify*) notify
    {
        NSString* status = notify.status;
        NSString* error = notify.error_message;
        int err_code = notify.error_code;
        
        NSLog(@"syncAll DONE, status: '%s' , error_msg: '%s' , error_code: %d",
              [status cStringUsingEncoding: NSUTF8StringEncoding],
              [error cStringUsingEncoding: NSUTF8StringEncoding],
              err_code
              );
        
	    if ( [notify.status compare:@"in_progress"] == 0) {
            
	    } else if ([notify.status compare:@"complete"] == 0) {
            
		    [[RhoConnectEngine sharedInstance].syncClient clearNotification];
            
	    } else if ([notify.status compare:@"error"] == 0) {
            
	            if([notify.error_message caseInsensitiveCompare:@"unknown client"] == 0) {
	                [[RhoConnectEngine sharedInstance].syncClient database_client_reset]; 
	                [[RhoConnectEngine sharedInstance].syncClient setNotification: @selector(syncAllCalback:) target:self];
	                [[RhoConnectEngine sharedInstance].syncClient syncAll];
	            } else if( err_code == RHO_ERR_CLIENTISNOTLOGGEDIN
	                    || err_code == RHO_ERR_UNATHORIZED) {
    	
	                NSLog(@"GO TO LOGIN PAGE!");
	                // real code to trigger view transition goes here.. 
	            }
	    }
    }

### Processing server errors
* create-error: 
has to be handled in sync callback. Otherwise sync will stop on this model. To fix create errors you should call Model.on_sync_create_error or SyncEngine.on_sync_create_error:

* update-error:
If not handled, local modifications, which were failing on server, will never sync to server again.
So sync will work fine, but nobody will know about these changes.

* delete-error:
If not handled, local modifications, which were failing on server, will never sync to server again.
So sync will work fine, but nobody will know about these changes.

Example:
	:::cplusplus
	
    - (void)syncAllCalback:(RhoConnectNotify*) notify
    {
        NSString* status = notify.status;
        NSString* error = notify.error_message;
        int err_code = notify.error_code;
        
        NSLog(@"syncAll DONE, status: '%s' , error_msg: '%s' , error_code: %d",
              [status cStringUsingEncoding: NSUTF8StringEncoding],
              [error cStringUsingEncoding: NSUTF8StringEncoding],
              err_code
              );
        
	    if ( [notify.status compare:@"in_progress"] == 0) {
            
	    } else if ([notify.status compare:@"complete"] == 0) {
            
		    [[RhoConnectEngine sharedInstance].syncClient clearNotification];
            
	    } else if ([notify.status compare:@"error"] == 0) {
            
            if([notify isUnknownClientError]) {
                [[RhoConnectEngine sharedInstance].syncClient database_client_reset]; 
                [[RhoConnectEngine sharedInstance].syncClient setNotification: @selector(syncAllCalback:) target:self];
                [[RhoConnectEngine sharedInstance].syncClient syncAll];
            } else if( err_code == RHO_ERR_CLIENTISNOTLOGGEDIN
                || err_code == RHO_ERR_UNATHORIZED) {

                NSLog(@"GO TO LOGIN PAGE!");
                // real code to trigger view transition goes here.. 
            }else
            {
                //This is mandatory:
                if([notify hasCreateErrors]) {
                    [[RhoConnectEngine sharedInstance].syncClient onCreateError: notify action:@"delete"];        
                }
                //These are optional:
                /*
                if([notify hasUpdateErrors]) {
                    [[RhoConnectEngine sharedInstance].syncClient onUpdateError: notify action:@"rollback"];        
                }
                if([notify hasDeleteErrors]) {
                    [[RhoConnectEngine sharedInstance].syncClient onDeleteError: notify action:@"retry"];        
                }
                */
            }
	    }
    }
    
### Search the Client Database for Models

Call a RhomModel find method (find, find\_first, find\_all) to find model objects in the client database. This code sample for the find\_all method fetches all the models in the database; you can also search for models containing certain attribute data.

	:::cplusplus
	NSMutableArray* arItems = [[RhoConnectEngine sharedInstance].product find_all:nil];
	NSDictionary* item = [arItems objectAtIndex: 0 ];
	textBrand = [item valueForKey:@"brand"];

Here is the Store code for the find process, contained in RootViewController.m. It contains a call to the find\_all method, and returns the total count of the models in the database.

	:::cplusplus
	// Customize the number of rows in the table view.
	- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
	{
		if (!arItems)
			arItems = [[RhoConnectEngine sharedInstance].product find_all:nil];
	
		//warning here because this may be dictionary or an array when called.
	    return (NSUInteger)[arItems count];
	}

## RhoConnectClient Class API

The RhoConnectClient class contains the following properties and methods to build an Objective C RhoConnect client and connect it with a RhoConnect server.

 * <a href="#threaded_mode">threaded_mode property</a>
 * <a href="#poll_interval">poll_interval property</a>
 * <a href="#log_severity">log_severity property</a>
 * <a href="#sync_server">sync_server property</a>
 * <a href="#initDatabase">initDatabase</a>
 * <a href="#addModels">addModels</a>
 * <a href="#database_full_reset_and_logout">database\_full\_reset\_and\_logout</a>
 * <a href="#database_client_reset">database\_client\_reset</a>
 * <a href="#initDatabase">initDatabase</a>
 * <a href="#loginWithUser">loginWithUser</a>
 * <a href="#loginWithUser (with callback)">loginWithUser (with callback)</a>
 * <a href="#setNotification">setNotification</a>
 * <a href="#clearNotification">clearNotification</a>
 * <a href="#is_logged_in">is\_logged\_in</a>
 * <a href="#syncAll">syncAll</a>
 * <a href="#is_syncing">is_syncing</a> 
 * <a href="#stop_sync">stop_sync</a> 
 * <a href="#search">search</a>
 * <a href="#setObjectNotification">setObjectNotification</a>
 * <a href="#clearObjectNotification">clearObjectNotification</a>
 * <a href="#addObjectNotify">addObjectNotify</a>
 * <a href="#onCreateError">onCreateError</a>
 * <a href="#onUpdateError">onUpdateError</a>
 * <a href="#onDeleteError">onDeleteError</a>

### <a id="threaded_mode"></a>threaded\_mode property

BOOL. Set to false to get the result of operations as a return value. (Set to true to get notifications - not supported yet.) Default = false.

	:::cplusplus
	@property(setter=setThreadedMode) BOOL threaded_mode;

### <a id="poll_interval"></a>poll\_interval property

int. Not yet supported. Default = 0.

	:::cplusplus
	@property(setter=setPollInterval) int poll_interval;

### <a id="log_severity"></a>log\_severity property

int. Set minimal severity level for messages to log output. Default = 0.

	:::cplusplus
	@property(setter=setLogSeverity) int log_severity;

### <a id="sync_server"></a>sync\_server property

NSString. Sets the RhoConnect server url, for example: "`http://<ip>:<port>/application`"

	:::cplusplus
	@property(assign, setter=setSyncServer) NSString* sync_server;

### <a id="initDatabase"></a>initDatabase

Initializes your client database. Call this method before you create and use a client.

	::::cplusplus
	+ (void) initDatabase;

### <a id="addModels"></a>addModels

Adds your model objects to your client database, allowing them to sync with the RhoConnect server.

	:::cplusplus
	- (void) addModels:(NSArray*)models;

<table border="1">
<tr>
	<td><code>models</code></td>
	<td>NSArray containing the model objects.</td>
</tr>
</table>

### <a id="database_full_reset_and_logout"></a>database\_full\_reset\_and\_logout

Resets all data for all models in your local database, and then performs logout.

	:::cplusplus
	- (void) database_full_reset_and_logout;

### <a id="database_client_reset"></a>database\_client\_reset

Resets all data for all models in your local database and delete client ID. Use this method for 'unknown client' error

	:::cplusplus
	- (void) database_client_reset;

### <a id="loginWithUser">loginWithUser

Returns a RhoConnectNotify object containing login data after logging your client database into the RhoConnect server.

	:::cplusplus
	- (RhoConnectNotify*) loginWithUser: (NSString*) user pwd:(NSString*) pwd;

<table border="1">
<tr>
	<td><code>usr</code></td>
	<td>NSString containing the user name.</td>
</tr>
<tr>
	<td><code>pwd</code></td>
	<td>NSString containing the password.</td>
</tr>
</table>

### <a id="loginWithUser (with callback)">loginWithUser (with callback)

Logs your client database into the RhoConnect server and calls a selector callback target method when the login process is finished.

	:::cplusplus
	- (void) loginWithUser: (NSString*) user pwd:(NSString*) pwd callback:(SEL) callback target:(id)target;

<table border="1">
<tr>
	<td><code>usr</code></td>
	<td>NSString containing the user name.</td>
</tr>
<tr>
	<td><code>pwd</code></td>
	<td>NSString containing the password.</td>
</tr>
<tr>
	<td><code>callback:(SEL) callback target:(id)target</code></td>
	<td>The reference to the callback method. An example could be <code>callback:@selector(loginComplete:) target:self</code>. You would write the callback method loginComplete to perform actions when the login process completes.</td>
</tr>
</table>

### <a id="setNotification">setNotification

Set the sync notification callback method.

	:::cplusplus
	- (void) setNotification: (SEL) callback target:(id)target;

<table border="1">
<tr>
	<td><code>callback:(SEL) target:(id)target</code></td>
	<td>The reference to the callback method that performs actions upon a sync notification.</td>
</tr>
</table>

### <a id="clearNotification">clearNotification

Instance method. Clear the sync notification callback.

	:::cplusplus
	- (void) clearNotification;

### <a id="is_logged_in">is\_logged\_in

Instance method. Returns true if your RhoConnect session is logged in (if the login session exists in the database), false otherwise.

	:::cplusplus	
	- (BOOL) is_logged_in;

### <a id="syncAll">syncAll

Instance method. Returns a RhoConnectNotify object after running a sync on all the models for your RhoConnect client.

	:::cplusplus
	- (RhoConnectNotify*) syncAll;

### <a id="is_syncing">is_syncing

Instance method. Returns TRUE if synchronization is in progress

	:::cplusplus
	- (BOOL) is_syncing;

### <a id="stop_sync">stop_sync

Instance method. Stop current sync if running

	:::cplusplus
	- (void) stop_sync;

### <a id="search">search

Instance method. Returns a RhoConnectNotify object after sending a search request to the RhoConnect server.

	:::cplusplus
	- (RhoConnectNotify*) search: (NSArray*)models from: (NSString*) from params: (NSString*)params sync_changes: (BOOL) 				
		sync_changes progress_step: (int) progress_step;

<table border="1">
<tr>
	<td><code>models</code></td>
	<td>NSArray containing the names of the model names to search in.</td>
</tr>
<tr>
	<td><code>from</code></td>
	<td>(Optional) NSString. Sets the RhoConnect path that the records are fetched with. Default = "search".</td>
</tr>
<tr>
	<td><code>params</code></td>
	<td>NSString. A string containing the name/value search items, in the form "param1=val1&param2=val2&param3=val3". The values must be url-encoded.</td>
</tr>
<tr>
	<td><code>sync_changes</code></td>
	<td>BOOL. TRUE if data with local changes is pushed to the server before the search is performed, FALSE otherwise.</td>
</tr>
<tr>
	<td><code>progress_step</code></td>
	<td>(Optional) int. Define how often the search callback will be executed when the RhoConnectNotify status is "in_progress".</td>
</tr>
</table>

### <a id="setObjectNotification">setObjectNotification

Instance method. Sets the callback method for object notification. The callback receives a RhoConnectObjectNotify object as a parameter. This RhoConnectObjectNotify object contains three arrays of hashes for the objects and their source ids that have been updated, created, and deleted, allowing you to display which records were changed.

    - (void) setObjectNotification: (SEL) callback target:(id)target;

<table border="1">
<tr>
	<td><code>(SEL) callback target:(id)target</code></td>
	<td>The name of your callback method.</td>
</tr>
</table>

### <a id="clearObjectNotification"></a>clearObjectNotification

    - (void) clearObjectNotification;

Instance method. Clears the callback method for object notification.

### <a id="addObjectNotify"></a>addObjectNotify

Instance method. Add an object to track changes: create, update, delete.

	:::cplusplus
    - (void) addObjectNotify: (int) nSrcID szObject:(NSString*) szObject;

<table border="1">
<tr>
	<td><code>nSrcID</code></td>
	<td>int. The object ID of the source on the server with which this RHoConnectClient syncs. You can provide this with the "source\_id" property value.</td>
</tr>
<tr>
	<td><code>szObject</code></td>
	<td>NSString. The object ID of the item created to track the changes to this RhoConnectClient.</td>
</tr>
</table>

Sample call:

	:::cplusplus
	RhoConnectClient* sclient;
	...
	[sclient addObjectNotify: [[item objectForKey:@"source_id"] intValue] szObject:[item valueForKey:@"object"] ];

### <a id="onCreateError"></a>onCreateError

Instance method. To process 'create-error' errors from server.

	:::cplusplus
    - (void) onCreateError: (RhoConnectNotify*)notify action: (NSString*)action;

<table border="1">
<tr>
	<td><code>notify</code></td>
	<td>RhoConnectNotify. Notification object passed to notification callback.</td>
</tr>
<tr>
	<td><code>action</code></td>
	<td>NSString. May be "delete" or "recreate": "delete" just remove object from client, "recreate" will push this object to server again at next sync.</td>
</tr>
</table>

Sample call:

	:::cplusplus
	RhoConnectClient* sclient;
	...
	if ([notify hasCreateErrors])
	    [sclient onCreateError: notify action:@"delete" ];


### <a id="onUpdateError"></a>onUpdateError

Instance method. To process 'update-error' errors from server.

	:::cplusplus
    - (void) onUpdateError: (RhoConnectNotify*)notify action: (NSString*)action;

<table border="1">
<tr>
	<td><code>notify</code></td>
	<td>RhoConnectNotify. Notification object passed to notification callback.</td>
</tr>
<tr>
	<td><code>action</code></td>
	<td>NSString. May be "retry" or "rollback": "retry" will push update object operation to server again at next sync, "rollback" will write rollback objects(comes from server) to client database.</td>
</tr>
</table>

Sample call:

	:::cplusplus
	RhoConnectClient* sclient;
	...
	if ([notify hasUpdateErrors])
	    [sclient onUpdateError: notify action:@"retry" ];

### <a id="onDeleteError"></a>onUpdateError

Instance method. To process 'delete-error' errors from server.

	:::cplusplus
    - (void) onDeleteError: (RhoConnectNotify*)notify action: (NSString*)action;

<table border="1">
<tr>
	<td><code>notify</code></td>
	<td>RhoConnectNotify. Notification object passed to notification callback.</td>
</tr>
<tr>
	<td><code>action</code></td>
	<td>NSString. May be "retry" - will push delete object operation to server again at next sync.</td>
</tr>
</table>

Sample call:

	:::cplusplus
	RhoConnectClient* sclient;
	...
	if ([notify hasDeleteErrors])
	    [sclient onDeleteError: notify action:@"retry" ];
	    	        
## RhomModel Class API

The RhomModel class contains the following properties and methods for setting and using RhomModel objects; RhomModel objects are RhoConnect models and their attributes.

 * <a href="#name">name property</a>
 * <a href="#sync_type">sync_type property</a>
 * <a href="#model_type">model_type property</a>
 * <a href="#associations">associations property</a>
 * <a href="#init">init</a>
 * <a href="#sync">sync</a>
 * <a href="#sync (with callback)">sync (with callback)</a>
 * <a href="#setNotification">setNotification</a>
 * <a href="#clearNotification">clearNotification</a>
 * <a href="#create">create</a>
 * <a href="#find">find</a>
 * <a href="#find_first">find_first</a>
 * <a href="#find_all">find_all</a>
 * <a href="#save">save</a>
 * <a href="#destroy">destroy</a>
 * <a href="#startBulkUpdate">startBulkUpdate</a>
 * <a href="#stopBulkUpdate">stopBulkUpdate</a>
 * <a href="#is_changed">is_changed</a>

### <a id="name"></a>name property

NSString. Sets the model name.

	:::cplusplus
	@property(assign) NSString* name;

### <a id="sync_type"></a>sync\_type property

int. Sets the synchronization type: RST\_INCREMENTAL or RST\_BULK\_ONLY.

	:::cplusplus
	@property(assign) int sync_type;

### <a id="model_type">model\_type property

int. Sets the model type: RMT\_PROPERTY\_BAG (default) or RMT\_PROPERTY\_FIXEDSCHEMA.

	:::cplusplus
	@property(assign) int model_type;

### <a id="associations">associations property

The associations dictionary is a property of the model that controls its synchronization process. When one model (model A) has an association with another model (model B), this forces the other model (model B) synchronized along with the model (model A).

	:::cplusplus
	// Associations dictionary: the key is the model attribute name, 
	// the value is the associated model name.
	// While using associations, use the object_id attribute as object reference
	
	@property(assign) NSDictionary* associations;

Example of associating two models, customer and product:

	:::cplusplus
	RhomModel* order = [[RhomModel alloc] init];
	order.name = @"Order";
    order.associations = [NSDictionary dictionaryWithObjectsAndKeys: @"Customer", @"customer", @"Product", @"product", nil];

### <a id="init">init

Initializes a model object.

	:::cplusplus
	- (id) init;

### <a id="sync">sync

Returns a RhoConnectNotify object containing sync information, after running a sync on this model.

	:::cplusplus
	- (RhoConnectNotify*) sync;

### <a id="sync (with callback)">sync (with callback)

Runs a sync on this model, and calls a callback, passing the callback the RhoConnectNotify status parameter for the synchronization: "in\_progress", "ok", "error", "complete".

	:::cplusplus
	- (void) sync: (SEL) callback target:(id)target;

Example:

	:::cplusplus
	int shouldSyncProductByName()
	{
		RhoConnectNotify* res = [[product sync] retain];
		int	nErr = res.error_code;
		[res release];
		if ( nErr!= RHO_ERR_NONE ) {
			return 0;
		}
	
		return 1;
	}

### <a id="setNotification">setNotification

Set the sync notification callback method for the Model.

	:::cplusplus
	- (void) setNotification: (SEL) callback target:(id)target;

<table border="1">
<tr>
	<td><code>callback:(SEL) target:(id)target</code></td>
	<td>The reference to the callback method that performs actions upon a sync notification.</td>
</tr>
</table>

### <a id="clearNotification">clearNotification

Instance method. Clear the sync notification callback for the Model.

	:::cplusplus
	- (void) clearNotification;


### <a id="create">create

Create a model object with attributes and save it to the database, the object id will be generated automatically if not set.

	:::cplusplus
	- (void) create: (NSMutableDictionary *) data;

<table border="1">
<tr>
	<td><code>data</code></td>
	<td>NSMutableDictionary. The object containing the attribute data for this model.</td>
</tr>
</table>

### <a id="find">find

Returns an NSMutableDictionary object containing a model with the given object id.

	:::cplusplus
	- (NSMutableDictionary *) find: (NSString*)object_id;

<table border="1">
<tr>
	<td><code>object_id</code></td>
	<td>NSString. The object id.</td>
</tr>
</table>

### <a id="find_first">find\_first

Returns an NSMutableDictionary object containing the first model object found with the given set of model attributes.

	:::cplusplus
	- (NSMutableDictionary *) find_first: (NSDictionary *)cond;

<table border="1">
<tr>
	<td><code>cond</code></td>
	<td>A NSDictionary object containing the model attributes to find.</td>
</tr>
</table>

Example call:

	:::cplusplus
    NSMutableDictionary* cond = [[NSMutableDictionary alloc] init];
    [cond setValue: @"SomeRealName" forKey:@"name"];
    prod = [[product find_first: cond] retain];
    [cond release];
    if ( !prod ) {
          // not found
    }

### <a id="find_all">find\_all

Returns a NSMutableArray containing all the model objects that match the given set of attributes.

	:::cplusplus
	- (NSMutableArray *) find_all: (NSDictionary *)cond;

<table border="1">
<tr>
	<td><code>cond</code></td>
	<td>A NSDictionary object containing the model attributes to find.</td>
</tr>
</table>

### <a id="save">save

Saves a model object with the given data to the database.

	:::cplusplus
	- (void) save: (NSDictionary *)data;

<table border="1">
<tr>
	<td><code>data</code></td>
	<td>A NSDictionary object containing the attribute data for the model object that is saved.</td>
</tr>
</table>

### <a id="destroy">destroy

Delete model objects from the database that contain the given data.

	:::cplusplus
	- (void) destroy: (NSDictionary *)data;

<table border="1">
<tr>
	<td><code>data</code></td>
	<td>A NSDictionary object containing the attribute data for the model objects that are to be deleted.</td>
</tr>
</table>

### <a id="startBulkUpdate">startBulkUpdate

Run this method when you start to create or update a bunch of models; it will optimize database access. Equal to start transaction.

	:::cplusplus
	- (void) startBulkUpdate;

### <a id="stopBulkUpdate">stopBulkUpdate

Run this method when you start to create or update a bunch of models; it will optimize database access. Equal to commit transaction.

	:::cplusplus
	- (void) stopBulkUpdate;

### <a id="is_changed">is_changed

Check does model contain non-synced local changes

	:::cplusplus
	- (BOOL) is_changed;

## RhoConnectNotify Class API

Several RhoConnectClient methods return a RhoConnectNotify object. The properties for the RhoConnectNotify class provide access to sync notification objects as described [here](../guide/using_rhoconnect#setting-up-notifications). (Developers do not set RhoConnectNotify properties, but only read them after a call to a RhoConnectClient method that returns a RhoConnectNotify object.)

<table border="1">
<tr>
	<td><code>total_count</code></td>
	<td>@property int. Total number of records that exist for this RhoConnect source.</td>
</tr>
<tr>
	<td><code>processed_count</code></td>
	<td>@property int. Number of records included in this sync page for an in\_progress (status = incremental) sync.</td>
</tr>
<tr>
	<td><code>cumulative_count</code></td>
	<td>@property int. Number of records the SyncEngine has processed so far for this source.</td>
</tr>
<tr>
	<td><code>source_id</code></td>
	<td>@property int. The id of the current model that is synchronizing.</td>
</tr>
<tr>
	<td><code>error_code</code></td>
	<td>@property int. The HTTP response code of the RhoConnect server error: 401, 500, 404, etc.</td>
</tr>
<tr>
	<td><code>source_name</code></td>
	<td>@property(assign) NSString*. Name of the model (i.e. "Product").</td>
</tr>
<tr>
	<td><code>status</code></td>
	<td>@property(assign) NSString*. Status of the current sync process: "in\_progress", "error", "ok", "complete", "schema-changed".</td>
</tr>
<tr>
	<td><code>sync_type</code></td>
	<td>@property(assign) NSString*. Type of sync used for this model: "incremental" or "bulk".</td>
</tr>
<tr>
	<td><code>error_message</code></td>
	<td>@property(assign) NSString*. Response body of error message (if any).</td>
</tr>
<tr>
	<td><code>callback_params</code></td>
	<td>@property(assign) NSString*. Callback parameters.</td>
</tr>
<tr>
	<td><code>hasCreateErrors</code></td>
	<td>(Boolean). Return true if server return create-errors.</td>
</tr>
<tr>
	<td><code>hasUpdateErrors</code></td>
	<td>(Boolean). Return true if server return update-errors.</td>
</tr>
<tr>
	<td><code>hasDeleteErrors</code></td>
	<td>(Boolean). Return true if server return delete-errors.</td>
</tr>
<tr>
	<td><code>isUnknownClientError</code></td>
	<td>(Boolean). Return true if server return unknown client error.</td>
</tr>

</table>

## RhoConnectObjectNotify Class API

This class provides access to the sync object notification as described [here](../guide/using_rhoconnect#setting-up-notifications).

The RhoConnectObjectNotify object contains three arrays of hashes for the objects and their source ids that have been updated, created, and deleted. Each hash contains values for the keys “object” and “source\_id” so you can display which records were changed.

<table border="1">
<tr>
	<td><code>deleted_objects</code></td>
	<td>@property(readonly) NSMutableArray*. An array containing the deleted objects.</td>
</tr>
<tr>
	<td><code>updated_objects</code></td>
	<td>@property(readonly) NSMutableArray*. An array containing the updated objects.</td>
</tr>
<tr>
	<td><code>created_objects</code></td>
	<td>@property(readonly) NSMutableArray*. An array containing the created objects.</td>
</tr>
<tr>
	<td><code>deleted_source_ids</code></td>
	<td>@property(readonly) NSMutableArray*. An array containing the deleted source ids.</td>
</tr>
<tr>
	<td><code>updated_source_ids</code></td>
	<td>@property(readonly) NSMutableArray*. An array containing the updated source ids.</td>
</tr>
<tr>
	<td><code>created_source_ids</code></td>
	<td>@property(readonly) NSMutableArray*. An array containing the created source ids.</td>
</tr>
</table>

## Packaging RhoConnect Client
To package the RhoConnect Client archive for distribution, go to the top of the rhodes repository and run:

	:::term
  	$ rake build:rhoconnect_client

This will produce a zipfile in the folder called `rhoconnect-client-<someversion>.zip` where `<someversion>` is the version of the client.

## Release procedure
1. Unzip package to some folder

2. Open project `rhoconnect-client\ObjectiveC\Tests\RhoConnectClientTest` in xcode and run. See log - SUCCESS should be at the end of log.

3. Open project `rhoconnect-client\Samples\ObjectiveC\store` in xcode and run. Press Login, you should see several items, click on item, you should see details.
