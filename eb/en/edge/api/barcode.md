#Barcode


## Overview
The Barcode Module provides access to control the functionality of the device's scanner. Because RhoMobile Suite is designed to run on both Consumer devices and Motorola Solutions' enterprise devices support for the Barcode API will vary for each method and properties depending on which platform you are running on. Please note that a lot these APIs are optimized for the extended functionality that Motorola Solutions devices provide. Check the platform indicators in each property or method section. In general if you are developing for a consumer device the number of symbologies available to you will be limited to just the most common ones, eg EAN13, UPCA etc and your scanning will be via the device camera. If your application is running on Motorola Solutions' hardware you will have much finer control over a more fully featured Scanner, often with a choice of scanner hardware on the device. In general if you wish to capture a single barcode in a 'one shot' use case, eg your App just wants to capture a single barcode to be submitted to a price comparison website then use Barcode.take(callback); if your application is expecting a number of barcodes to be received, common in enterprise scenarios for example a user in a warehouse then use Barcode.enable(callback). The Barcode API will not run on non-Motorola Windows Mobile / CE devices.Only the foreground application is given access to the scanning hardware, when an application is sent to the background its state will be saved and it will automatically relinquish control of the scanner. When brought back to the foreground, an application previously using the barcode API will have its previous configuration reapplied automatically.In VC70 scanner will work only if connected in SSI Mode.
## Enabling the API
In order to use this API you must TBD INSERT Eb specific instructions here

        


##Methods



### barcode_recognize(<span class="text-info">STRING</span> imageFilePath)
<p>Recognizes a barcode on an image. Returns a string with recognized code, or empty string if the barcode is not recognized.</p>


####Parameters
<ul><li>imageFilePath : <span class='text-info'>STRING</span><p>
<p>Path to the image that contains the barcode to be recognized.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING : 
<p>String with recognized code, or empty string if the barcode is not recognized.</p>


####Platforms

* Android

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.barcode_recognize(<span class="text-info">STRING</span> imageFilePath)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.barcode_recognize(<span class="text-info">STRING</span> imageFilePath)</code> 


### commandRemoteScanner(<span class="text-info">STRING</span> command)
<p>Instruct the connected RS507 scanner to perform some action.</p>


####Parameters
<ul><li>command : <span class='text-info'>STRING</span><p>
<p>The action the RS507 scanner should perform, can be &lsquo;Disconnect&rsquo; which disconnects the bluetooth RS507; &lsquo;unpair&rsquo; which unpairs the RS507 from the device for association with another device; &lsquo;StartPaging&rsquo; or &lsquo;StopPaging&rsquo; which will cause the RS507 scanner to start or stop emitting a beep, to allow it to be located.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.commandRemoteScanner(<span class="text-info">STRING</span> command)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.commandRemoteScanner(<span class="text-info">STRING</span> command)</code> 


### disable()
<p>Disables the barcode scanner. This reverts the scanner to its default state and flushes any current decoder settings.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.disable()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.disable()</code> 


### enable(<span class="text-info">HASH</span> propertyMap)
<p>Enabling the scanner puts it in a state where it will respond to the trigger (on devices with a hardware trigger) or will accept a command to initiate a soft scan (start method). Scanned barcodes will be available to the application through the callback provided to this method. Only one scanner on the device can be enabled at any one time, to switch between the imager and camera scanners (for example) then first disable the currently enabled scanner. If you do not specify a callback to this method you will received the scanned data as keystrokes. Note that it is necessary to enable the scanner on WM/CE devices prior to being able to retrieve the state of properties.</p>


####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span> <span class='label label-info'>Optional</span><p>
<p>Provide a set of properties to configure the scanner, for example enable specific symbologies or check digits.</p>
 Valid `properties` for this parameter are the properties avaliable to this API module. <a href='#Properties'>Check the property section</a> 
<p>Not providing properties to this function will use the scanner&rsquo;s default properties, or those previously set on the Scanner instance.</p>
</p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>data : <span class='text-info'>STRING</span><p>
<p>The data decoded by the scanner or imaging device.</p>
 </p></li><li>source : <span class='text-info'>STRING</span><p>
<p>The source device and human readable decoder type of the decoded barcode or symbol.</p>
 </p></li><li>type : <span class='text-info'>STRING</span><p>
<p>Hex value representing the decoder type.</p>
 </p></li><li>time : <span class='text-info'>STRING</span><p>
<p>The time at which the decode occurred (hh:mm:ss)</p>
 </p></li><li>length : <span class='text-info'>STRING</span><p>
<p>The length of the decoded barcode or symbol.</p>
 </p></li><li>direction : <span class='text-info'>STRING</span><p>
<p>The direction the barcode was scanned, either forward, reverse or unavailable.</p>
 </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.enable(<span class="text-info">HASH</span> propertyMap)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.enable(<span class="text-info">HASH</span> propertyMap)</code> 


### enumerate()
<p>Used to gain access to all scanner objects present on the device. For consumer devices you will most likely only have a single scanner, your device&rsquo;s camera but Enterprise grade hardware may have two or more scanners attached.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul><ul><li><i>Object</i> : <span class='text-info'>SELF_INSTANCE: EB.Barcode</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Barcode.enumerate()</code> 


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
	* <code>EB.Barcode.getAllProperties()</code> 


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
	* <code>EB.Barcode.getDefault()</code> 


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
	* <code>EB.Barcode.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code> 


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
	* <code>EB.Barcode.getProperty(<span class="text-info">STRING</span> propertyName)</code> 


### getSupportedProperties()
<p>Return array of properties supported by this scanner.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:

* ARRAY : 
<p>Array of property names supported by this scanner.</p>
<ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getSupportedProperties()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.getSupportedProperties()</code> 


### registerBluetoothStatus()
<p>If you are using an RS507 barcode scanner you can register to receive connected or disconnected events through this method.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>
<p>The message describing the bluetooth connection: BluetoothConnected, BluetoothDisconnected or BTScanAssociationBarcode. See below for further descriptions.</p>
 </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.registerBluetoothStatus()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.registerBluetoothStatus()</code> 


### setDefault(<span class="text-info">SELF_INSTANCE: EB.Barcode</span> defaultInstance)
<p>This method allows you to set the attributes of the default object instance by passing in an object of the same class.</p>


####Parameters
<ul><li>defaultInstance : <span class='text-info'>SELF_INSTANCE: EB.Barcode</span><p>
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
	* <code>EB.Barcode.setDefault(<span class="text-info">SELF_INSTANCE: EB.Barcode</span> defaultInstance)</code> 


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
	* <code>EB.Barcode.setProperties(<span class="text-info">HASH</span> propertyMap)</code> 


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
	* <code>EB.Barcode.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code> 


### start()
<p>Performs a soft trigger start, initiating a scan without pressing the hardware trigger. If the scan does not result in a decode it is necessary to perform a soft stop before another soft start.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.start()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.start()</code> 


### stop()
<p>Performs a soft trigger stop.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.stop()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.stop()</code> 


### take(<span class="text-info">HASH</span> propertyMap)
<p>Enable the scanner and start capturing the barcode automatically. On Motorola Solutions' devices the amount of time to scan the barcode is defined by the scanTimeout property. On iPhone and Android if a barcode is found, the user can confirm barcode recognition, or continue to try to recognize the barcode. When the user confirms or cancels, the callback is called. Once the callback has been called the barcode hardware is disabled.This method will work only on scanners which support soft scan.</p>


####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span> <span class='label label-info'>Optional</span><p>
<p>Provide a set of properties to configure the scanner, for example enable specific symbologies or check digits.</p>
 Valid `properties` for this parameter are the properties avaliable to this API module. <a href='#Properties'>Check the property section</a> 
<p>Not providing properties to this function will use the scanner&rsquo;s default properties, or those previously set on the Scanner instance.</p>
</p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>barcode : <span class='text-info'>STRING</span><p>
<p>The data decoded by the scanner or imaging device.</p>
 </p></li><li>status : <span class='text-info'>STRING</span><p>
<p>Whether or not the barcode was successfully scanned, status will be &lsquo;ok&rsquo; or &lsquo;cancel&rsquo;</p>
 </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.take(<span class="text-info">HASH</span> propertyMap)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.take(<span class="text-info">HASH</span> propertyMap)</code> 


### take_barcode(<span class="text-info">STRING</span> rubyCallbackURL, <span class="text-info">HASH</span> propertyMap)
<p>deprecated old method for taking barcode.</p>


####Parameters
<ul><li>rubyCallbackURL : <span class='text-info'>STRING</span><p>
<p>Ruby callback URL.</p>
 </p></li><li>propertyMap : <span class='text-info'>HASH</span> <span class='label label-info'>Optional</span><p>
<p>Provide a set of properties to configure the scanner, for example enable specific symbologies or check digits.</p>
 Valid `properties` for this parameter are the properties avaliable to this API module. <a href='#Properties'>Check the property section</a> 
<p>Not providing properties to this function will use the scanner&rsquo;s default properties, or those previously set on the Scanner instance.</p>
</p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.take_barcode(<span class="text-info">STRING</span> rubyCallbackURL, <span class="text-info">HASH</span> propertyMap)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.take_barcode(<span class="text-info">STRING</span> rubyCallbackURL, <span class="text-info">HASH</span> propertyMap)</code> 


##Properties



###adaptiveScanning

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables adaptive scanning. When set to true, the scan engine will automatically toggle between 2 scan angles, wide and narrow, allowing the scan engine to decode barcodes both in close proximity and far away (~100 inches). Adaptive scanning is only supported in high performance, long working range scan engines such as SE960.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.adaptiveScanning</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.adaptiveScanning</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Laser Scanners on Motorola Solutions' devices)

###aimMode

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Defines the aiming mode to use.</p>

####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.Barcode.AIMMODE_NONE - String: none 
<p>No Aiming (Can be overridden by picklistMode).</p>

* Constant: EB.Barcode.AIMMODE_DOT - String: dot 
<p>Laser barcode readers will show a dot for aiming.</p>

* Constant: EB.Barcode.AIMMODE_SLAB - String: slab 
<p>Laser barcode readers will show a slab for aiming.</p>

* Constant: EB.Barcode.AIMMODE_RETICLE - String: reticle 
<p>Imager barcode readers will show a reticle for aiming.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.aimMode</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.aimMode</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Scanners on Motorola Solutions' devices)

###aimType

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Describes the type of aiming to use.</p>

####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.Barcode.AIMTYPE_TRIGGER - String: trigger 
<p>Standard trigger mode. Holding the trigger will start a decoding session.</p>

* Constant: EB.Barcode.AIMTYPE_TIMED_HOLD - String: timedHold 
<p>Aiming lasts for the time specified by &lsquo;timedAimDuration&rsquo; before decoding. The opportunity to scan will last until the barcode is decoded or scanTimeout occurs.</p>

* Constant: EB.Barcode.AIMTYPE_TIMED_RELEASE - String: timedRelease 
<p>Aiming lasts until trigger is released. If the timedAimDuration has expired when the trigger is released then a decode session is started until a barcode is decoded or for the remaining time equal to the scanTimeout value.</p>

* Constant: EB.Barcode.AIMTYPE_PRESENTATION - String: presentation 
<p>Provided to support Kiosk devices. The scanner illuminates when movement is detected in the range of the scanner window. In order to use this mode the scanner must be initiated with a softscan using the Rho.Barcode.start() method and again after each decode. The device must be equipped with a sensor to detect movement to use presentation mode. MK31XX devices come with presentation modes preenabled in scanner driver. Aimtype should not be set to presentation for MK31xx devices as it may produce undesirable results.</p>

* Constant: EB.Barcode.AIMTYPE_PRESS_AND_RELEASE - String: pressAndRelease 
<p>Scan will continue after the trigger is released until scanTimeout occurs.</p>

* Constant: EB.Barcode.AIMTYPE_CONTINUOUS_READ - String: continuousRead 
<p>Once the trigger is pulled barcodes will continue to be scanned as long as the trigger is held, enabling rapid scanning, to be used in conjunction with sameSymbolTimeout and differentSymbolTimeout. This value is ignored if viewfinderMode is set to &lsquo;dynamicReticle&rsquo;</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.aimType</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.aimType</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Scanners on Motorola Solutions' devices)

###allDecoders

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>When set to true, the barcode scanner will read all barcode types that the scanner is capable of reading. When set to false, the barcode scanner will not be able to decode any symbologies, this is most useful if you want to set the scanner to a default state before only enabling your required symbologies. The fewer symbologies that are enabled the faster the decoding performance of the scanning engine will be. This property will return true only if all supported symbologies by the scanner are enabled, if only a subset of supported symbologies are enabled then false will be returned. Note that some decoders will not be enabled as some symbologies use the same systems to encode data, making it impossible to differentiate between them. For example: &ldquo;canpostal&rdquo; and &ldquo;auspostal&rdquo; both use a 4-state system, so devices will only enable either &ldquo;canpostal&rdquo; OR &ldquo;auspostal&rdquo; when &ldquo;alldecoders&rdquo; is enabled. Note that other symbologies also share the 4-state system.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.allDecoders</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.allDecoders</code> 



####Platforms

* Android
* Windows Mobile/CE(Scanners on Motorola Solutions' devices)

###ausPostal

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for Australian Postal barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.ausPostal</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.ausPostal</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###autoEnter

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>When true, automatically appends the character code for &lsquo;enter&rsquo; to the end of any barcodes scanned. This is useful if you want to submit forms following a scan without further interaction. This property will only take effect if you have not specified a callback to the enable method. AutoEnter and AutoTab are mutually exclusive properties.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.autoEnter</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.autoEnter</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Scanners on Motorola Solutions' devices)

###autoTab

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>When true, automatically appends the tab character to the end of any barcodes scanned. This is useful if you are populating a form and want to jump to the next field in the form without further interaction. This property will only take effect if you have not specified a callback to the enable method. AutoTab and AutoEnter are mutually exclusive properties.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.autoTab</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.autoTab</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Scanners on Motorola Solutions' devices)

###aztec

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for Aztec barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.aztec</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.aztec</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###barcodeDataFormat

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Specifies the format in which the barcode data is returned, binary data is returned in Data URI format with the appropriate mime type. This parameter is designed to be used primarily with image based symbologies (eg. Signature). Binary data will not be output as keystrokes, you must set a decode callback in order to receive scanned data.</p>

####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.Barcode.FORMAT_BINARY - String: binary 
<p>Scanned data will be returned in Data URI format.</p>

* Constant: EB.Barcode.FORMAT_TEXT - String: text 
<p>Scanned data will be returned in Text format.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.barcodeDataFormat</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.barcodeDataFormat</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Camera / Imager Scanners on Motorola Solutions' devices)

###beamWidth

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Specifies the width of the laser beam. All devices will support normal beam widths but other widths may not be supported on your device.</p>

####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.Barcode.BEAM_NORMAL - String: normal 
<p>Laser beam width is normal.</p>

* Constant: EB.Barcode.BEAM_WIDE - String: wide 
<p>Laser beam width is wide.</p>

* Constant: EB.Barcode.BEAM_NARROW - String: narrow 
<p>Laser beam width is narrow.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.beamWidth</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.beamWidth</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Laser Scanners on Motorola Solutions' devices)

###bidirectionalRedundancy

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables bidirectional redundancy.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.bidirectionalRedundancy</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.bidirectionalRedundancy</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Laser Scanners on Motorola Solutions' devices)

###canPostal

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for Canadian Postal barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.canPostal</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.canPostal</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###chinese2of5

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for Chinese 2of5 barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.chinese2of5</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.chinese2of5</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###codabar

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for Codabar barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.codabar</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.codabar</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###codabarClsiEditing

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables Codabar CLSi formatting when set to true.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.codabarClsiEditing</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.codabarClsiEditing</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###codabarMaxLength

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Specifies the maximum number of allowable characters in a Codabar barcode. If your application only expects barcode lengths in a certain range, reducing the allowed range can improve scanning performance. Allowed values are 0 to 55.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.codabarMaxLength</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.codabarMaxLength</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###codabarMinLength

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Specifies the minimum number of allowable characters in a Codabar barcode. If your application only expects barcode lengths in a certain range, reducing the allowed range can improve scanning performance. Allowed values are 0 to 55.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.codabarMinLength</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.codabarMinLength</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###codabarNotisEditing

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables Codabar NotisEditing formatting when set to true.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.codabarNotisEditing</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.codabarNotisEditing</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###codabarRedundancy

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Sets the Codabar Redundancy property, if set the barcode must be decoded twice before being accepted. This will slow scanning but improve reliability.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.codabarRedundancy</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.codabarRedundancy</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###code11

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for Code11 barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.code11</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.code11</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###code11checkDigitCount

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Specifies whether to verify 0, 1 or 2 check digits.</p>

####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.Barcode.CODE11_CHECKDIGIT_NONE - String: none 
<p>Scanning engine will verify no Code 11 check digits.</p>

* Constant: EB.Barcode.CODE11_CHECKDIGIT_ONE - String: one 
<p>Scanning engine will verify one Code 11 check digit.</p>

* Constant: EB.Barcode.CODE11_CHECKDIGIT_TWO - String: two 
<p>Scanning engine will verify two Code 11 check digits.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.code11checkDigitCount</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.code11checkDigitCount</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###code11maxLength

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Specifies the maximum number of allowable characters in a Code 11 barcode. If your application only expects barcode lengths in a certain range, reducing the allowed range can improve scanning performance. Allowed values are 0 to 55.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.code11maxLength</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.code11maxLength</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###code11minLength

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Specifies the minimum number of allowable characters in a Code 11 barcode. If your application only expects barcode lengths in a certain range, reducing the allowed range can improve scanning performance. Allowed values are 0 to 55.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.code11minLength</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.code11minLength</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###code11redundancy

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Sets the Code 11 Redundancy property, if set the barcode must be decoded twice before being accepted. This will slow scanning but improve reliability.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.code11redundancy</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.code11redundancy</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###code11reportCheckDigit

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>When true, the barcode check digit(s) will be reported for scanned Code 11 barcodes.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.code11reportCheckDigit</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.code11reportCheckDigit</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###code128

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for Code128 barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.code128</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.code128</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###code128checkIsBtTable

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>When true, decodes concatenated Code128 output only if the pair belongs to one of the commonly concatenated pairs as defined by the standard.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.code128checkIsBtTable</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.code128checkIsBtTable</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###code128ean128

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>When true, barcodes with the EAN128 subtype property set will be read.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.code128ean128</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.code128ean128</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###code128isbt128

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>When true, barcodes with the isbt128 subtype property set will be read.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.code128isbt128</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.code128isbt128</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###code128isbt128ConcatMode

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Sets the Code128 ISBT concatenation mode property. This feature allows a pair of barcodes which meet certain criteria defined in the ISBT128 spec to be reported as a single barcode. This parameter describes the different concatenation modes available for ISBT128.</p>

####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.Barcode.CODE128ISBT_NEVER - String: never 
<p>Will ignore the barcode pair and only output decode data for one of the barcodes.</p>

* Constant: EB.Barcode.CODE128ISBT_ALWAYS - String: always 
<p>Will not decode if both barcodes are not present or if one of them can not be decoded.</p>

* Constant: EB.Barcode.CODE128ISBT_AUTO - String: auto 
<p>Auto-Discriminate.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.code128isbt128ConcatMode</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.code128isbt128ConcatMode</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###code128maxLength

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Specifies the maximum number of allowable characters in a Code 128 barcode. If your application only expects barcode lengths in a certain range, reducing the allowed range can improve scanning performance. Allowed values are 0 to 55.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.code128maxLength</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.code128maxLength</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###code128minLength

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Specifies the minimum number of allowable characters in a Code 128 barcode. If your application only expects barcode lengths in a certain range, reducing the allowed range can improve scanning performance. Allowed values are 0 to 55.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.code128minLength</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.code128minLength</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###code128other128

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Sets the other 128 property which enables the non EAN and non ISBT 128 subtype.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.code128other128</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.code128other128</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###code128redundancy

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Sets the Code 128 Redundancy property, if set the barcode must be decoded twice before being accepted. This will slow scanning but improve reliability.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.code128redundancy</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.code128redundancy</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###code128securityLevel

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Sets the Code 128 security level and accepts a value between 0 and 3 inclusive. 0: Allows the scanner to operate in its most aggressive state, while providing sufficient security in decoding most &lsquo;in-spec&rsquo; barcodes. 1: Eliminates most mis-decodes. 2: Select this option if security level 1 fails to eliminate mis-decodes. 3: Select this option if security level 1 and 2 fail to eliminate mis-decodes. Be advised that selecting level 3 is an extreme measure against mis-decoding and will significantly impair the decoding ability of the scanner.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.code128securityLevel</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.code128securityLevel</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###code39

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for Code 39 barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.code39</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.code39</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###code39code32Prefix

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables reporting of the Code32 prefix when a Code39 barcode is converted.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.code39code32Prefix</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.code39code32Prefix</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###code39convertToCode32

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables conversion from Code39 to Code 32 barcodes, when set the decoded barcode is converted to Code 32.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.code39convertToCode32</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.code39convertToCode32</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###code39fullAscii

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables full ASCII conversion of Code 39 barcodes.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.code39fullAscii</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.code39fullAscii</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###code39maxLength

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Specifies the maximum number of allowable characters in a Code 39 barcode. If your application only expects barcode lengths in a certain range, reducing the allowed range can improve scanning performance. Allowed values are 0 to 55.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.code39maxLength</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.code39maxLength</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###code39minLength

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Specifies the minimum number of allowable characters in a Code 39 barcode. If your application only expects barcode lengths in a certain range, reducing the allowed range can improve scanning performance. Allowed values are 0 to 55.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.code39minLength</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.code39minLength</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###code39redundancy

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Sets the Code 39 Redundancy property, if set the barcode must be decoded twice before being accepted. This will slow scanning but improve reliability.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.code39redundancy</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.code39redundancy</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###code39reportCheckDigit

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables reporting of the Code 39 check digit when a Code 39 barcode is scanned.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.code39reportCheckDigit</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.code39reportCheckDigit</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###code39securityLevel

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Sets the Code 128 security level and accepts a value between 0 and 3 inclusive. 0: This setting allows the scanner to operate in its most aggressive state, while providing sufficient security in decoding most &lsquo;in-spec&rsquo; barcodes. 1: This setting eliminates most mis-decodes. 2: Select this option if security level 1 fails to eliminate mis-decodes. 3: Select this option if security level 1 and 2 fail to eliminate mis-decodes. Be advised that selecting level 3 is an extreme measure against mis-decoding and will significantly impair the decoding ability of the scanner.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.code39securityLevel</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.code39securityLevel</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###code39verifyCheckDigit

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Turns on verification of the Code 39 check digit.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.code39verifyCheckDigit</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.code39verifyCheckDigit</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###code93

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for Code 93 barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.code93</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.code93</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###code93maxLength

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Specifies the maximum number of allowable characters in a Code 93 barcode. If your application only expects barcode lengths in a certain range, reducing the allowed range can improve scanning performance. Allowed values are 0 to 55.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.code93maxLength</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.code93maxLength</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###code93minLength

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Specifies the minimum number of allowable characters in a Code 93 barcode. If your application only expects barcode lengths in a certain range, reducing the allowed range can improve scanning performance. Allowed values are 0 to 55.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.code93minLength</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.code93minLength</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###code93redundancy

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Sets the Code 93 Redundancy property, if set the barcode must be decoded twice before being accepted. This will slow scanning but improve reliability.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.code93redundancy</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.code93redundancy</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###compositeAb

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for Composite AB barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.compositeAb</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.compositeAb</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###compositeAbUccLinkMode

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Describes whether UCC link mode is enabled.</p>

####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.Barcode.UCC_NEVER - String: never 
<p>Link flag is ignored.</p>

* Constant: EB.Barcode.UCC_ALWAYS - String: always 
<p>Composite AB barcodes are always linked.</p>

* Constant: EB.Barcode.UCC_AUTO - String: auto 
<p>Auto-discriminate whether Composite AB barcodes are linked.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.compositeAbUccLinkMode</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.compositeAbUccLinkMode</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###compositeAbUseUpcPreambleCheckDigitRules

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>This setting causes the UPC rules specified in the UPC EAN parameters to be used when reporting composite decode data.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.compositeAbUseUpcPreambleCheckDigitRules</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.compositeAbUseUpcPreambleCheckDigitRules</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###compositeC

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for Composite C barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.compositeC</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.compositeC</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###connectionIdleTimeout

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Specifies the time, in seconds, that an external scanner will be allowed to remain idle before the connection is terminated to conserve power.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.connectionIdleTimeout</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.connectionIdleTimeout</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Bluetooth Scanners on Motorola Solutions' devices)

###d2of5

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for D2of5 barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.d2of5</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.d2of5</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###d2of5maxLength

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Specifies the maximum number of allowable characters in a D2of5 barcode. If your application only expects barcode lengths in a certain range, reducing the allowed range can improve scanning performance. Allowed values are 0 to 55.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.d2of5maxLength</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.d2of5maxLength</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###d2of5minLength

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Specifies the minimum number of allowable characters in a D2of5 barcode. If your application only expects barcode lengths in a certain range, reducing the allowed range can improve scanning performance. Allowed values are 0 to 55.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.d2of5minLength</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.d2of5minLength</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###d2of5redundancy

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Sets the D2of5 Redundancy property, if set the barcode must be decoded twice before being accepted. This will slow scanning but improve reliability.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.d2of5redundancy</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.d2of5redundancy</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###dataBufferSize

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Specifies the number of bytes allocated to receive the scanned barcode. This parameter is designed to be used primarily with image based symbologies and should not be modified unless absolutely necessary (eg. Signature).</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.dataBufferSize</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.dataBufferSize</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Scanners on Motorola Solutions' devices)

###datamatrix

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for Datamatrix barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.datamatrix</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.datamatrix</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###dbpMode

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Describes the type of Digital Bar Pulse (DBP) being produced by the scan engine.</p>

####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.Barcode.DBP_NORMAL - String: normal 
<p>Tells the scan engine to produce normal DBP.</p>

* Constant: EB.Barcode.DBP_COMPOSITE - String: composite 
<p>Tells the scan engine to produce composite DBP, which is 2 different sets of DBP data multiplexed together for better decode performance. In order to enable this mode it must be supported by the scanner.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.dbpMode</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.dbpMode</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Laser Scanners on Motorola Solutions' devices)

###decodeDuration

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>The duration of the device beeper when a barcode is scanned, in milliseconds.</p>

####Params
<p><strong>Default:</strong> 250</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.decodeDuration</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.decodeDuration</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Scanners on Motorola Solutions' devices)

###decodeFrequency

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>The frequency of the device beeper when a barcode is successfully decoded. This should be within the range of the beeper but the API will accept values in the range 0 to 65535.</p>

####Params
<p><strong>Default:</strong> 3000</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.decodeFrequency</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.decodeFrequency</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Scanners on Motorola Solutions' devices)

###decodeSound

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Path to a local wave file to be played when the scanner successfully decodes a barcode. This setting overrides the scanner beeper.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.decodeSound</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.decodeSound</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Scanners on Motorola Solutions' devices)

###decodeVolume

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>The volume of the device beeper when a barcode is scanned. 0 to 5 with 5 being the loudest.  The value of 0 is device dependent, some Windows Mobile / CE devices interpret this as the quietest volume; if you wish to completely disable the beeper on scan please set decodeSound to an empty or invalid sound file.</p>

####Params
<p><strong>Default:</strong> 5</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.decodeVolume</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.decodeVolume</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Scanners on Motorola Solutions' devices)

###differentSymbolTimeout

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>When the aimType:continuousRead property is applied this value defines the interval between which different barcodes can be scanned. The value is specified in milliseconds, use 0 to indicate no interval between successive reads. Use this setting to allow time for the operator to reaim the device between successive scans.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.differentSymbolTimeout</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.differentSymbolTimeout</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Scanners on Motorola Solutions' devices)

###disconnectBtOnDisable

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Forces the scanner to disconnect from the terminal when it is &lsquo;disabled&rsquo;. Since the scanner is disabled when you navigate to a new page, set this value to false if you want to maintain the bluetooth connection to your remote scanner.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.disconnectBtOnDisable</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.disconnectBtOnDisable</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Bluetooth Scanners on Motorola Solutions' devices)

###displayBtAddressBarcodeOnEnable

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>If set to true the bluetooth address will be displayed as a barcode on the screen during the pairing process, initiated by calling &lsquo;enable&rsquo; on a bluetooth scanner. Not all devices support this functionality. Note you must specify this parameter before or within the call to &lsquo;enable&rsquo;.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.displayBtAddressBarcodeOnEnable</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.displayBtAddressBarcodeOnEnable</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Bluetooth Scanners on Motorola Solutions' devices)

###dpmMode

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Allows Direct Part Marking (DPM) barcodes to be read When true, but may adversely affect overall decoding performance. DPM is a way of stamping barcodes directly on physical objects and is only available on DPM terminals.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.dpmMode</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.dpmMode</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Imager / Camera Scanners on Motorola Solutions' devices. The scanning engine must support DPM barcodes.)

###dutchPostal

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for Dutch Postal barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.dutchPostal</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.dutchPostal</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###ean13

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for EAN 13 barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.ean13</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.ean13</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###ean8

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for EAN 8 barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.ean8</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.ean8</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###ean8convertToEan13

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>When true, EAN 8 barcodes will be converted to EAN 13 and EAN 13 parameters used.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.ean8convertToEan13</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.ean8convertToEan13</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###enableTimeout

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Configures the time (in seconds) allowed to pair with the external bluetooth scanner after calling the &lsquo;enable()&rsquo; method. You must specify this parameter before calling &lsquo;enable&rsquo; to change the default.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.enableTimeout</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.enableTimeout</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Bluetooth Scanners on Motorola Solutions' devices)

###focusMode

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Sets the focus mode in use.</p>

####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.Barcode.FOCUS_FIXED - String: fixed 
<p>Use fixed focus.</p>

* Constant: EB.Barcode.FOCUS_AUTO - String: auto 
<p>Use auto focus.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.focusMode</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.focusMode</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Imager / Camera Scanners on Motorola Solutions' devices)

###friendlyName

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>Returns the friendly name associated with the scanner.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.friendlyName</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.friendlyName</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Scanners on Motorola Solutions' devices)

###gs1dataBar

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for GS1 DataBar barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance. This symbology was previously known as rss.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.gs1dataBar</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.gs1dataBar</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###gs1dataBarExpanded

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for GS1 Databar Expanded barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance. This symbology was previously known as rssExp.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.gs1dataBarExpanded</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.gs1dataBarExpanded</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###gs1dataBarLimited

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for GS1 Databar Limited barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance. This symbology was previously known as rssLim.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.gs1dataBarLimited</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.gs1dataBarLimited</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###hapticFeedback

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Controls the haptic feedback on decode. This means that if this is set to true, then the device will vibrate when a decode occurs.</p>

####Params
<p><strong>Default:</strong> true</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.hapticFeedback</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.hapticFeedback</code> 



####Platforms

* Android
* Motorola Solutions Devices Only(Scanners on Motorola Solutions' devices)

###i2of5

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for I2of5 barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.i2of5</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.i2of5</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###i2of5convertToEan13

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>When true, EAN 8 barcodes will be converted to EAN 13 and EAN 13 parameters used.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.i2of5convertToEan13</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.i2of5convertToEan13</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###i2of5maxLength

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Specifies the maximum number of allowable characters in a I2of5 barcode. If your application only expects barcode lengths in a certain range, reducing the allowed range can improve scanning performance. Allowed values are 0 to 55.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.i2of5maxLength</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.i2of5maxLength</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###i2of5minLength

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Specifies the minimum number of allowable characters in a I2of5 barcode. If your application only expects barcode lengths in a certain range, reducing the allowed range can improve scanning performance. Allowed values are 0 to 55.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.i2of5minLength</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.i2of5minLength</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###i2of5redundancy

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Sets the I2of5 Redundancy property, if set the barcode must be decoded twice before being accepted. This will slow scanning but improve reliability.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.i2of5redundancy</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.i2of5redundancy</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###i2of5reportCheckDigit

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>When true, the barcode check digit(s) will be reported for scanned I2of5 barcodes.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.i2of5reportCheckDigit</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.i2of5reportCheckDigit</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###i2of5verifyCheckDigit

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Enables the verification of the I2of5 check digit.</p>

####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.Barcode.I2OF5_VERIFY_NONE - String: none 
<p>Disables verification of the check digit.</p>

* Constant: EB.Barcode.I2OF5_VERIFY_USS - String: uss 
<p>Enables the USS format for the check digit.</p>

* Constant: EB.Barcode.I2OF5_VERIFY_OPCC - String: opcc 
<p>Enables the OPCC format for the check digit.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.i2of5verifyCheckDigit</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.i2of5verifyCheckDigit</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###illuminationMode

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Selects the illumination mode to use.</p>

####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.Barcode.ILLUMINATION_AUTO - String: auto 
<p>Auto-exposure algorithms will decide whether illumination is required or not. Not available on Android.</p>

* Constant: EB.Barcode.ILLUMINATION_ALWAYS_ON - String: alwaysOn 
<p>External illumination is always on.</p>

* Constant: EB.Barcode.ILLUMINATION_ALWAYS_OFF - String: alwaysOff 
<p>External illumination is always off.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.illuminationMode</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.illuminationMode</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Imager / Camera Scanners on Motorola Solutions' devices)

###invalidDecodeFrequency

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>The frequency of the device beeper when a barcode is scanned but not successfully decoded. This should be within the range of the beeper but the API will accept values in the range 0 to 65535.</p>

####Params
<p><strong>Default:</strong> 2500</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.invalidDecodeFrequency</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.invalidDecodeFrequency</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Scanners on Motorola Solutions' devices)

###invalidDecodeSound

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Path to a local wave file to be played when a barcode is scanned but not successfully decoded. This setting overrides the scanner beeper.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.invalidDecodeSound</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.invalidDecodeSound</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Scanners on Motorola Solutions' devices)

###inverse1dMode

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Allows the user to select inverse 1D barcodes for decoding.</p>

####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.Barcode.INVERSE_ENABLED - String: enabled 
<p>Inverse 1D symbology decoding is enabled.</p>

* Constant: EB.Barcode.INVERSE_DISABLED - String: disabled 
<p>Inverse 1D symbology decoding is disabled.</p>

* Constant: EB.Barcode.INVERSE_AUTO - String: auto 
<p>Allows decoding of both positive and inverse 1D symbologies.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.inverse1dMode</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.inverse1dMode</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Scanners on Motorola Solutions' devices. The scanning engine must support inverse barcodes)

###japPostal

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for Japanese Postal barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.japPostal</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.japPostal</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###klasseEins

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the Klasse Eins laser on time function.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.klasseEins</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.klasseEins</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Laser Scanners on Motorola Solutions' devices)

###korean3of5

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for Korean 3of5 barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.korean3of5</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.korean3of5</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###korean3of5maxLength

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Specifies the maximum number of allowable characters in a Korean 3of5 barcode. If your application only expects barcode lengths in a certain range, reducing the allowed range can improve scanning performance. Allowed values are 0 to 55.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.korean3of5maxLength</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.korean3of5maxLength</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###korean3of5minLength

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Specifies the minimum number of allowable characters in a Korean 3of5 barcode. If your application only expects barcode lengths in a certain range, reducing the allowed range can improve scanning performance. Allowed values are 0 to 55.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.korean3of5minLength</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.korean3of5minLength</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###korean3of5redundancy

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Sets Korean 3of5 Redundancy property, if set the barcode must be decoded twice before being accepted. This will slow scanning but improve reliability.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.korean3of5redundancy</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.korean3of5redundancy</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###lcdMode

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Controls whether LCD Mode is enabled on the scanner. LCD Mode makes it easier to scan barcodes off of LCD screens (like mobile device screens)</p>

####Params
<p><strong>Default:</strong> false</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.lcdMode</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.lcdMode</code> 



####Platforms

* Android
* Motorola Solutions Devices Only(Scanners on Motorola Solutions' devices)

###linearSecurityLevel

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Describes the linear security level used during decoding. This determines the number of times a barcode must be read before it is decoded. If the successive reads of the barcode do not match, it will not be decoded.</p>

####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.Barcode.REDUNDANCY_AND_LENGTH - String: redundancyAndLength 
<p>Double redundancy based on redundancy flags and code length. Only applicable to laser scanners, not BlockBuster imager scanners.</p>

* Constant: EB.Barcode.SHORT_OR_CODABAR - String: shortOrCodabar 
<p>Double redundancy if short barcode or Codabar.</p>

* Constant: EB.Barcode.LONG_AND_SHORT - String: longAndShort 
<p>Double redundancy for long barcodes, triple for short barcodes.</p>

* Constant: EB.Barcode.ALL_TWICE - String: allTwice 
<p>Double redundancy for all barcodes.</p>

* Constant: EB.Barcode.ALL_THRICE - String: allThrice 
<p>Triple redundancy for all barcodes.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.linearSecurityLevel</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.linearSecurityLevel</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Scanners on Motorola Solutions' devices)

###lowBatteryScan

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Set to false to disable scanning when the battery is low/critical or set to true to enable it.</p>

####Params
<p><strong>Default:</strong> false</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.lowBatteryScan</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.lowBatteryScan</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Scanners on Motorola Solutions' devices)

###macroMicroPdf

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for MacroMicroPDF barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.macroMicroPdf</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.macroMicroPdf</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###macroMicroPdfBufferLabels

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>If true, the scanner driver will return the barcode data only after the complete macroMicroPdf sequence has been read. If false, the scanner driver will return each barcode in the macroMicroPdf sequence as it is read.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.macroMicroPdfBufferLabels</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.macroMicroPdfBufferLabels</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###macroMicroPdfConvertToMicroPdf

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>If true, MacroMicroPDF barcodes will be converted to MicroPDF codes.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.macroMicroPdfConvertToMicroPdf</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.macroMicroPdfConvertToMicroPdf</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###macroMicroPdfExclusive

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>If true, the scanner driver will not complete read requests while in the middle of a macroMicroPdf sequence. Once a macroMicroPdf sequence has been started it must be completed or canceled before the scan driver will complete other read requests.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.macroMicroPdfExclusive</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.macroMicroPdfExclusive</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###macroMicroPdfReportAppendInfo

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>If true, the appended info is concatenated to the decoded data before being returned.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.macroMicroPdfReportAppendInfo</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.macroMicroPdfReportAppendInfo</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###macroPdf

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for Macro PDF barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.macroPdf</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.macroPdf</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###macroPdfBufferLabels

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>When true, the scanner driver will return  he barcode data only after the complete macroPdf sequence has been read. If false, the scan driver will return each barcode in the macroPdf sequence as it is read.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.macroPdfBufferLabels</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.macroPdfBufferLabels</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###macroPdfConvertToPdf417

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>If true, MacroPDF barcodes will be converted to PDF417 codes.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.macroPdfConvertToPdf417</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.macroPdfConvertToPdf417</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###macroPdfExclusive

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>If true, the scanner driver will not complete read requests while in the middle of a macroPdf sequence. Once a macroPdf sequence has been started it must be completed or canceled before the scan driver will complete other read requests.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.macroPdfExclusive</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.macroPdfExclusive</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###matrix2of5

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for Matrix 2of5 barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.matrix2of5</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.matrix2of5</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###matrix2of5maxLength

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Specifies the maximum number of allowable characters in a Matrix 2of5 barcode. If your application only expects barcode lengths in a certain range, reducing the allowed range can improve scanning performance. Allowed values are 0 to 55.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.matrix2of5maxLength</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.matrix2of5maxLength</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###matrix2of5minLength

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Specifies the minimum number of allowable characters in a Matrix 2of5 barcode. If your application only expects barcode lengths in a certain range, reducing the allowed range can improve scanning performance. Allowed values are 0 to 55.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.matrix2of5minLength</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.matrix2of5minLength</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###matrix2of5reportCheckDigit

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>When true, the barcode check digit(s) will be reported for scanned Matrix 2of5 barcodes.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.matrix2of5reportCheckDigit</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.matrix2of5reportCheckDigit</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###matrix2of5verifyCheckDigit

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables verification of the Matrix 2of5 symbology check digit.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.matrix2of5verifyCheckDigit</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.matrix2of5verifyCheckDigit</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###maxiCode

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for Maxicode barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.maxiCode</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.maxiCode</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###microPdf

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for Micro PDF barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.microPdf</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.microPdf</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###microQr

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for Micro QR barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.microQr</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.microQr</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###msi

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for MSI barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.msi</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.msi</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###msiCheckDigitScheme

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Specifies the check digit scheme used to verify MSI barcodes.</p>

####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.Barcode.MSI_CHECKDIGITS_MOD11 - String: mod11 
<p>The first check digit is MOD 11, the second is MOD 10.</p>

* Constant: EB.Barcode.MSI_CHECKDIGITS_MOD10 - String: mod10 
<p>Both check digits are MOD 10.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.msiCheckDigitScheme</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.msiCheckDigitScheme</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###msiCheckDigits

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Sets the number of MSI check digits to use.</p>

####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.Barcode.MSI_CHECKDIGITS_ONE - String: one 
<p>Use one check digit for MSI barcodes.</p>

* Constant: EB.Barcode.MSI_CHECKDIGITS_TWO - String: two 
<p>Use two check digits for MSI barcodes.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.msiCheckDigits</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.msiCheckDigits</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###msiMaxLength

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Specifies the maximum number of allowable characters in a MSI barcode. If your application only expects barcode lengths in a certain range, reducing the allowed range can improve scanning performance. Allowed values are 0 to 55.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.msiMaxLength</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.msiMaxLength</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###msiMinLength

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Specifies the minimum number of allowable characters in a MSI barcode. If your application only expects barcode lengths in a certain range, reducing the allowed range can improve scanning performance. Allowed values are 0 to 55.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.msiMinLength</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.msiMinLength</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###msiRedundancy

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Sets the MSI Redundancy property, if set the barcode must be decoded twice before being accepted. This will slow scanning but improve reliability.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.msiRedundancy</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.msiRedundancy</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###msiReportCheckDigit

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>When true, the barcode check digit(s) will be reported for scanned MSI barcodes.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.msiReportCheckDigit</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.msiReportCheckDigit</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###pdf417

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for PDF 417 barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.pdf417</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.pdf417</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###picklistMode

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Allows the imager to decode only the barcode that is directly under the cross-hair / center of the reticle. This feature is most useful in applications where multiple barcodes may appear in the field of view during a decode session and only one of them is targeted for decode. When enabled picklistMode will override aimMode or, if no aiming is chosen, and use aimMode:reticle. This mode will also interact with viewfinderMode, see the EMDK for C help file for more information. Enabling picklist mode may adversely affect overall decoding performance.</p>

####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.Barcode.PICKLIST_DISABLED - String: disabled 
<p>Disables picklist mode so any barcode within the field of view can be decoded.</p>

* Constant: EB.Barcode.PICKLIST_HARDWARE_RETICLE - String: hardwareReticle 
<p>Enables picklist mode so that only the barcode under the projected reticle can be decoded. On Windows, if the imager does not support a projected reticle then the behavior is the same as softwareReticle. On Android, this is only supported for Imager (non-viewfinder) based scanners.</p>

* Constant: EB.Barcode.PICKLIST_SOFTWARE_RETICLE - String: softwareReticle 
<p>Enables picklist mode so that only the barcode in the center of the image is decoded. This is most useful when used in conjunction with static and dynamic reticle viewfinder modes. On Android, this is only supported for Camera (viewfinder) based scanners.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.picklistMode</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.picklistMode</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Imager / Camera Scanners on Motorola Solutions' devices)

###poorQuality1dMode

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Allows poor quality 1D barcodes to be read When true, but this will adversely affect the overall decoding performance.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.poorQuality1dMode</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.poorQuality1dMode</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Imager / Camera Scanners on Motorola Solutions' devices)

###qrCode

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for QR Code barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.qrCode</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.qrCode</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###rasterHeight

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Vertical rastering height to use, as a percentage, when rasterMode:openAlways is applied. This value must be between 0 and 100.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.rasterHeight</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.rasterHeight</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Laser Scanners on Motorola Solutions' devices)

###rasterMode

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Describes the type of vertical rastering to use.</p>

####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.Barcode.RASTER_NONE - String: none 
<p>No vertical rastering.</p>

* Constant: EB.Barcode.RASTER_OPEN_ALWAYS - String: openAlways 
<p>Vertical rastering is always full open. To adjust the rastering height use the rasterHeight property.</p>

* Constant: EB.Barcode.RASTER_SMART - String: smart 
<p>Vertical rastering mode is &lsquo;Smart&rsquo;.</p>

* Constant: EB.Barcode.RASTER_CYCLONE - String: cyclone 
<p>Vertical rastering mode is &lsquo;Cyclone&rsquo;.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.rasterMode</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.rasterMode</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Scanners on Motorola Solutions' devices)

###rsmBatteryCapacity

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>The remaining capacity of the battery, in the range 0 to 100. &lsquo;unknown&rsquo; will be returned if the capacity could not be determined, for example if the scanner had no battery.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.rsmBatteryCapacity</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.rsmBatteryCapacity</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Motorola Solutions' Bluetooth barcode scanners, model RS507)

###rsmBatteryId

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>One of &lsquo;simple&rsquo;, &lsquo;double&rsquo;, &lsquo;disabled&rsquo; or &lsquo;unknown&rsquo;</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.rsmBatteryId</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.rsmBatteryId</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Motorola Solutions' Bluetooth barcode scanners, model RS507)

###rsmBatteryStatus

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>Indicates the status of the remote scanner&rsquo;s battery, will be one of &lsquo;unknown&rsquo;, &lsquo;full&rsquo;, &lsquo;medium&rsquo;, &lsquo;empty&rsquo;, &lsquo;chargingFullRate&rsquo;, &lsquo;chargingHalfRate&rsquo;, &lsquo;chargingTrickle&rsquo; or &lsquo;discharging&rsquo;</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.rsmBatteryStatus</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.rsmBatteryStatus</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Motorola Solutions' Bluetooth barcode scanners, model RS507)

###rsmBluetoothAddress

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>Bluetooth address as FF:FF:FF:FF:FF:FF where FF is a hex number.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.rsmBluetoothAddress</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.rsmBluetoothAddress</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Motorola Solutions' Bluetooth barcode scanners, model RS507)

###rsmBluetoothAuthentication

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>True if authentication is required.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.rsmBluetoothAuthentication</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.rsmBluetoothAuthentication</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Motorola Solutions' Bluetooth barcode scanners, model RS507)

###rsmBluetoothAutoReconnect

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Bluetooth reconnection scheme.</p>

####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.Barcode.RSM_AUTORECONNECT_NONE - String: none 
<p>No scheme.</p>

* Constant: EB.Barcode.RSM_AUTORECONNECT_ON_POWER - String: onPower 
<p>When powered on.</p>

* Constant: EB.Barcode.RSM_AUTORECONNECT_ON_OUT_OF_RANGE - String: onOutOfRange 
<p>When device goes out of range.</p>

* Constant: EB.Barcode.RSM_AUTORECONNECT_ON_POWER_OUT_OF_RANGE - String: onPowerOutOfRange 
<p>When powered on or when the device goes out of range.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.rsmBluetoothAutoReconnect</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.rsmBluetoothAutoReconnect</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Motorola Solutions' Bluetooth barcode scanners, model RS507)

###rsmBluetoothBeepOnReconnectAttempt

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>When true, scanner will emit 5 beeps every 5 seconds whilst re-connection in progress.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.rsmBluetoothBeepOnReconnectAttempt</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.rsmBluetoothBeepOnReconnectAttempt</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Motorola Solutions' Bluetooth barcode scanners, model RS507)

###rsmBluetoothEncryption

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>True if encryption is required.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.rsmBluetoothEncryption</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.rsmBluetoothEncryption</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Motorola Solutions' Bluetooth barcode scanners, model RS507)

###rsmBluetoothFriendlyName

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Friendly Bluetooth name, e.g. &lsquo;MyBTScanner&rsquo;</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.rsmBluetoothFriendlyName</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.rsmBluetoothFriendlyName</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Motorola Solutions' Bluetooth barcode scanners, model RS507)

###rsmBluetoothHidAutoReconnect

####Type
<span class='text-info'>STRING</span> 
####Description

<p>&lsquo;neverReconnect&rsquo;, &lsquo;reconnectOnData&rsquo; or &lsquo;reconnectImmediately&rsquo;</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.rsmBluetoothHidAutoReconnect</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.rsmBluetoothHidAutoReconnect</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Motorola Solutions' Bluetooth barcode scanners, model RS507)

###rsmBluetoothInquiryMode

####Type
<span class='text-info'>STRING</span> 
####Description

<p>To use a general inquiry mode, &lsquo;general&rsquo; else, &lsquo;limited&rsquo;</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.rsmBluetoothInquiryMode</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.rsmBluetoothInquiryMode</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Motorola Solutions' Bluetooth barcode scanners, model RS507)

###rsmBluetoothPinCode

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Up to 5 character PIN code used for Bluetooth authentication.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.rsmBluetoothPinCode</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.rsmBluetoothPinCode</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Motorola Solutions' Bluetooth barcode scanners, model RS507)

###rsmBluetoothPinCodeType

####Type
<span class='text-info'>STRING</span> 
####Description

<p>&lsquo;UseStored&rsquo; will use the PIN code stored in the memory of the ring scanner, by default &lsquo;12345&rsquo;. &lsquo;PromptUser&rsquo; indicates that the ring scanner should be used to scan 5 alpha numeric barcodes to define the PIN, eg. &ldquo;1&rdquo;, &ldquo;2&rdquo;, &ldquo;3&rdquo;, &ldquo;4&rdquo;, &ldquo;5&rdquo; (for PIN 12345). This parameter is not saved permanently on the ring scanner.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.rsmBluetoothPinCodeType</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.rsmBluetoothPinCodeType</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Motorola Solutions' Bluetooth barcode scanners, model RS507)

###rsmBluetoothReconnectionAttempts

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>How long the scanner tries to re-establish connection if it goes out of range, in seconds. This value must be a multiple of 5 and in the range 30 to 60 seconds.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.rsmBluetoothReconnectionAttempts</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.rsmBluetoothReconnectionAttempts</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Motorola Solutions' Bluetooth barcode scanners, model RS507)

###rsmDateOfManufacture

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>Ring scanner date of manufacture as DDMMYY.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.rsmDateOfManufacture</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.rsmDateOfManufacture</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Motorola Solutions' Bluetooth barcode scanners, model RS507)

###rsmDateOfService

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>Ring scanner date of service as DDMMYY.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.rsmDateOfService</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.rsmDateOfService</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Motorola Solutions' Bluetooth barcode scanners, model RS507)

###rsmDecodeFeedback

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>If true, the remote scanner beeps and illuminates its green LED on a successful decode.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.rsmDecodeFeedback</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.rsmDecodeFeedback</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Motorola Solutions' Bluetooth barcode scanners, model RS507)

###rsmDeviceClass

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>The device class of the ring scanner.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.rsmDeviceClass</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.rsmDeviceClass</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Motorola Solutions' Bluetooth barcode scanners, model RS507)

###rsmFirmwareVersion

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>Scanner&rsquo;s operating system version.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.rsmFirmwareVersion</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.rsmFirmwareVersion</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Motorola Solutions' Bluetooth barcode scanners, model RS507)

###rsmForceSavePairingBarcode

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Force saving the barcode assigned to the device to which the scanner has been paired.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.rsmForceSavePairingBarcode</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.rsmForceSavePairingBarcode</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Motorola Solutions' Bluetooth barcode scanners, model RS507)

###rsmGoodScansDelay

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Delay between good scans in proximity continuous mode, measured in milliseconds. Range 0 to 15000. This value must be a multiple of 100.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.rsmGoodScansDelay</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.rsmGoodScansDelay</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Motorola Solutions' Bluetooth barcode scanners, model RS507)

###rsmIgnoreCode128Usps

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Feature for ignoring Code 128 barcodes beginning with 420 and 421.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.rsmIgnoreCode128Usps</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.rsmIgnoreCode128Usps</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Motorola Solutions' Bluetooth barcode scanners, model RS507)

###rsmLowBatteryIndication

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Whether or not the ring scanner should give a low battery indication.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.rsmLowBatteryIndication</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.rsmLowBatteryIndication</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Motorola Solutions' Bluetooth barcode scanners, model RS507)

###rsmLowBatteryIndicationCycle

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Low battery indication cycle time, in seconds. Must be one of 15, 30, 60, 90 or 120.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.rsmLowBatteryIndicationCycle</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.rsmLowBatteryIndicationCycle</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Motorola Solutions' Bluetooth barcode scanners, model RS507)

###rsmMems

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>If you press the trigger on an RSM scanner, proximity enabled will be turned off, even though it still reports its self as being turned on if you query the property. In order to use ProximityEnable you need to also have Mems enabled, this is the motion sensor and if you disable Mems the scanner will not function.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.rsmMems</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.rsmMems</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Motorola Solutions' Bluetooth barcode scanners, model RS507)

###rsmModelNumber

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>Ring scanner model number.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.rsmModelNumber</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.rsmModelNumber</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Motorola Solutions' Bluetooth barcode scanners, model RS507)

###rsmPagingBeepSequence

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Range 0 to 15 to specify the pattern for the paging beep sequence.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.rsmPagingBeepSequence</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.rsmPagingBeepSequence</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Motorola Solutions' Bluetooth barcode scanners, model RS507)

###rsmPagingEnable

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Specify whether paging the device is enabled.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.rsmPagingEnable</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.rsmPagingEnable</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Motorola Solutions' Bluetooth barcode scanners, model RS507)

###rsmProximityContinuous

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Proximity continuous mode.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.rsmProximityContinuous</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.rsmProximityContinuous</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Motorola Solutions' Bluetooth barcode scanners, model RS507)

###rsmProximityDistance

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Specify the distance for the proximity feature as &lsquo;short&rsquo;, &lsquo;medium&rsquo; or &lsquo;long&rsquo;</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.rsmProximityDistance</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.rsmProximityDistance</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Motorola Solutions' Bluetooth barcode scanners, model RS507)

###rsmProximityEnable

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>If you press the trigger on an RSM scanner, proximity enabled will be turned off, even though it still reports its self as being turned on if you query the property. In order to use ProximityEnable you need to also have Mems enabled, this is the motion sensor and if you disable Mems the scanner will not function.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.rsmProximityEnable</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.rsmProximityEnable</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Motorola Solutions' Bluetooth barcode scanners, model RS507)

###rsmScanLineWidth

####Type
<span class='text-info'>STRING</span> 
####Description

<p>The laser scan line width, &lsquo;wide&rsquo; or &lsquo;narrow&rsquo;.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.rsmScanLineWidth</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.rsmScanLineWidth</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Motorola Solutions' Bluetooth barcode scanners, model RS507)

###rsmScanTriggerWakeup

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Scanner trigger will wakeup the device from a low power state.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.rsmScanTriggerWakeup</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.rsmScanTriggerWakeup</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Motorola Solutions' Bluetooth barcode scanners, model RS507)

###rsmSerialNumber

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>Ring scanner serial number.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.rsmSerialNumber</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.rsmSerialNumber</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Motorola Solutions' Bluetooth barcode scanners, model RS507)

###sameSymbolTimeout

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>When the aimType:continuousRead property is applied this value defines the interval between which the same barcode can be decoded twice. The value is specified in milliseconds, use 0 to indicate no interval between successive reads. Use this value to prevent accidental duplicate scans.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.sameSymbolTimeout</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.sameSymbolTimeout</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Scanners on Motorola Solutions' devices)

###scanTimeout

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Maximum time in milliseconds that laser scanners will emit a beam or imager scanners will enable the imager. A value of 0 indicates an infinite timeout. This parameter is compatible with aimType:trigger, aimType:timedHold, aimType:timedRelease and aimType:pressAndRelease. Note that for regulatory reasons scanTimeout is not configurable on all laser/imager scanners.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.scanTimeout</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.scanTimeout</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Scanners on Motorola Solutions' devices)

###scannerType

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>The type of scanner in use, will be one of &lsquo;Camera&rsquo;, &lsquo;Imager&rsquo; or &lsquo;Laser&rsquo;. Camera scanners capture and process an image taken via the devices camera. Imager scanners rely on capturing and processing an image of the barcode via dedicated scanning hardware. Both camera and imager scanners are capable of decoding 1D and 2D barcodes. Laser scanners are only capable of decoding 1D barcodes and rely on a sweeping laser.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.scannerType</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.scannerType</code> 



####Platforms

* Android
* Windows Mobile/CE(All Scanners)

###signature

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for Signature barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance. Signature barcodes return their data in Data URI format, it is recommended you adjust the dataBufferSize and barcodeDataFormat properties when scanning Signature barcodes.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.signature</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.signature</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###signatureImageHeight

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Specifies the output height of the captured signature barcode. Signature barcodes return their data in Data URI format, it is recommended you adjust the dataBufferSize and barcodeDataFormat properties when scanning Signature barcodes. Provide a number greater than or equal to 20.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.signatureImageHeight</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.signatureImageHeight</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###signatureImageQuality

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Specifies the output quality of the captured signature barcode. Signature barcodes return their data in Data URI format, it is recommended you adjust the dataBufferSize and barcodeDataFormat properties when scanning Signature barcodes. Provide a value between 10 and 100 inclusive.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.signatureImageQuality</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.signatureImageQuality</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###signatureImageWidth

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Specifies the output width of the captured signature barcode. Signature barcodes return their data in Data URI format, it is recommended you adjust the dataBufferSize and barcodeDataFormat properties when scanning Signature barcodes. Provide a number greater than or equal to 20.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.signatureImageWidth</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.signatureImageWidth</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###timedAimDuration

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Duration in milliseconds for aimType:timedHold and aimType:timedRelease.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.timedAimDuration</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.timedAimDuration</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Scanners on Motorola Solutions' devices)

###tlc39

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for TLC 39 barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.tlc39</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.tlc39</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###triggerConnected

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Only applies to an enabled laser or imaging scanner. Disconnecting the trigger will prevent the scan beam from being emitted, this can temporarily prevent a user from scanning without having to disable the scanner, which can take longer. By default the trigger will be connected when the scanner is first enabled, you do not have to connect it separately. Please note that disconnecting the trigger will also prevent the start method from emitting a laser. This property will only affect the scanner and will have no effect on the &lsquo;captureTrigger&rsquo; API.</p>

####Params
<p><strong>Default:</strong> true</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.triggerConnected</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.triggerConnected</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Scanners on Motorola Solutions' devices)

###trioptic39

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for Trioptic 39 barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.trioptic39</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.trioptic39</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###trioptic39Redundancy

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Sets the Trioptic 39 Redundancy property, if set the barcode must be decoded twice before being accepted. This will slow scanning but improve reliability.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.trioptic39Redundancy</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.trioptic39Redundancy</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###ukPostal

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for UK Postal barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.ukPostal</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.ukPostal</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###ukPostalReportCheckDigit

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>When true, the barcode check digit(s) will be reported for scanned UK Postal barcodes.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.ukPostalReportCheckDigit</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.ukPostalReportCheckDigit</code> 



####Platforms

* Android
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###upcEanBookland

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables decoding of UPC EAN Bookland barcodes.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.upcEanBookland</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.upcEanBookland</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###upcEanBooklandFormat

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Specifies the bookland format to use when decoding UPC EAN Bookland barcodes.</p>

####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.Barcode.BOOKLAND_ISBN10 - String: isbn10 
<p>Causes 978 bookland barcodes to be reported in 10 digit mode.</p>

* Constant: EB.Barcode.BOOKLAND_ISBN13 - String: isbn13 
<p>Causes 978/979 bookland barcodes to be transmitted as EAN13 as per 2007 ISBN-13 protocol.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.upcEanBooklandFormat</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.upcEanBooklandFormat</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###upcEanConvertGs1dataBarToUpcEan

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>If true, RSS barcodes will be converted to UPC/EAN format. For this setting to work UPC/EAN symbologies must be enabled.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.upcEanConvertGs1dataBarToUpcEan</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.upcEanConvertGs1dataBarToUpcEan</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###upcEanCoupon

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables decoding of UPC EAN Coupon barcodes.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.upcEanCoupon</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.upcEanCoupon</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###upcEanLinearDecode

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Sets the linear decode property.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.upcEanLinearDecode</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.upcEanLinearDecode</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###upcEanRandomWeightCheckDigit

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>When true, enables random weight check digit verification.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.upcEanRandomWeightCheckDigit</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.upcEanRandomWeightCheckDigit</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###upcEanRetryCount

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Sets the retry count for auto-discriminating for supplementals. The value must be between 2 &ndash; 20 inclusive.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.upcEanRetryCount</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.upcEanRetryCount</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###upcEanSecurityLevel

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Sets the Security level for decoding UPC EAN barcodes and accepts a value between 0 and 3 inclusive. 0: This setting allows the scanner to operate in its most aggressive state, while providing sufficient security in decoding most &lsquo;in-spec&rsquo; barcodes. 1: This setting eliminates most mis-decodes. 2: Select this option if security level 1 fails to eliminate mis-decodes. 3: Select this option if security level 1 and 2 fail to eliminate mis-decodes. Be advised that selecting level 3 is an extreme measure against mis-decoding and will significantly impair the decoding ability of the scanner.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.upcEanSecurityLevel</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.upcEanSecurityLevel</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###upcEanSupplemental2

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>When true, enables the supplemental barcode decoding. Note you must have upcEanSupplementalMode:always set for this parameter to take effect.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.upcEanSupplemental2</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.upcEanSupplemental2</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###upcEanSupplemental5

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>When true, enables the supplemental barcode decoding. Note you must have upcEanSupplementalMode:always set for this parameter to take effect.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.upcEanSupplemental5</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.upcEanSupplemental5</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###upcEanSupplementalMode

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Describes the UPC EAN Supplemental mode.</p>

####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.Barcode.UPCEAN_NONE - String: none 
<p>Supplementals are ignored.</p>

* Constant: EB.Barcode.UPCEAN_AUTO - String: auto 
<p>Auto-discriminates supplementals.</p>

* Constant: EB.Barcode.UPCEAN_ALWAYS - String: always 
<p>Will not decode upc/ean without supplementals.</p>

* Constant: EB.Barcode.UPCEAN_SMART - String: smart 
<p>The decoder will return the decoded value of the main block right away if it does not belong to any of the supplemental types. If the barcode starts with one of the prefixes it will search the image more aggressively for a supplemental. The scanner will try to scan the supplemental if it is present but if that fails, the main barcode will be returned.</p>

* Constant: EB.Barcode.UPCEAN_379 - String: 378or379 
<p>Auto-discriminates supplemental for upc/ean codes starting with 378 or 379. Will disable reading of supplementals for any other upc/ean barcodes not starting with these values. The supplemental will be scanned if present but if scanning fails then the main barcode will be returned.</p>

* Constant: EB.Barcode.UPCEAN_979 - String: 978or979 
<p>Auto-discriminates supplemental for upc/ean codes starting with 978 or 979. Will disable reading of supplementals for any other upc/ean barcodes not starting with these values. The supplemental will be scanned if present but if scanning fails then the main barcode will be returned.</p>

* Constant: EB.Barcode.UPCEAN_439 - String: 414or419or434or439 
<p>Auto-discriminates supplemental for upc/ean codes starting with 414 or 419 or 434 or 439. Will disable reading of supplementals for any other upc/ean barcodes not starting with these values. The supplemental will be scanned if present but if scanning fails then the main barcode will be returned.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.upcEanSupplementalMode</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.upcEanSupplementalMode</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###upca

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for UPCA barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.upca</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.upca</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###upcaPreamble

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Controls the preamble applied to the UPCA barcode.</p>

####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.Barcode.UPCA_PREAMBLE_NONE - String: none 
<p>Applies no preamble to the bar code.</p>

* Constant: EB.Barcode.UPCA_PREAMBLE_SYSTEMCHAR - String: systemChar 
<p>Applies system character preamble to the bar code.</p>

* Constant: EB.Barcode.UPCA_PREAMBLE_COUNTRY - String: countryAndSystemChars 
<p>Applies both system and country code preamble to the bar code.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.upcaPreamble</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.upcaPreamble</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###upcaReportCheckDigit

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>When true, the barcode check digit(s) will be reported for scanned UPCA barcodes.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.upcaReportCheckDigit</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.upcaReportCheckDigit</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###upce0

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for UPCE0 barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.upce0</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.upce0</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###upce0convertToUpca

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>When true, scanned UPCE0 barcodes will be converted to UPCA and UPCA parameters used.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.upce0convertToUpca</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.upce0convertToUpca</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###upce0preamble

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Controls the preamble applied to the UPCE0 barcode.</p>

####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.Barcode.UPCE0_PREAMBLE_NONE - String: none 
<p>Applies no preamble to the bar code.</p>

* Constant: EB.Barcode.UPCE0_PREAMBLE_SYSTEMCHAR - String: systemChar 
<p>Applies system character preamble to the bar code.</p>

* Constant: EB.Barcode.UPCE0_PREAMBLE_COUNTRY - String: countryAndSystemChars 
<p>Applies both system and country code preamble to the bar code.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.upce0preamble</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.upce0preamble</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###upce0reportCheckDigit

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>When true, the barcode check digit(s) will be reported for scanned UPCE0 barcodes.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.upce0reportCheckDigit</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.upce0reportCheckDigit</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###upce1

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for UPCE1 barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.upce1</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.upce1</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###upce1convertToUpca

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>When true, scanned UPCE1 barcodes will be converted to UPCA and UPCA parameters used.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.upce1convertToUpca</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.upce1convertToUpca</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###upce1preamble

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Controls the preamble applied to the UPCE1 barcode.</p>

####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.Barcode.UPCE1_PREAMBLE_NONE - String: none 
<p>Applies no preamble to the bar code.</p>

* Constant: EB.Barcode.UPCE1_PREAMBLE_SYSTEMCHAR - String: systemChar 
<p>Applies system character preamble to the bar code.</p>

* Constant: EB.Barcode.UPCE1_PREAMBLE_COUNTRY - String: countryAndSystemChars 
<p>Applies both system and country code preamble to the bar code.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.upce1preamble</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.upce1preamble</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###upce1reportCheckDigit

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>When true, the barcode check digit(s) will be reported for scanned UPCE1 barcodes.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.upce1reportCheckDigit</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.upce1reportCheckDigit</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###us4state

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for US 4-State barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.us4state</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.us4state</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###us4stateFics

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for US 4-State FICS barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.us4stateFics</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.us4stateFics</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###usPlanet

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for US Planet barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.usPlanet</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.usPlanet</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###usPlanetReportCheckDigit

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>When true, the barcode check digit(s) will be reported for scanned US Planet barcodes.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.usPlanetReportCheckDigit</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.usPlanetReportCheckDigit</code> 



####Platforms

* Android
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###usPostNet

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for US Post Net barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.usPostNet</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.usPostNet</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###usPostNetReportCheckDigit

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>When true, the barcode check digit(s) will be reported for scanned US Post Net barcodes.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.usPostNetReportCheckDigit</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.usPostNetReportCheckDigit</code> 



####Platforms

* Android
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###viewfinderFeedback

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Configures the feedback given after a successful scan. This value is ignored if aimType is set to continuousRead and no feedback will be given.</p>

####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.Barcode.VF_FEEDBACK_ENABLED - String: enabled 
<p>The last image that was successfully decoded is displayed. The time for which the image is displayed can be configured by the viewfinderFeedbackTime parameter.</p>

* Constant: EB.Barcode.VF_FEEDBACK_DISABLED - String: disabled 
<p>No feedback is given in the viewfinder after a successful decode.</p>

* Constant: EB.Barcode.VF_FEEDBACK_RETICLE - String: reticle 
<p>The last image that was successfully decoded is displayed along with a red reticle in the center of the image. The time for which the image is displayed can be configured by the viewfinderFeedbackTime parameter.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.viewfinderFeedback</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.viewfinderFeedback</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Camera Scanners on Motorola Solutions' devices)

###viewfinderFeedbackTime

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>If the viewfinderFeedback:enabled or viewfinderFeedback:reticle are applied then the decoded barcode will remain on the screen for this duration. Specified in milliseconds.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.viewfinderFeedbackTime</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.viewfinderFeedbackTime</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Camera Scanners on Motorola Solutions' devices)

###viewfinderHeight

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>When scanning a barcode using a Camera scanner the viewfinder preview window will be this number of pixels in height. The images displayed in the viewfinder will be scaled as appropriate.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.viewfinderHeight</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.viewfinderHeight</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Camera Scanners on Motorola Solutions' devices)

###viewfinderMode

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Configures the mode of the scanner viewfinder window. This attribute is not supported on all Scanners and will interact with the picklistMode parameter, see the EMDK for C help file for more information.</p>

####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.Barcode.VIEWFINDER_ENABLED - String: enabled 
<p>Only the viewfinder is enabled (not the reticle). Displays a viewfinder on the screen showing the image being captured by the camera.</p>

* Constant: EB.Barcode.VIEWFINDER_DISABLED - String: disabled 
<p>The viewfinder will not be displayed during aiming or scanning.</p>

* Constant: EB.Barcode.VIEWFINDER_STATIC_RETICLE - String: staticReticle 
<p>Displays the viewfinder as well as draws a red reticle in the center of the image which helps with tracking the barcode.</p>

* Constant: EB.Barcode.VIEWFINDER_DYNAMIC_RETICLE - String: dynamicReticle 
<p>Displays the viewfinder as well as draws a red reticle in the center of the image. If the barcode in the image is &lsquo;decodable&rsquo; the reticle turns green to indicate this. This mode requires a second trigger press to decode the barcode after the reticle turns green. Not supported on Android.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.viewfinderMode</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.viewfinderMode</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Camera Scanners on Motorola Solutions' devices)

###viewfinderWidth

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>When scanning a barcode using a Camera scanner the viewfinder preview window will be this number of pixels wide. The images displayed in the viewfinder will be scaled as appropriate.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.viewfinderWidth</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.viewfinderWidth</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Camera Scanners on Motorola Solutions' devices)

###viewfinderX

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>When scanning a barcode using a Camera scanner the viewfinder preview window will appear this number of pixels from the left hand side of the screen. The images displayed in the viewfinder will be scaled as appropriate.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.viewfinderX</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.viewfinderX</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Camera Scanners on Motorola Solutions' devices)

###viewfinderY

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>When scanning a barcode using a Camera scanner the viewfinder preview window will appear this number of pixels from the top of the screen. The images displayed in the viewfinder will be scaled as appropriate.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.viewfinderY</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.viewfinderY</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Camera Scanners on Motorola Solutions' devices)

###webcode

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or disables the symbology for Webcode barcodes. If your application does not expect to scan this symbology you should disable it to improve scanning performance. Deprecated in Android 4.1 (Jelly Bean).</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.webcode</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.webcode</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

###webcodeDecodeGtSubtype

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>If true, the GT Webcode subtype will be decoded. Deprecated in Android 4.1 (Jelly Bean).</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.webcodeDecodeGtSubtype</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Barcode.webcodeDecodeGtSubtype</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only(Not all scanning engines support all symbologies or all symbology properties)

##Remarks



###Bluetooth Scanner Overview
<p>Once associated with the Device a Bluetooth Scanner will remain associated even after losing the BT connection. In order to associate a different Bluetooth scanner with the device it is necessary to scan the &lsquo;unpairing&rsquo; barcode and then invoke the &lsquo;disabled&rsquo; method followed by the &lsquo;enabled&rsquo; method, this will allow you to scan the BT association barcode with a different scanner. You can override this default behavior using the disconnectBtOnDisable property.</p>

<p>The following messages will be received from the Bluetooth Scanner in the bluetoothStatus event:</p>

<p><strong>&lsquo;BTScanAssociationBarcode&rsquo;</strong>
Means the device is ready to be associated with a BT scanner. You must scan the
association barcode. It is only necessary to scan the association
barcode when you first associate a scanner with the device, this pairing will be remembered until
you scan the unpairing barcode.</p>

<p><strong> &lsquo;BluetoothConnected&rsquo;</strong>
The remote scanner has successfully connected to the device.</p>

<p><strong> &lsquo;BluetoothDisconnected&rsquo;</strong>
The remote scanner has become disconnected from the device, this may be due to loss of battery, being out
of range or scanning the &lsquo;unpairing&rsquo; barcode. The scanner will attempt to reconnect automatically for
a period of time once it regains power or goes out of range, if it fails to reconnect after the specified
timeout the reconnect button on the device should be pushed. Once the unpairing barcode is scanned
it is necessary to disable the scanner and then re-enable it before another scanner can be associated.</p>


###Viewfinder Position Parameters
<p>On Motorola Solutions' scanners the scanner viewfinder window is not infinitely resizable, when setting ViewFinderX, ViewFinderY, ViewFinderWidth and ViewFinderHeight ensure you do not exceed the size of the screen and it is recommended to use the same aspect ratio as your device. For applications designed to handle screen rotation it is recommended to use a scan window whose longest side will fit within both the screen width and screen height. If your viewfinder position fails to be applied it is recommended you query your log file to see which parameter is causing trouble, or reposition the window away from the edges of the screen.</p>


###Scanning and Camera Interaction
<p>In some device configurations the scanner and camera share the same hardware. Where two modules share the same physical hardware they cannot be enabled simultaneously, in this circumstance once the scanner is enabled it must be disabled before the camera can be used, and vice versa.</p>


###Get Scanner Properties
<p>On WM/CE, it is first necessary to enable the scanner before most of the properties can be retrieved. The case of scanner properties will differ across platforms. In WM/CE, some of the scanner properties are not exposed to set but can be retrieved. In Android, only supported scanner properties can be retrieved in &ldquo;getAllProperties&rdquo; method.</p>


###DataWedge Interaction With Native Apps
<p>In order to use the scanner with RhoElements Native Apps you will need to either disable DataWedge or create a DataWedge profile for your app.</p>

<p><strong>Disabling Datawedge</strong></p>

<ol>
<li>Start the DataWedge app</li>
<li>Click the menu button > &ldquo;Settings&rdquo; and untick &ldquo;DataWedge enabled&rdquo;.</li>
</ol>


<p><strong>RhoElements Datawedge Profile</strong></p>

<ol>
<li>Install your RhoElements native app,</li>
<li>Start the DataWedge app</li>
<li>Click the menu button > &ldquo;New Profile&rdquo; and enter a name,</li>
<li>Click on the link to the new profile in the profile list,</li>
<li>Click on &ldquo;Associated apps&rdquo; in the &ldquo;Applications&rdquo; section,</li>
<li>Click the menu button > &ldquo;New app/activity&rdquo;,</li>
<li>Select the package name for your app,</li>
<li>Select &ldquo;*&rdquo;,</li>
<li>Click the &ldquo;Back&rdquo; capacitive button,</li>
<li>Make sure the &ldquo;Profile enabled&rdquo; checkbox is ticked.</li>
<li>Uncheck all three &ldquo;Enabled&rdquo; checkboxes under the sections of:
&ldquo;Barcode input&rdquo;, &ldquo;Keystroke output&rdquo; and &ldquo;Intent output&rdquo;.</li>
</ol>

