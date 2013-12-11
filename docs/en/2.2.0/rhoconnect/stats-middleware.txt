Collecting Runtime Stats
===
RhoConnect provides a simple stats [rack middleware](http://railscasts.com/episodes/151-rack-middleware) for collecting runtime information on your application.  These stats are accessible from the [REST API](rest-api) and some default graphs are available from the [web console](web-console).

## Enabling Stats
To enable stats in your RhoConnect application, simply turn on the stats middleware by editing config.ru:

	:::ruby
	Rhoconnect::Server.enable  :stats

A complete config.ru might look like:

	:::ruby
	# Try to load vendor-ed rhoconnect, otherwise load the gem
	begin
	  require 'vendor/rhoconnect/lib/rhoconnect/server'
	  require 'vendor/rhoconnect/lib/rhoconnect/console/server'
	rescue LoadError
	  require 'rhoconnect/server'
	  require 'rhoconnect/console/server'
	end

	# By default, turn on the resque web console
	require 'resque/server'

	ROOT_PATH = File.expand_path(File.dirname(__FILE__))

	# Rhoconnect server flags
	Rhoconnect::Server.disable :run
	Rhoconnect::Server.disable :clean_trace
	Rhoconnect::Server.enable  :raise_errors
	Rhoconnect::Server.set     :secret,      '<changeme>'
	Rhoconnect::Server.set     :root,        ROOT_PATH
	Rhoconnect::Server.enable  :stats
	Rhoconnect::Server.use     Rack::Static, :urls => ["/data"], :root => Rhoconnect::Server.root

	# Load our rhoconnect application
	require './application'

	# Setup the url map
	run Rack::URLMap.new \
		"/"         => Rhoconnect::Server.new,
		"/resque"   => Resque::Server.new, # If you don't want resque frontend, disable it here
		"/console"  => RhoconnectConsole::Server.new # If you don't want rhoconnect frontend, disable it here

Now just restart your rhoconnect application:

	:::term
  	$ rhoconnect restart

And navigate to the 'Statistics' tab in your RhoConnect console:

	:::term
  	$ rhoconnect web

## Stats Console
You should see graphs, organized by categories:

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect/stats-console.png"/>

RhoConnect statistics are organized into the following categories:

* User Count - # of users stored in redis

* Device Count - # of devices currently registered with RhoConnect

* HTTP Timing - # average HTTP request time by URL

* Source Timing - # average source adapter execution time by method