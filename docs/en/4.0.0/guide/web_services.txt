# Accessing Web services from RhoMobile

## Overview

RhoMobile applications typically use a RhoConnect server to synchronize data with backend systems but they can also retrieve and upload data from other services. In a warehouse application, for example, while you may use RhoConnect to manage products, you can integrate a different service to retrieve pre-processed data in order to build a dashboard interface, or see orders related to a particular customer.

## Synchronous vs Asynchronous
A network call being synchronous or asynchronous refers to whether your code continues executing immediately after the call is made or it waits for the result before continuing.

Synchronous calls block execution until a result is received (or the operation times out). Asynchronous calls, on the other hand, return control to your code immediately. When the response is received (or an error occurs), a callback is invoked with the result.

Synchronous calls are conceptually very easy to work with but they have a very important drawback: your application will appear to hang until the request completes. 

## Network API

RhoMobile includes its own [Network API](../api/Network) with facilities for making GET and POST requests.

Ruby:
	:::ruby
	# synchronous request
	response = Rho::Network.get({
		:url => "http://www.example.com"
	})

	# the following line will only be reached after a response is received
	# or the request ends with an error
	if response["status"] == "ok"
		puts "Request complete, the server returned status code #{response["http_error"]} and body #{response["body"]}""
	else
		puts "An error occurred"
	end

JavaScript:
	:::javascript
	// synchronous request
	var response = Rho.Network.get({
		url : "http://www.example.com"
	});

	# the following line will only be reached after a response is received
	# or the request ends with an error
	if (response.status) === "ok"
		alert("Request complete, the server returned status code "+params.http_error+" and body "+params.body);
	else
		alert("An error occurred");
	end


Ruby:
	:::ruby
	# asynchronous request
	def get_request
		response = Rho::Network.get({
			:url => "http://www.example.com"
		}, url_for(:action => :network_request_callback))

		puts "The above code will not wait for the request to complete. This line will be executed immediately"
	end

	def network_request_callback
		if @params["status"] == "ok"
			puts "Request complete, the server returned status code #{response["http_error"]} and body #{response["body"]}""
		else
			puts "An error occurred"
		end
	end

JavaScript:
	:::javascript
	// asynchronous request
	function get_request() {
		var response = Rho.Network.get({
			url : "http://www.example.com",
		}, network_request_callback);
	}

	function network_request_callback(params) {
		if (params.status==="ok") {
			alert("Request complete, the server returned status code "+params.http_error+" and body "+params.body);
		} else {
			alert("An error occurred");
		}
	}

Your request will be synchronous or asynchronous depending on whether you pass the `callback` parameter
In general, asynchronous requests are preferable. Many times, however, you need the data before the user can continue working; in this case, the following pattern can be used:

* make an asynchronous request
* render a "waiting" screen to inform the user that the application received their command and is doing something
* when the callback is received, process the data and navigate to a new screen


## jQuery

jQuery also includes convenient APIs for making AJAX requests from JavaScript: `jQuery.ajax` and `jQuery.getJSON`

	:::javascript
	function perform_ajax_request() {
		$.ajax({
			url: "/app/MyController/get_data"
		}).done(function(data) {
			parsed = ...; // parse the received string
			alert("Customer of the day: "+parsed.customer_of_the_day+" with "+parsed.total_orders+" orders");
		}).fail(function(request, textStatus, errorThrown) {
			alert("An error occurred: "+errorThrown);
		}).always(function() {
			alert("Request completed");
		});
	}

This snippet will:
* invoke the `get_data` action in `MyController`
* if the request is successful, parse the received data and show it
* if an error occurred, show a message
* notify the user that the request completed (wheter it was successful or not)

You can return data from your controller in any format, but the easiest way to interchange information between JavaScript and Ruby is to use JSON; see the following example:

	:::ruby
	def get_data
		result = ::JSON.generate({
			:customer_of_the_day => "John Doe",
	        :total_orders => 42 })
   
   		# this is necessary because by default, controllers render their view together with a layout
   		# in an AJAX request, we only want to return our data formatted as JSON but not the layout
    	render :string => result, :use_layout_on_ajax => true
    end

    :::javascript
    function perform_json_request() {
		$.getJSON("/app/MyController/get_data")
			.done(function(data) {
				// the response is parsed as JSON and provided as the data parameter
				alert("Customer of the day: "+data.customer_of_the_day+" with "+data.total_orders+" orders");
				});
    }

## The same-origin policy and cross-domain requests

One drawback of using `jQuery.ajax` instead of the [RhoMobile Network API](../api/Network) is that, for security reasons, JavaScript code runs inside a sandbox. One of the rules of this sandbox, called the "same-origin policy", mandates that code loaded from one origin (i.e., www.example.com) cannot communicate with code loaded from a different origin (www.example.net). This has the practical consequence that you can only make AJAX calls to the same server that the current page was loaded from, which in a native RhoMobile application case is the mobile device itself (`localhost`). If for some reason you cannot or prefer not to use the RhoMobile Network API, there are several ways to work around this limitation: JSONP, CORS and using Ruby code as a local proxy.


### Ruby code as a local proxy

**NOTE: If you need to make cross-domain requests but do not want to [use the RhoMobile Network API in JavaScript](#network-api), using Ruby code as a local proxy is usually the easiest approach in a native RhoMobile application**

Although by default you can only make AJAX requests to the embedded server in a RhoMobile application, because your controllers can execute any code you need, you can easily create a custom controller that receives AJAX requests from the JavaScript in your page, connects to a remote server using the Network API as seen above and returns the results back to JavaScript. This is the only scenario where you should prefer to use synchronous requests.

Example:

Ruby controller:
	:::ruby
	def get_data
		request = Rho::Network.get({
			:url => "http://www.example.com/get_data"
			})

		# supposing our server returns valid JSON, we can just relay it to our JavaScript
		# otherwise we would parse the response, build our own result value and 
		if request["status"]=="ok"
			result = request["body"]
		else
			result = {:status => "error"}
		end


   		# this is necessary because by default, controllers render their view together with a layout
   		# in an AJAX request, we only want to return our data formatted as JSON but not the layout
    	render :string => result.to_json, :use_layout_on_ajax => true
    end

JavaScript:
    :::javascript
    function perform_json_request() {
		$.getJSON("/app/MyController/get_data")
			.done(function(data) {
				// the response is parsed as JSON and provided as the data parameter
				alert("Customer of the day: "+data.customer_of_the_day+" with "+data.total_orders+" orders");
				});
    }

#### When to use Ruby code as a local proxy

* In general, if you cannot use the JavaScript Network API, using Ruby code is the preferred option due to its simplicity and the fact that the server does not need to be adapted at all. Any service you can call via HTTP will be accessible to your application.

### JSONP

Although the sandbox does not allow AJAX requests to a different origin, it is possible to include `<script>` tags in your HTML that do not necessarily have to come from the same server as your page. In regular web applications, it is common for a site to include common scripts like jQuery from a Content Delivery Network in order to take advantage of the browser cache:

	:::html
	<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>

While the page itself can reside on any domain, the script will be loaded from `code.jquery.com` and executed.

Taking advantage of this fact, we can dynamically create a `<script>` tag linking to an action in one of our controllers:

	:::javascript
	function call_json_action() {
		$("body").append("<script src='/app/MyController/get_data'></script>");
	}

When the `<script>` tag is added to the `body`, the script it points to will be downloaded and executed, and our controller will return the data we want to use. However, the controller cannot return plain JSON because it would not do anything by itself: the browser would get the values but they would not be passed to our code anywhere.

Here is how JSONP solves this problem: together with the data, it includes a call to a function that will receive the payload:

JSON:
	:::javascript
	{ "key" : "value"}

JSONP:
	:::javascript
	callback({"key" : "value"});

In the above example, the padding (the `P` in `JSONP`) is `callback` but it can be anything. In fact, it is common to implement JSONP on the server side such that it takes a parameter called `callback` that will determine the name of the function:

JavaScript:
	:::javascript
	function call_json_action() {
		$("body").append("<script src='/app/MyController/get_data?callback=process_values'></script>");
	}

	function process_values(data) {
		// the name of this function matches the callback name specified above
	}

Ruby controller:
	:::ruby
	def get_data
		json = ::JSON.generate({ "key" : "value"})
		jsonp = "#{@params["callback"]}(#{json});"
		render :string => jsonp, :use_layout_on_ajax => true
	end

#### When to use JSONP

The ideal use cases for deciding to implement JSONP are:

* Invoking services that are already implemented as JSONP: integrating an existing JSONP backend in your RhoMobile app is almost trivial
* When other web applications will also access the same services. JSONP can be implemented once on the server side and then reused across different clients

**NOTE: Using JSONP comes with some security implications: nothing guarantees that a server actually returns the data you expect instead of malicious code. You should only include scripts (and therefore, JSONP links) from servers that are under your control or that you completely trust. If the backend is compromised, it could return arbitrary JavaScript code to your application, potentially compromising it, too.**


### CORS

Due to limitations with JSONP, a new standard is emerging: Cross Origin Resource Sharing (CORS). CORS has the advantage of having been designed explicitly for the task of making requests across different origins. When the browser notes that the destination is not the same as the origin of the current page and sends an OPTIONS request with an additional `Origin` header:


	:::code
	Origin: http://www.example.com


This `Origin` header tells the destination server which domain the request comes from. If the server wants to allow the request, its response will include an `Access-Control-Allow-Origin` header:

	:::code
	Access-Control-Allow-Origin: *

or

	:::code
	Access-Control-Allow-Origin: http://www.example.org

CORS has the advantage that it supports POST as well as other HTTP methods, unlike JSONP which can only make GET requests.

#### When to use CORS

* You need to use HTTP methods other than GET
* All your desktop end users have modern browsers. Internet Explorer versions earlier than 10.0 have limitations in their CORS implementation.

**NOTE: When implementing CORS on your server, receiving an `Origin` header is not, by itself, sufficient guarantee that the request actually came from a user on that site: remember that an attacker can create custom requests outside of a web browser. Do not send any sensitive information without further authentication.**

## Related reading

* [jQuery.ajax](http://api.jquery.com/jQuery.ajax/)
* [jQuery.getJSON](http://api.jquery.com/jQuery.getJSON/)
* [Network API](../api/Network)
* [Same-origin policy](http://en.wikipedia.org/wiki/Same_origin_policy)
* [JSONP](http://en.wikipedia.org/wiki/JSONP)
* [CORS W3C Candidate Recommendation](http://www.w3.org/TR/cors/)