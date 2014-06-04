#Printer


## Overview
<p>The Printer Module provides access to find, connect, and print to Bluetooth and WiFi Network printers.</p>
<p>This is general API that does not provide access to specific manufacturer&rsquo;s features. The interfaces described here will automatically be included in manufacturer specific printer classes like <a href="printingzebra">PrintingZebra</a>. If you wish to have access to manufacturer specific features you would have to add both extensions to your build.yml file.</p>

<p>NOTE: Windows Mobile/CE platforms require a Printing Service application to be running. This is described in the <a href="../guide/printing#platform-notes">Printing Guide</a></p>

<h2>Enabling the API</h2>

<p>In order to use this API you must include the following extension in your <code>build.yml</code></p>

<pre><code>:::ruby
extensions: ["printing"]
</code></pre>

<p>NOTE: If you are building a Windows Mobile or Windows CE app with this API, you must set your app_type as &ldquo;rhoelements&rdquo; in your build.yml as shown <a href="../guide/build_config#other-build-time-settings">here</a>.</p>

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
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.connect()</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.Printer.connect()</code> </li></ul></li></ul>

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
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.connectWithOptions(<span class="text-info">HASH</span> options)</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.Printer.connectWithOptions(<span class="text-info">HASH</span> options)</code> </li></ul></li></ul>

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
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.disconnect()</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.Printer.disconnect()</code> </li></ul></li></ul>

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
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.enumerateSupportedControlLanguages()</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.Printer.enumerateSupportedControlLanguages()</code> </li></ul></li></ul>

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
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.Printer.enumerateSupportedTypes()</code> </li></ul></li></ul>

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
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.getAllProperties()</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.Printer.getAllProperties()</code> </li></ul></li></ul>

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
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.Printer.getDefault()</code> </li></ul></li></ul>

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
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.Printer.getPrinterByID(<span class="text-info">STRING</span> printerId)</code> </li></ul></li></ul>

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
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.Printer.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code> </li></ul></li></ul>

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
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.getProperty(<span class="text-info">STRING</span> propertyName)</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.Printer.getProperty(<span class="text-info">STRING</span> propertyName)</code> </li></ul></li></ul>

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
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.printFile(<span class="text-info">STRING</span> filePathOnDevice, <span class="text-info">HASH</span> options)</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.Printer.printFile(<span class="text-info">STRING</span> filePathOnDevice, <span class="text-info">HASH</span> options)</code> </li></ul></li></ul>

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
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.printImageFromFile(<span class="text-info">STRING</span> filePathOnDevice, <span class="text-info">INTEGER</span> x, <span class="text-info">INTEGER</span> y, <span class="text-info">HASH</span> options)</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.Printer.printImageFromFile(<span class="text-info">STRING</span> filePathOnDevice, <span class="text-info">INTEGER</span> x, <span class="text-info">INTEGER</span> y, <span class="text-info">HASH</span> options)</code> </li></ul></li></ul>

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
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.printRawString(<span class="text-info">STRING</span> command, <span class="text-info">HASH</span> options)</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.Printer.printRawString(<span class="text-info">STRING</span> command, <span class="text-info">HASH</span> options)</code> </li></ul></li></ul>

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
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.requestState(<span class="text-info">ARRAY</span> listOfParameters)</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.Printer.requestState(<span class="text-info">ARRAY</span> listOfParameters)</code> </li></ul></li></ul>

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
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.Printer.searchPrinters(<span class="text-info">HASH</span> options)</code> </li></ul></li></ul>

### setDefault(<span class="text-info">SELF_INSTANCE: Rho.Printer</span> defaultInstance)
This method allows you to set the attributes of the default object instance by passing in an object of the same class.

####Parameters
<ul><li>defaultInstance : <span class='text-info'>SELF_INSTANCE: Rho.Printer</span><p>
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
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.Printer.setDefault(<span class="text-info">SELF_INSTANCE: Rho.Printer</span> defaultInstance)</code> </li></ul></li></ul>

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
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.setProperties(<span class="text-info">HASH</span> propertyMap)</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.Printer.setProperties(<span class="text-info">HASH</span> propertyMap)</code> </li></ul></li></ul>

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
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.Printer.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code> </li></ul></li></ul>

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
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.Printer.stopSearch()</code> </li></ul></li></ul>

##Properties



###ID

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

Unique printer ID during application lifetime.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.ID</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class. <ul><li><code>Rho.Printer.ID</code> </li></ul></li></ul>

###connectionType

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

Type of connection to printer.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.connectionType</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class. <ul><li><code>Rho.Printer.connectionType</code> </li></ul></li></ul>

###deviceAddress

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

Bluetooth mac/TCP IP address.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.deviceAddress</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class. <ul><li><code>Rho.Printer.deviceAddress</code> </li></ul></li></ul>

###deviceName

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

Bluetooth/Network name of printer.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.deviceName</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class. <ul><li><code>Rho.Printer.deviceName</code> </li></ul></li></ul>

###devicePort

####Type
<span class='text-info'>INTEGER</span> 
####Description

Default port when connecting using TCP/IP.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.devicePort</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class. <ul><li><code>Rho.Printer.devicePort</code> </li></ul></li></ul>

###isConnected

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description

Connection status flag. All other properties are valid only if isConnect equals to true. Please keep in mind: this property do not guarantee real connection, because all real device functionality processed in separated thread asynchronously. If you want real check physical connection - use requestState() method with receive result in callback. Only this way process real request to device and analyze answer from device.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.isConnected</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class. <ul><li><code>Rho.Printer.isConnected</code> </li></ul></li></ul>

###printerType

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

Type of printer - see PRINTER_TYPE_... consts.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.printerType</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class. <ul><li><code>Rho.Printer.printerType</code> </li></ul></li></ul>

##Constants


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