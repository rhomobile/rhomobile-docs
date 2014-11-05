# Push
## Overview
The Push Module is used to receive data over an HTTP connection.

## Enabling the API
In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* elements.js 

> Note - this file either needs to be on the device in a relative folder from where your HTML page is, or it must be copied to your web server appropriately.

	:::html
    <script type="text/javascript" charset="utf-8" src="elements.js"></script>;

### API Usage
This API does not use the `EB` namespace. It is simply referenced using the API name:

	:::javascript
	push.port = '8081';
	push.detected = "url('JavaScript:pushDetected(%json);')";
	push.start;

## Requirements
* Enterprise Browser Version - 1.0+
* Supported Devices - Symbol enterprise Android, Windows Mobile, and Windows CE devices.
* Minimum HW requirements - None.
* Persistence - Persistent, i.e. changes to this module will persist when navigating to a new page.

## Events
Values are returned to the caller in the Enterprise Browser via Events. Most modules contain events and those returned from this module are given below along with the event parameters. Events can cause a navigation to a new URL or invoke a JavaScript function on the page. Each event will in most cases have a number of parameters associated with it which will either be strings or JavaScript arrays. Event parameters can be accessed either directly or via JSON objects.

### detected
One value is returned for each name=value pair in the HTTP request, you access this in JSON using the names you provided in the request. An example is provided in the examples section below.

#### Callback Parameters
* jsonObject

## Methods
### start()
Starts the push server. Must be after the &lt;port&gt; tag.

#### Returns
* Void

#### Platforms
* Windows Mobile
* Windows CE
* Android

### stop()
Stops the push server.

#### Returns
* Void

#### Platforms
* Windows Mobile
* Windows CE
* Android

## Parameters
Items listed in this section indicate parameters, or attributes which can be set.

### port
Port number to listen on.

#### Possible Values

#### Default Value

#### Platforms
* Windows Mobile
* Windows CE
* Android

### passKey
If specified then the client must include passkey=value in the passed parameters. Case sensitive.

#### Possible Values
Any String

#### Default Value
Empty (no passkey required)

#### Platforms
* Windows Mobile
* Windows CE
* Android

### response
Name of the HTML file to return to the client after a successful request.

#### Possible Values
Filename

#### Default Value
Empty (a short default HTML response is sent)

#### Platforms
* Windows Mobile
* Windows CE
* Android

### path
The client must include this in the HTTP request (after the address and before the parameters). The forward slash '/' should be used as the directory delimiter.

#### Possible Values
Virtual path

#### Default Value
Empty (any path is accepted)

#### Platforms
* Windows Mobile
* Windows CE
* Android

### unattended
Enables or disables unattended mode - see Remarks for details.

#### Possible Values
enabled or disabled

#### Default Value
disabled

#### Platforms
* Windows Mobile
* Windows CE
* Android

## Remarks
### HTTP request format
The push server accepts both GET and POST requests. For GET requests the parameters and values are specified in the URL, while for POST requests the request body should hold the parameters and values in url encoded form. The virtual path in the URL must be as specified by the &lt;path&gt; tag, or can be anything if the tag isn't present. The parameters must include 'passkey' with the correct value if the &lt;passkey&gt; tag is present.

### Accessing Returned values via %s / %[number]
When a valid request is received the specified destination URL is called with one '%s' per parameter/value pair in the request. Only the values are returned; the parameter names are discarded. The 'passkey' parameter and value are ignored if present. Parameter names are only applicable if you are accessing your return values via JSON.

### Allowed characters
Only alphanumeric characters and the characters $-_.!*'(), are allowed in a URL (see RFC 1738). Any other characters will cause undefined behaviour. Ensure that the passkey uses only valid characters.

### Unattended mode
Normally when a device enters suspend mode, either because it has been idle for a certain time or because the power key was pressed, all the device subsystems are switched off, including the wireless network. When unattended mode is enabled however the device keeps enough subsystems powered that applications continue to run, and it can still respond to Push requests. Note that unattended mode uses significantly more battery power.

### Windows Mobile / CE Backwards compatibility
In version 2.2 of RhoElements for WM / CE the default push port was changed from '80' to '8081' to match RhoElements for Android. Applications developed for RhoElements 2.1 and previous which rely on the default port number being 80 should add the default meta tag &lt;MetaTag VALUE="Push~port:80"&gt; to their configuration.

## HTML/JavaScript Examples
The code below configures the server to listen on port 8081, to accept only requests to the virtual path \push and to require a passkey of 'secret'. Assuming the device has IP address 1.2.3.4 then browsing to the following URL will cause the JavaScript function onPush() to be called with the parameters 'hello' and 'world': http://1.2.3.4:8081/push?name1=hello&amp;name2=world&amp;passkey=secret. The browser will receive the contents of the file \ok.html as response.

	:::html
	<META HTTP-Equiv="Push" Content="Port:8081">
	<META HTTP-Equiv="Push" Content="Passkey:secret">
	<META HTTP-Equiv="Push" Content="Path:/push">
	<META HTTP-Equiv="Push" Content="Response:/ok.html">
	<META HTTP-Equiv="Push-detected" Content="url('JavaScript:onPush('%s','%s');')">
	<META HTTP-Equiv="Push" Content="Start">
	      
The following code shows a very simple push server which just responds by executing a JavaScript function, but does show how to process the push request in JSON. Similarly to the previous example the following URL has been browsed to: http://1.2.3.4:8081/push?name1=hello&amp;myname=world

	:::html
	<HEAD>
	<META HTTP-Equiv="Push" Content="Port:1234">
	<META HTTP-Equiv="Push-detected" Content="url('JavaScript:pushDetectJSON(%json);')">
	<META HTTP-Equiv="Push" Content="Start">
	<TITLE>Push Tests</TITLE>
	  <script type="text/javascript">
	  function pushDetectJSON(jsonObject)
	  {
	    //  The following will show an Alert box with 'hello - world'
	    alert('Push Via JSON: ' + jsonObject.name1 + ' - ' + jsonObject.myname);
	  }
	  </script>
	</HEAD>

To enable unattended mode:

	:::html
	<META HTTP-Equiv="push" Content="unattended:enable">