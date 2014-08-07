# Rhom Ruby API
Allows Ruby access to the Rhodes mini database object mapper, performing database operation on Rhodes model objects.

**NOTE: For JavaScript access to the Rhom, see the [ORM JavaScript API](Orm).**

<a name="can_modify"></a>
## can_modify
Returns true if the Rhodes model object is not currently being synced (if it is being synced, you should disable editing of the object).

Before displaying an edit page for an object, your application can check if the object is currently being accessed by the sync process. If it is, you should disable editing of the object. `can_modify` could return true, for example, on a new local record that was created and sent to the RhoConnect application, but no response has been received yet.

	:::ruby
	modelname.can_modify

### Example
Before displaying an edit page for an object, your application can check if the object is currently being accessed by the sync process.  If it is, you should disable editing of the object.  `can_modify` could return true, for example, on a new local record that was created and sent to the RhoConnect application, but no response has been received yet.<a id="rhom-canmodify-example" />

	:::ruby
  	def edit
	  @product = Product.find(@params['id'])
	  if @product && !@product.can_modify
	    render :action => :show_edit_error
	  else    
	    render :action => :edit
	  end
	end

<a name="changed"></a>
## changed?
Returns true if a Rhodes model object has local database changes that need to be synchronized, false otherwise. 

	:::ruby
	modelname.changed?

### Example
Determine if a rhom model has local database changes that need to be synchronized.<a id="rhom-changed-example" />

    :::ruby
    def should_sync_product_object
      if Product.changed?
        #... do stuff ...
      end
    end

<a name="client_id"></a>
## client_id
Returns the current sync client id.

	:::ruby
	modelname.client_id

<a name="clear_notification"></a>
## clear_notification
Clear notification for the object. 

	:::ruby
	modelname.clear_notification

<a name="count"></a>
## count
Returns the number of objects in the named model. This is equivalent to using the `modelname.find()` method with the `:count` argument.

	:::ruby
	modelname.count

<a name="create"></a>
## create
Create a new Rhodes model object and save it to the database.

**NOTE: This is the fastest way to insert a single item into the database.**

	:::ruby
	modelname.create(attributes)

<table border="1">
<tr>
	<td><code>attributes</code></td>
	<td>List of attributes assigned to the new model object, such as <code>{"name" => "ABC Inc.","address" => "555 5th St."}</code>.</td>
</tr>
</table>

### Example
Create a new rhom object and save to the database.<a id="rhom-create-example" />

	:::ruby
	@account = Account.create(
	  {"name" => "some new record", "industry" => "electronics"}
	)

<a name="database_export"></a>
## database_export
Creates a zip archive of a local database partition with all its blob objects, and returns a path to that zip archive.

	:::ruby
	Rhom::Rhom.database_export(partition)

<table border="1">
<tr>
	<td><code>partition</code></td>
	<td>a local database partition.</td>
</tr>
</table>

<a name="database_fullclient_reset_and_logout"></a>
## database_fullclient_reset_and_logout
Reset the Rhodes model database and logout. Equivalent to `Rhom::Rhom.database_full_reset(true)` followed by `SyncEngine.logout`.

**NOTE: If you receive a sync error "Unknown client" message in your sync callback, this means that the RhoConnect server no longer knows about the client and a `Rhom::Rhom.database_fullclient_reset_and_logout` is recommended.  This error requires proper intervention in your app so you can handle the state before resetting the client.  For example, your sync notification could contain the following:**

	:::ruby
	if @params['error_message'].downcase == 'unknown client'
	  puts "Received unknown client, resetting!"
	  Rhom::Rhom.database_fullclient_reset_and_logout
	end

<a name="database_full_reset"></a>
## database_full_reset
Deletes all records from the property bag and model tables. 

	:::ruby
	Rhom::Rhom.database_full_reset(reset_client_info, reset_local_models)

<table border="1">
<tr>
	<td><code>reset_client_info</code></td>
	<td>true to clean the client_info table, false otherwise.</td>
</tr>
<tr>
	<td><code>reset_local_models</code></td>
	<td>true to clean local (non-synced) models, false otherwise.</td>
</tr>
</table>

<a name="database_full_reset_and_logout"></a>
## database_full_reset_and_logout
Perform a full reset, then logout the RhoConnect client.

	:::ruby
	Rhom::Rhom.database_full_reset_and_logout

<a name="database_import"></a>
## database_import
Imports the database and blob objects from a zip archive created with `database_export`. If the imported archive is inconsistent, or other failure occurs during the import process, the original database will be restored.

	:::ruby
	Rhom::Rhom.database_import(partition, path_to_zip)

<table border="1">
<tr>
	<td><code>partition</code></td>
	<td>the local database partition to be replaced by the zip.</td>
</tr>
<tr>
	<td><code>path_to_zip</code></td>
	<td>path to the zip archive created with database_export.</td>
</tr>
</table>

<a name="database_local_reset"></a>
## database_local_reset
Reset only local (non-sync-enabled) models.

	:::ruby
	Rhom::Rhom.database_local_reset

<a name="delete_all"></a>
## delete_all
Delete all Rhodes model objects for a source, filtering by conditions. 

	:::ruby
	modelname.delete_all(:conditions, :op)

<table border="1">
<tr>
	<td><code>:conditions</code></td>
	<td>(optional) hash of attribute/values; delete only objects matching these criteria, such as <code>:conditions => {'industry'=>'electronics'}</code>.</td>
</tr>
<tr>
	<td><code>:op</code></td>
	<td>(optional) operator, such as "OR" or "IN". Allows you to have more than one set of conditions.</td>
</tr>
</table>

<a name="destroy"></a>
## destroy
Destroy a Rhodes model object. 

	:::ruby
	modelname.destroy

### Examples
Deletes all rhom objects for a source, optionally filtering by conditions:<a id="rhom-delete-example" />

	:::ruby
	# :conditions 	Delete only objects matching these criteria. 
	#               Supports find() conditions.
	# :op  			See advanced find syntax
	Account.delete_all(:conditions => {'industry'=>'electronics'})

Delete a rhom object.

	:::ruby
	@account = Account.find(:all).first
	@account.destroy


<a name="find"></a>
## find
Find Rhodes model objects.

	:::ruby
	modelname.find(argument list)

The argument list can consist of the following arguments.

<table border="1">
<tr>
	<td><code>:all</code></td>
	<td>returns all objects; can use optional <code>:conditions</code>.</td>
</tr>
<tr>
	<td><code>:first</code></td>
	<td>returns first object matching <code>:conditions</code>.</td>
</tr>
<tr>
	<td><code>:count</code></td>
	<td>returns the number of objects matching these <code>:conditions</code>.</td>
</tr>
<tr>
	<td><code>:conditions</code></td>
	<td>(optional) hash of attribute/values. Also supports sql fragments (i.e. "name like 'rhomobile'") or sql fragment with binding (you have to define :select with sql queries) (i.e. ["name like ?", "'#{company#}'"]) Use a comma around string values.</td>
</tr>
<tr>
	<td><code>:order</code></td>
	<td>(optional) attribute(s) to order the list.</td>
</tr>
<tr>
	<td><code>:orderdir</code></td>
	<td>(optional) Order direction: 'ASC' ascending, 'DESC' descending. Default = 'ASC'.)</td>
</tr>
<tr>
	<td><code>:select</code></td>
	<td>(optional) array of string attributes to return with the object. Useful if your model has many attributes and your query only needs a few of them.</td>
</tr>
<tr>
	<td><code>:per_page</code></td>
	<td>(optional) maximum number of items to return.</td>
</tr>
<tr>
	<td><code>:offset</code></td>
	<td>(optional) offset from beginning of the list.</td>
</tr>
<tr>
	<td><code>:op</code></td>
	<td>(optional) operator, such as "OR" or "IN". Allows you to have more than one set of conditions.</td>
</tr>
</table>

### Examples
Find Rhom objects.<a id="rhom-find-example" />. Also see [Advanced queries](#advanced-queries)

	:::ruby
	acct = Account.find "3560c0a0-ef58-2f40-68a5-48f39f63741b"
	
	acct.name 
	  #=> "A.G. Parr PLC 37862"

	accts = Account.find(:all, :select => ['name','address'])
	
	accts[0].name 
	  #=> "A.G. Parr PLC 37862"
	
	accts[0].telephone 
	  #=> nil

**NOTE: Use SQL fragments with caution. They are considerably slower than advanced queries [described below](#advanced-queries). You also have to specify :select parameter.**

#### Order Examples
The `:order` argument for `find` accepts several forms.

`:order` by one attribute.

  		:::ruby
		@accts = Account.find(
		  :all, 
		  :order => 'name',
		  :orderdir => 'DESC'
		)

`:order` by one attribute with a block.

    	:::ruby
		@accts = Account.find(:all, :order => 'name') do |x,y|
	      y <=> x    
	    end

`:order` with a block.

    	:::ruby
		@accts = Account.find(:all) do |item1,item2|
	      item2.name <=> item1.name
	    end

`:order` by multiple attributes.

    	:::ruby
		@accts = Account.find(
		  :all, 
	      :order => ['name', 'industry'], 
	      :orderdir => ['ASC', 'DESC']
 		)

`find_by_sql(sql_query)` returns rhom object(s) based on sql_query. This method works only for schema models.<a id="rhom-findsql-example" />

    :::ruby
    @accts = Account.find_by_sql("SELECT * FROM Account")


<a name="find_all"></a>
## find_all
Alias for modelname.find(:all, argument list).

<a name="find_by_sql"></a>
## find_by_sql
Returns Rhodes model object(s) based on sql_query. This method works only for schema models. 

	:::ruby
	modelname.find_by_sql(sql_query)

<table border="1">
<tr>
	<td><code>sql_query</code></td>
	<td>An sql query, such as <code>"SELECT * FROM Account"</code>.</td>
</tr>
</table>

<a name="get_source_id"></a>
## get_source_id
Returns the source id number for this Rhodes model object.

	:::ruby
	modelname.get_source_id

<a name="get_source_name"></a>
## get_source_name
Returns the source name for this Rhodes model object.

	:::ruby
	modelname.get_source_name

<a name="metadata"></a>
## metadata
Returns the [metadata definition](../rhoconnect/metadata#metadata-definition) for a given model as a hash. 

	:::ruby
	Product.metadata
	#=> {'foo' => 'bar'}

### Example
Returns the [metadata](../rhoconnect/metadata) for a given model.<a id="rhom-metadata-example" />

	:::ruby
	Product.metadata
	#=> {'foo' => 'bar'}

Assigns the [metadata](../rhoconnect/metadata) for a given model.

	:::ruby
	Product.metadata = { 'foo' => 'bar' }.to_json
	
<a name="metadata_def"></a>
## metadata=(metadata_def)
Assigns the JSON [metadata definition](../rhoconnect/metadata#metadata-definition) for a given model. 

	:::ruby
	Product.metadata = { 'foo' => 'bar' }.to_json

<table border="1">
<tr>
	<td><code>metadata_def</code></td>
	<td>JSON string of the metadata definition</td>
</tr>
</table>

<a name="new"></a>
## new
Create a new Rhodes model object. 
	:::ruby
	modelname.new(attributes)

<table border="1">
<tr>
	<td><code>attributes</code></td>
	<td>List of attributes assigned to the new model object, such as <code>{"name" => "ABC Inc.","address" => "555 5th St."}</code>.</td>
</tr>
</table>

### Example
Create a new rhom object and assign given attributes.<a id="rhom-new-example" />

	:::ruby
	@account = Account.new(
	  {"name" => "ABC Inc.","address" => "555 5th St."}
	)
	@account.name 
	  #=> "ABC Inc."

<a name="paginate"></a>
## paginate
Call `find` with a limit on the number of records. Default page size is 10.

	:::ruby
	modelname.paginate(*arguments)

The *arguments you can use are:

<table border="1">
<tr>
	<td><code>:page</code></td>
	<td>which page to return.</td>
</tr>
<tr>
	<td><code>:per_page</code></td>
	<td>with :page (used as offset), the number of records to return, such as <code>:page => 1, :per_page => 20</code>
</tr>
<tr>
	<td><code>:conditions</code></td>
	<td>same as find with <code>:conditions</code></td>
</tr>
<tr>
	<td><code>:order</code></td>
	<td>same as find with <code>:order</code></td>
</tr>
<tr>
	<td><code>:select</code></td>
	<td>same as find with <code>:select</code></td>
</tr>
</table>

### Example
Paginate calls `find` with a limit on the # of records. This emulates rails' classic pagination syntax. Default page size is 10.<a id="rhom-paginate-example" />
	
	Account.paginate(:page => 0) 
	  #=> returns first 10 records
	Account.paginate(:page => 1, :per_page => 20) 
	  #=> returns records 21-40
	Account.paginate(
	  :page => 5, 
	  :conditions => {'industry' => 'Technology'}, 
	  :order => 'name'
	) #=> you can have :conditions and :order as well

<a name="push_changes"></a>
## push_changes
Force the sending of local changes to the RhoConnect server.

NOTE: This method is available in Ruby only.

	:::ruby
	modelname.push_changes()

This method can be used even when there are no pending changes, to artificially put the client into a state where it sends a POST request to the server on the next sync (even if it is an empty sync). An empty POST method is useful because if there is something left in the CRUD queue in the server, it will be forced to be processed. For example:

1. Five records are created on the client.
2. 1st sync, five records are sent to RhoConnect, all of those records are marked as sent on the client.
3. RhoConnect starts processing the records on the server and 3rd record is thrown out (for some reason) by the back-end.
4. RhoConnect sends 1st & 2nd record as processed and also sends `create-error` with 3rd record and PUSHES remaining records, 4th & 5th, back into the server queue.
5. After that, if you choose to use the `:delete` action, there are no more pending changes on the client. The 4th & 5th records were sent and no error was received, so the client assumes it will receive the records later, maybe as a postponed job.
6. So, if you just trigger Sync now on the client, the 4th & 5th records won't be processed on server still because, in order to process the queue there should be a POST method and Sync will send POST method **only** if there are new changes and, as it stands, there are none.
7. So, to force the server to process the remainder of the queue, you can use the `push_changes` method. This will force a POST method to be sent in the next sync (even if there are no changes) and will, in turn, force queue to be processed on the server.

<a name="sync"></a>
## sync
Start the sync process for a Rhodes model.

	:::ruby
	modelname.sync(callback_url, callback_data, show_status_popup, query_params)

<table border="1">
<tr>
	<td><code>callback_url</code></td>
	<td>the url for the sync callback method. If this is used, SyncEngine.set_notification is called before SyncEngine.dosync.</td>
</tr>
<tr>
	<td><code>callback_data</code></td>
	<td>Data for the callback method.</td>
</tr>
<tr>
	<td><code>show_status_popup</code></td>
	<td>true if you want to show a popup window upon sync, false otherwise.</td>
</tr>
<tr>
	<td><code>query_params</code></td>
	<td>Optional. a query to pass to the sync server. The query_params value must be URL encoded.</td>
</tr>
</table>

### Example
Start the sync process for a model. In this example, the value for @params["sku"] -- the value of the sku -- must be URL encoded.<a id="rhom-sync-example" />
	
	:::ruby
	Product.sync( url_for(:action => :sync_callback), "", false, "query=#{@params["sku"]}" )

Set a notification to be called when the sync is complete for this model. This is useful for example if you want to refresh the current list page or display an alert when new data is synchronized. See the [sync notification docs](../guide/using_rhoconnect#setting-up-notifications) for more information.

	:::ruby
	Account.set_notification( url_for(:action => :sync_notify), "")

<a name="save"></a>
## save
Saves the current Rhodes model object to the database. 
	:::ruby
	modelname.save

<a name="set_notification"></a>
## set_notification
Set a notification to be called when the sync is complete for this model. 

	:::ruby
	modelname.set_notification(callback_url, params)

<table border="1">
<tr>
	<td><code>callback_url</code></td>
	<td>the url for your sync is finished notification callback method.</td>
</tr>
<tr>
	<td><code>params</code></td>
	<td>parameters for the callback method.</td>
</tr>
</table>

<a name="update_attributes"></a>
## update_attributes
Updates the current Rho model object attributes and saves it to the database. This is the fastest way to add or update model attributes. 

	:::ruby
	modelname.update_attributes(attributes)

<table border="1">
<tr>
	<td><code>attributes</code></td>
	<td>List of attributes and their updated values, such as <code>{"name" => "ABC Inc.","address" => "555 5th St."}</code>.</td>
</tr>
</table>

### Example
Update the current rhom object's attributes and saves it to the database.<a id="rhom-update-example"/>

**NOTE: This is the fastest way to add or update item attributes.**

	:::ruby
	@account = Account.find(
	  :all, 
	  :conditions => {'name' => 'ABC Inc.'}
	)
	@account.update_attributes(
	  {"name" => "ABC Inc.", "industry" => "Technology"}
	)
	@account.industry   
	  #=> "Technology"

Saves the current rhom object to the database.<a id="rhom-save-example"/>

	:::ruby
	@account = Account.new(
	  {"name" => "some new record", "industry" => "electronics"}
	)
	@account.save

<a name="Advanced"></a>
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

<a name="Find"></a>
## Find by numeric field
To use number comparison conditions in find use CAST :

    :::ruby
    @accts = Account.find(:all, 
        :conditions => { {:func=> 'CAST', :name=>'rating as INTEGER', :op=>'<'} => 3 } )
    #or using sql query:
    size = 3
    @accts = Account.find(:all, 
        :conditions => ["CAST(rating as INTEGER)< ?", "#{size}"], :select => ['rating'] )