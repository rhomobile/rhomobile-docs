#Database


## Overview
Database is low-level API to access SQLite local database.
## Enabling the API
In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* ebapi-modules.js - this file contains all available Enterprise Browser APIs

If you wish to minimize the amount of JavaScript being included, you can choose to only include the individual API that your application is using:

ex:

* ebapi.js - core APIs needed 
* eb.database.js - just the Database API
* eb.database.sqlite3.js - just the Database API
* other individual JavaScript files included with the Enterprise Browser installation

        


##Methods



### <span class="label label-inverse"> Destructor</span> close()
<p>Closes the database. The database will not be accessible until it is opened again.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method is a destructor and can only be accessed via the object that was created by the `new` constructor. 
	* <code>myObj.close()</code>


### commitTransaction()
<p>Commit database transaction. Saves all updates to the database from the start of the transaction.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.commitTransaction()</code>

### destroyTable(<span class="text-info">STRING</span> tableName)
<p>Destroys a database table.</p>


####Parameters
<ul><li>tableName : <span class='text-info'>STRING</span><p>
<p>Table name to destroy.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.destroyTable(<span class="text-info">STRING</span> tableName)</code>

### destroyTables(<span class="text-info">HASH</span> propertyMap)
<p>Destroy a list of database tables.</p>


####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p> </p></li><ul><li>include : <span class='text-info'>ARRAY</span><p>
<p>Include tables.</p>
 </p></li><li>exclude : <span class='text-info'>ARRAY</span><p>
<p>Exclude tables.</p>
 </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.destroyTables(<span class="text-info">HASH</span> propertyMap)</code>

### executeBatchSql(<span class="text-info">STRING</span> sqlStmt)
<p>Execute a series of sql statements included in the sqlStmt string parameter.</p>


####Parameters
<ul><li>sqlStmt : <span class='text-info'>STRING</span><p>
<p>The SQL statement.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.executeBatchSql(<span class="text-info">STRING</span> sqlStmt)</code>

### executeSql(<span class="text-info">STRING</span> sqlStmt, <span class="text-info">ARRAY</span> args)
<p>Execute the sql statement specified in the method&rsquo;s parameters.</p>


####Parameters
<ul><li>sqlStmt : <span class='text-info'>STRING</span><p>
<p>The SQL statement.</p>
 </p></li><li>args : <span class='text-info'>ARRAY</span> <span class='label label-info'>Optional</span><p>
<p>Array of the sql expressions.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul></ul>

####Returns
Synchronous Return:

* ARRAY : 
<p>Array of Hashes. Each Hash item represents record from Database.</p>


####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.executeSql(<span class="text-info">STRING</span> sqlStmt, <span class="text-info">ARRAY</span> args)</code>

### <span class="label label-inverse"> Constructor</span>  new EB.Database(<span class="text-info">STRING</span> dbPath, <span class="text-info">STRING</span> dbPartition)
<p>This method is a constructor for this class. Instead of saying <code>EB.Database.initialize(dbPath,dbPartition)</code> you would use <code>new EB.Database(dbPath,dbPartition). ex:</code>var db = new EB.Database(EB.Application.databaseFilePath(&lsquo;test&rsquo;), &lsquo;test&rsquo;);<code>Make sure you issue a</code>.close()` when you are finished using the database. If the database file does not exist it will be created using a default SQL schema. Do not use predefined partition names: app, user, local. Do not open the same database file in different partitions. Do not use the same partition for different database files. Do not open the same file twice.</p>


####Parameters
<ul><li>dbPath : <span class='text-info'>STRING</span><p>
<p>The path to the database. Databases stored at the path provided by Application.databaseFilePath.</p>
 </p></li><li>dbPartition : <span class='text-info'>STRING</span><p>
<p>The database partition. Used as a file name for database and when connecting to RhoConnect server.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method is a constructor and can only be accessed via the `new` construct. 
	* <code>var myObj = new EB.Database(<span class="text-info">STRING</span> dbPath, <span class="text-info">STRING</span> dbPartition)</code>


### isTableExist(<span class="text-info">STRING</span> tableName)
<p>Will return true or false if the specified table exists in the current database.</p>


####Parameters
<ul><li>tableName : <span class='text-info'>STRING</span><p>
<p>The name of the table.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:

* BOOLEAN

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.isTableExist(<span class="text-info">STRING</span> tableName)</code>

### rollbackTransaction()
<p>Rollback database transaction. This will cancel any pending actions to the database that were executed since the last Start and before a commit.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.rollbackTransaction()</code>

### startTransaction()
<p>Start database transaction. All operations will not be the saved to the database until a commit is executed.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.startTransaction()</code>