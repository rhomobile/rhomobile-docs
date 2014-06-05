RhoConnect Source Adapters (JavaScript)
===

## Generating the Source Adapter from the Command Line

To generate a JavaScript source adapter for your RhoConnect application, you can run the `rhoconnect source --js` command within your application directory.

    :::term
    $ rhoconnect source --help
    Usage: rhoconnect source [options] [args]

    Generates a new source adapter (Controller/Model pair).
    Required:
      name        - source name (i.e. product)


    Options specific for this generator:
            --js                         generate JavaScript code

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
    $ rhoconnect source product --js
    Generating with source generator:
         [ADDED]  models/js/product.js
         [ADDED]  controllers/js/product_controller.js


## Understanding the Generated Controller File

The generated source adapter's controller file (in this case, `controllers/product_controller.js`) is similar to the code listing below.
Its purpose is to define the RhoConnect application HTTP end point and to register the corresponding SYNC routes.

    :::javascript
    var app = require("ballroom");
    var helpers = require("rhoconnect_helpers");

    app.controllerName("Product");
    app.registerHandler("sync");

    // Add your custom routes here

## Understanding the Generated Model File

The generated source adapter's model file (in this case, `models/product.js`) is similar to the code listing below:

    :::javascript
    var rc = require('rhoconnect_helpers');

    var Product = function(){

      this.login = function(resp){
        // TODO: Login to your data source here if necessary
        resp.send(true);
      };

      this.query = function(resp){
        var result = {};
        // TODO: Query your backend data source and assign the records
        // to a nested hash structure. Then return your result.
        // For example:
        //
        // {
        //   "1": {"name": "Acme", "industry": "Electronics"},
        //   "2": {"name": "Best", "industry": "Software"}
        // }
        resp.send(result);
      };

      this.create = function(resp){
        // TODO: Create a new record in your backend data source.  Then
        // return the result.
        resp.send('someId');
      };

      this.update = function(resp){
        // TODO: Update an existing record in your backend data source.
        // Then return the result.
        resp.send(true);
      };

      this.del = function(resp){
        // TODO: Delete an existing record in your backend data source
        // if applicable.  Be sure to have a hash key and value for
        // "object" and return the result.
        resp.send(true);
      };

      this.logoff = function(resp){
        // TODO: Logout from the data source if necessary.
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

In this model you will need to implement the functions necessary for the create, query, update and delete sync operations.  Optionally you may implement functions for login, logoff and storeBlob (if your application uses blobs).

## Source Adapter API

### Source Adapter Controller API

You can use the following methods and techniques inside of your source adapter controller.

* [controllerName](../rhoconnectapi/source-adapter-controller-api-js#controllernamename) - Name of the source adapter controller.
* [registerHandler](../rhoconnectapi/source-adapter-controller-api-js#registerhandlername) - Register a RhoConnect handler for the controller.
* [get](../rhoconnectapi/source-adapter-controller-api-js#getroute-options-callback) - Define a GET route.
* [post](../rhoconnectapi/source-adapter-controller-api-js#postroute-options-callback) - Define a POST route.
* [put](../rhoconnectapi/source-adapter-controller-api-js#putroute-options-callback) - Define a PUT route.
* [del](../rhoconnectapi/source-adapter-controller-api-js#delroute-options-callback) - Define a DELETE route.
* [currentUser](../rhoconnectapi/source-adapter-model-api-js#currentuser) - Returns the current user who called the adapter's model.
* [loadModel](../rhoconnectapi/source-adapter-controller-api-js#loadmodelname) - Returns the current model instance for this controller.

### Source Adapter Model API

You can write the following methods for your source adapter model. These methods will be called by the controller at run-time and allow your source adapter model to interact with your backend service.

* [login](../rhoconnectapi/source-adapter-model-api-js#login) - Login to your backend service.
* [logoff](../rhoconnectapi/source-adapter-model-api-js#logoff) - Logoff from your backend service.
* [query](../rhoconnectapi/source-adapter-model-api-js#query) - Query your backend service and build a hash of hashes.
* [create](../rhoconnectapi/source-adapter-model-api-js#create) - Create a new record in the backend.
* [update](../rhoconnectapi/source-adapter-model-api-js#update) - Update an existing record in the backend.
* [del](../rhoconnectapi/source-adapter-model-api-js#del) - Delete an existing record in the backend.
* [stashResult](../rhoconnectapi/source-adapter-model-api-js#stashresultresp) - Saves the current state of the result to redis and sets it `undefined`.
* [getData](../rhoconnectapi/source-adapter-model-api-js#getdataresp-callback) - Get the model document data from Store.
* [currentUser](../rhoconnectapi/source-adapter-model-api-js#currentuser) - Returns the current user who called the adapter's model.
* [storeBlob](../rhoconnectapi/source-adapter-model-api-js#storeblob) - Save the incoming blob data into permanent storage for the future processing.
* [partitionName](../rhoconnectapi/source-adapter-model-api-js#partitionname) - Provide a custom user partition for a model.

### Request API
The [request object](../rhoconnectapi/source-adapter-request-api-js) contains information about the HTTP request the app is receiving.

* [params](../rhoconnectapi/source-adapter-request-api-js#params) - Access in the incoming request parameters (i.e. from the HTTP query string).
* [header](../rhoconnectapi/source-adapter-request-api-js#header) - HTTP request headers.
* [model](../rhoconnectapi/source-adapter-request-api-js#model) - The corresponding model name of the request.

### Response API
The [response](../rhoconnectapi/source-adapter-response-api-js) is used to pass application control and return the `result` hash to RhoConnect.

* [params](../rhoconnectapi/source-adapter-response-api-js#params) - Access in the incoming request parameters (i.e. from the HTTP query string).
* [header](../rhoconnectapi/source-adapter-response-api-js#header) - HTTP request headers.
* [send](../rhoconnectapi/source-adapter-response-api-js#sendvalue) - Return program control (most controller and model methods will need to do this).
* [exception](../rhoconnectapi/source-adapter-response-api-js#exception) - Holds the exception for the request (if one is raised).
* [currentUser](../rhoconnectapi/source-adapter-model-api-js#currentuser) - Returns the current user who called the adapter's model.

## Store API
RhoConnect provides a simple [redis interface](../rhoconnectapi/source-adapter-store-api-js) for saving/retrieving arbitrary data.  This is useful if you want to save data in your application to be used later (i.e. in an async job or a subsequent source adapter execution).

* [getValue](../rhoconnectapi/source-adapter-store-api-js#getvaluerespcallback) - Retrieve a simple value from redis.
* [putValue](../rhoconnectapi/source-adapter-store-api-js#putvaluerespcallback) - Add a simple value to redis.
* [getData](../rhoconnectapi/source-adapter-store-api-js#getdatarespcallback) - Retrieve an array or hash from redis.
* [putData](../rhoconnectapi/source-adapter-store-api-js#putdatarespcallback) - Add an array or hash to redis.

## Exception API
Use the following exception types in your JavaScript application to handle any error conditions.  Don't worry, if your application throws an uncaught exception, the base `RhoConnect::Model::Exception` will automatically be used.

* [Exception](../rhoconnectapi/source-adapter-exception-api-js#exceptionresponse-message) - Raise a `RhoConnect::Model::Exception`.
* [LoginException](../rhoconnectapi/source-adapter-exception-api-js#loginexceptionresponse-message) - Raise a `RhoConnect::Model::LoginException`.
* [LogoffException](../rhoconnectapi/source-adapter-exception-api-js#logoffexceptionresponse-message) - Raise a `RhoConnect::Model::LogoffException`.
* [ServerTimeoutException](../rhoconnectapi/source-adapter-exception-api-js#servertimeoutexceptionresponse-message) - Raise a `RhoConnect::Model::ServerTimeoutException`.
* [ServerErrorException](../rhoconnectapi/source-adapter-exception-api-js#servererrorexceptionresponse-message) - Raise a `RhoConnect::Model::ServerErrorException`.
* [ObjectConflictErrorException](../rhoconnectapi/source-adapter-exception-api-js#objectconflicterrorexceptionresponse-message) - Raise a `RhoConnect::Model::ObjectConflictErrorException`.


## Sample Model
Here's a complete example of how the completed [product model might look](https://gist.github.com/larsburgess/87753882f3a4a366b48b):

    :::javascript
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