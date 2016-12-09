# Using Rhom in Ruby

The RhoMobile Suite provides several methods of handling device data. For RhoMobile Suite 5.3 and higher is the [ORM common API](../api/NewORM), which supports JavaScript and Ruby. RMS 5.2 and lower support the original [Rhom API](../api/rhom-api) (for Ruby) documented here, and the [ORM API](../api/Orm), which adds JavaScript support to Rhom via the [OPAL library](http://opalrb.org).

## Creating a Ruby Data Model

Ruby models can be generated using RhoStudio or from the command line. The approaches are functionally equivalent; the generator outputs the model class itself along with a set of sample views that can be customized as needed.

### From RhoStudio

&#49;. In Project Explorer, **right-click on the application project and select New -> RhoMobile model**.

<img src="http://rhodocs.s3.amazonaws.com/rhostudio-tutorial/new-rhodes-model-menu-4.0.png"/>

&#50;. **Enter the model name in the Model Information window**.

**NOTE: <b>Models MUST NOT have the same name as any of Ruby's built-in classes</b>. These include: `Config, Settings, helpers, test, Client, Sync`. Best practices call for descriptive model names such as `Product` and `Service`, and to avoid generic names such as `time` and `print`. Descriptive naming will be helpful when the application grows or changes in the future**.

&#51;. **Enter the model attributes separated by commas only (no spaces)**.

<img src="http://rhodocs.s3.amazonaws.com/rhostudio-tutorial/model-information-4.0.png"/>

&#52;. **Click Finish**. Model generator results will appear in the output console window similar to the image below.

<img src="http://rhodocs.s3.amazonaws.com/rhostudio-tutorial/rhodes-model-generator-output-4.0.png"/>

### From the command line

The 'Rhodes' tool can be invoked manually to allow use of the command line or an IDE other than RhoStudio. The two steps below are functionally identical to the four above. 

&#49;. **Open a command prompt** and switch to the root directory of the application (the directory that contains `app` as a child). 

&#50;. **Execute the commmand** below:

    :::term
    $ rhodes model Product name,brand,price,quantity,sku


### What's inside a generated model

Output from the model generated in the 'Product' example will contain the following files, which can be updated to suit the application: 

* **app/Product/index.erb** - the html view template to display the list of objects
* **app/Product/edit.erb** - the html view template to edit an object
* **app/Product/new.erb** - the html view template to supply values to create a new object
* **app/Product/show.erb** - the html view template to displays the selected object
* **app/Product/product_controller.rb** - contains the the business logic for the model, the basic CRUD actions of create, read, update and delete plus indexing.
* **app/Product/product.rb** - contains the Product model definition
* **app/test/product_spec.rb** - placeholder for Product test specs

**NOTE: Depending on the data model being used, <b>model attributes might not be visible</b> in the `product.rb` file. See [Using Models (below)](#property_bag) for more information.**

<a name="property_bag"></a>
## Using Models

Rhodes offers a choice of PropertyBag and FixedSchema model storage schemes. PropertyBag, the default scheme, stores data in a table that's built dynamically as needed, so no attributes are present in a newly generated model. FixedSchema stores data for each model in a database table, with columns for each attribute defined in advance. Please refer to the [Data Handling](local_database) guide for more information.  

### Property Bag
In the property bag model, data is stored as key-value pairs in a single table using the object-attribute-value or [entity-attribute-value model](http://en.wikipedia.org/wiki/Entity-attribute-value_model). This model is sometimes referred to as 'open schema' because the fields (or keys) do not have to be defined in advance; the API stores and syncs all key-value pairs that are entered.

#### Advantages
* Simple, doesn’t require advance attribute design 
* Attributes can be added or removed without modifying the database schema
* Requires no data migration following a schema change 

#### Disadvantages
* Since all attributes are indexed, the database can be much larger than with fixed schema 
* Sync process can be slower because database insertions are performed at the attribute level

In a Property Bag model, Rhom groups objects by their source ID and object ID.  The following example illustrates this idea:

<pre>
Source ID: 1, Model Name: Account
+-----------+----------+--------------+----------------------+
| source_id | attrib   | object       | value                |
+-----------+----------+--------------+------- --------------+
|         1 | name     | 48f39f63741b | A.G. Parr PLC 37862  |
|         1 | industry | 48f39f63741b | Entertainment        |
|         1 | name     | 48f39f230529 | Jones Group          |
|         1 | industry | 48f39f230529 | Sales                |
+-----------+----------+--------------+----------------------+
</pre>

Here, Rhom will expose a class `Account` with the attributes `name` and `industry`:

    :::ruby
    account = Account.find('48f39f63741b')
    account.name
      #=> "A.G. Parr PLC 37862"

    account.industry
      #=> "Entertainment"

#### Using Property Bag Models
&#49;. **Generate a new model** with some attributes:

    :::term
    $ rhodes model product name,brand,price,quantity,sku

This will generate a file called `product.rb` that looks like this:

    :::ruby
    class Product
      include Rhom::PropertyBag

      # Uncomment the following line to enable sync with Product.
      # enable :sync

      #add model specific code here
    end

&#50;. **Enable the requiured features in the model** from the following feature list:

    :::ruby
    class SomeModel
      include Rhom::PropertyBag

      # rhoconnect settings
      # Enable sync for this model.
      # Default is disabled.
      enable :sync

      # Set the type of sync this model
      # will use (default :incremental).
      # Set to :bulk_only to disable incremental
      # sync and only use bulk sync.
      set :sync_type, :bulk_only

      # Set the sync priority for this model.
      # 1000 is default, set to lower number
      # for a higher priority.
      set :sync_priority, 1

      # Instruct Rhom to send all attributes
      # to RhoConnect when an object is updated.
      # Default is disabled, only changed attributes
      # are sent.
      enable :full_update

      # RhoConnect provides a simple way to keep data out of redis.
      # If you have sensitive data that you do not want saved in redis,
      # add the pass_through option in settings/settings.yml for each source.
      # Add pass_through to client model definition
      enable :pass_through

      # model settings

      # Define how data is partitioned for this model.
      # For synced models default is :user.
      # For non-synced models default is :local
      # If you have an :app partition
      # for your RhoConnect source adapter and use bulk sync,
      # set this to :app also.
      set :partition, :app

      # Define blob attributes for the model.
      # :blob           Declare property as a blob type
      #
      # :overwrite      (optional) Overwrite client copy
      #                 of blob with new copy from server.
      #                 This is useful when RhoConnect modifies
      #                 images sent from Rhodes, for example
      #                 zooming or cropping.
      property :image_url, :blob, :overwrite

      # You can define your own properties also
      property :mycustomproperty, 'hello'
    end

<a name="fixed_schema"></a>
### Fixed Schema
In a fixed schema model, each model has a separate database table and attributes form the columns of that table. In this sense, the fixed schema model is similar to a traditional relational database.

#### Advantages
* Smaller database size; indexes can be assigned to specific attributes
* Sync process may be faster because whole objects are inserted at once

#### Disadvantages
* Schema changes require data migration
* Database performance may be slow without careful index specificity

#### Using Fixed Schema Models
Using a fixed schema model involves more steps than the Property Bag model.

&#49;. **Generate the model using the 'rhodes' command**:

    :::term
    $ rhodes model product name,brand,price,quantity,sku

&#50;. **Change the include statement in `product.rb` to**: 

    :::ruby
    include Rhom::FixedSchema


&#51;. **Add the attributes**:

    :::ruby
    class Product
      include Rhom::FixedSchema

      # Uncomment the following line to enable sync with Product.
      # enable :sync

      property :name, :string
      property :brand, :string
      property :price, :string
      property :quantity, :string
      property :sku, :string

      property :int_prop, :integer
      property :float_prop, :float
      property :date_prop, :date #translate to integer type
      property :time_prop, :time #translate to integer type

    end

A table with a fixed schema model will be generated automatically when the application launches.

Below is a full list of options available to fixed schema models:

    :::ruby
    class SomeModel
      include Rhom::FixedSchema

      # rhoconnect settings
      # Enable sync for this model.
      # Default is disabled.
      enable :sync

      # Set the type of sync this model
      # will use (default :incremental).
      # Set to :bulk_only to disable incremental
      # sync and only use bulk sync.
      set :sync_type, :bulk_only

      # Set the sync priority for this model.
      # 1000 is default, set to lower number
      # for a higher priority.
      set :sync_priority, 1

      # Instruct Rhom to send all attributes
      # to RhoConnect when an object is updated.
      # Default is disabled, only changed attributes
      # are sent.
      enable :full_update

      # RhoConnect provides a simple way to keep data out of redis.
      # If you have sensitive data that you do not want saved in redis,
      # add the pass_through option in settings/settings.yml for each source.
      # Add pass_through to client model definition
      enable :pass_through

      # model settings

      # Define how data is partitioned for this model.
      # Default is :user.  If you have an :app partition
      # for your RhoConnect source adapter and use bulk sync,
      # set this to :app also.
      set :partition, :app

      # Set the current version of the fixed schema.
      # Your application may use it for data migrations.
      set :schema_version, '1.0'

      # Define fixed schema attributes.
      # :string and :blob types are supported.
      property :name, :string
      property :tag, :string
      property :phone, :string
      property :image_url, :blob

      # Define a named index on a set of attributes.
      # For example, this will create index for name and tag columns.
      index :by_name_tag, [:name, :tag]

      # Define a unique named index on a set of attributes.
      # For example, this will create unique index for the phone column.
      unique_index :by_phone, [:phone]

      # Define blob attributes for the model.
      # :blob           Declare property as a blob type
      #
      # :overwrite      (optional) Overwrite client copy
      #                 of blob with new copy from server.
      #                 This is useful when RhoConnect modifies
      #                 images sent from Rhodes, for example
      #                 zooming or cropping.
      property :image_url, :blob, :overwrite

      # You can define your own properties also
      property :mycustomproperty, 'hello'
    end

## Data Migrations
### Fixed Schema Data Migrations
Changes to the data model in a fixed-schema database requires that data be migrated from the old schema to the new one (a requirement not shared by the Property Bag model because of its 'open schema' construction). 

For this reason, Rhom provides an application hook for manually migrating data in the event of a model change. The hook also can be used to run business logic related to updates to a database. For example, it is sometimes desireable to display a custom alert notifying the user to wait a few moments while a data migration is in progress. 

To use this hook:

&#49;. **Track the `:schema_version`** in the model:

    :::ruby
    class Product
      include Rhom::FixedSchema

      set :schema_version, '1.1'
    end

&#50;. **In the `application.rb` class, implement the hook `on_migrate_source(old_version, new_src)`** as follows: 


    :::ruby
    class AppApplication < Rho::RhoApplication

      # old_version     String containing old version value (i.e. '1.0')
      # new_src         Hash with source information:
      #                 'schema_version', 'name', 'schema'
      #                 new_src['schema']['sql'] contains new schema sql
      def on_migrate_source(old_version, new_src)
        # ... do something like alert user ...

        db = Rho::RHO.get_src_db(new_src['name'])
        db.execute_sql("ALTER TABLE #{new_src['name']} ADD COLUMN mytest VARCHAR DEFAULT null")

        true # does not create table
      end
    end

The code above will call the hook on application start whenever `:schema_version` has changed. 

**NOTE: To modify the schema without recreating the table, use the ADD COLUMN command. Limitations of SQLlite prevent the removal of columns or changes to the type**.

Return `false` to run the custom sql specified by the new_src['schema']['sql'] string:

    :::ruby
    def on_migrate_source(old_version, new_src)
      # ... do something like alert user ...
      false # create table by source schema - useful only for non-synced models
    end

**NOTE: When migrating a table with source data that was synchronized, data must be copied to the new table before the first sync can occur. The sync function will not populate a blank table**. 

### Property Bag Data Migrations
Since its attributes are dynamic, the Property Bag database requires no data migrations when changes are made to its schema.  

### Removing Local Data From a Device
This scenario will work for Property Bag and Fixed Schema models.

To remove all local data when upgrading to new application version, simply change `app_db_version` in the `rhoconfig.txt` file.

## Adding new objects
To create a new model object and save it to the database, use the `create` method: 

    :::ruby
    user = User.create(
            :name => 'Alice',
            :email => 'alice@example.com')

NOTE: This is the fastest way to insert a single item into the database.

It's possible to create the new model object without saving it automatically, and then explicitly use the `save` method. This is useful for updating some of the object attributes before saving: 

    :::ruby
    user = User.new(:name => 'Alice')
    # update the object
    user.email = 'alice@example.com'
    user.save

## Retrieving objects
Use the find method to retrieve all objects for a model or only those matching given conditions.

### Getting all objects for a model
To retrieve all objects for a model using the `all` parameter:

    :::ruby
    users = User.find(:all)

### Finding objects matching conditions
To retrieve all objects matching given conditions using the `conditions` parameter:

    :::ruby
    users = User.find(
                :all,
                :conditions => {:name => 'Alice'}
            )

### Numeric field comparisons in property bag models
Because Property Bag models internally store all their values in the same column, this column is defined as `varchar`, which means that a number comparisons might not work as expected. To perform order comparisons on a numeric field in a Property Bag model, use CAST to convert the value to a number of the desired type:

    :::ruby
    @accts = Account.find(:all,
        :conditions => { {:func=> 'CAST', :name=>'rating as INTEGER', :op=>'<'} => 3 } )
    #or using sql query:
    size = 3
    @accts = Account.find(:all,
        :conditions => ["CAST(rating as INTEGER)< ?", "#{size}"], :select => ['rating'] )

### Ordering the objects
Use the `order` and `orderdir` parameters to retrieve objects sorted by one or more attributes:

    :::ruby
    # order by one attribute
    users = User.find(
                :all,
                :order => 'name',
                :orderdir => 'DESC'
            )

    # order by multiple attributes
    users = User.find(
                :all,
                :order => ['name', 'email'],
                :orderdir => ['ASC', 'DESC']
            )

### Retrieving specific attributes
If only some attributes in an object are needed for a particular action, increase app performance by using the `select` parameter to choose only the required attributes:

    :::ruby
    users = User.find(
                :all,
                :select => ['name']
            )

### Paginating results

Pass `offset` and `per_page` parameters to the `find` method to retrieve objects in chunks.

    :::ruby
    # get first 10 records
    users = User.find(:all, :per_page => 10)

    # get records 21-40
    users = User.find(:all, :offset => 20, :per_page => 20)

The `paginate` method emulates Rails' classic pagination syntax. The default page size is 10.

Use `:conditions`, `:order` and `select` parameters in a way similar to the `find` method: 

    :::ruby
    # get first 10 records
    users = User.paginate(:page => 0)

    # get records 21-40
    users = User.paginate(:page => 1, :per_page => 20)

### Retrieving only the first object matching conditions
Retrieve only the first object matching given conditions using `first` instead of `all` when calling `find`:

    :::ruby
    user = User.find(
                :first,
                :conditions => {:name => 'Alice'}
            )

### Using SQL queries directly
Retrieve model object(s) directly using SQL queries with the `find_by_sql` method. This method works only for fixed schema models: 

    :::ruby
    users = User.findBySql('SELECT * FROM User')

## Counting objects
Get the number of objects matching given condition(s) using the `count` parameter with `find` method:

    :::ruby
    count = User.find(
                :count,
                :conditions => {:name => 'Alice'}
            )

## Updating
Update an object’s attributes and save to the database using the `update_attributes` method:

    :::ruby
    user = User.find(:first, :conditions => {:name => 'Alice'})
    user.update_attributes(
                :name => 'Bob',
                :email => 'bob@example.com')
NOTE: This is the fastest way to add or update item attributes.

## Deleting
### Deleting one object
To delete a single model object, use the `destroy` method on the object to be deleted: 

    :::ruby
    user = User.find(:first)
    user.destroy

### Delete multiple objects
To delete all objects for a model, or only those matching given condition(s), use the `delete_all` method:

    :::ruby
    # delete all objects
    User.delete_all()

    # delete only objects matching :conditions
    User.delete_all(:conditions => {:name => 'Alice'})

## Transactions
For database operations that must either succeed or fail as a group without leaving any partially completed operations, use transactions to group them together. Combine any set of object/model operations, such as ‘insert/update/delete’ under a transaction:

    :::ruby
    db = Rho::Database.new
    db.startTransaction
    begin
        # do multiple operations
        User.create(:name => 'Alice', :email => 'alice@example.com')
        User.create(:name => 'Bob', :email => 'bob@example.com')

        # no errors, so commit all the changes
        db.commitTransaction
    rescue
        # on error rollback all changes
        db.rollbackTransaction
    end

## Executing SQL
To execute SQL statements directly on the database, use the `Database.executeSql` method:

    :::ruby
    begin
        db = Rho::Database.new(Rho::Application.databaseFilePath('app'),'app');
        result = db.executeSql('SELECT * FROM User') # result is an array of hashes, where each hash is a record
    ensure
        db.close
    end

    :::ruby
    db.executeBatchSql("UPDATE User set valid=0; Update Account set active=0")

## Resetting database
To recover the database from a bad or corrupt state or if the RhoConnect server returns errors, use the following method to delete all objects for given model(s):

### Delete all objects for given models.

    :::ruby
    Rho::ORM.databaseFullResetEx(:models => ['User'], :reset_client_info => true, :reset_local_models => true)

## Adding more fields to an existing model

The list of attributes (fields) in a model can be updated as development progresses. If using the Property Bag storage scheme (the default), all that's required is to add the relevant code to the views (`index.erb`, `edit.erb`, `new.erb` and `show.erb`); Rhodes will take care of the rest. If using Fixed Schema, add the appropriate lines in the `<model name>.rb` file:

    :::ruby
    property :<property_name> :<data_type>

For example, in the `Product` model, we could add:

    :::ruby
    property :color, :string

For further details, please refer to the [Using the local database](../rhodes/rhom#fixed-schema) guide, which also contains methods to fine-tune data synchronization.

## Linking a model to a RhoConnect synchronization server

### What is RhoConnect?
RhoConnect is the server-side component of the RhoMobile Suite that connects mobile applications to external data sources and handles all aspects of data synchronization. Whether data comes from a relational database, NoSQL data store, RESTful web services or any other data source, RhoConnect bridges the gap between mobile clients and server resources. RhoConnect frees the developer from having to write complex synchronization code that's error-prone and hard to maintain. 

### Integrating a RhoMobile app with RhoConnect
Once an application can store data about a particular model, enabling two-way synchronization with a RhoConnect server is a one-step process. 

To enable synchronization in a RhoMobile app, simply open the model file (i.e. `product.rb`) and uncomment the line:

    :::ruby
    enable :sync

As long as RhoConnect server is properly configured, this is all that is required to benefit from automatic, two-way synchronization. See the [RhoConnect Tutorial](../tutorial/rhoconnect) for in-depth information about the benefits RhoConnect provides, as well as [Using the local database](../rhodes/rhom#fixed-schema) to find out how to tune data synchronization according to the needs of the application.

## Associations
Rhom has a `sync association` called `belongs_to` which can be used to trigger updates on sync-enabled models. This is useful when relationships between backend service objects exists.

For example, an app might contain a list of customers assigned to a sales person:

    :::ruby
    class Customer
      include Rhom::PropertyBag

      # Declare container model and attribute.
      belongs_to :salesrep_id, 'SalesRep'
    end

The value used as the identifier for linking objects is the `object` property:

    :::ruby
    def create
      @customer = Customer.new(@params['customer'])
      @customer.save

      sales_rep = SalesRep.find(...) # find the appropriate sales representative for new customers
      customer.salesrep_id = @sales_rep.object
      customer.save
      redirect :action => :index
    end

Polymorphic sync associations, or associations across multiple classes, also can be defined using array notations or multiple declarations:

Using array notation:

    :::ruby
    belongs_to :parent_id, ['Product', 'Case']

Using multiple declarations:

    :::ruby
    belongs_to :parent_id, 'Product'
    belongs_to :parent_id, 'Case'


If planning to use the bulk sync feature for associated models, consider the corresponding support on the RhoConnect Server side. See [RhoConnect Bulk Sync associations](../rhoconnect/bulk-sync#bulk-sync-associations).

## Freezed models
To limit model attributes to a specific list, the model can be 'freezed':

    :::ruby
    class Customer
        include Rhom::PropertyBag

        enable :sync

        set :freezed, true

        property :address, :string
        property :city, :string
        property :email, :string
    end

If an attempt is made to set a property on a freezed model that has not been explicitly defined, an ArgumentError exception will result:

    :::ruby
    obj = Customer.new( :wrong_address => 'test') #will raise ArgumentError exception
    obj = Customer.create( :wrong_address => 'test') #will raise ArgumentError exception

    obj = Customer.new
    obj.wrong_address = 'test' #will raise ArgumentError exception

    obj = Customer.new
    obj.update_attributes(:wrong_address => 'test') #will raise ArgumentError exception

**NOTE: FixedSchema models are 'freezed' by default.**

## Resetting the Database
Rhodes provides the following functions for recovering the database from a bad or corrupt state, or if the RhoConnect server returns errors.

### `Rhom::Rhom.database_full_reset(reset_client_info=false, reset_local_models=true)`
Deletes all records from the property bag and model tables.

    :::ruby
    # reset_client_info   If set to true, client_info
    #           table will be cleaned.
    #
    # reset_local_models  If set to true, local(non-synced models)
    #           will be cleaned.
    Rhom::Rhom.database_full_reset(false,true)

### `Rhom::Rhom.database_full_reset_and_logout`
Perform a full reset and then logout the RhoConnect client.

    :::ruby
    Rhom::Rhom.database_full_reset_and_logout

### `Rhom::Rhom.database_fullclient_reset_and_logout`
Equivalent to `Rhom::Rhom.database_full_reset(true)` followed by `SyncEngine.logout`.

    :::ruby
    Rhom::Rhom.database_fullclient_reset_and_logout

**NOTE: If the sync error "Unknown client" is displayed in the sync callback, this means that the RhoConnect server no longer knows about the client and a `Rhom::Rhom.database_fullclient_reset_and_logout` is recommended.  This error requires proper intervention in the app to handle the state before resetting the client.  For example, a sync notification could contain the following:**

    :::ruby
    if @params['error_message'].downcase == 'unknown client'
      puts "Received unknown client, resetting!"
      Rhom::Rhom.database_fullclient_reset_and_logout
    end

### `Rhom::Rhom.database_local_reset`
Reset only local(non-sync-enabled) models.

    :::ruby
    Rhom::Rhom.database_local_reset

### `Rhom::Rhom.database_full_reset_ex( :models => [model_name1, model_name2], :reset_client_info=>false, :reset_local_models => true)`
Deletes all records from the property bag and model tables, if models are set then reset only selected models

    :::ruby
    # models                Array of models names to reset
    # reset_client_info   If set to true, client_info
    #           table will be cleaned.
    #
    # reset_local_models  If set to true, local(non-synced models)
    #           will be cleaned.
    Rhom::Rhom.database_full_reset_ex(:models => ['Product', 'Customer'])

## Advanced Queries
### `find(*args)` (advanced conditions)
Rhom also supports advanced find `:conditions`.  Using advanced `:conditions`, rhom can optimize the query for the property bag table.

Let's say we have the following SQL fragment condition:

    :::ruby
    Product.find(
     :all,
     :conditions => [
       "LOWER(description) like ? or LOWER(title) like ?",
       query,
       query
     ],
     :select => ['title','description']
    )

Using advanced `:conditions`, this becomes:

    :::ruby
    Product.find(
      :all,
      :conditions => {
      {
        :func => 'LOWER',
        :name => 'description',
        :op => 'LIKE'
      } => query,
        {
        :func => 'LOWER',
        :name => 'title',
        :op => 'LIKE'
      } => query
      },
      :op => 'OR',
      :select => ['title','description']
    )

You can also use the 'IN' operator:

    :::ruby
    Product.find(
      :all,
      :conditions => {
        {
        :name => "image_uri",
        :op => "IN"
      } => "'15704','15386'"
      }
    )

    # or use array notation
    Product.find(
      :all,
      :conditions => {
        {
        :name => "image_uri",
        :op => "IN"
      } => ["15704","15386"]
      }
    )

You can also group `:conditions`:

    :::ruby
    cond1 = {
      :conditions => {
        {
        :func => 'UPPER',
        :name => 'name',
        :op => 'LIKE'
      } => query,
        {
        :func => 'UPPER',
        :name => 'industry',
        :op => 'LIKE'
      } => query
      },
      :op => 'OR'
    }

    cond2 = {
      :conditions => {
        {
        :name => 'description',
        :op => 'LIKE'
        } => 'Hello%'
      }
    }

    @accts = Account.find(
      :all,
      :conditions => [cond1, cond2],
      :op => 'AND',
      :select => ['name','industry','description']
    )

## Find by numeric field
To use number comparison conditions in `find`, use `CAST`:
    :::ruby
    @accts = Account.find(:all,
        :conditions => { {:func=> 'CAST', :name=>'rating as INTEGER', :op=>'<'} => 3 } )
    #or using sql query:
    size = 3
    @accts = Account.find(:all,
        :conditions => ["CAST(rating as INTEGER)< ?", "#{size}"], :select => ['rating'] )

## Database Encryption

**NOTE: [Rhom data encryption](../../2.2.0/rhodes/rhom#database-encryption) is no longer available as of Rhodes 3.3.3 and higher.**

If the application requires local (on-device) database encryption, enable it by setting a flag in `build.yml`:

    :::yaml
    encrypt_database: 1

**NOTE: Database encryption is not currently supported for applications that use bulk sync.**

### Platform Notes
* iOS uses an AES 128 encryption algorithm from the iOS SDK.
* Android uses an AES 128 ecryption algorithm from the Android SDK.
* Windows Mobile uses an RC4 algorithm from Windows Mobile SDK.

## Related reading

* [Database API reference](../api/Database)