# Migrating your application to RhoConnect 5.0
The best way of migrating your old RhoConnect app to Rhoconnect 5.0+ is to re-generate the application skeleton
using Rhoconnect, then integrate all of your implementation specifics into it.
However, if you prefer to migrate your RhoConnect app manually, perform the steps in this document.

## Upgrading dependency manifest

Open the `Gemfile` of your application and find the `rhoconnect` line, it should look something like:

	:::ruby
	gem 'rhoconnect', '3.4.4'

Change this to the latest release version, which you can find on [rubygems.org](http://rubygems.org/gems/rhoconnect), for example if it is 5.0.1:

	:::ruby
	gem 'rhoconnect', '4.0.1'

Run the following command from the root application directory:

	:::term
	$ bundle install

Now update your application's RhoConnect dependency manifest:

	:::term
	$ rhoconnect update

## Migrating application files

If you have an existing RhoConnect application using version < 5.0 and want to upgrade it to RhoConnect 5.0+, then
you need to update the `Gemfile` file to properly use the latest RhoConnect runtime dependencies.

First, follow the instructions described in the [previous section](migration#upgrading-dependency-manifest).

Next, make sure your `Gemfile` looks like the following example, replacing the version as necessary.
The `rhoconnect update` command will generate a reference `Gemfile.new` which you can use to replace your `Gemfile`:

	:::ruby
	source 'http://rubygems.org'

	gem 'rhoconnect', '<put correct version here>'
	gemfile_path = File.join(File.dirname(__FILE__), ".rcgemfile")

	begin
		eval(IO.read(gemfile_path))
	rescue Exception => e
		puts "ERROR: Couldn't read RhoConnect .rcgemfile"
		puts e.message
		exit 1
	end

	# DON'T FORGET to add your application specific gems after this line ...
	# ...

You must update `config.ru`, `Rakefile`, 'application.rb' and your source adapter files to match RhoConnect 5.0+ gem requirements.

Replace your existing `config.ru` with the listing below. Save your old `config.ru` since you will use values within it in the new `config.ru`.

	:::ruby
	# config.ru file

	#!/usr/bin/env ruby
	require 'rhoconnect/application/init'

	# secret is generated along with the app
	# NOTE:
	# Substitute 'REPLACE_ME' string by the Rhoconnect::Server.set :secret value from your old config.ru
	Rhoconnect::Server.set     :secret, 'REPLACE_ME'

	# !!! Add your custom initializers and overrides here !!!
	# For example, uncomment the following line to enable Stats
	#Rhoconnect::Server.enable  :stats
	# uncomment the following line to disable Resque Front-end console
	#Rhoconnect.disable_resque_console = true
	# uncomment the following line to disable Rhoconnect Front-end console
	#Rhoconnect.disable_rc_console = true

	# run RhoConnect Application
	run Rhoconnect.app

And replace your existing `Rakefile` with the following:

	:::ruby
	require 'rubygems'
	require 'bundler/setup'
	require 'rhoconnect'
	require 'resque/tasks'

	ROOT_PATH = File.expand_path(File.dirname(__FILE__))

	task 'resque:setup' do
	  # The number of redis connections you want a job to have
	  Rhoconnect.connection_pool_size = 1
	  require 'rhoconnect/application/init'

	  Resque.after_fork do
	    Store.reconnect
	  end
	end

Move your existing `application.rb` file into `controllers/ruby/application_controller.rb` and update it with the following:

	:::ruby
	class ApplicationController < Rhoconnect::Controller::AppBase
  		register Rhoconnect::EndPoint

  		post "/login", :rc_handler => :authenticate,
                 :deprecated_route => {:verb => :post, :url => ['/application/clientlogin', '/api/application/clientlogin']} do
    		login = params[:login]
    		password = params[:password]
    		<INSERT YOUR AUTHENTICATION CODE HERE>
  		end

  		get "/rps_login", :rc_handler => :rps_authenticate,
        	            :login_required => true do
    		login = params[:login]
    		password = params[:password]
    		<INSERT YOUR RPS AUTHENTICATION CODE HERE>
  		end

  		# <.... PLACE HERE ALL OF YOUR EXISTING APPLICATION CODE ...>
	end

NOTE: You must remove `initializer` method from the ApplicationController class. It is no longer supported.

NOTE: If you had `store_blob` method overridden in the `application.rb` file - you will need to move it into the corresponding model class. Global `store_blob` method is no longer supported.
See below for details.

Re-generate your sources by running 'rhoconnect source YOUR_SOURCE' command for all of your application sources. This will create source's controller files in the `controllers/ruby` directory
and source's model files in the `models/ruby` directory. After that, move your existing files from the `sources` directory into the `models/ruby` directory, replacing the generated model files.
Then, modify every file to make sure that your SourceAdapter classes now derive from the `Rhoconnect::Model::Base` class - SourceAdapters now became Models:

	:::ruby
	class Product < Rhoconnect::Model::Base
		# .... rest of your code
	end

If you had global `store_blob` method in the `application.rb` file - you need to move it into every model's class that supports blobs:

	:::ruby
	class Product < Rhoconnect::Model::Base
		# ... your code here ....
		def store_blob(object, field, blob)
			<YOUR_STORE_BLOB_IMPLEMENTATION>
		end
	end

If you had source spec files in the `spec/sources` directory - you will need to move them into `spec/models/ruby` directory and adjust the top line of each spec file:

	:::ruby
	require File.join(File.dirname(__FILE__),'..','..','spec_helper')


Finally, run `bundle install` to install any missing dependencies in your RhoConnect directory:

	:::term
	$ bundle install

### Updating client application
RhoConnect's HTTP routes have changed starting with 5.0, so you'll want to update your client application's `rhoconfig.txt` to drop the trailing `/application`, for example:


	# sync server url, typically this will look like 'http://<hostname>:<port>'
	# for example: 'http://localhost:9292'
	syncserver = 'http://192.168.1.108:9292'

Next, modify your client application according to the new [client API docs](../api/RhoConnectClient).  Be sure to check out the [guides](../guide/using_rhoconnect) periodically as new content is added all the time.
