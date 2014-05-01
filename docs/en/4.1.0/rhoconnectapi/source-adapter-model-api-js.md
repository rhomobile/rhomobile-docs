Source Adapter Model API (JavaScript)
===
Your RhoConnect source adapter model can use any of these methods to interact with your backend service. Refer to the [js source adapter sample](../rhoconnect/source-adapters-js#sample-model) for a complete example.  As with the [controller API](source-adapter-controller-api-js), each function that accepts a [response object](source-adapter-response-api-js) must call `.send()` on it to return control to RhoConnect.

## login
Login to your backend service (optional).

    :::javascript
    this.login = function(resp){
      resp.send(true);
    };

## logoff
Logoff from your backend service (optional).

    :::javascript
    this.logoff = function(resp){
      resp.send(true);
    };

## query
Query your backend service and build a hash of hashes (required).

**NOTE: This method must call resp.send(data) where `data` is a hash of hashes.**

    :::javascript
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

## search
Search your backend based on params and build a hash of hashes (optional).  Similar to query, however the master document accumulates the data in redis instead of replacing each time it runs.

    :::javascript
    this.search = function(resp){
      var result = {};
      var str = '';
      var name = resp.params.name;

      http.request('http://' + host + '/products.json?name=' + name, function(res){
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

Next, you will need to add search to your Rhodes application. For details, see the [Rhodes search section](../guide/using_rhoconnect#filtering-datasets-with-search).

## create
Create a new record in the backend (optional).

**NOTE: RhoConnect can establish a 'link' between the local record id provided by the client and the new record id provided by the backend service.  To enable this link, return the new record id as a string.**

    :::javascript
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

## update
Update an existing record in the backend (optional).

    :::javascript
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

## del
Delete an existing record in the backend (optional).

    :::javascript
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

## stashResult(resp)
Saves a partial dataset to redis.  Typically this is used when your adapter has to paginate through data. The following example data to redis one item at a time.

    :::javascript
    this.query = function(resp){
      var rc = require('rhoconnect_helpers');
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
            resp.params = {};
            resp.params[item.product.id.toString()] = item.product;
            rc.stashResult(resp);
          }
          resp.send(true);
        });
      }).end();
    };

## getData(resp, callback)
You can access your model's document data by with `getData` method. This will return the redis Master Document (:md).

    :::javascript
    var data = {};
    var rc = require('rhoconnect_helpers');
    rc.getData(resp, function(resp){
      data = resp.result;
      // data contains the model's Master Document.
      resp.send(data);
    });

## currentUser
Returns the current user which called the adapter.  The current user is part of the [response object](source-adapter-response-api-js).  For example, you could filter results for a specific user in your query method.

    :::javascript
    this.query = function(resp){
      var result = {};
      var str = '';
      var user = resp.currentUser;

      // ...
    };

## storeBlob
If your Rhodes application sends blobs as a part of the create/update operation - you must implement this method inside of your Source Adapter Model.  We do not recommend using the default implementation where blob is stored in the tempfile provided by Rack, because RhoConnect processing is asynchronous and there is no guarantee that the temporary file will exist at the actual time when `create` is called.

The following example opens the file (contained in `resp.params.path`) if it exists.

    :::javascript
    this.storeBlob = function(resp){
      var fs = require('fs');
      if(fs.existsSync(resp.params.path)){

        // read and process the file here ...

        resp.send('some_filename');
      } else{
        resp.send(false);
      }
    };

## partitionName
Use `partitionName` to define a custom data partition for your source adapter.  This is useful if you want groups of users to share data or you want to define some other kind of custom scoping.  See [this source adapter section](../rhoconnect/source-adapters#data-partitioning) for more details about RhoConnect data partitioning.

    :::javascript
    this.partitionName = function(resp){
      if(someCustomRoleLookup(resp.params.user_id) === 'admin'){
        resp.send('admin_restricted_data');
      } else{
        resp.send(resp.params.user_id);
      }
    };

