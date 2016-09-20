# Installing RhoConnect

This section discusses how to install the development environment for RhoConnect. For those who have developed a RhoConnect application, and now wish to deploy that RhoConnect application on a server, refer to the instructions for deploying a RhoConnect application, such as [preparing a RhoConnect app for production](preparing-production) and [deploying a RhoConnect application](deploying).

## Installing RhoConnect with RhoStudio

To install RhoConnect on a Windows or Macintosh platform, install RhoMobile Suite. The RhoMobile Suite installer installs Rho products, such as Rhodes, RhoConnect, RhoElements, and RhoStudio. RhoStudio is an Eclipse installation that facilitates development of native smart phone applications.

[Click here for the RhoMobile Suite installation instructions](../guide/rhomobile-install).

When you start RhoStudio, you set the location of the workspace directory. Set this path to a workspace directory that does not contain space symbols: if the path has spaces, a RhoConnect application created with RhoStudio will not work properly.

NOTE: The rest of this chapter consists of instructions for installing RhoConnect from the command line, without using the RhoMobile Suite installer. You do not need to perform those instructions if you installed using the RhoMobile Suite installer.

## Installing Ruby on Linux and Mac OSX

Mac OS X comes with Ruby already pre-installed, but it’s an older version (1.8.7) which not supported by RhoConnect.
Every Linux distribution usually has Ruby packages and you should refer to your distribution's documentation and community forums for help installing it.
But, usually, these packages are behind and don't include latest Ruby versions.

In nutshell, to have latest Ruby version you either need build it from sources, or use one of Ruby installers:

1. Use [Ruby Version Manager](https://rvm.io) (RVM). RVM starting from v1.19 includes new `autolibs` feature and allow you to automatically install all dependencies on your system. RVM with `autolibs` enabled works with the system package manager. But in the case for OSX
there's no a default package manager, and you have to select what package manager will be installed with autolibs modes `osx_brew` (default), `osx_port`, `osx_fink` and `smf`.

2. Manually download and install [Ruby v1.9.3](http://www.ruby-lang.org/en/downloads/).  Your mileage may vary depending on your machine, since you will need to resolve all build and install dependencies on your own.

Type this command to install stable RVM release:

    :::term
    $ curl -L https://get.rvm.io | bash -s stable

If you want get the libraries installed automatically, then use autolibs mode 4 a.k.a. enable.

    :::term
    $ rvm autolibs 4

On Mac OSX you can also optionally enforce a package manager of your choice:
 
    :::term
    $ rvm autolibs homebrew

And, finally, install desired Ruby version:

    :::term
    $ rvm install 1.9.3
    $ rvm install jruby
    # rvm install 2.0.0

**NOTE: The full list of `autolibs` options is covered in the [RVM docs](https://rvm.io/rvm/autolibs/).**

**NOTE: On Mac OSX to need to have `Xcode` and `Command Line Tools` installed.**


## Installing RhoConnect on Linux

On Linux, you need the following setup before redis is installed.

 * The `/usr/local` directory exists and is recursively writable by the current user.
 * The `/usr/local/etc/` directory exists and is recursively writable by the current user.
 * You need a gcc toolchain installed, i.e. via build-essential package on Ubuntu/Debian.

To install RhoConnect on Linux, you need to install the RhoConnect gem. Download and install:


1. Ruby Web Server - We tested with [thin](http://code.macournoyer.com/thin/), and [passenger](http://www.modrails.com/). WEBrick, the web server that ships with ruby, is known to cause issues with HTTP headers/cookies and is ***not*** recommended.

2. [Redis](http://redis.io/) - RhoConnect includes a simple [rhoconnect task](command-line#rhoconnect-cli-rhoconnect-v32) `rhoconnect redis-install` to install redis, covered in the [Rhoconnect CLI section](command-line#rhoconnect-cli-rhoconnect-v32). Alternatively, you can [install redis directly](http://redis.io/download).

3. Install the RhoConnect Gem.

Run this command to install the RhoConnect Gem.

    :::term
    $ gem install rhoconnect

**NOTE: Do not install Ruby as a standalone if you also use Ruby Version Manager (rvm) to install Ruby. If you need only one version of Ruby, you can install Ruby as a standalone. If you need more than one version of Ruby, you should uninstall standalone Ruby and then install Ruby with Ruby Version Manager. Mixed standalone Ruby and rvm-controlled Ruby installations can conflict and cause runtime issues in RhoConnect applications.**

## Setting the HTTP_PROXY Environment Variable

If you are using RestClient, you should set the HTTP_PROXY environment variable to your proxy server URL. This allows the bundler to work from behind a proxy.

From Linux or OSX, you can use the following command.

    $ export http_proxy=http://{username}:{password}@{proxy-server-name}

From Windows:

   $ SET HTTP_PROXY=http://{username}:{password}@{proxy-server-name}

This allows you to set the RestClient proxy using the HTTP_PROXY environment variable in your RhoConnect code.

    :::ruby
    RestClient.proxy = ENV['http_proxy']

## Installing Redis
### Install and Setup Redis

Next, you will need to setup your [redis](http://redis.io/) server:

    :::term
    $ rhoconnect redis-install

#### Redis Horizontal Scaling

Starting from v4.0, RhoConnect supports multiple Redis instances per app.
To enable this feature, edit your app `settings/settings.yml` file and replace the `:redis:` configuration
with an array of redis servers you are going to use:

    :::yaml
    # ...
    :production:
      :licensefile: settings/license.key
      :syncserver: http://localhost:9292/api/application/
      :push_server: http://appname:secret@localhost:8675/
      # One or more redis servers
      :redis:
        - localhost:6379
        - localhost:6380
        - localhost:6381
        - localhost:6382
        # ...

### Installing DTach (Mac OS / Linux only)

If you're using MacOS / Linux, install [dtach](http://dtach.sourceforge.net/) on your path before running any of the rhoconnect tasks.  [DTach](http://dtach.sourceforge.net/) is a simple utility which runs processes in a detached state so you can re-attach your console later.

    :::term
    $ cd storeserver
    $ rhoconnect dtach-install

Now you're ready to create a rhoconnect and start app from the command line. See [App Generator and Command Line](command-line) for instructions on this.# Installing RhoConnect.

## Upgrading From RhoConnect v.4.x to RhoConnect v.5.x
Upgrading from RhoConnect version 4.x is quite simple. All that is needed is to update the version of RhoConnect in your RC app's gemfile.

For Example:

    :::txt
    source 'http://rubygems.org'

    gem 'rhoconnect', '5.0.25'

    gemfile_path = File.join(File.dirname(__FILE__), ".rcgemfile")
    begin
      eval(IO.read(gemfile_path))
    rescue Exception => e
      puts "ERROR: Couldn't read RhoConnect .rcgemfile"
      exit 1
    end

    # Add your application specific gems after this line ...

Note that the RhoConnect gem version is '5.0.25'. Change your RhoConnect gem version to 5.0.25 here and then run bundle install in your app's directory to install the newly specified RhoConnect gem.