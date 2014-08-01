#Printer


## Overview
The Printer Module provides access to find, connect, and print to Bluetooth and WiFi Network printers.
## Enabling the API
In order to use this API you must TBD INSERT Eb specific instructions here

        


##Methods



### connect()
<p>Connect to a printer using default options. Works asynchronously, use callback to check the result. If connection is successful printer state and properties are automatically updated. NB: default options are defined by printer SDK and platform and may vary between different devices.</p>


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
<p>Connect to a printer using user options. Works asynchronously, use callback to check the result. After this function call state is automatically updated.</p>


####Parameters
<ul><li>options : <span class='text-info'>HASH</span><p>
<p>Connect options.</p>
 </p></li><ul><li>timeout : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><span class='label '> Default: 15000</span><p>
<p>Connection timeout in milliseconds. Must be larger 0 !</p>
 Platforms:
WM, iOS, Android </p></li><li>additionalStringOption : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>
<p>Any additional info. This is currently not being used.</p>
 </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

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
<p>Disconnect from a printer and release OS resources. Works asynchronously, use callback to check the result.</p>


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
<p>Return array with languages supported by this printer.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p>
<p>Language. See &ndash; PRINTER_LANGUAGE_&hellip; constants.</p>
 </p></li></ul></ul>

####Returns
Synchronous Return:

* ARRAY : 
<p>Array of supported printer control languages.</p>
<ul><li><i>Object</i> : <span class='text-info'>STRING</span><p>
<p>Language. See &ndash; PRINTER_LANGUAGE_&hellip; constants.</p>
 </p></li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.enumerateSupportedControlLanguages()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Printer.enumerateSupportedControlLanguages()</code> 


### enumerateSupportedTypes()
<p>Returns array with supported printer types immediately. The result depends on your build configuration. Each extension is linked to application during build. If you want to add or remove support of any printer type please update extension list in the build.yml.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p>
<p>Type of device.</p>
 </p></li></ul></ul>

####Returns
Synchronous Return:

* ARRAY : 
<p>Array of currently supported printer types. Depends on build settings. May contain PRINTER_TYPE_ZEBRA, PRINTER_TYPE_EPSON, PRINTER_TYPE_APD, PRINTER_TYPE_NATIVE or any combination of them.</p>
<ul><li><i>Object</i> : <span class='text-info'>STRING</span><p>
<p>Type of device.</p>
 </p></li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Printer.enumerateSupportedTypes()</code> 


### getAllProperties()
<p>This method will return all of object/value pairs for the propertyNames of the API class.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:

* HASH : 
<p>Map of all available properties</p>
<ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getAllProperties()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Printer.getAllProperties()</code> 


### getDefault()
<p>This method will return an object that represents the default instance of the API Class. For example Camera.getDefault will return a Camera object that represents the default camera.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>SELF_INSTANCE</span></p><ul></ul>

####Returns
Synchronous Return:

* SELF_INSTANCE : 
<p>Default object of Module.</p>


####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Printer.getDefault()</code> 


### getPrinterByID(<span class="text-info">STRING</span> printerId)
<p>Return printer instance specified by printerId. If there is no printers with this ID null is returned. To get valid printerId please use searchPrinters function.</p>


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
<p>This method will return a set of object/value pairs for the list of the propertyName that is passed in. The propertyNames must be a valid property of the API class.</p>


####Parameters
<ul><li>arrayofNames : <span class='text-info'>ARRAY</span><p>
<p>List of properties I want to know about</p>
 </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:

* HASH : 
<p>Map of properties I want to know about</p>
<ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Printer.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code> 


### getProperty(<span class="text-info">STRING</span> propertyName)
<p>This method will return the value of the propertyName that is passed in. The propertyName must be a valid property of the API class.</p>


####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p>
<p>The property to return info about.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING : 
<p>The property to return info about.</p>


####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getProperty(<span class="text-info">STRING</span> propertyName)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Printer.getProperty(<span class="text-info">STRING</span> propertyName)</code> 


### printFile(<span class="text-info">STRING</span> filePathOnDevice, <span class="text-info">HASH</span> options)
<p>Prints file. Works asynchronously, use callback to check the result. File extension is used to determine its type. Supported types: JPEG and PNG images.</p>


####Parameters
<ul><li>filePathOnDevice : <span class='text-info'>STRING</span><p>
<p>Full path to local image file on the device.</p>
 </p></li><li>options : <span class='text-info'>HASH</span> <span class='label label-info'>Optional</span><p> 
<p>Not providing properties to this function will print with default settings. Reserved for future use.</p>
</p></li><ul><li>propertyWithStringValue : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>
<p>This is currently not being used.</p>
 </p></li><li>propertyWithIntValue : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><p>
<p>This is currently not being used.</p>
 </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

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
<p>Prints an image from mobile digital device&rsquo;s file system to the connected printer as a monochrome image. Works asynchronously, use callback to check the result. Note: if the image resolution is large (e.g. 1024x768) this method may take a long time to execute. It is not guaranteed that files larger than 1024x1024 could be printed correctly.</p>


####Parameters
<ul><li>filePathOnDevice : <span class='text-info'>STRING</span><p>
<p>Full path to local image file on the device. (The image must be either a PNG or JPG, all other types are platform depend).</p>
 </p></li><li>x : <span class='text-info'>INTEGER</span><p>
<p>Horizontal starting position in dots.</p>
 </p></li><li>y : <span class='text-info'>INTEGER</span><p>
<p>Vertical starting position in dots.</p>
 </p></li><li>options : <span class='text-info'>HASH</span> <span class='label label-info'>Optional</span><p>
<p>Provide a set of optional parameters.</p>
 </p></li><ul><li>width : <span class='text-info'>INTEGER</span><p>
<p>Desired width of the printed image. Passing -1 will preserve original width.</p>
 </p></li><li>height : <span class='text-info'>INTEGER</span><p>
<p>Desired height of the printed image. Passing -1 will preserve original height.</p>
 </p></li><li>isInsideFormat : <span class='text-info'>BOOLEAN</span><p>
<p>Boolean value indicating whether this image should be printed by itself (false), or is part of a format being written to the connection (true).</p>
 </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

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
<p>Send raw string to printer. Works asynchronously, use callback to check the result.
NOTE: In Windows Mobile/CE using Zebra printers, this will not print ZPL commands, but just line mode (or raw text).</p>


####Parameters
<ul><li>command : <span class='text-info'>STRING</span><p>
<p>Raw string to print. Could be any valid command in printer supported programming language.</p>
 </p></li><li>options : <span class='text-info'>HASH</span> <span class='label label-info'>Optional</span><p> 
<p>Not providing properties to this function will print with default settings.</p>
</p></li><ul><li>propertyWithStringValue : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>
<p>This is currently not being used.</p>
 </p></li><li>propertyWithIntValue : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><p>
<p>This is currently not being used.</p>
 </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>
<p>PRINTER_STATUS_SUCCESS, PRINTER_STATUS_ERROR.</p>
 </p></li><li>message : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>
<p>Error message, only if status = ERROR.</p>
 </p></li><li>stringResponce : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>
<p>Response from printer if received, converted to string from byteArray(original data)</p>
 Platforms:
Android, WM </p></li><li>byteArrayResponce : <span class='text-info'>ARRAY</span> <span class='label label-info'>Optional</span><p>
<p>Response from printer if received.</p>
 Platforms:
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
<p>Requests printer state with a list of parameters.</p>

<ul>
<li>Works asynchronously and uses the callback to check the result.</li>
<li>Returns hash with status, and parameters as keys.</li>
</ul>


<p>NOTE: On the Windows Mobile / Windows CE platform, this method does not work in the case of a bluetooth connection.</p>


####Parameters
<ul><li>listOfParameters : <span class='text-info'>ARRAY</span><p>
<p>List of parameters for request from printer device.</p>
 </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p>
<p>Parameter name &ndash; see consts with PRINTER_STATE_&hellip;</p>
 </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>
<p>PRINTER_STATUS_SUCCESS, PRINTER_STATUS_ERROR.</p>
 </p></li><li>message : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>
<p>Error message, only if status = ERROR.</p>
 </p></li><li>propertyWithIntValue : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><p>
<p>This is currently not being used.</p>
 </p></li></ul></ul>

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
<p>Search printers connected to this device, available Bluetooth&reg; or Network printers. It is highly recommended to search for a particular Bluetooth&reg; address or IP address for Network connections. Also this method could be used to get printerID for known network/bluetooth printer, in this case you should specify deviceAddress parameter in options. Result is returned asynchronously using callback. Callback is called for each discovered printer. Search is finished if printerID is not set in callback hash. Note: discovery is not guaranteed to return all the available devices. Please run this method at least 2-3 times to get result with good accuracy.</p>

<p>NOTE: on Android platfrom due to HW specific, when you call searchPrinters() for Bluetooth or for TCP and Bluetooth both, Application can freeze for few seconds &ndash; if user touch screen Android system can show Alert about &ldquo;application not responded&rdquo; &ndash; user should select [continue waiting] button.</p>


####Parameters
<ul><li>options : <span class='text-info'>HASH</span> <span class='label label-info'>Optional</span><p>
<p>Options for discover.</p>
 </p></li><ul><li>printerType : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><span class='label '> Default: PRINTER_TYPE_ANY</span><p>
<p>Printer types to search. Make sure that Printer type is supported by calling enumerateSupportedTypes method.</p>
 </p></li><li>connectionType : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><span class='label '> Default: CONNECTION_TYPE_ANY</span><p>
<p>Interfaces for search (Bluetooth/TCP/All)</p>
 </p></li><li>timeout : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><span class='label '> Default: 30000</span><p>
<p>Maximum search interval in milliseconds, applies to network discovery. This is the maximum interval for wait during connection attempt. Note: if no printer was found even with timeout property status will be set to PRINTER_STATUS_SUCCESS, but without any printerId.</p>
 </p></li><li>deviceAddress : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>
<p>Printer address (mac or ip). Can be used for setting either subnet mask or full address of printer. For TCP if address is not specified /8 subnet will be used for search.</p>
 </p></li><li>devicePort : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><span class='label '> Default: 6101</span><p>
<p>Override default printer port number. Applicable for network discovery only.</p>
 </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>
<p>Status of network discovery, can be following:
* PRINTER_STATUS_SUCCESS &ndash; when printer is discovered or operation is finished;
* PRINTER_STATUS_ERROR &ndash; general error
* PRINTER_STATUS_ERR_UNSUPPORTED &ndash; in case if printer type is not supported
* PRINTER_STATUS_ERR_NOT_CONNECTED &ndash; in case if deviceAddress was specified in options and device was unable to connect to printer.</p>
 </p></li><li>printerID : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>
<p>Printer ID, valid only if status equals to &lsquo;PRINTER_STATUS_SUCCESS&rsquo;. If there are no more printers available printerID will not be defined.</p>
 </p></li><li>message : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>
<p>Error message, only if status = ERROR.</p>
 </p></li></ul></ul>

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
<p>This method allows you to set the attributes of the default object instance by passing in an object of the same class.</p>


####Parameters
<ul><li>defaultInstance : <span class='text-info'>SELF_INSTANCE: EB.Printer</span><p>
<p>An instance object that is of the same class.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

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
<p>This method will set the values of a list of properties for the API class. The propertyName must be a valid property for the class and must also not be read only.</p>


####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>
<p>Map of properties I want to set</p>
 </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

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
<p>This method will set the value of a property for the API class. The propertyName must be a valid property for the class and must also not be read only.</p>


####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p>
<p>The one property name that I want to set</p>
 </p></li><li>propertyValue : <span class='text-info'>STRING</span><p>
<p>The one property value that I want to set</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

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
<p>Stop all active and pending search requests. Function does not return any results. All running search requests are canceled immediately.</p>


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

<p>Unique printer ID during application lifetime.</p>

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

<p>Type of connection to printer.</p>

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

<p>Bluetooth mac/TCP IP address.</p>

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

<p>Bluetooth/Network name of printer.</p>

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

<p>Default port when connecting using TCP/IP.</p>

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

<p>Connection status flag. All other properties are valid only if isConnect equals to true. Please keep in mind: this property do not guarantee real connection, because all real device functionality processed in separated thread asynchronously. If you want real check physical connection &ndash; use requestState() method with receive result in callback. Only this way process real request to device and analyze answer from device.</p>

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

<p>Type of printer &ndash; see PRINTER_TYPE_&hellip; consts.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.printerType</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Printer.printerType</code> 



####Platforms

* Android
* Windows Mobile/CE

##Constants


* PRINTER_LANGUAGE_ZPL
<p>Printer control language ZPL.</p>

* PRINTER_LANGUAGE_CPCL
<p>Printer control language CPCL.</p>

* PRINTER_LANGUAGE_EPS
<p>Printer control language EPS. Not Supported in 4.1</p>

* PRINTER_TYPE_ANY
* PRINTER_TYPE_NATIVE
<p>Not supported in 4.1</p>

* PRINTER_TYPE_ZEBRA
* PRINTER_TYPE_EPSON
<p>Not supported in 4.1</p>

* PRINTER_TYPE_APD
<p>Not supported in 4.1</p>

* CONNECTION_TYPE_ANY
* CONNECTION_TYPE_ON_BOARD
<p>Not supported in 4.1</p>

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
* PRINTER_STATE_IS_READY_TO_PRINT
<p>Use this name for requestState(), return true if printer ready to print.</p>

* PRINTER_STATE_IS_COVER_OPENED
<p>Use this name for requestState(), return true if cover is opened.</p>

* PRINTER_STATE_IS_DRAWER_OPENED
<p>Use this name for requestState(), return true if drawer is opened.</p>

* PRINTER_STATE_IS_PAPER_OUT
<p>Use this name for requestState(), return true if paper out.</p>

* PRINTER_STATE_IS_BATTERY_LOW
<p>Use this name for requestState(), return true if battery low.</p>


##Remarks



###iOS Notes
<p>To use a Bluetooth connection on iOS devices you should take into account the following preconditions:</p>

<ul>
<li>It will only work with Zebra printers which have the <code>Made For iPod/iPhone</code> certification.</li>
<li>Before using the printer you should pair it using the iOS system Bluetooth settings.</li>
<li>You need to include the External Accessory framework in your project (this is automatically added when you first generate the iPhone project file)</li>
<li>You need to include the Zebra printer protocol string &ldquo;com.zebra.rawport&rdquo; in your info.plist file ([project root]/project/iphone/Info.plist) under &ldquo;Supported external accessory protocols&rdquo;:

<pre><code>  &lt;key&gt;UISupportedExternalAccessoryProtocols&lt;/key&gt;
  &lt;array&gt;
      &lt;string&gt;com.zebra.rawport&lt;/string&gt;
  &lt;/array&gt;
</code></pre></li>
<li>You need to set the key <code>Required Background modes</code> to <code>App Communicates with an accessory</code> in your app&rsquo;s plist file

<pre><code>  &lt;key&gt;UIBackgroundModes&lt;/key&gt;
  &lt;array&gt;
      &lt;string&gt;external-accessory&lt;/string&gt;
  &lt;/array&gt;
</code></pre></li>
</ul>



###Android Notes
<ul>
<li>When you call searchPrinters() with Bluetooth search (with CONNECTION_TYPE_ANY or CONNECTION_TYPE_BLUETOOTH) then <em>all</em> Bluetooth devices around you will be discovered. You may see a lot of pairing requests to non-printer devices and should just cancel or ignore them. This happens because we can not detect that the device is a printer until the device is paired. It is recommended that the BT Address or WiFi MAC Address is also used when searching for printers.</li>
</ul>



###Windows Mobile/CE Notes
<ul>
<li><p>Requires a Printing Service application to be running. This is described in the <a href="../guide/printing#platform-notes">Printing Guide</a></p></li>
<li><p>You should avoid navigating from the current page using the printer without disconnecting from the printer first. You can use the window.onunload event:</p>

<pre><code>  window.onunload = function(){
      printer.disconnect();
  }
</code></pre></li>
<li><p>When you call searchPrinters() with Bluetooth search (with CONNECTION_TYPE_ANY or CONNECTION_TYPE_BLUETOOTH) then <em>all</em> Bluetooth devices around you will be discovered. You may see a lot of pairing requests to non-printer devices and should just cancel or ignore them. This happens because we can not detect that the device is a printer until the device is paired. It is recommended that the BT Address or WiFi MAC Address is also used when searching for printers.</p></li>
</ul>

