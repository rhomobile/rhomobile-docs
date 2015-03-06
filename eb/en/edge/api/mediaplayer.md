#Mediaplayer


## Overview
The MediaPlayer extension is used to playback different types of audio files. It also allows the playback of Ringtones for the respective platform.
        
## Enabling the API
There are two methods of enabling the MediaPlayer API:

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
To include single APIs, you must first include the `ebapi.js` in your HTML as well as the API file you want to use. For instance, to use the MediaPlayer API, I would add the following code to my HTML file(s), assuming the API files have been copied to the same directory as the HTML.

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi.js"></script>
    <script type="text/javascript" charset="utf-8" src="eb.mediaplayer.js"></script>

The ebapi.js file is necessary for all single API inclusions.
        


##Methods



### getAllRingtones()
Getting all ringtones on the device - result is array of hashes , each HASH contains name, fullname pairs of info about ringtone.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul><ul><li><i>Object</i> : <span class='text-info'>HASH</span><p> </p></li><ul><li>name : <span class='text-info'>STRING</span><p> </p></li><li>fullname : <span class='text-info'>STRING</span><p> </p></li></ul></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Mediaplayer.getAllRingtones()</code> 


### playRingTone(<span class="text-info">STRING</span> name)
Play a ringtone with the name supplied being used to designate which one. You cannot supply a location for the ringtone. They are built in. To get a full list of all ringtones available on the system use the method getAllRintones.

####Parameters
<ul><li>name : <span class='text-info'>STRING</span><p>Name of the ringtone to be played. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Mediaplayer.playRingTone(<span class="text-info">STRING</span> name)</code> 


### start(<span class="text-info">STRING</span> filename)
Play the audio file using the supplied filename. On WM/CE devices, the API supports only wav file format.

####Parameters
<ul><li>filename : <span class='text-info'>STRING</span><p>File name of the audio media to be played - absolute filepath. The formats supported depends on what support is built into the platform. Typically on WM/CE this will be wav and on Android mp3. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Mediaplayer.start(<span class="text-info">STRING</span> filename)</code> 


### startvideo(<span class="text-info">STRING</span> filename)
Play the media file using the supplied filename. On WM/CE devices, it launches a media player process to play the supplied filename.

####Parameters
<ul><li>filename : <span class='text-info'>STRING</span><p>File name of the video media to be played - full filepath. The formats supported depends on what support is built into the platform. Typically on WM/CE this will be wmv and on Android mp4. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Mediaplayer.startvideo(<span class="text-info">STRING</span> filename)</code> 


### stop()
Stop playing the media file. 

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

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Mediaplayer.stop()</code> 


### stopRingTone()
Stop the currently playing ringtone.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Mediaplayer.stopRingTone()</code> 


### stopvideo()
Stop the playback of a currently playing video file. 

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

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Mediaplayer.stopvideo()</code> 


##Remarks



###Availbility of Operating System

Because the MediaPlayer extension uses the operating system's built-in player for some media types, it may be possible for the user to access operating system features while media is playing.
                

###Playback Controls

Because the MediaPlayer extension uses the operating system's built-in player for some media types, the playback controls available to the user are outside the control of RhoElements. Some players may have no playback controls in which the user will have to wait for the media to finish playing.
                

###Android Support

On Android devices, HTTPS is supported only on Android versions 4.0 (Ice Cream Sandwich) or newer.
                

###Using File Transfer

When more flexible file transfer is required than is provided by MediaPlayer itself it is recommended to use the Network API to fetch the media file, and then to play the local file using MediaPlayer. For example, if playing a file from an FTP server, or an HTTP server requiring authentication. This can also be more efficient if the same file is to be played multiple times, especially on Windows Mobile/CE, where there is no streaming support and therefore the file is completely downloaded before being played. On Windows Mobile/CE devices, HTTPS file transfer is not supported.
                