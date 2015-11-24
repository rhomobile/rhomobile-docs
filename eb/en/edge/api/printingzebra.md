#PrinterZebra


## Overview
The PrinterZebra API provides Zebra-specific API access to Zebra's Bluetooth and Wi-Fi network printers, and to USB-capable printers for Android and Windows Mobile/CE. This API inherits all methods, properties and constants from the [Printer API](#api-printing).
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
    <script type="text/javascript" charset="utf-8" src="eb.printerzebra.js"></script>

> In the code lines above, notice that `ebapi.js` is included first, followed by `eb.printer.js` and `eb.printer.js`, which are the Printer APIs required for Enterprise Browser to output to Zebra printers. **This coding is required on each HTML page whenever an individual API will be called from that page**.
        


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
	* <code>EB.PrinterZebra.connect()</code> 


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
	* <code>EB.PrinterZebra.connectWithOptions(<span class="text-info">HASH</span> options)</code> 


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
	* <code>EB.PrinterZebra.disconnect()</code> 


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
	* <code>EB.PrinterZebra.enumerateSupportedControlLanguages()</code> 


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
	* <code>EB.PrinterZebra.enumerateSupportedTypes()</code> 


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
	* <code>EB.PrinterZebra.getAllProperties()</code> 


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
	* <code>EB.PrinterZebra.getDefault()</code> 


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
	* <code>EB.PrinterZebra.getPrinterByID(<span class="text-info">STRING</span> printerId)</code> 


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
	* <code>EB.PrinterZebra.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code> 


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
	* <code>EB.PrinterZebra.getProperty(<span class="text-info">STRING</span> propertyName)</code> 


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
	* <code>EB.PrinterZebra.printFile(<span class="text-info">STRING</span> filePathOnDevice, <span class="text-info">HASH</span> options)</code> 


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
	* <code>EB.PrinterZebra.printImageFromFile(<span class="text-info">STRING</span> filePathOnDevice, <span class="text-info">INTEGER</span> x, <span class="text-info">INTEGER</span> y, <span class="text-info">HASH</span> options)</code> 


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
	* <code>EB.PrinterZebra.printRawString(<span class="text-info">STRING</span> command, <span class="text-info">HASH</span> options)</code> 


### printStoredFormatWithArray(<span class="text-info">STRING</span> formatPathOnPrinter, <span class="text-info">Array</span> vars)
Prints a stored format on the printer, filling in the fields specified by the array. Works asynchronously; use callback to check the result.

####Parameters
<ul><li>formatPathOnPrinter : <span class='text-info'>STRING</span><p>The location of the file on the printer (e.g. "E:FORMAT.ZPL"). </p></li><li>vars : <span class='text-info'>Array</span><p>An array of strings representing the data to fill into the format. For ZPL formats, index 0 of the array corresponds to field number 2 (^FN2). For CPCL, the variables are passed in the order that they are found in the format </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

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
	* <code>myObject.printStoredFormatWithArray(<span class="text-info">STRING</span> formatPathOnPrinter, <span class="text-info">Array</span> vars)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.PrinterZebra.printStoredFormatWithArray(<span class="text-info">STRING</span> formatPathOnPrinter, <span class="text-info">Array</span> vars)</code> 


### printStoredFormatWithHash(<span class="text-info">STRING</span> formatPathOnPrinter, <span class="text-info">HASH</span> vars)
Prints a stored format on the printer, filling in the fields specified by the Hash. Works asynchronously; use callback to check the result.

####Parameters
<ul><li>formatPathOnPrinter : <span class='text-info'>STRING</span><p>The location of the file on the printer (e.g. "E:FORMAT.ZPL"). </p></li><li>vars : <span class='text-info'>HASH</span><p>A Hash containing the key / value pairs for the stored format. For ZPL formats, the key number should correspond directly to the number of the field in the format. Number keys should be passed as Strings, i.e. '1':'field1' etc. Only ZPL format is supported; CPCL format is not supported. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

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
	* <code>myObject.printStoredFormatWithHash(<span class="text-info">STRING</span> formatPathOnPrinter, <span class="text-info">HASH</span> vars)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.PrinterZebra.printStoredFormatWithHash(<span class="text-info">STRING</span> formatPathOnPrinter, <span class="text-info">HASH</span> vars)</code> 


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
	* <code>EB.PrinterZebra.requestState(<span class="text-info">ARRAY</span> listOfParameters)</code> 


### retrieveFileNames()
Retrieves the names of the files which are stored on the printer. Works asynchronously; use callback to check the result.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>PRINTER_STATUS_SUCCESS, PRINTER_STATUS_ERROR </p></li><li>fileNames : <span class='text-info'>ARRAY</span><p> </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.retrieveFileNames()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.PrinterZebra.retrieveFileNames()</code> 


### retrieveFileNamesWithExtensions(<span class="text-info">ARRAY</span> extensions)
This method only returns files which have the extensions in "extensions". Works asynchronously; use callback to check the result.

####Parameters
<ul><li>extensions : <span class='text-info'>ARRAY</span><p>The list of extensions that should be returned. </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>PRINTER_STATUS_SUCCESS, PRINTER_STATUS_ERROR </p></li><li>fileNames : <span class='text-info'>ARRAY</span><p> </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.retrieveFileNamesWithExtensions(<span class="text-info">ARRAY</span> extensions)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.PrinterZebra.retrieveFileNamesWithExtensions(<span class="text-info">ARRAY</span> extensions)</code> 


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
	* <code>EB.PrinterZebra.searchPrinters(<span class="text-info">HASH</span> options)</code> 


### sendFileContents(<span class="text-info">STRING</span> path)
Sends the contents of a file on the device to the printer. Equals to printing raw string with content of specified file. Should be used to print ZPL and CPCL commands stored inside predefined filed. Works asynchronously; use callback to check the result.

####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>Location of file to print. This path must be fully qualified path to local file on the device. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

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
	* <code>myObject.sendFileContents(<span class="text-info">STRING</span> path)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.PrinterZebra.sendFileContents(<span class="text-info">STRING</span> path)</code> 


### setDefault(<span class="text-info">SELF_INSTANCE: EB.PrinterZebra</span> defaultInstance)
This method allows you to set the attributes of the default object instance by passing in an object of the same class.

####Parameters
<ul><li>defaultInstance : <span class='text-info'>SELF_INSTANCE: EB.PrinterZebra</span><p>An instance object that is of the same class. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.PrinterZebra.setDefault(<span class="text-info">SELF_INSTANCE: EB.PrinterZebra</span> defaultInstance)</code> 


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
	* <code>EB.PrinterZebra.setProperties(<span class="text-info">HASH</span> propertyMap)</code> 


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
	* <code>EB.PrinterZebra.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code> 


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
	* <code>EB.PrinterZebra.stopSearch()</code> 


### storeImage(<span class="text-info">STRING</span> printerDriveAndFileName, <span class="text-info">STRING</span> imageFilePathOnDevice, <span class="text-info">INTEGER</span> width, <span class="text-info">INTEGER</span> height)
Stores the specified image to the connected printer as a monochrome image. Works asynchronously; use callback to check the result. The image will be stored on the printer at printerDriveAndFileName with the extension GRF. If a drive letter is not supplied, E will be used as the default (e.g. FILE becomes E:FILE.GRF). If an extension is supplied, it is ignored (E:FILE.BMP becomes E:FILE.GRF). Note that if the image resolution is large (e.g. 1024x768) this method may take a long time to execute. There are device OS limitations on supported file formats and image sizes. Android and WM support only JPG and PNG files. WM can fail to handle large (>1024x1024 pixel) images.

####Parameters
<ul><li>printerDriveAndFileName : <span class='text-info'>STRING</span><p>Path on the printer where the image will be stored. </p></li><li>imageFilePathOnDevice : <span class='text-info'>STRING</span><p>Path to the local image file containing the bitmap image to send. </p></li><li>width : <span class='text-info'>INTEGER</span><p>Desired width of the printed image, in dots. Passing -1 will preserve original width. </p></li><li>height : <span class='text-info'>INTEGER</span><p>Desired height of the printed image, in dots. Passing -1 will preserve original height. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

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
	* <code>myObject.storeImage(<span class="text-info">STRING</span> printerDriveAndFileName, <span class="text-info">STRING</span> imageFilePathOnDevice, <span class="text-info">INTEGER</span> width, <span class="text-info">INTEGER</span> height)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.PrinterZebra.storeImage(<span class="text-info">STRING</span> printerDriveAndFileName, <span class="text-info">STRING</span> imageFilePathOnDevice, <span class="text-info">INTEGER</span> width, <span class="text-info">INTEGER</span> height)</code> 


##Properties



###ID

####Type
<span class='text-info'>STRING</span> <span class='label label-warning'>Read Only</span>
####Description
Unique printer ID during application lifetime.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.ID</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.PrinterZebra.ID</code> 



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
	* <code>EB.PrinterZebra.connectionType</code> 



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
	* <code>EB.PrinterZebra.deviceAddress</code> 



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
	* <code>EB.PrinterZebra.deviceName</code> 



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
	* <code>EB.PrinterZebra.devicePort</code> 



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
	* <code>EB.PrinterZebra.isConnected</code> 



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
	* <code>EB.PrinterZebra.printerType</code> 



####Platforms

* Android
* Windows Mobile
* Windows CE

##Constants


* PRINT_MODE_APPLICATORApplicator print mode
* PRINT_MODE_CUTTERCutter print mode
* PRINT_MODE_DELAYED_CUTDelayed cut print mode
* PRINT_MODE_KIOSKKiosk print mode
* PRINT_MODE_LINERLESS_PEELLinerless peel print mode
* PRINT_MODE_LINERLESS_REWINDLinerless rewind print mode
* PRINT_MODE_PARTIAL_CUTTERPartial cutter print mode
* PRINT_MODE_PEEL_OFFPeel-off print mode
* PRINT_MODE_REWINDRewind print mode
* PRINT_MODE_RFIDRFID print mode
* PRINT_MODE_TEAR_OFFTear-off print mode (this also implies Linerless Tear print mode)
* PRINT_MODE_UNKNOWNUnknown print mode
* DISCOVERY_MODE_MULTICAST
* DISCOVERY_MODE_SUBNET_SEARCH
* DISCOVERY_MODE_DIRECTED_BROADCAST
* DISCOVERY_MODE_LOCAL_BROADCAST
* ERROR_NO_CONNECTIONUnable to create a connection to a printer
* ERROR_WRITE_FAILUREWrite to a connection failed
* ERROR_READ_FAILURERead from a connection failed
* ERROR_UNKNOWN_PRINTER_LANGUAGEUnable to determine the control language of a printer
* ERROR_MALFORMED_NETWORK_DISCOVERY_ADDRESSMalformed discovery address
* ERROR_NETWORK_ERROR_DURING_DISCOVERYNetwork error during discovery
* ERROR_INVALID_DISCOVERY_HOP_COUNTInvalid multi-cast hop count
* ERROR_MALFORMED_PRINTER_STATUS_RESPONSEMalformed status response - unable to determine printer status
* ERROR_INVALID_FORMAT_NAMEInvalid format name
* ERROR_BAD_FILE_DIRECTORY_ENTRYBad file directory entry
* ERROR_MALFORMED_FORMAT_FIELD_NUMBER'^FN' integer must be between 1 and 999
* ERROR_INVALID_PRINTER_LANGUAGEInvalid printer language
* ERROR_INVALID_FILE_NAMEInvalid file name
* ERROR_INVALID_PRINTER_DRIVE_LETTERInvalid drive specified
* PRINTER_STATE_IS_HEAD_COLDUse this name for requestState(), true if the head is cold
* PRINTER_STATE_IS_HEAD_OPENUse this name for requestState(), true if the head is open
* PRINTER_STATE_IS_HEAD_TOO_HOTUse this name for requestState(), true if the head is too hot
* PRINTER_STATE_IS_PARTIAL_FORMAT_IN_PROGRESSUse this name for requestState(), true if there is a partial format in progress
* PRINTER_STATE_IS_PAUSEDUse this name for requestState(), true if the printer is paused
* PRINTER_STATE_IS_RECEIVE_BUFFER_FULLUse this name for requestState(), true if the receive buffer is full
* PRINTER_STATE_IS_RIBBON_OUTUse this name for requestState(), true if the ribbon is out
* PRINTER_STATE_LABEL_LENGTH_IN_DOTSUse this name for requestState(), The length of the label in dots
* PRINTER_STATE_LABELS_REMAINING_IN_BATCHUse this name for requestState(), The number of labels remaining in the batch
* PRINTER_STATE_NUMBER_OF_FORMATS_IN_RECEIVE_BUFFERUse this name for requestState(), The number of formats currently in the receive buffer of the printer
* PRINTER_STATE_PRINT_MODEUse this name for requestState(), The print mode
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

* To use a Bluetooth connection on Android devices you should take into account the following preconditions: Before using the printer you should pair it using the Android system Bluetooth settings.
* When you call searchPrinters() with Bluetooth search (with CONNECTION_TYPE_ANY or CONNECTION_TYPE_BLUETOOTH) then _all_ Bluetooth devices around you will be discovered. You may see a lot of pairing requests to non-printer devices and should just cancel or ignore them. This happens because we can not detect that the device is a printer until the device is paired. It is recommended that the BT Address or WiFi MAC Address is also used when searching for printers.
* When you call searchPrinters() with USB search (with CONNECTION_TYPE_ANY or CONNECTION_TYPE_USB) then you should configure your device USB controller as "USB Host mode" and should reboot device after the configuration. USB connection is not supported on the Zebra QLn320 printer. The searchPrinters method should not return any non-printer devices. If USB printers are not supported by the SDK or device, the searchPrinters function should return PRINTER_STATUS_ERR_UNSUPPORTED. For example, executing searchPrinters on an Android device with connectionType set to CONNECTION_TYPE_USB should return PRINTER_STATUS_ERR_UNSUPPORTED.

            

###Windows Mobile/CE Notes


* Requires a Printing Service application to be running.

* You should avoid navigating from the current page using the printer without disconnecting from the printer first. You can use the window.onunload event:

        :::javascript
        window.onunload = function(){
            printer.disconnect();
        }

* When you call searchPrinters() with Bluetooth search (with CONNECTION_TYPE_ANY or CONNECTION_TYPE_BLUETOOTH) then _all_ Bluetooth devices around you will be discovered. You may see a lot of pairing requests to non-printer devices and should just cancel or ignore them. This happens because we can not detect that the device is a printer until the device is paired. It is recommended that the BT Address or WiFi MAC Address is also used when searching for printers.

###Supported Zebra Printers
Only printers listed in supported models in Zebra [SDK description](https://www.zebra.com/us/en/products-services/software/zebralink/zebralink-multiplatform-sdk.html) (click "Compatible Printers" link) are supported for use with this API. For example, the QL 320 (old model) is __not__ supported but, QLn320 and QL320 plus __are__ supported.