#Printer


## Overview

The Printer API module provides access to find, connect, and print over Bluetooth, Wi-Fi and USB from Android and Windows Mobie/CE devices.

## Enabling the API

There are two methods of enabling the Printer API:

* Include all 'ebapi' modules
* Include only the API modules you need

Both methods are explained below. 

Either way, the included files will be from: 
`/Enterprise Browser/JavaScript Files/Enterprise Browser`,
a directory on the computer that contains the Enterprise Browser installation.

### Include all JS API modules
To include all JavaScript APIs, copy the `ebapi-modules.js` file to a location accessible by your app's files and include the JavaScript modules file in your app. For instance, to include the modules file in your `index.html`, copy the file to the same directory as your index.html and add the following line to the HEAD section of your index.html file:

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi-modules.js"></script>

> This will define the EB class within the page. **Note that the path for this file is relative to the current page** (index.html). Any page on which the modules are required will need to have the required .js file(s) included in this fashion.

### Include only the modules you need
To include individual APIs, you must first include the `ebapi.js` in your HTML, and then the additional required API file(s). For instance, to use the Printer API, add the following code to the HTML file(s). Again, this assumes that relevant API files have been copied to the same directory as the HTML.

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi.js"></script>
    <script type="text/javascript" charset="utf-8" src="eb.printer.js"></script>

> In the code lines above, notice that `ebapi.js` is included first, followed by `eb.printer.js`, which is the Printer API for Enterprise Browser. **This coding is required on each HTML page whenever an individual API will be called from that page**.

    


##Methods



### connect()
**Connect to a printer using default options**. Works asynchronously; use callback to check the result. If connection is successful printer state and properties are automatically updated. **Note: Default options are defined by printer SDK and platform and may vary between different devices.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.connect()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Printer.connect()</code> 


### connectWithOptions(<span class="text-info">HASH</span> options)
**Connect to a printer with user options**. Works asynchronously; use callback to check the result. After this function call, the printer state is automatically updated.

####Parameters
<ul><li>options : <span class='text-info'>HASH</span><p>Connect options. </p></li><ul><li>timeout : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><span class='label '> Default: 15000</span><p>Connection timeout in milliseconds. Must be larger than 0. Platforms:
WM, CE, Android </p></li><li>additionalStringOption : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>Any additional info; currently unused. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

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
* Windows Mobile
* Windows CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.disconnect()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Printer.disconnect()</code> 


### enumerateSupportedControlLanguages()
**Returns an array with languages supported by this printer**.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p>Language. See - PRINTER_LANGUAGE_... constants. </p></li></ul></ul>

####Returns
Synchronous Return:

* ARRAY : Array of supported printer control languages.<ul><li><i>Object</i> : <span class='text-info'>STRING</span><p>Language. See - PRINTER_LANGUAGE_... constants. </p></li></ul>

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.enumerateSupportedControlLanguages()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Printer.enumerateSupportedControlLanguages()</code> 


### enumerateSupportedTypes()
**Immediately returns an array with supported printer types**. The result depends on your build configuration. Each extension is linked to application during build. To add or remove support for any printer type, update extension list in the `build.yml`. 

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p>Type of device. </p></li></ul></ul>

####Returns
Synchronous Return:

* ARRAY : Array of currently supported printer types. Depends on build settings. May contain PRINTER_TYPE_ZEBRA, PRINTER_TYPE_EPSON, PRINTER_TYPE_APD, PRINTER_TYPE_NATIVE in any combination.<ul><li><i>Object</i> : <span class='text-info'>STRING</span><p>Type of device. </p></li></ul>

####Platforms

* Android
* Windows Mobile
* Windows CE

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
* Windows Mobile
* Windows CE

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
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Printer.getDefault()</code> 


### getPrinterByID(<span class="text-info">STRING</span> printerId)
**Returns printer instance specified by printerId**. Returns null is no printers contains the ID. To get valid printerId, use searchPrinters function.

####Parameters
<ul><li>printerId : <span class='text-info'>STRING</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>SELF_INSTANCE</span></p><ul></ul>

####Returns
Synchronous Return:

* SELF_INSTANCE

####Platforms

* Android
* Windows Mobile
* Windows CE

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
* Windows Mobile
* Windows CE

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
* Windows Mobile
* Windows CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getProperty(<span class="text-info">STRING</span> propertyName)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Printer.getProperty(<span class="text-info">STRING</span> propertyName)</code> 


### printFile(<span class="text-info">STRING</span> filePathOnDevice, <span class="text-info">HASH</span> options)
**Prints file**. Works asynchronously; use callback to check the result. File extension is used to determine its type. Supported image types: JPEG and PNG.

####Parameters
<ul><li>filePathOnDevice : <span class='text-info'>STRING</span><p>Full path to local image file on the device. </p></li><li>options : <span class='text-info'>HASH</span> <span class='label label-info'>Optional</span><p> Providing no properties to this function will print with default settings. Reserved for future use.</p></li><ul><li>propertyWithStringValue : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>This is currently not being used. </p></li><li>propertyWithIntValue : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><p>Currently unused. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.printFile(<span class="text-info">STRING</span> filePathOnDevice, <span class="text-info">HASH</span> options)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Printer.printFile(<span class="text-info">STRING</span> filePathOnDevice, <span class="text-info">HASH</span> options)</code> 


### printImageFromFile(<span class="text-info">STRING</span> filePathOnDevice, <span class="text-info">INTEGER</span> x, <span class="text-info">INTEGER</span> y, <span class="text-info">HASH</span> options)
**Prints an image from a device's file system to the connected printer as a monochrome image**. Works asynchronously; use callback to check the result. Images larger than 1024x768 might take a long time or print incorrectly. Consult printer documentation for image printing parameters.
            

####Parameters
<ul><li>filePathOnDevice : <span class='text-info'>STRING</span><p>Full path to local image file on the device. (The image must be either a PNG or JPG, all other types are platform depend). </p></li><li>x : <span class='text-info'>INTEGER</span><p>Horizontal starting position in dots. </p></li><li>y : <span class='text-info'>INTEGER</span><p>Vertical starting position in dots. </p></li><li>options : <span class='text-info'>HASH</span> <span class='label label-info'>Optional</span><p>Provide a set of optional parameters. </p></li><ul><li>width : <span class='text-info'>INTEGER</span><p>Desired width of the printed image. Passing -1 will preserve original width. </p></li><li>height : <span class='text-info'>INTEGER</span><p>Desired height of the printed image. Passing -1 will preserve original height. </p></li><li>isInsideFormat : <span class='text-info'>BOOLEAN</span><p>Boolean value indicating whether this image should be printed by itself (false), or is part of a format being written to the connection (true). </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.printImageFromFile(<span class="text-info">STRING</span> filePathOnDevice, <span class="text-info">INTEGER</span> x, <span class="text-info">INTEGER</span> y, <span class="text-info">HASH</span> options)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Printer.printImageFromFile(<span class="text-info">STRING</span> filePathOnDevice, <span class="text-info">INTEGER</span> x, <span class="text-info">INTEGER</span> y, <span class="text-info">HASH</span> options)</code> 


### printRawString(<span class="text-info">STRING</span> command, <span class="text-info">HASH</span> options)
**Send raw string to printer**. Works asynchronously, use callback to check the result. **Note: This method will not print ZPL commands from Windows Mobile/CE devices to Zebra printers; compatible with line mode or raw text only.

####Parameters
<ul><li>command : <span class='text-info'>STRING</span><p>Raw string to print. Could be any valid command in printer supported programming language. </p></li><li>options : <span class='text-info'>HASH</span> <span class='label label-info'>Optional</span><p> Providing no properties to this function will print with default settings.</p></li><ul><li>propertyWithStringValue : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>This is currently not being used. </p></li><li>propertyWithIntValue : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><p>Currently unused. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>PRINTER_STATUS_SUCCESS, PRINTER_STATUS_ERROR. </p></li><li>message : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>Error message, only if status = ERROR. </p></li><li>stringResponce : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>Response from printer if received, converted to string from byteArray(original data) Platforms:
Android, WM </p></li><li>byteArrayResponce : <span class='text-info'>ARRAY</span> <span class='label label-info'>Optional</span><p>Response from printer if received. Platforms:
Android </p></li><ul><li><i>Object</i> : <span class='text-info'>INTEGER</span><p> </p></li></ul></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.printRawString(<span class="text-info">STRING</span> command, <span class="text-info">HASH</span> options)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Printer.printRawString(<span class="text-info">STRING</span> command, <span class="text-info">HASH</span> options)</code> 


### requestState(<span class="text-info">ARRAY</span> listOfParameters)
**Requests printer state with a list of parameters**. Works asynchronously and uses the callback to check the result. Returns hash with status and parameters as keys. **NOTE: On the Windows Mobile / Windows CE platform, this method does not work in the case of a Bluetooth and USB connection.

####Parameters
<ul><li>listOfParameters : <span class='text-info'>ARRAY</span><p>List of parameters for request from printer device. </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p>Parameter name - see constants with PRINTER_STATE_... </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>PRINTER_STATUS_SUCCESS, PRINTER_STATUS_ERROR. </p></li><li>message : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>Error message, only if status = ERROR. </p></li><li>propertyWithIntValue : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><p>Currently unused. </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.requestState(<span class="text-info">ARRAY</span> listOfParameters)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Printer.requestState(<span class="text-info">ARRAY</span> listOfParameters)</code> 


### searchPrinters(<span class="text-info">HASH</span> options)
**Searches for printers connected to the device via Bluetooth(R), Wi-Fi or USB**. To reduce search times, it is highly recommended that searches for wireless connections be done by specific MAC address (Bluetooth) or IP address (Wi-Fi). This method also can be used to retrieve the printerID for a known Bluetooth or network printer specifying the `deviceAddress` options parameter. Result is returned asynchronously using a callback called for each discovered printer. Search is finished if printerID is not set in callback hash. Note that discovery is not guaranteed to return all the available devices. It is therefore recommended that this method run 2-3 times for maximum accuracy. 

**Note**: On certain Android devices, calling searchPrinters() over Bluetooth or TCP can cause the application to freeze momentarily or to display an alert that "The application has stopped responding." In such cases, it is recommended that the user tap the "Continue waiting" button.
                

####Parameters
<ul><li>options : <span class='text-info'>HASH</span> <span class='label label-info'>Optional</span><p>Options for discover. </p></li><ul><li>printerType : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><span class='label '> Default: PRINTER_TYPE_ANY</span><p>**Printer types to search**. Make sure that Printer type is supported by calling enumerateSupportedTypes method. </p></li><li>connectionType : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><span class='label '> Default: CONNECTION_TYPE_ANY</span><p>Interfaces for search (Bluetooth/TCP/All). </p></li><li>timeout : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><span class='label '> Default: 30000</span><p>**Maximum search interval in milliseconds, applies to network discovery**. This is the maximum interval for wait during connection attempt. Note that if no printer was found, even with timeout property, status will be set to PRINTER_STATUS_SUCCESS, but without any printerId. </p></li><li>deviceAddress : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>**Printer address (MAC, device serial number or IP address)** can be used for setting either subnet mask or full address of printer. For TCP if address is not specified /8 subnet will be used for search.  </p></li><li>devicePort : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><span class='label '> Default: 6101</span><p>Override default printer port number. Applicable for network discovery only. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>**Status of network discovery**, can be the following:
* PRINTER_STATUS_SUCCESS - when printer is discovered or operation is finished;
* PRINTER_STATUS_ERROR - general error
* PRINTER_STATUS_ERR_UNSUPPORTED - in case if printer type is not supported
* PRINTER_STATUS_ERR_NOT_CONNECTED - in case if deviceAddress was specified in options and device was unable to connect to printer. </p></li><li>printerID : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>**Printer ID, valid only if status equals = 'PRINTER_STATUS_SUCCESS'. If no more printers are available, printerID will be undefined. </p></li><li>message : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>Error message if status = ERROR**. </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

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
* Windows Mobile
* Windows CE

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
* Windows Mobile
* Windows CE

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
* Windows Mobile
* Windows CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Printer.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code> 


### stopSearch()
**Immediately stops all active search requests and cancels pending search requests**. Does not return a result.

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
<span class='text-info'>STRING</span> <span class='label label-warning'>Read Only</span>
####Description
Unique printer ID during application lifetime.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.ID</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Printer.ID</code> 



####Platforms

* Android
* Windows Mobile
* Windows CE

###connectionType

####Type
<span class='text-info'>STRING</span> <span class='label label-warning'>Read Only</span>
####Description
Type of connection to printer.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.connectionType</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Printer.connectionType</code> 



####Platforms

* Android
* Windows Mobile
* Windows CE

###deviceAddress

####Type
<span class='text-info'>STRING</span> <span class='label label-warning'>Read Only</span>
####Description
IP address for Wi-Fi connection, Bluetooth(R) MAC or device serial number. To get a device MAC, use CPCL command ! U1 getvar "bluetooth.address" 
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.deviceAddress</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Printer.deviceAddress</code> 



####Platforms

* Android
* Windows Mobile
* Windows CE

###deviceName

####Type
<span class='text-info'>STRING</span> <span class='label label-warning'>Read Only</span>
####Description
Bluetooth/Network name of printer.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.deviceName</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Printer.deviceName</code> 



####Platforms

* Android
* Windows Mobile
* Windows CE

###devicePort

####Type
<span class='text-info'>INTEGER</span> 
####Description
Default port when connecting with TCP/IP.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.devicePort</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Printer.devicePort</code> 



####Platforms

* Android
* Windows Mobile
* Windows CE

###isConnected

####Type
<span class='text-info'>BOOLEAN</span> <span class='label label-warning'>Read Only</span>
####Description
**Connection status flag**. All other properties are valid only if isConnect = true. Note: This property does not guarantee a real connection, because all real device functionality is processed in separate thread asynchronously. If you want a real physical connection, use `requestState()` method with receive result in the callback. This is the only guaranteed method of processing real requests to the device and analyzing answers from the device.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.isConnected</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Printer.isConnected</code> 



####Platforms

* Android
* Windows Mobile
* Windows CE

###printerType

####Type
<span class='text-info'>STRING</span> <span class='label label-warning'>Read Only</span>
####Description
Type of printer - see PRINTER_TYPE_... constants.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.printerType</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Printer.printerType</code> 



####Platforms

* Android
* Windows Mobile
* Windows CE

##Constants


* PRINTER_LANGUAGE_ZPL Printer control language ZPL
* PRINTER_LANGUAGE_CPCL Printer control language CPCL
* PRINTER_LANGUAGE_EPS Printer control language EPS. Not Supported in RMS 4.1
* PRINTER_TYPE_ANY
* PRINTER_TYPE_NATIVE Not supported in RMS 4.1
* PRINTER_TYPE_ZEBRA
* PRINTER_TYPE_EPSON Not supported in RMS 4.1
* PRINTER_TYPE_APD Not supported in RMS 4.1
* CONNECTION_TYPE_ANY
* CONNECTION_TYPE_ON_BOARD Not supported in RMS 4.1
* CONNECTION_TYPE_USB Supported in RMS 5.1, EB 1.3
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
* PRINTER_STATE_IS_READY_TO_PRINT Use this name for requestState(), return true if printer ready to print.
* PRINTER_STATE_IS_COVER_OPENED Use this name for requestState(), return true if cover is opened.
* PRINTER_STATE_IS_DRAWER_OPENED Use this name for requestState(), return true if drawer is opened.
* PRINTER_STATE_IS_PAPER_OUT Use this name for requestState(), return true if paper out.
* PRINTER_STATE_IS_BATTERY_LOW Use this name for requestState(), return true if battery low.

##Remarks



###Android Notes

* When calling searchPrinters() with Bluetooth search (CONNECTION_TYPE_ANY or CONNECTION_TYPE_BLUETOOTH), all local Bluetooth devices--including non-printers--will be discovered and send pairing requests. Just cancel or ignore them. This happens because the software cannot detect non-printers until after the device is paired. It is recommended that the BT or Wi-Fi MAC address also be used when searching for printers.

* When calling searchPrinters() with USB search (with CONNECTION_TYPE_ANY or CONNECTION_TYPE_USB), all USB Printers connected to the device will be discovered. If USB printers are not supported by SDK or device, searchPrinters function should return PRINTER_STATUS_ERR_UNSUPPORTED.
                

###Windows Mobile/CE Notes

* Requires a Printing Service application to be running. This is described in the [Printing Guide](../guide/printing#platform-notes). 

* You should avoid navigating from the current page using the printer without disconnecting from the printer first. You can use the window.onunload event:

        :::javascript
        window.onunload = function(){
            printer.disconnect();
        }

* When calling searchPrinters() with Bluetooth search (CONNECTION_TYPE_ANY or CONNECTION_TYPE_BLUETOOTH), all local Bluetooth devices--including non-printers--will be discovered and send pairing requests. Just cancel or ignore them. This happens because the software cannot detect non-printers until after the device is paired. It is recommended that the BT or Wi-Fi MAC address also be used when searching for printers.

* Before calling searchPrinters() with USB search (CONNECTION_TYPE_ANY or CONNECTION_TYPE_USB), you should configure the device's USB controller for "USB Host mode" and reboot. 

* When calling searchPrinters() with USB search (with CONNECTION_TYPE_ANY or CONNECTION_TYPE_USB), all USB Printers connected to the device will be discovered. If USB printers are not supported by SDK or device, searchPrinters function should return PRINTER_STATUS_ERR_UNSUPPORTED.

* USB connection is not supported on QLn320; `printer.searchPrinters` should return no non-printer devices. If USB printers are not supported by SDK or device, searchPrinters function should return PRINTER_STATUS_ERR_UNSUPPORTED; For example, executing searchPrinters on Android device with connectionType set to CONNECTION_TYPE_USB should return PRINTER_STATUS_ERR_UNSUPPORTED.
              