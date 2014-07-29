#Sensor


## Overview
<p>The Sensors extension is used to retrieve the raw data values of the specified sensors (accelerometer, tilt angle, device orientation, motion, eCompass, magnetometer, gyroscope, ambient light, proximity, proximity long range, pressure, temperature, humidity, gravity, linear acceleration, rotation, orientation etc.) from the device. To use this, you have to first call makeSensorByType to get an instance of that sensor. Then you can use the start and stop methods on that instance.</p>

<h2>Enabling the API</h2>

<p>In order to use this API you must include the following extension in your <code>build.yml</code>.</p>

<pre><code>:::ruby
extensions: ["sensor"]
</code></pre>

<h2>JavaScript Usage</h2>

<p>Be sure to review the <a href="/guide/api_js">JavaScript API Usage</a> guide for important information about using this API in JavaScript.</p>

<h2>Ruby Usage</h2>

<p>Be sure to review the <a href="/guide/api_ruby">Ruby API Usage</a> guide for important information about using this API in Ruby.</p>



##Methods



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
* Windows Embedded

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.getAllProperties()</code></li></ul></li></ul>

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
* Windows Embedded

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code></li></ul></li></ul>

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
* Windows Embedded

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.getProperty(<span class="text-info">STRING</span> propertyName)</code></li></ul></li></ul>

### makeSensorByType(<span class="text-info">STRING</span> type)
Return the new sensor object by type.

####Parameters
<ul><li>type : <span class='text-info'>STRING</span><p>
Sensor type. Use the appropriate constants to get the sensor type. In the case of accelerometer use SENSOR_TYPE_ACCELEROMETER. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>SELF_INSTANCE</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>SELF_INSTANCE : 
Returns a sensor object for the sensor type passed as parameter. You can use the type field along with the Rho.Sensor Constants to see what type of sensor is returned.</li></ul>

####Platforms

* Android
* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.Sensor.makeSensorByType(<span class="text-info">STRING</span> type)</code> </li></ul></li></ul>

### readData()
Read current sensor data from the sensor object retrieved by using makeSensorByType.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>HASH : 
Current sensor data - format is the same with callback specified for start method.</li></ul>

####Platforms

* Android
* Windows Embedded

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.readData()</code></li></ul></li></ul>

### setProperties(<span class="text-info">HASH</span> propertyMap)
This method will set the values of a list of properties for the API class. The propertyName must be a valid property for the class and must also not be read only.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>
Map of properties I want to set </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Embedded

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.setProperties(<span class="text-info">HASH</span> propertyMap)</code></li></ul></li></ul>

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
* Windows Embedded

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code></li></ul></li></ul>

### start()
This enables the sensor data retrieval. Call start on the instance returned from the makeSensorByType.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>
Status: ok, error. </p></li><li>message : <span class='text-info'>STRING</span><p>
Only if status=error, contain error message. </p></li><li>accelerometer_x : <span class='text-info'>FLOAT</span><p>
X co-ordinate value of the Accelerometer sensor in SI units (m/s^2) </p></li><li>accelerometer_y : <span class='text-info'>FLOAT</span><p>
Y co-ordinate value of the Accelerometer sensor in SI units (m/s^2) </p></li><li>accelerometer_z : <span class='text-info'>FLOAT</span><p>
Z co-ordinate value of the Accelerometer sensor in SI units (m/s^2) </p></li><li>tiltangle_x : <span class='text-info'>FLOAT</span><p>
X co-ordinate value of the tiltangle sensor in degrees units. </p></li><li>tiltangle_y : <span class='text-info'>FLOAT</span><p>
Y co-ordinate value of the tiltangle sensor in degrees units. </p></li><li>tiltangle_z : <span class='text-info'>FLOAT</span><p>
Z co-ordinate value of the tiltangle sensor in degrees units. </p></li><li>deviceorientation_value : <span class='text-info'>STRING</span><p>
The values of the Orientation sensor. Possible values include Portrait Down, Portrait Up, Landscape Left, Landscape Right, Face Up, Face Down. Applicable only for Motorola Windows Mobile/CE devices with Sensor support. </p></li><li>motion_value : <span class='text-info'>STRING</span><p>
Value from the Motion sensor. </p></li><li>ecompass_value : <span class='text-info'>STRING</span><p>
Value from the E-Compass sensor. </p></li><li>magnetometer_x : <span class='text-info'>FLOAT</span><p>
X value of the magnetometer sensor in micro-Tesla (uT) units. </p></li><li>magnetometer_y : <span class='text-info'>FLOAT</span><p>
Y value of the magnetometer sensor in micro-Tesla (uT) units. </p></li><li>magnetometer_z : <span class='text-info'>FLOAT</span><p>
Z value of the magnetometer sensor in micro-Tesla (uT) units. </p></li><li>gyroscope_x : <span class='text-info'>FLOAT</span><p>
X co-ordinate value of the gyroscope sensor in radians/second. </p></li><li>gyroscope_y : <span class='text-info'>FLOAT</span><p>
X co-ordinate value of the gyroscope sensor in radians/second. </p></li><li>gyroscope_z : <span class='text-info'>FLOAT</span><p>
X co-ordinate value of the gyroscope sensor in radians/second. </p></li><li>ambientlight_value : <span class='text-info'>STRING</span><p>
Value of the ambient Light sensor in SI lux units. </p></li><li>proximity_value : <span class='text-info'>STRING</span><p>
Value of the proximity sensor in centimeters. </p></li><li>proximitylongrange_value : <span class='text-info'>STRING</span><p>
Value of the proximitylongrange sensor. </p></li><li>pressure_value : <span class='text-info'>STRING</span><p>
Value of the pressure sensor in hPa (millibar) units. </p></li><li>temperature_value : <span class='text-info'>STRING</span><p>
Value of the temperature sensor in degree Celsius units. </p></li><li>humidity_value : <span class='text-info'>STRING</span><p>
Value of the humidity sensor as a percentage. </p></li><li>gravity_x : <span class='text-info'>FLOAT</span><p>
X co-ordinate value of the gravity sensor in SI units (m/s^2) </p></li><li>gravity_y : <span class='text-info'>FLOAT</span><p>
Y co-ordinate value of the gravity sensor in SI units (m/s^2) </p></li><li>gravity_z : <span class='text-info'>FLOAT</span><p>
Z co-ordinate value of the gravity sensor in SI units (m/s^2) </p></li><li>linearacceleration_x : <span class='text-info'>FLOAT</span><p>
X co-ordinate value of the linear acceleration sensor in SI units (m/s^2) </p></li><li>linearacceleration_y : <span class='text-info'>FLOAT</span><p>
Y co-ordinate value of the linear acceleration sensor in SI units (m/s^2) </p></li><li>linearacceleration_z : <span class='text-info'>FLOAT</span><p>
Z co-ordinate value of the linear acceleration sensor in SI units (m/s^2) </p></li><li>rotation_x : <span class='text-info'>FLOAT</span><p>
X co-ordinate value of the rotation sensor as a combination of an angle and an axis. </p></li><li>rotation_y : <span class='text-info'>FLOAT</span><p>
Y co-ordinate value of the rotation sensor as a combination of an angle and an axis. </p></li><li>rotation_z : <span class='text-info'>FLOAT</span><p>
Z co-ordinate value of the rotation sensor as a combination of an angle and an axis. </p></li><li>orientation_x : <span class='text-info'>FLOAT</span><p>
X co-ordinate value of the orientation sensor in degrees units. </p></li><li>orientation_y : <span class='text-info'>FLOAT</span><p>
Y co-ordinate value of the orientation sensor in degrees units. </p></li><li>orientation_z : <span class='text-info'>FLOAT</span><p>
Z co-ordinate value of the orientation sensor in degrees units. </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Embedded

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.start()</code></li></ul></li></ul>

### stop()
Stops listening to the sensor retrieved by using makeSensorType. On Windows Mobile/CE its recommended to call stop on all retrieved sensor objects before exiting a page.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Embedded

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.stop()</code></li></ul></li></ul>

##Properties



###minimumGap

####Type
<span class='text-info'>INTEGER</span> 
####Description

The minimum amount of time gap between two sensor update events, specified in milliseconds. The interval cannot be set to less than 200 milliseconds, if a value of less than 200 milliseconds is specified, the interval will be defaulted to 200 milliseconds.
####Params
<p><strong>Default:</strong> 200</p>
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.minimumGap</code></li></ul></li></ul>

###status

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

Current status: not_ready, ready, started, error etc.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.status</code></li></ul></li></ul>

###type

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

Type of current sensor: Accelerometer, Magnetometer, etc.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.type</code></li></ul></li></ul>

##Constants


* SENSOR_TYPE_ACCELEROMETER
Accelerometer sensor type.
* SENSOR_TYPE_TILT_ANGLE
TiltAngle sensor type.
* SENSOR_TYPE_DEVICE_ORIENTATION
DeviceOrientation sensor type.
* SENSOR_TYPE_MOTION
Motion sensor type.
* SENSOR_TYPE_ECOMPASS
ECompass sensor type.
* SENSOR_TYPE_MAGNETOMETER
Magnetometer sensor type.
* SENSOR_TYPE_GYROSCOPE
Gyroscope sensor type.
* SENSOR_TYPE_AMBIENT_LIGHT
AmbientLight sensor type.
* SENSOR_TYPE_PROXIMITY
Proximity sensor type.
* SENSOR_TYPE_PROXIMITY_LONG_RANGE
ProximityLongRange sensor type.
* SENSOR_TYPE_PRESSURE
Pressure sensor type.
* SENSOR_TYPE_TEMPERATURE
Temperature sensor type.
* SENSOR_TYPE_HUMIDITY
Humidity sensor type.
* SENSOR_TYPE_GRAVITY
Gravity sensor type.
* SENSOR_TYPE_LINEAR_ACCELERATION
LinearAcceleration sensor type.
* SENSOR_TYPE_ROTATION
Rotation sensor type.
* SENSOR_TYPE_ORIENTATION
Orientation sensor type.
* SENSOR_STATUS_NOT_READY
Sensor is not ready for start - may be some type of sensor require time for initializing / calibrating of HW etc.
* SENSOR_STATUS_READY
Sensor is ready to start listening.
* SENSOR_STATUS_STARTED
Sensor already started to listening.
* SENSOR_STATUS_ERROR
Sensor in error state.

##Remarks



###General
As this extension returns the raw sensor values reported by the operating system the values might differ between platforms. Also as some of the sensor values change rapidly the minimum gap between two updates should be specified as a reasonable value, otherwise there can be a performance impact.

###Supporting Sensors
In Android, as supported sensors could vary from product to product so please refer to Device's PRD/TRD for the list of supported sensors in that particular device.

##Examples



###Basic Example

The below example gets the Accelerometer values for every 500 milliseconds.