#SignalIndicators


## Overview
<p>The Signal API is used to notify the user of the strength of the WLAN signal.  For Windows Mobile / CE, only Motorola Solutions' devices are supported and it is also possible to display a small indicator showing the available signal.  The WLAN signal strength is not available on Windows Phone 8 and therefore this API is not supported on that platform.</p>
<h2>Enabling the API</h2>

<p>In order to use this API you must include the following extension in your <code>build.yml</code>.</p>

<pre><code>:::ruby
extensions: ["indicators"]
</code></pre>

<p>The <code>indicators</code> extension is also included automatically if you specify the following in your <code>build.yml</code>.</p>

<pre><code>:::ruby
app_type: "rhoelements"
</code></pre>

<p>NOTE: If you are building a Windows Mobile or Windows CE app with this API, you must set your app_type as &ldquo;rhoelements&rdquo; in your build.yml as shown <a href="../guide/build_config#other-build-time-settings">here</a>.</p>

<h2>JavaScript Usage</h2>

<p>Be sure to review the <a href="/guide/api_js">JavaScript API Usage</a> guide for important information about using this API in JavaScript.</p>

<h2>Ruby Usage</h2>

<p>Be sure to review the <a href="/guide/api_ruby">Ruby API Usage</a> guide for important information about using this API in Ruby.</p>



##Methods



### hideIcon()
Hide the icon if it has been previously set by the 'showIcon' call.

### showIcon()
Overlays a small signal icon on top of the view indicating the remaining signal strength.  This is particularly useful in full screen applications which cover the system signal level indicator.

### stopWlanStatus()
If the signal is being retrieved via callback, by a previously invoked call to wlanStatus, this method will stop the callback from firing.

### wlanStatus()
Retrieve the current signal status.  If a callback is provided to retrieve the signal then it will be called periodically at the specified refreshInterval. On Android, instead of being called periodically, the callback will be called when one of the below values changes.