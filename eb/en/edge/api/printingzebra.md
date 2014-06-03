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

### connectWithOptions()
Connect to a printer using user options. Works asynchronously, use callback to check the result. After this function call state is automatically updated.

### disconnect()
Disconnect from a printer and release OS resources. Works asynchronously, use callback to check the result.

### enumerateSupportedControlLanguages()
Return array with languages supported by this printer.

### enumerateSupportedTypes()
Returns array with supported printer types immediately. The result depends on your build configuration. Each extension is linked to application during build. If you want to add or remove support of any printer type please update extension list in the build.yml. 

### getAllProperties()
This method will return all of object/value pairs for the propertyNames of the API class.

### getDefault()
This method will return an object that represents the default instance of the API Class. For example Camera.getDefault will return a Camera object that represents the default camera.

### getPrinterByID()
Return printer instance specified by printerId. If there is no printers with this ID null is returned. To get valid printerId please use searchPrinters function.

### getProperties()
This method will return a set of object/value pairs for the list of the propertyName that is passed in. The propertyNames must be a valid property of the API class.

### getProperty()
This method will return the value of the propertyName that is passed in. The propertyName must be a valid property of the API class.

### printFile()
Prints file. Works asynchronously, use callback to check the result. File extension is used to determine its type. Supported types: JPEG and PNG images.

### printImageFromFile()
Prints an image from mobile digital device's file system to the connected printer as a monochrome image. Works asynchronously, use callback to check the result. Note: if the image resolution is large (e.g. 1024x768) this method may take a long time to execute. It is not guaranteed that files larger than 1024x1024 could be printed correctly.

### printRawString()
Send raw string to printer. Works asynchronously, use callback to check the result.
NOTE: In Windows Mobile/CE using Zebra printers, this will not print ZPL commands, but just line mode (or raw text).


### printStoredFormatWithArray()
Prints a stored format on the printer, filling in the fields specified by the array. Works asynchronously, use callback to check the result.

### printStoredFormatWithHash()
Prints a stored format on the printer, filling in the fields specified by the Hash. Works asynchronously, use callback to check the result.

### requestState()
Requests printer state with a list of parameters.

* Works asynchronously and uses the callback to check the result. 
* Returns hash with status, and parameters as keys.

NOTE: On the Windows Mobile / Windows CE platform, this method does not work in the case of a bluetooth connection.

### retrieveFileNames()
Retrieves the names of the files which are stored on the printer. Works asynchronously, use callback to check the result.

### retrieveFileNamesWithExtensions()
This method only returns files which have the extensions in "extensions". Works asynchronously, use callback to check the result.

### searchPrinters()
Search printers connected to this device, available Bluetooth(R) or Network printers. It is highly recommended to search for a particular Bluetooth(R) address or IP address for Network connections. Also this method could be used to get printerID for known network/bluetooth printer, in this case you should specify deviceAddress parameter in options. Result is returned asynchronously using callback. Callback is called for each discovered printer. Search is finished if printerID is not set in callback hash. Note: discovery is not guaranteed to return all the available devices. Please run this method at least 2-3 times to get result with good accuracy.

NOTE: on Android platfrom due to HW specific, when you call searchPrinters() for Bluetooth or for TCP and Bluetooth both, Application can freeze for few seconds - if user touch screen Android system can show Alert about "application not responded" - user should select [continue waiting] button.
                

### sendFileContents()
Sends the contents of a file on the device to the printer. Equals to printing raw string with content of specified file. Should be used to print ZPL and CPCL commands stored inside predefined filed. Works asynchronously, use callback to check the result.

### setDefault()
This method allows you to set the attributes of the default object instance by passing in an object of the same class.

### setProperties()
This method will set the values of a list of properties for the API class. The propertyName must be a valid property for the class and must also not be read only.

### setProperty()
This method will set the value of a property for the API class. The propertyName must be a valid property for the class and must also not be read only.

### stopSearch()
Stop all active and pending search requests. Function does not return any results. All running search requests are canceled immediately.

### storeImage()
Stores the specified image to the connected printer as a monochrome image. Works asynchronously, use callback to check the result. The image will be stored on the printer at printerDriveAndFileName with the extension GRF. If a drive letter is not supplied, E will be used as the default (e.g. FILE becomes E:FILE.GRF). If an extension is supplied, it is ignored (E:FILE.BMP becomes E:FILE.GRF). Note: if the image resolution is large (e.g. 1024x768) this method may take a long time to execute. There are device OS limitations on supported file formats and image sizes. iOS, Android and WM are supporting only JPG and PNG files. WM can fail to handle large (>1024x1024 pixel) images.