#ScreenOrientation


## Overview
<p>The ScreenOrientation Module is used to control the screen orientation / layout and register to receive an event when it changes.</p>
<h2>Enabling the API</h2>

<p>In order to use this API you must include the following extension in your <code>build.yml</code>.</p>

<pre><code>:::ruby
extensions: ["screenorientation"]
</code></pre>

<h2>JavaScript Usage</h2>

<p>Be sure to review the <a href="/guide/api_js">JavaScript API Usage</a> guide for important information about using this API in JavaScript.</p>

<h2>Ruby Usage</h2>

<p>Be sure to review the <a href="/guide/api_ruby">Ruby API Usage</a> guide for important information about using this API in Ruby.</p>



##Methods



### leftHanded()
Sets the screen orientation to left-handed orientation. Note the webpage will not reformat in line with the new screen size automatically.

### normal()
Sets the screen orientation to default device orientation.

### rightHanded()
Sets the screen orientation to right-handed orientation. Note the webpage will not reformat in line with the new screen size automatically.

### setScreenOrientationEvent()
Sets the callback to be called when a screen orientation event occurs.

### upsideDown()
Sets the screen orientation to upside down, useful if presenting the device to a customer to obtain a signature.