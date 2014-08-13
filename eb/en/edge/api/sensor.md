#Sensor


## Overview
The Sensors extension is used to retrieve the raw data values of the specified sensors (accelerometer, tilt angle, device orientation, motion, eCompass, magnetometer, gyroscope, ambient light, proximity, proximity long range, pressure, temperature, humidity, gravity, linear acceleration, rotation, orientation etc.) from the device. To use this, you have to first call makeSensorByType to get an instance of that sensor. Then you can use the start and stop methods on that instance.
        
## Enabling the API
There are two methods of enabling the Sensor API: 

* Include all ebapi modules or 
* Include only the API modules you need 

For either of these methods, you'll need to include files from the `/Enterprise Browser/JavaScript Files/Enterprise Browser` directory on the computer that you installed the Motorola Enterprise Browser.

### Include all JS API modules
To include all JS APIs, you must copy the ebapi-modules.js file to a location accessible by your app's files and include the JavaScript file in your app. For instance, to include the modules file in your index.html, with the file in the same directory as your index.html, you would add the following line to the <head> section of your index.html:

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi-modules.js"></script>

> Note: that the pathing for this file is relative to the current page.

This will define the EB class within the page. Any page you need to use the modules will need to have the .js file included in this fashion.

### Include only the modules you need
To include single APIs, you must first include the `ebapi.js` in your HTML as well as the API file you want to use. For instance, to use the Sensor API, I would add the following code to my HTML file(s), assuming the API files have been copied to the same directory as the HTML.

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi.js"></script>
    <script type="text/javascript" charset="utf-8" src="eb.sensor.js"></script>

The ebapi.js file is necessary for all single API inclusions.

        


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

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getAllProperties()</code>

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
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code>

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
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getProperty(<span class="text-info">STRING</span> propertyName)</code>

### makeSensorByType(<span class="text-info">STRING</span> type)
Return the new sensor object by type.

####Parameters
<ul><li>type : <span class='text-info'>STRING</span><p>Sensor type. Use the appropriate constants to get the sensor type. In the case of accelerometer use SENSOR_TYPE_ACCELEROMETER. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>SELF_INSTANCE</span></p><ul></ul>

####Returns
Synchronous Return:

* SELF_INSTANCE : Returns a sensor object for the sensor type passed as parameter. You can use the type field along with the Rho.Sensor Constants to see what type of sensor is returned.

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Sensor.makeSensorByType(<span class="text-info">STRING</span> type)</code> 


### readData()
Read current sensor data from the sensor object retrieved by using makeSensorByType.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul></ul>

####Returns
Synchronous Return:

* HASH : Current sensor data - format is the same with callback specified for start method.

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.readData()</code>

### setProperties(<span class="text-info">HASH</span> propertyMap)
This method will set the values of a list of properties for the API class. The propertyName must be a valid property for the class and must also not be read only.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>Map of properties I want to set </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.setProperties(<span class="text-info">HASH</span> propertyMap)</code>

### setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)
This method will set the value of a property for the API class. The propertyName must be a valid property for the class and must also not be read only.

####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p>The one property name that I want to set </p></li><li>propertyValue : <span class='text-info'>STRING</span><p>The one property value that I want to set </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code>

### start()
This enables the sensor data retrieval. Call start on the instance returned from the makeSensorByType.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>Status: ok, error. </p></li><li>message : <span class='text-info'>STRING</span><p>Only if status=error, contain error message. </p></li><li>accelerometer_x : <span class='text-info'>FLOAT</span><p>X co-ordinate value of the Accelerometer sensor in SI units (m/s^2) </p></li><li>accelerometer_y : <span class='text-info'>FLOAT</span><p>Y co-ordinate value of the Accelerometer sensor in SI units (m/s^2) </p></li><li>accelerometer_z : <span class='text-info'>FLOAT</span><p>Z co-ordinate value of the Accelerometer sensor in SI units (m/s^2) </p></li><li>tiltangle_x : <span class='text-info'>FLOAT</span><p>X co-ordinate value of the tiltangle sensor in degrees units. </p></li><li>tiltangle_y : <span class='text-info'>FLOAT</span><p>Y co-ordinate value of the tiltangle sensor in degrees units. </p></li><li>tiltangle_z : <span class='text-info'>FLOAT</span><p>Z co-ordinate value of the tiltangle sensor in degrees units. </p></li><li>deviceorientation_value : <span class='text-info'>STRING</span><p>The values of the Orientation sensor. Possible values include Portrait Down, Portrait Up, Landscape Left, Landscape Right, Face Up, Face Down. Applicable only for Motorola Windows Mobile/CE devices with Sensor support. </p></li><li>motion_value : <span class='text-info'>STRING</span><p>Value from the Motion sensor. </p></li><li>ecompass_value : <span class='text-info'>STRING</span><p>Value from the E-Compass sensor. </p></li><li>magnetometer_x : <span class='text-info'>FLOAT</span><p>X value of the magnetometer sensor in micro-Tesla (uT) units. </p></li><li>magnetometer_y : <span class='text-info'>FLOAT</span><p>Y value of the magnetometer sensor in micro-Tesla (uT) units. </p></li><li>magnetometer_z : <span class='text-info'>FLOAT</span><p>Z value of the magnetometer sensor in micro-Tesla (uT) units. </p></li><li>gyroscope_x : <span class='text-info'>FLOAT</span><p>X co-ordinate value of the gyroscope sensor in radians/second. </p></li><li>gyroscope_y : <span class='text-info'>FLOAT</span><p>X co-ordinate value of the gyroscope sensor in radians/second. </p></li><li>gyroscope_z : <span class='text-info'>FLOAT</span><p>X co-ordinate value of the gyroscope sensor in radians/second. </p></li><li>ambientlight_value : <span class='text-info'>STRING</span><p>Value of the ambient Light sensor in SI lux units. </p></li><li>proximity_value : <span class='text-info'>STRING</span><p>Value of the proximity sensor in centimeters. </p></li><li>proximitylongrange_value : <span class='text-info'>STRING</span><p>Value of the proximitylongrange sensor. </p></li><li>pressure_value : <span class='text-info'>STRING</span><p>Value of the pressure sensor in hPa (millibar) units. </p></li><li>temperature_value : <span class='text-info'>STRING</span><p>Value of the temperature sensor in degree Celsius units. </p></li><li>humidity_value : <span class='text-info'>STRING</span><p>Value of the humidity sensor as a percentage. </p></li><li>gravity_x : <span class='text-info'>FLOAT</span><p>X co-ordinate value of the gravity sensor in SI units (m/s^2) </p></li><li>gravity_y : <span class='text-info'>FLOAT</span><p>Y co-ordinate value of the gravity sensor in SI units (m/s^2) </p></li><li>gravity_z : <span class='text-info'>FLOAT</span><p>Z co-ordinate value of the gravity sensor in SI units (m/s^2) </p></li><li>linearacceleration_x : <span class='text-info'>FLOAT</span><p>X co-ordinate value of the linear acceleration sensor in SI units (m/s^2) </p></li><li>linearacceleration_y : <span class='text-info'>FLOAT</span><p>Y co-ordinate value of the linear acceleration sensor in SI units (m/s^2) </p></li><li>linearacceleration_z : <span class='text-info'>FLOAT</span><p>Z co-ordinate value of the linear acceleration sensor in SI units (m/s^2) </p></li><li>rotation_x : <span class='text-info'>FLOAT</span><p>X co-ordinate value of the rotation sensor as a combination of an angle and an axis. </p></li><li>rotation_y : <span class='text-info'>FLOAT</span><p>Y co-ordinate value of the rotation sensor as a combination of an angle and an axis. </p></li><li>rotation_z : <span class='text-info'>FLOAT</span><p>Z co-ordinate value of the rotation sensor as a combination of an angle and an axis. </p></li><li>orientation_x : <span class='text-info'>FLOAT</span><p>X co-ordinate value of the orientation sensor in degrees units. </p></li><li>orientation_y : <span class='text-info'>FLOAT</span><p>Y co-ordinate value of the orientation sensor in degrees units. </p></li><li>orientation_z : <span class='text-info'>FLOAT</span><p>Z co-ordinate value of the orientation sensor in degrees units. </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.start()</code>

### stop()
Stops listening to the sensor retrieved by using makeSensorType. On Windows Mobile/CE its recommended to call stop on all retrieved sensor objects before exiting a page.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.stop()</code>

##Properties



###minimumGap

####Type
<span class='text-info'>INTEGER</span> 
####Description
The minimum amount of time gap between two sensor update events, specified in milliseconds. The interval cannot be set to less than 200 milliseconds, if a value of less than 200 milliseconds is specified, the interval will be defaulted to 200 milliseconds.
####Params
<p><strong>Default:</strong> 200</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.minimumGap</code>


####Platforms

* Android
* Windows Mobile/CE

###status

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description
Current status: not_ready, ready, started, error etc.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.status</code>


####Platforms

* Android
* Windows Mobile/CE

###type

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description
Type of current sensor: Accelerometer, Magnetometer, etc.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.type</code>


####Platforms

* Android
* Windows Mobile/CE

##Constants


* SENSOR_TYPE_ACCELEROMETERAccelerometer sensor type.
* SENSOR_TYPE_TILT_ANGLETiltAngle sensor type.
* SENSOR_TYPE_DEVICE_ORIENTATIONDeviceOrientation sensor type.
* SENSOR_TYPE_MOTIONMotion sensor type.
* SENSOR_TYPE_ECOMPASSECompass sensor type.
* SENSOR_TYPE_MAGNETOMETERMagnetometer sensor type.
* SENSOR_TYPE_GYROSCOPEGyroscope sensor type.
* SENSOR_TYPE_AMBIENT_LIGHTAmbientLight sensor type.
* SENSOR_TYPE_PROXIMITYProximity sensor type.
* SENSOR_TYPE_PROXIMITY_LONG_RANGEProximityLongRange sensor type.
* SENSOR_TYPE_PRESSUREPressure sensor type.
* SENSOR_TYPE_TEMPERATURETemperature sensor type.
* SENSOR_TYPE_HUMIDITYHumidity sensor type.
* SENSOR_TYPE_GRAVITYGravity sensor type.
* SENSOR_TYPE_LINEAR_ACCELERATIONLinearAcceleration sensor type.
* SENSOR_TYPE_ROTATIONRotation sensor type.
* SENSOR_TYPE_ORIENTATIONOrientation sensor type.
* SENSOR_STATUS_NOT_READYSensor is not ready for start - may be some type of sensor require time for initializing / calibrating of HW etc.
* SENSOR_STATUS_READYSensor is ready to start listening.
* SENSOR_STATUS_STARTEDSensor already started to listening.
* SENSOR_STATUS_ERRORSensor in error state.

##Remarks



###General
As this extension returns the raw sensor values reported by the operating system the values might differ between platforms. Also as some of the sensor values change rapidly the minimum gap between two updates should be specified as a reasonable value, otherwise there can be a performance impact.

###Supporting Sensors
In Android, as supported sensors could vary from product to product so please refer to Device's PRD/TRD for the list of supported sensors in that particular device.