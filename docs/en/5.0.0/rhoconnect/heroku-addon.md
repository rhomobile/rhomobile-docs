# RhoConnect Heroku Addon

RhoConnect is a data synchronization server and client library that keeps enterprise app data current and available on users’ mobile devices.

The information is stored locally on a user’s device, and is available even when disconnected and offline.

Full documentation on all the capabilities of RhoConnect is in the [RhoConnect Developer Reference](http://docs.rhomobile.com/rhoconnect/introduction).


Overview
--------
Combining Rhodes, RhoConnect, and `rhoconnect-rb` will allow you to create a mobile app that can connect to and manage your backend rails app seamlessly.

<p><img src='https://s3.amazonaws.com/rhodocs/rhoconnect-service/arc_rhoconnect.png' height='400' width='650'/></p>

Gem
-----
To install the latest stable RhoConnect gem, run:

    :::term
    $ [sudo] gem install rhoconnect

Using from Rails
------------
`rhoconnect-rb` is a ruby gem that allows your rails app to interact with RhoConnect.  To use RhoConnect from a rails application you must first install the `rhoconnect-rb` gem.

    :::term
    $ [sudo] gem install rhoconnect-rb

**NOTE: `rhoconnect-rb` only supports rails 3.  You will not be able to connect your app to RhoConnect with rails < 3.**

Load the `rhoconnect-rb` library

    :::ruby
    require 'rhoconnect-rb'

**NOTE: If you are using DataMapper, install the `dm-serializer` library and require it in your application.  `rhoconnect-rb` depends on this utility to interact with RhoConnect applications using JSON.**

###Configuration:

You need to define a few configuration variables.  You can define them in an initializer.  Good practice is to create a file called rhoconnect.rb in the initializers directory of your rails app.  Inside of your newly created rhoconnect.rb file you will define the following config block.

    :::ruby
    Rhoconnectrb.configure do |config|
      config.app_endpoint = "http://localhost:3000"
      config.authenticate = lambda { |credentials| return true }
    end

Inside of this block three variables are defined.

The `app_endpoint` is the location of your rails app.  Defining this variable will cause your rails app to automatically (on startup) set the rails url location in your RhoConnect instance. If you do not define this variable, you will have to manually configure the Backend App URL in the RhoConnect console.

The last variable, `authenticate`, is a lambda and can be used to setup any custom authentication you would like.  The credentials passed will be a hash containing a login and password (`{'login' => login, 'password' => password}`).  You can then write any custom authentication inside of this block.  In the example above authentication is ignored.

You can also alternatively define these variables in `environment.rb` as an environment variables.

    :::ruby
    ENV['APP_ENDPOINT']   = "http://localhost:3000"


**NOTE: environment variables take precedence over config variables**


Next you will need to include `Rhoconnectrb::Resource` in the model you want to synchronize with your mobile application:

    :::ruby
    class Product < ActiveRecord::Base
      include Rhoconnectrb::Resource
    end

Or, if you are using DataMapper:

    :::ruby
    class Product
      include DataMapper::Resource
      include Rhoconnectrb::Resource
    end

###Declaring a partition key

Your model must declare a partition key for `rhoconnect-rb`.  This partition key is used by `rhoconnect-rb` to uniquely identify the model dataset when it is stored in a RhoConnect application. It is typically an attribute on the model or related model.  `rhoconnect-rb` supports two types of partitions:

* app - No unique key will be used, a shared dataset is used for all users.
* lambda\{some lambda\} - Execute a lambda which returns the unique key string.

For example, the Product model above might have a belongs_to :user relationship.

The partition identifying the username would be declared as:

    :::ruby
    class Product < ActiveRecord::Base
      include Rhoconnectrb::Resource

      belongs_to :user

      def partition
        lambda { self.user.username }
      end
    end


Deploying to Heroku
-----------------------
To use RhoConnect from Heroku, install the RhoConnect add-on:

    :::term
    $ heroku addons:add rhoconnect

###Setup

From inside your Heroku account, setup the url to your backend service that RhoConnect will connect to.

First, click the addons drop down and select RhoConnect.
<p><img src='https://s3.amazonaws.com/rhodocs/rhoconnect-service/addon_rhoconnect.png' width="479" height="319"/></p>

You will be redirected to the admin console of your RhoConnect instance where you can set the Backend App url to your backend service.  Select Backend App Url from the right menu.
<p><img src='https://s3.amazonaws.com/rhodocs/rhoconnect-service/console.png' /></p>


From here you can enter a url to your backend service.  Enter a url (for example http://myrailsapp.com), and click the add link to save the url.


RhoConnect is now setup with your backend service.

Connecting a simple rhodes app
-------------------------------
To view a full tutorial about creating a rhodes application and the features of rhodes see [Rhodes framework](http://docs.rhomobile.com/rhodes/tutorial).

###Gem installation:

    :::term
    $ gem install rhodes

Next using the rhodes gem you can create a rhodes app.

    :::term
    $ rhodes app sample_app url_of_rhoconnect_instance

To get the value for the url_of_rhoconnect_instance argument, go to the RhoConnect console and click on the right Backend App URL link.  From there you can copy the syncserver url.

<p><img src='https://s3.amazonaws.com/rhodocs/rhoconnect-service/console_rhodesurl.png' width="750" height="280"/></p>

Other resources
----
[RhoConnect Introduction](http://docs.rhomobile.com/rhoconnect/introduction)

[RhoConnect Installation](http://docs.rhomobile.com/rhoconnect/install)

[RhoConnect Tutorial](http://docs.rhomobile.com/rhoconnect/tutorial)

[Using RhoConnect from Rails/Sinatra](http://docs.rhomobile.com/rhoconnect/rails-plugin)

[Webinar Using Rhoconnect with Rhoconnect-rb](http://player.vimeo.com/video/27495682?byline=0&portrait=0&color=de0909)