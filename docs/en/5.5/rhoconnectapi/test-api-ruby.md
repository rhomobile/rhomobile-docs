# Source Adapter Test API

The test API allows you to spec test your RhoConnect source adapter application.

## setup_test_for

Initializes the source adapter under test for a given user, typically in a before(:each) block. Refer to [Example of setup_test_for](../rhoconnect/testing#example-of-setuptestfor) for an example.

	:::ruby
	setup_test_for(adapter,user_id)

<table border="1">
<tr>
	<td><code>adapter</code></td>
	<td>The name of the source adapter.</td>
</tr>
<tr>
	<td><code>user_id</code></td>
	<td>The name of the user.</td>
</tr>
</table>

## test_query

Executes the adapter's query method and returns the master document (:md) stored in redis. Refer to [Example of test_query](../rhoconnect/testing#example-of-testquery) for an example.

	:::ruby
	test_query

## query_errors

Returns any errors stored in redis for the previous source adapter query. Refer to [Example of query_errors](../rhoconnect/testing#example-of-queryerrors) for an example.

	:::ruby
	query_errors

## test_create

Executes the adapter's create method with a provided record and returns the object string from the create method. If the create method returns a string, then a link will be saved for the device next time it synchronizes. Refer to [Example of test_create](../rhoconnect/testing#example-of-testcreate) for an example.

	:::ruby
	test_create(record)

<table border="1">
<tr>
	<td><code>record</code></td>
	<td>a local database partition.</td>
</tr>
</table>

## create_errors

Returns the result of the adapter's create method. The master document (:md) should also contain the new record. Returns any errors stored in redis from the previous source adapter create (same structure as query errors).

	:::ruby
	create_errors

## test_update

Execute the source adapter's update method. Refer to [Example of test_update](../rhoconnect/testing#example-of-testupdate) for an example.

	:::ruby
	test_update(record)

<table border="1">
<tr>
	<td><code>record</code></td>
	<td>A record as hash of hashes (object_id => object).</td>
</tr>
</table>

## update_errors

Returns any errors stored in redis from the previous source adapter update (same structure as query errors).

	:::ruby
	update_errors

## test_delete

Execute the source adapter’s delete method. Takes a record as hash of hashes (object_id => object). Refer to [Example of test_delete](../rhoconnect/testing#example-of-testdelete) for an example.

	:::ruby
	test_delete(record)

<table border="1">
<tr>
	<td><code>record</code></td>
	<td>A record as hash of hashes (object_id => object).</td>
</tr>
</table>

## delete_errors

Returns any errors stored in redis from the previous source adapter delete (same structure as query errors). Refer to [Example of test_delete](../rhoconnect/testing#example-of-testdelete) for an example.

	:::ruby
	delete_errors

## md

Returns the master document (:md) for the source adapter stored in redis. This is equivalent to the @result hash of hashes structure. Refer to [Example of md](../rhoconnect/testing#example-of-md) for an example.

	:::ruby
	md

## cd

Returns the client document (:cd) for the source adapter + client under test. The master document (:md) and client document (:cd) should be equal after the query is executed. Refer to [Example of cd](../rhoconnect/testing#example-of-cd) for an example.

	:::ruby
	cd