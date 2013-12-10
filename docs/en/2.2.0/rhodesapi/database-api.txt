# Database API

Access the Rho database. This is a JavaScript implementation of a subset of the [HTML5 WebSQL API](http://www.w3.org/TR/webdatabase/).

## Using JavaScript API

You can call the Database methods from JavaScript. To use the JavaScript API, add the `public/js/rho_javascript_api.js` file -- created at build time as part of the application package -- to the .html, .erb, or .js file calling the JavaScript method.

The JavaScript API methods with a return value can pass it as a parameter in jQuery-compatible continuation (deferred object, a kind of callback). Possible continuations to handle are done, fail, and complete.

	Rho.Class.method(params).done(function(handler) { /* handler... */ })

You must enable JavaScript by putting `rho-javascript` into extensions in your build.yml.

	:::yaml
	extensions: ["rho-javascript"]

You must have a [RhoElements license](../rhoelements/licensing) to use the JavaScript API.

## openDatabase

Opens a database. Returns a database object. Reports any errors on the fail() continuation.

JavaScript syntax:

	Rho.Database.openDatabase(name, version, description, size)

<table border="1">
<tr>
	<td><code>name</code></td>
	<td>String. Name of the database to open.</td>
</tr>
<tr>
	<td><code>version</code></td>
	<td>String. Version number of the database to open.</td>
</tr>
<tr>
	<td><code>description</code></td>
	<td>String. Description of the database to open.</td>
</tr>
<tr>
	<td><code>size</code></td>
	<td>Integer. Size of the database to open.</td>
</tr>
</table>

Sample call:

      function testDatabaseOpen(name, resultContainer) {
          Rho.Database.openDatabase(name, '1.0', 'Test DB', 2 * 1024 * 1024).done(function(db) {
              db.transaction(function (tx) {
                  tx.executeSql("SELECT name,rootpage,type FROM sqlite_master WHERE type=?s",
                      ['table'],
                      function(rows){
                          reportDatabaseResult(resultContainer, rows);
                      });
              });
          });
      }

      function reportDatabaseResult(container, res) {
          container = $(container);
          if ("object" == typeof res && "object" == typeof res[0]) {
              var str = '<table><tr style="text-decoration:underline;">';
              for (fld in res[0]) {
                  str = str+'<th>'+fld+'</th>';
              }
              str = str+'</tr>';
              for (row in res) {
                  str = str+'<tr>';
                  for (fld in res[row]) {
                      str = str+'<td>'+res[row][fld]+'</td>';
                  }
                  str = str+'</tr>';
              }
              str = str+'</table>';
              container.html(str);
          } else {
              container.innerText = 'empty result';
          }
      }

      testDatabaseOpen('rhosimulator/db/syncdbuser', 'div.sqlResult');

## database_object.transaction

Transaction method on the database_object returned by Rho.Database.openDatabase. 

JavaScript syntax:

	database_object.transaction(callback_function(transaction_object))

<table border="1">
<tr>
	<td><code>callback_function</code></td>
	<td>Callback function that you write to receive a transaction object (transaction_object).</td>
</tr>
</table>

## transaction_object.executeSql

Executes an SQL expression on the database.

JavaScript syntax:

	transaction_object.executeSql(sqlExpression, values, callback_function(resultRows))

<table border="1">
<tr>
	<td><code>sqlExpression</code></td>
	<td>String. SQL expression.</td>
</tr>
<tr>
	<td><code>values</code></td>
	<td>Array of values.</td>
</tr>
<tr>
	<td><code>callback_function</code></td>
	<td>Callback function that you write to receive an array of rows (resultRows).</td>
</tr>
</table>

## transaction_object.commit

Commit the database transaction. 

JavaScript syntax:

	transaction_object.commit()

## transaction_object.rollback

Rollback the transaction on the database. 

JavaScript syntax:

	transaction_object.rollback()