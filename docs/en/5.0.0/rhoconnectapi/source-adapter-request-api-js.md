Source Adapter Request API (JavaScript)
===
The Source Adapter Request API provides access to an incoming HTTP request context and can be used in your [controller](source-adapter-controller-api-js).

## params
A hash of parameters available from the request.

    :::javascript
    app.post("/login",{"rc_handler":"authenticate"}, function(req,resp){
      var login = req.params.login;
      var password = req.params.password;
      if(someAuthFunction(login,password) === true) {
        resp.send(false);
      } else {
        resp.send(true);
      }
    });

## header
Access the request headers.

    :::javascript
    req.header['Content-Type']
    // 'application/json'

## model
Returns the model name for the request.

    :::javascript
    req.model
    //=> 'Product'