Using RhoSync with the RhoSync Client
===

Rhosync Client is a library to add sync data capability to your applications. Application code can be ObjectiveC, C++, JavaScript or any other supported language. Using this library you can easily enable synchronized data between your smartphone application and a RhoSync server.

## Objective-C Client

### Getting started
* The RhoSync Client is part of the Rhodes repository. You can get it [on github](https://github.com/rhomobile/rhodes/downloads) (select the latest 'rhosync-client' package). 

* Create new project or open existing one in XCode. Add `<rhosync-client>/objectivec/SyncClient.xcodeproj` as dependency to your project, so the SyncClient library will link with your project.

* Add a 'Copy bundle resources' build phase to project target, than add `<rhosync-client>/shared/db/res/db` folder to it.

* Add these libraries to your project: `libstdc++6.dylib, libsqlite3.dylib, libz.dylib, CFNetwork.framework`.

### Object Model

#### RhoSyncClient

	:::cplusplus
	//default is false
	//Set to false to get result of operations as return value.
	//Set to true to get notifications - not supported yet 
	@property(setter=setThreadedMode) BOOL threaded_mode;

	//default is 0. Not supported yet
	@property(setter=setPollInterval) int  poll_interval;

	//set rhosync server url, for example: "http://<ip>:<port>/application"
	@property(assign, setter=setSyncServer) NSString* sync_server;

	//call this method before create and use client
	//it will initialize local database
	+ (void) initDatabase;

	//Add sync models to database, so they will sync
	- (void) addModels:(NSArray*)models;

	//reset all data for all models in local database, also perform logout
	- (void) database_full_reset_and_logout;

	//login to rhosync server and keep login session in database
	- (RhoSyncNotify*) loginWithUser: (NSString*) user pwd:(NSString*) pwd;

	//login to rhosync server and keep login session in database and call selector when finish
	// target is obejct where to call selector, selector calls in thread which make login call
	- (void) loginWithUser: (NSString*) user pwd:(NSString*) pwd callback:(SEL) callback target:(id)target;

	//set sync notification callback
	- (void) setNotification: (SEL) callback target:(id)target;
	//clear sync notification callback
	- (void) clearNotification;

	//check does login session exists in database
	- (BOOL) is_logged_in;

	// run sync of all models
	- (RhoSyncNotify*) syncAll;

	//send search request to rhosync
	- (RhoSyncNotify*) search: (NSArray*)models from: (NSString*) from params: (NSString*)params sync_changes: (BOOL) 				
		sync_changes progress_step: (int) progress_step;

#### RhomModel

	:::cplusplus
	//model name
	@property(assign) NSString* name;

	//possible values: RST_INCREMENTAL, RST_BULK_ONLY
	@property int       sync_type;

	// model constructor
	- (id) init;

	//run sync of this model
	- (RhoSyncNotify*) sync;

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

	//save object represents by data to database
	- (void) save: (NSDictionary *)data;

	//delete object represents by data from database
	- (void) destroy: (NSDictionary *)data;

	//if you are going to create/update bunch of items - use these methods to optimize database access
	//these are equivalent to start/commit transaction
	- (void) startBulkUpdate;
	- (void) stopBulkUpdate;

#### RhoSyncNotify

This class provides access to sync notification objects as describe [here](../rhodes/synchronization#notifications): 

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

### Samples

See [rhosync-client\Samples\ObjectiveC\store](http://github.com/rhomobile/rhodes/tree/master/rhosync-client/Samples/ObjectiveC/store/) as an example.

#### Initialization

	:::cplusplus
	[RhoSyncClient initDatabase];		

	RhomModel* customer = [[RhomModel alloc] init];
	customer.name = @"Customer";

	RhomModel* product = [[RhomModel alloc] init];
	product.name = @"Product";

	RhoSyncClient* sclient = [[RhoSyncClient alloc] init];
	NSArray* models = [NSArray arrayWithObjects:customer, product, nil];	

	[sclient addModels:models];

	sclient.sync_server = @"http://rhodes-store-server.heroku.com/application";

#### Login

	:::cplusplus
	RhoSyncNotify* res = [ [SyncEngine sharedInstance].syncClient loginWithUser:txtUser pwd:txtPwd];
	if ( res.error_code != RHO_ERR_NONE || ![[SyncEngine sharedInstance].syncClient is_logged_in]) 
	  ;//show error page
	else
	  ;//show success page

#### Sync Data

	:::cplusplus
	RhoSyncNotify* res = [[SyncEngine sharedInstance].syncClient syncAll];

#### Fetch data

	:::cplusplus
	NSMutableArray* arItems = [[SyncEngine sharedInstance].product find_all:nil];
	NSDictionary* item = [arItems objectAtIndex: 0 ];
	textBrand = [item valueForKey:@"brand"];

## Packaging RhoSync Client
To package the RhoSync Client archive for distribution, go to the top of the rhodes repository and run:

	:::term
  	$ rake build:rhosync_client

This will produce a zipfile in the folder called `rhosync-client-<someversion>.zip` where `<someversion>` is the version of the client.

## Release procedure
1. Unzip package to some folder

2. Open project `rhosync-client\ObjectiveC\Tests\SyncClientTest` in xcode and run. See log - SUCCESS should be at the end of log

3. Open project `rhosync-client\Samples\ObjectiveC\store` in xcode and run. Press Login, you should see several items, click on item, you should see details