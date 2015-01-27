# Deploying RhoConnect with High Availability on Amazon Web Services

This tutorial will guide you through setting up a Redis stack and a RhoConnect application stack in the Amazon Web Service (AWS) cloud.

The RhoConnect application stack is scalable; it uses load balancing to automatically distribute and balance the incoming application traffic among all the instances you are running. You will set the maximum number of instances that the load balancer can create for your RhoConnect application.

## Logging onto the Amazon Web Service

Go to the [Amazon Web Service (AWS) Console](http://aws.amazon.com/console/) and click on the Sign in to the AWS Console button. You can sign into an existing AWS account, or create a new one.

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect-redis-aws/AWS-login-button.png" alt="AWS login button" />

Or you can open the URL for your account directly if you have the account number: 

	:::term
	https://<your_account_number>.signin.aws.amazon.com/console

Enter your User Name and Password for your AWS account, then click the Sign in button.

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect-redis-aws/aws-sign-in-account-number.png" alt="AWS login page" />

## Creating a Custom RhoConnect Image

In the AWS Management Console, change the Region to US West (N. California).

**NOTE:** The stacks created in this document only work in the N. California region.

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect-redis-aws/cloudformation-tab-ncalif-crop.png" alt="Cloud Formation page N California region" />

We provide a few public preconfigured images that contains a blank RhoConnect app for `Us West N. California` region:

 * `ami-cbc59e8e` (RhoConnect-3.1.2 with Nginx and phusion passenger)
 * `ami-0dfca748` (RhoConnect-3.2.0 with Nginx and cluster of thin servers)
 
### Launching an Instance

To create your own RhoConnect Image, launch an EC2 Image:

Click the EC2 tab, click EC2 Dashboard, then click the Launch Instance button.

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect-redis-aws/ec2-launch-instance.png" alt="Launch Instance button" />

Click the Launch Classic Wizard radio button. Click Continue.

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect-redis-aws/create-new-instance-launch-classic-wizard.png" alt="create new instance classic wizard" />

### Requesting the Instance

In the Choose an AMI section, click the Community AMIs tab.
Then paste in the AMI ID, i. e. `ami-cbc59e8e`. When the preconfigured RhoConnect AMI appears, click Select.

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect-redis-aws/request-instances-wizard-community-AMIs.png" alt="request instances - choose AMI" />

In the Instance Details section, select the Instance Type (such as Large).

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect-redis-aws/request-instances-instance-details.png" alt="request instances - instance details" />

In the Instance Details section, Advanced Instance Options screen, change nothing. Click Continue.

In the Instance Details section, Add Tags screen, enter a name for your custom RhoConnect EC2 instance in the Value Column of the Name key, then click Continue.

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect-redis-aws/request-instances-instance-details-add-tags.png" alt="request instances - add tags" />

In the Create Key Pair section, select your existing key pair or create a new keypair.

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect-redis-aws/request-instances-key-pair.png" alt="request instances - key pair" />

### Requesting the Instance - Configuring the Firewall

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect-redis-aws/request-instances-configure-firewall.png" alt="request instances - configure firewall" />

In the Configure Firewall section, click the Create New Security Group radio button.

Click the Add Rule button to add each port.

 * Add port 22 for SSH.
 * Add port 80 for HTTP.
 * Add port 6379 for redis.

**NOTE: You may use a preexisting security group if it has ports 22, 80, and 6379 open. **

Enter a firewall name and a group description, then click Continue.

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect-redis-aws/request-instances-review.png" alt="request instances - review" />

Make sure all the instance information is correct as shown on the Review page and then click Launch. 

In the window titled "Launch Instance Wizard", click Close and wait for your instance to be Running.

### Customizing the Instance

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect-redis-aws/instances-instances.png" alt="instances - instances" />

In the EC2 tab, click on Instances.

For Viewing, select Running Instances. Select your newly created RhoConnect instance and scroll down to see Private DNS in the lower section of the My Instances screen. 

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect-redis-aws/running-instances-public-dns.png" alt="running instances - public dns" />

You will need:

 * your keypair (the .pem file AWS gives you when the keypair is created)
 * the public DNS name of the Instance, which you will see as the public DNS name in the running instance. For Example: `ec2-184-72-16-39.us-west-1.compute.amazonaws.com`.
 * the username: `ec2-user`

From the command line, use ssh to login to the running instance, using the keypair, DNS name, and user name. For example:

	:::term
	$ ssh -i ~/.ssh/devkey.pem ec2-user@ec2-50-18-229-26.us-west-1.compute.amazonaws.com

Replace the blank 'rhoapp' application in the /opt/nginx/html folder with your app, and set its owner as 'nginx' user.

	:::term
	$ cd /opt/nginx/html
	# ... copy your application here under name 'rhoapp'
	$ sudo chown -R nginx:nginx rhoapp

You can test the application.

	:::term
	$ sudo /etc/init.d/redis start
	$ sudo /etc/init.d/nginx start

**NOTE: If your instance based on `ami-0dfca748` (RhoConnect-3.2.0) image, then you need to do one more step:**

    :::term
    $ sudo /etc/init.d/thin start

If everything is configured properly, then you can login to the RhoConnect web console in your browser by using the instance's public DNS name as the URL in your browser. When you are done, you can stop the application.

	:::term
	$ sudo /etc/init.d/nginx stop
	$ sudo /etc/init.d/redis stop
	
**NOTE: Do not forget also stop cluster of thin servers if your instance based on `ami-0dfca748` (RhoConnect-3.2.0):**

    :::term
    $ sudo /etc/init.d/thin stop

## Create the Image

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect-redis-aws/running-instances-public-dns.png" alt="Create Image popup" />

In the EC2 tab, right-click the RhoConnect instance and select Create Image (EBS AMI).

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect-redis-aws/create-image.png" alt="Create Image" />

In the Create Image window, enter the image name and description for your custom image. Then click Create This Image.

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect-redis-aws/create-image-request.png" alt="Create Image request" />

In the Create Image window showing that the request is received, click on "View pending image: ami-XXXXXXXX to go to your Amazon Machine Image.

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect-redis-aws/ami-image.png" alt="amazon machine image" />

Copy the AMI number; you will use it when you create the scaleable RhoConnect stack.

## Creating the Scalable RhoConnect Stack

Click the Cloud Formation tab.

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect-redis-aws/cloudformation-tab.png" alt="Cloud Formation page" />

Ensure that the Region selected is US West (N. California) and Click the Create New Stack button.

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect-redis-aws/cloudformation-tab-new-stack-button.png" alt="Cloud Formation page new stack button" />

### Create Stack - Select Template

In the Select Template section, you must select the template file for your redis stack. This is the template to run the AMI image with the Redis server. 

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect-redis-aws/create-stack-select-template.png" alt="Create Stack Select Template window" />

First, enter the name that you want for your stack into the Stack Name field.

Now get the template by either providing the URL for the template file, or by uploading the template file.

#### Providing the URL for the Template File

Click the Provide a Template URL radio button.

If your custom image based on `ami-cbc59e8e`(RhoConnect-3.1.2) image, then copy the following URL and paste it into the text field below the Provide a Template URL radio button:

`https://s3-us-west-1.amazonaws.com/rhoconnect-ca-deploy/rhoconnect_template.txt`

If your custom image based on `ami-0dfca748` (RhoConnect-3.2.0), then use this URL:

 `https://s3-us-west-1.amazonaws.com/rhoconnect-ca-deploy/rhoconnect_template-3.2.txt`

#### Uploading the Template File

Click the Upload a Template File radio button.

In another browser window, go to [https://s3-us-west-1.amazonaws.com/rhoconnect-ca-deploy/rhoconnect_template.txt](https://s3-us-west-1.amazonaws.com/rhoconnect-ca-deploy/rhoconnect_template.txt)
if your custom image based on `ami-cbc59e8e` (RhoConnect-3.1.2). 

If your custom image based on `ami-0dfca748` (RhoConnect-3.2.0), then to go
[https://s3-us-west-1.amazonaws.com/rhoconnect-ca-deploy/rhoconnect_template-3.2.txt](https://s3-us-west-1.amazonaws.com/rhoconnect-ca-deploy/rhoconnect_template-3.2.txt).

Save that text file to your computer.

Click the Choose File button, and navigate to and select your template file.

Click Continue.

### Create Stack - Specify Parameters

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect-redis-aws/create-stack-specify-parameters.png" alt="Create Stack Specify Parameters window" />

In the Create Stack: Specify Parameters window:

 * Enter the AMI image number that you saved earlier.
 * Enter the maximum number of RhoConnect application servers that you want to run in your stack. Default = 2.
 * Enter the name for your existing EC2 KeyPair to enable SSH access to the stack instances.

Click Continue.

### Create Stack - Review

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect-redis-aws/create-stack-review.png" alt="Create Stack Review window" />

Click Continue to see a window entitled \"Create Stack\" showing that the stack is being created.

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect-redis-aws/create-stack-being-created.png" alt="Create Stack being created window" />

Click Close.

## Checking the Status

In the AWS Management Console, Cloud Formation tab, click the checkbox for your stack. To see the progress of the creation of your stack, click the Refresh button; the status should become CREATE_COMPLETE soon.

To see the progress of the components in your stack, you can click the Events tab. You can click the refresh button to see the progress.

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect-redis-aws/aws-management-create-complete.png" alt="AWS Management CREATE_COMPLETE window" />

## Using the RhoConnect Application URL

In the AWS Management Console, Cloud Formation tab, click the Outputs tab. You will see a list of the Stack Outputs. 

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect-redis-aws/aws-management-outputs.png" alt="AWS Management Stack Outputs window" />

At the top of the output list is the URL of the RhoConnect application. You can click on it to see the RhoConnect Console for the running RhoConnect server.

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect-redis-aws/rhoconnect-console-4.0.png" alt="RhoConnect Console" />

To use this scaleable RhoConnect server in your Rhodes application, copy the URL for the RhoConnect application into the rhoconfig.txt file in your Rhodes application as the syncserver variable. For example:

	:::term
	syncserver = http://rhoconnec-RhoLoadB-OX64XR1IKNT2-1364705573.us-west-1.elb.amazonaws.com

## Deleting the Stack

You are charged for the stack that you have created, by the hour. When you no longer want to use the stack, you can delete it by right-clicking on the stack name in the AWS Management Console, Cloud Formation tab, and clicking Delete Stack.

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect-redis-aws/delete-stack.png" alt="Delete Stack" />

## High Availability/Failover for Redis server

The described architecture has a weak spot: a single point of failure (SPOF). If the Redis server is down or stops responding, then the entire Rhoconnect stack stops functioning. To address this issue, we need to implement failover — the continuation of a service after the failure of one or more of its components. Redis provides a very simple solution to 
configure master-slave replication that allows slave Redis servers to be exact copies of master servers. 
So if the master server goes down, we can issue a `SLAVEOF NO ONE` command to the slave and then switch RhoConnect apps to use the slave that is now the master. 

The following is a one possible scenario of how it might be done on the Amazon cloud.

Redis High Availability proposal:

* RhoConnect applications do not send queries directly to the Redis server, but communicate with the Redis Elastic Load Balancer (RELB).
* RELB has 2 monitor servers, both running Haproxy and Monit services. RELB responsibility is to do a health check of monitor servers and to distribute incoming traffic to TCP proxy service.
* Each monitor machine has a TCP proxy which relays its traffic to the master redis server.
* Monit service role is to detect failure of redis servers and start recovery process.
* Monit checks redises on a regular basis. It runs a failover script `/home/ubuntu/failover` if there is an failure to get a valid response upon performing a PING command three times in a row.
* Failover script does automatic slave -> master promotion in the case of master failure, and reconfigures Haproxy service to relay traffic to the new master redis. It spins up a new Redis EC2 instance and sets it as slave on the new master.
* The failover script uses AWS `simpleBD` service to store current redis servers configuration (master/slave/backup). So,
if another instance of monitor server detects failure and calls the failover script, it will know the current status of the redis servers
and will wait until the recovery process that was initiated by another Monit service is over. Finally, the failover script reconfigures and restarts the Monit service to track a new pair of master/slave redis servers.
* 1 Redis master
* 1 Redis slave

The URL for the CloudFormation template that implements the described proposal is available here 
[https://s3-us-west-1.amazonaws.com/rhoconnect-ca-deploy/rhoconnect-ha.txt](https://s3-us-west-1.amazonaws.com/rhoconnect-ca-deploy/rhoconnect-ha.txt)
and can be used for evaluation purposes. 

The template will create a sample scalable rhoconnect stack with 2 elastic load balancers and 5 EC2 instances.

* RhoConnect Load Balancer
* 1 EC2 instance of RhoConnect application  
* Redis Load Balancer
* 2 EC2 instances of monitor servers (Haproxy/Monit) 
* 2 EC2 instances of redis servers (master/slave)

## Setting up Redis Servers Horizontal Scaling

Under heavy load single Redis server might be a bottleneck in RhoConnect stack performance due to high network traffic, 
large memory footprints of stored data in server instance. To address redis server performance issues RhoConnect (>= v4.0.0)
 supports multiple Redis instances per app, and evenly distributing load across available Redis server instances. 

### Configure RhoConnect app to support multiple Redis instances

Edit your app `settings/settings.yml` file and replace :redis one liner by array of redis servers you are going to use: 

	:::yaml
	# ...
	:production: 
	  :licensefile: settings/license.key
	  :syncserver: http://localhost:9292/api/application/
	  :push_server: http://appname:secret@localhost:8675/
	  # Two or more redis servers per app 
	  :redis:
	    - localhost:6379
	    - localhost:6380
	    - localhost:6381
	    - localhost:6382
	    # ...


### Create a custom Amazon Image with multiple Redis instances

The following recommendations are based on Ubuntu Amazon image, where [RhoConnect Redis](http://docs.rhomobile.com/rhoconnect/deploying#deploying-rhoconnect-redis-and-push-packages-on-linux-servers) package installed and you wanted host 4 redis instances on ports 6379, 6380, 6381, and 6382 respectively. 

Rename `/opt/rhoconnect/etc/redis.conf` configuration file to `/opt/rhoconnect/etc/redis-6379.conf` and make sure that it has settings for the 1st instance: 

	:::text
	...
	daemonize yes
	pidfile /var/run/redis/redis6379.pid
	port 6379

	# DO NOT FORGET comment persistence cmds
	# save ...
	...

For other servers create `/opt/rhoconnect/etc/redis-6380.conf`, `/opt/rhoconnect/etc/redis-6381.conf` and `/opt/rhoconnect/etc/redis-6382.conf` 
 files and do similar setting for corresponding redis instances: 

	:::text
	# File /opt/rhoconnect/etc/redis-6380.conf
	...
	daemonize yes
	pidfile /var/run/redis/redis6380.pid
	port 6380
	# DO NOT FORGET comment persistence cmds
	...

	# File /opt/rhoconnect/etc/redis-6381.conf
	...
	daemonize yes
	pidfile /var/run/redis/redis6381.pid
	port 6381
	# DO NOT FORGET comment persistence cmds
	...
	
	# File /opt/rhoconnect/etc/redis-6382.conf
	...
	daemonize yes
	pidfile /var/run/redis/redis6382.pid
	port 6382
	# DO NOT FORGET comment persistence cmds
	...


Delete `/etc/init/rhoconnect-redis.conf` file if it's there.
Create upstart script `/etc/init/rhoconnect-redis-6379.conf` for the 1-st instance:

	:::text
	# /etc/init/rhoconnect-redis-6379.conf 
	
	description "Redis Datastore Server"
	# Redis is a key value in memory persistent datastore

	start on (local-filesystems and runlevel [2345])
	stop on runlevel [016]
	expect fork
	respawn

	pre-start script
	  mkdir -p /var/run/redis
	  chown redis:redis /var/run/redis
	end script

	exec start-stop-daemon --start --chuid redis:redis --pidfile /var/run/redis/redis6379.pid --umask 007 \ 
	--exec  /opt/rhoconnect/bin/redis-server -- /opt/rhoconnect/etc/redis-6379.conf

Define upstart scripts `/etc/init/rhoconnect-redis-6380.conf`, `/etc/init/rhoconnect-redis-6381.conf`, and `/etc/init/rhoconnect-redis-6382.conf`  for other instances:

	:::text
	# /etc/init/rhoconnect-redis-6380.conf
	# ...
	exec start-stop-daemon --start --chuid redis:redis --pidfile /var/run/redis/redis6380.pid --umask 007  \
	--exec /opt/rhoconnect/bin/redis-server -- /opt/rhoconnect/etc/redis-6380.conf

	# /etc/init/rhoconnect-redis-6381.conf
	# ...
	exec start-stop-daemon --start --chuid redis:redis --pidfile /var/run/redis/redis6381.pid --umask 007  \
	--exec /opt/rhoconnect/bin/redis-server -- /opt/rhoconnect/etc/redis-6381.conf

	# /etc/init/rhoconnect-redis-6382.conf
	# ...
	exec start-stop-daemon --start --chuid redis:redis --pidfile /var/run/redis/redis6382.pid --umask 007  \
	--exec /opt/rhoconnect/bin/redis-server -- /opt/rhoconnect/etc/redis-6382.conf

		
We provide a public preconfigured image with above settings for Us `West N. California` region:	

* `ami-94b496d1` (Redis-Server-2.6.7 with 4 instances on ports 6379, 6380, 6381, and 6382)

### Amazon CloudFormation Template File

This Amazon CloudFormation [template file](https://s3.amazonaws.com/rhoconnect-deploy/rhoconnect-template-2-redises-4-instances.txt)
 shows how 2 redis servers with 4 instances per server might be used for a typical rhoconncect application.

















