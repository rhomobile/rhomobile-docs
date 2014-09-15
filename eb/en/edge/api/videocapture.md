#Videocapture


## Overview
captures video files from the default camera device.Only the foreground application is given access to capture video, when an application is sent to the background any capture that is in progress will be canceled and it will automatically relinquish control of the video hardware. When brought back to the foreground, an application previously using the video capture will have its previous configuration (eg. name etc.) reapplied to the plug-in automatically. Please note that any file transfer that is in progress continues even if the application is sent to the background.
## Enabling the API
There are two methods of enabling the VideoCapture API: 

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
To include single APIs, you must first include the `ebapi.js` in your HTML as well as the API file you want to use. For instance, to use the VideoCapture API, I would add the following code to my HTML file(s), assuming the API files have been copied to the same directory as the HTML.

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi.js"></script>
    <script type="text/javascript" charset="utf-8" src="eb.videocapture.js"></script>

The ebapi.js file is necessary for all single API inclusions.

        


##Methods



### cancel()
Stops capturing video and discards any captured video data. No file transfer takes place if the video capture is canceled. NOTE: This is not applicable for Android and iOS as the video capture window is full screen and provides a button to cancel the video capture.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.cancel()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Videocapture.cancel()</code> 


### enumerate()
Enumerates all the available cameras for capturing video.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul><ul><li><i>Object</i> : <span class='text-info'>SELF_INSTANCE: EB.Videocapture</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:

* ARRAY : Array of video capture objects.<ul><li><i>Object</i> : <span class='text-info'>SELF_INSTANCE: EB.Videocapture</span><p> </p></li></ul>

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Videocapture.enumerate()</code> 


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
* Windows Mobile

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getAllProperties()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Videocapture.getAllProperties()</code> 


### getDefault()
This method will return an object that represents the default instance of the API Class. For example Camera.getDefault will return a Camera object that represents the default camera.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>SELF_INSTANCE</span></p><ul></ul>

####Returns
Synchronous Return:

* SELF_INSTANCE : Default object of Module.

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Videocapture.getDefault()</code> 


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
* Windows Mobile

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Videocapture.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code> 


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
* Windows Mobile

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getProperty(<span class="text-info">STRING</span> propertyName)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Videocapture.getProperty(<span class="text-info">STRING</span> propertyName)</code> 


### setDefault(<span class="text-info">SELF_INSTANCE: EB.Videocapture</span> defaultInstance)
This method allows you to set the attributes of the default object instance by passing in an object of the same class.

####Parameters
<ul><li>defaultInstance : <span class='text-info'>SELF_INSTANCE: EB.Videocapture</span><p>An instance object that is of the same class. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Videocapture.setDefault(<span class="text-info">SELF_INSTANCE: EB.Videocapture</span> defaultInstance)</code> 


### setProperties(<span class="text-info">HASH</span> propertyMap)
This method will set the values of a list of properties for the API class. The propertyName must be a valid property for the class and must also not be read only.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>Map of properties I want to set </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.setProperties(<span class="text-info">HASH</span> propertyMap)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Videocapture.setProperties(<span class="text-info">HASH</span> propertyMap)</code> 


### setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)
This method will set the value of a property for the API class. The propertyName must be a valid property for the class and must also not be read only.

####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p>The one property name that I want to set </p></li><li>propertyValue : <span class='text-info'>STRING</span><p>The one property value that I want to set </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Videocapture.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code> 


### start()
Starts capturing video until either 'stop' is received, or 'duration' is reached. NOTE: On Android this meta tag wouldn't immediately start recording and presents a preview window with controls (start, stop and cancel) for recording.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>OBJECT</span></p><ul><ul><li>transferResult : <span class='text-info'>STRING</span><p>Reports success or failure of transfer. </p></li><li>fileName : <span class='text-info'>STRING</span><p>Name of the saved file (absolute path). </p></li><li>fileSize : <span class='text-info'>STRING</span><p>Size of the saved file in kilobytes (KB). </p></li></ul></ul>

####Returns
Synchronous Return:

* Void : Not providing a callback to be invoked will result in that file is saved only locally and file is not transfered.

####Platforms

* Android
* Windows Mobile

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.start()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Videocapture.start()</code> 


### stop()
Stops capturing video and either saves the file locally, or transfers it to a remote server. NOTE: This is not applicable for Android and iOS as the video capture window is full screen and provides a button to stop the video capture. Please note that the file transfer happens as specified even if we don't call the stop method.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.stop()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Videocapture.stop()</code> 


##Properties



###duration

####Type
<span class='text-info'>INTEGER</span> 
####Description
Specifies the number of milliseconds of video to capture. This is the maximum number of milliseconds of video to capture when the 'start' method is called if not interrupted with the 'stop' method. The duration cannot be set to less than 1000 milliseconds, if a value of less than 1000 milliseconds is specified, the interval will be defaulted to 5000 milliseconds.
####Params
<p><strong>Default:</strong> 5000</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.duration</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Videocapture.duration</code> 



####Platforms

* Android
* Windows Mobile

###fileName

####Type
<span class='text-info'>STRING</span> 
####Description
The path and name of the file that the video is saved to locally on the device. When the video capture completes the file is saved in the root directory of the device (In case of Android this is the external storage directory). For example, if the user specifies '/video/file1' then the file gets saved as '/mnt/sdcard/video/file1.mp4' in Android, and as '\video\file1.mov' on Windows. The file extension should not be provided as this is determined by the platform (.mp4 in Android and .mov in Windows). On iOS you'll need to provide the entire path, including the extension, which should be .MOV.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.fileName</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Videocapture.fileName</code> 



####Platforms

* Android
* Windows Mobile

###resolution

####Type
<span class='text-info'>STRING</span> 
####Description
The resolution of the video file to be captured.
####Params
<p><strong>Default:</strong> HIGH</p>
####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.Videocapture.LOW - String: low Low resolution.
* Constant: EB.Videocapture.HIGH - String: high High resolution.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.resolution</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Videocapture.resolution</code> 



####Platforms

* Android
* Windows Mobile

###saveToGallery

####Type
<span class='text-info'>BOOLEAN</span> 
####Description
Specifies whether or not to save the recorded video file into the device gallery.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.saveToGallery</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Videocapture.saveToGallery</code> 



####Platforms

* Android
* Windows Mobile

##Remarks



###Memory requirements

Once duration has been reached the video file will be saved or transferred. Calling 'stop' once this has occurred will have no effect. A Video Capture will fail if there is not sufficient space on the device's filesystem to store it.

                

###File Formats

The output file format on Android is MP4 and on Windows is WMV.

                