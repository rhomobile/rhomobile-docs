#Barcode


## Overview
<p>The Barcode Module provides access to control the functionality of the device&rsquo;s scanner. Because RhoMobile Suite is designed to run on both Consumer devices and Motorola Solutions' enterprise devices support for the Barcode API will vary for each method and properties depending on which platform you are running on. Please note that a lot these APIs are optimized for the extended functionality that Motorola Solutions devices provide. Check the platform indicators in each property or method section. In general if you are developing for a consumer device the number of symbologies available to you will be limited to just the most common ones, eg EAN13, UPCA etc and your scanning will be via the device camera. If your application is running on Motorola Solutions' hardware you will have much finer control over a more fully featured Scanner, often with a choice of scanner hardware on the device. In general if you wish to capture a single barcode in a &lsquo;one shot&rsquo; use case, eg your App just wants to capture a single barcode to be submitted to a price comparison website then use Barcode.take(callback); if your application is expecting a number of barcodes to be received, common in enterprise scenarios for example a user in a warehouse then use Barcode.enable(callback). The Barcode API will not run on non-Motorola Windows Mobile / CE devices.</p>
<p>Only the foreground RhoElements application is given access to the scanning hardware, when an application is sent to the background its state will be saved and it will automatically relinquish control of the scanner. When brought back to the foreground, an application previously using the barcode API will have its previous configuration reapplied automatically.In VC70 scanner will work only if connected in SSI Mode.</p>

<h2>Enabling the API</h2>

<p>In order to use this API you must include the following extension in your <code>build.yml</code></p>

<pre><code>:::ruby
extensions: ["barcode"]
</code></pre>

<p>The <code>barcode</code> extension is also included automatically if you specify the following in your <code>build.yml</code></p>

<pre><code>:::ruby
app_type: "rhoelements"
</code></pre>

<p>NOTE: If you are building a Windows Mobile or Windows CE app with this API, you must set your app_type as &ldquo;rhoelements&rdquo; in your build.yml as shown <a href="../guide/build_config#other-build-time-settings">here</a>.</p>

<h2>JavaScript Usage</h2>

<p>Be sure to review the <a href="/guide/api_js">JavaScript API Usage</a> guide for important information about using this API in JavaScript</p>

<h2>Ruby Usage</h2>

<p>Be sure to review the <a href="/guide/api_ruby">Ruby API Usage</a> guide for important information about using this API in Ruby</p>



##Methods



### barcode_recognize()
Recognizes a barcode on an image. Returns a string with recognized code, or empty string if the barcode is not recognized.

### commandRemoteScanner()
Instruct the connected RS507 scanner to perform some action.

### disable()
Disables the barcode scanner. This reverts the scanner to its default state and flushes any current decoder settings.

### enable()
Enabling the scanner puts it in a state where it will respond to the trigger (on devices with a hardware trigger) or will accept a command to initiate a soft scan (start method). Scanned barcodes will be available to the application through the callback provided to this method. Only one scanner on the device can be enabled at any one time, to switch between the imager and camera scanners (for example) then first disable the currently enabled scanner. If you do not specify a callback to this method you will received the scanned data as keystrokes. Note that it is necessary to enable the scanner on WM/CE devices prior to being able to retrieve the state of properties.

### enumerate()
Used to gain access to all scanner objects present on the device. For consumer devices you will most likely only have a single scanner, your device's camera but Enterprise grade hardware may have two or more scanners attached.

### getAllProperties()
This method will return all of object/value pairs for the propertyNames of the API class.

### getDefault()
This method will return an object that represents the default instance of the API Class. For example Camera.getDefault will return a Camera object that represents the default camera.

### getProperties()
This method will return a set of object/value pairs for the list of the propertyName that is passed in. The propertyNames must be a valid property of the API class.

### getProperty()
This method will return the value of the propertyName that is passed in. The propertyName must be a valid property of the API class.

### getSupportedProperties()
Return array of properties supported by this scanner.

### registerBluetoothStatus()
If you are using an RS507 barcode scanner you can register to receive connected or disconnected events through this method.

### setDefault()
This method allows you to set the attributes of the default object instance by passing in an object of the same class.

### setProperties()
This method will set the values of a list of properties for the API class. The propertyName must be a valid property for the class and must also not be read only.

### setProperty()
This method will set the value of a property for the API class. The propertyName must be a valid property for the class and must also not be read only.

### start()
Performs a soft trigger start, initiating a scan without pressing the hardware trigger. If the scan does not result in a decode it is necessary to perform a soft stop before another soft start.

### stop()
Performs a soft trigger stop.

### take()
Enable the scanner and start capturing the barcode automatically. On Motorola Solutions' devices the amount of time to scan the barcode is defined by the scanTimeout property. On iPhone and Android if a barcode is found, the user can confirm barcode recognition, or continue to try to recognize the barcode. When the user confirms or cancels, the callback is called. Once the callback has been called the barcode hardware is disabled.This method will work only on scanners which support soft scan.

### take_barcode()
deprecated old method for taking barcode.