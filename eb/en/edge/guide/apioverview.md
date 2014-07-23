# API Overview
TBD Insert overview statement about our APIs and link to the API compatibility chart. This guide is more of a getting started abbreviated version of how to use the APIs. Need to get more detail from Paul on new ways to include APIs as seperate JS files, etc.

## Using META Tags
TBD - Need details from Paul on whether this is supported or not. If supported, what is syntax especially for 4.x common APIs.

## Enabling the JavaScript API's
Depending on whether your application is running from local html files on the device or if it is running from a remote web server will determine how to enable the Enteprise Browser APIs. Essentially, you need to ensure the proper JavaScript file is included in the proper location

###Using JS APIs From Your Web App
When you are running your web pages from a web server, the Enteprise Browser is essentially acting as a browser. In order to use the Enterprise Browser API’s you will need to copy the rhoapi-modules.js from the devices Program Files\RhoElements\rho\apps\public\api folder to your web server and link it appropriately in your web server’s web pages. Typically you will copy this file to your web applications js folder where you may be including other JavaScript libraries that are being used. 

###Using JS APIs From Local Pages
When you have started Enteprise Browser with local HTML pages, you will need to make sure you properly reference the file `rhoapi-modules.js` in relation to where your HTML files are running from.

For example if you placed your html files in `Program Files\RhoElements\rho\apps\public\` then in your html files you would link to the rhoapi-modules.js using:

	:::html
	<script src="api/rhoapi-modules.js" type="text/javascript"></script>

###JavaScript ORM
If you are going to be using the JS ORM API, you'll also need to include this line in any files that will be using it:

	:::html
	<script type="text/javascript" charset="utf-8" src="/public/api/rhoapi-modules-ORM.js"></script>

>Note: You do not need to place your HTML files in the `Program Files\RhoElements\rho\apps\public` folder. Just be sure to copy the `rhoapi-modules.js` to the folder you are using and reference it appropriately.

## Using your own objects
Some API classes support instance objects. This allows you to maintain your own objects and assign different properties to them.

In the following example we want to save a reference to the front facing camera of the device so that we can manipulate the front facing camera properties separate from the rear-facing camera:
	
	:::javascript
	var desiredCamera;
	Rho.Camera.enumerate(function (e)
		{
			if (e.type == Rho.Camera.FRONT_TYPE)
	desiredCamera = e;
	});

We can then reference instance methods on that object

	:::javascript
	var cameraProperties =
		{desiredWidth:1024, desiredHeight:768};

	desiredCamera.take_picture(cameraProperties,
		fnHandlePicture(e));


## Setting Properties
There are a few different ways you can set properties. 

### Using the default instance
One way is to use the default instance of the API class. This will change the property of the object in a global sense until it is changed again (or the application is exited):

	:::javascript
	Rho.Class.Property = value;

For example the following snippet will turn of the `illuminationMode` for the default Barcode instance.
	
	:::javascript
	Rho.Barcode.illuminationMode='alwaysOff';

### Using special class methods
You can also use special class methods to set a property (as long as the class supports this method):

	:::javascript
	Rho.Barcode.setProperty('illuminationMode','alwaysOff');

You can also use a special class method to set multiple properties in one line of code (as long as the class supports this method):

	:::javascript
	// An object of propertyName:value is passed into the setProperties method
	Rho.Barcode.setProperties({ illuminationMode:'alwaysOff' , code128:'enabled'});

### With another method
Some methods support passing in an `propertyMap` as a parameter to a method. Like with the `setProperties` method, you would pass in an object of multiple propertyName:propertyValue

	:::javascript
	// Enable the default instance of Barcode with code128 enabled and illuminationMode off
	// the first parameter of this method is a propertyMap
	Rho.Barcode.enable({ illuminationMode:'alwaysOff' , code128:'enabled'}, bchandler());

**NOTE: In the API reference, when a parameter is of type propertyMap, all possible values are not shown in the documentation. However you may use any non read-only property listed for that object class (unless otherwise specified).**

## Getting Properties
There are a few ways to get an object's property values:

### Reading values synchronously
The following examples use a synchronous method that will be blocking.

The following example uses the `getProperty` class method. This method may not be available on all APIs.
	
	:::javascript
	var iMode = Rho.Barcode.getProperty('illuminationMode');

You can use the `getProperties` method for a list of propeties you wish to know about. An array of property names is passed into this method

	:::javascript
	// An object is returned by the getProperties method
	var settingsObj = Rho.Barcode.getProperties(['illuminationMode' ,'code128']);

	// The object properties will be the list of properties used
	if (settingsObj.illuminationMode == 'alwaysOff')...

You can also use the `getAllProperties` method to get all properties of an object	

	:::javascript
	var settingsObj = Rho.Barcode.getAllProperties();

**NOTE: Some API's like Barcode have many properties and there may be an undesirable performance hit for reading all properties available. Use this method sparingly.**

### Reading values Asynchronously
There are a few ways you can read properties in non-blocking asynchronously way by specifying a callback:

The following code snippet uses a self-describing autonomous function that will execute when the callback is executed

	:::javascript
	Barcode.getAllProperties(function(e)
	{
		alert(e.code128);  
	});

The following code snippet also uses a self-describing anonymous function that will execute when the callback is executed. This time we are also passing in other parameters

	:::javascript
	Barcode.getProperties(["autoEnter","code128"], 
	function (e)
	{
			alert(e.code128);
	});

**NOTE: For methods that support callbacks, the callback function will always be the last parameter of the method**

The following code snippet uses a function name for the callback instead of an anonymous function

	:::javascript
	Barcode.getAllProperties(fnPropertyPerser(e));

## Handling callbacks
Some methods will support a callback for returning information in an unblocking asynchronous way. This will be indicated in the documentation by a parameter named `callback`

	:::javascript
	Barcode.take(HASH propertyMap, CallbackHandler callback)

The callback parameter will either be marked as <span class="label label-info">Optional</span> or marked as <span class="label label-warning">Mandatory</span>

Be sure to check the type of object the callback will be returning as well as the list of available callback parameters for each method. Typically the callback will return an object with a pre-defined set of objects that can be accessed for information.

### Callback as anonymous function
The following code snippet takes a picture from the device's camera and will run the anonymous function 	

	:::javascript
	// The documentation will list the callback type as well as callback parameters that are available
	Rho.Camera.takePicture(...,function(e){
	      alert(e.status);
	};);


### Callback as a JavaScript function
The following code snippet takes a picture from the device's camera and then calls another JavaScript function `mycallbackhandler`:
	
	:::javascript
	Rho.Camera.takePicture(..., mycallbackHandler());

	function mycallbackHandler(params)
	{
	// The documentation will list the callback type as well as callback parameters that are available
			alert(params.status);
	}