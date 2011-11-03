rhoconnect-rb
===

A ruby library for the [RhoConnect](http://rhomobile.com/products/rhoconnect) App Integration Server.

Using rhoconnect-rb, your application's model data will transparently synchronize with a mobile application built on the [Rhodes framework](http://rhomobile.com/products/rhodes), or any of the available [RhoConnect clients](http://rhomobile.com/products/rhoconnect/).  This client includes built-in support for [ActiveRecord](http://ar.rubyonrails.org/) and [DataMapper](http://datamapper.org/) models.

## Getting started

Load the `rhoconnect-rb` library:

	require 'rhoconnect-rb'

Note, if you are using datamapper, install the `dm-serializer` library and require it in your application.  `rhoconnect-rb` depends on this utility to interact with Rhoconnect applications using JSON.
	
## Setup the Model
Now include Rhoconnect::Resource in a model that you want to synchronize with your mobile application:

	class Product < ActiveRecord::Base
	  include Rhoconnect::Resource
	end
	
Or, if you are using DataMapper:

	class Product
	  include DataMapper::Resource
	  include Rhoconnect::Resource
	end

## Partitioning Datasets
	
Next, your models will need to declare a partition key for `rhoconnect-rb`.  This partition key is used by `rhoconnect-rb` to uniquely identify the model dataset when it is stored in a rhoconnect instance.  It is typically an attribute on the model or related model.  `rhoconnect-rb` supports two types of partitions:

* :app - No unique key will be used, a shared dataset is synchronized for all users.
* lambda { some lambda } - Execute a lambda which returns the unique key string.

For example, the `Product` model above might have a `belongs_to :user` relationship.  This provides us a simple way to organize the `Product` dataset for rhoconnect by reusing this relationship.  The partition identifying a username would be declared as:

	class Product < ActiveRecord::Base
	  include Rhoconnect::Resource
	  
	  belongs_to :user
	
	  def partition 
		lambda { self.user.username }
	  end
	end
	
Now all of the `Product` data synchronized by rhoconnect will organized by `self.user.username`.  Note: You can also used a fixed key if the dataset doesn't require a dynamic value:

	def partition
	  :app
	end
	
For more information about Rhoconnect partitions, please refer to the [Rhoconnect docs](http://docs.rhomobile.com/rhoconnect/source-adapters#data-partitioning).

## Querying Datasets

`rhoconnect-rb` installs a `/rhoconnect/query` route in your application which the Rhoconnect instance invokes to query the dataset for the dataset you want to synchronize.  This route is mapped to a `rhoconnect_query` method in your model.  This method should return a collection of objects:

	class Product < ActiveRecord::Base
	  include Rhoconnect::Resource
	  
	  belongs_to :user
	
	  def partition 
		lambda { self.user.username }
	  end
	
	  def self.rhoconnect_query(partition)
	    Product.includes(:user).where("users.username = ?",partition)
	  end
	end

In this example, `self.rhoconnect_query` returns a list of products where the partition string (provided by the rhoconnect instance) matches the `user_id` field in the products table.  

## Configuration and Authentication

### Running RhoConnect Manually

Configure RhoConnect in an initializer like `config/initializers/rhoconnect.rb` (for Rails), or directly in your application (i.e. Sinatra).  Here you will setup the rhoconnect uri (the location of your RhoConnect instance), the api\_token (see [rhoconnect:get_token](http://docs.rhomobile.com/rhoconnect/command-line#rake-tasks) rake task), and app\_endpoint (the location of your ruby app):

	config.uri   = "http://myrhoconnect.com"
	config.token = "secrettoken"
	config.app_endpoint = "http://myapp.heroku.com"
	
If `app_endpoint` is defined, your Rhoconnect instance will be configured to query data from the endpoint using the rhoconnect_query method in your model.  For example, if your `app_endpoint` is defined as "http://myapp.heroku.com", RhoConnect will query data with:

	POST http://myapp.heroku.com/rhoconnect/query

Example: 

   	Rhoconnect.configure do |config|
      config.uri   		  = "http://myrhoconnect-server.com"
      config.token 		  = "secrettoken"
	  config.app_endpoint = "http://myapp.heroku.com"
	end
	
Example with authentication:

`rhoconnect-rb` installs a `/rhoconnect/authenticate` route into your application which will receive credentials from the client.  Add block which handles the credentials:

	Rhoconnect.configure do |config|
      config.uri   = "http://myrhoconnect-server.com"
      config.token = "secrettoken"
	  config.authenticate = lambda { |credentials| 
        User.authenticate(credentials[:login], credentials[:password]) 
	  }
	end
	
### Using the [RhoConnect Heroku Addon](http://docs.rhomobile.com/rhoconnect/heroku-addon)

If you're using the [RhoConnect Heroku Addon](http://docs.rhomobile.com/rhoconnect/heroku-addon), then you can omit the config.uri and config.token (they are managed for you):

	Rhoconnect.configure do |config|
	  config.authenticate = lambda { |credentials| 
	    User.authenticate(credentials[:login], credentials[:password]) 
	  }
	end
	

## Meta
Created and maintained by Lucas Campbell-Rossen, Vladimir Tarasov and Lars Burgess.

Released under the [MIT License](http://www.opensource.org/licenses/mit-license.php).