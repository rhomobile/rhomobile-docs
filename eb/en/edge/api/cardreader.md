#CardReader


## Overview
The Card Reader module decodes the card data when read through a card reader attachment. Currently this is available only on Motorola Solutions devices.Only the foreground RhoElements application is given access to the card reader hardware, when an application is sent to the background its state will be saved and it will automatically relinquish control of the card reader. When brought back to the foreground, an application previously using the card reader will have its previous configuration (eg. pinTimeout) reapplied to the card reader automatically.
## Enabling the API
In order to use this API you must include the following extension in your `build.yml`.
    :::ruby
    extensions: ["cardreader"]

The `cardreader` extension is also included automatically if you specify the following in your `build.yml`.
    :::ruby
    app_type: "rhoelements"

NOTE: If you are building a Windows Mobile or Windows CE app with this API, you must set your app_type as "rhoelements" in your build.yml as shown [here](../guide/build_config#other-build-time-settings).

## JavaScript Usage
Be sure to review the [JavaScript API Usage](/guide/api_js) guide for important information about using this API in JavaScript.

## Ruby Usage
Be sure to review the [Ruby API Usage](/guide/api_ruby) guide for important information about using this API in Ruby.

        


##Methods



### close()
Closes the card reader.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.close()</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>EB.CardReader.close()</code> </li></ul></li></ul>

### enumerate()
Enumerates all the available card readers.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul><ul><li>cardreaderArray : <span class='text-info'>SELF_INSTANCE: EB.CardReader</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>ARRAY : 
Array of Card reader objects.<ul><li>cardreaderArray : <span class='text-info'>SELF_INSTANCE: EB.CardReader</span><p> </p></li></ul></li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.CardReader.enumerate()</code> </li></ul></li></ul>

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

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.getAllProperties()</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>EB.CardReader.getAllProperties()</code> </li></ul></li></ul>

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

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.CardReader.getDefault()</code> </li></ul></li></ul>

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

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>EB.CardReader.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code> </li></ul></li></ul>

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

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.getProperty(<span class="text-info">STRING</span> propertyName)</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>EB.CardReader.getProperty(<span class="text-info">STRING</span> propertyName)</code> </li></ul></li></ul>

### open()
Opens the card reader.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>data : <span class='text-info'>STRING</span><p>
Data read by the card reader. This may be card data, the PAN data extracted from the card data, encrypted PIN block data, or a message. In case of an ISO/ABA card [eg: a financial card], data is encrypted. For other cards, data is in the clear. </p></li><li>mode : <span class='text-info'>STRING</span><p>
Describes the data. This will be either: 'CR','ENCDATA','PAN', or 'MESSAGE'. This equates to card data, encrypted PIN block data, PAN data, or a message, respectively. </p></li><li>encryption : <span class='text-info'>BOOLEAN</span><p>
This provides the information regarding the card reader head configuration. Available only on Android. </p></li><li>rawData : <span class='text-info'>STRING</span><p>
This is the raw data read by the card reader from all the tracks. Available only on Android and the value is in HEX format. </p></li><li>track1 : <span class='text-info'>STRING</span><p>
The track1 clear/masked data read by the card reader. Available only on Android and the value is in HEX format. This value should be used only when the track1Status value returned is true. </p></li><li>track2 : <span class='text-info'>STRING</span><p>
The track2 clear/masked data read by the card reader. Available only on Android and the value is in HEX format. This value should be used only when the track2Status value returned is true. </p></li><li>track3 : <span class='text-info'>STRING</span><p>
The track3 clear/masked data read by the card reader. Available only on Android and the value is in HEX format. This value should be used only when the track3Status value returned is true. </p></li><li>track1Status : <span class='text-info'>BOOLEAN</span><p>
The status of the track1 clear/masked data read by the card reader. Available only on Android. </p></li><li>track2Status : <span class='text-info'>BOOLEAN</span><p>
The status of the track2 clear/masked data read by the card reader. Available only on Android. </p></li><li>track3Status : <span class='text-info'>BOOLEAN</span><p>
The status of the track3 clear/masked data read by the card reader. Available only on Android. </p></li><li>track1Encrypted : <span class='text-info'>STRING</span><p>
The track1 encrypted data read by the card reader. Available only on Android and the value is in HEX format. This value should be used only when the track1EncryptedStatus value returned is true. </p></li><li>track2Encrypted : <span class='text-info'>STRING</span><p>
The track2 encrypted data read by the card reader. Available only on Android and the value is in HEX format. This value should be used only when the track2EncryptedStatus value returned is true. </p></li><li>track3Encrypted : <span class='text-info'>STRING</span><p>
The track3 encrypted data read by the card reader. Available only on Android and the value is in HEX format. This value should be used only when the track3EncryptedStatus value returned is true. </p></li><li>track1EncryptedStatus : <span class='text-info'>BOOLEAN</span><p>
The status of the track1 encrypted data read by the card reader. Available only on Android. </p></li><li>track2EncryptedStatus : <span class='text-info'>BOOLEAN</span><p>
The status of the track2 encrypted data read by the card reader. Available only on Android. </p></li><li>track3EncryptedStatus : <span class='text-info'>BOOLEAN</span><p>
The status of the track3 encrypted data read by the card reader. Available only on Android. </p></li><li>ksn : <span class='text-info'>STRING</span><p>
The encrypted KSN serial number read by the card reader. Available only on Android. The value is in HEX format. </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.open()</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>EB.CardReader.open()</code> </li></ul></li></ul>

### setDefault(<span class="text-info">SELF_INSTANCE: EB.CardReader</span> defaultInstance)
This method allows you to set the attributes of the default object instance by passing in an object of the same class.

####Parameters
<ul><li>defaultInstance : <span class='text-info'>SELF_INSTANCE: EB.CardReader</span><p>
An instance object that is of the same class. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.CardReader.setDefault(<span class="text-info">SELF_INSTANCE: EB.CardReader</span> defaultInstance)</code> </li></ul></li></ul>

### setProperties(<span class="text-info">HASH</span> propertyMap)
This method will set the values of a list of properties for the API class. The propertyName must be a valid property for the class and must also not be read only.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>
Map of properties I want to set </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.setProperties(<span class="text-info">HASH</span> propertyMap)</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>EB.CardReader.setProperties(<span class="text-info">HASH</span> propertyMap)</code> </li></ul></li></ul>

### setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)
This method will set the value of a property for the API class. The propertyName must be a valid property for the class and must also not be read only.

####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p>
The one property name that I want to set </p></li><li>propertyValue : <span class='text-info'>STRING</span><p>
The one property value that I want to set </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>EB.CardReader.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code> </li></ul></li></ul>

##Properties



###autoEnter

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

When enabled, appends a carriage return to any data returned as keystrokes by the cardreader. This is useful for auto submitting returned data without extra interaction necessary.
####Params
<p><strong>Default:</strong> false</p>
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.autoEnter</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class. <ul><li><code>EB.CardReader.autoEnter</code> </li></ul></li></ul>


####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only

###autoTab

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

When enabled, appends a tab to any data returned as keystrokes by the cardreader. This is useful when filling out a form so that you can move to the next field without extra interaction necessary.
####Params
<p><strong>Default:</strong> false</p>
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.autoTab</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class. <ul><li><code>EB.CardReader.autoTab</code> </li></ul></li></ul>


####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only

###<span class="text-error">moduleName</span>

####Type
<span class='text-info'>STRING</span> 
####Description
<span class='label label-important'>Deprecated</span> 
This method is present to provide backwards compatibility with PocketBrowser code, devices supported by RhoElements will have a single card reader driver installed as part of the platform. If the device has multiple card reader drivers installed this parameter is used to select which driver to use. The drivers present are output in the log file when the card reader is initialized. This parameter is also used to distinguish between an MSR and a DCR, e.g. if you attach a DCR7000 to your device you can specify that only the MSR functionality is used by specifying this parameter as 'MSR7000'.
####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.CardReader.MSR9000 
	* String: msr9000
	* 
MSR9000 drivers. Return value while getting the property of moduleName will be its associated DLL name i.e. MSR3000.DLL.
* Constant: EB.CardReader.MSR9001 
	* String: msr9001
	* 
MSR9001 drivers. Return value while getting the property of moduleName will be its associated DLL name i.e. MSR3000.DLL.
* Constant: EB.CardReader.MSR9500 
	* String: msr9500
	* 
MSR9500 drivers. Return value while getting the property of moduleName will be its associated DLL name i.e. MSRMC50.DLL.
* Constant: EB.CardReader.MSRCAMEO 
	* String: msrcameo
	* 
MSRCAMEO drivers. Return value while getting the property of moduleName will be its associated DLL name i.e. MSRCAMEO.DLL.
* Constant: EB.CardReader.MSR7000 
	* String: msr7000
	* 
MSR7000 drivers. Return value while getting the property of moduleName will be its associated DLL name i.e. MSRMC50.DLL.
* Constant: EB.CardReader.DCR7000 
	* String: dcr7000
	* 
DCR7000 drivers. Return value while getting the property of moduleName will be its associated DLL name i.e. MSRMC50.DLL.
* Constant: EB.CardReader.MSR55 
	* String: msr55
	* 
MSR55 drivers. Return value while getting the property of moduleName will be its associated DLL name i.e. MSRMC55.DLL.
* Constant: EB.CardReader.MSR3000 
	* String: msr3000
	* 
MSR3000 drivers. Return value while getting the property of moduleName will be its associated DLL name i.e. MSR3000.DLL.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.moduleName</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class. <ul><li><code>EB.CardReader.moduleName</code> </li></ul></li></ul>


####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only

###panData

####Type
<span class='text-info'>STRING</span> 
####Description

Sets the card data without the need of a swipe. This accepts any 16 digit number as the string value. Ensure that pinEntry is true before getting the property of panData.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.panData</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class. <ul><li><code>EB.CardReader.panData</code> </li></ul></li></ul>


####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Only compatible with DCR7000-x00)

###pinEntry

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

Turns the PIN entry on or off.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.pinEntry</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class. <ul><li><code>EB.CardReader.pinEntry</code> </li></ul></li></ul>


####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Only compatible with DCR7000-x00)

###pinTimeout

####Type
<span class='text-info'>INTEGER</span> 
####Description

PIN entry timeout in milliseconds. A value of 65535 sets the timeout to infinite. Accepts values between 0 and 65535.
####Params
<p><strong>Default:</strong> 30000</p>
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.pinTimeout</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class. <ul><li><code>EB.CardReader.pinTimeout</code> </li></ul></li></ul>


####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only(Only compatible with DCR7000-x00)

##Remarks



###General

                    
If the CardReader open method is not specified with a callback, the cardreader data will be returned as keystrokes. If both the autotab and autoenter parameters are set to "enabled", autoenter will take precedence. An opened card reader must be closed before the attached card reader device and associated modulename parameter are changed. Any attempt to set a parameter to an invalid value, will result in no effect on the parameter's current value. There should be made a delay around 2 secs or more between API calls which interact with hardware.
                    
                

###Operational Modes (Backwards compatibility with PocketBrowser)

                    
For the DCR7000 the ModuleName parameter must be set at least once before the readevent parameter is set. If the card reader is an MSR, when a card is swiped it returns the data read from the card. Setting ModuleName to a DCR will cause the card data to be returned followed by the PAN Data before waiting for a PIN to be entered on the keypad. Once entered the PIN will be encrypted and returned by a third ReadEvent. The card must be a validly formatted IATA or ABA card. 
                    
                

###Closing the reader while PIN entry pending

                    
There is no way to abort a pending PIN entry (other than the customer pressing the Cancel button), for security reasons. Therefore if the reader is closed or RhoElements is quit during that time it will become unresponsive until a PIN is entered or the PIN timeout occurs.
                    
                

###Blank card data

                    
In certain circumstances it is possible that the card reader may return empty card data. The JavaScript event function should be able to handle this correctly. 
                    
                

###Detaching / Reattaching the Card Reader

                    
Applications running in RhoElements should be resilient against the card reader being detached and subsequently reattached. Card data parsing code should be robust against unexpected characters in the first read after reattachment.
                    
                

###Encrypted Card data

                    
The encrypted data is supported only on the card readers that are configured for encryption. Since the encrypted data might contain unreadable characters sometimes it is recommended to use only JSON object method rather than JavaScript '%s' notation. 
                    
                

##Examples



###Basic Example

The default card reader on the device is enabled when the index view is loaded. When a card is swiped the swipeEvent is called.

###Connect to card reader

Enable card reader and receive a callback when a card is swiped.
<pre><code>:::javascript
           
function cardreader_callback(params) {
  alert("Received data from card reader: "+params["data"]);
}

function connect() {
  Rho.CardReader.open(cardreader_callback);
}
                   
                 
</code></pre>

###Set card reader properties

There are two ways to use the card reader. One is to receive a callback when a card is swiped, the other is to have it simulate keypresses. See below for an example of this second option.
<pre><code>:::javascript
           
// Configure the MSR to output keystrokes instead of calling a function when a card is swiped
// Note the absence of a callback parameter
// Also, After emitting the keystrokes, automatically send a "Tab" keypress
Rho.CardReader.autoTab = true;
Rho.CardReader.open();

Rho.CardReader.autoEnter = true;
Rho.CardReader.open();
                   
                 
</code></pre>