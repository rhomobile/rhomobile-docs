RhoConnect Benchmarks
===

Note, these numbers reflect synchronization performance using the rhoconnect bench utilities (see the rhoconnect/bench folder for more information).  
We will be adding more results as we test across different server environments.

## Single-core Amazon EC2 server environment
 
### Configuration
 
Servers configuration (Amazon EC2 'm1.small' instances) :

* CPU Units - 1 ECU

* CPU Cores - 1 Core

* Memory - 1.7GB

* Platform - Ubuntu (2.6.38-8-virtual)

Environment (instance #1):

* Nginx 1.0.0

* Ruby 1.8.7 (2011-02-18 patchlevel 334) [i686-linux], Ruby Enterprise Edition 2011.03
 
* Passenger 3.0.7 (mod_rails)

* Redis 2.2.11

* Rhoconnect 3.0.0 

Nginx configuration file:

<pre>
user  www-data;
worker_processes  4;

pid /var/run/nginx.pid;

events {
    worker_connections  1024;
}

http {
    passenger_root /usr/local/lib/ruby/gems/1.8/gems/passenger-3.0.7;
    passenger_ruby /usr/local/bin/ruby;
    passenger_max_pool_size 20;
    include       mime.types;
    default_type  application/octet-stream;

    sendfile    on;
    tcp_nopush  on;
    tcp_nodelay on;

    keepalive_timeout  65;

    gzip  on;

    server {
        listen 80;
        server_name  ec2-50-18-72-186.us-west-1.compute.amazonaws.com;
        root  /var/www/benchapp/public;   # Bench application #1
        # root  /var/www/blobapp/public;   # Bench application #2
        passenger_enabled on;
        passenger_min_instances 6;
    }
}
</pre>


Environment (instance #2):

* Ruby 1.8.7 (2011-02-18 patchlevel 334) [i686-linux], Ruby Enterprise Edition 2011.03

* Rhoconnect 3.0.0 code with bench scripts
 

Server instance #1 is running rhoconnect bench applications, 
the 2nd one executes rhoconnect bench scripts. 

### Bench application #1 (benchapp)
* Simulates creating multiple objects

* 100 concurrent users

* 1 device per user

* 20 object dataset

* each object has 7 attributes 

* 904 total HTTP requests

<pre>
Request clientcreate   : min: 0.0069, max: 1.6010, avg: 0.3404
Request ack-cud        : min: 0.0339, max: 3.2250, avg: 0.5910
Request clientlogin    : min: 0.0063, max: 0.8138, avg: 0.1216
Request get-cud        : min: 0.0315, max: 3.0044, avg: 0.3988
Request create-object  : min: 0.0791, max: 4.4959, avg: 1.3521
Throughput(req/s)      : 7.13629650622702
Throughput(req/min)    : 428.177790373621
</pre>

### Bench application #2 (blobapp)
* Simulates creating multiple objects

* 100 concurrent users

* 1 device per user

* 10 object dataset

* each object has variable number of attributes (from 10 to 60) + image

* 904 total HTTP requests

<pre>
Request clientcreate   : min: 0.0067, max: 2.9286, avg: 0.6870
Request ack-cud        : min: 0.0473, max: 5.5015, avg: 1.6219
Request clientlogin    : min: 0.0061, max: 3.2326, avg: 0.4687
Request get-cud        : min: 0.0382, max: 7.2202, avg: 1.0975
Request create-object  : min: 0.3765, max: 11.1387, avg: 5.1424
Throughput(req/s)  : 7.22833609137099
Throughput(req/min): 433.700165482259
</pre>

### Prepare bench applications for running on server #1

Go to rhoconnect/bench directory and configure benchapp application: 

<pre>
sudo cp -R benchapp /var/www/
cd /var/www/
sudo mkdir benchapp/public
sudo chown -R www-data:www-data benchapp/
</pre>

Do the same for blobapp bench: 
<pre>
sudo cp -R blobapp /var/www/
cd /var/www/
sudo mkdir blobapp/public
sudo chown -R www-data:www-data blobapp/
</pre>

Edit <b>Nginx</b> configuration file, set server_name and root properties to public DNS server name 
and bench application public folder respectively. After restarting server make sure that bench application is
running by visiting its web console, i.e. : 
<pre>
http://server_dns_public_name/console/ 
</pre>

### How to execute bench scripts on server #2
Before running bench scripts you need configure bench application settings properly. 

Edit rhoconnect/bench/benchapp/settings/settings.yml and set redis and syncserver properties:
<pre>
:development:
  :licensefile: settings/license.key
  :redis: server_ip_address:6379
  :syncserver: http://server_dns_public_name:80/api/application/
</pre>

Do the same for blobapp settings.yml file.

Then from rhoconnect/bench directory execute run_cud_script.sh and run_blob_script.sh scripts respectively.

## Multi-core Amazon EC2 server environments

### Configuration
 
Server configurations:

* Large (m1.large, 2 cores, 7.5GB memory)

* Extra Large (m1.xlarge, 4 cores, 15GB memory)

* High-CPU Extra Large (c1.xlarge, 8 cores, 7GB memory)

* Platform - Basic 64-bit Amazon Linux AMI 2011.09 (Red Hat based)

Software environment:

* Nginx 1.0.6

* Ruby 1.8.7 (2011-02-18 patchlevel 334) [i686-linux], Ruby Enterprise Edition 2011.03
 
* Passenger 3.0.9

* Redis 2.2.14

* Rhoconnect 3.0.0 

All above software are installed on servers by executing the following commands:
<pre>
sudo yum install make patch gcc-c++ zlib-devel curl-devel pcre-devel readline-devel openssl-devel
sudo rpm -i rhoconnect-3.0.0.noarch.rpm
</pre>

### Tested bench application (benchapp)

* Simulates creating multiple objects

* 100 concurrent users

* 1 device per user

* 20 object dataset

* each object has 7 attributes 

### Prepare bench application for running on servers
 
1. Go to rhoconnect/bench directory and configure benchapp application: 
   <pre>
sudo cp -R benchapp /opt/nginx/html
cd /opt/nginx/html/benchapp
sudo /opt/rhoconnect/bin/bundle install --without=test development
sudo mkdir public
sudo chown -R nginx:nginx /opt/nginx/html/benchapp
   </pre> 

2. Edit '/opt/nginx/conf/conf.d/rhoconnect.conf' file and point root entry to <b>/opt/nginx/html/benchapp/public</b> directory: 
   <pre>
server {
  listen      80;
  root  /opt/nginx/html/benchapp/public;
  passenger_enabled on;
}
   </pre>

3. Start redis and nginx servers:
   <pre>
sudo /etc/init.d/redis start
sudo /etc/init.d/nginx start
   </pre> 

### Benchmark results for large (2 cores) server
<pre>
Request clientcreate   : min: 0.0058, max: 1.0360, avg: 0.1138, err: 0, verification err: 0
Request ack-cud        : min: 0.0258, max: 0.1998, avg: 0.0642, err: 0, verification err: 0
Request clientlogin    : min: 0.0056, max: 0.0958, avg: 0.0128, err: 0, verification err: 0
Request get-cud        : min: 0.0234, max: 0.1777, avg: 0.0476, err: 0, verification err: 0
Request create-object  : min: 0.0526, max: 0.3074, avg: 0.1242, err: 0, verification err: 0
Throughput(req/s)  : 8.40951725551376
Throughput(req/min): 504.571035330826
</pre>

### Benchmark results for extra large (4 cores) server
<pre>
Request clientcreate   : min: 0.0080, max: 1.0194, avg: 0.0944, err: 0, verification err: 0
Request ack-cud        : min: 0.0298, max: 0.1381, avg: 0.0573, err: 0, verification err: 0
Request clientlogin    : min: 0.0091, max: 0.0591, avg: 0.0152, err: 0, verification err: 0
Request get-cud        : min: 0.0259, max: 0.1679, avg: 0.0443, err: 0, verification err: 0
Request create-object  : min: 0.0618, max: 0.2778, avg: 0.1112, err: 0, verification err: 0
Throughput(req/s)  : 8.19117682939103
Throughput(req/min): 491.470609763462
</pre>

### Benchmark results for high-cpu extra large (8 cores) server
<pre>
Request clientcreate   : min: 0.0083, max: 1.0162, avg: 0.0741, err: 0, verification err: 0
Request ack-cud        : min: 0.0277, max: 0.1803, avg: 0.0525, err: 0, verification err: 0
Request clientlogin    : min: 0.0092, max: 0.0681, avg: 0.0147, err: 0, verification err: 0
Request get-cud        : min: 0.0259, max: 0.1729, avg: 0.0474, err: 0, verification err: 0
Request create-object  : min: 0.0599, max: 0.2850, avg: 0.1102, err: 0, verification err: 0
Throughput(req/s)  : 8.08355941878833
Throughput(req/min): 485.0135651273
</pre>

All above results produced by bench script <b>cud_script</b> hosted by large (2 cores) EC2 server.