#MobilePayment


## Overview
The Mobile Payment module implements the functions required to work with the D180 Bluetooth Payment MPOS.Before an application can use this module, the device must be paired via Bluetooth the mobile device requesting use.  
	If this is not done, no functions will work and the Open function will return an error of not paired.
	
    ## Enabling the API
    In order to use this API you must include the following extension in your `build.yml`.
    :::ruby
    extensions: ["mobile_payment"]

    The `mobile_payment` extension is also included automatically if you specify the following in your `build.yml`.
    :::ruby
    extensions: ["rhoelements"]

    ## JavaScript Usage
    Be sure to review the [JavaScript API Usage](/guide/api_js) guide for important information about using this API in JavaScript.

    ## Ruby Usage
    Be sure to review the [Ruby API Usage](/guide/api_ruby) guide for important information about using this API in Ruby.

    


##Methods



### abort()
Cancel previously issued method and display welcome screen on PAYMENT device.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>OBJECT</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>Success or Failure depending on outcome of function. </p></li><li>errorName : <span class='text-info'>STRING</span><p>If the status is error, this contains the ErrorName associated with that error.
           </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.abort()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.MobilePayment.abort()</code> 


### close()
Close unitializes and disconnects the D180 payment device.    
       

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>Will contain either success or error. </p></li><li>errorName : <span class='text-info'>STRING</span><p>If the status is error, this contains the ErrorName associated with that error.
           </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.close()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.MobilePayment.close()</code> 


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

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getAllProperties()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.MobilePayment.getAllProperties()</code> 


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

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.MobilePayment.getDefault()</code> 


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

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.MobilePayment.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code> 


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

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getProperty(<span class="text-info">STRING</span> propertyName)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.MobilePayment.getProperty(<span class="text-info">STRING</span> propertyName)</code> 


### isOpened()
Returns whether the Pax device is enabled or not.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:

* BOOLEAN : Returns true if PAX is opened,otherwise false.

####Platforms

* Android

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.isOpened()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.MobilePayment.isOpened()</code> 


### open()
Opens the D180 Payment reader.  Will fail if not paired manually beforehand.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>Will contain either success or error. </p></li><li>errorName : <span class='text-info'>STRING</span><p>If the status is error, this contains the ErrorName associated with that error.
           </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.open()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.MobilePayment.open()</code> 


### promptMenu(<span class="text-info">HASH</span> propertyMap)
Displays two lines of messages on the PAYMENT device and provides a menu with a maximum of 4 choices.  
		This is an asynchronous call and user selection is returned in the callback.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>The properties associated with the promptMessage function. </p></li><ul><li>messageLine1 : <span class='text-info'>STRING</span><p>Message Line1 to display on the PINPad screen.  Maximum characters allowed for Choice + Message = 18 characters.  
					For example, if Choice is 6 characters, maximum message length is 12 characters.  
					Messages longer than maximum message length will be truncated. </p></li><li>messageLine2 : <span class='text-info'>STRING</span><p>Message Line2 to display on the PINPad screen.  Maximum characters allowed for Choice + Message = 18 characters.  
					For example, if Choice is 6 characters, maximum message length is 12 characters.  
					Messages longer than maximum message length will be truncated. </p></li><li>choice1 : <span class='text-info'>STRING</span><p>Choice text for selection from the PINPad using the function keys.  
					Choice string can consist of up to 8 characters. </p></li><li>choice2 : <span class='text-info'>STRING</span><p>Choice text for selection from the PINPad using the function keys.  
					Choice string can consist of up to 8 characters. </p></li><li>choice3 : <span class='text-info'>STRING</span><p>Choice text for selection from the PINPad using the function keys.  
					Choice string can consist of up to 8 characters. </p></li><li>choice4 : <span class='text-info'>STRING</span><p>Choice text for selection from the PINPad using the function keys.  
					Choice string can consist of up to 8 characters. </p></li><li>timeout : <span class='text-info'>INTEGER</span><p>Timeout in milliseconds.  App can set the timeout, 
					but value must be within threshold set by the payment device. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>Success or Failure depending upon the outcome of the function </p></li><li>choice : <span class='text-info'>STRING</span><p>The choice that was decided by the user on status is success. </p></li><li>errorName : <span class='text-info'>STRING</span><p>If the status is error, this contains the ErrorName associated with that error.
           </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.promptMenu(<span class="text-info">HASH</span> propertyMap)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.MobilePayment.promptMenu(<span class="text-info">HASH</span> propertyMap)</code> 


### promptMessage(<span class="text-info">HASH</span> propertyMap)
Displays a maximum of 4 line messages on the PAYMENT device.  This method also allows a user confirmation.  
		This can be done by setting the 5th parameter to true, in which case a string containing OK, CANCEL, CORR or TIMEOUT (after 15 seconds).  
		This is an asynchronous call and all data is returned in the callback.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>The properties associated with the promptMessage function. </p></li><ul><li>messageLine1 : <span class='text-info'>STRING</span><p>A message to display on line 1 of the PINPad screen, may consist of up to 16 characters. </p></li><li>messageLine2 : <span class='text-info'>STRING</span><p>A message to display on line 1 of the PINPad screen, may consist of up to 16 characters. </p></li><li>messageLine3 : <span class='text-info'>STRING</span><p>A message to display on line 1 of the PINPad screen, may consist of up to 16 characters. </p></li><li>messageLine4 : <span class='text-info'>STRING</span><p>A message to display on line 1 of the PINPad screen, may consist of up to 16 characters. </p></li><li>getUserConfirmation : <span class='text-info'>BOOLEAN</span><p>true or false.  Allows the user to press OK (Enter Key), CANCEL or CORR keys in response to the displayed message. If getUserConfirmation is false, this is a synchronous call. </p></li><li>timeout : <span class='text-info'>INTEGER</span><p>Read timeout in milliseconds.  The app can set the timeout, but the value must be within the threshold set by the payment device. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>Success or Error depending on outcome of function. </p></li><li>errorName : <span class='text-info'>STRING</span><p>If the status is error, this contains the ErrorName associated with that error.
           </p></li><li>userConfirmationMessage : <span class='text-info'>STRING</span><p>Will contain OK, CANCEL or CORR depending upon what the user pressed. </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.promptMessage(<span class="text-info">HASH</span> propertyMap)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.MobilePayment.promptMessage(<span class="text-info">HASH</span> propertyMap)</code> 


### promptPin(<span class="text-info">HASH</span> propertyMap)
Requests for a PIN and gets the PIN block.  The encrypted data will be returned only if a key is injected into the PAYMENT device.  
		This is an asynchronous call.  Data will be returned in the callback function.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>The properties associated with promptPin. </p></li><ul><li>accountNumber : <span class='text-info'>STRING</span><p>The account number used with the entered PIN to create the encrypted PIN Block (8 to 19 alphanumeric digits inclusive). </p></li><li>minPINLength : <span class='text-info'>INTEGER</span><p>Minimum PIN Length.  A minimum length of 4 digits is required. </p></li><li>maxPINLength : <span class='text-info'>INTEGER</span><p>Maximum PIN Length.  A maximum length of 12 digits is allowed. </p></li><li>message1 : <span class='text-info'>STRING</span><p>Message 1 to be displayed on the PINPad (alternates with Message 2).  Maximum message length 21 characters. </p></li><li>message2 : <span class='text-info'>STRING</span><p>Message 2 to be displayed on the PINPad (alternates with Message 1).  Maximum message length 21 characters. </p></li><li>processingMessage : <span class='text-info'>STRING</span><p>For future use. Processing message to be displayed after PIN entry. </p></li><li>readTimeOut : <span class='text-info'>INTEGER</span><p>Read timeout in milliseconds.  App can set the timeout, but value must be within threshold set by the payment device. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>Success for Error depending upon the outcome of the call. </p></li><li>errorName : <span class='text-info'>STRING</span><p>If the status is error, this contains the ErrorName associated with that error.
           </p></li><li>pinBlockStr : <span class='text-info'>STRING</span><p>returns the pin block string </p></li><li>serialNumber : <span class='text-info'>STRING</span><p>Returns the serial number </p></li><li>isPinEntered : <span class='text-info'>BOOLEAN</span><p>returns true or false on whether the pin is entered by the user or not </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.promptPin(<span class="text-info">HASH</span> propertyMap)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.MobilePayment.promptPin(<span class="text-info">HASH</span> propertyMap)</code> 


### readCardData(<span class="text-info">HASH</span> propertyMap)
Reads the card data from the PAYMENT device through a swipe (MagStripe), insert (for smart cards) or tap (for EMV contactless). 
		This is asynchronous so the return data is passed back through the callback.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>The properties associated with reading card data. </p></li><ul><li>amount : <span class='text-info'>FLOAT</span><p>Amount for the transaction; this value is required to enable EMV contactless transactions.  Allowed upto a maximum of 7 digits. </p></li><li>otherAmount : <span class='text-info'>FLOAT</span><p>Any additional amount information for the transaction; this value is used only if EMV Contactless is supported.  Allowed upto a maximum of 7 digits </p></li><li>readMode : <span class='text-info'>INTEGER</span><p>Use the constants defined in the XML for use with READMODE </p></li><li>transactionMessage : <span class='text-info'>STRING</span><p>The message to be displayed on the card data request. The maximum length is 18 characters. The character "|" not allowed. </p></li><li>readTimeOut : <span class='text-info'>INTEGER</span><p>Read timeout in milliseconds.  App can set the timeout, but value used must be within the threshold set by the payment device. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>Will contain either success or error depending on outcome of call. </p></li><li>errorName : <span class='text-info'>STRING</span><p>If the status is error, this contains the ErrorName associated with that error.
           </p></li><li>accountNumber : <span class='text-info'>INTEGER</span><p> </p></li><li>cardHolderName : <span class='text-info'>STRING</span><p> </p></li><li>expiryDate : <span class='text-info'>STRING</span><p> </p></li><li>track1Data : <span class='text-info'>STRING</span><p> </p></li><li>track2Data : <span class='text-info'>STRING</span><p> </p></li><li>track3Data : <span class='text-info'>STRING</span><p> </p></li><li>tlvStrings : <span class='text-info'>ARRAY</span><p> </p></li><li>tags : <span class='text-info'>ARRAY</span><p> </p></li><li>lengths : <span class='text-info'>ARRAY</span><p> </p></li><li>values : <span class='text-info'>ARRAY</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.readCardData(<span class="text-info">HASH</span> propertyMap)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.MobilePayment.readCardData(<span class="text-info">HASH</span> propertyMap)</code> 


### setDefault(<span class="text-info">SELF_INSTANCE: EB.MobilePayment</span> defaultInstance)
This method allows you to set the attributes of the default object instance by passing in an object of the same class.

####Parameters
<ul><li>defaultInstance : <span class='text-info'>SELF_INSTANCE: EB.MobilePayment</span><p>An instance object that is of the same class. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.MobilePayment.setDefault(<span class="text-info">SELF_INSTANCE: EB.MobilePayment</span> defaultInstance)</code> 


### setProperties(<span class="text-info">HASH</span> propertyMap)
This method will set the values of a list of properties for the API class. The propertyName must be a valid property for the class and must also not be read only.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>Map of properties I want to set </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.setProperties(<span class="text-info">HASH</span> propertyMap)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.MobilePayment.setProperties(<span class="text-info">HASH</span> propertyMap)</code> 


### setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)
This method will set the value of a property for the API class. The propertyName must be a valid property for the class and must also not be read only.

####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p>The one property name that I want to set </p></li><li>propertyValue : <span class='text-info'>STRING</span><p>The one property value that I want to set </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.MobilePayment.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code> 


##Constants


* SWIPEswipe Read Mode for use in readCardData
* INSERTinsert Read Mode for use in readCardData
* TOUCHtouch Read Mode for use in readCardData
* MANUALManual Mode for use in readCardData
* ALLall Read Mode for use in readCardData
* USA
* FRANCE
* GERMANY
* UK
* DENMARK
* SWEDEN
* ITALY
* SPAIN
* JAPAN
* NORWAY
* DENMARK2
* CHINA
* ALREADY_CLOSED
* ALREADY_ENABLED
* AUTHENTICATION_FAILED
* AUTHORIZATION_FAILED
* CARD_INSERTION_ERROR
* CARD_REMOVED
* CHIP_READ_ERROR
* CHIP_READ_NO_APP_ERROR
* COMMUNICATION_ERROR
* DEVICE_DISCONNETED
* DEVICE_NOT_ENABLED
* DEVICE_NOT_PAIRED
* DISABLE_FAILED
* ENABLE_FAILED
* FAILURE
* FEATURE_NOT_SUPPORTED
* INVALID_CONFIGURATION
* INVALID_DATA_LENGTH
* INVALID_MAC_KEY_LENGTH
* INVALID_OBJECT
* INVALID_PIN_LENGTH
* INVALID_VALUE
* LOW_POWER_OPERATION_CANCELLED
* MAC_BLOCK_CREATE_ERROR
* MAC_KEY_CREATE_ERROR
* MAC_VALIDATION_ERROR
* NO_DATA_LISTENER
* NULL_POINTER
* OK_KEY_PRESSED
* CANCEL_KEY_PRESSED
* OPERATION_CANCELLED
* PREVIOUS_COMMAND_PENDING
* SUCCESS
* TIMED_OUT
* TLV_DATA_ERROR
* UNDEFINED