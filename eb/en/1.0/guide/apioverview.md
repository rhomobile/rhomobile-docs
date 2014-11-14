# API Overview
The Enterprise Browser exposes certain methods to the developer which can be used to interact with write code for the Enterprise Browser. These methods are separated into APIs for each capability that can be manipulated and used with the Enterprise Browser app. Below We'll describe how to use these APIs in your Enterprise Browser app.

## Enabling the JavaScript API's
Depending on whether your application is running from local html files on the device or if it is running from a remote web server will determine how to enable the Enterprise Browser APIs. Essentially, you need to ensure the proper JavaScript file is included in the proper location

### JavaScript API Files
After installing Enterprise Browser, there will be a folder `JavaScriptFiles` found in the installation folder. In that folder there will be two folders:

* EnterpriseBrowser - JavaScript API files for Enterprise Browser
	* ebapi-modules.js - includes all `EB.module` APIs. 
	* individual modules JS files - optionally can include just the modules you need. See the [optimization guide](../guide/optimization) for more information.
* BackwardsCompatibility - used for supporting PocketBrowser and RhoElements 2.x applications
	* elements.js - used for supporting RhoElements 2.x and PocketBrowser applications. See the [RhoElements & PocketBrowser Migration guide](../guide/elements)
	* rhoapi-modules.js - used for supporting RhoMobile applications. See the [RhoMobile Migration guide](../guide/rhomobile)

### Using JS APIs From Your Web App
When you are running your web pages from a web server, the Enterprise Browser is essentially acting as a browser. In order to use the Enterprise Browser API's you will need to copy the ebapi-modules.js to your web server in a location where you will be able to access it and link it appropriately in your web server’s web pages. Typically you will copy this file to your web application's js folder where you may be including other JavaScript libraries that are being used. 

### Using JS APIs From Local Pages
To use the JS APIs on your device using local web pages, you'll need to copy the JS API files you'll be using, to your device in a location you'll be able to access them from your local app pages.

For example if you placed your html and JS files in `<device-root>\myApp` then in your html files you would link to the ebapi-modules.js using relative pathing as follows:

	:::html
	<script src="ebapi-modules.js" type="text/javascript"></script>

## Using Your Own Objects
Some API classes support instance objects. This allows you to maintain your own objects and assign different properties to them. In the following example we want to save a reference to the front facing camera of the device so that we can manipulate the front facing camera properties separate from the rear-facing camera:

	:::javascript
	var laserScanner;
	EB.Barcode.enumerate(function (e){
		if (e.scannerType == 'Laser'){
			laserScanner = e;
		}
	};);

We can then reference instance methods on that object

	:::javascript
	var laserScannerProperties = {beamWidth:EB.Barcode.BEAM_NARROW, decodeVolume:5};

	laserScanner.enable(laserScannerProperties, function(e){
			barcodeData = e.data;
		});

## Setting Properties
There are a few different ways you can set properties. 

### Using the Default Instance
One way is to use the default instance of the API class. This will change the property of the object in a global sense until it is changed again (or the application is exited):

	:::javascript
	EB.Class.Property = value;

For example the following snippet will turn of the `illuminationMode` for the default Barcode instance.

	:::javascript
	EB.Barcode.illuminationMode='alwaysOff';

### Using Special Class Methods
You can also use special class methods to set a property (as long as the class exposes such a method):

	:::javascript
	EB.Barcode.setProperty('illuminationMode', 'alwaysOff');

You can also use a special class method to set multiple properties in one line of code (as long as the class exposes such a method):

	:::javascript
	// An object of propertyName:value is passed into the setProperties method
	EB.Barcode.setProperties({illuminationMode:'alwaysOff', code128:'enabled'});

### With Another Method
Some methods support passing in a `propertyMap` as a parameter to a method. Like with the `setProperties` method, you would pass in an object of multiple propertyName:propertyValue

	:::javascript
	// Enable the default instance of Barcode with code128 enabled and illuminationMode off
	// the first parameter of this method is a propertyMap
	EB.Barcode.enable({illuminationMode:'alwaysOff', code128:'enabled'}, callbackHandler());

> Note: In the API reference, when a parameter is of type propertyMap, all possible values are not shown in the documentation. However you may use any non read-only property listed for that object class unless otherwise specified.

## Getting Properties
There are a few ways to get an object's property values:

### Reading Values Synchronously
The following examples use a synchronous method that will be blocking. The following example uses the `getProperty` class method. This method may not be available on all APIs.

	:::javascript
	var illumMode = EB.Barcode.getProperty('illuminationMode');

You can use the `getProperties` method for a list of properties you wish to know about. An array of property names that you want to retrieve is passed into this method and a hash is returned containing the values of the properties.

	:::javascript
	// An object is returned by the getProperties method
	var settingsObj = EB.Barcode.getProperties(['illuminationMode', 'code128']);

	// The object properties will be the list of properties used
	if (settingsObj.illuminationMode == 'alwaysOff')...

You can also use the `getAllProperties` method to get all properties of an object	

	:::javascript
	var settingsObj = EB.Barcode.getAllProperties();

> Note: Some API's like Barcode have many properties and there may be an undesirable performance hit for reading all properties available. Use this method sparingly.

### Reading Values Asynchronously
There are a few ways you can read properties in non-blocking asynchronously way by specifying a callback. The following code snippet uses a self-describing autonomous function that will execute when the callback is executed:

	:::javascript
	Barcode.getAllProperties(function(params){
		alert(params.code128);
	};);

The following code snippet also uses a self-describing anonymous function that will execute when the callback is executed. This time we are also passing in other parameters:

	:::javascript
	Barcode.getProperties(["autoEnter","code128"], function (params){
			alert(params.code128);
	};);

> Note: For methods that support callbacks, the callback function will always be the last parameter of the method.

The following code snippet uses a function name for the callback instead of an anonymous function

	:::javascript
	Barcode.getAllProperties(fnPropertyPerser(params));

## Handling Callbacks
Some methods support a callback for returning information in an unblocking, asynchronous way. This is indicated in the documentation by a parameter named `callback`

	:::javascript
	Barcode.take(HASH propertyMap, CallbackHandler callback)

The callback parameter will either be marked as <span class="label label-info">Optional</span> or <span class="label label-warning">Mandatory</span>. Be sure to check the type of object the callback will be returning as well as the list of available callback parameters for each method. Typically the callback will return an object with a pre-defined set of objects that can be accessed for information.

### Callback as anonymous function
The following code snippet enables the hardware barcode button. Upon scanning a barcode the anonymous function will be executed:

	:::javascript
	// The documentation will list the callback type as well as callback parameters that are available
	EB.Barcode.enable({},function(params){
		alert(params.data);
	};);

### Callback as a JavaScript function
The following code snippet enables the hardware barcode button. Upon scanning a barcode it then calls another JavaScript function `mycallbackhandler`:

	:::javascript
	EB.Barcode.enable({}, mycallbackHandler);

	function mycallbackHandler(params){
	// The documentation will list the callback type as well as callback parameters that are available
		alert(params.data);
	}