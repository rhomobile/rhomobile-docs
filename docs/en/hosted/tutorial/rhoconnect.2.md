# RhoConnect Tutorial
Once RhoConnect is installed we’re ready to build a RhoConnect [source adapter](../../../5.0.25/rhoconnect/source-adapters-intro) to integrate with our backend application. To define a RhoConnect source you just need to identify a handful of operations to interact with your backend data source: login, query, sync, create, update, delete and logoff. If you generated a JavaScript RhoConnect application then you will need to generate [JavaScript Source adapters](../../../5.0.25/rhoconnect/source-adapters-js). Likewise, if you generated a Ruby RhoConnect application, you will need to generate [Ruby Source Adapters](../../../5.0.25/rhoconnect/source-adapters).

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

The above example will work with our test backend, if you are attempting to connect to your own backend data, you should read more about [Source Adapters](../../../5.0.25/rhoconnect/source-adapters-intro) and the corresponding methods:

* [JavaScript Source Adapters](../../../5.0.25/rhoconnect/source-adapters-js)
* [Ruby Source Adapters](../../../5.0.25/rhoconnect/source-adapters)