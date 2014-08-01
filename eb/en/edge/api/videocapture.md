#Videocapture


## Overview
captures video files from the default camera device.Only the foreground application is given access to capture video, when an application is sent to the background any capture that is in progress will be canceled and it will automatically relinquish control of the video hardware. When brought back to the foreground, an application previously using the video capture will have its previous configuration (eg. name etc.) reapplied to the plug-in automatically. Please note that any file transfer that is in progress continues even if the application is sent to the background.
## Enabling the API
In order to use this API you must TBD INSERT Eb specific instructions here

        


##Methods



### cancel()
<p>Stops capturing video and discards any captured video data. No file transfer takes place if the video capture is canceled. NOTE: This is not applicable for Android and iOS as the video capture window is full screen and provides a button to cancel the video capture.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.cancel()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Videocapture.cancel()</code> 


### enumerate()
<p>Enumerates all the available cameras for capturing video.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul><ul><li><i>Object</i> : <span class='text-info'>SELF_INSTANCE: EB.Videocapture</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:

* ARRAY : 
<p>Array of video capture objects.</p>
<ul><li><i>Object</i> : <span class='text-info'>SELF_INSTANCE: EB.Videocapture</span><p> </p></li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Videocapture.enumerate()</code> 


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
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Videocapture.getAllProperties()</code> 


### getDefault()
<p>This method will return an object that represents the default instance of the API Class. For example Camera.getDefault will return a Camera object that represents the default camera.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>SELF_INSTANCE</span></p><ul></ul>

####Returns
Synchronous Return:

* SELF_INSTANCE : 
<p>Default object of Module.</p>


####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Videocapture.getDefault()</code> 


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
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Videocapture.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code> 


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
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Videocapture.getProperty(<span class="text-info">STRING</span> propertyName)</code> 


### setDefault(<span class="text-info">SELF_INSTANCE: EB.Videocapture</span> defaultInstance)
<p>This method allows you to set the attributes of the default object instance by passing in an object of the same class.</p>


####Parameters
<ul><li>defaultInstance : <span class='text-info'>SELF_INSTANCE: EB.Videocapture</span><p>
<p>An instance object that is of the same class.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Videocapture.setDefault(<span class="text-info">SELF_INSTANCE: EB.Videocapture</span> defaultInstance)</code> 


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
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Videocapture.setProperties(<span class="text-info">HASH</span> propertyMap)</code> 


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
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Videocapture.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code> 


### start()
<p>Starts capturing video until either &lsquo;stop&rsquo; is received, or &lsquo;duration&rsquo; is reached. NOTE: On Android this meta tag wouldn&rsquo;t immediately start recording and presents a preview window with controls (start, stop and cancel) for recording.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>OBJECT</span></p><ul><ul><li>transferResult : <span class='text-info'>STRING</span><p>
<p>Reports success or failure of transfer.</p>
 </p></li><li>fileName : <span class='text-info'>STRING</span><p>
<p>Name of the saved file (absolute path).</p>
 </p></li><li>fileSize : <span class='text-info'>STRING</span><p>
<p>Size of the saved file in kilobytes (KB).</p>
 </p></li></ul></ul>

####Returns
Synchronous Return:

* Void : 
<p>Not providing a callback to be invoked will result in that file is saved only locally and file is not transfered.</p>


####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.start()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Videocapture.start()</code> 


### stop()
<p>Stops capturing video and either saves the file locally, or transfers it to a remote server. NOTE: This is not applicable for Android and iOS as the video capture window is full screen and provides a button to stop the video capture. Please note that the file transfer happens as specified even if we don&rsquo;t call the stop method.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile/CE

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

<p>Specifies the number of milliseconds of video to capture. This is the maximum number of milliseconds of video to capture when the &lsquo;start&rsquo; method is called if not interrupted with the &lsquo;stop&rsquo; method. The duration cannot be set to less than 1000 milliseconds, if a value of less than 1000 milliseconds is specified, the interval will be defaulted to 5000 milliseconds.</p>

####Params
<p><strong>Default:</strong> 5000</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.duration</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Videocapture.duration</code> 



####Platforms

* Android
* Windows Mobile/CE

###fileName

####Type
<span class='text-info'>STRING</span> 
####Description

<p>The path and name of the file that the video is saved to locally on the device. When the video capture completes the file is saved in the root directory of the device (In case of Android this is the external storage directory). For example, if the user specifies &lsquo;/video/file1&rsquo; then the file gets saved as &lsquo;/mnt/sdcard/video/file1.mp4&rsquo; in Android, and as &lsquo;\video\file1.mov&rsquo; on Windows. The file extension should not be provided as this is determined by the platform (.mp4 in Android and .mov in Windows). On iOS you&rsquo;ll need to provide the entire path, including the extension, which should be .MOV.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.fileName</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Videocapture.fileName</code> 



####Platforms

* Android
* Windows Mobile/CE

###resolution

####Type
<span class='text-info'>STRING</span> 
####Description

<p>The resolution of the video file to be captured.</p>

####Params
<p><strong>Default:</strong> HIGH</p>
####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.Videocapture.LOW - String: low 
<p>Low resolution.</p>

* Constant: EB.Videocapture.HIGH - String: high 
<p>High resolution.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.resolution</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Videocapture.resolution</code> 



####Platforms

* Android
* Windows Mobile/CE

###saveToGallery

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Specifies whether or not to save the recorded video file into the device gallery.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.saveToGallery</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Videocapture.saveToGallery</code> 



####Platforms

* Android
* Windows Mobile/CE

##Remarks



###Memory requirements
<p>Once duration has been reached the video file will be saved or transferred. Calling &lsquo;stop&rsquo; once this has occurred will have no effect. A Video Capture will fail if there is not sufficient space on the device&rsquo;s filesystem to store it.</p>


###File Formats
<p>The output file format on Android is MP4 and on Windows is WMV.</p>
