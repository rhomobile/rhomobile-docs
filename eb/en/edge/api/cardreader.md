#CardReader


## Overview
The Card Reader module decodes the card data when read through a card reader attachment. Currently this is available only on Motorola Solutions devices.Only the foreground application is given access to the card reader hardware, when an application is sent to the background its state will be saved and it will automatically relinquish control of the card reader. When brought back to the foreground, an application previously using the card reader will have its previous configuration (eg. pinTimeout) reapplied to the card reader automatically.
## Enabling the API
In order to use this API you must TBD INSERT Eb specific instructions here

        


##Methods



### close()
<p>Closes the card reader.</p>


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
	* <code>myObject.close()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.CardReader.close()</code> 


### enumerate()
<p>Enumerates all the available card readers.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul><ul><li>cardreaderArray : <span class='text-info'>SELF_INSTANCE: EB.CardReader</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:

* ARRAY : 
<p>Array of Card reader objects.</p>
<ul><li>cardreaderArray : <span class='text-info'>SELF_INSTANCE: EB.CardReader</span><p> </p></li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.CardReader.enumerate()</code> 


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
	* <code>EB.CardReader.getAllProperties()</code> 


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
	* <code>EB.CardReader.getDefault()</code> 


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
	* <code>EB.CardReader.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code> 


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
	* <code>EB.CardReader.getProperty(<span class="text-info">STRING</span> propertyName)</code> 


### open()
<p>Opens the card reader.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>data : <span class='text-info'>STRING</span><p>
<p>Data read by the card reader. This may be card data, the PAN data extracted from the card data, encrypted PIN block data, or a message. In case of an ISO/ABA card [eg: a financial card], data is encrypted. For other cards, data is in the clear.</p>
 </p></li><li>mode : <span class='text-info'>STRING</span><p>
<p>Describes the data. This will be either: &lsquo;CR&rsquo;,&lsquo;ENCDATA&rsquo;,&lsquo;PAN&rsquo;, or &lsquo;MESSAGE&rsquo;. This equates to card data, encrypted PIN block data, PAN data, or a message, respectively.</p>
 </p></li><li>encryption : <span class='text-info'>BOOLEAN</span><p>
<p>This provides the information regarding the card reader head configuration. Available only on Android.</p>
 </p></li><li>rawData : <span class='text-info'>STRING</span><p>
<p>This is the raw data read by the card reader from all the tracks. Available only on Android and the value is in HEX format.</p>
 </p></li><li>track1 : <span class='text-info'>STRING</span><p>
<p>The track1 clear/masked data read by the card reader. Available only on Android and the value is in HEX format. This value should be used only when the track1Status value returned is true.</p>
 </p></li><li>track2 : <span class='text-info'>STRING</span><p>
<p>The track2 clear/masked data read by the card reader. Available only on Android and the value is in HEX format. This value should be used only when the track2Status value returned is true.</p>
 </p></li><li>track3 : <span class='text-info'>STRING</span><p>
<p>The track3 clear/masked data read by the card reader. Available only on Android and the value is in HEX format. This value should be used only when the track3Status value returned is true.</p>
 </p></li><li>track1Status : <span class='text-info'>BOOLEAN</span><p>
<p>The status of the track1 clear/masked data read by the card reader. Available only on Android.</p>
 </p></li><li>track2Status : <span class='text-info'>BOOLEAN</span><p>
<p>The status of the track2 clear/masked data read by the card reader. Available only on Android.</p>
 </p></li><li>track3Status : <span class='text-info'>BOOLEAN</span><p>
<p>The status of the track3 clear/masked data read by the card reader. Available only on Android.</p>
 </p></li><li>track1Encrypted : <span class='text-info'>STRING</span><p>
<p>The track1 encrypted data read by the card reader. Available only on Android and the value is in HEX format. This value should be used only when the track1EncryptedStatus value returned is true.</p>
 </p></li><li>track2Encrypted : <span class='text-info'>STRING</span><p>
<p>The track2 encrypted data read by the card reader. Available only on Android and the value is in HEX format. This value should be used only when the track2EncryptedStatus value returned is true.</p>
 </p></li><li>track3Encrypted : <span class='text-info'>STRING</span><p>
<p>The track3 encrypted data read by the card reader. Available only on Android and the value is in HEX format. This value should be used only when the track3EncryptedStatus value returned is true.</p>
 </p></li><li>track1EncryptedStatus : <span class='text-info'>BOOLEAN</span><p>
<p>The status of the track1 encrypted data read by the card reader. Available only on Android.</p>
 </p></li><li>track2EncryptedStatus : <span class='text-info'>BOOLEAN</span><p>
<p>The status of the track2 encrypted data read by the card reader. Available only on Android.</p>
 </p></li><li>track3EncryptedStatus : <span class='text-info'>BOOLEAN</span><p>
<p>The status of the track3 encrypted data read by the card reader. Available only on Android.</p>
 </p></li><li>ksn : <span class='text-info'>STRING</span><p>
<p>The encrypted KSN serial number read by the card reader. Available only on Android. The value is in HEX format.</p>
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
	* <code>myObject.open()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.CardReader.open()</code> 


### setDefault(<span class="text-info">SELF_INSTANCE: EB.CardReader</span> defaultInstance)
<p>This method allows you to set the attributes of the default object instance by passing in an object of the same class.</p>


####Parameters
<ul><li>defaultInstance : <span class='text-info'>SELF_INSTANCE: EB.CardReader</span><p>
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
	* <code>EB.CardReader.setDefault(<span class="text-info">SELF_INSTANCE: EB.CardReader</span> defaultInstance)</code> 


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
	* <code>EB.CardReader.setProperties(<span class="text-info">HASH</span> propertyMap)</code> 


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
	* <code>EB.CardReader.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code> 


##Properties



###autoEnter

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>When enabled, appends a carriage return to any data returned as keystrokes by the cardreader. This is useful for auto submitting returned data without extra interaction necessary.</p>

####Params
<p><strong>Default:</strong> false</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.autoEnter</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.CardReader.autoEnter</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only

###autoTab

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>When enabled, appends a tab to any data returned as keystrokes by the cardreader. This is useful when filling out a form so that you can move to the next field without extra interaction necessary.</p>

####Params
<p><strong>Default:</strong> false</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.autoTab</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.CardReader.autoTab</code> 



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only

###<span class="text-error">moduleName</span>

####Type
<span class='text-info'>STRING</span> 
####Description
<span class='label label-important'>Deprecated</span> 
<p>This method is present to provide backwards compatibility with PocketBrowser code, devices supported by RhoElements will have a single card reader driver installed as part of the platform. If the device has multiple card reader drivers installed this parameter is used to select which driver to use. The drivers present are output in the log file when the card reader is initialized. This parameter is also used to distinguish between an MSR and a DCR, e.g. if you attach a DCR7000 to your device you can specify that only the MSR functionality is used by specifying this parameter as &lsquo;MSR7000&rsquo;.</p>

####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.CardReader.MSR9000 - String: msr9000 
<p>MSR9000 drivers. Return value while getting the property of moduleName will be its associated DLL name i.e. MSR3000.DLL.</p>

* Constant: EB.CardReader.MSR9001 - String: msr9001 
<p>MSR9001 drivers. Return value while getting the property of moduleName will be its associated DLL name i.e. MSR3000.DLL.</p>

* Constant: EB.CardReader.MSR9500 - String: msr9500 
<p>MSR9500 drivers. Return value while getting the property of moduleName will be its associated DLL name i.e. MSRMC50.DLL.</p>

* Constant: EB.CardReader.MSRCAMEO - String: msrcameo 
<p>MSRCAMEO drivers. Return value while getting the property of moduleName will be its associated DLL name i.e. MSRCAMEO.DLL.</p>

* Constant: EB.CardReader.MSR7000 - String: msr7000 
<p>MSR7000 drivers. Return value while getting the property of moduleName will be its associated DLL name i.e. MSRMC50.DLL.</p>

* Constant: EB.CardReader.DCR7000 - String: dcr7000 
<p>DCR7000 drivers. Return value while getting the property of moduleName will be its associated DLL name i.e. MSRMC50.DLL.</p>

* Constant: EB.CardReader.MSR55 - String: msr55 
<p>MSR55 drivers. Return value while getting the property of moduleName will be its associated DLL name i.e. MSRMC55.DLL.</p>

* Constant: EB.CardReader.MSR3000 - String: msr3000 
<p>MSR3000 drivers. Return value while getting the property of moduleName will be its associated DLL name i.e. MSR3000.DLL.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.moduleName</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.CardReader.moduleName</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only

###panData

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Sets the card data without the need of a swipe. This accepts any 16 digit number as the string value. Ensure that pinEntry is true before getting the property of panData.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.panData</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.CardReader.panData</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Only compatible with DCR7000-x00)

###pinEntry

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Turns the PIN entry on or off.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.pinEntry</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.CardReader.pinEntry</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Only compatible with DCR7000-x00)

###pinTimeout

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>PIN entry timeout in milliseconds. A value of 65535 sets the timeout to infinite. Accepts values between 0 and 65535.</p>

####Params
<p><strong>Default:</strong> 30000</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.pinTimeout</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.CardReader.pinTimeout</code> 



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Only compatible with DCR7000-x00)

##Remarks



###General
<p>If the CardReader open method is not specified with a callback, the cardreader data will be returned as keystrokes. If both the autotab and autoenter parameters are set to &ldquo;enabled&rdquo;, autoenter will take precedence. An opened card reader must be closed before the attached card reader device and associated modulename parameter are changed. Any attempt to set a parameter to an invalid value, will result in no effect on the parameter&rsquo;s current value. There should be made a delay around 2 secs or more between API calls which interact with hardware.</p>


###Operational Modes (Backwards compatibility with PocketBrowser)
<p>For the DCR7000 the ModuleName parameter must be set at least once before the readevent parameter is set. If the card reader is an MSR, when a card is swiped it returns the data read from the card. Setting ModuleName to a DCR will cause the card data to be returned followed by the PAN Data before waiting for a PIN to be entered on the keypad. Once entered the PIN will be encrypted and returned by a third ReadEvent. The card must be a validly formatted IATA or ABA card.</p>


###Closing the reader while PIN entry pending
<p>There is no way to abort a pending PIN entry (other than the customer pressing the Cancel button), for security reasons. Therefore if the reader is closed or RhoElements is quit during that time it will become unresponsive until a PIN is entered or the PIN timeout occurs.</p>


###Blank card data
<p>In certain circumstances it is possible that the card reader may return empty card data. The JavaScript event function should be able to handle this correctly.</p>


###Detaching / Reattaching the Card Reader
<p>Applications running in RhoElements should be resilient against the card reader being detached and subsequently reattached. Card data parsing code should be robust against unexpected characters in the first read after reattachment.</p>


###Encrypted Card data
<p>The encrypted data is supported only on the card readers that are configured for encryption. Since the encrypted data might contain unreadable characters sometimes it is recommended to use only JSON object method rather than JavaScript &lsquo;%s&rsquo; notation.</p>
