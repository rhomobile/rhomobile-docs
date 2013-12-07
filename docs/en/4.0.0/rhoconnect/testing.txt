Testing Your RhoConnect Application
===
RhoConnect provides a [spec](http://rspec.info/) framework for [behavior driven development](http://en.wikipedia.org/wiki/Behavior_Driven_Development) of your application.  When your application and source adapters are generated, you will see spec files generated in the top-level 'spec' folder of your application.

## Example Spec

Here is a simple example model spec for the [rhostore product adapter](http://github.com/rhomobile/store-server/blob/master/sources/product.rb):

	:::ruby
	it "should process Product query" do
	  test_query.size.should > 0
	  query_errors.should == {}
	end

This simple spec runs the query method of our product adapter model and verifies the result is greater than one object and has no errors.

The full code listing for this product_spec is available [on github](http://github.com/rhomobile/store-server/blob/master/spec/sources/product_spec.rb).

## Running Specs
From your application's root folder:
	
	:::term
  	$ rhoconnect spec
	[05:51:48 PM 2012-04-19] Rhoconnect Server v4.0.1 started...
	Product
	  it should behave like SpecHelper
	    should process Product query (PENDING: No reason given)
	    should process Product create (PENDING: No reason given)
	    should process Product update (PENDING: No reason given)
	    should process Product delete (PENDING: No reason given)
	Pending:
	  Product it should behave like SpecHelper should process Product query
	  Product it should behave like SpecHelper should process Product create
	  Product it should behave like SpecHelper should process Product update
	  Product it should behave like SpecHelper should process Product delete

	Finished in 0.05877 seconds
	4 examples, 0 failures, 4 pending
	

This will also automatically generate an rcov report under 'coverage' if you have rcov installed (currently only Mac/Linux support rcov).

## Test API

The [RhoConnect Source Adapter Model Test API](../rhoconnectapi/test-api) provides the following methods to perform spec tests.

 * [setup_test_for](../rhoconnectapi/test-api-ruby#setuptestfor) - Executes the adapter's query method and returns the master document.
 * [test_query](../rhoconnectapi/test-api-ruby#testquery) - Executes the adapter's query method and returns the master document.
 * [query_errors](../rhoconnectapi/test-api-ruby#queryerrors) - Returns any errors stored in redis for the previous source adapter query.
 * [test_create](../rhoconnectapi/test-api-ruby#testcreate) - Executes the adapter's create method with a provided record and returns the object string from the create method.
 * [create_errors](../rhoconnectapi/test-api-ruby#createerrors) - Returns the result of the adapter's create method..
 * [test_update](../rhoconnectapi/test-api-ruby#testupdate) - Execute the source adapter's update method.
 * [update_errors](../rhoconnectapi/test-api-ruby#updateerrors) - Returns any errors stored in redis from the previous source adapter update.
 * [test_delete](../rhoconnectapi/test-api-ruby#testdelete) - Execute the source adapter's delete method.
 * [delete_errors](../rhoconnectapi/test-api-ruby#deleteerrors) - Returns any errors stored in redis from the previous source adapter delete.
 * [md](../rhoconnectapi/test-api-ruby#md) - Returns the master document (:md) for the source adapter stored in redis.
 * [cd](../rhoconnectapi/test-api-ruby#cd) - Returns the client document (:cd) for the source adapter + client under test.

## Example of setup_test_for

This example initializes a source adapter model named Product under test for a user named testuser.
	
	:::ruby
	# 'testuser' will be used by rest of the specs
	setup_test_for(Product,'testuser') 

## Example of test_query

The `test_query` method executes the model's query method and returns the master document (:md) stored in redis.

For example, if your source adapter query method was:
	
	:::ruby
	def query(params=nil)
	  @result = { 
	    "1" => { 
		  "name"=>"Acme", 
	      "industry"=>"Electronics"},
	    "2" => { 
		  "name"=>"Best", 
		  "industry"=>"Software"
	    }
	  }
	end

`test_query` would return:
	
	:::ruby
	{ 
	  "1" => { 
		"name" => "Acme", 
		"industry"=>"Electronics"
	  },
	  "2" => { 
		"name" => "Best", 
		"industry" => "Software"
	  }
	}

## Example of query_errors

Returns any errors stored in redis for the previous model's query.

For example:  

	:::ruby
	{ 
	  "query-error" => {
		  "message" => "error connecting to web service!"
	  }
	}

## Example of test_create

The `test_create` method executes the model's create method with a provided record and returns the object string from the create method. If the create method returns a string, then a link will be saved for the device next time it synchronizes.

For example, in your spec:
	:::ruby
	@product = {
	  'name' => 'iPhone',
	  'brand' => 'Apple',
	  'price' => '$299.99',
	  'quantity' => '5',
	  'sku' => '1234'
	}
	new_product_id = test_create(@product)
	create_errors.should == {}
	md[new_product_id].should == @product
 
If you have set [pass through](http://docs.rhomobile.com/rhoconnect/source-adapters#pass-through) to true, the create method will not return a string but instead a json hash of the object ids created.  When testing the id will always be set to 'temp_id'.  

For example, in your spec:
	:::ruby
	@product = {
	  'name' => 'iPhone',
	  'brand' => 'Apple',
	  'price' => '$299.99',
	  'quantity' => '5',
	  'sku' => '1234'
	}
	@s.pass_through = 'true'
	new_product = test_create(@product)
	new_product.should == {'processed' => ["temp-id"]}.to_json

## Example of test_update

This example executes the model's update method, calling the adapter's update method for object_id '4'.
	
	:::ruby
	test_update({'4' => {'price' => '$199.99'}})
	update_errors.should == {}
	test_query
	md[product_id]['price'].should == '$199.99'


**NOTE: To test the master document, you will need to run `test_query` as shown above.**

If you have set [pass through](http://docs.rhomobile.com/rhoconnect/source-adapters#pass-through) to true, the update method will return a json hash of the object id updated.

For example, in your spec:
	:::ruby
	record = {'4'=> { 'price' => '199.99' }}
	@s.pass_through = 'true'
	test_update(record).should == {'processed' => ["4"]}.to_json

## Example of test_delete

This example executes the source model's delete method, calling the adapter's delete method for product '4'.
	
	:::ruby
	@product = {
	  'name' => 'iPhone',
	  'brand' => 'Apple',
	  'price' => '$299.99',
	  'quantity' => '5',
	  'sku' => '1234'
	}
	test_delete('4' => @product)
	delete_errors.should == {}
	md.should == {}
 
**NOTE: The master document (:md) will be updated and can be verified as shown above.**

If you have set [pass through](http://docs.rhomobile.com/rhoconnect/source-adapters#pass-through) to true, the delete method will return a json hash of the object id deleted. You could have the following code in your spec.

	:::ruby
	@product = {
	  'name' => 'iPhone',
	  'brand' => 'Apple',
	  'price' => '$299.99',
	  'quantity' => '5',
	  'sku' => '1234'
	}
	record = {'4'=> { 'price' => '199.99' }}
	@s.pass_through = 'true'
	test_update(record).should == {'processed' => ["4"]}.to_json

## Example of md

The md method returns the master document (:md) for the source adapter model stored in redis. This is equivalent to the @result hash of hashes structure.
	
	:::ruby
	md.should == { 
	  "1" => { 
		"name"=>"Acme", 
		"industry"=>"Electronics"
	  },
	  "2" => { 
		"name"=>"Best", 
		"industry"=>"Software"
	  }
	}

## Example of cd

This example shows that the master document (:md) and client document (:cd) should be equal after the query is executed.

	:::ruby
	test_query.size.should > 0
	md.should == cd
