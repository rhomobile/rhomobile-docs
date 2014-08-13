#Printer


## Overview
The Printer Module provides access to find, connect, and print to Bluetooth and WiFi Network printers.
## Enabling the API
There are two methods of enabling the Printing API: include all ebapi modules or include only the API modules you need. For either of these methods, you'll need to include files from the `/Enterprise Browser/JavaScript Files/Enterprise Browser` directory on the computer that you installed the Motorola Enterprise Browser.

### Include all JS API modules
To include all JS APIs, you must copy the ebapi-modules.js file to a location accessible by your app's files and include the JavaScript file in your app. For instance, to include the modules file in your index.html, with the file in the same directory as your index.html, you would add the following line to the <head> section of your index.html:

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi-modules.js"></script>

> Note: that the pathing for this file is relative to the current page.

This will define the EB class within the page. Any page you need to use the modules will need to have the .js file included in this fashion.

### Include only the modules you need
To include single APIs, you must first include the ebapi.js in your HTML as well as the API file you want to use. For instance, to use the Printing API, I would add the following code to my HTML file(s), assuming the API files have been copied to the same directory as the HTML.

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi.js"></script>
    <script type="text/javascript" charset="utf-8" src="eb.printer.js"></script>

The ebapi.js file is necessary for all single API inclusions.
        


##Methods



### connect()
Connect to a printer using default options. Works asynchronously; use callback to check the result. If connection is successful printer state and properties are automatically updated. NB: default options are defined by printer SDK and platform and may vary between different devices.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.connect()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Printer.connect()</code> 


### connectWithOptions(<span class="text-info">HASH</span> options)
Connect to a printer using user options. Works asynchronously; use callback to check the result. After this function call  the printer state is automatically updated.

####Parameters
<ul><li>options : <span class='text-info'>HASH</span><p>Connect options. </p></li><ul><li>timeout : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><span class='label '> Default: 15000</span><p>Connection timeout in milliseconds. Must be larger than 0! Platforms:
WM, iOS, Android </p></li><li>additionalStringOption : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>Any additional info. This is currently not being used. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.connectWithOptions(<span class="text-info">HASH</span> options)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Printer.connectWithOptions(<span class="text-info">HASH</span> options)</code> 


### disconnect()
Disconnect from a printer and release OS resources. Works asynchronously; use callback to check the result.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.disconnect()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Printer.disconnect()</code> 


### enumerateSupportedControlLanguages()
Return array with languages supported by this printer.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p>Language. See - PRINTER_LANGUAGE_... constants. </p></li></ul></ul>

####Returns
Synchronous Return:

* ARRAY : Array of supported printer control languages.<ul><li><i>Object</i> : <span class='text-info'>STRING</span><p>Language. See - PRINTER_LANGUAGE_... constants. </p></li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.enumerateSupportedControlLanguages()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Printer.enumerateSupportedControlLanguages()</code> 


### enumerateSupportedTypes()
Returns array with supported printer types immediately. The result depends on your build configuration. Each extension is linked to application during build. If you want to add or remove support of any printer type please update extension list in the build.yml. 

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p>Type of device. </p></li></ul></ul>

####Returns
Synchronous Return:

* ARRAY : Array of currently supported printer types. Depends on build settings. May contain PRINTER_TYPE_ZEBRA, PRINTER_TYPE_EPSON, PRINTER_TYPE_APD, PRINTER_TYPE_NATIVE or any combination of them.<ul><li><i>Object</i> : <span class='text-info'>STRING</span><p>Type of device. </p></li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Printer.enumerateSupportedTypes()</code> 


### getAllProperties()
This method will return all of object/value pairs for the propertyNames of the API class.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:

* HASH : Map of all available properties<ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getAllProperties()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Printer.getAllProperties()</code> 


### getDefault()
This method will return an object that represents the default instance of the API Class. For example Camera.getDefault will return a Camera object that represents the default camera.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>SELF_INSTANCE</span></p><ul></ul>

####Returns
Synchronous Return:

* SELF_INSTANCE : Default object of Module.

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Printer.getDefault()</code> 


### getPrinterByID(<span class="text-info">STRING</span> printerId)
Return printer instance specified by printerId. If there is no printers with this ID null is returned. To get valid printerId please use searchPrinters function.

####Parameters
<ul><li>printerId : <span class='text-info'>STRING</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>SELF_INSTANCE</span></p><ul></ul>

####Returns
Synchronous Return:

* SELF_INSTANCE

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Printer.getPrinterByID(<span class="text-info">STRING</span> printerId)</code> 


### getProperties(<span class="text-info">ARRAY</span> arrayofNames)
This method will return a set of object/value pairs for the list of the propertyName that is passed in. The propertyNames must be a valid property of the API class.

####Parameters
<ul><li>arrayofNames : <span class='text-info'>ARRAY</span><p>List of properties I want to know about </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:

* HASH : Map of properties I want to know about<ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Printer.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code> 


### getProperty(<span class="text-info">STRING</span> propertyName)
This method will return the value of the propertyName that is passed in. The propertyName must be a valid property of the API class.

####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p>The property to return info about. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING : The property to return info about.

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getProperty(<span class="text-info">STRING</span> propertyName)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Printer.getProperty(<span class="text-info">STRING</span> propertyName)</code> 


### printFile(<span class="text-info">STRING</span> filePathOnDevice, <span class="text-info">HASH</span> options)
Prints file. Works asynchronously; use callback to check the result. File extension is used to determine its type. Supported image types: JPEG and PNG.

####Parameters
<ul><li>filePathOnDevice : <span class='text-info'>STRING</span><p>Full path to local image file on the device. </p></li><li>options : <span class='text-info'>HASH</span> <span class='label label-info'>Optional</span><p> Not providing properties to this function will print with default settings. Reserved for future use.</p></li><ul><li>propertyWithStringValue : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>This is currently not being used. </p></li><li>propertyWithIntValue : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><p>This is currently not being used. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.printFile(<span class="text-info">STRING</span> filePathOnDevice, <span class="text-info">HASH</span> options)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Printer.printFile(<span class="text-info">STRING</span> filePathOnDevice, <span class="text-info">HASH</span> options)</code> 


### printImageFromFile(<span class="text-info">STRING</span> filePathOnDevice, <span class="text-info">INTEGER</span> x, <span class="text-info">INTEGER</span> y, <span class="text-info">HASH</span> options)
Prints an image from mobile digital device's file system to the connected printer as a monochrome image. Works asynchronously; use callback to check the result. Note that if the image resolution is large (e.g. 1024x768) this method may take a long time to execute. It is not guaranteed that files larger than 1024x1024 could be printed correctly.

####Parameters
<ul><li>filePathOnDevice : <span class='text-info'>STRING</span><p>Full path to local image file on the device. (The image must be either a PNG or JPG, all other types are platform depend). </p></li><li>x : <span class='text-info'>INTEGER</span><p>Horizontal starting position in dots. </p></li><li>y : <span class='text-info'>INTEGER</span><p>Vertical starting position in dots. </p></li><li>options : <span class='text-info'>HASH</span> <span class='label label-info'>Optional</span><p>Provide a set of optional parameters. </p></li><ul><li>width : <span class='text-info'>INTEGER</span><p>Desired width of the printed image. Passing -1 will preserve original width. </p></li><li>height : <span class='text-info'>INTEGER</span><p>Desired height of the printed image. Passing -1 will preserve original height. </p></li><li>isInsideFormat : <span class='text-info'>BOOLEAN</span><p>Boolean value indicating whether this image should be printed by itself (false), or is part of a format being written to the connection (true). </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.printImageFromFile(<span class="text-info">STRING</span> filePathOnDevice, <span class="text-info">INTEGER</span> x, <span class="text-info">INTEGER</span> y, <span class="text-info">HASH</span> options)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Printer.printImageFromFile(<span class="text-info">STRING</span> filePathOnDevice, <span class="text-info">INTEGER</span> x, <span class="text-info">INTEGER</span> y, <span class="text-info">HASH</span> options)</code> 


### printRawString(<span class="text-info">STRING</span> command, <span class="text-info">HASH</span> options)
Send raw string to printer. Works asynchronously, use callback to check the result. NOTE that on Windows Mobile/CE using Zebra printers, this will not print ZPL commands, but just line mode (or raw text).

####Parameters
<ul><li>command : <span class='text-info'>STRING</span><p>Raw string to print. Could be any valid command in printer supported programming language. </p></li><li>options : <span class='text-info'>HASH</span> <span class='label label-info'>Optional</span><p> Not providing properties to this function will print with default settings.</p></li><ul><li>propertyWithStringValue : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>This is currently not being used. </p></li><li>propertyWithIntValue : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><p>This is currently not being used. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>PRINTER_STATUS_SUCCESS, PRINTER_STATUS_ERROR. </p></li><li>message : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>Error message, only if status = ERROR. </p></li><li>stringResponce : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>Response from printer if received, converted to string from byteArray(original data) Platforms:
Android, WM </p></li><li>byteArrayResponce : <span class='text-info'>ARRAY</span> <span class='label label-info'>Optional</span><p>Response from printer if received. Platforms:
Android </p></li><ul><li><i>Object</i> : <span class='text-info'>INTEGER</span><p> </p></li></ul></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.printRawString(<span class="text-info">STRING</span> command, <span class="text-info">HASH</span> options)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Printer.printRawString(<span class="text-info">STRING</span> command, <span class="text-info">HASH</span> options)</code> 


### requestState(<span class="text-info">ARRAY</span> listOfParameters)
Requests printer state with a list of parameters.

* Works asynchronously and uses the callback to check the result. 
* Returns hash with status, and parameters as keys.

NOTE: On the Windows Mobile / Windows CE platform, this method does not work in the case of a bluetooth connection.

####Parameters
<ul><li>listOfParameters : <span class='text-info'>ARRAY</span><p>List of parameters for request from printer device. </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p>Parameter name - see constants with PRINTER_STATE_... </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>PRINTER_STATUS_SUCCESS, PRINTER_STATUS_ERROR. </p></li><li>message : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>Error message, only if status = ERROR. </p></li><li>propertyWithIntValue : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><p>This is currently not being used. </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.requestState(<span class="text-info">ARRAY</span> listOfParameters)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Printer.requestState(<span class="text-info">ARRAY</span> listOfParameters)</code> 


### searchPrinters(<span class="text-info">HASH</span> options)
Search printers connected to the device, available Bluetooth(R), or Network printers. It is highly recommended to search for a particular Bluetooth(R) address or IP address for Network connections. Also this method could be used to get printerID for known network / bluetooth printer, in this case you should specify deviceAddress parameter in options. Result is returned asynchronously using callback. The callback is called for each discovered printer. Search is finished if printerID is not set in callback hash. Note that discovery is not guaranteed to return all the available devices. Please run this method at least 2-3 times to get result with good accuracy.

NOTE: on Android platform due to HW specific, when you call searchPrinters() for Bluetooth or for TCP and Bluetooth both, Application can freeze for few seconds - if user touch screen Android system can show Alert about "application not responded" - user should select [continue waiting] button.
                

####Parameters
<ul><li>options : <span class='text-info'>HASH</span> <span class='label label-info'>Optional</span><p>Options for discover. </p></li><ul><li>printerType : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><span class='label '> Default: PRINTER_TYPE_ANY</span><p>Printer types to search. Make sure that Printer type is supported by calling enumerateSupportedTypes method. </p></li><li>connectionType : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><span class='label '> Default: CONNECTION_TYPE_ANY</span><p>Interfaces for search (Bluetooth/TCP/All). </p></li><li>timeout : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><span class='label '> Default: 30000</span><p>Maximum search interval in milliseconds, applies to network discovery. This is the maximum interval for wait during connection attempt. Note that if no printer was found, even with timeout property, status will be set to PRINTER_STATUS_SUCCESS, but without any printerId. </p></li><li>deviceAddress : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>Printer address (mac or ip) can be used for setting either subnet mask or full address of printer. For TCP if address is not specified /8 subnet will be used for search.  </p></li><li>devicePort : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><span class='label '> Default: 6101</span><p>Override default printer port number. Applicable for network discovery only. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>Status of network discovery, can be following:
* PRINTER_STATUS_SUCCESS - when printer is discovered or operation is finished;
* PRINTER_STATUS_ERROR - general error 
* PRINTER_STATUS_ERR_UNSUPPORTED - in case if printer type is not supported
* PRINTER_STATUS_ERR_NOT_CONNECTED - in case if deviceAddress was specified in options and device was unable to connect to printer. </p></li><li>printerID : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>Printer ID, valid only if status equals to 'PRINTER_STATUS_SUCCESS'. If there are no more printers available printerID will not be defined. </p></li><li>message : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>Error message, only if status = ERROR. </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Printer.searchPrinters(<span class="text-info">HASH</span> options)</code> 


### setDefault(<span class="text-info">SELF_INSTANCE: EB.Printer</span> defaultInstance)
This method allows you to set the attributes of the default object instance by passing in an object of the same class.

####Parameters
<ul><li>defaultInstance : <span class='text-info'>SELF_INSTANCE: EB.Printer</span><p>An instance object that is of the same class. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Printer.setDefault(<span class="text-info">SELF_INSTANCE: EB.Printer</span> defaultInstance)</code> 


### setProperties(<span class="text-info">HASH</span> propertyMap)
This method will set the values of a list of properties for the API class. The propertyName must be a valid property for the class and must also not be read only.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>Map of properties I want to set </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.setProperties(<span class="text-info">HASH</span> propertyMap)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Printer.setProperties(<span class="text-info">HASH</span> propertyMap)</code> 


### setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)
This method will set the value of a property for the API class. The propertyName must be a valid property for the class and must also not be read only.

####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p>The one property name that I want to set </p></li><li>propertyValue : <span class='text-info'>STRING</span><p>The one property value that I want to set </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Printer.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code> 


### stopSearch()
Stop all active and pending search requests. Function does not return any results. All running search requests are canceled immediately.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Printer.stopSearch()</code> 


##Properties



###ID

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description
Unique printer ID during application lifetime.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.ID</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Printer.ID</code> 



####Platforms

* Android
* Windows Mobile/CE

###connectionType

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description
Type of connection to printer.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.connectionType</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Printer.connectionType</code> 



####Platforms

* Android
* Windows Mobile/CE

###deviceAddress

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description
Bluetooth mac/TCP IP address.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.deviceAddress</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Printer.deviceAddress</code> 



####Platforms

* Android
* Windows Mobile/CE

###deviceName

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description
Bluetooth/Network name of printer.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.deviceName</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Printer.deviceName</code> 



####Platforms

* Android
* Windows Mobile/CE

###devicePort

####Type
<span class='text-info'>INTEGER</span> 
####Description
Default port when connecting using TCP/IP.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.devicePort</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Printer.devicePort</code> 



####Platforms

* Android
* Windows Mobile/CE

###isConnected

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description
Connection status flag. All other properties are valid only if isConnect equals to true. Please keep in mind: this property do not guarantee real connection, because all real device functionality processed in separated thread asynchronously. If you want to real physical connection - use requestState() method with receive result in the callback. Only this way process real request to device and analyze answer from device.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.isConnected</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Printer.isConnected</code> 



####Platforms

* Android
* Windows Mobile/CE

###printerType

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description
Type of printer - see PRINTER_TYPE_... constants.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.printerType</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Printer.printerType</code> 



####Platforms

* Android
* Windows Mobile/CE

##Constants


* PRINTER_LANGUAGE_ZPLPrinter control language ZPL.
* PRINTER_LANGUAGE_CPCLPrinter control language CPCL.
* PRINTER_LANGUAGE_EPSPrinter control language EPS. Not Supported in 4.1
* PRINTER_TYPE_ANY
* PRINTER_TYPE_NATIVENot supported in 4.1
* PRINTER_TYPE_ZEBRA
* PRINTER_TYPE_EPSONNot supported in 4.1
* PRINTER_TYPE_APDNot supported in 4.1
* CONNECTION_TYPE_ANY
* CONNECTION_TYPE_ON_BOARDNot supported in 4.1
* CONNECTION_TYPE_BLUETOOTH
* CONNECTION_TYPE_TCP
* PRINTER_STATUS_SUCCESS
* PRINTER_STATUS_ERROR
* PRINTER_STATUS_ERR_IO
* PRINTER_STATUS_ERR_MEMORY
* PRINTER_STATUS_ERR_NETWORK
* PRINTER_STATUS_ERR_NOT_CONNECTED
* PRINTER_STATUS_ERR_NOT_FOUND
* PRINTER_STATUS_ERR_PARAM
* PRINTER_STATUS_ERR_PROCESSING
* PRINTER_STATUS_ERR_RESPONSE
* PRINTER_STATUS_ERR_TIMEOUT
* PRINTER_STATUS_ERR_UNSUPPORTED
* PRINTER_STATE_IS_READY_TO_PRINTUse this name for requestState(), return true if printer ready to print.
* PRINTER_STATE_IS_COVER_OPENEDUse this name for requestState(), return true if cover is opened.
* PRINTER_STATE_IS_DRAWER_OPENEDUse this name for requestState(), return true if drawer is opened.
* PRINTER_STATE_IS_PAPER_OUTUse this name for requestState(), return true if paper out.
* PRINTER_STATE_IS_BATTERY_LOWUse this name for requestState(), return true if battery low.

##Remarks



###Android Notes
* When you call searchPrinters() with Bluetooth search (with CONNECTION_TYPE_ANY or CONNECTION_TYPE_BLUETOOTH) then _all_ Bluetooth devices around you will be discovered. You may see a lot of pairing requests to non-printer devices and should just cancel or ignore them. This happens because we can not detect that the device is a printer until the device is paired. It is recommended that the BT Address or WiFi MAC Address is also used when searching for printers.

###Windows Mobile/CE Notes

* Requires a Printing Service application to be running. This is described in the [Printing Guide](../guide/printing#platform-notes)
* You should avoid navigating from the current page using the printer without disconnecting from the printer first. You can use the window.onunload event:

        :::javascript
        window.onunload = function(){
            printer.disconnect();
        }

* When you call searchPrinters() with Bluetooth search (with CONNECTION_TYPE_ANY or CONNECTION_TYPE_BLUETOOTH) then **all** Bluetooth devices around you will be discovered. You may see a lot of pairing requests to non-printer devices and should just cancel or ignore them. This happens because we cannot detect that the device is a printer until the device is paired. It is recommended that the BT Address or WiFi MAC Address is also used when searching for printers.