Deploying a RhoSync Application to Amazon EC2
========
This tutorial will guide you through deploying a RhoSync application to Amazon EC2.

Source Code
-----------
The source code for this example is located here.

 * [RhoSync shell script](https://github.com/rhomobile/rhosync/raw/master/bin/rhosync-setup)

Webinar Video
-------------
[Vimeo link](http://vimeo.com/23345052)

Pre-requisite Reading
---------------------
 * [Amazon Web Server](http://aws.amazon.com/)

## Setup
This tutorial assumes that you have created an account with Amazon Web Services. If you do not have an account, go to aws.amazon.com and create one. If you do not know how to do this, see [Pre-requisite Reading]().

## Setting Up An EC2 Instance on Amazon Web Services

We are going to set up an EC2 instance that will be running RhoSync inside Phusion Passenger (a popular Ruby web application system), which will be running inside Apache. We will also show how to set up Redis as a service on your computer, and then set up Resque. If your RhoSync is using background jobs, since RhoSync uses the Resque system, the background jobs are set up for you.

### Creating the EC2 Instance from the Amazon EC2 Console

Log into your Amazon Web Service account, and click on the EC2 tab to enter the Amazon EC2 console.

<img src="http://rhodocs.s3.amazonaws.com/rhosync-ec2-tutorial/EC2-console.png" alt="EC2 console" />

### Selecting Your Region

Amazon lets you select different regions in which to operate the instance. Under Navigation: Region, select a region. (The webinar has the US West region, since the webinar originated in California.)

<img src="http://rhodocs.s3.amazonaws.com/rhosync-ec2-tutorial/select-region.png" alt="Select region" />

### Selecting the Amazon Machine Image

You need to select an AMI (Amazon Machine Image). Go to the website where you select the AMI that you want to use. The webinar uses cloud.ubuntu.com/ami/, the Ubuntu cloud portal for their AMIs. Select an AMI that is in the same region that you selected in the EC2 dashboard. The webinar shows an AMI selected from the zone us-west-1 with an i386 architecture. Copy the AMI-ID for the AMI that you selected.

<img src="http://rhodocs.s3.amazonaws.com/rhosync-ec2-tutorial/cloud-ubuntu-ami.png" alt="Cloud Ubuntu AMIs" />

Go back to the Amazon EC2 Console Dashboard. Under Getting Started, click the Launch Instance button. The Request Instances Wizard appears, showing the CHOOSE AN AMI window. The webinar uses an image from Community AMIs, so you would click that tab if you are using a similar AMI. Paste in the AMI-ID that you copied. That AMI shows up in the list.

<img src="http://rhodocs.s3.amazonaws.com/rhosync-ec2-tutorial/request-instances-wizard-choose-ami.png" alt="Request Images Wizard Choose AMI" />

Click Select to choose that AMI. The Request Instances Wizard: INSTANCE DETAILS window appears, showing the Number of Instances, Availability Zone, and Instance Type for this AMI. The webinar chose the defaults: 1 instance, no preference for availability zone, and small for instance type. 

<img src="http://rhodocs.s3.amazonaws.com/rhosync-ec2-tutorial/request-images-wizard-instance-details1.png" alt="Request Images Wizard Instance Details 1" />

Click Continue.

### Setting EC2 Instance Options

Click Continue. The Request Instances Wizard shows Advanced Instance Options. You can turn on Monitoring, which enables CloudWatch detailed monitoring for the AMI. Termination Protection lets you set a state on the instance so you do not accidentally turn it off; you have to turn off Termination Protection before you can turn off the instance. (The webinar did not set termination protection.)

<img src="http://rhodocs.s3.amazonaws.com/rhosync-ec2-tutorial/request-images-wizard-instance-details2.png" alt="Request Images Wizard Instance Details 2" />

Click Continue.

You can enter a label for your instance, which is useful if you have lots of instances. The webinar shows a label of simple rhosync instance.

<img src="http://rhodocs.s3.amazonaws.com/rhosync-ec2-tutorial/request-images-wizard-instance-details3.png" alt="Request Images Wizard Instance Details 3" />

Click Continue.

### Creating and Downloading a Key Pair

Click Continue. Under CREATE KEY PAIR, you are asked to create a key pair, which allows you to securely connect to your instance after it launches. RhoSync uses public key identification for logging into Linux instances. Amazon will create a key for you: you only need to enter a name for your key pair and click on Create & Download your Key Pair. (The webinar uses the name "larsdevkey".)

The key pair file downloads. You will use that file later when you connect to your AMI. The file name is the name you entered with a .pem extension.

<img src="http://rhodocs.s3.amazonaws.com/rhosync-ec2-tutorial/keypair.png" alt="Key Pair" />

Click Continue.

### Create a Security Group to Open Ports for SSH and HTTP

Click Create a new Security Group. Under CONFIGURE FIREWALL, you need to expose ports for SSH and HTTP. From Create a new rule, select SSH, then click the Add Rule button. And again, from Create a new rule, select HTTP, then click the Add Rule button. The webinar shows that this exposes ports 22 and 80 in the instance that you are going to boot. Enter a Group Name and Group Description for this security group.

<img src="http://rhodocs.s3.amazonaws.com/rhosync-ec2-tutorial/request-instances-wizard-configure-firewall.png" alt="Configure Firewall" />

Click Continue.

Under REVIEW, you see a summary of the operations you did to set up the AMI instance. The example in the webinar shows that it will create a small instance, that monitoring is enabled, that it has a security group, and that it has a key pair.

<img src="http://rhodocs.s3.amazonaws.com/rhosync-ec2-tutorial/request-instances-wizard-review.png" alt="Review" />

### Launching the EC2 Instance

Click Launch to start the instance. 

You will see a Launch Instance Wizard window, showing that your instances are launching. Close the Launch Instance Wizard window.

In the Amazon EC2 Console Dashboard, click on Running Instances. (It takes a few seconds for the EC2 instance to boot up.)

<img src="http://rhodocs.s3.amazonaws.com/rhosync-ec2-tutorial/running-instances-click.png" alt="Running Instance click" />

When the instance starts running, you can pull up its EC2 Instance window to get a better look at it. You will see its AMI ID, Key Pair Name, and other information you entered. 

<img src="http://rhodocs.s3.amazonaws.com/rhosync-ec2-tutorial/ec2-instance-window.png" alt="EC2 Instance Window" />

### Copying the Public DNS URL for the EC2 Instance

If you scroll down a little, you see that it also shows the URL for the Public DNS location that Amazon gives you by default for you can connect to the instance over the public Internet. Copy the Public DNS URL for the EC2 instance, and save it so you can use it later when you install RhoSync.

<img src="http://rhodocs.s3.amazonaws.com/rhosync-ec2-tutorial/my-instances-public-dns.png" alt="Public DNS" />

## Entering the EC2 Instance

Now you can install RhoSync into the running EC2 instance. You will do this from the command line.

### Changing the Permissions on the Key Pair

Navigate to your downloads folder containing the key pair file that you downloaded earlier: key-pair-name-you-entered.pem. You need to change the permission on the key pair file to read only by you and no access for anyone else. This is a SSH security precaution; if the permissions are too open on this file, you cannot use the file to authenticate.

	:::term
	$ chmod 400 larsdevkey.pem

### Entering the EC2 Instance with SSH

Enter the command to ssh into the running EC2 instance. Specify your key pair with the -i argument. In the webinar, the default user is ubuntu. Use the URL for the Public DNS location (the command below uses the URL from the webinar: ec2-50-18-39-21.us-west-1.compute.amazonaws.com). The command shown below is one command spread over two lines.

	:::term
	$ ssh -i larsdevkey.pem ubuntu@ec2-50-18-39-21.us-west-1.compute.amazonaws.com

You are now running in the SSH shell. The first time you connect, you will be asked if you want to accept the public key for this host. Enter yes at the command line. Note that the command prompt changes to reflect that you are running in the ssh shell.

	:::term
	ubunto@ip-10-171-38-253:~$

Use the sudo su command to run as the root user. (Note that the prompt changes to root when you become the root user.) The shell script sets up the components to compile and install ruby, ruby gems, apache, the RhoSync gem, and Phusion Passenger. That needs to be done as the root user. 

Then use the cd command to go to the root level, where you will run the shell script.

	:::term
	ubunto@ip-10-171-38-253:~$ sudo su
	root@ip-10-171-38-253: /home/ubuntu# cd
	root@ip-10-171-38-253: ~#

## Understanding the Shell Script That Installs RhoSync into the EC2 Instance

The shell script that you will use to install RhoSync into your EC2 instance is on github.

https://github.com/rhomobile/rhosync/raw/master/bin/rhosync-setup

This is a draft of a shell script that Rhomobile is working on to set up RhoSync on a Linux machine, so this code is subject to change. The webinar, and this tutorial, walks through this shell script step-by-step. 

### Running the Entire Shell Script

When you run this shell script on your computer, you can run the entire script at once as a normal shell script, and it will complete all the steps that the webinar/tutorial will walk through. However, you need to edit one line in the script before it will run successfully. In section 3, create rhosync app, you need to enter a name for the server. Change the following line.

	:::term
	ServerName $1

And enter the name of the server.

	:::term
	ServerName ec2-5--18-39-21.us-west-1.computer.amazonaws.com

### Understanding Ruby, RhoSync, and Phusion Passenger Install

Step 1 of the shell script installs the components to compile and install ruby, ruby gems, apache, the RhoSync gem, and Phusion Passenger. 

It installs ruby, ruby gems, apache, the RhoSync gem, and Phusion passenger. The final line in this step is compiling the Phusion passenger from source. This script uses Passenger as the ruby web server because Passenger has nice management of ruby processes. If we used web servers like thin or mongrel, we would have to set up the ruby processes manually and use an apache proxy in front. 
	
	:::term
	# 1. install packages
	yes | apt-get update
	yes | apt-get install build-essential libopenssl-ruby 
	yes | apt-get install libcurl4-openssl-dev
	yes | apt-get install apache2-prefork-dev apache2-mpm-prefork
	yes | apt-get install rubygems
	gem install rhosync SystemTimer --no-ri --no-rdoc
	gem install passenger --no-ri --no-rdoc
	yes | /var/lib/gems/1.8/bin/passenger-install-apache2-module

The webinar shows the shell script being run step-by-step. Note that the webinar shows that it can take a while for the last command, which set up Passenger, to run.

### Understanding Passenger Configuration

The second step in the shell script configures and sets up the Passenger module.

	:::term
	# 2. load passenger
	echo "
	LoadModule passenger_module /var/lib/gems/1.8/gems/passenger-3.0.7/ext/apache2/mod_passenger.so
	PassengerRoot /var/lib/gems/1.8/gems/passenger-3.0.7
	PassengerRuby /usr/bin/ruby1.8
	" > /etc/apache2/mods-available/passenger.load
	
	a2enmod passenger
	/etc/init.d/apache2 restart

### Understanding the Virtual Host

The third step in the shell script creates the virtual host. 

As was mentioned previously in this tutorial, there is a server name variable in this part of the shell script: ServerName $1. A server name must be entered for this part of the shell script to run. Get the server name from the My Instance page in the Amazon EC2 Console Dashboard (this is the web page you were asked to save earlier, but you can just go back to the Dashboard and get it again).

<img src="http://rhodocs.s3.amazonaws.com/rhosync-ec2-tutorial/my-instances-public-dns.png" alt="Public DNS" />

In this example, you would edit the ServerName $1 line to:

	:::term
	ServerName ec2-5--18-39-21.us-west-1.computer.amazonaws.com

The webinar shows running this part of the script and failing because of $1, and then using the command vim to edit that code to enter a value for ServerName. The code sample below shows the ServerName line already edited. This lets apache know which host to server the RhoSync app from. If you have a DNS alias, you would enter that instead of the temporary URL that Amazon gives you.

	:::term
	# 3. create rhosync app
	cd /var/www/
	/var/lib/gems/1.8/bin/rhosync app rhosyncapp1
	cd rhosyncapp1/
	mkdir public
	chown -R www-data:www-data /var/www/rhosyncapp1
	touch /etc/apache2/sites-available/rhosyncapp1
	echo "
	<VirtualHost *:80>
	   ServerName ec2-5--18-39-21.us-west-1.computer.amazonaws.com
	   DocumentRoot /var/www/rhosyncapp1/public
	   <Directory /var/www/rhosyncapp1/public>
	      AllowOverride all
	      Options -MultiViews
	   </Directory>
	</VirtualHost>
	" > /etc/apache2/sites-available/rhosyncapp1
	
	# 4. enable rhosync app
	a2ensite rhosyncapp1
	/etc/init.d/apache2 reload

### Understanding Connect to Redis

Now you have a running server. At this point, you can paste the ServerName URL to the server you are building into your browser. You will see when it launches, the server complains that it can not connect to Redis. Up to this step, everything for the RhoSync app is set up: Phusion Passenger is installed, it is connected on port 80, and it is running behind apache. 

But Redis is not set up yet. This part of the script grabs the latest Redis tar ball from Google Code, compiles it, and sets up a Redis service.

	:::term
	# 5. install redis and init service
	cd /root/
	wget http://redis.googlecode.com/files/redis-2.2.5.tar.gz
	tar -xzf redis-2.2.5.tar.gz 
	cd redis-2.2.5/src/
	make; make install
	mkdir /usr/local/etc/redis
	mkdir /usr/local/redis
	
	
	wget https://gist.github.com/raw/947446/5c4b6325f892e9da477715e4935f081497957cd7/redis
	wget https://gist.github.com/raw/947485/b179e16045be76a554e2073f9c8d3dcfd073a11d/redis.conf
	adduser --system --no-create-home --disabled-login --disabled-password --group redis
	mv redis /etc/init.d/redis
	chmod +x /etc/init.d/redis
	mv redis.conf /usr/local/etc/redis/
	chown -R redis:redis /usr/local/etc/redis
	chown -R redis:redis /usr/local/redis
	
	touch /var/log/redis.log
	chown redis:redis /var/log/redis.log
	update-rc.d -f redis defaults
	
	/etc/init.d/redis start
	
	cd /root/
	rm -rf redis-*

At this point, if you have entered all the steps so far in the shell script, you can see that redis is running by entering a process inspect command.

	:::term
	ps -ef

In your browser, go back to the web application and refresh. You will now have a running RhoSync server. 

<img src="http://rhodocs.s3.amazonaws.com/rhosync-ec2-tutorial/rhosync-server-running.png" alt="RhoSync Server Running" />

Click on Submit.

### Understanding the RhoSync Web Console

In the RhoSync web console, you can click on Reset to reset the server. You can see license information; by default, it comes with a 10 device license. You can see the version of RhoSync that is running. 

<img src="http://rhodocs.s3.amazonaws.com/rhosync-ec2-tutorial/rhosync-console.png" alt="RhoSync Console" />

### Setting Up a Background Job in Resque

The last part of the shell script sets up a Resque init script and starts up a worker.

	:::term
	# 6. setup resque
	wget https://gist.github.com/raw/947510/78a36272f92aa0c67a120a36fd69ea600159676a/resque
	mv resque /etc/init.d/resque
	chmod +x /etc/init.d/resque
	
	touch /var/log/resque.log
	chown www-data:www-data /var/log/resque.log
	update-rc.d -f resque defaults
	
	/etc/init.d/resque start

If you click on Resque in the RhoSync Console, you will now see one worker running.

<img src="http://rhodocs.s3.amazonaws.com/rhosync-ec2-tutorial/resque-worker-running.png" alt="Resque Worker Running" />

If you click on the Workers tab, you can see information about the worker: its process ID, and its current state. This worker is waiting for a job.

<img src="http://rhodocs.s3.amazonaws.com/rhosync-ec2-tutorial/resque-worker-running.png" alt="Resque Worker Running" />

## Using the Public Amazon EC2 Image

As promised from the webinar, here is the public Amazon EC2 image (AMI) available in the us-west region.

ami id: ami-9f97c4da

region: us-west

specs:

* t1.micro, m1.small, or c1.medium (32-bit) instances may be used
* apache 2.2
* passenger 3.0.7
* rhosync 2.1.2
* redis 2.2.5 w/ service installed
* resque 1.14.0 w/ service installed

The installation script is the one used in the webinar and tutorial. https://github.com/rhomobile/rhosync/blob/master/bin/rhosync-setup

To run the script on a fresh instance, choose "ami-3d491a78" as the base instance and run the script as root.

To use this script: 

	:::term
	./rhosync-setup <public-dns-address>

For example:

	:::term
	./rhosync-setup ec2-50-18-39-21.us-west-1.compute.amazonaws.com

Please note this is not yet a production-tuned setup, and it was built for demonstrative purposes.  If you find bugs or problems with the setup, please feel free to post to the rhomobile google group.