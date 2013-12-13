Collecting Runtime Stats
===
RhoConnect provides a simple stats [rack middleware](http://railscasts.com/episodes/151-rack-middleware) for collecting runtime information on your application.  These stats are accessible from the [REST API](rest-api) and some default graphs are available from the [web console](web-console).

## Enabling Stats
To enable stats in your RhoConnect application, simply turn on the stats middleware by editing config.ru:

	:::ruby
	Rhoconnect::Server.enable  :stats

A complete config.ru might look like:

	:::ruby
	require 'rhoconnect/application/init'

	# secret is generated along with the app
	Rhoconnect::Server.set     :secret,      'my_secret'

	# !!! Add your custom initializers and overrides here !!!
	Rhoconnect::Server.enable  :stats

	# run RhoConnect Application
	run Rhoconnect.app
	

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