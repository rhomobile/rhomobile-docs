Using RhoConnect with the RhoConnect Client
===

Rhoconnect Client is a library to add sync data capability to your applications. Application code can be ObjectiveC, JavaScript or any other supported language. Using this library you can easily enable synchronized data between your smartphone application and a RhoConnect server.

## Objective-C Client

### Getting started
* The RhoConnect Client is part of the Rhoconnect-client repository. You can get it [on github](https://github.com/rhomobile/rhodes/downloads) (select the latest 'rhoconnect-client' package). 

* Create new project or open existing one in XCode. Add `<rhoconnect-client>/objectivec/RhoConnectClient.xcodeproj` as dependency to your project, so the RhoConnectClient library will link with your project.

* Add a 'Copy bundle resources' build phase to project target, than add `<rhoconnect-client>/shared/db/res/db` folder to it.

* Add these libraries to your project: `libstdc++6.dylib, libsqlite3.dylib, libz.dylib, CFNetwork.framework`.

### Features supported

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

### Object Model

#### RhoConnectClient

    :::cplusplus
    //default is false
    //Set to false to get result of operations as return value.
    //Set to true to get notifications - not supported yet 
    @property(setter=setThreadedMode) BOOL threaded_mode;

    //default is 0. Not supported yet
    @property(setter=setPollInterval) int  poll_interval;

      //default is 0. Set minimal severity level for messages to log output
    @property(setter=setLogSeverity) int log_severity;

    //set rhoconnect server url, for example: "http://<ip>:<port>/application"
    @property(assign, setter=setSyncServer) NSString* sync_server;

    //call this method before create and use client
    //it will initialize local database
    + (void) initDatabase;

    //Add sync models to database, so they will sync
    - (void) addModels:(NSArray*)models;

    //reset all data for all models in local database, also perform logout
    - (void) database_full_reset_and_logout;

    //login to rhoconnect server and keep login session in database
    - (RhoConnectNotify*) loginWithUser: (NSString*) user pwd:(NSString*) pwd;

    //login to rhoconnect server and keep login session in database and call selector when finish
    // target is object where to call selector, selector calls in thread which make login call
    - (void) loginWithUser: (NSString*) user pwd:(NSString*) pwd callback:(SEL) callback target:(id)target;

    //set sync notification callback
    - (void) setNotification: (SEL) callback target:(id)target;
    //clear sync notification callback
    - (void) clearNotification;

    //check does login session exists in database
    - (BOOL) is_logged_in;

    // run sync of all models
    - (RhoConnectNotify*) syncAll;

    // check is sync is in progress
      - (BOOL) is_syncing;
      
      //stop current sync if running
      - (void) stop_sync;

    //send search request to rhoconnect
    - (RhoConnectNotify*) search: (NSArray*)models from: (NSString*) from params: (NSString*)params sync_changes: (BOOL)        
      sync_changes progress_step: (int) progress_step;

      //set callback method for object notification. callback receive RhoConnectObjectNotify object as a parameter
      - (void) setObjectNotification: (SEL) callback target:(id)target;
      - (void) clearObjectNotification;
      //add object to track changes: create, update, delete
      - (void) addObjectNotify: (int) nSrcID szObject:(NSString*) szObject;

      //To process 'create-error' errors from server:
      //Action may be "delete" or "recreate"
      //"delete" just remove object from client, "recreate" will push this object to server again at next sync.
      - (void) onCreateError: (RhoConnectNotify*)notify action: (NSString*)action;

      //To process 'update-error' errors from server:
      //Action may be "retry" or "rollback". 
      //"retry" will push update object operation to server again at next sync, "rollback" will write rollback objects(comes from server) to client database.
      - (void) onUpdateError: (RhoConnectNotify*)notify action: (NSString*)action;

      //To process 'delete-error' errors from server:
      //Action may be "retry" - will push delete object operation to server again at next sync.
      - (void) onDeleteError: (RhoConnectNotify*)notify action: (NSString*)action;

#### RhomModel

    :::cplusplus
    //model name
    @property(assign) NSString* name;

    //possible values: RST_INCREMENTAL, RST_BULK_ONLY
    @property(assign) int       sync_type;

    //possible values: RMT_PROPERTY_BAG (default), RMT_PROPERTY_FIXEDSCHEMA
    @property(assign) int       model_type;

    //associations dictionary: the key is attribute name, the value is associated model name
    //while using associations use object_id attribute as object reference
    @property(assign) NSDictionary* associations;

    // model constructor
    - (id) init;

    //run sync of this model
    - (RhoConnectNotify*) sync;

    //run sync of this model and call callback with status(in_progress, ok, error, complete)
    - (void) sync: (SEL) callback target:(id)target;

    //create model object with properties and save to database, object id will be generated automatically if not set
    - (void) create: (NSMutableDictionary *) data;

    //find object by object id
    - (NSMutableDictionary *) find: (NSString*)object_id;

    //find first object by set of properties
    - (NSMutableDictionary *) find_first: (NSDictionary *)cond;

    //find all objects by set of properties
    - (NSMutableArray *) find_all: (NSDictionary *)cond;

      //run sql query - result is array of hashes (string)
      - (NSMutableArray *) find_bysql: (NSString*)sql args: (NSArray*) sql_args;

    //save object represents by data to database
    - (void) save: (NSDictionary *)data;

    //delete object represents by data from database
    - (void) destroy: (NSDictionary *)data;

    //if you are going to create/update bunch of items - use these methods to optimize database access
    //these are equivalent to start/commit transaction
    - (void) startBulkUpdate;
    - (void) stopBulkUpdate;
                                                                                                
      //check does model was modified and not yet synced
      - (BOOL) is_changed;

#### RhoConnectNotify

This class provides access to sync notification objects as described [here](../guide/using_rhoconnect#setting-up-notifications):

    :::cplusplus
    @property int       total_count;
    @property int       processed_count;
    @property int       cumulative_count;
    @property int       source_id;
    @property int       error_code;
    @property(assign) NSString* source_name;
    @property(assign) NSString* status;
    @property(assign) NSString* sync_type;
    @property(assign) NSString* error_message;
    @property(assign) NSString* callback_params;

      - (Boolean) hasCreateErrors;
      - (Boolean) hasUpdateErrors;
      - (Boolean) hasDeleteErrors;
      - (Boolean) isUnknownClientError;

#### RhoConnectObjectNotify

This class provides access to sync object notification as described [here](../guide/using_rhoconnect#setting-up-notifications):

    :::cplusplus
    @property(readonly) NSMutableArray* deleted_objects;
    @property(readonly) NSMutableArray* updated_objects;
    @property(readonly) NSMutableArray* created_objects;

    @property(readonly) NSMutableArray* deleted_source_ids;
    @property(readonly) NSMutableArray* updated_source_ids;
    @property(readonly) NSMutableArray* created_source_ids;

### Samples

See [rhoconnect-client\Samples\ObjectiveC\store](http://github.com/rhomobile/rhodes/tree/master/rhoconnect-client/Samples/ObjectiveC/store/) as an example.

#### Initialization

    :::cplusplus
    [RhoConnectClient initDatabase];

    RhomModel* customer = [[RhomModel alloc] init];
    customer.name = @"Customer";

    RhomModel* product = [[RhomModel alloc] init];
    product.name = @"Product";

    RhomModel* order = [[RhomModel alloc] init];
    order.name = @"Order";
      order.associations = [NSDictionary dictionaryWithObjectsAndKeys: @"Customer", @"customer", @"Product", @"product", nil];

    RhoConnectClient* sclient = [[RhoConnectClient alloc] init];
    NSArray* models = [NSArray arrayWithObjects:customer, product, order, nil];

    [sclient addModels:models];

    sclient.sync_server = @"http://rhodes-store-server.heroku.com/application";

#### Initialization of Schema model

    :::cplusplus
    RhomModel* product = [[RhomModel alloc] init];
    product.name = @"Product_s";
      product.model_type = RMT_PROPERTY_FIXEDSCHEMA;

To create schema model tables edit database schema file: 

* Copy file <rhoconnect-client>/shared/db/res/db/syncdb.schema to your project folder

* Edit file syncdb.schema : add create table statement for each schema model. Note that mandatory object column should be in each table:

      "object" varchar(255) PRIMARY KEY

** NOTE: Do not use NOT NULL statement in column definitions. RhoConnect client delete object attributes by setting value to null, when all object attributes become nulls, object deleted. So objects with NOT NULL columns will not be deleted. **

* Open 'Copy bundle resources' build phase in project target and point it to local project db folder


#### Login

    :::cplusplus
    RhoConnectNotify* res = [ [RhoConnectEngine sharedInstance].syncClient loginWithUser:txtUser pwd:txtPwd];
    if ( res.error_code != RHO_ERR_NONE || ![[RhoConnectEngine sharedInstance].syncClient is_logged_in]) 
      ;//show error page
    else
      ;//show success page

#### Sync Data

    :::cplusplus
    RhoConnectNotify* res = [[RhoConnectEngine sharedInstance].syncClient syncAll];

#### Fetch data

    :::cplusplus
    NSMutableArray* arItems = [[RhoConnectEngine sharedInstance].product find_all:nil];
    NSDictionary* item = [arItems objectAtIndex: 0 ];
    textBrand = [item valueForKey:@"brand"];

#### Object Notifications
    :::cplusplus
      - (void)objectNotifyCallback:(RhoConnectObjectNotify*) notify
      {
      }

    NSMutableDictionary* item = [[NSMutableDictionary alloc] init];
    [item setValue:@"Test" forKey:@"name"];              
    [product create:item];
    
      [sclient setObjectNotification:@selector(objectNotifyCallback:) target:self];        
    
      [sclient addObjectNotify: [[item objectForKey:@"source_id"] intValue] szObject:[item valueForKey:@"object"] ];

#### Processing unknown-client error
Unknown client error return by server after resetting server database, removing particular client id from database or any other cases when server cannot find client id(sync server unique id of device).
Note that login session may still exist on server, so in this case client does not have to login again, just create new client id.
Processing of this error contain 2 steps:

* When unknown client error is come from server, client should call database_client_reset and start new sync, to register new client id.

* If login session also deleted or expired on the server, then customer has to login again.

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
                }
        }
      }

#### Processing server errors
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

#### Run SQL query on Schema model

    :::cplusplus
      NSArray* params = [NSArray arrayWithObjects: @"Apple", nil];
    NSMutableArray* items2 = [product find_bysql:@"SELECT * FROM Product_s WHERE name=?" args: params];
    //items2 is an Array of NSDictionary* (NSString* to NSString*)

## Android Java Client

### Getting started
* The RhoConnect Client is part of the Rhodes repository. You can get it [on github](https://github.com/rhomobile/rhodes/downloads) (select the latest 'rhoconnect-client' package).

* The RhoConnect Client for Android contains two files:

  * rhoimpl.jar - Java part of RhoConnect Client library

  * librhoconnectclient.so - native part of RhoConnect Client library

These can be build from <rhodes>/rhoconnect-client directory with next command

    :::shell
    $>rake android:default

* Create new Android project or open existing one in Eclipse. Add rhoimple.jar to your project build path and copy librhoconnectclient.so to <project_root>/libs/armeabi, so both Java and native parts of RhoConnect Client library will link with your project.

* Copy all files and subfolders from <rhoconnect-client>/rhoconnect-client/Java/RhoConnect/assets to assets folder of your Android project.

### RhoConnectClient initialization

* Load native library before any RhoConnect client usage. Example of appropriate place to do so is Android application's onCreate method

      :::java

      import android.app.Application;
      public class SampleApplication extends Application
      {
        public void onCreate() {
          System.loadLibrary("rhoconnectclient");
        }
      }

* Configure and initialize RhoConnect library. Example of appropriate place to do so is main Activity onCreate method

* Login to RhoConnect server

      :::cplusplus
      public void onCreate(Bundle savedInstanceState) {
          super.onCreate(savedInstanceState);
          setContentView(R.layout.main);

          ApplicationInfo appInfo = getApplicationInfo();

          try {
              RhoFileApi.initRootPath(appInfo.dataDir, appInfo.sourceDir);
              RhoFileApi.init(this.getApplicationContext());

              RhoLogConf.setMinSeverity(0);
              RhoLogConf.setEnabledCategories("*");

              RhoConnectClient.nativeInit();
          } catch (Exception e) {
              Logger.E(TAG, e.getMessage());
          }
          mSyncClient = new RhoConnectClient();
          mModels = new RhomModel[]{
                  new RhomModel("Customer", RhomModel.SYNC_TYPE_INCREMENTAL),
                  new RhomModel("Product", RhomModel.SYNC_TYPE_INCREMENTAL)
              };
          mSyncClient.initialize(mModels);
          mSyncClient.setPollInterval(0);
          mSyncClient.setSyncServer("http://rhodes-store-server.heroku.com/application");
          mSyncClient.setBulkSyncState(1);
          mSyncClient.loginWithUserAsync("", "", new RhoConnectNotify.IDelegate() {
              public void call(RhoConnectNotify notify) { onLogin(notify); } });
      }
      public void onLogin(RhoConnectNotify notify) {
          // Handle login event
      }

Note: RhoConnect callbacks (like passed to RhoConnectClient.loginWithUserAsync method in example above) may and most possibly will be called from another thread. It is up to application developer to care about synchronizing or forwarding call to an appropriate thread like GUI thread or Service thread. 

### Object Model

#### Intro

RhoConnect Client Android Java API resides at com.rhomobile.rhoconnect package. It contains two main classes: RhoConnectClient and RhomModel. The package also contains two classes which represent results of call to the API. These are RhoConnectNotify and RhoConnectObjectNotify.
Also several utility classes from com.rhomobile.rhodes package can be used. These are RhoConf, RhoLogConf, Logger.

#### RhoConnectClient

    :::cplusplus
      package com.rhomobile.rhoconnect;
      public class RhoConnectClient{
          /// Call this method before create and use the client. It sets up directory structure and makes necessary native library initialization.
        public static native void nativeInit();
          /// Creates instance of RhoConnectClient singlethon (yes, it's only one instance of RhoConnectClient allowed).
        public RhoConnectClient();
          /// Call this method to close network connections and release any resources gracefully
        public synchronized void close();
        /// Makes db models initialization. This call must be made just after RhoConnectClient construction and before any other calls to RhoConnectClient object.
        public native void initialize(RhomModel models[]);
          /// Sets up server URL to sync (RhoConnect server)  
        public native void setSyncServer(String url);
          /// Forces synchronous or asynchronous RhoConnectClient mode
          /// true - asynchronous mode (default)
          /// false - synchronous mode
        public native void setThreadedMode(boolean mode);
          /// Sets/gets auto sync interval. 0 - disable auto sync
        public native void setPollInterval(int interval);
        public native int getPollInterval();
          ///
        public native void setBulkSyncState(int state);
        public native int getBulkSyncState();
          /// Set get various configuration parameters.
        public native void setConfigString(String name, String param);
        public native String getConfigString(String name);
          /// Reset all data for all models in local database, also perform logout
        public native void databaseFullResetAndLogout();
          /// Checks does login session exists in the database
          public native boolean isLoggedIn();
        /// Logins to RhoConnect server and keep login session in database
        public native RhoConnectNotify loginWithUserSync(String user, String pass);
        /// Logins to RhoConnect server and keep login session in database.
          /// callback will be called when operation has finished.
        public native void loginWithUserAsync(String user, String pass, RhoConnectNotify.IDelegate callback);
          /// Runs sync of all models
        public native RhoConnectNotify syncAll();
      }

#### RhomModel

    :::cplusplus
    package com.rhomobile.rhoconnect;
    public class RhomModel {
        /// Possible model types
      public final static int MODEL_TYPE_PROPERTY_BAG = 0;
      public final static int MODEL_TYPE_FIXED_SCHEMA = 1;
        /// Possible sync types
      public final static int SYNC_TYPE_NONE = 0;
      public final static int SYNC_TYPE_INCREMENTAL = 1;
      public final static int SYNC_TYPE_BULK_ONLY = 2;
        /// Constructor        
        public RhomModel(String name, int syncType);
        /// Returns the model name    
        public String getName() { return mName; }
        /// Returns the model type
        public int getModelType() { return mModelType; }
        /// Sets the model type
        public void setModelType(int type) { mModelType = type; }
        // Returns the model sync type
        public int getSyncType() { return mSyncType; } 
        /// Sets the model sync type
        public void setSyncType(int type) { mSyncType = type; }
        /// Returns the model sync priority
        public int getSyncPriority() { return mSyncPriority; }
        /// Sets the model sync priority
        public void setSyncPriority(int prio) { mSyncPriority = prio; }
        /// Returns the model partition
        public String getPartition() { return mPartition; }
        /// Sets the model partition
        public void setPartition(String part) { mPartition = part; }
      /// Runs sync of the model
      public RhoConnectNotify sync();
        /// Creates model object with properties and save to database, object id will be generated automatically if not set
      public void create(Map<String, String> props);
        /// Finds object by object id
      public Map<String, String> find(String objectId)
      /// Saves changes to existing object
        public void save(Map<String, String> item);
        /// Destroys existing object
      public void destroy(Map<String, String> item) {

      // Returns first object which matches the condition
        public Map<String, String> findFirst(Map<String, String> condition);
      // Returns all objects which matched the condition
      public Collection<Map<String, String> > findAll(Map<String, String> condition);

      public void startBulkUpdate();
      public void stopBulkUpdate();
    }

#### RhoConnectNotify

    :::cplusplus
    package com.rhomobile.rhoconnect;
    public class RhoConnectNotify {
      public int getTotalCount() { return mTotalCount; }
      public int getProcessedCount() { return mProcessedCount; }
      public int getCumulativeCount() { return mCumulativeCount; }
      public int getSourceId() { return mSourceId; }
      public int getErrorCode() { return mErrorCode; }
      public String getSourceName() { return mSourceName; }
      public String getStatus() { return mStatus; }
      public String getSyncType() { return mSyncType; }
        public String getErrorMessage()
      public String getCallbackParams() { return mParams; }
        /// Developer need to implement and pass reference to this interface
        /// in order to get call back when asynchronous operation has completed
      public static interface IDelegate {
        public void call(RhoConnectNotify notify); 
      }
    }

#### RhoConnectObjectNotyfy

    :::cplusplus
    package com.rhomobile.rhoconnect;
    public interface RhoConnectObjectNotify {
      public String[] getDeletedObjects();
      public String[] getUpdatedObjects();
      public String[] getCreatedObjects();

      public int[] getDeletedSourceIds();
      public int[] getUpdatedSourceIds();
      public int[] getCreatedSourceIds();

        /// Developer need to implement and pass reference to this interface
        /// in order to get call back when objects are created, updated or destroyed at sync server
      public static interface IDelegate {
        public void call(RhoConnectObjectNotify notify); 
      }
    }

### Samples

* See android_store sample [rhoconnect-client\Samples\Java\android_store](http://github.com/rhomobile/rhoconnect-client/tree/master/rhoconnect-client/Samples/Java/android_store/) as an example.
* See android test Eclipse project [rhoconnect-client\Java\Android\test](http://github.com/rhomobile/rhoconnect-client/tree/master/rhoconnect-client/Java/Android/test/) as another example.

## Packaging RhoConnect Client
To package the RhoConnect Client archive for distribution, go to the top of the rhodes repository and run:

    :::term
    $ rake build:rhoconnect_client

This will produce a zipfile in the folder called `rhoconnect-client-<someversion>.zip` where `<someversion>` is the version of the client.

## Release procedure
1. Unzip package to some folder

2. Open project `rhoconnect-client\ObjectiveC\Tests\RhoConnectClientTest` in xcode and run. See log - SUCCESS should be at the end of log

3. Open project `rhoconnect-client\Samples\ObjectiveC\store` in xcode and run. Press Login, you should see several items, click on item, you should see details
