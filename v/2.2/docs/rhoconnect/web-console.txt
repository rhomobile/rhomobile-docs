Web Console
===

Your RhoConnect application exposes a web interface which runs on http://localhost:9292/console/ (port 80 on Windows) by default.  You can open the console by running the following in your application directory:

	:::term
	$ rhoconnect web

To login to the console:

1. Click on the "Console" link
2. Make sure the server field matches the host and port your rhoconnect app is running
3. Default username is 'rhoadmin' and the password is empty
4. Now you will be presented with a page showing your current license, for example:


		Licensed to Rhomobile on Fri Apr 23 17:20:13 -0700 2010,
			available 9 of 10 devices

It will also show a link to "Application Users" where you can view users of the system as well as devices they have registered.

To reset the server, you can click on the "Reset" button at the bottom.

**NOTE: Resetting the server will remove all data from redis including registered devices, this cannot be undone.**

If you want to disable this web interface, you can do so by editing the rackup file, config.ru:

	:::ruby
	# Setup the url map
	run Rack::URLMap.new \
		"/"         => Rhoconnect::Server.new,
		"/resque"   => Resque::Server.new, # If you don't want resque frontend, disable it here
		#"/console"  => RhoconnectConsole::Server.new # If you don't want rhoconnect frontend, disable it here

**NOTE: This web console is intended to be used for basic tests and views into the running RhoConnect application.  It uses the [RhoConnect REST API](rest-api) for everything it does, so it is very easy to extend this console or programmatically control your RhoConnect application directly using the [RhoConnect API](rest-api). **

Here is a screenshot of the web console:

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect/web-console.png"/>