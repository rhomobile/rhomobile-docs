#AudioCapture


## Overview
Audio capture API allows you to capture audio from the device's built in microphone or input source.
## Enabling the API
There are two methods of enabling the AudioCapture API:

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
To include single APIs, you must first include the `ebapi.js` in your HTML as well as the API file you want to use. For instance, to use the AudioCapture API, I would add the following code to my HTML file(s), assuming the API files have been copied to the same directory as the HTML.

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi.js"></script>
    <script type="text/javascript" charset="utf-8" src="eb.audiocapture.js"></script>

The ebapi.js file is necessary for all single API inclusions.
        


##Methods



### cancel()
Cancel audio recording. During recording if 'cancel' method is called, the status of recording will be 'cancel' in the callback returning parameter of 'start' method. No file is saved. In android, it will delete the file if it exists.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.cancel()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.AudioCapture.cancel()</code> 


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
* Windows CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getAllProperties()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.AudioCapture.getAllProperties()</code> 


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
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.AudioCapture.getDefault()</code> 


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
* Windows CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.AudioCapture.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code> 


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
* Windows CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getProperty(<span class="text-info">STRING</span> propertyName)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.AudioCapture.getProperty(<span class="text-info">STRING</span> propertyName)</code> 


### setDefault(<span class="text-info">SELF_INSTANCE: EB.AudioCapture</span> defaultInstance)
This method allows you to set the attributes of the default object instance by passing in an object of the same class.

####Parameters
<ul><li>defaultInstance : <span class='text-info'>SELF_INSTANCE: EB.AudioCapture</span><p>An instance object that is of the same class. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.AudioCapture.setDefault(<span class="text-info">SELF_INSTANCE: EB.AudioCapture</span> defaultInstance)</code> 


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
* Windows CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.setProperties(<span class="text-info">HASH</span> propertyMap)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.AudioCapture.setProperties(<span class="text-info">HASH</span> propertyMap)</code> 


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
* Windows CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.AudioCapture.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code> 


### start(<span class="text-info">HASH</span> props)
Starts capturing audio until either 'stop' is received, or 'maxDuration' is reached. The successful recording will set 'ok' as the status. An unsuccessful recording will set 'cancel' or 'error' as the status in the callback returning parameters. If 'cancel' method is called during recording, 'cancel' status will be set in the callback returning parameters. In order to restart the audio capture, if the audio capturing is already in process, it is mandatory to call 'stop' or 'cancel' method before calling 'start' method again.

####Parameters
<ul><li>props : <span class='text-info'>HASH</span><p>Map of Audio Capture properties to be set. Valid `properties` for this parameter are the properties available to this API module. Check the <a href='#api-audiocapture?Properties'>property section</a> for applicable properties. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>Whether or not the audio recording was successfully captured, status will be 'ok' or 'cancel' or 'error'. </p></li><li>message : <span class='text-info'>STRING</span><p>If 'status' == 'error', then message contains error message. In all other cases, it will remain empty. </p></li><li>fileName : <span class='text-info'>STRING</span><p>If 'status' == 'ok', then contain full file path with the file name of recorded audiofile. In all other cases, it will remain empty. </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.start(<span class="text-info">HASH</span> props)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.AudioCapture.start(<span class="text-info">HASH</span> props)</code> 


### stop()
Stop audio recording. During recording if 'stop' method is called, the status of recording will be 'ok' in the callback returning parameter of 'start' method. The file is saved in user provided location.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

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
Encoder to compress recorded audio. In Android devices, the supported encoder type is dependent upon device hardware and vendor.
####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.AudioCapture.ENCODER_AAC - String: AAC AAC low complexity. This is the default value. If wrong or no value is specified this value will be accounted.
* Constant: EB.AudioCapture.ENCODER_AMR_NB - String: AMR_NB AMR narrow-band.
* Constant: EB.AudioCapture.ENCODER_AMR_WB - String: AMR_WB AMR wide-band.
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
(Required) This parameter is used to specify the file name. The file name should be set at least once before calling 'start' method, otherwise the 'start' method will update the callback 'status' as 'error'.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.fileName</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.AudioCapture.fileName</code> 



####Platforms

* Android
* Windows Mobile
* Windows CE

###maxDuration

####Type
<span class='text-info'>INTEGER</span> 
####Description
Specifies the number of milliseconds of audio to capture, defining the size of the capture buffer. This is also the maximum number of milliseconds of audio to capture when the 'start' method is called if not interrupted with the 'stop' method. The duration cannot be set to less than 1000 milliseconds, if a value of less than 1000 milliseconds is specified, the interval will be defaulted to 20000 milliseconds. The default value is 20,000 milliseconds.
####Params
<p><strong>Default:</strong> 20000</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.maxDuration</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.AudioCapture.maxDuration</code> 



####Platforms

* Android
* Windows Mobile
* Windows CE

##Remarks



###File Name

                    
In Windows, to store the file in a particular location, specify the path with the file name. Mentioning the extension name with the file name is optional. Only *.wav files are supported. If the path is not specified with the file name, the captured file is stored in the root directory of the device. In Windows and Android, if the folder is not present, it should be created manually for storing the file in that location. In Android, the file extension depends on encoder value. If it is AAC, the extension should be '.mp4'. In all other cases, it is of '.3gpp'. If only filename is specified, it will be saved in the root directory of external storage.
                    
                

###Audio Capture

			
In Windows & Android, Audio capture will not be started, if the file name is set to null. File will not be saved for invaild file name. It will return error in the callback returning parameters with the valid reason.
			
			

###Restarting of Audio Capture

                    
Audio recording will not be restarted, if the audio recording is already in process. In order to restart the audio capture, stop or cancel method need to be invoked before invoking start method.
                    
                

###Page Refresh

                    
If the page is to be refreshed, the audio recording should be canceled. In Android, the state will be persisted.
                    
                

###Page Navigation

                    
Upon page navigation, the audio recording should be canceled.
                    
                

###Duration And File Name Settings

                    
The default values will be applied for duration if no values are provided by the user. If values are provided then it will apply the user provided values. Later if values are not provided then it will apply the last provided values for the same. The settings for duration and file name will not be applied if the audio capture is already started and in progress. In android, there might be slight omit of recording data initially.
                    
                

###Get Property Or Get Properties

                    
In Windows, 'getProperty' or 'getProperties' for fileName will return the complete path along with the extension name. For example: If file name was set to '\\Application\\AudioCapture', then 'getProperty' or 'getProperties' will return '\Application\AudioCapture.wav'. If file name was set to 'AudioCapture', then 'getProperty' or 'getProperties' will return '\AudioCapture.wav'. In Android, the fileName will return whatever is set with or without extension.
                    
                

###General

                    
On Quitting of the Application, Android will save the data in the file and gracefully exit. In Android, during suspend/resume or screen timeout the audio will keep on recording.
                    
                

###SDCard Access
Extensions which came from RhoElements (i.e. AudioCapture) that could possibly write files to external storage will require "write SD card" permissions as part of the extension's AndroidManifest. You cannot remove the ability to write to the SD card as it would cause the extension to malfunction. Therefore, the capability has already been granted on build, and any capability added by you will be ignored. This being the case, the following extensions will always be able to write to the SD card by default.

##Examples



###Capturing and Playing Audio
This example will show how to capture audio from your device to a file and then play that audio file. Note that this example assumes that your ebapi-modules.js file is located in the same folder as the HTML that is evoking it.
<pre><code>:::javascript
&lt;head&gt;
    &lt;script src="http://192.168.1.28:8080/target/target-script-min.js#anonymous"&gt;&lt;/script&gt;
    &lt;script type="text/javascript" charset="utf-8" src="../apis/EnterpriseBrowser/ebapi-modules.js"&gt;&lt;/script&gt;

    &lt;title&gt;Audio Capture API Example&lt;/title&gt;

    &lt;script&gt;
        audioFile = null;

        function captureAudio(){
            display.innerHTML = 'Capturing...'
            EB.AudioCapture.start({fileName:   'testCap',
                                                         maxDuration: 5000}, captureCallback);
        }

        function captureCallback(params){
            if (params['status'] == 'ok'){
                display.innerHTML = 'Captured Audio File: ' + params['fileName'];
                audioFile = params['fileName'];
                audioFile = audioFile.substr(7); // Remove 'file://' from the beginning of the fileName
            }
            else{
                display.innerHTML = 'Audio Not Captured';
            }
        }

        function playCapturedAudio(){
            if(audioFile){
                EB.Mediaplayer.start(audioFile);
            }
            else{
                alert("No audio captured yet.");
            }
        }

    &lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
    &lt;h1&gt;AudioCapture API Example&lt;/h1&gt;
    &lt;div id="display"&gt;&lt;/div&gt;
    &lt;/br&gt;
    &lt;/br&gt;
    &lt;button onclick="captureAudio()"&gt;Capture Audio&lt;/button&gt;
    &lt;button onclick="playCapturedAudio()"&gt;Play Captured Audio&lt;/button&gt;
&lt;/body&gt;
                                
                            
</code></pre>