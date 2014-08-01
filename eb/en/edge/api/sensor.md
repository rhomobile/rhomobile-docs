#Sensor


## Overview
The Sensors extension is used to retrieve the raw data values of the specified sensors (accelerometer, tilt angle, device orientation, motion, eCompass, magnetometer, gyroscope, ambient light, proximity, proximity long range, pressure, temperature, humidity, gravity, linear acceleration, rotation, orientation etc.) from the device. To use this, you have to first call makeSensorByType to get an instance of that sensor. Then you can use the start and stop methods on that instance.
        
## Enabling the API
In order to use this API you must TBD INSERT Eb specific instructions here

        


##Methods



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

### makeSensorByType(<span class="text-info">STRING</span> type)
<p>Return the new sensor object by type.</p>


####Parameters
<ul><li>type : <span class='text-info'>STRING</span><p>
<p>Sensor type. Use the appropriate constants to get the sensor type. In the case of accelerometer use SENSOR_TYPE_ACCELEROMETER.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>SELF_INSTANCE</span></p><ul></ul>

####Returns
Synchronous Return:

* SELF_INSTANCE : 
<p>Returns a sensor object for the sensor type passed as parameter. You can use the type field along with the Rho.Sensor Constants to see what type of sensor is returned.</p>


####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Sensor.makeSensorByType(<span class="text-info">STRING</span> type)</code> 


### readData()
<p>Read current sensor data from the sensor object retrieved by using makeSensorByType.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul></ul>

####Returns
Synchronous Return:

* HASH : 
<p>Current sensor data &ndash; format is the same with callback specified for start method.</p>


####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.readData()</code>

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

### start()
<p>This enables the sensor data retrieval. Call start on the instance returned from the makeSensorByType.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>
<p>Status: ok, error.</p>
 </p></li><li>message : <span class='text-info'>STRING</span><p>
<p>Only if status=error, contain error message.</p>
 </p></li><li>accelerometer_x : <span class='text-info'>FLOAT</span><p>
<p>X co-ordinate value of the Accelerometer sensor in SI units (m/s<sup>2)</sup></p>
 </p></li><li>accelerometer_y : <span class='text-info'>FLOAT</span><p>
<p>Y co-ordinate value of the Accelerometer sensor in SI units (m/s<sup>2)</sup></p>
 </p></li><li>accelerometer_z : <span class='text-info'>FLOAT</span><p>
<p>Z co-ordinate value of the Accelerometer sensor in SI units (m/s<sup>2)</sup></p>
 </p></li><li>tiltangle_x : <span class='text-info'>FLOAT</span><p>
<p>X co-ordinate value of the tiltangle sensor in degrees units.</p>
 </p></li><li>tiltangle_y : <span class='text-info'>FLOAT</span><p>
<p>Y co-ordinate value of the tiltangle sensor in degrees units.</p>
 </p></li><li>tiltangle_z : <span class='text-info'>FLOAT</span><p>
<p>Z co-ordinate value of the tiltangle sensor in degrees units.</p>
 </p></li><li>deviceorientation_value : <span class='text-info'>STRING</span><p>
<p>The values of the Orientation sensor. Possible values include Portrait Down, Portrait Up, Landscape Left, Landscape Right, Face Up, Face Down. Applicable only for Motorola Windows Mobile/CE devices with Sensor support.</p>
 </p></li><li>motion_value : <span class='text-info'>STRING</span><p>
<p>Value from the Motion sensor.</p>
 </p></li><li>ecompass_value : <span class='text-info'>STRING</span><p>
<p>Value from the E-Compass sensor.</p>
 </p></li><li>magnetometer_x : <span class='text-info'>FLOAT</span><p>
<p>X value of the magnetometer sensor in micro-Tesla (uT) units.</p>
 </p></li><li>magnetometer_y : <span class='text-info'>FLOAT</span><p>
<p>Y value of the magnetometer sensor in micro-Tesla (uT) units.</p>
 </p></li><li>magnetometer_z : <span class='text-info'>FLOAT</span><p>
<p>Z value of the magnetometer sensor in micro-Tesla (uT) units.</p>
 </p></li><li>gyroscope_x : <span class='text-info'>FLOAT</span><p>
<p>X co-ordinate value of the gyroscope sensor in radians/second.</p>
 </p></li><li>gyroscope_y : <span class='text-info'>FLOAT</span><p>
<p>X co-ordinate value of the gyroscope sensor in radians/second.</p>
 </p></li><li>gyroscope_z : <span class='text-info'>FLOAT</span><p>
<p>X co-ordinate value of the gyroscope sensor in radians/second.</p>
 </p></li><li>ambientlight_value : <span class='text-info'>STRING</span><p>
<p>Value of the ambient Light sensor in SI lux units.</p>
 </p></li><li>proximity_value : <span class='text-info'>STRING</span><p>
<p>Value of the proximity sensor in centimeters.</p>
 </p></li><li>proximitylongrange_value : <span class='text-info'>STRING</span><p>
<p>Value of the proximitylongrange sensor.</p>
 </p></li><li>pressure_value : <span class='text-info'>STRING</span><p>
<p>Value of the pressure sensor in hPa (millibar) units.</p>
 </p></li><li>temperature_value : <span class='text-info'>STRING</span><p>
<p>Value of the temperature sensor in degree Celsius units.</p>
 </p></li><li>humidity_value : <span class='text-info'>STRING</span><p>
<p>Value of the humidity sensor as a percentage.</p>
 </p></li><li>gravity_x : <span class='text-info'>FLOAT</span><p>
<p>X co-ordinate value of the gravity sensor in SI units (m/s<sup>2)</sup></p>
 </p></li><li>gravity_y : <span class='text-info'>FLOAT</span><p>
<p>Y co-ordinate value of the gravity sensor in SI units (m/s<sup>2)</sup></p>
 </p></li><li>gravity_z : <span class='text-info'>FLOAT</span><p>
<p>Z co-ordinate value of the gravity sensor in SI units (m/s<sup>2)</sup></p>
 </p></li><li>linearacceleration_x : <span class='text-info'>FLOAT</span><p>
<p>X co-ordinate value of the linear acceleration sensor in SI units (m/s<sup>2)</sup></p>
 </p></li><li>linearacceleration_y : <span class='text-info'>FLOAT</span><p>
<p>Y co-ordinate value of the linear acceleration sensor in SI units (m/s<sup>2)</sup></p>
 </p></li><li>linearacceleration_z : <span class='text-info'>FLOAT</span><p>
<p>Z co-ordinate value of the linear acceleration sensor in SI units (m/s<sup>2)</sup></p>
 </p></li><li>rotation_x : <span class='text-info'>FLOAT</span><p>
<p>X co-ordinate value of the rotation sensor as a combination of an angle and an axis.</p>
 </p></li><li>rotation_y : <span class='text-info'>FLOAT</span><p>
<p>Y co-ordinate value of the rotation sensor as a combination of an angle and an axis.</p>
 </p></li><li>rotation_z : <span class='text-info'>FLOAT</span><p>
<p>Z co-ordinate value of the rotation sensor as a combination of an angle and an axis.</p>
 </p></li><li>orientation_x : <span class='text-info'>FLOAT</span><p>
<p>X co-ordinate value of the orientation sensor in degrees units.</p>
 </p></li><li>orientation_y : <span class='text-info'>FLOAT</span><p>
<p>Y co-ordinate value of the orientation sensor in degrees units.</p>
 </p></li><li>orientation_z : <span class='text-info'>FLOAT</span><p>
<p>Z co-ordinate value of the orientation sensor in degrees units.</p>
 </p></li></ul></ul>

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
<p>Stops listening to the sensor retrieved by using makeSensorType. On Windows Mobile/CE its recommended to call stop on all retrieved sensor objects before exiting a page.</p>


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

<p>The minimum amount of time gap between two sensor update events, specified in milliseconds. The interval cannot be set to less than 200 milliseconds, if a value of less than 200 milliseconds is specified, the interval will be defaulted to 200 milliseconds.</p>

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

<p>Current status: not_ready, ready, started, error etc.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.status</code>


####Platforms

* Android
* Windows Mobile/CE

###type

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>Type of current sensor: Accelerometer, Magnetometer, etc.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.type</code>


####Platforms

* Android
* Windows Mobile/CE

##Constants


* SENSOR_TYPE_ACCELEROMETER
<p>Accelerometer sensor type.</p>

* SENSOR_TYPE_TILT_ANGLE
<p>TiltAngle sensor type.</p>

* SENSOR_TYPE_DEVICE_ORIENTATION
<p>DeviceOrientation sensor type.</p>

* SENSOR_TYPE_MOTION
<p>Motion sensor type.</p>

* SENSOR_TYPE_ECOMPASS
<p>ECompass sensor type.</p>

* SENSOR_TYPE_MAGNETOMETER
<p>Magnetometer sensor type.</p>

* SENSOR_TYPE_GYROSCOPE
<p>Gyroscope sensor type.</p>

* SENSOR_TYPE_AMBIENT_LIGHT
<p>AmbientLight sensor type.</p>

* SENSOR_TYPE_PROXIMITY
<p>Proximity sensor type.</p>

* SENSOR_TYPE_PROXIMITY_LONG_RANGE
<p>ProximityLongRange sensor type.</p>

* SENSOR_TYPE_PRESSURE
<p>Pressure sensor type.</p>

* SENSOR_TYPE_TEMPERATURE
<p>Temperature sensor type.</p>

* SENSOR_TYPE_HUMIDITY
<p>Humidity sensor type.</p>

* SENSOR_TYPE_GRAVITY
<p>Gravity sensor type.</p>

* SENSOR_TYPE_LINEAR_ACCELERATION
<p>LinearAcceleration sensor type.</p>

* SENSOR_TYPE_ROTATION
<p>Rotation sensor type.</p>

* SENSOR_TYPE_ORIENTATION
<p>Orientation sensor type.</p>

* SENSOR_STATUS_NOT_READY
<p>Sensor is not ready for start &ndash; may be some type of sensor require time for initializing / calibrating of HW etc.</p>

* SENSOR_STATUS_READY
<p>Sensor is ready to start listening.</p>

* SENSOR_STATUS_STARTED
<p>Sensor already started to listening.</p>

* SENSOR_STATUS_ERROR
<p>Sensor in error state.</p>


##Remarks



###General
<p>As this extension returns the raw sensor values reported by the operating system the values might differ between platforms. Also as some of the sensor values change rapidly the minimum gap between two updates should be specified as a reasonable value, otherwise there can be a performance impact.</p>


###Supporting Sensors
<p>In Android, as supported sensors could vary from product to product so please refer to Device&rsquo;s PRD/TRD for the list of supported sensors in that particular device.</p>
