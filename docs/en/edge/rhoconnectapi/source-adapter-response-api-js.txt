Source Adapter Response API (JavaScript)
===
The Source Adapter Response API provides access to the HTTP response context (typically as a variable called `resp`) and can be used in your model or controller.  The response object manages the control flow of your JavaScript business logic, so it is important to always call [resp.send()](#send) in your functions so that they don't hang.

## params
A hash of parameters available from the request.

    :::javascript
    createObject = resp.params.create_object;
    var postData = JSON.stringify({ 'product': createObject });
    // ...
    resp.send('someId');

## header
Access the response headers.

    :::javascript
    resp.header['Content-Type']
    // 'application/json'
    resp.send(true);

## send(value)
Return program control.

**NOTE: Most controller and model methods will need to do this.**

    :::javascript
    app.get('/status', {}, function(req,resp){
      resp.send('ok');
    });

## exception
Set an exception for the response.

    :::javascript
    resp.exception = 'Error accessing web service!';
    resp.send(true);

## currentUser
Returns the current user of the response context.

    :::javascript
    app.get('/echo_user', {}, function(req,resp){
      var user = resp.currentUser;
      resp.send(user);
    });
