#Database


## Overview
Database is low-level API to access SQLite local database.This API used internally by RHOM. To use RHOM, just define your models and partition databases will be created automatically.
## Enabling the API           
This API is part of the `coreapi` extension that is included automatically.
    :::ruby
    extensions: ["coreapi"]

## JavaScript Usage
Be sure to review the [JavaScript API Usage](/guide/api_js) guide for important information about using this API in JavaScript.

## Ruby Usage
Be sure to review the [Ruby API Usage](/guide/api_ruby) guide for important information about using this API in Ruby.
    


##Methods



### <span class="label label-inverse"> Destructor</span> close()
Closes the database. The database will not be accessible until it is opened again.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li>Class Method: This method is a destructor and can only be accessed via the object that was created by the `new` constructor. <ul><li><code>myObj.close()</code> </li></ul></li></ul>

### commitTransaction()
Commit database transaction. Saves all updates to the database from the start of the transaction.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.commitTransaction()</code></li></ul></li></ul>

### destroyTable(<span class="text-info">STRING</span> tableName)
Destroys a database table.

####Parameters
<ul><li>tableName : <span class='text-info'>STRING</span><p>
Table name to destroy. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.destroyTable(<span class="text-info">STRING</span> tableName)</code></li></ul></li></ul>

### destroyTables(<span class="text-info">HASH</span> propertyMap)
Destroy a list of database tables.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p> </p></li><ul><li>include : <span class='text-info'>ARRAY</span><p>
Include tables. </p></li><li>exclude : <span class='text-info'>ARRAY</span><p>
Exclude tables. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.destroyTables(<span class="text-info">HASH</span> propertyMap)</code></li></ul></li></ul>

### executeBatchSql(<span class="text-info">STRING</span> sqlStmt)
Execute a series of sql statements included in the sqlStmt string parameter.

####Parameters
<ul><li>sqlStmt : <span class='text-info'>STRING</span><p>
The SQL statement. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.executeBatchSql(<span class="text-info">STRING</span> sqlStmt)</code></li></ul></li></ul>

### executeSql(<span class="text-info">STRING</span> sqlStmt, <span class="text-info">ARRAY</span> args)
Execute the sql statement specified in the method's parameters.

####Parameters
<ul><li>sqlStmt : <span class='text-info'>STRING</span><p>
The SQL statement. </p></li><li>args : <span class='text-info'>ARRAY</span> <span class='label label-info'>Optional</span><p>
Array of the sql expressions. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>ARRAY : 
Array of Hashes. Each Hash item represents record from Database.</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.executeSql(<span class="text-info">STRING</span> sqlStmt, <span class="text-info">ARRAY</span> args)</code></li></ul></li></ul>

### <span class="label label-inverse"> Constructor</span>  new EB.Database(<span class="text-info">STRING</span> dbPath, <span class="text-info">STRING</span> dbPartition)
This method is a constructor for this class. Instead of saying Rho.Database.initialize(dbPath,dbPartition) you would use new Rho.Database(dbPath,dbPartition). ex: `var db = new Rho.Database(Rho.Application.databaseFilePath('test'), 'test');` Make sure you issue a `.close()` when you are finished using the database. If the database file does not exist it will be created using a SQL schema: rhodes\platform\shared\db\res\db\syncdb.schema. Do not use predefined partition names: app, user, local. Do not open the same database file in different partitions. Do not use the same partition for different database files. Do not open the same file twice.

####Parameters
<ul><li>dbPath : <span class='text-info'>STRING</span><p>
The path to the database. Databases stored at the path provided by Rho::Application.databaseFilePath. </p></li><li>dbPartition : <span class='text-info'>STRING</span><p>
The database partition. Used as a file name for database and when connecting to RhoConnect server. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li>Class Method: This method is a constructor and can only be accessed via the `new` construct. <ul><li><code>var myObj = new EB.Database(<span class="text-info">STRING</span> dbPath, <span class="text-info">STRING</span> dbPartition)</code> </li></ul></li></ul>

### isTableExist(<span class="text-info">STRING</span> tableName)
Will return true or false if the specified table exists in the current database.

####Parameters
<ul><li>tableName : <span class='text-info'>STRING</span><p>
The name of the table. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>BOOLEAN</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.isTableExist(<span class="text-info">STRING</span> tableName)</code></li></ul></li></ul>

### rollbackTransaction()
Rollback database transaction. This will cancel any pending actions to the database that were executed since the last Start and before a commit.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.rollbackTransaction()</code></li></ul></li></ul>

### startTransaction()
Start database transaction. All operations will not be the saved to the database until a commit is executed.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.startTransaction()</code></li></ul></li></ul>