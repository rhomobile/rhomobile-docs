#Mediaplayer


## Overview
The MediaPlayer extension is used to playback different types of audio files. It also allows the playback of Ringtones for the respective platform.
## Enabling the API           
In order to use this API you must include the following extension in your `build.yml`
    :::ruby
    extensions: ["mediaplayer"]

## JavaScript Usage
Be sure to review the [JavaScript API Usage](/guide/api_js) guide for important information about using this API in JavaScript

## Ruby Usage
Be sure to review the [Ruby API Usage](/guide/api_ruby) guide for important information about using this API in Ruby
        


##Methods



### getAllRingtones()
<p>Getting all ringtones on the device &ndash; result is array of hashes , each HASH contains name, fullname pairs of info about ringtone.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul><ul><li><i>Object</i> : <span class='text-info'>HASH</span><p> </p></li><ul><li>name : <span class='text-info'>STRING</span><p>
<p>{}</p>
 </p></li><li>fullname : <span class='text-info'>STRING</span><p>
<p>{}</p>
 </p></li></ul></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Mediaplayer.getAllRingtones()</code> 


### playRingTone(<span class="text-info">STRING</span> name)
<p>Play a ringtone with the name supplied being used to designate which one. You cannot supply a location for the ringtone. They are built in. To get a full list of all ringtones available on the system use the method getAllRintones.</p>


####Parameters
<ul><li>name : <span class='text-info'>STRING</span><p>
<p>Name of the ringtone to be played.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Mediaplayer.playRingTone(<span class="text-info">STRING</span> name)</code> 


### start(<span class="text-info">STRING</span> filename)
<p>Play a media file using the supplied filename.</p>


####Parameters
<ul><li>filename : <span class='text-info'>STRING</span><p>
<p>File name of the audio media to be played &ndash; absolute filepath. On iOS when you post URL to remote server (except https), then we open a standard browser (another application) for playing it. On iOS we support: mp3, mp4, wav formats. On other platforms the formats supported depend on what support is built into the platform. Typically on WM/CE this will be wav and on Android mp3.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Mediaplayer.start(<span class="text-info">STRING</span> filename)</code> 


### startvideo(<span class="text-info">STRING</span> filename)
<p>Playing a video file back.</p>


####Parameters
<ul><li>filename : <span class='text-info'>STRING</span><p>
<p>File name of the video media to be played &ndash; full filepath. On iOS when you post URL to remote server  (except https), then we open a standard browser (another application) for playing it. On iOS we support: mov, mp4, 3gp formats. On other platforms the formats supported depend on what support is built into the platform. Typically on WM/CE this will be wmv and on Android mp4.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Mediaplayer.startvideo(<span class="text-info">STRING</span> filename)</code> 


### stop()
<p>Stop playing the media file. Not applicable on iOS, because on iOS the special UI is opened for playback audio / video &ndash; user can stop / close player by UI.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Mediaplayer.stop()</code> 


### stopRingTone()
<p>Stop the currently playing ringtone.</p>


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
<p>Stop the playback of a currently playing video file. Not applicable on iOS, because on iOS the special UI is opened for playback audio / video &ndash; user can stop / close player by UI.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Mediaplayer.stopvideo()</code> 


##Remarks



###Availbility of Operating System
<p>Because the MediaPlayer extension uses the operating system&rsquo;s built-in player for some media types, it may be possible for the user to access operating system features while media is playing.</p>


###Playback Controls
<p>Because the MediaPlayer extension uses the operating system&rsquo;s built-in player for some media types, the playback controls available to the user are outside the control of RhoElements. Some players may have no playback controls in which the user will have to wait for the media to finish playing.</p>


###Android Support
<p>On Android devices, HTTPS is supported only on Android versions 4.0 (Ice Cream Sandwich) or newer.</p>


###Using File Transfer
<p>When more flexible file transfer is required than is provided by MediaPlayer itself it is recommended to use the Network API to fetch the media file, and then to play the local file using MediaPlayer. For example, if playing a file from an FTP server, or an HTTP server requiring authentication. This can also be more efficient if the same file is to be played multiple times, especially on Windows Mobile/CE, where there is no streaming support and therefore the file is completely downloaded before being played.</p>
