Generating a RhoConnect Application
===

You can generate a RhoConnect app with RhoStudio or with the `rhoconnect` utility command line tool.

## Generating a RhoConnect App with RhoStudio

In RhoStudio, select File->New->Project...

The New Project window opens. Select the RhoConnect application wizard and click the Next button.

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect-tutorial/new-project-rhoconnect.png"/>

Enter the name for your RhoConnect application in Project name. You may specify a specific folder for your destination where your project is stored, by default, the destination is your RhoStudio workspace folder. Then press the Finish button.

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect-tutorial/rhoconnect-application-wizard.png"/>

## Generating a RhoConnect App from the Command Line

The `rhoconnect` utility is a command line tool for generating RhoConnect applications and source adapters.

The app name is passed as a parameter.  The `rhoconnect` utility will generate a directory for your application with all the necessary files to get started.  We will start with running `rhoconnect help app` to see the usage:

	:::term
	Usage:
		rhoconnect app NAME

	Generates a new rhoconnect application.

For example:

	:::term
	$ rhoconnect app storeserver
	Generating with app generator:
			 [ADDED]  storeserver/config.ru
			 [ADDED]  storeserver/settings/settings.yml
			 [ADDED]  storeserver/settings/license.key
			 [ADDED]  storeserver/application.rb
			 [ADDED]  storeserver/Rakefile
			 [ADDED]  storeserver/Gemfile
			 [ADDED]  storeserver/spec/spec_helper.rb

Here's a basic rundown of each of the files that were just generated:


* **config.ru** - This is a rackup file which will load your application.  RhoConnect uses the excellent [sinatra](http://www.sinatrarb.com/) web framework to run the application.
* **settings/settings.yml** - This contains settings such as your redis connection, which source adapters exist and their parameters.  You can also put custom settings here.
* **settings/license.key** - The RhoConnect [license](licensing) associated with your application.  The default license allows up to 10 devices to synchronize with the application.
* **application.rb** - The RhoConnect application class where you can implement authentication.  You can also add other custom methods here to use in your application.  This class is a singleton, so all methods should be added to the `class << self` block.
* **Rakefile** - This contains tasks that can be run from the terminal.
* **Gemfile** - This file specifies application's dependencies using [bundler](http://gembundler.com/).
* **spec/spec_helper.rb** - A helper file which loads the environment for running [specs](testing).

After generating the application, you might be asked to change directories to your application directory and run bundle install. For example, you would run these commands:

	:::term
	$ cd storeserver
	$ bundle install

## Rhoconnect Command Line Interface

In rhoconnect versions 3.2 and higher, a ruby utility called [thor](https://github.com/wycats/thor) routes all rake-like tasks through a custom command-line interface. All tasks are used via the rhoconnect gem's command line interface.

To issue commands this way, type `rhoconnect` followed by the task you wish to perform. To see a list of all the tasks you can issue with
rhoconnect, type `rhoconnect` or `rhoconnect help`.

	:::term
	$ rhoconnect help
	Tasks:
	  rhoconnect app NAME               # Generate a new rhoconnect application
	  rhoconnect attach                 # Attach to rhoconnect console
	  rhoconnect console [environment]  # Run rhoconnect console
	  rhoconnect dtach-about            # About dtach
	  rhoconnect dtach-install          # Install dtach program from sources
	  rhoconnect flushdb                # Flush data store - WARNING: THIS REMOVES ALL DATA IN RHOCONNECT
	  rhoconnect get-token              # Fetch current api token from rhoconnect
	  rhoconnect help [TASK]            # Describe available tasks or one specific task
	  rhoconnect redis-about            # About redis
	  rhoconnect redis-attach           # Attach to redis dtach socket
	  rhoconnect redis-download         # Download redis release 2.4.10
	  rhoconnect redis-install          # Install the latest verison of Redis from Github (requires git, duh)
	  rhoconnect redis-restart          # Restart redis on localhost:6379
	  rhoconnect redis-start            # Start redis on localhost:6379
	  rhoconnect redis-stop             # Stop redis running on localhost:6379
	  rhoconnect restart [options]      # Alias for `rhoconnect stop; rhoconnect start`
	  rhoconnect secret                 # Generate a cryptographically secure secret session key
	  rhoconnect set-admin-password     # Set the admin password
	  rhoconnect source NAME            # Generate a new source adapter
	  rhoconnect start [options]        # Start rhoconnect server
	  rhoconnect stop                   # Stop rhoconnect server
	  rhoconnect update                 # Update an existing application to the latest rhoconnect release
	  rhoconnect version                # Display rhoconnect version
	  rhoconnect web                    # Launch the web console in a browser

**NOTE: The `rhoconnect war` command is available only if you switch to jruby, such as using the command `rvm use jruby`.**

`rhoconnect start` and `rhoconnect restart` have the following options.

	-p, [--port=N]                   # Use port (default: 9292)
	-r, [--redis=REDIS]              # Redis server settings: (default: localhost:6379)
	-P, [--push-server=PUSH_SERVER]  # Push server settings (default: http://someappname@localhost:8675/)
	-t, [--api-token=API_TOKEN]      # API token  (default: my-rhoconnect-token)
	-f, [--config=CONFIG]            # /path/to/rhoconnect/settings.yml file
	-l, [--licenseflie=LICENSEFLIE]  # /path/to/license.key file

### Installing DTach (Mac OS / Linux only)

If you're using MacOS / Linux, install [dtach](http://dtach.sourceforge.net/) on your path before running any of the rhoconnect tasks.  [DTach](http://dtach.sourceforge.net/) is a simple utility which runs processes in a detached state so you can re-attach your console later.

	:::term
	$ cd storeserver
	$ rhoconnect dtach-install

### Setup Redis

Next, you will need to setup and start a [redis](http://redis.io/) server:

	:::term
	$ rhoconnect redis-install
	$ rhoconnect redis-start

The server will show that it is running on the console.

### Start the Application

Open a new console window (since the redis server is running in the previous console window). Then change directories to your rhoconnect application and start the application.

	:::term
	$ cd storeserver
	$ rhoconnect start

#### Starting RhoConnect without a Source Adapter Application

You can also start RhoConnect in a directory that does not contain a RhoConnect source adapter application. This is useful for RhoConnect plugin developers, who do not write a RhoConnect source adapter application: they can start a RhoConnect server from an empty directory.

	:::term
	$ cd (an empty directory)
	$ rhoconnect start

When you start RhoConnect in a directory that does not contain a rhoconnect source adapter application, a hidden settings file, .rhoconnect.yml, is created in your user home directory. Here is a partial sample listing.

	:development: &70196107903780
	  :syncserver: http://localhost:9393
	  :redis: localhost:6379
	  :push_server: http://someappname@localhost:8675/
	  :api_token: my-rhoconnect-token
	  :secret: !binary |-
	    ...
	:test: *70196107903780
	:production: *70196107903780

Once .rhoconnect.yml has been created in your user home directory, you can manually modify it for the next time you start RhoConnect. For example, you could change the port upon which the syncserver runs.

Running RhoConnect this way uses the default license key in the RhoConnect gem. You can use other license keys by using the `-l` option in the `rhoconnect start` command.

#### Opening the Web Console

If everything went well when you started RhoConnect, you should see the following in your console:

	[05:47:10 PM 2011-04-19] Rhoconnect Server v3.0.0 started...

To open the web console, navigate to [http://localhost:9292/](http://localhost:9292) in your browser or run:

	:::term
	$ rhoconnect web

### Creating executable WAR containers (JRuby environment only)

It is possible to create Java WAR containers for your Rhoconnect application that can be deployed into the
Java App Servers (for example, JBoss). To create the executable WAR container, execute the following command in your app's root directory:

	:::term
	$ cd storeserver
	$ rhoconnect war

This will build the WAR file named <your_app>.war that can be deployed into the Java App Server.

### Common Tasks

RhoConnect applications come with many useful rhoconnect tasks for administrative and development workflows. Some common ones are:

* 	`rhoconnect dtach-install` - (Mac OS / Linux only) This will install [dtach](http://dtach.sourceforge.net/) to /usr/local/bin.

* 	`rhoconnect redis-install` - This will install to the system.  On Mac OS / Linux, it will attempt to install in '/usr/local/bin' (on windows, C:\redis-<version>), unless you have specified a REDIS_HOME to use instead.
If you cannot install redis on Linux due to insufficient user permissions, then follows these [instructions](install).

* 	`rhoconnect set-admin-password` - Set the RhoConnect administrator password.  The default password is blank ''.

*	`rhoconnect get-token` - Get a RhoConnect API token to use for calling the RhoConnect REST API.

**NOTE: On Mac OS / Linux, you need to install dtach (i.e. by running `rhoconnect dtach-install`) to run the following tasks: **

* 	`rhoconnect redis-start` - This will launch a redis server in a new console.

* 	`rhoconnect redis-stop` - Stop the currently-running redis server.

*	`rhoconnect redis:attach` - (Mac OS / Linux only) Attach to a currently-running redis server.

* 	`rhoconnect start` - Start the RhoConnect application in a new console.  This requires a running redis server.

* 	`rhoconnect stop` - Stop the currently-running RhoConnect application.

*	`rhoconnect attach` - (Mac OS / Linux only) Attach to a currently-running RhoConnect application.

Some other useful development tasks:

*	`rhoconnect spec` - Run all source adapter specs in spec/sources/.

*	`rhoconnect web` - Open the RhoConnect web console in a browser.

## Generate Source

Connecting to a backend service with RhoConnect requires that you write a small amount of code for the query, create, update and delete operations of your particular enterprise backend. The collection of the code for these operations is called a source. You can create source for your RhoConnect application two ways:

 * [RhoConnect source adapter](source-adapters): generate a Ruby code source adapter from RhoStudio or from the command line, similar to how you generate a RhoConnect app. This source adapter contains code for the query, create, update and delete operations.

 * [RhoConnect plugin](plugin-intro): write the source code (the query, create, update and delete operations) into your backend application, and plug a RhoConnect plugin in the application. The plugin is written in the language that matchs your backend application, such as Java or .NET.

## Rake Tasks (Rhoconnect v.3.1 and lower)
<span class="label label-important">As of version 4.0 of rhoconnect, rake tasks will be deprecated!!</span>

Each RhoConnect (v.3.1 and lower) application uses [rake](https://github.com/jimweirich/rake) to manage development tasks such as starting/stopping the app, starting resque workers, and running specs.

To run a RhoConnect rake task, simply type `rake the-task-to-run` in your RhoConnect application's root directory.

Here is a complete list of the rake tasks available in a RhoConnect v.3.1 and lower application:

	:::term
	$ cd storeserver
	$ rake -T
	(in ~/storeserver)
	rake dtach:about                    # About dtach
	rake dtach:install                  # Install dtach 0.8 from source
	rake redis:about                    # About redis
	rake redis:attach                   # Attach to redis dtach socket
	rake redis:download                 # Download package
	rake redis:install                  # Install the latest version of Redis from Github (requires git, duh)
	rake redis:restart                  # Restart redis
	rake redis:start                    # Start redis
	rake redis:stop                     # Stop redis
	rake resque:work                    # Start a Resque worker
	rake resque:workers                 # Start multiple Resque workers.
	rake rhoconnect:attach              # Attach to rhoconnect console
	rake rhoconnect:clean_start         # Clean rhoconnect, get token, and create new user
	rake rhoconnect:create_user         # Creates and subscribes user for application in rhoconnect
	rake rhoconnect:delete_device       # Deletes a device from rhoconnect
	rake rhoconnect:delete_user         # Deletes a user from rhoconnect
	rake rhoconnect:flushdb             # Flush data store - WARNING: THIS REMOVES ALL DATA IN RHOCONNECT
	rake rhoconnect:get_token           # Fetches current api token from rhoconnect
	rake rhoconnect:reset               # Reset the rhoconnect database (you will need to run rhoconnect:get_token afterwards)
	rake rhoconnect:reset_refresh       # Reset source refresh time
	rake rhoconnect:restart             # Alias for `rake rhoconnect:stop; rake rhoconnect:start`
	rake rhoconnect:set_admin_password  # Sets the admin password
	rake rhoconnect:spec                # Run source adapter specs
	rake rhoconnect:start               # Start rhoconnect server
	rake rhoconnect:stop                # Stop rhoconnect server
	rake rhoconnect:war                 # Build executable WAR file to be used in Java App Servers
	rake rhoconnect:web                 # Launch the web console in a browser - uses :syncserver: in settings.yml

Below is provided a list of rake tasks and their corresponding RhoConnect v.3.2+ command.

<table border="1", cellpadding="5", width="100%">
	<tr>
		<th>rake Command</th>
		<th>rhoconnect command</th>
	</tr>
	<tr>
		<td>rake -T</td>
		<td>rhoconnect help</td>
	</tr>
	<tr>
		<td>rake rhoconnect:attach</td>
		<td>rhoconnect attach</td>
	</tr>
	<tr>
		<td>rake rhoconnect:clean_start</td>
		<td>rhoconnect clean-start (not available for v.4.0 or above)</td>
	</tr>
	<tr>
		<td>rake rhoconnect:clean_user</td>
		<td>rhoconnect clean-user (not available for v.4.0 or above)</td>
	</tr>
	<tr>
		<td>rake rhoconnect:delete_device</td>
		<td>rhoconnect delete-device (not available for v.4.0 or above)</td>
	</tr>
	<tr>
		<td>rake rhoconnect:delete_user</td>
		<td>rhoconnect delete-user (not available for v.4.0 or above)</td>
	</tr>
	<tr>
		<td>rake rhoconnect:flushdb</td>
		<td>rhoconnect flushdb</td>
	</tr>
	<tr>
		<td>rake rhoconnect:get_token</td>
		<td>rhoconnect get-token</td>
	</tr>
	<tr>
		<td>rake rhoconnect:reset</td>
		<td>rhoconnect reset (not available for v.4.0 or above)</td>
	</tr>
	<tr>
		<td>rake rhoconnect:reset_refresh</td>
		<td>rhoconnect reset-refresh (not available for v.4.0 or above)</td>
	</tr>
	<tr>
		<td>rake rhoconnect:restart</td>
		<td>rhoconnect restart</td>
	</tr>
	<tr>
		<td>rake rhoconnect:set_admin_password</td>
		<td>rhoconnect set-admin-password</td>
	</tr>
	<tr>
		<td>rake rhoconnect:spec</td>
		<td>rhoconnect spec</td>
	</tr>
	<tr>
		<td>rake rhoconnect:start</td>
		<td>rhoconnect start</td>
	</tr>
	<tr>
		<td>rake rhoconnect:stop</td>
		<td>rhoconnect stop</td>
	</tr>
	<tr>
		<td>rake rhoconnect:war</td>
		<td>rhoconnect war</td>
	</tr>
	<tr>
		<td>rake rhoconnect:web</td>
		<td>rhoconnect web</td>
	</tr>
	<tr>
		<td>rake dtach:about</td>
		<td>rhoconnect dtach-about</td>
	</tr>
	<tr>
		<td>rake dtach:install</td>
		<td>rhoconnect dtach-install</td>
	</tr>
	<tr>
		<td>rake redis:about</td>
		<td>rhoconnect redis-about</td>
	</tr>
	<tr>
		<td>rake redis:attach</td>
		<td>rhoconnect redis-attach</td>
	</tr>
	<tr>
		<td>rake redis:download</td>
		<td>rhoconnect redis-download</td>
	</tr>
	<tr>
		<td>rake redis:install</td>
		<td>rhoconnect redis-install</td>
	</tr>
	<tr>
		<td>rake redis:restart</td>
		<td>rhoconnect redis-restart</td>
	</tr>
	<tr>
		<td>rake redis:start</td>
		<td>rhoconnect redis-start</td>
	</tr>
	<tr>
		<td>rake redis:stop</td>
		<td>rhoconnect redis-stop</td>
	</tr>
</table>
