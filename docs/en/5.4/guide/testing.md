# Testing
## Adding Unit Tests
When you [generate a model](rhom_ruby#creating-a-ruby-data-model), you get an _spec.rb file generated along with your controller. You would get the following for a model named "Person".

	Generating with model generator:
	....
	[ADDED]  app/test/person_spec.rb

This file contains tests for your controller and is in the mspec format: [rubyspec.org](http://rubyspec.org/) 

	:::ruby
	describe "Person" do
	  #this test always fails, you really should have tests!

	  it "should have tests" do
	    true.should == false
	  end
	end

We use this test format internally as well. You can see our specs for the core framework [here](http://github.com/rhomobile/rhodes/tree/1.4.0/spec/framework_spec/app/spec/) which use many functions of mspec.

To run these tests however, you need the testing framework to be included in your app. To add this, you would run the rhogen task in your application folder:

	:::term
	$ rhogen spec

You will then see the mspec framework added to your application:

	Generating with spec generator:
	     [ADDED]  app/SpecRunner
	     [ADDED]  app/mspec.rb
	     [ADDED]  app/spec_runner.rb

**NOTE: You can also [create the mspec framework and run the test on applications within RhoStudio](../../2.2.0/rhostudio.tutorial#running-a-unit-test-in-rhostudio).**

Finally, add the fileutils and mspec extensions to your build.yml:
	
	extensions: ["fileutils", "mspec"]

You are now ready to run the tests. Simply add a link to the SpecRunner controller, and you will get a summary of number of passing/failing tests

In your index.erb:
	:::html
	<li><a href="SpecRunner">Run tests</a></li>

A summary of the results will be displayed on the screen.

Detailed results will be displayed in your rholog.txt:

	I 01/15/2010 16:36:33 b0185000                  APP| FAIL: Product - Expected true
	 to equal false

	apps/app/mspec/expectations/expectations.rb:15:in `fail_with'
	apps/app/mspec/matchers/base.rb:8:in `=='
	apps/app/Product/product_spec.rb:5:in `block (2 levels) in <main>'
	...

And finally, a summary will be printed in rholog.txt as well:

	I 01/15/2010 16:36:33 b0185000                  APP| ***Total:  3
	I 01/15/2010 16:36:33 b0185000                  APP| ***Passed: 1
	I 01/15/2010 16:36:33 b0185000                  APP| ***Failed: 2

## Disabling tests
When you are ready to do a production build of your application, change build.yml's build property to 'release' and the specs will not be included in the binary:

	...
	vendor: Acme, Inc.
	build: release
	...