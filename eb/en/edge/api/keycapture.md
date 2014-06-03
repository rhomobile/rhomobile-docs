#KeyCapture


## Overview
<p>The KeyCapture module is used to intercept or override hardware keys. It is typically used to provide certain application functions through the use of the device&rsquo;s physical keyboard or other hardware enabled buttons.</p>
<h2>Enabling the API</h2>

<p>In order to use this API you must include the following extension in your <code>build.yml</code></p>

<pre><code>:::ruby
extensions: ["hardwarekeys"]
</code></pre>

<p>The <code>hardwarekeys</code> extension is also included automatically if you specify the following in your <code>build.yml</code></p>

<pre><code>:::ruby
app_type: "rhoelements"
</code></pre>

<p>NOTE: If you are building a Windows Mobile or Windows CE app with this API, you must set your app_type as &ldquo;rhoelements&rdquo; in your build.yml as shown <a href="../guide/build_config#other-build-time-settings">here</a>.</p>

<h2>JavaScript Usage</h2>

<p>Be sure to review the <a href="/guide/api_js">JavaScript API Usage</a> guide for important information about using this API in JavaScript</p>

<h2>Ruby Usage</h2>

<p>Be sure to review the <a href="/guide/api_ruby">Ruby API Usage</a> guide for important information about using this API in Ruby</p>



##Methods



### captureKey()
Notifies the user when a specified physical key is pressed. The key event can also be absorbed so that it isn't delivered to the web view. If the callback is not set then the capture setting for the given key will be cleared.

### captureTrigger()
Captures the event whenever a device hardware trigger is pressed or released. If the callback is not set then the capture setting for the trigger will be cleared. The trigger presses cannot be absorbed. All trigger presses will propagate to RhoElements.

### remapKey()
Captures and consumes a specific key value and spawns a new key event with the remapped key code. If remapTo is empty or null, the remapping for this key value will be cleared.