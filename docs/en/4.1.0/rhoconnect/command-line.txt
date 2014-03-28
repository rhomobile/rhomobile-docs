Generating a RhoConnect Application
===

You can generate a RhoConnect app with RhoStudio or with the `rhoconnect` utility command line tool.

## Generating a RhoConnect App with RhoStudio

In RhoStudio, select File->New->Project...

The New Project window opens. Select the RhoConnect application wizard and click the Next button.

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect-tutorial/new-rhoconnect-project-4.0.png"/>

Enter the name for your RhoConnect application in Project name. You may specify a specific folder for your destination where your project is stored, by default, the destination is your RhoStudio workspace folder. Then press the Finish button.

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect-tutorial/rhoconnect-application-wizard-4.0.png"/>

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
      [32m     [ADDED] [0m  storeserver/config.ru
      [32m     [ADDED] [0m  storeserver/Gemfile
      [32m     [ADDED] [0m  storeserver/.gitignore
      [32m     [ADDED] [0m  storeserver/settings/settings.yml
      [32m     [ADDED] [0m  storeserver/settings/license.key
      [32m     [ADDED] [0m  storeserver/Rakefile
      [32m     [ADDED] [0m  storeserver/.rcgemfile
      [32m     [ADDED] [0m  storeserver/public
      [32m     [ADDED] [0m  storeserver/controllers/ruby/application_controller.rb
      [32m     [ADDED] [0m  storeserver/spec/controllers/ruby/application_controller_spec.rb
      [32m     [ADDED] [0m  storeserver/spec/spec_helper.rb

The generator will then run `bundle install` for you.

  :::term
  Executing 'bundle install' for the first time in your freshly baked application!
      bundle install --gemfile=/Users/<username>/guides/storeserver/Gemfile

Here's a basic rundown of each of the files that were just generated:


* **config.ru** - This is a rackup file which will load your application.  RhoConnect uses the excellent [sinatra](http://www.sinatrarb.com/) web framework to run the application.
* **settings/settings.yml** - This contains settings such as your redis connection, which source adapters exist and their parameters.  You can also put custom settings here.
* **settings/license.key** - The RhoConnect [license](licensing) associated with your application.  The default license allows up to 10 devices to synchronize with the application.
* **application_controller.rb** - The RhoConnect application class where you can implement authentication.  You can also add other custom methods here to use in your application.
* **Rakefile** - This contains tasks that can be run from the terminal.
* **Gemfile** - This file specifies application's dependencies using [bundler](http://gembundler.com/).
* **spec/spec_helper.rb** - A helper file which loads the environment for running [specs](testing).

## Rhoconnect Command Line Interface

In rhoconnect versions 3.2 and higher, a ruby utility called [thor](https://github.com/wycats/thor) routes all rake-like tasks through a custom command-line interface. All tasks are used via the rhoconnect gem's command line interface.

To issue commands this way, type `rhoconnect` followed by the task you wish to perform. To see a list of all the tasks you can issue with
rhoconnect, type `rhoconnect` or `rhoconnect help`.

    :::term
    $ rhoconnect help
    Commands:
      rhoconnect app NAME [options]     # Generate a new rhoconnect application
      rhoconnect attach                 # Attach to rhoconnect console
      rhoconnect console [environment]  # Run rhoconnect console
      rhoconnect dtach-about            # About dtach
      rhoconnect dtach-install          # Install dtach program from sources
      rhoconnect flushdb                # Flush data store - WARNING: THIS REMOVES ALL DATA IN RHOCONNECT
      rhoconnect get-token              # Fetch current api token from rhoconnect
      rhoconnect help [COMMAND]         # Describe available commands or one specific command
      rhoconnect redis-about            # About redis
      rhoconnect redis-attach           # Attach to redis dtach socket
      rhoconnect redis-download         # Download redis release 2.6.11
      rhoconnect redis-install          # Install the latest verison of Redis from Github (requires git, duh)
      rhoconnect redis-restart          # Restart redis on localhost
      rhoconnect redis-start            # Start redis on localhost
      rhoconnect redis-status           # Show status of redis servers
      rhoconnect redis-stop             # Stop redis running on localhost
      rhoconnect restart [options]      # Alias for `rhoconnect stop; rhoconnect start`
      rhoconnect routes                 # Prints out routes defined in the application
      rhoconnect secret                 # Generate a cryptographically secure secret session key
      rhoconnect set-admin-password     # Set the admin password
      rhoconnect source NAME [options]  # Generate a new source adapter
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

### Start the Application

**NOTE: If you have not already done so, make sure you install Redis and Dtach (Mac OS/Linux only) in the [Installing Rhoconnect doc](install#installing-redis) before continuing.**

In your command console or terminal on Mac OSX, change directories to your RhoConnect app's directory and start redis.

    :::term
    $ cd storeserver
    $ rhoconnect redis-start

Open a new console window (since the redis server is running in the previous console window) or dtach the current running redis instance with Ctrl+\\. Then start your rhoconnect application.

    :::term
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

  [03:52:15 PM 2013-03-12] Rhoconnect Server v4.0.0 started...

To open the web console, navigate to [http://localhost:9292/](http://localhost:9292) in your browser or run:

    :::term
    $ rhoconnect web

### Creating executable WAR containers (JRuby environment only)

It is possible to create Java WAR containers for your Rhoconnect application that can be deployed into the
Java App Servers (for example, Tomcat, JBoss). To create the executable WAR container, execute the following command in your app's root directory:

    :::term
    $ cd storeserver
    $ rhoconnect war

This will build the WAR file named `storeserver.war` that can be deployed into the Java App Server. Also warbler package includes 
 an application launcher script,  so you can run it standalone on port 8080 in java environment:

    :::term
    $ java -jar storeserver.war

To open the web console, navigate to [http://localhost:8080/](http://localhost:8080) in your browser.

### Common Tasks

RhoConnect applications come with many useful rhoconnect tasks for administrative and development workflows. Some common ones are:

*   `rhoconnect dtach-install` - (Mac OS / Linux only) This will install [dtach](http://dtach.sourceforge.net/) to /usr/local/bin.

*   `rhoconnect redis-install` - This will install to the system.  On Mac OS / Linux, it will attempt to install in '/usr/local/bin' (on windows, C:\redis-<version>), unless you have specified a REDIS_HOME to use instead.
If you cannot install redis on Linux due to insufficient user permissions, then follows these [instructions](install).

*   `rhoconnect set-admin-password` - Set the RhoConnect administrator password.  The default password is blank ''.

* `rhoconnect get-token` - Get a RhoConnect API token to use for calling the RhoConnect REST API.

**NOTE: On Mac OS / Linux, you need to install dtach (i.e. by running `rhoconnect dtach-install`) to run the following tasks: **

*   `rhoconnect redis-start` - Start redis on localhost.

*   `rhoconnect redis-stop` - Stop redis running on localhost.

*   `rhoconnect redis-status` - Show status of redis servers.

* `rhoconnect redis-attach` - (Mac OS / Linux only) Attach to a currently-running redis server.

*   `rhoconnect start` - Start the RhoConnect application in a new console.  This requires a running redis server.

*   `rhoconnect stop` - Stop the currently-running RhoConnect application.

* `rhoconnect attach` - (Mac OS / Linux only) Attach to a currently-running RhoConnect application.

Some other useful development tasks:

* `rhoconnect spec` - Run all source adapter specs in spec/sources/.

* `rhoconnect web` - Open the RhoConnect web console in a browser.

## Generate Source

Connecting to a backend service with RhoConnect requires that you write a small amount of code for the query, create, update and delete operations of your particular enterprise backend. The collection of the code for these operations is called a source. You can create source for your RhoConnect application two ways:

 * [RhoConnect source adapter](source-adapters): generate a Ruby code source adapter from RhoStudio or from the command line, similar to how you generate a RhoConnect app. This source adapter contains code for the query, create, update and delete operations.

 * [RhoConnect plugin](plugin-intro): write the source code (the query, create, update and delete operations) into your backend application, and plug a RhoConnect plugin in the application. The plugin is written in the language that matchs your backend application, such as Java or .NET.

## Rake Tasks (Removed)
<span class="label label-important">As of version 4.0, the rhoconnect rake tasks have been removed.  You can use `rhoconnect --help` to see the list of available rhoconnect commands.</span>