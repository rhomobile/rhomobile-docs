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
Closes the database. The database will not be accessible until it is opened again.

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
Commit database transaction. Saves all updates to the database from the start of the transaction.

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
Destroys a database table.

####Parameters
<ul><li>tableName : <span class='text-info'>STRING</span><p>Table name to destroy. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

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
Destroy a list of database tables.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p> </p></li><ul><li>include : <span class='text-info'>ARRAY</span><p>Include tables. </p></li><li>exclude : <span class='text-info'>ARRAY</span><p>Exclude tables. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

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
Execute a series of sql statements included in the sqlStmt string parameter.

####Parameters
<ul><li>sqlStmt : <span class='text-info'>STRING</span><p>The SQL statement. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

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
Execute the sql statement specified in the method's parameters.

####Parameters
<ul><li>sqlStmt : <span class='text-info'>STRING</span><p>The SQL statement. </p></li><li>args : <span class='text-info'>ARRAY</span> <span class='label label-info'>Optional</span><p>Array of the sql expressions. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul></ul>

####Returns
Synchronous Return:

* ARRAY : Array of Hashes. Each Hash item represents record from Database.

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.executeSql(<span class="text-info">STRING</span> sqlStmt, <span class="text-info">ARRAY</span> args)</code>

### <span class="label label-inverse"> Constructor</span>  new EB.Database(<span class="text-info">STRING</span> dbPath, <span class="text-info">STRING</span> dbPartition)
This method is a constructor for this class. Instead of saying `EB.Database.initialize(dbPath,dbPartition)` you would use `new EB.Database(dbPath,dbPartition). ex: `var db = new EB.Database(EB.Application.databaseFilePath('test'), 'test');` Make sure you issue a `.close()` when you are finished using the database. If the database file does not exist it will be created using a default SQL schema. Do not use predefined partition names: app, user, local. Do not open the same database file in different partitions. Do not use the same partition for different database files. Do not open the same file twice.

####Parameters
<ul><li>dbPath : <span class='text-info'>STRING</span><p>The path to the database. Databases stored at the path provided by Application.databaseFilePath. </p></li><li>dbPartition : <span class='text-info'>STRING</span><p>The database partition. Used as a file name for database and when connecting to RhoConnect server. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

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
Will return true or false if the specified table exists in the current database.

####Parameters
<ul><li>tableName : <span class='text-info'>STRING</span><p>The name of the table. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

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
Rollback database transaction. This will cancel any pending actions to the database that were executed since the last Start and before a commit.

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
Start database transaction. All operations will not be the saved to the database until a commit is executed.

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