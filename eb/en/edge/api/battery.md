#Battery


## Overview
<p>The Battery API is used to notify the user of the remaining power in the battery. Windows Mobile / CE devices also support displaying a small indicator to show the available power.</p>
<h2>Enabling the API</h2>

<p>In order to use this API you must include the following extension in your <code>build.yml</code>.</p>

<pre><code>:::ruby
extensions: ["indicators"]
</code></pre>

<p>The <code>indicators</code> extension is also included automatically if you specify the following in your <code>build.yml</code></p>

<pre><code>:::ruby
app_type: "rhoelements"
</code></pre>

<p>NOTE: If you are building a Windows Mobile or Windows CE app with this API, you must set your app_type as &ldquo;rhoelements&rdquo; in your build.yml as shown <a href="../guide/build_config#other-build-time-settings">here</a>.</p>

<h2>JavaScript Usage</h2>

<p>Be sure to review the <a href="/guide/api_js">JavaScript API Usage</a> guide for important information about using this API in JavaScript.</p>

<h2>Ruby Usage</h2>

<p>Be sure to review the <a href="/guide/api_ruby">Ruby API Usage</a> guide for important information about using this API in Ruby.</p>



##Methods



### batteryStatus()
Retrieve the current battery level. If a callback is provided to retrieve the battery then it will be called periodically at a frequency determined by the trigger property.

### hideIcon()
Hide the icon if it has been previously set by the 'showIcon' call.

### showIcon()
Overlays a small battery icon on top of the view indicating the remaining battery strength. This is particularly useful in full screen applications which cover the system battery level indicator.

### smartBatteryStatus()
Returns the various parameters relating to battery charge and battery hardware. Not all return values may be supported by all batteries.

### stopBatteryStatus()
If the battery status is being retrieved via callback, by a previously invoked call to batteryStatus, this method will stop the callback from firing.