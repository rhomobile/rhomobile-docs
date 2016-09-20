Source Adapter Exception API (JavaScript)
===
Exception types in JavaScript source adapters are mapped to their ruby equivalent.  See the [ruby exception section](../rhoconnect/source-adapters#handling-exceptions) for more details about these exception types.

## Setup
Make sure you have a Rhoconnect Helpers object in your model:

    :::javascript
    var rc = require('rhoconnect_helpers');

## Exception(response, message)
Raise a generic RhoConnect adapter exception.

    :::javascript
    new rc.Exception(resp, 'Something went wrong!');

## LoginException(response, message)
Raise an exception on the login procedure.

    :::javascript
    new rc.LoginException(resp, 'A login error occurred.');

## LogoffException(response, message)
Raise an exception on the logoff procedure.

    :::javascript
    new rc.LogoffException(resp, 'A logoff error occurred.');

## ServerTimeoutException(response, message)
Raise an exception indicating a timeout occurred.

    :::javascript
    new rc.ServerTimeoutException(resp, 'A timeout occurred.');

## ServerErrorException(response, message)
Raise an exception concerning the backend service.

    :::javascript
    new rc.ServerErrorException(resp, 'An error occurred with our systems, please try again.');

## ObjectConflictErrorException(response, message)
Raise a [conflict exception](../rhoconnect/cud-conflicts) to indicate there was a conflict in handling the record. This will trigger RhoConnect's automatic processing for conflicts.

    :::javascript
    new rc.ObjectConflictErrorException(
      resp, 'A conflict error occurred, please update your copy and try again'
    );


## Sample
The following example raises a `ServerErrorException` in the [delete function](source-adapter-model-api-js#del) if the record was not successfully deleted.

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
          new rc.ServerErrorException(resp, 'There was an error deleting, please try again');
        });
      });
      req.end();
    };
