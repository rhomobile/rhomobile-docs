# RhoConnect Tutorial

## Adding Data synchronization to Your Backend Application with RhoConnect

RhoConnect is a synchronization framework consisting of a client application (a client component on the mobile device) and a server component (a RhoConnect application) that runs on any server capable of running Ruby. The client application can be a Rhodes application, or another mobile application written without the use of Rhodes (such as an iOS/Objective C or Android/Java application).

RhoConnect requires that you write a small amount of code for the query, create, update and delete operations of your particular enterprise backend. You can write this code in JavaScript or Ruby as a RhoConnect source adapter, or you can write this code as a RhoConnect plug-in application written in Java, .NET, or Ruby on Rails.

In this tutorial, you will learn:

1. How to generate a RhoConnect Application 
2. How to create a source adapter
3. How to enable synchronization in a RhoMobile application

Full documentation of all capabilities of RhoConnect can be found in the [RhoConnect Developer Guides](introduction).

## Installing RhoConnect

You can install RhoConnect in two ways:
  
  * Install the RhoConnect gem from the [command-line](install).
  * Install RhoConnect along side the other Rhomobile Suite tools with the [Rhomobile Suite installation](../guide/rhomobile-install).

If you have been issued a RhoConnect license, you can license your app as described [here](licensing).

## Generating a RhoConnect App

Currently there are two different types of RhoConnect apps that can be generated, Ruby and JavaScript:

<div>
  <ul class="nav nav-tabs" style="margin-bottom:0">
    <li class="active"><a href="#js_app_gen" data-toggle="tab">JavaScript</a></li>
    <li><a href="#ruby_app_gen" data-toggle="tab">Ruby</a></li>
  </ul>
</div>
<div class="tab-content" id="tc-app_gen" style="border-left: 1px solid #ddd; border-right: 1px solid #ddd; border-bottom: 1px solid #ddd; padding: 10px">
  <div class="tab-pane fade active in" id="js_app_gen">
    <p>Generating a JavaScript RhoConnect app. Change `app_name` to what you would like to call your application.</p>
    <pre><code class="term">$ rhoconnect app app_name --js</code></pre>
  </div>
  <div class="tab-pane fade" id="ruby_app_gen">
    <p>Generating a Ruby RhoConnect app. Change `app_name` to what you would like to call your application.</p>
    <pre><code class="term">$ rhoconnect app app_name</code></pre>
  </div>
</div>


Ruby RhoConnect apps can also be generated using RhoStudio. To use this method, see [Generating a RhoConnect app with RhoStudio](command-line#generating-a-rhoconnect-app-with-rhostudio)

After code generation, the bundle install command will be run for the first time automatically.

NOTE: It is required to have a connection to the internet to create an application. There are certain Ruby gems that RhoConnect is dependant on.

## Starting Your RhoConnect App

Once you have generated your app code, you'll need to start your redis server and the RhoConnect app in order to ensure that everything is working properly. 

<div>
  <ul class="nav nav-tabs" style="margin-bottom:0">
    <li class="active"><a href="#mac_rc_start" data-toggle="tab">Mac</a></li>
    <li><a href="#win_rc_start" data-toggle="tab">Windows</a></li>
  </ul>
</div>
<div class="tab-content" id="tc-app_gen" style="border-left: 1px solid #ddd; border-right: 1px solid #ddd; border-bottom: 1px solid #ddd; padding: 10px">
  <div class="tab-pane fade active in" id="mac_rc_start">
    <p>Before starting your RhoConnect app on your Mac you’ll first need to install Dtach</p>
    <pre>
      <code class="term">$ rhoconnect dtach-install</code>
    </pre>
    <p>Once Dtach is installed, any app on your machine that runs in the terminal (if started with Dtach) will be able to be detached from the current terminal activity and be put into the background. In our case, redis and the RhoConnect service itself run using Dtach which lets us run them all in the same terminal window</p>
    <p>Starting RhoConnect is a two-step command process: Start redis, then start the RhoConnect app. Both commands must be run from within the RhoConnect app's directory.</p>
    <pre>
      <code class="term">$ rhoconnect redis-start</code>
    </pre>
    <pre>
      <code class="term">$ rhoconnect start</code>
    </pre>
  </div>
  <div class="tab-pane fade" id="win_rc_start">
    <p>On Windows there is no need to start the redis server because starting RhoConnect will start the redis server automatically.</p>
    <pre>
      <code class="term">C:\rc_app>rhoconnect start</code>
    </pre>
  </div>
</div>

If all went well, you should see:

    :::term
    Listening on 0.0.0.0:9292, CTRL+C to stop

This means that your RhoConnect app is up and running on localhost:9292. If you go to this address in your browser you will see the RhoConnect Console, pictured below.

<img src="https://s3.amazonaws.com/rhodocs/rhoconnect-tutorial/rhoconnect-console-4.0.png">

## Defining RhoConnect Source Adapters

Once RhoConnect is installed we’re ready to build a RhoConnect source adapter to integrate with our backend application. To define a RhoConnect source you just need to identify a handful of operations to interact with your backend data source: login, query, sync, create, update, delete and logoff. If you generated a JavaScript RhoConnect application then you will need to generate [JavaScript Source adapters](source-adapters). Likewise, if you generated a Ruby RhoConnect application, you will need to generate [Ruby Source Adapters](source-adapters-js).

To demonstrate how this works we have setup a [dummy backend](http://rhostore.herokuapp.com) for a `Product` model. This backend will allow you to perform all CRUD operations, however the data will be reset every hour.

Let's go ahead and create a source adapter for this model.

<div>
  <ul class="nav nav-tabs" style="margin-bottom:0">
    <li class="active"><a href="#js_gen_source" data-toggle="tab">JavaScript</a></li>
    <li><a href="#ruby_gen_source" data-toggle="tab">Ruby</a></li>
  </ul>
</div>
<div class="tab-content" id="tc-app_gen" style="border-left: 1px solid #ddd; border-right: 1px solid #ddd; border-bottom: 1px solid #ddd; padding: 10px">
  <div class="tab-pane fade active in" id="js_gen_source">
      <pre><code class="term"> rhoconnect source product --js</code></pre>

  </div>
  <div class="tab-pane fade" id="ruby_gen_source">
      <pre><code class="term"> rhoconnect source product</code></pre>
      You can also accomplish this from RhoStudio <a href="source-adapters#generating-the-source-adapter-from-rhostudio"> as explained in the Ruby Source Adapter guide</a>
  </div>
</div>

Now let's replace the contents of the Source Adapter generated code. Normally, you will replace each method with code specific to your backend.

<div>
  <ul class="nav nav-tabs" style="margin-bottom:0">
    <li class="active"><a href="#js_modify_adapter" data-toggle="tab">JavaScript - models/js/product.js</a></li>
    <li><a href="#ruby_modify_adapter" data-toggle="tab">Ruby - models/ruby/product.rb</a></li>
  </ul>
</div>
<div class="tab-content" id="tc-app_gen" style="border-left: 1px solid #ddd; border-right: 1px solid #ddd; border-bottom: 1px solid #ddd; padding: 10px">
  <div class="tab-pane fade active in" id="js_modify_adapter">
      <pre><code class="javascript">
var rc = require('rhoconnect_helpers');
var http = require('http');
var host = 'rhostore.herokuapp.com';

var Product = function(){

  this.login = function(resp){
    resp.send(true);
  };

  this.query = function(resp){
    var result = {};
    var str = '';

    http.request('http://' + host + '/products.json', function(res){
      res.on('data', function(chunk){
        str += chunk;
      });
      res.on('end', function(){
        var data = JSON.parse(str);
        for(var i in data){
          var item = data[i];
          result[item.product.id.toString()] = item.product;
        }
        resp.send(result);
      });
    }).end();
  };

  this.create = function(resp){
    var postData = JSON.stringify({ 'product': resp.params.create_object });
    var str = '';
    var options = {
      host: host,
      path: '/products.json',
      method: 'POST',
      headers: { 
        'Content-Type': 'application/json', 
        'Content-Length': postData.length
      }
    };
    var req = http.request(options, function(res){
      res.on('data', function(chunk){
        str += chunk;
      });
      res.on('end', function(){
        var data = JSON.parse(str);
        resp.send(data.product.id.toString());
      });
    });
    req.write(postData);
    req.end();
  };

  this.update = function(resp){
    var objId = resp.params.update_object.id;
    var putData = JSON.stringify({ "product": resp.params.update_object });
    // Remove the id from the hash, we don't need it.
    delete putData.id;
    var options = {
      host: host,
      path: '/products/' + objId + '.json',
      method: 'PUT',
      headers: { 
        'Content-Type': 'application/json',
        'Content-Length': putData.length
      }
    };
    var req = http.request(options, function(res){
      res.on('data', function(){});
      res.on('end', function(){
        resp.send(true);
      });
      res.on('error', function(){
        resp.send(false);
      });
    });
    req.write(putData);
    req.end();
  };

  this.del = function(resp){
    var objId = resp.params.delete_object.id;
    var options = {
      host: host,
      path: '/products/' + objId + '.json',
      method: 'DELETE',
      headers: { 'Content-Type': 'application/json' }
    };
    var req = http.request(options, function(res){
      res.on('data', function(){});
      res.on('end', function(){
        resp.send(true);
      });
      res.on('error', function(){
        resp.send(false);
      });
    });
    req.end();
  };

  this.logoff = function(resp){
    resp.send(true);
  };

  this.storeBlob = function(resp){
    // TODO: Handle post requests for blobs here.
    // Reference the blob object's path with resp.params.path.
    new rc.Exception(
      resp, "Please provide some code to handle blobs if you are using them."
    );
  };
};

module.exports = new Product();       
      </code></pre>

  </div>
  <div class="tab-pane fade" id="ruby_modify_adapter">
      <pre><code class="ruby"> 
require 'json'
require 'rest_client'

class Product &lt; Rhoconnect::Model::Base

  def initialize(source)
    @base = 'http://rhostore.herokuapp.com/products'
    super(source)
  end

  def query(params=nil)
    rest_result = RestClient.get("#{@base}.json").body

  if rest_result.code != 200
    raise Rhoconnect::Model::Exception.new("Error connecting!")
  end
    parsed = JSON.parse(rest_result)

    @result={}
    parsed.each do |item|
      @result[item["product"]["id"].to_s] = item["product"]
    end if parsed
  end

  def create(create_hash)
    res = RestClient.post(@base,:product => create_hash)

    # After create we are redirected to the new record.
    # We need to get the id of that record and return
  # it as part of create so rhoconnect can establish a link
  # from its temporary object on the client to this newly
  # created object on the server
    JSON.parse(
    RestClient.get("#{res.headers[:location]}.json").body
  )["product"]["id"]
  end

  def update(update_hash)
    obj_id = update_hash['id']
    update_hash.delete('id')
    RestClient.put("#{@base}/#{obj_id}",:product => update_hash)
  end

  def delete(delete_hash)
    RestClient.delete("#{@base}/#{delete_hash['id']}")
  end
end
      </code></pre>
  </div>
</div>

The above example will work with our test backend, if you are attempting to connect to your own backend data, you should read more about [Source Adapters](source-adapters-intro) and the corresponding methods:

* [JavaScript Source Adapters](source-adapters-js)
* [Ruby Source Adapters](source-adapters)


## Testing Sync From the Client

To test to make sure the sync is working, we need to create a basic RhoMobile application.

### Creating the RhoMobile Application

1. Open RhoStudio
2. Select File / New Project / RhoMobile Application
3. After choosing an application name click `Finish`

### Adding the Product Model

1. While in RhoStudio, right click on the project you just created
2. Choose New / RhoMobile Model
3. Enter `Product` in the `Model name` field
4. Enter `name,brand,quantity,price` in the `Model attributes` field

NOTE: Pay attention to spelling of the model and attributes, as the sample code is assuming that it will match exactly to the JSON object coming from the backend.

### Enabling Sync

1) Open the folder `app\Product` and edit the file `product.rb`

2) Uncomment the line `enable :sync` line.
        

    :::ruby
    # The model has already been created by the framework, and extends Rhom::RhomObject
    # You can add more methods here
    class Product
      include Rhom::PropertyBag

      # Uncomment the following line to enable sync with Product.
      enable :sync

      #add model specific code here
    end

### Adding Product views

1) Open the file `app\index.erb`

2) Replace the line: 

    :::html
    <li><a href="#">Add link here...</a></li>

with:

    :::html
    <div data-role="content">
      <ul data-role="listview">
        <li><a href="Product">Product</a></li>
      </ul>
    </div>

### Configuring your SyncServer
Make sure your server URL is configured in the Rhomobile app. If your server is running on YourIPAddress with the port 9292, the following line should be at the bottom of your corresponding Rhodes app, `rhoconfig.txt`:

    :::text
    syncserver = 'http://YourIPAddress:9292'

NOTE: If you are using Android, syncserver cannot be set to localhost, you must use your machine's local IP Address. Ex: 192.168.x.x


### Syncing Data
To sync with the RhoConnect server, the Rhodes client must log in. The Rhodes generated app includes some screens for login and other common functions, which you will typically modify to suit the design of your application. The generated UI is useful since it allows you to focus on the core functionality of your application before implementing the important, but mundane, details of user authentication and settings.

<div class="row-fluid">
  <div class="span4">
    <p>
      1. From the home page in the Rhodes app, click on the login button in the upper right corner. Alternatively, you can click on the tool icon at the bottom of the screen to go to the Settings screen.
    </p>
    <p>
      2. Login using any name & password. The generated code allows any login, but you can modify that in application.rb.
    </p>
  </div>
  <div class="span4" style="text-align:center">
    <p>
      <b>App Home Page</b>
    </p>
    <img src="https://s3.amazonaws.com/rhodocs/rhoconnect-tutorial/rhoconnect-client-logged-out.png">
  </div>
  <div class="span4" style="text-align:center">
    <p>
      <b>App Login Page</b>
    </p>
    <img src="https://s3.amazonaws.com/rhodocs/rhoconnect-tutorial/rhoconnect-client-login.png">
  </div>
</div>


<div class="row-fluid">
  <div class="span4">
    <p>
      3. If login is successful, you will see a Client ID in the settings screen. The ClientID is generated the first time you log in and is stored in the client database. It serves as a unique identifier which is required for rhoconnect. (Note: this value will persist across logins, but if you reset the client database or the user re-installs the app, a new ClientID will be generated.)      
    </p>
    <p>
      4. Sync is triggered automatically. Click on the home icon and then select “Products” and you should see the list of product records from the server.
    </p>
  </div>
  <div class="span4" style="text-align:center">
    <p>
      <b>App Settings Page With Client ID</b>
    </p>
    <img src="https://s3.amazonaws.com/rhodocs/rhoconnect-tutorial/rhoconnect-client-settings.png">
  </div>
  <div class="span4" style="text-align:center">
    <p>
      <b>List of Products on Local Storage</b>
    </p>
    <img src="https://s3.amazonaws.com/rhodocs/rhoconnect-tutorial/rhoconnect-client-products.png">
  </div>
</div>


<p>5. You can now add, modify or delete products to your app locally and then sync them to the <a href="http://rhostore.herokuapp.com">Rhostore</a> back-end.</p>

<div class="row-fluid">
  <div class="span4" style="text-align:center">
    <p>
      <b>Create New Product Page</b>
    </p>
    <img src="https://s3.amazonaws.com/rhodocs/rhoconnect-tutorial/rhoconnect-client-create-new-product.png">
  </div>
  <div class="span4" style="text-align:center">
    <p>
      <b>Rhostore Before Sync</b>
    </p>
    <img src="https://s3.amazonaws.com/rhodocs/rhoconnect-tutorial/rhoconnect-rhostore-before-sync.png">
  </div>
  <div class="span4" style="text-align:center">
    <p>
      <b>Rhostore After Sync</b>
    </p>
    <img src="https://s3.amazonaws.com/rhodocs/rhoconnect-tutorial/rhoconnect-rhostore-after-sync.png">
  </div>
</div>

<p>6. You can also simulate changes that occur on the backend, by using the <a href="http://rhostore.herokuapp.com/products">CRUD operations from your browser</a>. These changes will not appear on the device for at least 5 minutes. This is due to the default setting for the RhoConnect application to query the backend for updates. You can modify this by changing the `poll_interval` setting in the `settings\setting.yml` file in the RhoConnect application.
</p>

Now that you have your RhoConnect server successfully syncing to your back-end application, you're ready to move on to more advanced topics using RhoConnect such as PUSH notifications, RhoConnect plug-ins, and sync conflict resolution to name a few. For more information on these and other topics, refer to our [RhoConnect Guides](introduction).