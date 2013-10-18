# Preparing App for Production
By default your RhoConnect application generates a few files that you should be familiar with and understand the settings.

## config.ru
This rackup file contains runtime configuration for the RhoConnect sinatra application:
	
	:::ruby
	Rhoconnect::Server.disable :run
	Rhoconnect::Server.disable :clean_trace
	Rhoconnect::Server.enable  :raise_errors
	Rhoconnect::Server.set     :secret,      '<changeme>'
	Rhoconnect::Server.set     :root,        ROOT_PATH
	Rhoconnect::Server.use     Rack::Static, :urls => ["/data"], :root => Rhoconnect::Server.root
	
The important setting here `:secret` you will want to change.  `:secret` should be set to a long random string, it ___should not___ be set to a dictionary word or short string (30 characters or more is sufficient).  This is used for the session storage using a digest algorithm as described [here](http://guides.rubyonrails.org/security.html#session-storage).

If you don't change the `:secret` setting, RhoConnect automatically warns you each time the application starts:

 	[11:34:56 AM 2011-01-12] ************************************************************

	[11:34:56 AM 2012-01-12] WARNING: Change the session secret in config.ru from <changeme> to something secure.
	[11:34:56 AM 2012-01-12]   i.e. running `rhoconnect secret` in your app will generate a secret you could use.

	[11:34:56 AM 2011-01-12] ************************************************************
	

As this warning states, a good way to generate a cryptographically secure secret is by running `rhoconnect secret` in your RhoConnect application.

	:::term
	$ cd storemanager-server
	$ rhoconnect secret
	040a2355475e9d0fb591ef78d5b9ca61a34cbcfd3f11942b18bc1d91f1ca66c27b2e0386333843a7efa29f40fff03624cd908d0883364ffbfa3208ab23fa2664
	
Then plug this secret into your `config.ru`:

	:::ruby
	Rhoconnect::Server.set     :secret, '040a2355475e9d0fb591ef78d5b9ca61a34cbcfd3f11942b18bc1d91f1ca66c27b2e0386333843a7efa29f40fff03624cd908d0883364ffbfa3208ab23fa2664'
 
To run RhoConnect in production mode, use `RACK_ENV` environment variable set to "production".  This ensures RhoConnect will use the `:production` section of the settings.  For example:

	:::term
	$ thin start -e production -p 9292

Will start thin in with `RACK_ENV` set to "production".  

NOTE: If you deploy using passenger or on RhoHub, this variable is automatically set to production.

### Asynchronous processing

RhoConnect version 3.2.x introduces a new feature which enables asynchronous processing of the incoming requests to improve the responsiveness of the Rhoconnect application using EventMachine, Fibers API, and Rack Fiber Pool. This new feature is available with Ruby 1.9.x and enabled by default. It is not available with Ruby 1.8.7, JRuby and REE.
To disable the feature and revert back to synchronous handling, you can use the following options in the `config.ru` file: 

    :::ruby
    Rhoconnect::Server.set     :use_async_model, false # true by default

By default, the Rhoconnect application is started with Rack FiberPool's size equal to 100 and EventMachine's thread pool size set to 20. To adjust those settings you can use the following options: 

	:::ruby
	# adjust the Rack FiberPool size
    Rhoconnect::Server.set     :fiberpool_size, 50     # default is 100

	# adjust the EventMachine Thread Pool size
	EventMachine.threadpool_size = 25 # default is 20


## settings/settings.yml
This file contains all source adapter options and settings, such as the redis server connection. Before deploying to production, make sure you have the appropriate production settings. A complete list of the settings is in the [RhoConnect Settings chapter](settings). Some sample settings for production are shown below. In this sample, the `poll_interval` setting was auto-generated for a source adapter named Product.

	:::yaml
	:sources: 
	  Product: 
	    :poll_interval: 300

	:production: 
	  :redis: myredishost:6379
	  :licensefile: settings/license.key
	  :syncserver: http://localhost:9292/application/

## settings/license.key
This contains your RhoConnect license key text.  By default, a RhoConnect application comes with a 10 device license.  Please see the [licensing page](licensing) for more details.


