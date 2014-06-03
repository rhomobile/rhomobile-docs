#AudioCapture


## Overview
<p>Audio capture API</p>
<h2>Enabling the API</h2>

<p>In order to use this API you must include the following extension in your <code>build.yml</code></p>

<pre><code>:::ruby
extensions: ["audiocapture"]
</code></pre>

<h2>JavaScript Usage</h2>

<p>Be sure to review the <a href="/guide/api_js">JavaScript API Usage</a> guide for important information about using this API in JavaScript.</p>

<h2>Ruby Usage</h2>

<p>Be sure to review the <a href="/guide/api_ruby">Ruby API Usage</a> guide for important information about using this API in Ruby.</p>



##Methods



### cancel()
Cancel audio recording. During recording if 'cancel' method is called, the status of recording will be 'cancel' in the callback returning parameter of 'start' method. No file is saved. In android, it will delete the file if it exists.

### getAllProperties()
This method will return all of object/value pairs for the propertyNames of the API class.

### getDefault()
This method will return an object that represents the default instance of the API Class. For example Camera.getDefault will return a Camera object that represents the default camera.

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

### start()
Starts capturing audio until either 'stop' is received, or 'maxDuration' is reached. The successful recording will set 'ok' status and unsuccessful recording will set 'cancel' or 'error' status in the callback returning parameters. If 'cancel' method is called during recording, 'cancel' status will be set in the callback returning parameters. In order to restart the audio capture, if the audio capturing is already in process, it is mandatory to call 'stop' or 'cancel' method before calling 'start' method again.

### stop()
Stop audio recording. During recording if 'stop' method is called, the status of recording will be 'ok' in the callback returning parameter of 'start' method. The file is saved in user provided location.