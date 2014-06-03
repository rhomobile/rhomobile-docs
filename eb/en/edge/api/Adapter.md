#Adapter


## Overview
<p>NFC Adapter</p>
<p>NFC Adapter provides access to the NFC device to perform device related operations.</p>

<pre><code>All properties and methods should be used after activate. Besides supported and isActive.
</code></pre>

<h2>Enabling the API</h2>

<p>In order to use this API you must include the following extension in your <code>build.yml</code></p>

<pre><code>:::ruby
extensions: ["NFC"]
</code></pre>

<p>NOTE: If you are building a Windows Mobile or Windows CE app with this API, you must set your app_type as &ldquo;rhoelements&rdquo; in your build.yml as shown <a href="../guide/build_config#other-build-time-settings">here</a>.</p>



##Methods



### activate()
Activates the NFC device so that all the NFC operations will be executed.

### btConnect()
Connects the Bluetooth device to obtain device properties.

### btDisconnect()
Disconnects the Bluetooth device.

### getDeviceInfo()
Gets the NFC device capabilities.

### reset()
Resets the NFC device to default configuration. Pollingtime will set to 90, passkey to empty string.

### setConfigChangeHandler()
Register callback for config change. If you change properties like pollingTimeout, passkey then callback will fire.

### setMessageHandler()
Register callback for Message receive.

### setTagDetectionHandler()
Register callback for Tag detection.

### stop()
Stops the NFC device.