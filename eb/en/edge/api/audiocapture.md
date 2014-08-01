#AudioCapture


## Overview
Audio capture API allows you to capture audio from the device's built in microphone or input source.
## Enabling the API
In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* ebapi-modules.js - this file contains all available Enterprise Browser APIs

If you wish to minimize the amount of JavaScript being included, you can choose to only include the individual API that your application is using:

ex:

* ebapi.js - core APIs needed 
* eb.audiocapture.js - just the AudioCapture API
* other individual JavaScript files included with the Enterprise Browser installation
        


##Methods



### cancel()
<p>Cancel audio recording. During recording if &lsquo;cancel&rsquo; method is called, the status of recording will be &lsquo;cancel&rsquo; in the callback returning parameter of &lsquo;start&rsquo; method. No file is saved. In android, it will delete the file if it exists.</p>


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
	* <code>myObject.cancel()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.AudioCapture.cancel()</code> 


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
	* <code>EB.AudioCapture.getAllProperties()</code> 


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
	* <code>EB.AudioCapture.getDefault()</code> 


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
	* <code>EB.AudioCapture.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code> 


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
	* <code>EB.AudioCapture.getProperty(<span class="text-info">STRING</span> propertyName)</code> 


### setDefault(<span class="text-info">SELF_INSTANCE: EB.AudioCapture</span> defaultInstance)
<p>This method allows you to set the attributes of the default object instance by passing in an object of the same class.</p>


####Parameters
<ul><li>defaultInstance : <span class='text-info'>SELF_INSTANCE: EB.AudioCapture</span><p>
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
	* <code>EB.AudioCapture.setDefault(<span class="text-info">SELF_INSTANCE: EB.AudioCapture</span> defaultInstance)</code> 


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
	* <code>EB.AudioCapture.setProperties(<span class="text-info">HASH</span> propertyMap)</code> 


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
	* <code>EB.AudioCapture.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code> 


### start(<span class="text-info">HASH</span> props)
<p>Starts capturing audio until either &lsquo;stop&rsquo; is received, or &lsquo;maxDuration&rsquo; is reached. The successful recording will set &lsquo;ok&rsquo; as the status. An unsuccessful recording will set &lsquo;cancel&rsquo; or &lsquo;error&rsquo; as the status in the callback returning parameters. If &lsquo;cancel&rsquo; method is called during recording, &lsquo;cancel&rsquo; status will be set in the callback returning parameters. In order to restart the audio capture, if the audio capturing is already in process, it is mandatory to call &lsquo;stop&rsquo; or &lsquo;cancel&rsquo; method before calling &lsquo;start&rsquo; method again.</p>


####Parameters
<ul><li>props : <span class='text-info'>HASH</span><p>
<p>Map of Audio Capture properties to be set.</p>
 Valid `properties` for this parameter are the properties avaliable to this API module. <a href='#Properties'>Check the property section</a> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>
<p>Whether or not the audio recording was successfully captured, status will be &lsquo;ok&rsquo; or &lsquo;cancel&rsquo; or &lsquo;error&rsquo;.</p>
 </p></li><li>message : <span class='text-info'>STRING</span><p>
<p>If &lsquo;status&rsquo; == &lsquo;error&rsquo;, then message contains error message. In all other cases, it will remain empty.</p>
 </p></li><li>fileName : <span class='text-info'>STRING</span><p>
<p>If &lsquo;status&rsquo; == &lsquo;ok&rsquo;, then contain full file path with the file name of recorded audiofile. In all other cases, it will remain empty.</p>
 </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.start(<span class="text-info">HASH</span> props)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.AudioCapture.start(<span class="text-info">HASH</span> props)</code> 


### stop()
<p>Stop audio recording. During recording if &lsquo;stop&rsquo; method is called, the status of recording will be &lsquo;ok&rsquo; in the callback returning parameter of &lsquo;start&rsquo; method. The file is saved in user provided location.</p>


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
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.AudioCapture.stop()</code> 


##Properties



###encoder

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Encoder to compress recorded audio. In Android devices, the supported encoder type is dependent upon device hardware and vendor.</p>

####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.AudioCapture.ENCODER_AAC - String: AAC 
<p>AAC low complexity. This is the default value. If wrong or no value is specified this value will be accounted.</p>

* Constant: EB.AudioCapture.ENCODER_AMR_NB - String: AMR_NB 
<p>AMR narrow-band.</p>

* Constant: EB.AudioCapture.ENCODER_AMR_WB - String: AMR_WB 
<p>AMR wide-band.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.encoder</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.AudioCapture.encoder</code> 



####Platforms

* Android

###fileName

####Type
<span class='text-info'>STRING</span> 
####Description

<p>(Required) This parameter is used to specify the file name. The file name should be set at least once before calling &lsquo;start&rsquo; method, otherwise the &lsquo;start&rsquo; method will update the callback &lsquo;status&rsquo; as &lsquo;error&rsquo;.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.fileName</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.AudioCapture.fileName</code> 



####Platforms

* Android
* Windows Mobile/CE

###maxDuration

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Specifies the number of milliseconds of audio to capture, defining the size of the capture buffer. This is also the maximum number of milliseconds of audio to capture when the &lsquo;start&rsquo; method is called if not interrupted with the &lsquo;stop&rsquo; method. The duration cannot be set to less than 1000 milliseconds, if a value of less than 1000 milliseconds is specified, the interval will be defaulted to 20000 milliseconds. The default value is 20,000 milliseconds.</p>

####Params
<p><strong>Default:</strong> 20000</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.maxDuration</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.AudioCapture.maxDuration</code> 



####Platforms

* Android
* Windows Mobile/CE

##Remarks



###File Name
<p>In Windows, to store the file in a particular location, specify the path with the file name. Mentioning the extension name with the file name is optional. Only *.wav files are supported. If the path is not specified with the file name, the captured file is stored in the root directory of the device. In Windows and Android, if the folder is not present, it should be created manually for storing the file in that location. In Android, the file extension depends on encoder value. If it is AAC, the extension should be &lsquo;.mp4&rsquo;. In all other cases, it is of &lsquo;.3gpp&rsquo;. If only filename is specified, it will be saved in the root directory of external storage.</p>


###Audio Capture
<p>In Windows &amp; Android, Audio capture will not be started, if the file name is set to null. File will not be saved for invaild file name. It will return error in the callback returning parameters with the valid reason.</p>


###Restarting of Audio Capture
<p>Audio recording will not be restarted, if the audio recording is already in process. In order to restart the audio capture, stop or cancel method need to be invoked before invoking start method.</p>


###Page Refresh
<p>If the page is to be refreshed, the audio recording should be canceled. In Android, the state will be persisted.</p>


###Page Navigation
<p>Upon page navigation, the audio recording should be canceled.</p>


###Duration And File Name Settings
<p>The default values will be applied for duration if no values are provided by the user. If values are provided then it will apply the user provided values. Later if values are not provided then it will apply the last provided values for the same. The settings for duration and file name will not be applied if the audio capture is already started and in progress. In android, there might be slight omit of recording data initially.</p>


###Get Property Or Get Properties
<p>In Windows, &lsquo;getProperty&rsquo; or &lsquo;getProperties&rsquo; for fileName will return the complete path along with the extension name. For example: If file name was set to &lsquo;\Application\AudioCapture&rsquo;, then &lsquo;getProperty&rsquo; or &lsquo;getProperties&rsquo; will return &lsquo;\Application\AudioCapture.wav&rsquo;. If file name was set to &lsquo;AudioCapture&rsquo;, then &lsquo;getProperty&rsquo; or &lsquo;getProperties&rsquo; will return &lsquo;\AudioCapture.wav&rsquo;. In Android, the fileName will return whatever is set with or without extension.</p>


###General
<p>On Quitting of the Application, Android will save the data in the file and gracefully exit. In Android, during suspend/resume or screen timeout the audio will keep on recording.</p>
