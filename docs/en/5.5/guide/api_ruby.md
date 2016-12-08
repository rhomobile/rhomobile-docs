# Using RhoMobile Ruby APIs

RhoMobile applications support access to device, system and framework capabilities through a common API set whether you are building Rhodes, RhoElements or RhoMobile enabled web apps.


## Using your own objects
Some API classes support instance objects. This allows you to maintain your own objects and assign different properties to them.

In the following example we want to save a reference to the front facing camera of the device so that we can manipulate the front facing camera properties seperate from the rear-facing camera:

	:::ruby
	@desiredCamera;
	Rho::Camera.enumerate(lambda |e|
		{
			if (e.type == Rho::Camera.FRONT_TYPE)
	@desiredCamera = e
	})

We can then reference instance methods on that object

	:::ruby
	@cameraProperties =
		{:desiredWidth=>1024, :desiredHeight=>768}

	desiredCamera.take_picture(@cameraProperties,
		fnHandlePicture())


## Setting propeties
There are a few different ways you can set properties.

### Using the default instance
One way is to use the default instance of the API class. This will change the property of the object in a global sense until it is changed again (or the application is exited):

	:::ruby
	Rho::Class.Property = value;

For example the following snippet will turn of the `illuminationMode` for the default Barcode instance.

	:::ruby
	Rho::Barcode.illuminationMode='alwayOff'

### Using special class methods
You can also use special class methods to set a property (as long as the class supports this method):

	:::ruby
	Rho::Barcode.setProperty :illuminationMode, 'alwaysOff'

You can also use a special class method to set multiple properties in one line of code (as long as the class supports this method):

	:::ruby
	# An object of propertyName:value is passed into the setProperties method
	Rho::Barcode.setProperties { :illuminationMode => 'alwaysOff' , :code128 => 'enabled'}

### With another method
Some methods support passing in an `propertyMap` as a parameter to a method. Like with the `setProperties` method, you would pass in an object of multiple propertyName:propertyValue

	:::ruby
	# Enable the default instance of Barcode with code128 enabled and illuminationMode off
	# the first parameter of this method is a propertyMap
	Rho::Barcode.enable ( { :illuminationMode => 'alwaysOff' , :code128 => 'enabled'},                url_for :action => :mycallback)

**NOTE: In the API reference, when a parameter is of type propertyMap, all possible values are not shown in the documentation. However you may use any non read-only property listed for that object class (unless otherwise specified).**

## Getting properties
There are a few ways to get an object's property values:

### Reading values synchronously
The following examples use a synchronous method that will be blocking.

The following example uses the `getProperty` class method. This method may not be available on all APIs.

	:::ruby
	iMode = Rho::Barcode.getProperty('illuminationMode')

You can use the `getProperties` method for a list of propeties you wish to know about. An array of property names is passed into this method

	:::ruby
	# An object is returned by the getProperties method
	settingsHash = Rho::Barcode.getProperties(['illuminationMode' ,'code128'])

	# The object properties will be the list of properties used
	if settingsHash.illuminationMode == 'alwaysOff'...

You can also use the `getAllProperties` method to get all properties of an object

	:::ruby
	settingsHash = Rho::Barcode.getAllProperties()

**NOTE: Some APIs like Barcode have many properties and there may be an undesirable performance hit for reading all properties available. Use this method sparingly.**

### Reading values Asynchronously
There are a few ways you can read properties in non-blocking asynchronously way by specifying a callback:

The following code snippet uses a lambda function that will execute when the callback is executed

	:::ruby
	Barcode.getAllProperties(lambda{|e| puts e.code128})

The following code snippet also uses a lambda function that will execute when the callback is executed. This time we are also passing in other parameters

	:::javascript
	Barcode.getProperties(['autoEnter','code128','code39'],
	lambda{|e| puts e.code128})

The following code snippet uses a controller method name for the callback instead of an anonymous function

	:::javascript
	Barcode.getAllProperties(fnPropertyPerser());

## Handling callbacks
> NOTE: For methods that support callbacks, the callback function will always be the last parameter of the method.

Some methods will support a callback for returning information in an unblocking asynchronous way. This will be indicated in the documentation by a parameter named `callback`

	:::ruby
	Rho::Barcode.take(HASH propertyMap, HASH callback)

The callback parameter will either be marked as <span class="label label-info">Optional</span> or marked as <span class="label label-warning">Mandatory</span>

Be sure to check the type of object the callback will be returning as well as the list of available callback parameters for each method. Typically the callback will return an object with a pre-defined set of objects that can be accessed for information.

### Callback as lambda function
The following code snippet takes a picture from the device's camera and will run the lambda function

	:::ruby
	# The documentation will list the callback type as well as callback parameters that are available
	Rho::Camera.takePicture(...,lambda{ |e|
	 puts e['status'] }
	)


### Callback as a ruby controller method
You may want the callback to return to a ruby controller method or a particular view. For example when a picture is taken you may want to store an object and display a view showing all images captured. Recall that accessing RhoMobile ruby controller methods/views is simply using a url string

	:::ruby
	Rho::Camera.takePicture(..., url_for :action => :imageTakeHandler)


	:::ruby
	def imageTakeHandler
		#callback object will be in params object

		# some code to same image in database

		render :action => :list
	end

**NOTE: In previous versions of RhoMobile, the ruby callback was specified as a parameter like: `:callback => (url_for :action => :imageTakeHandler)`. This is no longer part of the methods parameters and must be specified as the final parameter without the `:callback =>` notation**

