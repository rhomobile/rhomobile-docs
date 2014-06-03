#Videocapture


## Overview
<p>captures video files from the default camera device.</p>
<p>Only the foreground RhoElements application is given access to capture video, when an application is sent to the background any capture that is in progress will be canceled and it will automatically relinquish control of the video hardware. When brought back to the foreground, an application previously using the video capture will have its previous configuration (eg. name etc.) reapplied to the plug-in automatically. Please note that any file transfer that is in progress continues even if the application is sent to the background.</p>

<h2>Enabling the API</h2>

<p>In order to use this API you must include the following extension in your <code>build.yml</code></p>

<pre><code>:::ruby
extensions: ["mediacapture"]
</code></pre>

<h2>JavaScript Usage</h2>

<p>Be sure to review the <a href="/guide/api_js">JavaScript API Usage</a> guide for important information about using this API in JavaScript</p>

<h2>Ruby Usage</h2>

<p>Be sure to review the <a href="/guide/api_ruby">Ruby API Usage</a> guide for important information about using this API in Ruby</p>



##Methods



### cancel()
Stops capturing video and discards any captured video data. No file transfer takes place if the video capture is canceled. NOTE: This is not applicable for Android and iOS as the video capture window is full screen and provides a button to cancel the video capture.

### enumerate()
Enumerates all the available cameras for capturing video.

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
Starts capturing video until either 'stop' is received, or 'duration' is reached. NOTE: On Android this meta tag wouldn't immediately start recording and presents a preview window with controls (start, stop and cancel) for recording.

### stop()
Stops capturing video and either saves the file locally, or transfers it to a remote server. NOTE: This is not applicable for Android and iOS as the video capture window is full screen and provides a button to stop the video capture. Please note that the file transfer happens as specified even if we don't call the stop method.