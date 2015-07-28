#SmartCradle


## Overview
The SmartCradle API is used to set and retrieve attributes of the MC18 Cradle
## Enabling the API
There are two methods of enabling the SmartCradle API: 

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
To include single APIs, you must first include the `ebapi.js` in your HTML as well as the API file you want to use. For instance, to use the SmartCradle API, I would add the following code to my HTML file(s), assuming the API files have been copied to the same directory as the HTML.

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi.js"></script>
    <script type="text/javascript" charset="utf-8" src="eb.smartcradle.js"></script>

The ebapi.js file is necessary for all single API inclusions.
        


##Methods



### flashLed(<span class="text-info">HASH</span> propertyMap)
The LED can be flashed to identify device location without unlocking the cradle.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>The properties associated with reading card data. </p></li><ul><li>ledOnDuration : <span class='text-info'>INTEGER</span><p>During unlock the LEDs will flash, this is the on duration of that flash specified in milliseconds.  Set to 0 to prevent flashing and keep the LED off. In Android, this is in mSecs and the range is from 0 mSec(minimum) to 65535 mSec(maximum). </p></li><li>ledOffDuration : <span class='text-info'>INTEGER</span><p>During unlock the LEDs will flash, this is the off duration of that flash specified in milliseconds.  Set to 0 to prevent flashing.  If the on duration is non-zero and this parameter is zero then the LED will remain on when unlocked. In Android, this is in mSecs and the range is from 0 mSec(minimum) to 65535 mSec(maximum). </p></li><li>smoothingEffect : <span class='text-info'>BOOLEAN</span><p>Enables or Disables the smoothing effect of LED blinking. </p></li><li>ledFlashCount : <span class='text-info'>INTEGER</span><p>ledFlashCount is the no of count it will be flashed. This will take affect for valid values of ledOnDuration and ledOffDuration.  </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.SmartCradle.flashLed(<span class="text-info">HASH</span> propertyMap)</code> 


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
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.SmartCradle.getAllProperties()</code> 


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
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.SmartCradle.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code> 


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
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.SmartCradle.getProperty(<span class="text-info">STRING</span> propertyName)</code> 


### setProperties(<span class="text-info">HASH</span> propertyMap)
This method will set the values of a list of properties for the API class. The propertyName must be a valid property for the class and must also not be read only.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>Map of properties I want to set </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.SmartCradle.setProperties(<span class="text-info">HASH</span> propertyMap)</code> 


### setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)
This method will set the value of a property for the API class. The propertyName must be a valid property for the class and must also not be read only.

####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p>The one property name that I want to set </p></li><li>propertyValue : <span class='text-info'>STRING</span><p>The one property value that I want to set </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.SmartCradle.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code> 


### unlock(<span class="text-info">INTEGER</span> ledOnDuration, <span class="text-info">INTEGER</span> ledOffDuration, <span class="text-info">INTEGER</span> timeout)
Unlocks the terminal from the cradle for the specified period. For Android, the smoothing effect by default is false.

####Parameters
<ul><li>ledOnDuration : <span class='text-info'>INTEGER</span><p>During unlock the LEDs will flash, this is the on duration of that flash specified in milliseconds.  Set to 0 to prevent flashing and keep the LED off. In Android, this is in mSecs and the range is from 0 mSec(minimum) to 65535 mSec(maximum). </p></li><li>ledOffDuration : <span class='text-info'>INTEGER</span><p>During unlock the LEDs will flash, this is the off duration of that flash specified in milliseconds.  Set to 0 to prevent flashing.  If the on duration is non-zero and this parameter is zero then the LED will remain on when unlocked. In Android, this is in mSecs and the range is from 0 mSec(minimum) to 65535 mSec(maximum). </p></li><li>timeout : <span class='text-info'>INTEGER</span><p>The cradle will remain unlocked for the length of time in seconds specified by this value.  Specified in seconds.  Range 10 to 30 inclusive. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.SmartCradle.unlock(<span class="text-info">INTEGER</span> ledOnDuration, <span class="text-info">INTEGER</span> ledOffDuration, <span class="text-info">INTEGER</span> timeout)</code> 


### unlockEx(<span class="text-info">HASH</span> propertyMap)
Unlocks the terminal from the cradle for the specified period. For Android, the smoothing effect by default is false.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>The properties associated with reading card data. </p></li><ul><li>ledOnDuration : <span class='text-info'>INTEGER</span><p>During unlock the LEDs will flash, this is the on duration of that flash specified in milliseconds.  Set to 0 to prevent flashing and keep the LED off. In Android, this is in mSecs and the range is from 0 mSec(minimum) to 65535 mSec(maximum). </p></li><li>ledOffDuration : <span class='text-info'>INTEGER</span><p>During unlock the LEDs will flash, this is the off duration of that flash specified in milliseconds.  Set to 0 to prevent flashing.  If the on duration is non-zero and this parameter is zero then the LED will remain on when unlocked. In Android, this is in mSecs and the range is from 0 mSec(minimum) to 65535 mSec(maximum). </p></li><li>timeout : <span class='text-info'>INTEGER</span><p>The cradle will remain unlocked for the length of time in seconds specified by this value.  Specified in seconds.  Range 10 to 30 inclusive. </p></li><li>smoothingEffect : <span class='text-info'>BOOLEAN</span><p>Enables or Disables the smoothing effect of LED blinking. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.SmartCradle.unlockEx(<span class="text-info">HASH</span> propertyMap)</code> 


##Properties



###cApiVersion

####Type
<span class='text-info'>STRING</span> <span class='label label-warning'>Read Only</span>
####Description
CAPI version of the cradle. Not Applicable for Android.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.SmartCradle.cApiVersion</code>



####Platforms

* Android
* Windows CE

###chargeState

####Type
<span class='text-info'>STRING</span> 
####Description
Sets the charge state of the cradle.  Values can be either 'Fast' or 'Slow'.
####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.SmartCradle.SMART_CRADLE_FAST - String: fast The cradle will charge devices quickly.
* Constant: EB.SmartCradle.SMART_CRADLE_SLOW - String: slow The cradle will charge devices slowly.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.SmartCradle.chargeState</code>



####Platforms

* Android
* Windows CE

###columnId

####Type
<span class='text-info'>INTEGER</span> 
####Description
The current Column ID of the cradle in the matrix. In Android, the range of columnId is 0 to 255.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.SmartCradle.columnId</code>



####Platforms

* Android
* Windows CE

###driverVersion

####Type
<span class='text-info'>STRING</span> <span class='label label-warning'>Read Only</span>
####Description
Driver version of the cradle. Not Applicable for Android.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.SmartCradle.driverVersion</code>



####Platforms

* Android
* Windows CE

###firmwareVersion

####Type
<span class='text-info'>STRING</span> <span class='label label-warning'>Read Only</span>
####Description
Firmware version of the cradle.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.SmartCradle.firmwareVersion</code>



####Platforms

* Android
* Windows CE

###hardwareId

####Type
<span class='text-info'>INTEGER</span> <span class='label label-warning'>Read Only</span>
####Description
Hardware ID of the cradle
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.SmartCradle.hardwareId</code>



####Platforms

* Android
* Windows CE

###mfgDate

####Type
<span class='text-info'>STRING</span> <span class='label label-warning'>Read Only</span>
####Description
Manufacture date of the cradle in DD-MM-YY format. Not Applicable for Android.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.SmartCradle.mfgDate</code>



####Platforms

* Android
* Windows CE

###partNumber

####Type
<span class='text-info'>STRING</span> <span class='label label-warning'>Read Only</span>
####Description
Part number of the cradle.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.SmartCradle.partNumber</code>



####Platforms

* Android
* Windows CE

###rowId

####Type
<span class='text-info'>INTEGER</span> 
####Description
The current Row ID of the cradle in the matrix. In Android, the range of rowId is 0 to 255.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.SmartCradle.rowId</code>



####Platforms

* Android
* Windows CE

###serialNumber

####Type
<span class='text-info'>STRING</span> <span class='label label-warning'>Read Only</span>
####Description
Serial number of the cradle.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.SmartCradle.serialNumber</code>



####Platforms

* Android
* Windows CE

###wallId

####Type
<span class='text-info'>INTEGER</span> 
####Description
The current Wall ID of the cradle in the matrix. In Android, the range of wallId is 0 to 255.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.SmartCradle.wallId</code>



####Platforms

* Android
* Windows CE

##Remarks



###Flashing the Cradle LEDs
There is a hardware imposed limit to how quickly the cradle LEDs can be flashed for a quickly flashing LED it is recommended to set the on / off duration to 500ms.
                