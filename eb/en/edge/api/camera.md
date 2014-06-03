#Camera


## Overview
<p>The Camera API provides access to your device&rsquo;s Camera(s)</p>
<p>Use this API to give users the ability to take a photo via one of the device&rsquo;s cameras and return it to the application. Photos can either be stored on the device and optionally transfered to an online server using the Network API or can be returned as a DataURI object for storing or display.</p>

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



### choosePicture()
Choose a picture from the album.

### enumerate()
Returns the cameras present on your device, allowing you to access your device's front or back camera.

### getAllProperties()
This method will return all of object/value pairs for the propertyNames of the API class.

### getCameraByType()
Returns the camera of requested type if that camera exist - else return nil.

### getDefault()
This method will return an object that represents the default instance of the API Class. For example Camera.getDefault will return a Camera object that represents the default camera.

### getProperties()
This method will return a set of object/value pairs for the list of the propertyName that is passed in. The propertyNames must be a valid property of the API class.

### getProperty()
This method will return the value of the propertyName that is passed in. The propertyName must be a valid property of the API class.

### saveImageToDeviceGallery()
Save an image to the device gallery.

### setDefault()
This method allows you to set the attributes of the default object instance by passing in an object of the same class.

### setProperties()
This method will set the values of a list of properties for the API class. The propertyName must be a valid property for the class and must also not be read only.

### setProperty()
This method will set the value of a property for the API class. The propertyName must be a valid property for the class and must also not be read only.

### takePicture()
Start the camera application to take a picture. The user can capture the displayed image either by interacting with the resident camera app or pressing the trigger or enter key, depending on the device in use.