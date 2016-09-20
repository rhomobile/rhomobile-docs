RhoConnect Source Adapters (Ruby)
===

## Generating the Source Adapter from RhoStudio

To generate a RhoConnect source adapter and create the associated Controller/Model templates, open your RhoConnect project in RhoStudio. Then right-click on the project in the Project Explorer and select New->RhoConnect Source Adapter.

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect-tutorial/new-rhoconnect-source-adapter-menu-4.0.png"/>

In the Source Adapter Information window, enter the name for your source adapter.

Click the Finish button to create the source adapter.

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect-tutorial/source-adapter-information-4.0.png"/>

After pressing the Finish button, you'll see the RhoConnect source adapter generator script output in the output console (Rhomobile build console).

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect-tutorial/rhoconnect-source-generator-output-4.0.png"/>

## Generating the Source Adapter from the Command Line

To generate a source adapter for your RhoConnect application, you can run the `rhoconnect source` command within your application directory.

    :::term
    $ rhoconnect source
    Usage: rhoconnect source name [options] [args]

    Generates a new source adapter.

    Required:
      name        - the source adapter name(i.e. product)


    Options specific for this generator:

    General options:
        -p, --pretend                    Run, but do not make any changes.
        -f, --force                      Overwrite files that already exist.
        -s, --skip                       Skip files that already exist.
        -d, --delete                     Delete files that have previously been generated with this generator.
            --no-color                   Don't colorize the output
        -h, --help                       Show this message
            --debug                      Do not catch errors

For the storeserver application example, within the storeserver directory, run:

    :::term
    $ rhoconnect source product
    Generating with source generator:
         [ADDED]  models/ruby/product.rb
         [ADDED]  controllers/ruby/product_controller.rb
         [ADDED]  spec/models/ruby/product_spec.rb
         [ADDED]  spec/controllers/ruby/product_controller_spec.rb

## Understanding the Generated Controller File

The generated source adapter's controller file (in this case, product_controller.rb) is similar to the code listing below.
Its purpose is to define the RhoConnect application HTTP end point and to register the corresponding SYNC routes.
Under the hood - it's an isolated Sinatra application designated to handle all incoming Product requests:

    :::ruby
    class ProductController < Rhoconnect::Controller::Base
      register Rhoconnect::EndPoint

      # add all SYNC routes
      register Rhoconnect::Handler::Sync

      # add your custom Product routes here
    end

## Understanding the Generated Model File

The generated source adapter's model file (in this case, product.rb) is similar to the code listing below:

    :::ruby
    class Product < Rhoconnect::Model::Base
      def initialize(source)
        super(source)
      end

      def login
        # TODO: Login to your data source here if necessary
      end

      def query
        # TODO: Query your backend data source and assign the records
        # to a nested hash structure called @result. For example:
        # @result = {
        #   "1"=>{"name"=>"Acme", "industry"=>"Electronics"},
        #   "2"=>{"name"=>"Best", "industry"=>"Software"}
        # }
        raise Rhoconnect::Model::Exception.new("Please provide some code to read records from the backend data source")
      end

      def create(create_hash)
        # TODO: Create a new record in your backend data source
        # If your rhodes rhom object contains image/binary data
        # (has the image_uri attribute), then a blob will be provided
        raise "Please provide some code to create a single record in the backend data source using the create_hash"
      end

      def update(update_hash)
        # TODO: Update an existing record in your backend data source
        raise "Please provide some code to update a single record in the backend data source using the update_hash"
      end

      def delete(delete_hash)
        # TODO: write some code here if applicable
        # be sure to have a hash key and value for "object"
        # for now, we'll say that its OK to not have a delete operation
        # raise "Please provide some code to delete a single object in the backend application using the object_id"
      end

      def logoff
        # TODO: Logout from the data source if necessary
      end
    end

During generation of the model, the `settings/settings.yml` file will be updated with some default options for the corresponding source:

    :::yaml
    :sources:
        Product:
        :poll_interval: 300


## Source Adapter API

### Source Adapter Controller API (Ruby)

You can use the following methods and techniques inside of your source adapter controller.

* [register Rhoconnect::EndPoint](../rhoconnectapi/source-adapter-controller-api-ruby#register Rhoconnect::EndPoint) - adds Controller into the application's URL Map.
* [register Rhoconnect::Handler::Sync](../rhoconnectapi/source-adapter-controller-api-ruby#register Rhoconnect::Handler::Sync) - adds SYNC routes to your Controller.
* [pre-defined conditions](../rhoconnectapi/source-adapter-controller-api-ruby#pre-defined-conditions) - adds common helpers and conditions to your routes.
* [@model](../rhoconnectapi/source-adapter-controller-api-ruby#@model) - Access to the source adapter's model instance.
* [params,request,response](../rhoconnectapi/source-adapter-controller-api-ruby#sinatra-context) - Allows to use any standard Sinatra context objects.
* [Sinatra framework](../rhoconnectapi/source-adapter-controller-api-ruby#sinatra-framework) - Allows to use any standard Sinatra features.

### Source Adapter Model API (Ruby)

You can write the following methods for your source adapter model. These methods will be called by the controller at run-time and allow your source adapter model to interact with your backend service.

* [login](../rhoconnectapi/source-adapter-model-api-ruby#login) - Login to your backend service (optional).
* [logoff](../rhoconnectapi/source-adapter-model-api-ruby#logoff) - Logoff from your backend service (optional).
* [query](../rhoconnectapi/source-adapter-model-api-ruby#query) - Query your backend service and build a hash of hashes (required).
* [search](../rhoconnectapi/source-adapter-model-api-ruby#search) - Search your backend based on params and build a hash of hashes (optional).
* [create](../rhoconnectapi/source-adapter-model-api-ruby#create) - Create a new record in the backend (optional).
* [update](../rhoconnectapi/source-adapter-model-api-ruby#update) - Update an existing record in the backend.
* [delete](../rhoconnectapi/source-adapter-model-api-ruby#delete) - Delete an existing record in the backend.
* [current_user](../rhoconnectapi/source-adapter-model-api-ruby#currentuser) - Returns the current user which called the adapter's model.
* [stash_result](../rhoconnectapi/source-adapter-model-api-ruby#stashresult) - Saves the current state of `@result` to redis and assigns it to `nil`.
* [store_blob](../rhoconnectapi/source-adapter-model-api-ruby#store_blob) - Save the incoming blob data into permanent storage for the future processing.
* [self.partition_name](../rhoconnectapi/source-adapter-model-api-ruby#self.partition_name) - Implement this class method to provide custom user partition.
* [get_data](../rhoconnectapi/source-adapter-model-api-ruby#get_data) - Get the model document data from Store.

## Data Partitioning

Data is stored in RhoConnect using [redis sets](http://redis.io/commands#set).  The `@result` hash from the `query` method is stored in redis and referred to as the Master Document or MD.

The MD is referenced in RhoConnect by a corresponding partition.  Source adapters can partition data in two ways: user and app.  As you might have guessed, user partitioning stores a copy of the source adapter MD for each user (one copy shared across all devices for a given user).

Likewise, app partitioning stores one copy of the source adapter MD for the entire application (all users and devices share the same data).  App partitioning can be particularly useful if you have source adapter models which retrieve large amounts of data that is fixed from user to user, for example a global product catalog.  Using app partitioning wherever possible ***greatly reduces*** the amount of data in redis.

### User Partition
User partitioning is the default mode for source adapters, however you can explicitly define it in `settings/settings.yml` with:

    :::yaml
    :sources:
      Product:
      :poll_interval: 300
      :partition_type: user

### App Partition
Enable app partitioning the same way:

    :::yaml
    :sources:
      Product:
      :poll_interval: 300
      :partition_type: app

Now you have a single copy of the `Product` source adapter dataset for all users.

## Pass Through
RhoConnect provides a simple way to keep data out of redis.  If you have sensitive data that you do not want saved in redis, add the `pass_through` option in settings/settings.yml for each source:

    :::yaml
    :sources:
      Product:
      :pass_through: true

**NOTE: When running query or search the entire data set will be returned from your backend service. **

## Redis Interface
RhoConnect provides a simple redis interface for saving/retrieving arbitrary data.  This is useful if you want to save data in your application to be used later (i.e. in an async job or a subsequent source adapter execution).

    :::ruby
    Store.put_value('hello','world')

    Store.get_value('hello') #=> 'world'

    # You can store nested hashes too!
    Store.put_data(
      'mydata',
      {
        '1' => { 'hello' => 'world' }
      }
    )

    Store.get_data('mydata') #=> { '1' => { 'hello' => 'world' } }

## Handling Exceptions
If your source adapter model raises an instance of `Rhoconnect::Model::Exception`, the resulting message will be sent to the client's sync callback(in `@params['error_message']`).  See the rhodes [sync exception handling docs](../guide/using_rhoconnect#handling-exceptions) for more details.

You can use `Rhoconnect::Model::Exception` as a convenient way to notify your application of various error conditions.

For example, your delete method might check the web service HTTP response code was 200 to make sure the record was deleted:

    :::ruby
    def delete(delete_hash)
      rest_result = RestClient.delete("#{@base}/#{delete_hash['id']}")
      if rest_result.code != 200
        raise Rhoconnect::Model::Exception.new("Error deleting record.")
      end
    end

**NOTE: When your adapter method raises an exception, no data is removed from the adapter's master document.**

The following exceptions are provided for convenience:

### `Rhoconnect::Model::LoginException`
Useful to raise in your model's login method if it failed.

### `Rhoconnect::Model::LogoffException`
Similar to login, raise this if your model's logoff failed.

### `Rhoconnect::Model::ServerTimeoutException`
Raise if your backend service connection times out.

### `Rhoconnect::Model::ServerErrorException`
Raise this if your backend service returns a non-successful response.


## Handling Conflicts

Handling conflicts in RhoConnect follows the same pattern as handling exceptions.  Once your model method has detected a conflict, you can raise a `Rhoconnect::Model::ObjectConflictError` which will be sent to your application's sync callback.

### `Rhoconnect::Model::ObjectConflictError`
Raise this if your model has detected a conflict.

    :::ruby
    def update(update_hash)
      obj_id = update_hash['id']
      update_hash.delete('id')
      rest_result = RestClient.put("#{@base}/#{obj_id}",:product => update_hash)
      if rest_result.code != 200
        raise Rhoconnect::Model::ObjectConflictError.new("Conflict detected updating the object.")
      end
    end

## Sample Model
Here's a complete example of how the completed [product model might look](https://github.com/rhomobile/store-server/blob/master/sources/product.rb):

    :::ruby
    require 'json'
    require 'rest_client'

    class Product < Rhoconnect::Model::Base

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

## A RhoConnect Query

If you're doing a read-only non-authenticated source adapter, you can just write one method, query, to retrieve records as we describe here. The following is a sample query method to interact with a simple product catalog (available at http://rhostore.herokuapp.com) that exposes a REST interface.  Note that RhoConnect can work with any protocol. This example shows JSON over HTTP with a REST interface, since that is common. The RhoConnect source adapter is Ruby code and there are ruby libraries (aka gems) that will make it easy to connect to and parse whatever you need -- the query code would just be slightly different.

For a more complete example of rewriting the source adapter methods (such as create, update, and delete), refer to the [source adapter example](source-adapters#sample-adapter) in the RhoConnect Developer Reference.

Our sample web service for returning all products in the catalog (http://rhostore.herokuapp.com/products.json) returns data like this:

    :::json
    [
        {
      "product": {
        "name": "iPhone",
        "brand": "Apple",
        "updated_at": "2010-05-11T02:04:57Z",
        "price": "$299.99",
        "quantity": "5",
        "id": 649,
        "sku": "1234",
        "created_at": "2010-05-11T02:04:57Z"
      }
      },
        {
        "product": {
        "name": "Accord",
        "brand": "Honda",
        "updated_at": "2010-05-13T22:24:48Z",
        "price": "$6000",
        "quantity": "",
        "id": 648,
        "sku": "123",
        "created_at": "2010-05-11T02:04:53Z"
      }
      }
    ]

The Ruby code for parsing that data, sources.product.rb, is listed below. It uses the standard Ruby JSON library and the RestClient library for easy access to the REST web service. This example uses the id of the product record as the hash key. Note that the key for this hash must be a string and the value can be any set of name-value pairs which are represented as a Ruby hash. The instance variable @result must be set by the query method to this "hash of hashes", indexed by a unique identifier, so that the base SourceAdapter class sync method can populate Redis data store.

You can edit sources/product.rb within RhoStudio, or you can navigate to it within your RhoConnect application folder and edit it with a text editor.

We need to declare the standard libraries that we are using at the top of the sources/product.rb file:

    :::ruby
    require 'json'
    require 'rest_client'

For convenience, we'll add an instance variable @base which contains the base URL of the web service and sets the value in the constructor:

    :::ruby
    def initialize(source)
      @base = 'http://rhostore.herokuapp.com/products'
      super(source)
    end

Then fill in the query method:

    :::ruby
    def query
      parsed=JSON.parse(RestClient.get("#{@base}.json").body)

      @result={}
      if parsed
        parsed.each do |item|
          key = item["product"]["id"].to_s
          @result[key]=item["product"]
        end
      end
    end

**NOTE: The code above could be much more concise, but it is written to be easily readable by programmers who are unfamiliar with the Ruby language. If you are new to Ruby, you can read [Ruby from other languages](http://www.ruby-lang.org/en/documentation/ruby-from-other-languages/) for a good introduction.**

Each hash key in the inner hash represents an attribute of an individual object.  All datatypes must be strings (so the hash values need to all be strings, not integers).

For example:

    :::ruby
    @result = {
      "1" => {
        "name" => "inner tube",
        "brand" => "Michelin"
      },
      "2" => {
      "name" => "tire",
      "brand" => "Michelin"
      }
    }

## Creating Objects with RhoConnect

For your create method, the RhoConnect server will pass you a hash containing the new record, called "create_hash". For example, it might be:

    :::ruby
    {
      "name" => "Hovercraft",
      "brand" => "Acme"
    }

The RhoConnect sources/product.rb create method will be called once for every object that has been created on the client since the last sync.  Your code for create (or edit or delete) needs to use this populated array to do its work.  Below is an example of a create method against the [rhostore](http://rhostore.herokuapp.com), which accepts an HTTP POST to perform a create action. The create method should return a unique id string for the object for it to be later modifiable by the client. If no id is returned, then you should treat the client object as read only, because it will not be able to be synchronized.

    :::ruby
    def create(create_hash)
      result = RestClient.post(@base, :product => create_hash)

      # after create we are redirected to the new record.
      # The URL of the new record is given in the location header
      location = "#{result.headers[:location]}.json"

      # We need to get the id of that record and return it as part of create
      # so rhoconnect can establish a link from its temporary object on the
      # client to this newly created object on the server

      new_record = RestClient.get(location).body
      JSON.parse(new_record)["product"]["id"].to_s
    end

You will need to restart RhoConnect to reload the source adapter after modifying code. Note that the object will be created on the client right away, but it will be sent to the server on the next sync.

## Authentication

The generated RhoConnect application code includes a file at the root of the directory called "application.rb" which contains a hook for authentication. The complete file looks like this:

    :::ruby
    class Application < Rhoconnect::Base
        class << self
          def authenticate(username,password,session)
            true # do some interesting authentication here...
          end

          # Add hooks for application startup here
          # Don't forget to call super at the end!
          def initializer(path)
            super
          end

          # Calling super here returns rack tempfile path:
          # i.e. /var/folders/J4/J4wGJ-r6H7S313GEZ-Xx5E+++TI
          # Note: This tempfile is removed when server stops or crashes...
          # See http://rack.rubyforge.org/doc/Multipart.html for more info
          #
          # Override this by creating a copy of the file somewhere
          # and returning the path to that file (then don't call super!):
          # i.e. /mnt/myimages/soccer.png
          def store_blob(blob)
            super #=> returns blob[:tempfile]
          end
        end
      end

    Application.initializer(ROOT_PATH)

If your back end web service requires authentication, add code to the authenticate method and return true if authentication was successful or false to deny access to the application from this client. For example:

    :::ruby
    def authenticate(username, password, session)
        # ... connect to backend using API and authenticate ...
        if success
          # save the data for later use in the source adapter
          Store.put_value("username:#{username}:token",username)
        end
        return success
      end


## Compatibility with older versions of RhoConnect

The RhoConnect Source Adapter Controller/Model concept was introduced in RhoConnect 4.0. In previous versions, a Source Adapter consisted only of one class - which is now has been moved to Source Adapter model. "Controller" part of the Source Adapter has been hidden inside of the RhoConnect library code. This posed a significant obstacle in a way how the developer could utilize the code and the common techniques. To overcome this obstacle, RhoConnect 4 provides you with direct access to the Controller allowing you to customize route behavior and utilize all of the powerful sinatra plugins/extensions that are available.

At the same time, applications that were written using the pre-4.0 versions of RhoConnect will still continue to function without modifications for at least one version cycle. This is accomplished by providing the "default" implementation of the controller for the pre-4.0 Source Adapters. All the Model APIs that are described throughout the documentation are still applicable to the pre-4.0 Source Adapters. In this sense - the RhoConnect 4 Source Adapter Model class and pre-4.0 Source Adapter are interchangeable. 

However, we strongly recommend migrating your pre-4.0 application using this [guide](migration).  RhoConnect 4 will print a warning at startup if it detects a pre-4.0 code structure.

    RhoConnect has detected that you're using deprecated Application class.

      Application class support was removed in RhoConnect 4.1.
      Please, migrate your Application class into ApplicationController.

      For more details, see RhoConnect Migration guidelines at 
      docs.rhomobile.com

    RhoConnect has detected that you're using deprecated SourceAdapter classes.

      SourceAdapter class support was removed in RhoConnect 4.1.
      Please, migrate your SourceAdapter classes into RhoConnect Models.

      For more details, see RhoConnect Migration guidelines at
      docs.rhomobile.com