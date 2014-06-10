# Deploying a RhoConnect Application

## Deploying On-Premise
The [sinatra book](http://sinatra-book.gittr.com/) has some great [deployment documentation](http://sinatra-book.gittr.com/#deployment) that you should review before running your RhoConnect application in production.

## Deploying packaged RhoConnect software on Linux servers

You can create RhoConnect production environment on Linux servers by installing software packages
for Ubuntu and CentOS respectively. At this moment supported formats are Debian (deb) and Red Hat (rpm) packages.

Every package provides the following components:

* Ruby, version 1.9.3

* Node.js, version v0.10.x

* Nginx HTTP server, release 1.3.x

* Thin application server, release 1.5.x

* Redis data store, release 2.6.x

* Latest RhoConnect gem with all required dependencies

In addition, RPM package provides latest sqlite3 headers and binaries, because standard Cent OS (5.x) libraries for sqlite3 outdated.

### Getting the Packages

To download the RhoConnect debian package, you first must add our repo to your list of sources.

#### Steps for Debian-Based Linux Users
Add the following line to the end of your <b>/etc/apt/sources.list</b>:

    :::text
    deb http://rhoconnect.s3.amazonaws.com/packages/deb rhoconnect main

**NOTE: If you want to get the package with cool new features from the Beta repository, then define repo url as `http://rhoconnect.s3.amazonaws.com/beta-packages/deb`**

Once the repo is added apt-get needs to be updated:

    :::term
    $ sudo apt-get update

Once that is done, it is time to install RhoConnect:

    :::term
    $ sudo apt-get install rhoconnect

#### Steps for RedHat-Based Linux Users
Prerequisites: target Linux server should include CentOS Development tools.
To install them, use the this command

    :::term
    $ yum groupinstall 'Development Tools'

It will install for you such tools as GNU GCC C/C++ compiler, make and others.

Vanilla CentOS distribution does not include some packages required by RhoConnect installer. To resolve dependencies you
might wanted to use [Extra Packages for Enterprise Linux (EPEL) ](http://fedoraproject.org/wiki/EPEL)
repository and install Python26 out of it.

For example, to enable EPEL repository for CentOS 5.x release execute these commands:

    :::term
    $ wget http://dl.fedoraproject.org/pub/epel/5/x86_64/epel-release-5-4.noarch.rpm
    $ rpm -i epel-release-5*.rpm
    $ yum update
    $ yum install python26

For CentOS 6.x release:

    :::term
    $ wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
    $ rpm -i epel-release-6*.rpm
    $ yum update

Now you can create a file named <b>rhoconnect.repo</b> in the <b>/etc/yum.repos.d/</b> directory:

    :::term
    $ sudo vim /etc/yum.repos.d/rhoconnect.repo

Copy and paste these contents into the file.

    :::text
    [rhoconnect]
    name=Rhoconnect
    baseurl=http://rhoconnect.s3.amazonaws.com/packages/rpm
    enabled=1
    gpgcheck=0

**NOTE: If you want to get the package with cool new features from the Beta repository, then define baseurl as `baseurl=http://rhoconnect.s3.amazonaws.com/beta-packages/rpm`**

Once that is done, it is time to install RhoConnect:

    :::term
    $ sudo yum install rhoconnect

### Final Steps (After the installer is finished)
Installer also created and configured RhoConnect <b>rhoapp</b> application in <b>/opt/nginx/html</b> directory.
To test it you need to as a root user start redis, thin, and nginx servers:

    :::term
    $ sudo /etc/init.d/redis start
    $ sudo /etc/init.d/thin start
    $ sudo /etc/init.d/nginx start

And verify that it's up and running by visiting application web console in your browser:

  http://servername

### Configuration of web and application servers
Installer compiled and configured Nginx as reverse proxy web server (/opt/nginx) with the following settings:

* Nginx start-up script (`/etc/init.d/nginx`)

* Nginx logrotate settings (`/etc/logrotate.d/nginx`)

* Nginx configuration file (`/opt/nginx/conf/nginx.conf`)

* virtual host template for rhoconnect application (`/opt/nginx/conf/conf.d/rhoconnect.conf`)

Installer also configured Thin app server with the following configuration files:

* Thin start-up script (`/etc/init.d/thin`)

* Thin configuration file (`/etc/thin/rhoapp.yml`)

Default setup of Nginx server is to deal with back-end servers (called "upstreams") that are running on UNIX domain sockets:

    :::text
    # /opt/nginx/conf/conf.d/rhoconnect.conf file

    upstream thin_cluster {
    least_conn;
      server unix:/tmp/thin.0.sock;
      server unix:/tmp/thin.1.sock;
    # Add additional copies if need more Thin servers
      #server unix:/tmp/thin.2.sock;
      #server unix:/tmp/thin.3.sock;
    }

    server {
      listen      80;
      # Be sure to point to 'public' folder of your application!
      root  /opt/nginx/html/rhoapp/public;
      # ...

    }

Thin application server runs as a cluster with /etc/thin/rhoapp.yml configuration file:

    :::yaml
    ---
    chdir: /opt/nginx/html/rhoapp
    environment: production
    timeout: 30
    log: /var/log/thin/thin.log
    pid: /var/run/thin/thin.pid
    max_conns: 1024
    max_persistent_conns: 512
    require: []
    wait: 30
    socket: /tmp/thin.sock
    servers: 2
    daemonize: true

Configuration file is generated by this command:

    :::term
    $ thin config -C /etc/thin/rhoapp.yml -c /opt/nginx/html/rhoapp/ --socket /tmp/thin.sock --servers 2 --log /var/log/thin/thin.log --pid /var/run/thin/thin.pid -e production

### Development and deployment of RhoConnect applications

Packaged software does not setup automatically path to installed ruby bins and gems, so you need do it manually. Add necessary bins to the path(s) of the users who will be using this software.  You may also wish to add these items
to your bash scripts (i.e. `~/.profile` on Ubuntu; `~/.bash_profile` on CentOS) to automatically add them upon login.

    :::text
    export PATH=/opt/rhoconnect/bin:$PATH

#### Deploying a rhoconnect app

To deploy and develop your rhoconnect app on nginx and thin servers

a) Copy your rhoconnect project (lets name it as `your_rhoconnect_app`) to default location to `/opt/nginx/html` directory

b) Set up for it `nginx` owner

    :::term
    $ cd /opt/nginx/html
    $ sudo chown -R nginx:nginx your_rhoconnect_app/

c) Make sure that your app is bundled properly

    :::term
    $ cd your_rhoconnect_app
    $ sudo /opt/rhoconnect/bin/bundle install

d) Configure Nginx virtual host for your rhoconnect application. For that edit the file
`/opt/nginx/conf/conf.d/rhoconnect.conf`, so that it reflects your specifications (root directive)

    :::text
    # ...
    server {
      listen      80;
      # Be sure your app have 'public' folder and root directive
      # point to it!
      root  /opt/nginx/html/your_rhoconnect_app/public;
      # ...
    }

e) Edit Thin `/etc/thin/rhoapp.yml` configuration file directly

    :::yaml
    ---
    chdir: /opt/nginx/html/your_rhoconnect_app
    # ...

  or as root user generate a new one

    :::term
    $ env PATH=/opt/rhoconnect/bin:$PATH thin config -C /etc/thin/your_rhoconnect_app.yml \
    -c /opt/nginx/html/your_rhoconnect_app/ \
    --socket /tmp/thin.sock --servers 2 --log /var/log/thin/thin.log \
    --user nginx --group nginx \
    --pid /var/run/thin/thin.pid -e production

f) As root user restart Thin, and Nginx servers

    :::term
    /etc/init.d/thin restart
    /etc/init.d/nginx restart


#### Deploying multiple rhoconnect apps

**NOTE: Deploying multiple rhoconnect apps on nginx has not yet been tested. Perform these steps only if you are experienced with nginx.**

To deploy and develop two rhoconnect applications on nginx and thin servers,
refer to the nginx documentation on [nginx server blocks](http://wiki.nginx.org/ServerBlockExample) to see how to configure an nginx sever for multiple host names.

For each rhoconnect app, you need to set up its own redis instance. Refer to [the redis quick start documentation](http://redis.io/topics/quickstart).

If you have questions on setting this up, contact your system administrator.

#### Monitoring and Logging

For monitoring and troubleshooting purposes visit web console of your app and look at log files in `/opt/nginx/logs`.

Also you can use RhoConnect `/opt/nginx/html/rhoapp` application as a template and modify it as you wanted.

**NOTE: You should pay attentions to situations, if you have already Ruby installed on system level. Avoid usage of system gems in your application. It might lead to unpredictable results, if ruby versions are different. Either set up path to rhoconnect binaries for root user, or install required gems as `sudo /opt/rhoconnect/bin/gem install gem_name`**

## Nginx configuration for SSL with self-signed certificate

### About Self-Signed Certificates
A SSL certificate is a way to encrypt a site's information and create a more secure connection.
This chapter will take you through generating a self-signed certificate to use with Nginx.

### Create a Directory for the Certificate
The SSL certificate has 2 main parts: the certificate itself and the public key. To make all of the relevant files easy to access, you should create a directory to store them in:

    :::term
    $ sudo mkdir /opt/nginx/ssl

We will perform the next few steps within the directory:

    :::term
    $ cd /opt/nginx/ssl


### Create the Server Key and Certificate Signing Request
Start by creating the private server key. During this process, you will be asked to enter a specific passphrase. Be sure to note this phrase carefully, if you forget it or lose it, you will not be able to access the certificate.

    :::term
    $ openssl genrsa -des3 -out server.key 1024
    Generating RSA private key, 1024 bit long modulus
    ..........++++++
    ..................++++++
    e is 65537 (0x10001)
    Enter pass phrase for server.key:
    Verifying - Enter pass phrase for server.key:

Follow up by creating a certificate signing request:

    :::term
    $ openssl req -new -key server.key -out server.csr

This command will prompt terminal to display a lists of fields that need to be filled in.
The most important line is "Common Name". Enter your official domain name here or,
if you don't have one yet, your site's IP address. Leave the challenge password and optional company name blank.

    :::term
    Enter pass phrase for server.key:
    You are about to be asked to enter information that will be incorporated
    into your certificate request.
    What you are about to enter is what is called a Distinguished Name or a DN.
    There are quite a few fields but you can leave some blank
    For some fields there will be a default value,
    If you enter '.', the field will be left blank.
    -----
    Country Name (2 letter code) [AU]:YOUR_COUNTRY
    State or Province Name (full name) [Some-State]:YOUR_STATE
    Locality Name (eg, city) []:YOUR_CITY
    Organization Name (eg, company) [Internet Widgits Pty Ltd]:YOUR_COMPANY
    Organizational Unit Name (eg, section) []:YOUR_UNIT
    Common Name (eg, YOUR name) []:YOUR_DOMAINNAME_HERE
    Email Address []:YOUR_EMAIL

    Please enter the following 'extra' attributes
    to be sent with your certificate request
    A challenge password []:
    An optional company name []:

### Remove the Passphrase
We are almost finished creating the certificate. However, it would serve us to remove the passphrase. Although having the passphrase in place does provide heightened security, the issue starts when one tries to reload nginx. In the event that nginx crashes or needs to reboot, you will always have to re-enter your passphrase to get your entire web server back online.

Use these commands to remove the password:
    :::term
    $ cp server.key server.key.org
    $ openssl rsa -in server.key.org -out server.key


### Sign your SSL Certificate
Your certificate is all but done, and you just have to sign it.

Keep in mind that you can specify how long the certificate should remain valid by changing the 365 to the number of days you prefer. As it stands this certificate will expire after one year.

    :::term
    $ openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt
    Signature ok
    subject= ...
    Getting Private key

### Set Up the Certificate
Now we have all of the required components of the finished certificate.
The next thing to do is to set up the virtual host to serve your domain from HTTS connection.

Update existing Nginx `/opt/nginx/conf/conf.d/https_rhoconnect.conf` configuration file by including the newly signed certificate and private key:

    :::term
    upstream thin_cluster {
      # ...
    }

    # HTTPS server
    server {
            listen 443;
            server_name YOUR_DOMAINNAME_HERE;
          root  /opt/nginx/html/#{app_name}/public;

        location / {
          # ...
            proxy_pass http://thin_cluster;
        }

            ssl on;
            ssl_certificate /opt/nginx/ssl/server.crt;
            ssl_certificate_key /opt/nginx/ssl/server.key;
    }


### Activate the Virtual Host
Restart nginx:

    :::term
    $ /etc/init.d/nginx restart

Now we're ready to access the above host using:

    :::term
    https://YOUR_DOMAINNAME_HERE


## Deploying RhoConnect Redis and Push packages on Linux servers

### RhoConnect Redis

RhoConnect Redis is a packaged Redis server for RhoConnect development and production environment on Linux servers.
<b>rhoconnect-redis</b> package might be useful if you want to deploy Redis on separate server.

The package compiles from sources latest stable Redis release (2.4.15) and installs it to `/opt/rhoconnect` directory with the following settings:

* Redis server configuration file (`/opt/rhoconnect/etc/redis.conf`)

* log files located in `/var/log/redis` directory

* start-up scripts in `/etc/init` and `/etc/init.d` directories

#### Steps for Debian-Based Linux Users
Add the following line to the end of your /etc/apt/sources.list.

    :::term
    deb http://rhoconnect-repo.s3.amazonaws.com/packages/deb rhoconnect-repo main

Then update the repo list and install RhoConnect Redis.

    :::term
    $ sudo apt-get update
    $ sudo apt-get install rhoconnect-redis

When Redis server is successfully installed, start it using the following command.

    :::term
    $ sudo start rhoconnect-redis

#### Steps for RedHat-Based Linux Users

Create a file named rhoconnect-repo.repo in the /etc/yum.repos.d/ directory.

    :::term
    $ sudo nano /etc/yum.repos.d/rhoconnect-repo.repo

Copy and paste these contents into the file.

    :::term
    [rhoconnect-redis]
    name=Rhoconnect Redis
    baseurl=http://rhoconnect-repo.s3.amazonaws.com/packages/rpm
    enabled=1
    gpgcheck=0

Once that is done, install the RhoConnect Push service.

    :::term
    $ sudo yum install rhoconnect-redis

You can start a redis server using the following command.

    :::term
    $ sudo /etc/init.d/redis start

### RhoConnect Push Service
You can create a RhoConnect Push production environment on Linux servers by installing prepackaged software for
Ubuntu (12.x) and CentOS (5.x/6.x). In a few clicks, you will have installed on your Linux server.

* Node.js with Npm package manager

* RhoConnect Push service

* Upstart script to start, stop, and control Push service  (for Ubuntu and CentOS 6.x)

* `/etc/init.d/rhoconnect-push` init script to start, stop, and restart Push service  (CentOS 5.x)

Prerequisites:

    * Python 2.6 or 2.7

#### Steps for Debian-Based Linux Users
Add the following line to the end of your /etc/apt/sources.list.

    :::term
    deb http://rhoconnect-repo.s3.amazonaws.com/packages/deb rhoconnect-repo main

Then update the repo list and install RhoConnect Push.

    :::term
    $ sudo apt-get update
    $ sudo apt-get install rhoconnect-push

#### Steps for RedHat-Based Linux Users
Node.js requires python 2.6 which is not available for CentOS 5 stock version.
For this flavor of linux you need to manually install EPEL repo and install python26 RPM out of it:

    :::term
    $ wget http://dl.fedoraproject.org/pub/epel/5/x86_64/epel-release-5-4.noarch.rpm
    $ rpm -i epel-release-5*.rpm
    $ yum install python26


Now create a file named rhoconnect-repo.repo in the /etc/yum.repos.d/ directory.

    :::term
    $ sudo nano /etc/yum.repos.d/rhoconnect-repo.repo

Copy and paste the following contents into the file.

    :::term
    [rhoconnect-push]
    name=Rhoconnect Push Service
    baseurl=http://rhoconnect-repo.s3.amazonaws.com/packages/rpm
    enabled=1
    gpgcheck=0

Once that is done, install the RhoConnect Push service.

    :::term
    $ sudo yum install rhoconnect-push


## Deploying into J2EE environment
In JRuby environment, there is an option to create the WAR container for the RhoConnect app
and deploy it into the J2EE App Server.
(see the corresponding 'rake' task for creating the WAR containers).
Deploying the WAR container varies per J2EE App Server, for JBoss it is necessary
to place the WAR file into the server's deploy directory.

#### Deploying warbler package on Apache Tomcat web server
To successfully deploy warbler package on Tomcat you need to make rhoconnect app be the default app. There are a few ways to reach
this goal and we describe only a couple of them.

##### Method 1

1) Stop Tomcat `shutdown.sh`

2) Delete the `ROOT` directory under `$CATALINA_BASE/webapps`

3) Name your war file as `ROOT.war` (capitals mandatory)

4) Drop the `ROOT.war` file directly in the `$CATALINA_BASE/webapps` directory

5) Start Tomcat `startup.sh`

##### Method 2

1) Stop Tomcat

2) Copy your war file in `$CATALINA_BASE/webapps`, under its original name

3) Turn off autoDeploy and deployOnStartup in your Host element in the server.xml file.

4) Explicitly define your application context in server.xml, specifying both path (must be empty!) and docBase.

    :::xml
    <Host name="localhost"  appBase="webapps"
       unpackWARs="true" autoDeploy="false" deployOnStartup="false">
       <!-- ...  -->
       <Context docBase="your-app.war" path=""/>
       <!-- ...  -->
    </Host>

5) Start Tomcat

## Deploying on Heroku

#### Prerequisites

* [Heroku account](https://api.heroku.com/login) and [Heroku Toolbelt](https://toolbelt.heroku.com/)

* Rhoconnect version >= 3.4

#### Create Rhoconnect application
Create your Rhoconnect app and make sure that it's up and running in your development environment using thin:

    :::term
    $ cd your_rhoconnect_app
    $ bundle exec thin start


#### Deploy to Heroku
Heroku uses git as its deployment interface.  To create and deploy your application on Heroku, use the the following steps:

    :::term
    $ git init
    $ git add .
    $ git commit -m 'initial commit'
    $ heroku create --buildpack=https://github.com/rhomobile/heroku-buildpack-ruby.git
    $ heroku addons:add redistogo:nano
    $ git push heroku master
    $ heroku open

#### Monitoring app on Heroku
Use `heroku ps` to determine the number of processes that are executing.
Use `heroku logs` to view an aggregated list of log messages from all process types.

    :::term
    $ heroku ps
    $ heroku logs

#### Get connected with Rhodes client
If you have a rhodes client and want to sync it with your rhoconnect app on Heroku, then set the proper `syncserver` URL in `rhoconfig.txt`:

    :::term
    syncserver = 'https://<your-heroku-app-here>.herokuapp.com'






