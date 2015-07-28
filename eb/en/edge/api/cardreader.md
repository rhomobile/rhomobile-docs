#CardReader


## Overview
The Card Reader module decodes the card data when read through a card reader attachment. Currently this is available only on Symbol Technologies devices.Only the foreground application is given access to the card reader hardware, when an application is sent to the background its state will be saved and it will automatically relinquish control of the card reader. When brought back to the foreground, an application previously using the card reader will have its previous configuration (eg. pinTimeout) reapplied to the card reader automatically.
## Enabling the API
There are two methods of enabling the CardReader API: 

* Include all ebapi modules or 
* Include only the API modules you need 

For either of these methods, you'll need to include files from the `/Enterprise Browser/JavaScript Files/Enterprise Browser` directory on the computer that you installed the Enterprise Browser.

### Include all JS API modules
To include all JS APIs, you must copy the ebapi-modules.js file to a location accessible by your app's files and include the JavaScript file in your app. For instance, to include the modules file in your index.html, with the file in the same directory as your index.html, you would add the following line to the <head> section of your index.html:

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi-modules.js"></script>

> Note: that the pathing for this file is relative to the current page.

This will define the EB class within the page. Any page you need to use the modules will need to have the .js file included in this fashion.

### Include only the modules you need
To include single APIs, you must first include the `ebapi.js` in your HTML as well as the API file you want to use. For instance, to use the CardReader API, I would add the following code to my HTML file(s), assuming the API files have been copied to the same directory as the HTML.

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi.js"></script>
    <script type="text/javascript" charset="utf-8" src="eb.cardreader.js"></script>

The ebapi.js file is necessary for all single API inclusions.
        


##Methods



### close()
Closes the card reader.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE
* Zebra Devices Only

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.close()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.CardReader.close()</code> 


### enumerate()
Enumerates all the available card readers.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul><ul><li>cardreaderArray : <span class='text-info'>SELF_INSTANCE: EB.CardReader</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:

* ARRAY : Array of Card reader objects.<ul><li>cardreaderArray : <span class='text-info'>SELF_INSTANCE: EB.CardReader</span><p> </p></li></ul>

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.CardReader.enumerate()</code> 


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
	* <code>EB.CardReader.getAllProperties()</code> 


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
	* <code>EB.CardReader.getDefault()</code> 


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
	* <code>EB.CardReader.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code> 


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
	* <code>EB.CardReader.getProperty(<span class="text-info">STRING</span> propertyName)</code> 


### open()
Opens the card reader.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>data : <span class='text-info'>STRING</span><p>Data read by the card reader. This may be card data, the PAN data extracted from the card data, encrypted PIN block data, or a message. In case of an ISO/ABA card [eg: a financial card], data is encrypted. For other cards, data is in the clear. </p></li><li>mode : <span class='text-info'>STRING</span><p>Describes the data. This will be either: 'CR','ENCDATA','PAN', or 'MESSAGE'. This equates to card data, encrypted PIN block data, PAN data, or a message, respectively. </p></li><li>encryption : <span class='text-info'>BOOLEAN</span><p>This provides the information regarding the card reader head configuration. Available only on Android. </p></li><li>rawData : <span class='text-info'>STRING</span><p>This is the raw data read by the card reader from all the tracks. Available only on Android and the value is in HEX format. </p></li><li>track1 : <span class='text-info'>STRING</span><p>The track1 clear/masked data read by the card reader. Available only on Android and the value is in HEX format. This value should be used only when the track1Status value returned is true. </p></li><li>track2 : <span class='text-info'>STRING</span><p>The track2 clear/masked data read by the card reader. Available only on Android and the value is in HEX format. This value should be used only when the track2Status value returned is true. </p></li><li>track3 : <span class='text-info'>STRING</span><p>The track3 clear/masked data read by the card reader. Available only on Android and the value is in HEX format. This value should be used only when the track3Status value returned is true. </p></li><li>track1Status : <span class='text-info'>BOOLEAN</span><p>The status of the track1 clear/masked data read by the card reader. Available only on Android. </p></li><li>track2Status : <span class='text-info'>BOOLEAN</span><p>The status of the track2 clear/masked data read by the card reader. Available only on Android. </p></li><li>track3Status : <span class='text-info'>BOOLEAN</span><p>The status of the track3 clear/masked data read by the card reader. Available only on Android. </p></li><li>track1Encrypted : <span class='text-info'>STRING</span><p>The track1 encrypted data read by the card reader. Available only on Android and the value is in HEX format. This value should be used only when the track1EncryptedStatus value returned is true. </p></li><li>track2Encrypted : <span class='text-info'>STRING</span><p>The track2 encrypted data read by the card reader. Available only on Android and the value is in HEX format. This value should be used only when the track2EncryptedStatus value returned is true. </p></li><li>track3Encrypted : <span class='text-info'>STRING</span><p>The track3 encrypted data read by the card reader. Available only on Android and the value is in HEX format. This value should be used only when the track3EncryptedStatus value returned is true. </p></li><li>track1EncryptedStatus : <span class='text-info'>BOOLEAN</span><p>The status of the track1 encrypted data read by the card reader. Available only on Android. </p></li><li>track2EncryptedStatus : <span class='text-info'>BOOLEAN</span><p>The status of the track2 encrypted data read by the card reader. Available only on Android. </p></li><li>track3EncryptedStatus : <span class='text-info'>BOOLEAN</span><p>The status of the track3 encrypted data read by the card reader. Available only on Android. </p></li><li>ksn : <span class='text-info'>STRING</span><p>The encrypted KSN serial number read by the card reader. Available only on Android. The value is in HEX format. </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE
* Zebra Devices Only

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.open()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.CardReader.open()</code> 


### setDefault(<span class="text-info">SELF_INSTANCE: EB.CardReader</span> defaultInstance)
This method allows you to set the attributes of the default object instance by passing in an object of the same class.

####Parameters
<ul><li>defaultInstance : <span class='text-info'>SELF_INSTANCE: EB.CardReader</span><p>An instance object that is of the same class. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.CardReader.setDefault(<span class="text-info">SELF_INSTANCE: EB.CardReader</span> defaultInstance)</code> 


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
	* <code>EB.CardReader.setProperties(<span class="text-info">HASH</span> propertyMap)</code> 


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
	* <code>EB.CardReader.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code> 


##Properties



###autoEnter

####Type
<span class='text-info'>BOOLEAN</span> 
####Description
When enabled, appends a carriage return to any data returned as keystrokes by the cardreader. This is useful for auto submitting returned data without extra interaction necessary.
####Params
<p><strong>Default:</strong> false</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.autoEnter</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.CardReader.autoEnter</code> 



####Platforms

* Android
* Windows Mobile
* Windows CE
* Zebra Devices Only

###autoTab

####Type
<span class='text-info'>BOOLEAN</span> 
####Description
When enabled, appends a tab to any data returned as keystrokes by the cardreader. This is useful when filling out a form so that you can move to the next field without extra interaction necessary.
####Params
<p><strong>Default:</strong> false</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.autoTab</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.CardReader.autoTab</code> 



####Platforms

* Android
* Windows Mobile
* Windows CE
* Zebra Devices Only

###<span class="text-error">moduleName</span>

####Type
<span class='text-info'>STRING</span> 
####Description
<span class='label label-important'>Deprecated</span> This method is present to provide backwards compatibility with PocketBrowser code, devices supported by the Enterprise Browser will have a single card reader driver installed as part of the platform. If the device has multiple card reader drivers installed this parameter is used to select which driver to use. The drivers present are output in the log file when the card reader is initialized. This parameter is also used to distinguish between an MSR and a DCR, e.g. if you attach a DCR7000 to your device you can specify that only the MSR functionality is used by specifying this parameter as 'MSR7000'.
####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.CardReader.MSR9000 - String: msr9000 MSR9000 drivers. Return value while getting the property of moduleName will be its associated DLL name i.e. MSR3000.DLL.
* Constant: EB.CardReader.MSR9001 - String: msr9001 MSR9001 drivers. Return value while getting the property of moduleName will be its associated DLL name i.e. MSR3000.DLL.
* Constant: EB.CardReader.MSR9500 - String: msr9500 MSR9500 drivers. Return value while getting the property of moduleName will be its associated DLL name i.e. MSRMC50.DLL.
* Constant: EB.CardReader.MSRCAMEO - String: msrcameo MSRCAMEO drivers. Return value while getting the property of moduleName will be its associated DLL name i.e. MSRCAMEO.DLL.
* Constant: EB.CardReader.MSR7000 - String: msr7000 MSR7000 drivers. Return value while getting the property of moduleName will be its associated DLL name i.e. MSRMC50.DLL.
* Constant: EB.CardReader.DCR7000 - String: dcr7000 DCR7000 drivers. Return value while getting the property of moduleName will be its associated DLL name i.e. MSRMC50.DLL.
* Constant: EB.CardReader.MSR55 - String: msr55 MSR55 drivers. Return value while getting the property of moduleName will be its associated DLL name i.e. MSRMC55.DLL.
* Constant: EB.CardReader.MSR3000 - String: msr3000 MSR3000 drivers. Return value while getting the property of moduleName will be its associated DLL name i.e. MSR3000.DLL.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.moduleName</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.CardReader.moduleName</code> 



####Platforms

* Windows Mobile
* Zebra Devices Only

###panData

####Type
<span class='text-info'>STRING</span> 
####Description
Sets the card data without the need of a swipe. This accepts any 16 digit number as the string value. Ensure that pinEntry is true before getting the property of panData.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.panData</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.CardReader.panData</code> 



####Platforms

* Windows Mobile
* Zebra Devices Only(Only compatible with DCR7000-x00)

###pinEntry

####Type
<span class='text-info'>BOOLEAN</span> 
####Description
Turns the PIN entry on or off.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.pinEntry</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.CardReader.pinEntry</code> 



####Platforms

* Windows Mobile
* Zebra Devices Only(Only compatible with DCR7000-x00)

###pinTimeout

####Type
<span class='text-info'>INTEGER</span> 
####Description
PIN entry timeout in milliseconds. A value of 65535 sets the timeout to infinite. Accepts values between 0 and 65535.
####Params
<p><strong>Default:</strong> 30000</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.pinTimeout</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.CardReader.pinTimeout</code> 



####Platforms

* Windows Mobile
* Zebra Devices Only(Only compatible with DCR7000-x00)

##Remarks



###General
If the CardReader open method is not specified with a callback, the cardreader data will be returned as keystrokes. If both the autotab and autoenter parameters are set to "enabled", autoenter will take precedence. An opened card reader must be closed before the attached card reader device and associated modulename parameter are changed. Any attempt to set a parameter to an invalid value, will result in no effect on the parameter's current value. There should be made a delay around 2 secs or more between API calls which interact with hardware.

###Operational Modes (Backwards compatibility with PocketBrowser)
For the DCR7000 the ModuleName parameter must be set at least once before the readevent parameter is set. If the card reader is an MSR, when a card is swiped it returns the data read from the card. Setting ModuleName to a DCR will cause the card data to be returned followed by the PAN Data before waiting for a PIN to be entered on the keypad. Once entered the PIN will be encrypted and returned by a third ReadEvent. The card must be a validly formatted IATA or ABA card.

###Closing the reader while PIN entry pending
There is no way to abort a pending PIN entry (other than the customer pressing the Cancel button), for security reasons. Therefore if the reader is closed or the Enterprise Browser is quit during that time it will become unresponsive until a PIN is entered or the PIN timeout occurs.

###Blank card data
In certain circumstances it is possible that the card reader may return empty card data. The JavaScript event function should be able to handle this correctly. 

###Detaching / Reattaching the Card Reader
Applications running in the Enterprise Browser should be resilient against the card reader being detached and subsequently reattached. Card data parsing code should be robust against unexpected characters in the first read after reattachment.

###Encrypted Card data
The encrypted data is supported only on the card readers that are configured for encryption. Since the encrypted data might contain unreadable characters sometimes it is recommended to use only JSON object method rather than JavaScript '%s' notation.

##Examples



###Accepting Card Swipes
This example shows how to enable the card reader and accept a card swipe. It then, displays the data in a human readable way. This example assumes that the ebapi-modules.js file is in the same directory as the html file invoking it.
<pre><code>:::javascript
                                
&lt;head&gt;
    &lt;script type="text/javascript" charset="utf-8" src="ebapi-modules.js"&gt;&lt;/script&gt;

    &lt;title&gt;CardReader API Example&lt;/title&gt;

    &lt;script&gt;
        var firstName  = '';
        var middleInit = '';
        var lastName   = '';
        var cardNumber = '';

        function openCardReader(){
            EB.CardReader.open(cardReaderCallback);
        }

        function cardReaderCallback(params){
            var scannedData = params['data'].split("^");

            // The card number is preceded by a two characters: "%B" that need to be removed to display the number properly.
            cardNumber = scannedData[0].substr(2);

            var name  = scannedData[1];
            lastName  = name.split("/")[0];
            firstName = name.split("/")[1];
            // Check for middle initial
            if(firstName.split(" ")[1]){
                middleInit = firstName.split(" ")[1];
            }

            cardData.innerHTML = 'Card Data: &lt;br/&gt;' + 
                                 'Name on Card: ' + firstName + ' ' + lastName + '&lt;br/&gt;' +
                                 'Card Number:  ' + cardNumber;
        }
    &lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
    &lt;h1&gt;CardReader API&lt;/h1&gt;
    &lt;br/&gt;
    &lt;br/&gt;
    &lt;div id='cardData'&gt;Card Data: &lt;/div&gt;
    &lt;br/&gt;
    &lt;br/&gt;
    &lt;button onClick='openCardReader()'&gt;Activate Card Reader&lt;/button&gt;
&lt;/body&gt;
                                
                            
</code></pre>