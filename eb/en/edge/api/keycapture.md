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



### captureKey(<span class="text-info">BOOLEAN</span> dispatch, <span class="text-info">STRING</span> keyValue)Notifies the user when a specified physical key is pressed. The key event can also be absorbed so that it isn't delivered to the web view. If the callback is not set then the capture setting for the given key will be cleared.

####Parameters
<ul><li>dispatch : <span class='text-info'>BOOLEAN</span><p>After a key has been intercepted this parameter will determine whether or not it will still be received by the Web View. For example if you have focus in a text box and are intercepting keys set this to 'False' to avoid having the keys appear in the box. For iOS devices this parameter has no effect. If any of volume keys are captured, real sound volume will not be changed. </p></li><li>keyValue : <span class='text-info'>STRING</span><p>Specifies the identifier of the key to capture. This this value is the operating system's identifier for the key, not the ASCII representation of the key (for example, the 'a' key on Windows Mobile devices has a keyValue of 101). Alternatively, this parameter can be set to 'all'. This value will capture all hardware key presses. This parameter needs to be passed as a string (for example '101' or '0x65' or 'all'). </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>keyValue : <span class='text-info'>INTEGER</span><p>The internal representation of the key expressed in decimal, e.g. 13 is the return key. Platforms:WM, Android </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.KeyCapture.captureKey(<span class="text-info">BOOLEAN</span> dispatch, <span class="text-info">STRING</span> keyValue)</code> </li></ul></li></ul>

### captureTrigger()Captures the event whenever a device hardware trigger is pressed or released. If the callback is not set then the capture setting for the trigger will be cleared. The trigger presses cannot be absorbed. All trigger presses will propagate to RhoElements.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>triggerFlag : <span class='text-info'>INTEGER</span><p>The combination of the triggers pressed and the state of the triggers. Older devices may report duplicate values for different triggers on the device due to a platform issue, this has been resolved in newer devices. </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* Windows Embedded
* Motorola Solutions Devices Only

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.KeyCapture.captureTrigger()</code> </li></ul></li></ul>

### remapKey(<span class="text-info">STRING</span> keyValue, <span class="text-info">STRING</span> remapTo)Captures and consumes a specific key value and spawns a new key event with the remapped key code. If remapTo is empty or null, the remapping for this key value will be cleared.

####Parameters
<ul><li>keyValue : <span class='text-info'>STRING</span><p>Specifies the identifier of the key to capture. This this value is the operating system's identifier for the key, not the ASCII representation of the key (for example, the 'a' key on Windows Mobile devices has a keyValue of 101). This parameter needs to be passed as a string (for example '101' or '0x65'). </p></li><li>remapTo : <span class='text-info'>STRING</span><p>The operating system's identifier of the key press event to generate when the keyValue is captured. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.KeyCapture.remapKey(<span class="text-info">STRING</span> keyValue, <span class="text-info">STRING</span> remapTo)</code> </li></ul></li></ul>

##Properties



###homeKeyValue

####Type
<span class='text-info'>STRING</span> 
####Description
Specifies a key which, when pressed, will navigate to the start page as defined in the RhoElements configuration. Set to 'Disabled' to prevent this behavior.
####Params
<p><strong>Default:</strong> Disabled</p>
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>Rho.KeyCapture.homeKeyValue</code> </li></ul></li></ul>