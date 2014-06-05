#PrinterZebra


## Overview
<p>The PrinterZebra API provides Zebra specific API access Zebra Bluetooth and WiFi Network printers. This API inherits all methods,properties,constants from the <a href="printing">Printer API</a></p>
<h2>Enabling the API</h2>

<p>In order to use this API you must include the following extension in your <code>build.yml</code>.</p>

<pre><code>:::ruby
extensions: ["printing","printing_zebra"]
</code></pre>

<h2>JavaScript Usage</h2>

<p>Be sure to review the <a href="/guide/api_js">JavaScript API Usage</a> guide for important information about using this API in JavaScript.</p>

<h2>Ruby Usage</h2>

<p>Be sure to review the <a href="/guide/api_ruby">Ruby API Usage</a> guide for important information about using this API in Ruby.</p>



##Methods



### connect()
Connect to a printer using default options. Works asynchronously, use callback to check the result. If connection is successful printer state and properties are automatically updated. NB: default options are defined by printer SDK and platform and may vary between different devices.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.connect()</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.PrinterZebra.connect()</code> </li></ul></li></ul>

### connectWithOptions(<span class="text-info">HASH</span> options)
Connect to a printer using user options. Works asynchronously, use callback to check the result. After this function call state is automatically updated.

####Parameters
<ul><li>options : <span class='text-info'>HASH</span><p>
Connect options. </p></li><ul><li>timeout : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><span class='label '> Default: 15000</span><p>
Connection timeout in milliseconds. Must be larger 0 ! Platforms:WM, iOS, Android </p></li><li>additionalStringOption : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>
Any additional info. This is currently not being used. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.connectWithOptions(<span class="text-info">HASH</span> options)</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.PrinterZebra.connectWithOptions(<span class="text-info">HASH</span> options)</code> </li></ul></li></ul>

### disconnect()
Disconnect from a printer and release OS resources. Works asynchronously, use callback to check the result.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.disconnect()</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.PrinterZebra.disconnect()</code> </li></ul></li></ul>

### enumerateSupportedControlLanguages()
Return array with languages supported by this printer.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p>
Language. See - PRINTER_LANGUAGE_... constants. </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>ARRAY : 
Array of supported printer control languages.<ul><li><i>Object</i> : <span class='text-info'>STRING</span><p>
Language. See - PRINTER_LANGUAGE_... constants. </p></li></ul></li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.enumerateSupportedControlLanguages()</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.PrinterZebra.enumerateSupportedControlLanguages()</code> </li></ul></li></ul>

### enumerateSupportedTypes()
Returns array with supported printer types immediately. The result depends on your build configuration. Each extension is linked to application during build. If you want to add or remove support of any printer type please update extension list in the build.yml. 

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p>
Type of device. </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>ARRAY : 
Array of currently supported printer types. Depends on build settings. May contain PRINTER_TYPE_ZEBRA, PRINTER_TYPE_EPSON, PRINTER_TYPE_APD, PRINTER_TYPE_NATIVE or any combination of them.<ul><li><i>Object</i> : <span class='text-info'>STRING</span><p>
Type of device. </p></li></ul></li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.PrinterZebra.enumerateSupportedTypes()</code> </li></ul></li></ul>

### getAllProperties()
This method will return all of object/value pairs for the propertyNames of the API class.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>HASH : 
Map of all available properties<ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul></li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.getAllProperties()</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.PrinterZebra.getAllProperties()</code> </li></ul></li></ul>

### getDefault()
This method will return an object that represents the default instance of the API Class. For example Camera.getDefault will return a Camera object that represents the default camera.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>SELF_INSTANCE</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>SELF_INSTANCE : 
Default object of Module.</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.PrinterZebra.getDefault()</code> </li></ul></li></ul>

### getPrinterByID(<span class="text-info">STRING</span> printerId)
Return printer instance specified by printerId. If there is no printers with this ID null is returned. To get valid printerId please use searchPrinters function.

####Parameters
<ul><li>printerId : <span class='text-info'>STRING</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>SELF_INSTANCE</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>SELF_INSTANCE</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.PrinterZebra.getPrinterByID(<span class="text-info">STRING</span> printerId)</code> </li></ul></li></ul>

### getProperties(<span class="text-info">ARRAY</span> arrayofNames)
This method will return a set of object/value pairs for the list of the propertyName that is passed in. The propertyNames must be a valid property of the API class.

####Parameters
<ul><li>arrayofNames : <span class='text-info'>ARRAY</span><p>
List of properties I want to know about </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>HASH : 
Map of properties I want to know about<ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul></li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.PrinterZebra.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code> </li></ul></li></ul>

### getProperty(<span class="text-info">STRING</span> propertyName)
This method will return the value of the propertyName that is passed in. The propertyName must be a valid property of the API class.

####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p>
The property to return info about. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>STRING : 
The property to return info about.</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.getProperty(<span class="text-info">STRING</span> propertyName)</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.PrinterZebra.getProperty(<span class="text-info">STRING</span> propertyName)</code> </li></ul></li></ul>

### printFile(<span class="text-info">STRING</span> filePathOnDevice, <span class="text-info">HASH</span> options)
Prints file. Works asynchronously, use callback to check the result. File extension is used to determine its type. Supported types: JPEG and PNG images.

####Parameters
<ul><li>filePathOnDevice : <span class='text-info'>STRING</span><p>
Full path to local image file on the device. </p></li><li>options : <span class='text-info'>HASH</span> <span class='label label-info'>Optional</span><p> 
Not providing properties to this function will print with default settings. Reserved for future use.</p></li><ul><li>propertyWithStringValue : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>
This is currently not being used. </p></li><li>propertyWithIntValue : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><p>
This is currently not being used. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.printFile(<span class="text-info">STRING</span> filePathOnDevice, <span class="text-info">HASH</span> options)</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.PrinterZebra.printFile(<span class="text-info">STRING</span> filePathOnDevice, <span class="text-info">HASH</span> options)</code> </li></ul></li></ul>

### printImageFromFile(<span class="text-info">STRING</span> filePathOnDevice, <span class="text-info">INTEGER</span> x, <span class="text-info">INTEGER</span> y, <span class="text-info">HASH</span> options)
Prints an image from mobile digital device's file system to the connected printer as a monochrome image. Works asynchronously, use callback to check the result. Note: if the image resolution is large (e.g. 1024x768) this method may take a long time to execute. It is not guaranteed that files larger than 1024x1024 could be printed correctly.

####Parameters
<ul><li>filePathOnDevice : <span class='text-info'>STRING</span><p>
Full path to local image file on the device. (The image must be either a PNG or JPG, all other types are platform depend). </p></li><li>x : <span class='text-info'>INTEGER</span><p>
Horizontal starting position in dots. </p></li><li>y : <span class='text-info'>INTEGER</span><p>
Vertical starting position in dots. </p></li><li>options : <span class='text-info'>HASH</span> <span class='label label-info'>Optional</span><p>
Provide a set of optional parameters. </p></li><ul><li>width : <span class='text-info'>INTEGER</span><p>
Desired width of the printed image. Passing -1 will preserve original width. </p></li><li>height : <span class='text-info'>INTEGER</span><p>
Desired height of the printed image. Passing -1 will preserve original height. </p></li><li>isInsideFormat : <span class='text-info'>BOOLEAN</span><p>
Boolean value indicating whether this image should be printed by itself (false), or is part of a format being written to the connection (true). </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.printImageFromFile(<span class="text-info">STRING</span> filePathOnDevice, <span class="text-info">INTEGER</span> x, <span class="text-info">INTEGER</span> y, <span class="text-info">HASH</span> options)</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.PrinterZebra.printImageFromFile(<span class="text-info">STRING</span> filePathOnDevice, <span class="text-info">INTEGER</span> x, <span class="text-info">INTEGER</span> y, <span class="text-info">HASH</span> options)</code> </li></ul></li></ul>

### printRawString(<span class="text-info">STRING</span> command, <span class="text-info">HASH</span> options)
Send raw string to printer. Works asynchronously, use callback to check the result.
NOTE: In Windows Mobile/CE using Zebra printers, this will not print ZPL commands, but just line mode (or raw text).


####Parameters
<ul><li>command : <span class='text-info'>STRING</span><p>
Raw string to print. Could be any valid command in printer supported programming language. </p></li><li>options : <span class='text-info'>HASH</span> <span class='label label-info'>Optional</span><p> 
Not providing properties to this function will print with default settings.</p></li><ul><li>propertyWithStringValue : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>
This is currently not being used. </p></li><li>propertyWithIntValue : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><p>
This is currently not being used. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>
PRINTER_STATUS_SUCCESS, PRINTER_STATUS_ERROR. </p></li><li>message : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>
Error message, only if status = ERROR. </p></li><li>stringResponce : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>
Response from printer if received, converted to string from byteArray(original data) Platforms:Android, WM </p></li><li>byteArrayResponce : <span class='text-info'>ARRAY</span> <span class='label label-info'>Optional</span><p>
Response from printer if received. Platforms:Android </p></li><ul><li><i>Object</i> : <span class='text-info'>INTEGER</span><p> </p></li></ul></ul></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.printRawString(<span class="text-info">STRING</span> command, <span class="text-info">HASH</span> options)</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.PrinterZebra.printRawString(<span class="text-info">STRING</span> command, <span class="text-info">HASH</span> options)</code> </li></ul></li></ul>

### printStoredFormatWithArray(<span class="text-info">STRING</span> formatPathOnPrinter, <span class="text-info">Array</span> vars)
Prints a stored format on the printer, filling in the fields specified by the array. Works asynchronously, use callback to check the result.

####Parameters
<ul><li>formatPathOnPrinter : <span class='text-info'>STRING</span><p>
The location of the file on the printer (e.g. "E:FORMAT.ZPL"). </p></li><li>vars : <span class='text-info'>Array</span><p>
An array of strings representing the data to fill into the format. For ZPL formats, index 0 of the array corresponds to field number 2 (^FN2). For CPCL, the variables are passed in the order that they are found in the format </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.printStoredFormatWithArray(<span class="text-info">STRING</span> formatPathOnPrinter, <span class="text-info">Array</span> vars)</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.PrinterZebra.printStoredFormatWithArray(<span class="text-info">STRING</span> formatPathOnPrinter, <span class="text-info">Array</span> vars)</code> </li></ul></li></ul>

### printStoredFormatWithHash(<span class="text-info">STRING</span> formatPathOnPrinter, <span class="text-info">HASH</span> vars)
Prints a stored format on the printer, filling in the fields specified by the Hash. Works asynchronously, use callback to check the result.

####Parameters
<ul><li>formatPathOnPrinter : <span class='text-info'>STRING</span><p>
The location of the file on the printer (e.g. "E:FORMAT.ZPL"). </p></li><li>vars : <span class='text-info'>HASH</span><p>
An Hash which contains the key/value pairs for the stored format. For ZPL formats, the key number should correspond directly to the number of the field in the format. Number keys should be passed as String: '1':'field1' etc. CPCL format do not supported - only ZPL! </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.printStoredFormatWithHash(<span class="text-info">STRING</span> formatPathOnPrinter, <span class="text-info">HASH</span> vars)</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.PrinterZebra.printStoredFormatWithHash(<span class="text-info">STRING</span> formatPathOnPrinter, <span class="text-info">HASH</span> vars)</code> </li></ul></li></ul>

### requestState(<span class="text-info">ARRAY</span> listOfParameters)
Requests printer state with a list of parameters.

* Works asynchronously and uses the callback to check the result. 
* Returns hash with status, and parameters as keys.

NOTE: On the Windows Mobile / Windows CE platform, this method does not work in the case of a bluetooth connection.

####Parameters
<ul><li>listOfParameters : <span class='text-info'>ARRAY</span><p>
List of parameters for request from printer device. </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p>
Parameter name - see consts with PRINTER_STATE_... </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>
PRINTER_STATUS_SUCCESS, PRINTER_STATUS_ERROR. </p></li><li>message : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>
Error message, only if status = ERROR. </p></li><li>propertyWithIntValue : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><p>
This is currently not being used. </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.requestState(<span class="text-info">ARRAY</span> listOfParameters)</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.PrinterZebra.requestState(<span class="text-info">ARRAY</span> listOfParameters)</code> </li></ul></li></ul>

### retrieveFileNames()
Retrieves the names of the files which are stored on the printer. Works asynchronously, use callback to check the result.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>
PRINTER_STATUS_SUCCESS, PRINTER_STATUS_ERROR </p></li><li>fileNames : <span class='text-info'>ARRAY</span><p>
{} </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul></ul></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.retrieveFileNames()</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.PrinterZebra.retrieveFileNames()</code> </li></ul></li></ul>

### retrieveFileNamesWithExtensions(<span class="text-info">ARRAY</span> extensions)
This method only returns files which have the extensions in "extensions". Works asynchronously, use callback to check the result.

####Parameters
<ul><li>extensions : <span class='text-info'>ARRAY</span><p>
The list of extensions that should be returned. </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>
PRINTER_STATUS_SUCCESS, PRINTER_STATUS_ERROR </p></li><li>fileNames : <span class='text-info'>ARRAY</span><p>
{} </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul></ul></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.retrieveFileNamesWithExtensions(<span class="text-info">ARRAY</span> extensions)</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.PrinterZebra.retrieveFileNamesWithExtensions(<span class="text-info">ARRAY</span> extensions)</code> </li></ul></li></ul>

### searchPrinters(<span class="text-info">HASH</span> options)
Search printers connected to this device, available Bluetooth(R) or Network printers. It is highly recommended to search for a particular Bluetooth(R) address or IP address for Network connections. Also this method could be used to get printerID for known network/bluetooth printer, in this case you should specify deviceAddress parameter in options. Result is returned asynchronously using callback. Callback is called for each discovered printer. Search is finished if printerID is not set in callback hash. Note: discovery is not guaranteed to return all the available devices. Please run this method at least 2-3 times to get result with good accuracy.

NOTE: on Android platfrom due to HW specific, when you call searchPrinters() for Bluetooth or for TCP and Bluetooth both, Application can freeze for few seconds - if user touch screen Android system can show Alert about "application not responded" - user should select [continue waiting] button.
                

####Parameters
<ul><li>options : <span class='text-info'>HASH</span> <span class='label label-info'>Optional</span><p>
Options for discover. </p></li><ul><li>printerType : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><span class='label '> Default: PRINTER_TYPE_ANY</span><p>
Printer types to search. Make sure that Printer type is supported by calling enumerateSupportedTypes method. </p></li><li>connectionType : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><span class='label '> Default: CONNECTION_TYPE_ANY</span><p>
Interfaces for search (Bluetooth/TCP/All) </p></li><li>timeout : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><span class='label '> Default: 30000</span><p>
Maximum search interval in milliseconds, applies to network discovery. This is the maximum interval for wait during connection attempt. Note: if no printer was found even with timeout property status will be set to PRINTER_STATUS_SUCCESS, but without any printerId. </p></li><li>deviceAddress : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>
Printer address (mac or ip). Can be used for setting either subnet mask or full address of printer. For TCP if address is not specified /8 subnet will be used for search.  </p></li><li>devicePort : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><span class='label '> Default: 6101</span><p>
Override default printer port number. Applicable for network discovery only. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>
Status of network discovery, can be following:
* PRINTER_STATUS_SUCCESS - when printer is discovered or operation is finished;
* PRINTER_STATUS_ERROR - general error 
* PRINTER_STATUS_ERR_UNSUPPORTED - in case if printer type is not supported
* PRINTER_STATUS_ERR_NOT_CONNECTED - in case if deviceAddress was specified in options and device was unable to connect to printer. </p></li><li>printerID : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>
Printer ID, valid only if status equals to 'PRINTER_STATUS_SUCCESS'. If there are no more printers available printerID will not be defined. </p></li><li>message : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>
Error message, only if status = ERROR. </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.PrinterZebra.searchPrinters(<span class="text-info">HASH</span> options)</code> </li></ul></li></ul>

### sendFileContents(<span class="text-info">STRING</span> path)
Sends the contents of a file on the device to the printer. Equals to printing raw string with content of specified file. Should be used to print ZPL and CPCL commands stored inside predefined filed. Works asynchronously, use callback to check the result.

####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>
Location of file to print. This path must be fully qualified path to local file on the device. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.sendFileContents(<span class="text-info">STRING</span> path)</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.PrinterZebra.sendFileContents(<span class="text-info">STRING</span> path)</code> </li></ul></li></ul>

### setDefault(<span class="text-info">SELF_INSTANCE: Rho.PrinterZebra</span> defaultInstance)
This method allows you to set the attributes of the default object instance by passing in an object of the same class.

####Parameters
<ul><li>defaultInstance : <span class='text-info'>SELF_INSTANCE: Rho.PrinterZebra</span><p>
An instance object that is of the same class. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.PrinterZebra.setDefault(<span class="text-info">SELF_INSTANCE: Rho.PrinterZebra</span> defaultInstance)</code> </li></ul></li></ul>

### setProperties(<span class="text-info">HASH</span> propertyMap)
This method will set the values of a list of properties for the API class. The propertyName must be a valid property for the class and must also not be read only.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>
Map of properties I want to set </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.setProperties(<span class="text-info">HASH</span> propertyMap)</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.PrinterZebra.setProperties(<span class="text-info">HASH</span> propertyMap)</code> </li></ul></li></ul>

### setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)
This method will set the value of a property for the API class. The propertyName must be a valid property for the class and must also not be read only.

####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p>
The one property name that I want to set </p></li><li>propertyValue : <span class='text-info'>STRING</span><p>
The one property value that I want to set </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.PrinterZebra.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code> </li></ul></li></ul>

### stopSearch()
Stop all active and pending search requests. Function does not return any results. All running search requests are canceled immediately.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.PrinterZebra.stopSearch()</code> </li></ul></li></ul>

### storeImage(<span class="text-info">STRING</span> printerDriveAndFileName, <span class="text-info">STRING</span> imageFilePathOnDevice, <span class="text-info">INTEGER</span> width, <span class="text-info">INTEGER</span> height)
Stores the specified image to the connected printer as a monochrome image. Works asynchronously, use callback to check the result. The image will be stored on the printer at printerDriveAndFileName with the extension GRF. If a drive letter is not supplied, E will be used as the default (e.g. FILE becomes E:FILE.GRF). If an extension is supplied, it is ignored (E:FILE.BMP becomes E:FILE.GRF). Note: if the image resolution is large (e.g. 1024x768) this method may take a long time to execute. There are device OS limitations on supported file formats and image sizes. iOS, Android and WM are supporting only JPG and PNG files. WM can fail to handle large (>1024x1024 pixel) images.

####Parameters
<ul><li>printerDriveAndFileName : <span class='text-info'>STRING</span><p>
Path on the printer where the image will be stored. </p></li><li>imageFilePathOnDevice : <span class='text-info'>STRING</span><p>
Path to the local image file containing the bitmap image to send. </p></li><li>width : <span class='text-info'>INTEGER</span><p>
Desired width of the printed image, in dots. Passing -1 will preserve original width. </p></li><li>height : <span class='text-info'>INTEGER</span><p>
Desired height of the printed image, in dots. Passing -1 will preserve original height. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.storeImage(<span class="text-info">STRING</span> printerDriveAndFileName, <span class="text-info">STRING</span> imageFilePathOnDevice, <span class="text-info">INTEGER</span> width, <span class="text-info">INTEGER</span> height)</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.PrinterZebra.storeImage(<span class="text-info">STRING</span> printerDriveAndFileName, <span class="text-info">STRING</span> imageFilePathOnDevice, <span class="text-info">INTEGER</span> width, <span class="text-info">INTEGER</span> height)</code> </li></ul></li></ul>

##Properties



###ID

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

Unique printer ID during application lifetime.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.ID</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class. <ul><li><code>Rho.PrinterZebra.ID</code> </li></ul></li></ul>

###connectionType

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

Type of connection to printer.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.connectionType</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class. <ul><li><code>Rho.PrinterZebra.connectionType</code> </li></ul></li></ul>

###deviceAddress

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

Bluetooth mac/TCP IP address.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.deviceAddress</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class. <ul><li><code>Rho.PrinterZebra.deviceAddress</code> </li></ul></li></ul>

###deviceName

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

Bluetooth/Network name of printer.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.deviceName</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class. <ul><li><code>Rho.PrinterZebra.deviceName</code> </li></ul></li></ul>

###devicePort

####Type
<span class='text-info'>INTEGER</span> 
####Description

Default port when connecting using TCP/IP.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.devicePort</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class. <ul><li><code>Rho.PrinterZebra.devicePort</code> </li></ul></li></ul>

###isConnected

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description

Connection status flag. All other properties are valid only if isConnect equals to true. Please keep in mind: this property do not guarantee real connection, because all real device functionality processed in separated thread asynchronously. If you want real check physical connection - use requestState() method with receive result in callback. Only this way process real request to device and analyze answer from device.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.isConnected</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class. <ul><li><code>Rho.PrinterZebra.isConnected</code> </li></ul></li></ul>

###printerType

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

Type of printer - see PRINTER_TYPE_... consts.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.printerType</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class. <ul><li><code>Rho.PrinterZebra.printerType</code> </li></ul></li></ul>

##Constants


* PRINT_MODE_APPLICATOR
Applicator print mode
* PRINT_MODE_CUTTER
Cutter print mode
* PRINT_MODE_DELAYED_CUT
Delayed cut print mode
* PRINT_MODE_KIOSK
Kiosk print mode
* PRINT_MODE_LINERLESS_PEEL
Linerless peel print mode
* PRINT_MODE_LINERLESS_REWIND
Linerless rewind print mode
* PRINT_MODE_PARTIAL_CUTTER
Partial cutter print mode
* PRINT_MODE_PEEL_OFF
Peel-off print mode
* PRINT_MODE_REWIND
Rewind print mode
* PRINT_MODE_RFID
RFID print mode
* PRINT_MODE_TEAR_OFF
Tear-off print mode (this also implies Linerless Tear print mode)
* PRINT_MODE_UNKNOWN
Unknown print mode
* DISCOVERY_MODE_MULTICAST
* DISCOVERY_MODE_SUBNET_SEARCH
* DISCOVERY_MODE_DIRECTED_BROADCAST
* DISCOVERY_MODE_LOCAL_BROADCAST
* ERROR_NO_CONNECTION
Unable to create a connection to a printer
* ERROR_WRITE_FAILURE
Write to a connection failed
* ERROR_READ_FAILURE
Read from a connection failed
* ERROR_UNKNOWN_PRINTER_LANGUAGE
Unable to determine the control language of a printer
* ERROR_MALFORMED_NETWORK_DISCOVERY_ADDRESS
Malformed discovery address
* ERROR_NETWORK_ERROR_DURING_DISCOVERY
Network error during discovery
* ERROR_INVALID_DISCOVERY_HOP_COUNT
Invalid multicast hop count
* ERROR_MALFORMED_PRINTER_STATUS_RESPONSE
Malformed status response - unable to determine printer status
* ERROR_INVALID_FORMAT_NAME
Invalid format name
* ERROR_BAD_FILE_DIRECTORY_ENTRY
Bad file directory entry
* ERROR_MALFORMED_FORMAT_FIELD_NUMBER
'^FN' integer must be between 1 and 999
* ERROR_INVALID_PRINTER_LANGUAGE
Invalid printer language
* ERROR_INVALID_FILE_NAME
Invalid file name
* ERROR_INVALID_PRINTER_DRIVE_LETTER
Invalid drive specified
* PRINTER_STATE_IS_HEAD_COLD
use this name for requestState(), true if the head is cold
* PRINTER_STATE_IS_HEAD_OPEN
use this name for requestState(), true if the head is open
* PRINTER_STATE_IS_HEAD_TOO_HOT
use this name for requestState(), true if the head is too hot
* PRINTER_STATE_IS_PARTIAL_FORMAT_IN_PROGRESS
use this name for requestState(), true if there is a partial format in progress
* PRINTER_STATE_IS_PAUSED
use this name for requestState(), true if the printer is paused
* PRINTER_STATE_IS_RECEIVE_BUFFER_FULL
use this name for requestState(), true if the receive buffer is full
* PRINTER_STATE_IS_RIBBON_OUT
use this name for requestState(), true if the ribbon is out
* PRINTER_STATE_LABEL_LENGTH_IN_DOTS
use this name for requestState(), The length of the label in dots
* PRINTER_STATE_LABELS_REMAINING_IN_BATCH
use this name for requestState(), The number of labels remaining in the batch
* PRINTER_STATE_NUMBER_OF_FORMATS_IN_RECEIVE_BUFFER
use this name for requestState(), The number of formats currently in the receive buffer of the printer
* PRINTER_STATE_PRINT_MODE
use this name for requestState(), The print mode
* PRINTER_LANGUAGE_ZPL
Printer control language ZPL.
* PRINTER_LANGUAGE_CPCL
Printer control language CPCL.
* PRINTER_LANGUAGE_EPS
Printer control language EPS. Not Supported in 4.1
* PRINTER_TYPE_ANY
* PRINTER_TYPE_NATIVE
Not supported in 4.1
* PRINTER_TYPE_ZEBRA
* PRINTER_TYPE_EPSON
Not supported in 4.1
* PRINTER_TYPE_APD
Not supported in 4.1
* CONNECTION_TYPE_ANY
* CONNECTION_TYPE_ON_BOARD
Not supported in 4.1
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
Use this name for requestState(), return true if printer ready to print.
* PRINTER_STATE_IS_COVER_OPENED
Use this name for requestState(), return true if cover is opened.
* PRINTER_STATE_IS_DRAWER_OPENED
Use this name for requestState(), return true if drawer is opened.
* PRINTER_STATE_IS_PAPER_OUT
Use this name for requestState(), return true if paper out.
* PRINTER_STATE_IS_BATTERY_LOW
Use this name for requestState(), return true if battery low.

##Remarks



###iOS Notes

To use a Bluetooth connection on iOS devices you should take into account the following preconditions:

* It will only work with Zebra printers which have the `Made For iPod/iPhone` certification.
* Before using the printer you should pair it using the iOS system Bluetooth settings.
* You need to include the External Accessory framework in your project (this is automatically added when you first generate the iPhone project file)
* You need to include the Zebra printer protocol string "com.zebra.rawport" in your info.plist file ([project root]/project/iphone/Info.plist) under "Supported external accessory protocols":
        <key>UISupportedExternalAccessoryProtocols</key>
        <array>
            <string>com.zebra.rawport</string>
        </array>
* You need to set the key `Required Background modes` to `App Communicates with an accessory` in your app's plist file
        <key>UIBackgroundModes</key>
        <array>
            <string>external-accessory</string>
        </array>
            

###Android Notes


* When you call searchPrinters() with Bluetooth search (with CONNECTION_TYPE_ANY or CONNECTION_TYPE_BLUETOOTH) then _all_ Bluetooth devices around you will be discovered. You may see a lot of pairing requests to non-printer devices and should just cancel or ignore them. This happens because we can not detect that the device is a printer until the device is paired. It is recommended that the BT Address or WiFi MAC Address is also used when searching for printers.

            

###Windows Mobile/CE Notes


* You must set your app_type as "rhoelements" in your build.yml as shown [here](../guide/build_config#other-build-time-settings).

* Requires a Printing Service application to be running. This is described in the [Printing Guide](../guide/printing#platform-notes)
   
* You should avoid navigating from the current page using the printer without disconnecting from the printer first. You can use the window.onunload event:

        window.onunload = function(){
            printer.disconnect();
        }

* When you call searchPrinters() with Bluetooth search (with CONNECTION_TYPE_ANY or CONNECTION_TYPE_BLUETOOTH) then _all_ Bluetooth devices around you will be discovered. You may see a lot of pairing requests to non-printer devices and should just cancel or ignore them. This happens because we can not detect that the device is a printer until the device is paired. It is recommended that the BT Address or WiFi MAC Address is also used when searching for printers.

            

##Examples



###Printing via Bluetooth

To print to the Zebra printer we must first search for the device. In this example we are using the searchPrinters method and passing in options to limit the search to Bluetooth and also look for Zebra printers only. If we knew the printer Bluetooth address we could have added the 'deviceAddress' parameter. The callback function will be executed for each printer found. When a printer is found the callback object will contain a 'printerID' property. This ID is an internal RhoMobie ID used. If no printerID property is there for the successful callback object, then it means that the search has finished.
<pre><code>

var printers = [];

Rho.Printer.searchPrinters({ 
    connectionType:Rho.Printer.CONNECTION_TYPE_BLUETOOTH,  
    printerType: Rho.Printer.PRINTER_TYPE_ZEBRA
    }, function (cb){
        if(cb.status == 'PRINTER_STATUS_SUCCESS')
        {
            if (typeof cb.printerID != "undefined")
            {
                console.log('Found: ' + cb.printerID)
                printers.push(cb.printerID);
            }
            else
            {
                console.log('Done Searching');
            }
        }
        else
        {
            console.log(cb.status);
        }
    }
);

                            
</code></pre>

Now that we have found a printer. The `printers` array will contain the `printerID` we need to create an instance object that we will use for all communications. Upon first connection to the printer via Bluetooth, you may see a prompt to enter the Bluetooth PIN. Check the manufacturers guide for details. Normally the default is '0000' or '1111' or '1234'. Once it is connected, you should see some indication in the printer (like a blue light).
<pre><code>

var myPrinter = Rho.Printer.getPrinterByID(printers[0]);

// Let's try connecting
myPrinter.connect(function (cb){
    console.log(cb);
    // This will be the Zebra's `Friendly Name` 
    // by default it is the serial number
    console.log(myPrinter.deviceName);

    // This will be the BT MC Address 
    since we are connecting via BlueTooth
    console.log(myPrinter.deviceAddress);
});

                            
</code></pre>

Now we can just print a test string and read some properties of the printer to make sure the communications is working.
<pre><code>

// If my printer was in line mode I would see this text printed
myPrinter.printRawString('This is a test print');

// Example of sending a Zebra CPCL Command
// changing from linemode to ZPL mode
myPrinter.printRawString('! U1 setvar "device.languages" "ZPL"\r\n');

// Get state - this is real-time status of printer.
// reading a property of the myPrinter instance will
// show last known status
myPrinter.requestState(['PRINTER_STATE_IS_READY_TO_PRINT',
    'PRINTER_STATE_IS_PAPER_OUT'],function (cb){
        console.log(cb.status);
        console.log(cb.PRINTER_STATE_IS_PAPER_OUT);
        console.log(cb.PRINTER_STATE_IS_READY_TO_PRINT);

    });
                   
                            
</code></pre>