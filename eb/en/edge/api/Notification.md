#Notification


## Overview
<p>The Notification API allows you to provide feedback to the user, either auditory, tactile or visual. Use this API to give a visual popup window, sound the device beeper or illuminate the device LEDs (hardware permitting).</p>
<h2>Enabling the API</h2>

<p>This API is part of the <code>coreapi</code> extension that is included automatically.</p>

<pre><code>:::ruby
extensions: ["coreapi"]
</code></pre>

<h2>JavaScript Usage</h2>

<p>Be sure to review the <a href="/guide/api_js">JavaScript API Usage</a> guide for important information about using this API in JavaScript.</p>

<h2>Ruby Usage</h2>

<p>Be sure to review the <a href="/guide/api_ruby">Ruby API Usage</a> guide for important information about using this API in Ruby.</p>



##Methods



### beep()
If the device is equipped with a beeper then a beep will be emitted. Not supported on iOS devices.

### hidePopup()
Closes the current popup window.

### playFile()
Play an audio file if that media type is supported by the device.

### showPopup()
Bring the application up front and show a message in a popup window. The message can be passed as a string or a hash. The popup window closes after you click on one of the buttons in the `button` array. Icon is not supported on iOS devices.

### showStatus()
Display a window containing a status message. The window closes after the user clicks on its hide button. Note: Android will show a toast message for a short time in addition to a dialog window.

### vibrate()
Vibrate the device's pager hardware. Need 'vibrate' capability set at build.yml for Android.