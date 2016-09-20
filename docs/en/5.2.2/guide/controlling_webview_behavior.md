# Controlling WebView behavior
## What is WebView?
[WebView](../api/webview) is the RhoMobile component responsible for rendering your application's HTML interface, showing it to the user and allowing them to interact with the application that normally occupies most of the screen.

At its core, WebView is a web browser, capable of making requests both to the embedded server that runs your application as well as any other server that speaks HTTP. It can execute modern JavaScript code and libraries such as JQuery and JQuery Mobile, both of which are included by default in new projects (see below for platform-specific limitations regarding JavaScript). You can expect it to support the same features as the default browser of each platform, including AJAX, hardware-accelerated rendering, cookies, etc.

### The two types of WebView available

There are two implementations of `WebView` available. The default implementation (`native_browser`) delegates all rendering and interaction to the native browser component provided by the operating system; that means on iOS, it will behave like Safari, on Android it uses the same engine as the browser included with the device, etc.

The native browser in Windows Mobile, however, is too limited for today's web development standards. If you need more power than what Pocket Internet Explorer provides, there is an alternative implementation of `WebView`, developed by Zebra which you can enable in your `build.yml` file, by adding the `motorola_browser` capability.

	:::yml
	capabilities:
		- motorola_browser

While the Zebra browser is also available for Android, its use is discouraged in RhoMobile 5.0 and intended only for Windows Mobile.

> Note: Although this alternative implementation is capable of supporting modern features, performance will be limited by the underlying hardware.

> Note: In RhoMobile 2.0 and prior, using the Zebra browser was the only way to access RhoElements (licensed) APIs from your application but, this is no longer the case. Except on Windows Mobile, all APIs, licensed or not are available in the default browser.

## Communication between WebView and Ruby code

A Rhodes application works very similarly to a traditional web browser + web server scenario, only with both components running on the same device. There are times, however, when it is convenient for code in one language to interact with the other; `WebView` provides ways to enable two-way communication between Ruby and JavaScript code.

## Calling JavaScript from Ruby

In a typical MVC scenario, once a request is received, your Ruby code will process it and end by returning a view for `WebView` to render. Instead of (or in addition to) that, Ruby code can invoke any JavaScript function present on the current page by calling `executeJavaScript`.

	:::ruby
	Rho::WebView.executeJavaScript("alert('This alert was called from Ruby')")

Any valid JavaScript code can be used in `executeJavaScript`, but if the code is built dynamically or contains expansions or data from the user, care must be taken to escape it properly.

For example, if any of your parameters can contain newline characters (`\n`), semicolons (`;`), quotes or any other special characters, they must be escaped or the call may not work. Therefore, it is a good practice to escape all parameters being passed to JavaScript functions.


	:::ruby
	# This will not work if message contains \n
	Rho::WebView.executeJavaScript("alert('#{message}')")

	# We must escape newlines for passing to JavaScript
	message = message.to_json

	# Now this will work even if message contains \n
	Rho::WebView.executeJavaScript("alert('#{message}')")

You are not limited to single values, using this syntax you can also pass hashes with as many parameters as necessary. Given the following JavaScript function:


	:::javascript
	function greet_user(params) {
		alert("Hello, "+params["name"]+", welcome to "+params["place"]);
	}

You would call it from Ruby by sending a hash with the appropriate keys:

	:::ruby
	greeting_parameters = {
		:name => 'John Doe',
		:place => 'RhoMobile'
	}.to_json

	Rho::WebView.executeJavaScript("greet_user(#{greeting_parameters})")

> Note: The JavaScript code you call must have been loaded _before_ your ruby code executes. It is not enough for it to be on the same view that is going to be rendered when the action returns, it has to be already in the page, that is, it must have been included by the previous action. In practice this means that JavaScript code you intend to call from Ruby cannot be called from the same action that loads it the first time. To avoid this pitfall, you should reference JavaScript files from `layout.erb` so that the code is available at all times. Including `<script>` tags in views is discouraged.

To clarify the above note, let's say we have a `list` action in a controller and there is a JavaScript function `notify_user` we are interested in calling

## Controlling navigation
There are several ways to control `WebView` and direct it to open a particular view or URL:

One is with regular HTML links, whether built with the `url_for` helper or not

	:::html
	<a href="<%= url_for :action => :list_products %>">List products</a>

	<a href="http://example.com">Navigate to example.com</a>

It is also possible to use JavaScript code to change `window.location` just like in an ordinary browser

	:::javascript
	<a onclick="window.location='http://example.com'">Visit example.com</a>

Inside an action method (witihn a controller), you can return return a redirect instead of rendering a view

	:::ruby
	def redirect_to_different_action
		# do some work here
		# ...
		# redirect when done
		redirect :action => :another_action
	end

Using `WebView.navigate` allows you to navigate to a different URL, whether it belongs to the application or not

	:::ruby
	def navigate_somewhere_else
		# do some work here
		# ...
		# load a different page
		Rho::WebView.navigate(url_for(:action => :another_action))
	end

As with all APIs starting with RhoMobile 4.0, a JavaScript version is available too:

	:::javascript
	function navigate_somewhere_else {
		// do some work here
		// ...
		// navigate to another action of the Product model
		Rho.WebView.navigate("/app/Product/another_action")
	}

> Note: Some APIs accept a callback function that will be invoked when a result value becomes available. For example, the [Barcode](../api/barcode) API will invoke the callback when the scanner detects a barcode. Within a callback function, the only valid approach to navigate to a different page is `WebView.navigate`. Using `redirect` will not work inside a callback.

## Cookies
`WebView` operates like a traditional browser in many aspects, and the ability to use cookies is one of them. Setting a cookie works very similarly to a regular browser: you must specify which URL(s) the cookie applies to, and the values the cookie will contain.

**NOTE: Be careful when using cookies for authentication purposes. Your server should never blindly trust that a cookie contains valid data, cookies must be considered "user-supplied input" and be treated as unsafe values until they are sanitized and validated like any other input.**

	:::ruby
	# Set a cookie valid for requests to http://example.com
	Rho::WebView.setCookie("example.com","name1=value1;name2=value2")

	# Set a cookie valid for requests to http://example.com and all its subdomains
	# Note the leading dot in .example.com
	Rho::WebView.setCookie(".example.com","name1=value1;name2=value2")

	# Set a cookie valid for requests to a subfolder http://example.com/testcookies
	Rho::WebView.setCookie("example.com/testcookies","name1=value1;name2=value2")

`setCookie` is also available using JavaScript:

	:::javascript
	// Set a cookie valid for requests to http://example.com
	Rho.WebView.setCookie("example.com","name1=value1;name2=value2")

	// Set a cookie valid for requests to http://example.com and all its subdomains
	// Note the leading dot in .example.com
	Rho.WebView.setCookie(".example.com","name1=value1;name2=value2")

	// Set a cookie valid for requests to a subfolder http://example.com/testcookies
	Rho.WebView.setCookie("example.com/testcookies","name1=value1;name2=value2")


## Having more than one WebView: Integration with NativeTabbar
By default, a Rhodes application contains only one `WebView` component. However, the [NativeTabbar](../api/NativeTabbar) API allows you to have multiple `WebView`s coexisting simultaneously, although only one will be visible at any particular time. Due to memory and performance constraints on mobile devices, it is not recommended to open more `WebView`s than strictly necessary, but the possibility is there to have more than one if you need it.

All methods in the `WebView` API affect the `WebView` that is current (visible) at the time of the call. However, they also accept an optional parameter that specifies which WebView you want to manipulate. For example, if we wanted to redirect the second `WebView` to a different page when an action completes, our earlier example would change from

	:::ruby
	def navigate_somewhere_else
		# do some work here
		# ...
		# load a different page on the current WebView
		Rho::WebView.navigate(url_for(:action => :another_action))
	end

to

	:::ruby
	def navigate_somewhere_else
		# do some work here
		# ...
		# load a different page on the second WebView
		Rho::WebView.navigate(url_for(:action => :another_action),1)
	end

## Related reading
* The [WebView API reference](../api/webview) has all the details on which features are available on each platform.
* The guide [Using Native UI Elements](../guide/using_native_ui_elements) explains, among other topics, how to use [NativeTabbar](../api/NativeTabbar) to create more than one `WebView` in your application.