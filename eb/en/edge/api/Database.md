#Database


## Overview
<p>Database is low-level API to access SQLite local database.</p>
<p>This API used internally by RHOM. To use RHOM, just define your models and partition databases will be created automatically.</p>

<h2>Enabling the API</h2>

<p>This API is part of the <code>coreapi</code> extension that is included automatically.</p>

<pre><code>:::ruby
extensions: ["coreapi"]
</code></pre>

<h2>JavaScript Usage</h2>

<p>Be sure to review the <a href="/guide/api_js">JavaScript API Usage</a> guide for important information about using this API in JavaScript.</p>

<h2>Ruby Usage</h2>

<p>Be sure to review the <a href="/guide/api_ruby">Ruby API Usage</a> guide for important information about using this API in Ruby.</p>



##Methods



### <span class="label label-inverse"> Destructor</span> close()
Closes the database. The database will not be accessible until it is opened again.

### commitTransaction()
Commit database transaction. Saves all updates to the database from the start of the transaction.

### destroyTable()
Destroys a database table.

### destroyTables()
Destroy a list of database tables.

### executeBatchSql()
Execute a series of sql statements included in the sqlStmt string parameter.

### executeSql()
Execute the sql statement specified in the method's parameters.

### <span class="label label-inverse"> Constructor</span>  new Database()
This method is a constructor for this class. Instead of saying Rho.Database.initialize(dbPath,dbPartition) you would use new Rho.Database(dbPath,dbPartition). ex: `var db = new Rho.Database(Rho.Application.databaseFilePath('test'), 'test');` Make sure you issue a `.close()` when you are finished using the database. If the database file does not exist it will be created using a SQL schema: rhodes\platform\shared\db\res\db\syncdb.schema. Do not use predefined partition names: app, user, local. Do not open the same database file in different partitions. Do not use the same partition for different database files. Do not open the same file twice.

### isTableExist()
Will return true or false if the specified table exists in the current database.

### rollbackTransaction()
Rollback database transaction. This will cancel any pending actions to the database that were executed since the last Start and before a commit.

### startTransaction()
Start database transaction. All operations will not be the saved to the database until a commit is executed.