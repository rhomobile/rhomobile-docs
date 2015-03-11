#MobilePayment


## Overview
The Mobile Payment module implements the functions required to work with the PD40 Bluetooth Payment MPOS. We need to include the emdk jar in the add-ons directory of android sdk in order to build it.Before an application can use this module, the device must be paired via Bluetooth the mobile device requesting use.  
	If this is not done, no functions will work and the Open function will return an error of not paired. Only One PD40 device should be worked with one device. emdk3-manager extension has to be included before mobile_payment.
	
    ## Enabling the API
    In order to use this API you must include the following extension in your `build.yml`.
    :::ruby
    extensions: ["mobile_payment"]
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


### authorizeCard(<span class="text-info">FLOAT</span> amount, <span class="text-info">FLOAT</span> otherAmount, <span class="text-info">INTEGER</span> merchantDecision, <span class="text-info">ARRAY</span> tags, <span class="text-info">BOOLEAN</span> displayResult, <span class="text-info">BOOLEAN</span> pinTryExceedStatus, <span class="text-info">BOOLEAN</span> displayAmount, <span class="text-info">BOOLEAN</span> displayAppExpired, <span class="text-info">INTEGER</span> timeout)
Authorizes the EMV transaction amounts using the inserted chip (EMV) card. This is an asynchronous call. Before calling this method,readcarddata has to be called.

####Parameters
<ul><li>amount : <span class='text-info'>FLOAT</span><p>Transaction amount value. </p></li><li>otherAmount : <span class='text-info'>FLOAT</span><p>Other transaction amount value. </p></li><li>merchantDecision : <span class='text-info'>INTEGER</span><p>The merchant decision notes additional handling for the EMV request based on required processor handling.  
			Please use the constants for Merchant Decision. </p></li><li>tags : <span class='text-info'>ARRAY</span><p>EMV tags that are required at this transaction stage to be retrieved. </p></li><li>displayResult : <span class='text-info'>BOOLEAN</span><p>true or false.  Display result on Payment device. </p></li><li>pinTryExceedStatus : <span class='text-info'>BOOLEAN</span><p>true or false.  Displays when PIN tries have exceeded value on Payment device. </p></li><li>displayAmount : <span class='text-info'>BOOLEAN</span><p>true or false.  Displays amount of Payment device. </p></li><li>displayAppExpired : <span class='text-info'>BOOLEAN</span><p>true or false.  Displays if app is expired on Payement display. </p></li><li>timeout : <span class='text-info'>INTEGER</span><p>Card authorization timeout. Application must set the timeout. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>OBJECT</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>Either SUCCESS or ERROR </p></li><li>errorName : <span class='text-info'>STRING</span><p>If the status is error, this contains the ErrorName associated with that error.
           </p></li><li>tlvStrings : <span class='text-info'>ARRAY</span><p>An array of the returned Tags requested. </p></li><li>keySerialNo : <span class='text-info'>STRING</span><p>key Serial no </p></li><li>pinBlock : <span class='text-info'>STRING</span><p>pin block </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.authorizeCard(<span class="text-info">FLOAT</span> amount, <span class="text-info">FLOAT</span> otherAmount, <span class="text-info">INTEGER</span> merchantDecision, <span class="text-info">ARRAY</span> tags, <span class="text-info">BOOLEAN</span> displayResult, <span class="text-info">BOOLEAN</span> pinTryExceedStatus, <span class="text-info">BOOLEAN</span> displayAmount, <span class="text-info">BOOLEAN</span> displayAppExpired, <span class="text-info">INTEGER</span> timeout)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.MobilePayment.authorizeCard(<span class="text-info">FLOAT</span> amount, <span class="text-info">FLOAT</span> otherAmount, <span class="text-info">INTEGER</span> merchantDecision, <span class="text-info">ARRAY</span> tags, <span class="text-info">BOOLEAN</span> displayResult, <span class="text-info">BOOLEAN</span> pinTryExceedStatus, <span class="text-info">BOOLEAN</span> displayAmount, <span class="text-info">BOOLEAN</span> displayAppExpired, <span class="text-info">INTEGER</span> timeout)</code> 


### close()
Close unitializes and disconnects the PD40 payment device.    
       

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


### completeOnlineEmv(<span class="text-info">INTEGER</span> hostDescision, <span class="text-info">BOOLEAN</span> displayResult, <span class="text-info">ARRAY</span> tlvStrings)
Completes an online EMV transaction for PIN management. The application must call authorizeCard before calling this API. This is an asynchronous call. After the processing, the response (i.e., EmvData object) is returned through the registered Callback. 

####Parameters
<ul><li>hostDescision : <span class='text-info'>INTEGER</span><p>HostDecision enum value which is the decision indicator from the host response. Use the constants "HOST DEFINED" defined in the XML document. </p></li><li>displayResult : <span class='text-info'>BOOLEAN</span><p>Indicator to note whether or not to display the final response message. False for  Do not display and true to Display. </p></li><li>tlvStrings : <span class='text-info'>ARRAY</span><p>List of EMV data which contains EMV tag and its values. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>Either SUCCESS or ERROR </p></li><li>errorName : <span class='text-info'>STRING</span><p>If the status is error, this contains the ErrorName associated with that error.
           </p></li><li>tlvStrings : <span class='text-info'>ARRAY</span><p>An array of the returned Tags requested. </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.completeOnlineEmv(<span class="text-info">INTEGER</span> hostDescision, <span class="text-info">BOOLEAN</span> displayResult, <span class="text-info">ARRAY</span> tlvStrings)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.MobilePayment.completeOnlineEmv(<span class="text-info">INTEGER</span> hostDescision, <span class="text-info">BOOLEAN</span> displayResult, <span class="text-info">ARRAY</span> tlvStrings)</code> 


### createMac(<span class="text-info">STRING</span> u8MacData)
This is a required transaction for Canada. Accepts a String of data to be MACed using the ANSI x9.91 standard and the MAC Working Key. This is used for MACing credit transactions when the PINPad is configured to support both credit and debit. This is synchronous call.

####Parameters
<ul><li>u8MacData : <span class='text-info'>STRING</span><p>String of data to be MACed. The length of the key should be 16 or 32 or 48  in HEX format.
	   </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>SUCCESS or ERROR.
			 </p></li><li>errorName : <span class='text-info'>STRING</span><p>If the status is error, this contains the ErrorName associated with that error.
			 </p></li><li>macBlock : <span class='text-info'>STRING</span><p>If the status is succes, it returns macBlock.
			 </p></li></ul></ul>

####Returns
Synchronous Return:

* HASH<ul><li>status : <span class='text-info'>STRING</span><p>SUCCESS or ERROR.
			 </p></li><li>errorName : <span class='text-info'>STRING</span><p>If the status is error, this contains the ErrorName associated with that error.
			 </p></li><li>macBlock : <span class='text-info'>STRING</span><p>If the status is succes, it returns macBlock.
			 </p></li></ul>

####Platforms

* Android

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.createMac(<span class="text-info">STRING</span> u8MacData)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.MobilePayment.createMac(<span class="text-info">STRING</span> u8MacData)</code> 


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


### getBatteryLevel()
Query the battery level of the payment device.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>success or error.
           </p></li><li>errorName : <span class='text-info'>STRING</span><p>If the status is error, this contains the ErrorName associated with that error.
			   </p></li><li>batteryLevel : <span class='text-info'>INTEGER</span><p>If the status is success, this contains the battery level. Value would be 1,2,3,4.
			   </p></li></ul></ul>

####Returns
Synchronous Return:

* HASH<ul><li>status : <span class='text-info'>STRING</span><p>success or error.
           </p></li><li>errorName : <span class='text-info'>STRING</span><p>If the status is error, this contains the ErrorName associated with that error.
			   </p></li><li>batteryLevel : <span class='text-info'>INTEGER</span><p>If the status is success, this contains the battery level. Value would be 1,2,3,4.
			   </p></li></ul>

####Platforms

* Android

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getBatteryLevel()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.MobilePayment.getBatteryLevel()</code> 


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


### getDeviceInfo()
Returns information about the payment device.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>success or error.
           </p></li><li>errorName : <span class='text-info'>STRING</span><p>If the status is error, this contains the ErrorName associated with that error.
           </p></li><li>applicationVersion : <span class='text-info'>STRING</span><p>Application Version of PD40.
           </p></li><li>firmwareVersion : <span class='text-info'>STRING</span><p>Firmware Version of PD40.
			   </p></li><li>connectionType : <span class='text-info'>STRING</span><p>Connection Type Version of PD40.
			   </p></li><li>deviceType : <span class='text-info'>STRING</span><p>Device Type of PD40.
			   </p></li><li>friendlyName : <span class='text-info'>STRING</span><p>Friendlyname of PD40.
			   </p></li></ul></ul>

####Returns
Synchronous Return:

* HASH<ul><li>status : <span class='text-info'>STRING</span><p>success or error.
           </p></li><li>errorName : <span class='text-info'>STRING</span><p>If the status is error, this contains the ErrorName associated with that error.
           </p></li><li>applicationVersion : <span class='text-info'>STRING</span><p>Application Version of PD40.
           </p></li><li>firmwareVersion : <span class='text-info'>STRING</span><p>Firmware Version of PD40.
			   </p></li><li>connectionType : <span class='text-info'>STRING</span><p>Connection Type Version of PD40.
			   </p></li><li>deviceType : <span class='text-info'>STRING</span><p>Device Type of PD40.
			   </p></li><li>friendlyName : <span class='text-info'>STRING</span><p>Friendlyname of PD40.
			   </p></li></ul>

####Platforms

* Android

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getDeviceInfo()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.MobilePayment.getDeviceInfo()</code> 


### getEmvTags(<span class="text-info">ARRAY</span> emvTags)
Gets tag information from the inserted card. This is an asynchronous call. After the processing, the response (TagData contains TLV raw data as per EMV specification)and also its parsed tag, length and value format is returned through the registered Callback.Before calling this method,readcarddata has to be called.

####Parameters
<ul><li>emvTags : <span class='text-info'>ARRAY</span><p>Array containing EMV tag IDs to be retrieved from the inserted card.  Refer to the EMV Tags section in the documentation to 
			know which TAG IDs can be requested with this call.  Any number of Tag IDs are allowed and the number of Tag IDs will match the number of tag values. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>OBJECT</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>Either SUCCESS or ERROR </p></li><li>errorName : <span class='text-info'>STRING</span><p>If the status is error, this contains the ErrorName associated with that error.
           </p></li><li>tlvStrings : <span class='text-info'>ARRAY</span><p>An array of the returned Tags requested. </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getEmvTags(<span class="text-info">ARRAY</span> emvTags)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.MobilePayment.getEmvTags(<span class="text-info">ARRAY</span> emvTags)</code> 


### getLowBatteryThreshold()
Gets the acceptable low battery level. If the battery drops below this value, the device will not execute any of the selected commands..

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>success or error.
           </p></li><li>errorName : <span class='text-info'>STRING</span><p>If the status is error, this contains the ErrorName associated with that error.
			   </p></li><li>lowBatteryThreshold : <span class='text-info'>INTEGER</span><p>If the status is success, this contains the battery level. Value would be 1,2,3,4.
			   </p></li></ul></ul>

####Returns
Synchronous Return:

* HASH<ul><li>status : <span class='text-info'>STRING</span><p>success or error.
           </p></li><li>errorName : <span class='text-info'>STRING</span><p>If the status is error, this contains the ErrorName associated with that error.
			   </p></li><li>lowBatteryThreshold : <span class='text-info'>INTEGER</span><p>If the status is success, this contains the battery level. Value would be 1,2,3,4.
			   </p></li></ul>

####Platforms

* Android

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getLowBatteryThreshold()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.MobilePayment.getLowBatteryThreshold()</code> 


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
Returns whether the PD40 device is enabled or not.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:

* BOOLEAN : Returns true if PD40 is opened,otherwise false.

####Platforms

* Android

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.isOpened()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.MobilePayment.isOpened()</code> 


### open(<span class="text-info">STRING</span> deviceName)
Opens the PD40 Payment reader.  Will fail if not paired manually beforehand.

####Parameters
<ul><li>deviceName : <span class='text-info'>STRING</span><p>The name of the PD40 device which is paired and to be worked with. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

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
	* <code>myObject.open(<span class="text-info">STRING</span> deviceName)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.MobilePayment.open(<span class="text-info">STRING</span> deviceName)</code> 


### promptAdditionalInfo(<span class="text-info">HASH</span> propertyMap)
Requests the user to confirm the amount and surcharge passed by the application and prompts the user to provide tip and cashback. The tip, cashback values and the confirmation if surcharge was accepted, will be returned to the application via  callback. If the user presses OK or CANCEL keys, or the call times out, the corresponding message is returned. This is asynchronous call.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>The properties associated with the promptMessage function. </p></li><ul><li>amount : <span class='text-info'>FLOAT</span><p>Transaction amount value that is displayed, valid range is from 0.01 to 999999.99 </p></li><li>langCode : <span class='text-info'>INTEGER</span><p>Numeric value denoting the language code for determining language of the pre-defined prompt. Languages currently supported are listed in the constants section. Other languages can be used, but all information relating to that is the responsibility of the calling application. Currenly supported only 0 i.e. US </p></li><li>promptForTip : <span class='text-info'>BOOLEAN</span><p>Indicates whether or not to prompt for tip and return the amount desired. </p></li><li>cashBack : <span class='text-info'>BOOLEAN</span><p>Indicates whether or not to prompt for cashback and return the amount selected.  The user would select cashback amount from 4 pre-defined - $20, $40, $60 and $100.  These choices cannot be modified. </p></li><li>surcharge : <span class='text-info'>FLOAT</span><p>An optional surcharge amount that is to be displayed and confirmed (valid range is from 0.01 to 99.99).  A zero amount will cause this prompt to be bypassed. </p></li><li>timeout : <span class='text-info'>INTEGER</span><p>Read timeout in milliseconds.  The app can set the timeout, but the value must be within the threshold set by the payment device. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>Success or Failure depending upon outcome of function </p></li><li>errorName : <span class='text-info'>STRING</span><p>If the status is error, this contains the ErrorName associated with that error.
           </p></li><li>tip : <span class='text-info'>FLOAT</span><p>If a tip was input, this will contain that value, 0.00 otherwise </p></li><li>cashBack : <span class='text-info'>FLOAT</span><p>If cashback is asked for, this contains the amount given. </p></li><li>surchargeIndicator : <span class='text-info'>STRING</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.promptAdditionalInfo(<span class="text-info">HASH</span> propertyMap)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.MobilePayment.promptAdditionalInfo(<span class="text-info">HASH</span> propertyMap)</code> 


### promptMenu(<span class="text-info">HASH</span> propertyMap)
Displays two lines of messages on the PAYMENT device and provides a menu with a maximum of 4 choices. This is asynchronous call. The character "|" not allowed in the message strings and it is used as special character in the EMDK for PD40-100.

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
Requests for a PIN and gets the encrypted PIN block. The encrypted data will be returned only if a debit key is injected into the payment device. This is asynchronous call  Note: The character "|" not allowed in the message strings for PD40-100 payment device and it is used as special character in the in the EMDK for PD40-100 device. Requesting promptPin() continuously may pop up the timer on PD40-100 payment device for security reasons and application should wait for this before performing any other actions.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>The properties associated with promptPin. </p></li><ul><li>accountNumber : <span class='text-info'>STRING</span><p>The account number used with the entered PIN to create the encrypted PIN Block (8 to 19 alphanumeric digits inclusive). </p></li><li>minPINLength : <span class='text-info'>INTEGER</span><p>Minimum PIN Length.  A minimum length of 4 digits is required. </p></li><li>maxPINLength : <span class='text-info'>INTEGER</span><p>Maximum PIN Length.  A maximum length of 12 digits is allowed. </p></li><li>isPinOptional : <span class='text-info'>BOOLEAN</span><p>isPinOptional is always false. It is kept for future modification. </p></li><li>message1 : <span class='text-info'>STRING</span><p>Message 1 to be displayed on the PINPad (alternates with Message 2).  Maximum message length 21 characters. </p></li><li>message2 : <span class='text-info'>STRING</span><p>Message 2 to be displayed on the PINPad (alternates with Message 1).  Maximum message length 21 characters. </p></li><li>messageTitle : <span class='text-info'>STRING</span><p>Message Title to be displayed during PIN entry. </p></li><li>readTimeOut : <span class='text-info'>INTEGER</span><p>Read timeout in milliseconds.  App can set the timeout, but value must be within threshold set by the payment device. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

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
Reads the card data from the PAYMENT device through a swipe (MagStripe), insert (for smart cards). 
		This is asynchronous so the return data is passed back through the callback.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>The properties associated with reading card data. </p></li><ul><li>amount : <span class='text-info'>FLOAT</span><p>Amount for the transaction; this value is required to enable EMV contactless transactions.  Allowed upto a maximum of 7 digits. </p></li><li>otherAmount : <span class='text-info'>FLOAT</span><p>Any additional amount information for the transaction; this value is used only if EMV Contactless is supported.  Allowed upto a maximum of 7 digits </p></li><li>readMode : <span class='text-info'>INTEGER</span><p>Use the constants defined in the XML for use with READMODE </p></li><li>messageTitle : <span class='text-info'>STRING</span><p>The message Title to be displayed on the card data request. The maximum length is 18 characters. The character "|" not allowed. Please see remarks section. </p></li><li>message1 : <span class='text-info'>STRING</span><p>The custom message  to be displayed on the card data request. The maximum length is 18 characters. The character "|" not allowed.Please see remarks section. </p></li><li>message2 : <span class='text-info'>STRING</span><p>The custom message  to be displayed on the card data request. The maximum length is 18 characters. The character "|" not allowed.
						Please see remarks section.
						 </p></li><li>readTimeOut : <span class='text-info'>INTEGER</span><p>Read timeout in milliseconds.  App can set the timeout, but value used must be within the threshold set by the payment device. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>Will contain either success or error depending on outcome of call. </p></li><li>errorName : <span class='text-info'>STRING</span><p>If the status is error, this contains the ErrorName associated with that error.
           </p></li><li>accountNumber : <span class='text-info'>INTEGER</span><p> </p></li><li>cardHolderName : <span class='text-info'>STRING</span><p> </p></li><li>expiryDate : <span class='text-info'>STRING</span><p> </p></li><li>track1Data : <span class='text-info'>STRING</span><p> </p></li><li>track2Data : <span class='text-info'>STRING</span><p> </p></li><li>track3Data : <span class='text-info'>STRING</span><p> </p></li><li>tlvStrings : <span class='text-info'>ARRAY</span><p> </p></li><li>maskedPan : <span class='text-info'>STRING</span><p> </p></li></ul></ul>

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


### removeCard(<span class="text-info">STRING</span> message1, <span class="text-info">STRING</span> message2)
Instruct the user to remove the EMV card inserted in the payment device. This call prompts the user to remove the inserted EMV chip card and also clears the EMV data saved by readCardData method. If the card is NOT inserted, it will give success.

####Parameters
<ul><li>message1 : <span class='text-info'>STRING</span><p>The message which gives the information of type of card. </p></li><li>message2 : <span class='text-info'>STRING</span><p>The message which gives instructions to user for the removal of the card. 
           </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p> </p></li><li>errorName : <span class='text-info'>STRING</span><p>If the status is error, this contains the ErrorName associated with that error. </p></li></ul></ul>

####Returns
Synchronous Return:

* HASH : The results describes the succesfulness of the operation.<ul><li>status : <span class='text-info'>STRING</span><p> </p></li><li>errorName : <span class='text-info'>STRING</span><p>If the status is error, this contains the ErrorName associated with that error. </p></li></ul>

####Platforms

* Android

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.removeCard(<span class="text-info">STRING</span> message1, <span class="text-info">STRING</span> message2)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.MobilePayment.removeCard(<span class="text-info">STRING</span> message1, <span class="text-info">STRING</span> message2)</code> 


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


### setEmvTags(<span class="text-info">ARRAY</span> tagIds)
Sets tag information for the inserted card. Valid EMV tag IDs and tag values should be passed. Passing invalid EMV tag IDs or tag values may cause the payment device to go into unstable state or unknown behavior. The payment device has to be rebooted in order to continue normal operation.Before calling this method,readcarddata has to be called.

####Parameters
<ul><li>tagIds : <span class='text-info'>ARRAY</span><p>Array containing valid EMV tag IDs to be set on the inserted card.Before calling this method,readcarddata has to be called. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>Either SUCCESS or ERROR </p></li><li>errorName : <span class='text-info'>STRING</span><p>If the status is error, this contains the ErrorName associated with that error.
           </p></li></ul></ul>

####Returns
Synchronous Return:

* HASH<ul><li>status : <span class='text-info'>STRING</span><p>Either SUCCESS or ERROR </p></li><li>errorName : <span class='text-info'>STRING</span><p>If the status is error, this contains the ErrorName associated with that error.
           </p></li></ul>

####Platforms

* Android

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.setEmvTags(<span class="text-info">ARRAY</span> tagIds)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.MobilePayment.setEmvTags(<span class="text-info">ARRAY</span> tagIds)</code> 


### setLowBatteryThreshold(<span class="text-info">INTEGER</span> lowThreshold, <span class="text-info">STRING</span> lowBatterMessage)
Sets the acceptable low battery percent.  If the battery drops below this value, the device will not execute some of the commands.
			and it will return the error code indicating the battery is low.
		

####Parameters
<ul><li>lowThreshold : <span class='text-info'>INTEGER</span><p>Battery threshold value.  Below this value, some of the commands will not execute </p></li><li>lowBatterMessage : <span class='text-info'>STRING</span><p> The message to be displayed when the battery level goes below the low threshold. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p> </p></li><li>errorName : <span class='text-info'>STRING</span><p>If the status is error, this contains the ErrorName associated with that error. </p></li></ul></ul>

####Returns
Synchronous Return:

* HASH : The results object which contains the error code and the description if applicable.<ul><li>status : <span class='text-info'>STRING</span><p> </p></li><li>errorName : <span class='text-info'>STRING</span><p>If the status is error, this contains the ErrorName associated with that error. </p></li></ul>

####Platforms

* Android

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.setLowBatteryThreshold(<span class="text-info">INTEGER</span> lowThreshold, <span class="text-info">STRING</span> lowBatterMessage)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.MobilePayment.setLowBatteryThreshold(<span class="text-info">INTEGER</span> lowThreshold, <span class="text-info">STRING</span> lowBatterMessage)</code> 


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


### validateMac(<span class="text-info">STRING</span> u8MACBlock, <span class="text-info">INTEGER</span> langCode, <span class="text-info">STRING</span> u8TPKKey, <span class="text-info">STRING</span> u8TAKKey, <span class="text-info">STRING</span> message1, <span class="text-info">STRING</span> message2, <span class="text-info">STRING</span> u8MACData)
Validates the response MAC and displays any authorization messages returned by the host. This method is made Asynchronous call because it is taking more processing time and response will be returned via callback.

####Parameters
<ul><li>u8MACBlock : <span class='text-info'>STRING</span><p>8-character MAC Block to verify. This is the mac block returned by createMac api. </p></li><li>langCode : <span class='text-info'>INTEGER</span><p>Numeric value denoting the language code to use.  Refer to the constants section to see what code to use. Currently only 0 is supported. </p></li><li>u8TPKKey : <span class='text-info'>STRING</span><p>PIN (TPK) Key </p></li><li>u8TAKKey : <span class='text-info'>STRING</span><p>MAC (TAK) Key </p></li><li>message1 : <span class='text-info'>STRING</span><p>Message Line 1 (0-16 characters) </p></li><li>message2 : <span class='text-info'>STRING</span><p>Message Line 2 (0-16 characters) </p></li><li>u8MACData : <span class='text-info'>STRING</span><p>Buffer to hold all data to be MACd </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>SUCCESS or ERROR.
			 </p></li><li>errorName : <span class='text-info'>STRING</span><p>If the status is error, this contains the ErrorName associated with that error.
			 </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.validateMac(<span class="text-info">STRING</span> u8MACBlock, <span class="text-info">INTEGER</span> langCode, <span class="text-info">STRING</span> u8TPKKey, <span class="text-info">STRING</span> u8TAKKey, <span class="text-info">STRING</span> message1, <span class="text-info">STRING</span> message2, <span class="text-info">STRING</span> u8MACData)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.MobilePayment.validateMac(<span class="text-info">STRING</span> u8MACBlock, <span class="text-info">INTEGER</span> langCode, <span class="text-info">STRING</span> u8TPKKey, <span class="text-info">STRING</span> u8TAKKey, <span class="text-info">STRING</span> message1, <span class="text-info">STRING</span> message2, <span class="text-info">STRING</span> u8MACData)</code> 


##Constants


* SWIPEswipe Read Mode for use in readCardData
* INSERTinsert Read Mode for use in readCardData
* TOUCHtouch Read Mode for use in readCardData. Currently this is not supported.
* MANUALManual Mode for use in readCardData
* ALLall Read Mode for use in readCardData
* HOST_AUTHORIZEDHost Decision is HOST_AUTHORIZED
* HOST_DECLINEHost Decision is HOST_DECLINE
* CONNECT_FAILEDHost Decision is CONNECT_FAILED
* FORCE_DECLINEMerchant Decision is FORCE_DECLINE
* FORCE_ONLINEMerchant Decision is FORCE_ONLINE
* REQUEST_TCMerchant Decision is REQUEST_TC
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

##Remarks



###ReadCardData

                    
In Android, while method readCardData is being executed, either we can provide "messageTitle","message1","message2" all NULL or all filled. When all null, it will invoke the corresponding method, without having the message. 
                     
                

###General

                    
In Android, the behaviour of data returned by various APIS is totally dependent upon the version of binary installed in the PD40 device.
                     
                