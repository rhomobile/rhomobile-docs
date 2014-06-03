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



### getAllRingtones()
Getting all ringtones on the device - result is array of hashes , each HASH contains name, fullname pairs of info about ringtone.

### playRingTone()
Play a ringtone with the name supplied being used to designate which one. You cannot supply a location for the ringtone. They are built in. To get a full list of all ringtones available on the system use the method getAllRintones.

### start()
Play a media file using the supplied filename.

### startvideo()
Playing a video file back.

### stop()
Stop playing the media file. Not applicable on iOS, because on iOS the special UI is opened for playback audio / video - user can stop / close player by UI.

### stopRingTone()
Stop the currently playing ringtone.

### stopvideo()
Stop the playback of a currently playing video file. Not applicable on iOS, because on iOS the special UI is opened for playback audio / video - user can stop / close player by UI.