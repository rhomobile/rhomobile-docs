#Push


## Overview
<p>The Push API provides access to Push messaging functionality</p>
<p>Use this API to give your application the ability to receive server initiated messages.</p>

<h2>Enabling the API</h2>

<p>In order to use this API you must include the following extension in your <code>build.yml</code>:</p>

<p>For APNS or GCM:</p>

<pre><code>:::ruby
capabilities: ["push"]
</code></pre>

<p>For RhoConnect Push Service:</p>

<pre><code>:::ruby
extensions: ["rhoconnect-push", "rhoconnect-client"]
For Win32(XPE) MSMQ(Microsoft Message Queue) and .Net Framework 3.5 must be installed on device to get it work.
</code></pre>

<h2>JavaScript Usage</h2>

<p>Be sure to review the <a href="/guide/api_js">JavaScript API Usage</a> guide for important information about using this API in JavaScript.</p>

<h2>Ruby Usage</h2>

<p>Be sure to review the <a href="/guide/api_ruby">Ruby API Usage</a> guide for important information about using this API in Ruby.</p>



##Methods



### enumerate()
Returns the push API objects configured within the application.

### getAllProperties()
This method will return all of object/value pairs for the propertyNames of the API class.

### getDefault()
This method will return an object that represents the default instance of the API Class. For example Camera.getDefault will return a Camera object that represents the default camera.

### getDeviceId()
Returns push token used to identify particular device.

### getProperties()
This method will return a set of object/value pairs for the list of the propertyName that is passed in. The propertyNames must be a valid property of the API class.

### getProperty()
This method will return the value of the propertyName that is passed in. The propertyName must be a valid property of the API class.

### setDefault()
This method allows you to set the attributes of the default object instance by passing in an object of the same class.

### setProperties()
This method will set the values of a list of properties for the API class. The propertyName must be a valid property for the class and must also not be read only.

### setProperty()
This method will set the value of a property for the API class. The propertyName must be a valid property for the class and must also not be read only.

### startNotifications()
Start listening for push messages, errors or other push related events.

### stopNotifications()
Stop listening push events.