#Network


## Overview
<p>This API class allows you to interact with either the WAN or WiFI network of the device.</p>
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



### cancel()
Cancel the request identified by callback. If callback is not specified then all requests will be canceled.

### connectWan()
Connects the device to a Wide Area Network. The connection destination must be first configured through the Connection Manager (on the device) and the destination name provided to this method. If a connection is already established, you must first call disconnectWan before attempting another connection. A list of available connection destinations is written to the log file when either connectWan or disconnectWan are first specified. Specify the connection as 'Internet' to use the default internet connection defined on the device. If the specified destination does not exist no connection attempt will be made and an entry will be made in the log file.

### detectConnection()
Begins polling the specified host on the specified URL to check if there is a network connection available. The connection status is reported back via the provided callback. Note that callback will be called only if connection status has changed compared to previous polling.

### disconnectWan()
Disconnects the current WAN connection. DisconnectWan will only affect connections established by RhoElements so if you have not previously called connectWan this function will have no effect.

### downloadFile()
Download a file to the specified filename. Note: if 'overwriteFile' flag is default or false, the HEAD request to the server will be performed before actual download to retrieve 'last-modified' header which is used to support resuming interrupted download. If targeted server doesn't support HEAD requests, 'overwriteFile' should be set to true.

### get()
Perform a HTTP GET request.

### hasCellNetwork()
Returns true if the device is connected to a cell network. Not supported on Windows CE.

### hasNetwork()
Returns true if the device is connected to a network. Not supported on Windows CE.

### hasWifiNetwork()
Returns true if the device is connected to a WiFi network. Not supported on Windows CE.

### post()
Perform a HTTP Post.

### startStatusNotify()
Start network status notifications. Notifications are sent when WiFi or Cell network appear/disappear. To check real Internet connectivity use detectConnection method. Not supported on Windows CE.

### stopDetectingConnection()
Ceases the network detection identified by the given callback.

### stopStatusNotify()
Stop network status notifications. Not supported on Windows CE.

### uploadFile()
Upload the specified file using HTTP POST.