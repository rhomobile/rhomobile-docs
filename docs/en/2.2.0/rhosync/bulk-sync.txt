Bulk Sync
===
During the initial sync process in your applcation, you may need to deliver a large number of objects. This may result in many megabytes of data being sent to the device. In this case, incremental synchronization may take a while to complete since it uses JSON as the wire format. To significantly speed up this process you may use RhoSync's "bulk sync" feature. 

## Bulk Sync Process

If and when the Rhodes application issues a request to get bulk data, the RhoSync application will do following:

* Queue a [resque background job](http://github.com/defunkt/resque) which will run the bulk sync process.

* Execute the ['login,'query','logoff' methods](source-adapters#source-adapter-api) of all source adapters matching the [requested data partition](source-adapters#data-partitioning) to get latest set of objects from the backend service

* Generate appropriate database files for the device - hsqldb for Blackberry and sqlite for the rest of them. RhoSync will generate sqlite files for iOS, Android, and Windows Mobile clients and hsqldb files for Blackberry (if enabled).
 
* The Rhodes application will poll RhoSync for the bulk sync job to finish. Once the job is finished, the files are generated and Rhodes will download and install them to the device. 

**NOTE: Be cautious using this in your application - any previous set of objects on the device will be replaced with the latest set from the backend service.**

Once the bulk data sync process is complete for a source, you may continue to synchronize sources using the default incremental sync process. However, the default sync process may be disabled for a source by setting its `sync_type` to 'bulk_sync_only'.  This will save space in your redis database if you don't plan on using incremental sync for this source.

For example, your settings/settings.yml might have:

	:::yaml
	:sources:
	  Product:
	    poll_interval: 300
	  Customer:
		poll_interval: 300
		sync_type: bulk_sync_only

## Setup

### Enabling Bulk Sync in Rhodes
In the device rhodes application, setting `bulksync_state` to 0 in rhoconfig.txt will trigger bulk sync next time sync is performed:

	bulksync_state = 0

After application executed bulk sync it will set `bulksync_state` to 1 and next time sync will happen, it will not execute bulk sync anymore. You may force bulk sync on the next sync cycle by setting `bulksync_state` to 0 again using ruby in your application:
	
	:::ruby
	Rho::RhoConfig.bulksync_state = '0'

### Enabling BlackBerry Bulk Sync
If your application will be performing bulk sync for BlackBerry devices, you will need to install the open source Rhomobile HSQLDB tool [hsqldata.jar](http://github.com/rhomobile/hsqldata) in your RhoSync application.
  
1. Download [hsqldata](http://github.com/rhomobile/hsqldata/zipball/0.0.2).

2. Build and install hsqldata.jar into your RhoSync application:
  		
		:::term
		$ cd hsqldata
		$ ant
	  	$ mkdir <path-to-rhosync-app>/vendor
	  	$ cp bin/hsqldata.jar <path-to-rhosync-app>/vendor/

3. Next set the `:blackberry_bulk_sync:` flag in settings/settings.yml:

		:::yaml
		:development:
  		  :licensefile: settings/license.key
  		  :redis: localhost:6379
  		  :syncserver: http://localhost:9292/application/
  		  :blackberry_bulk_sync: true

## Data Files

By default, bulk sync data files will be stored in the application's root folder, under a 'data' directory.  When bulk data is requested by the Rhodes application, RhoSync will return a link to the file if the `bulk_sync_poll_interval` has not expired.  If the file is expired, RhoSync will return a wait command to Rhodes and enqueue another [resque job](http://github.com/defunkt/resque) to generate new bulk data files.  By default, the `bulk_sync_poll_interval` is set to 1 hour (3600) seconds and is configurable in `settings.yml`:

	:::yaml
	:development: 
  	  :redis: localhost:6379
  	  :licensefile: settings/license.key
      :syncserver: http://localhost:9292/application/
      :bulk_sync_poll_interval: 3600

## Using Bulk Sync with Fixed Schema Models

If your Rhom model is a [fixed schema model](../rhodes/rhom#fixed-schema) and you use bulk sync, you can control the bulk sync schema at runtime in your source adapter by implementing the 'schema' method.  

**NOTE: This method must return a JSON string.  This JSON string is sent to the Rhodes application and used to dynamically build the database schema.**

An example schema method is as follows:

	:::ruby
  	def schema
      {
        'version' => '1.0',
        'property' => {
          'name' => 'string',
          'brand' => 'string',
          'price' => 'string',
          'image_url_cropped' => 'blob,overwrite',
          'image_url' => 'blob'
        },
        'index' => {
          'by_name_brand' => 'name,brand'
        },
        'unique_index' => {
          'by_price' => 'price'
        }
      }.to_json
    end