#SmartCradle


## Overview
The SmartCradle API is used to set and retrieve attributes of the MC18 CradleTBD.


##Methods



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

* Windows Mobile

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

* Windows Mobile

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

* Windows Mobile

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

* Windows Mobile

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

* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.SmartCradle.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code> 


### unlock(<span class="text-info">INTEGER</span> ledOnDuration, <span class="text-info">INTEGER</span> ledOffDuration, <span class="text-info">INTEGER</span> timeout)
Unlocks the terminal from the cradle for the specified period

####Parameters
<ul><li>ledOnDuration : <span class='text-info'>INTEGER</span><p>During unlock the LEDs will flash, this is the on duration of that flash specified in milliseconds.  Set to 0 to prevent flashing and keep the LED off. </p></li><li>ledOffDuration : <span class='text-info'>INTEGER</span><p>During unlock the LEDs will flash, this is the off duration of that flash specified in milliseconds.  Set to 0 to prevent flashing.  If the on duration is non-zero and this parameter is zero then the LED will remain on when unlocked. </p></li><li>timeout : <span class='text-info'>INTEGER</span><p>The cradle will remain unlocked for the length of time in seconds specified by this value.  Specified in seconds.  Range 10 to 30 inclusive. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.SmartCradle.unlock(<span class="text-info">INTEGER</span> ledOnDuration, <span class="text-info">INTEGER</span> ledOffDuration, <span class="text-info">INTEGER</span> timeout)</code> 


##Properties



###cApiVersion

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description
CAPI version of the cradle.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.SmartCradle.cApiVersion</code>



####Platforms

* Windows Mobile

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

* Windows Mobile

###columnId

####Type
<span class='text-info'>INTEGER</span> 
####Description
The current Column ID of the cradle in the matrix
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.SmartCradle.columnId</code>



####Platforms

* Windows Mobile

###driverVersion

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description
Driver version of the cradle.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.SmartCradle.driverVersion</code>



####Platforms

* Windows Mobile

###firmwareVersion

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description
Firmware version of the cradle.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.SmartCradle.firmwareVersion</code>



####Platforms

* Windows Mobile

###hardwareId

####Type
<span class='text-info'>INTEGER</span> <span class='label'>Read Only</span>
####Description
Hardware ID of the cradle
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.SmartCradle.hardwareId</code>



####Platforms

* Windows Mobile

###mfgDate

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description
Manufacture date of the cradle in DD-MM-YY format
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.SmartCradle.mfgDate</code>



####Platforms

* Windows Mobile

###partNumber

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description
Part number of the cradle.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.SmartCradle.partNumber</code>



####Platforms

* Windows Mobile

###rowId

####Type
<span class='text-info'>INTEGER</span> 
####Description
The current Row ID of the cradle in the matrix
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.SmartCradle.rowId</code>



####Platforms

* Windows Mobile

###serialNumber

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description
Serial number of the cradle.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.SmartCradle.serialNumber</code>



####Platforms

* Windows Mobile

###wallId

####Type
<span class='text-info'>INTEGER</span> 
####Description
The current Wall ID of the cradle in the matrix
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.SmartCradle.wallId</code>



####Platforms

* Windows Mobile

##Remarks



###Flashing the Cradle LEDs

					There is a hardware imposed limit to how quickly the cradle LEDs can be flashed for a quickly flashing LED it is recommended to set the on / off duration to 500ms.
                