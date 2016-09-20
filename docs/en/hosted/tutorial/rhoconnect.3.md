# RhoConnect Tutorial
To test to make sure the sync is working, we need to create a basic RhoMobile application. This can be done either through the command line interface or through RhoStudio.

## Creating the RhoMobile client Application

<div>
  <ul class="nav nav-tabs" style="margin-bottom:0">
    <li class="active"><a href="#cli_app_gen" data-toggle="tab">Command Line Interface</a></li>
    <li><a href="#rs_app_gen" data-toggle="tab">RhoStudio</a></li>
  </ul>
</div>
<div class="tab-content" id="tc-app_gen" style="border-left: 1px solid #ddd; border-right: 1px solid #ddd; border-bottom: 1px solid #ddd; padding: 10px">
  <div class="tab-pane fade active in" id="cli_app_gen">
    <div class="row-fluid">
      <div class="span6">
        <p>1. Open your terminal or preferred command line interface.</p>
        <p>2. Run the following command without the brackets.</p>
        <pre><code class="term">$ rhodes app &lt;appname&gt;</code></pre>
      </div>
      <div class="span4 offset2" style="text-align:center">
        <!-- <img src="https://s3.amazonaws.com/rhodocs/rhoconnect-tutorial/rhoconnect-client-new-project.png"> -->
      </div>
    </div>
  </div>
  <div class="tab-pane fade" id="rs_app_gen">
    <div class="row-fluid">
      <div class="span6">
        <p>1. Open RhoStudio</p>
        <p>2. Select File / New Project / RhoMobile Application</p>
        <p>3. After choosing an application name click Finish</p>
      </div>
      <div class="span4 offset2" style="text-align:center">
        <img src="https://s3.amazonaws.com/rhodocs/rhoconnect-tutorial/rhoconnect-client-new-project.png">
      </div>
    </div>
  </div>
</div>

## Adding the Product Model

<div>
  <ul class="nav nav-tabs" style="margin-bottom:0">
    <li class="active"><a href="#cli_model_gen" data-toggle="tab">Command Line Interface</a></li>
    <li><a href="#rs_model_gen" data-toggle="tab">RhoStudio</a></li>
  </ul>
</div>
<div class="tab-content" id="tc-app_gen" style="border-left: 1px solid #ddd; border-right: 1px solid #ddd; border-bottom: 1px solid #ddd; padding: 10px">
  <div class="tab-pane fade active in" id="cli_model_gen">
    <div class="row-fluid">
      <div class="span6">
        While in the command line, run the following command without the brackets.</p>
        <pre><code class="term">$ rhodes model &lt;modelname&gt; &lt;comma,seperated,list,of,attributes&gt;</code></pre>
      </div>
      <div class="span4 offset2" style="text-align:center">
        <!-- <img src="https://s3.amazonaws.com/rhodocs/rhoconnect-tutorial/rhoconnect-client-new-model.png"> -->
      </div>
    </div>
  </div>
  <div class="tab-pane fade" id="rs_model_gen">
    <div class="row-fluid">
      <div class="span6">
        <p>1. While in RhoStudio, right click on the project you just created</p>
        <p>2. Choose New / RhoMobile Model</p>
        <p>3. Enter <code>Product</code> in the <code>Model name</code> field</p>
        <p>4. Enter <code>name,brand,quantity,price</code> in the <code>Model attributes</code> field</p>
      </div>
      <div class="span4 offset2" style="text-align:center">
        <img src="https://s3.amazonaws.com/rhodocs/rhoconnect-tutorial/rhoconnect-client-new-model.png">
      </div>
    </div>
  </div>
</div>

NOTE: Pay attention to spelling of the model and attributes, as the sample code is assuming that it will match exactly to the JSON object coming from the back-end.

## Enabling Sync

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

## Adding Product views

1) Open the file `app\index.erb`

2) Replace the line:

    :::html
    <li><a href="#">Add link here...</a></li>

with:

    :::html
    <li><a href="Product">Product</a></li>

## Configuring your SyncServer
Make sure your server URL is configured in the Rhomobile app. If your server is running on YourIPAddress with the port 9292, the following line should be at the bottom of your corresponding Rhodes app, `rhoconfig.txt`:

    :::text
    syncserver = 'http://YourIPAddress:9292'

NOTE: If you are using Android, syncserver cannot be set to localhost, you must use your machine's local IP Address. Ex: 192.168.x.x


## Syncing Data
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

<p>6. You can also simulate changes that occur on the backend, by using the <a href="http://rhostore.herokuapp.com">CRUD operations from your browser</a>. These changes will not appear on the device for at least 5 minutes. This is due to the default setting for the RhoConnect application to query the backend for updates. You can modify this by changing the `poll_interval` setting in the `settings\setting.yml` file in the RhoConnect application.
</p>

Now that you have your RhoConnect server successfully syncing to your back-end application, you're ready to move on to more advanced topics using RhoConnect such as PUSH notifications, RhoConnect plug-ins, and sync conflict resolution to name a few. For more information on these and other topics, refer to our [RhoConnect Guides](../../../5.0.25/rhoconnect/introduction).

For a tutorial on deploying your RhoConnect app in the cloud, continue on to the next page.