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
Getting all ringtones on the device - result is array of hashes , each HASH contains name, fullname pairs of info about ringtone.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul><ul><li><i>Object</i> : <span class='text-info'>HASH</span><p> </p></li><ul><li>name : <span class='text-info'>STRING</span><p>
{} </p></li><li>fullname : <span class='text-info'>STRING</span><p>
{} </p></li></ul></ul></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Mediaplayer.getAllRingtones()</code> </li></ul></li></ul>

### playRingTone(<span class="text-info">STRING</span> name)
Play a ringtone with the name supplied being used to designate which one. You cannot supply a location for the ringtone. They are built in. To get a full list of all ringtones available on the system use the method getAllRintones.

####Parameters
<ul><li>name : <span class='text-info'>STRING</span><p>
Name of the ringtone to be played. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Mediaplayer.playRingTone(<span class="text-info">STRING</span> name)</code> </li></ul></li></ul>

### start(<span class="text-info">STRING</span> filename)
Play a media file using the supplied filename.

####Parameters
<ul><li>filename : <span class='text-info'>STRING</span><p>
File name of the audio media to be played - absolute filepath. On iOS when you post URL to remote server (except https), then we open a standard browser (another application) for playing it. On iOS we support: mp3, mp4, wav formats. On other platforms the formats supported depend on what support is built into the platform. Typically on WM/CE this will be wav and on Android mp3. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Mediaplayer.start(<span class="text-info">STRING</span> filename)</code> </li></ul></li></ul>

### startvideo(<span class="text-info">STRING</span> filename)
Playing a video file back.

####Parameters
<ul><li>filename : <span class='text-info'>STRING</span><p>
File name of the video media to be played - full filepath. On iOS when you post URL to remote server  (except https), then we open a standard browser (another application) for playing it. On iOS we support: mov, mp4, 3gp formats. On other platforms the formats supported depend on what support is built into the platform. Typically on WM/CE this will be wmv and on Android mp4. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Mediaplayer.startvideo(<span class="text-info">STRING</span> filename)</code> </li></ul></li></ul>

### stop()
Stop playing the media file. Not applicable on iOS, because on iOS the special UI is opened for playback audio / video - user can stop / close player by UI.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Mediaplayer.stop()</code> </li></ul></li></ul>

### stopRingTone()
Stop the currently playing ringtone.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Mediaplayer.stopRingTone()</code> </li></ul></li></ul>

### stopvideo()
Stop the playback of a currently playing video file. Not applicable on iOS, because on iOS the special UI is opened for playback audio / video - user can stop / close player by UI.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Mediaplayer.stopvideo()</code> </li></ul></li></ul>

##Remarks



###Availbility of Operating System

Because the MediaPlayer extension uses the operating system's built-in player for some media types, it may be possible for the user to access operating system features while media is playing.
                

###Playback Controls

Because the MediaPlayer extension uses the operating system's built-in player for some media types, the playback controls available to the user are outside the control of RhoElements. Some players may have no playback controls in which the user will have to wait for the media to finish playing.
                

###Android Support

On Android devices, HTTPS is supported only on Android versions 4.0 (Ice Cream Sandwich) or newer.
                

###Using File Transfer

When more flexible file transfer is required than is provided by MediaPlayer itself it is recommended to use the Network API to fetch the media file, and then to play the local file using MediaPlayer. For example, if playing a file from an FTP server, or an HTTP server requiring authentication. This can also be more efficient if the same file is to be played multiple times, especially on Windows Mobile/CE, where there is no streaming support and therefore the file is completely downloaded before being played.
                