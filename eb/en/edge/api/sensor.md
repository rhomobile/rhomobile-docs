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

### getProperties()
This method will return a set of object/value pairs for the list of the propertyName that is passed in. The propertyNames must be a valid property of the API class.

### getProperty()
This method will return the value of the propertyName that is passed in. The propertyName must be a valid property of the API class.

### makeSensorByType()
Return the new sensor object by type.

### readData()
Read current sensor data from the sensor object retrieved by using makeSensorByType.

### setProperties()
This method will set the values of a list of properties for the API class. The propertyName must be a valid property for the class and must also not be read only.

### setProperty()
This method will set the value of a property for the API class. The propertyName must be a valid property for the class and must also not be read only.

### start()
This enables the sensor data retrieval. Call start on the instance returned from the makeSensorByType.

### stop()
Stops listening to the sensor retrieved by using makeSensorType. On Windows Mobile/CE its recommended to call stop on all retrieved sensor objects before exiting a page.