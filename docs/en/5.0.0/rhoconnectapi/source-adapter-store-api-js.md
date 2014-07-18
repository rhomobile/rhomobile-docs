Source Adapter Store API (JavaScript)
===
RhoConnect provides a simple redis interface for saving/retrieving arbitrary data. This is useful if you want to save data in your application to be used later (i.e. in an async job or a subsequent source adapter execution).  As with the other JavaScript methods execution is asynchronous, so be sure to call [resp.send()](source-adapter-response-api-js#sendvalue) or your method will hang.

## Setup
To create a Store object that you can use in your model:

    :::javascript
    var rc = require('rhoconnect_helpers');
    var Store = rc.Store;

## getValue(resp,callback)
Retrieve a simple value from redis.

    :::javascript
    var value = '';
    resp.params = 'hello';
    Store.getValue(resp, function(resp){
      value = resp.result;
      // value is now 'world'
      resp.send(resp.result);
    });

## putValue(resp,callback)
Add a simple value to redis.  The first array item is the key, the second is the value.

    :::javascript
    resp.params = ['hello', 'world']
    Store.putValue(resp, function(resp){
      resp.send(true);
    });

## getData(resp,callback)
Retrieve an array or hash from redis.

    :::javascript
    // assuming 'foo' contains {'1': {'name': 'iPhone'}}
    resp.params = 'foo';
    Store.getData(resp,function(resp){
      resp.send(resp.result);
      // returns {'1': {'name': 'iPhone'}}
    });

## putData(resp,callback)
Add an array or hash to redis. The key and data are contained in the `resp.params` object.

    :::javascript
    resp.params = [
      'foo',
      { '1': {'name': 'iPhone'} }
    ]
    Store.putData(resp,function(resp){
      resp.send(resp.result);
    });
    // 'foo' key now contains { '1': {'name': 'iPhone'} }