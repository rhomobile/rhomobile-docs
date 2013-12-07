Bulk Sync
===
During the initial sync process in your application, you may need to deliver a large number of objects. This may result in many megabytes of data being sent to the device. In this case, incremental synchronization may take a while to complete since it uses JSON as the wire format. To significantly speed up this process you may use RhoConnect's "bulk sync" feature. 

## Bulk Sync Process

If and when the Rhodes application issues a request to get bulk data, the RhoConnect application will do following:

* Queue a [resque background job](http://github.com/defunkt/resque) which will run the bulk sync process.

* Execute the ['login,'query','logoff' methods](source-adapters#source-adapter-api) of all source adapter models matching the [requested data partition](source-adapters#data-partitioning) to get latest set of objects from the backend service

* Generate appropriate database files for the device. RhoConnect will generate sqlite files for iOS, Android, and Windows Mobile clients (if enabled).
 
* The Rhodes application will poll RhoConnect for the bulk sync job to finish. Once the job is finished, the files are generated and Rhodes will download and install them to the device. 

* After bulk database is installed, Rhodes application will analyze sources for references to remote blob objects. Each remote blob object will be downloaded to device, and if download is successful, remote references will be updated to local ones.

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

### Setup DB Library
Bulk sync prepares database files inside of a job, therefore it needs access to sqlite3's ruby library.  To enable this library, uncomment or add the following line to your RhoConnect app's Gemfile:

	:::ruby
	gem 'sqlite3', ">= 1.3.3", :platforms => [:ruby, :mswin, :mingw]

Then install the gem:

	:::term
	$ bundle install

### Enabling Bulk Sync in Rhodes
In the device rhodes application, setting `bulksync_state` to 0 in rhoconfig.txt will trigger bulk sync next time sync is performed:

	bulksync_state = 0

After application executed bulk sync it will set `bulksync_state` to 1 and next time sync will happen, it will not execute bulk sync anymore. You may force bulk sync on the next sync cycle by setting `bulksync_state` to 0 again using ruby in your application:
	
	:::ruby
	Rho::RhoConfig.bulksync_state = '0'

## Data Files

By default, bulk sync data files will be stored in the application's root folder, under a 'data' directory.  When bulk data is requested by the Rhodes application, RhoConnect will return a link to the file if the `bulk_sync_poll_interval` has not expired.  If the file is expired, RhoConnect will return a wait command to Rhodes and enqueue another [resque job](http://github.com/defunkt/resque) to generate new bulk data files.  By default, the `bulk_sync_poll_interval` is set to 1 hour (3600) seconds and is configurable in `settings.yml`:

	:::yaml
	:development: 
  	  :redis: localhost:6379
  	  :licensefile: settings/license.key
      :syncserver: http://localhost:9292/application/
      :bulk_sync_poll_interval: 3600

## Bulk Sync Associations

Sometimes your bulk data is not simply a collection of separate sources, but they are linked together through associations. For these purposes 
RhoConnect uses the notation of `belongs_to` association. The `belongs_to` association is a natural way to express hasOne and hasMany associations. In the case of bulk sync, data `belongs_to` relationship includes a list of all dependent objects for model(s) and helps resolve dependency issues during bulk sync process.

Associations are defined in your RhoConnect application's `settings/settings.yml` file.
 
For example, you can have a list of customers who have purchased a product, and thus you can have them belong to that product:

    :::yaml
    :sources:
      :Product:
        :poll_interval: 600
        :partition_type: app
        :sync_type: bulk_sync_only     
      :Customer:
        :poll_interval: 300
        # ...
        belongs_to:
          - :product_id: 'Product'

`belongs_to` format is an array of attribute/source_name pairs. It can be polymorphic and define associations across multiple sources:

    :::yaml
      belongs_to:
        - :parent_id, 'Product'
        - :parent_id, 'Cases'

Bulk Sync Associations are similar to [Rhom Sync Associations](../guide/rhom_ruby#associations) and both should be considered together
if you are planning to use bulk sync data.

## Using Bulk Sync with Fixed Schema Models

If your Rhom model is a [fixed schema model](../guide/local_database#fixed-schema-model) and you use bulk sync, you can control the bulk sync schema at runtime in your source adapter by implementing the 'schema' method.  

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
    
**NOTE: Key `version` is mandatory and should be always defined in schema method. You need update `version` value only in the case of schema changes.**

## Select which models to bulk sync.

Bulk sync process will only sync sources which sync type is not ‘none’. You may exclude model data from bulk sync with following code in your Rhodes application:

	:::ruby
	Rho::RHO.get_user_db().update_into_table('sources',{'sync_type'=>'none'}, {'name'=> "MySourceName" })

Set sync type to 'incremental' or 'bulk' when you want to get model data with bulk sync.

