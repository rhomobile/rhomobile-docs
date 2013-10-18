Installing RhoSync
===

## Windows


If you're running Windows, download the latest [RhoSync windows installer](http://github.com/rhomobiledownloads).  This installs the [Ruby stack](http://www.ruby-lang.org/en/), [Redis](http://redis.io/), [Apache](http://httpd.apache.org/), and a default RhoSync application so you don't need to generate one by hand.

Your RhoSync application folder will be located in C:\RhoSync\rhosync by default so you can skip to the [generating a source instructions](rhosync_generator#generate-source-adapter) in the next section.

## Mac OS / Linux

### Prerequisites

1. [Ruby v1.8.7+](http://www.ruby-lang.org/en/downloads/)

2. [RubyGems v1.3.7+](http://rubygems.org/pages/download) 

3. Ruby Web Server - We test with [thin](http://code.macournoyer.com/thin/), [mongrel](http://rubygems.org/gems/mongrel), and [passenger](http://www.modrails.com/).  For ***production***, we recommend deploying with [thin](http://code.macournoyer.com/thin/) or [passenger](http://www.modrails.com/).  WEBrick, the web server that ships with ruby, is known to cause issues with HTTP headers/cookies and is ***not*** recommended.

### Installing RhoSync Gem

To install the latest stable RhoSync gem, run:

	:::term
  	$ [sudo] gem install rhosync

### Installing Redis

**NOTE: Skip these steps below if you want to use the [rhosync rake tasks](command-line#rake-tasks) to install redis.**

	:::term
  	$ wget http://redis.googlecode.com/files/redis-2.0.4.tar.gz
	$ tar xvzf redis-2.0.4.tar.gz
	$ cd redis-2.0.4
	$ make
	$ ./redis-server
	