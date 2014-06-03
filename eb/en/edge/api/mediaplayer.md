#Mediaplayer


## Overview
<p>The MediaPlayer extension is used to playback different types of audio files. It also allows the playback of Ringtones for the respective platform.</p>

<h2>Enabling the API</h2>

<p>In order to use this API you must include the following extension in your <code>build.yml</code></p>

<pre><code>:::ruby
extensions: ["mediaplayer"]
</code></pre>

<h2>JavaScript Usage</h2>

<p>Be sure to review the <a href="/guide/api_js">JavaScript API Usage</a> guide for important information about using this API in JavaScript</p>

<h2>Ruby Usage</h2>

<p>Be sure to review the <a href="/guide/api_ruby">Ruby API Usage</a> guide for important information about using this API in Ruby</p>



##Methods



### getAllRingtones()Getting all ringtones on the device - result is array of hashes , each HASH contains name, fullname pairs of info about ringtone.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul><ul><li><i>Object</i> : <span class='text-info'>HASH</span><p> </p></li><ul><li>name : <span class='text-info'>STRING</span><p> </p></li><li>fullname : <span class='text-info'>STRING</span><p> </p></li></ul></ul></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.Mediaplayer.getAllRingtones()</code> </li></ul></li></ul>

### playRingTone(<span class="text-info">STRING</span> name)Play a ringtone with the name supplied being used to designate which one. You cannot supply a location for the ringtone. They are built in. To get a full list of all ringtones available on the system use the method getAllRintones.

####Parameters
<ul><li>name : <span class='text-info'>STRING</span><p>Name of the ringtone to be played. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.Mediaplayer.playRingTone(<span class="text-info">STRING</span> name)</code> </li></ul></li></ul>

### start(<span class="text-info">STRING</span> filename)Play a media file using the supplied filename.

####Parameters
<ul><li>filename : <span class='text-info'>STRING</span><p>File name of the audio media to be played - absolute filepath. On iOS when you post URL to remote server (except https), then we open a standard browser (another application) for playing it. On iOS we support: mp3, mp4, wav formats. On other platforms the formats supported depend on what support is built into the platform. Typically on WM/CE this will be wav and on Android mp3. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.Mediaplayer.start(<span class="text-info">STRING</span> filename)</code> </li></ul></li></ul>

### startvideo(<span class="text-info">STRING</span> filename)Playing a video file back.

####Parameters
<ul><li>filename : <span class='text-info'>STRING</span><p>File name of the video media to be played - full filepath. On iOS when you post URL to remote server  (except https), then we open a standard browser (another application) for playing it. On iOS we support: mov, mp4, 3gp formats. On other platforms the formats supported depend on what support is built into the platform. Typically on WM/CE this will be wmv and on Android mp4. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.Mediaplayer.startvideo(<span class="text-info">STRING</span> filename)</code> </li></ul></li></ul>

### stop()Stop playing the media file. Not applicable on iOS, because on iOS the special UI is opened for playback audio / video - user can stop / close player by UI.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.Mediaplayer.stop()</code> </li></ul></li></ul>

### stopRingTone()Stop the currently playing ringtone.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.Mediaplayer.stopRingTone()</code> </li></ul></li></ul>

### stopvideo()Stop the playback of a currently playing video file. Not applicable on iOS, because on iOS the special UI is opened for playback audio / video - user can stop / close player by UI.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.Mediaplayer.stopvideo()</code> </li></ul></li></ul>