Source Adapter Controller API (JavaScript)
===
Your RhoConnect source adapter controller can use any of these methods to facilitate handling of the incoming requests.

## app
A JavaScript RhoConnect application by default will create a controller object called `app`.  This can really be called anything, but we will use the name `app` throughout this document.  If you are familiar with the popular Node.js [express framework](http://expressjs.com/api.html), the `app` object is similar in concept to an express application.

    :::javascript
    var app = require('ballroom');

## controllerName(name)
Set the name for a controller.  This should match your client model and RhoConnect model name.

    :::javascript
    app.controllerName('Product');

## registerHandler(name)
Register a RhoConnect handler for this controller.  This will install default behavior into the controller.  Currently only the 'sync' handler is available, which installs the necessary `sync` routes for a source adapter controller:

    :::javascript
    app.registerHandler('sync');

## get(route, options, callback)
Register a get route with the server.  The callback must make a `send` call to return the response to RhoConnect.


    :::javascript
    app.get('/my_custom_route', {}, function(req,resp){
      resp.send('hello world');
    });

## post(route, options, callback)
Register a post route with the server.  The callback must make a `send` call to return the response to RhoConnect.  The HTTP request body is available as `req.params`:

    :::javascript
    app.post('/my_custom_route', {}, function(req,resp){
      var someId = req.params.someId;
      resp.send('ok');
    });

## put(route, options, callback)
Register a put route with the server.  The callback must make a `send` call to return the response to RhoConnect.  The HTTP request body is available as `req.params`:

    :::javascript
    app.put('/my_custom_route', {}, function(req,resp){
      var someId = req.params.someId;
      resp.send('ok');
    });

## del(route, options, callback)
Register a delete route with the server.  The callback must make a `send` call to return the response to RhoConnect.

    :::javascript
    app.del('/my_custom_route/:id', {}, function(req,resp){
      var deleteId = req.params.id;
      resp.send('ok');
    });

## currentUser
Returns the current user who made the request.

    :::javascript
    app.get('/echo_user', {}, function(req,resp){
      var user = resp.currentUser;
      resp.send(user);
    });

## loadModel(name)
Returns the current model instance for this controller.

    :::javascript
    app.get('/custom_query_route', {}, function(req,resp){
      var model = app.loadModel(req.model);
      model.query(resp);
    });

## Sample Controller
Here's a sample controller that uses several of the methods described in this document:

    :::javascript
    var app = require('ballroom');

    app.controllerName('Product');
    app.registerHandler('sync');

    // Add your custom routes here ...
    app.post('/my_custom_route', {}, function(req,resp){
      app.loadModel(req.model).someCustomFunction(resp);
    });

    app.get('/status', {}, function(req,resp){
      resp.send(
        JSON.stringify({'status': 'ok'})
      );
    });