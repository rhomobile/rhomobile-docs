#Network


## Overview
This API class allows you to interact with either the WAN or WiFI network of the device.
## Enabling the API
In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* ebapi-modules.js - this file contains all available Enterprise Browser APIs

If you wish to minimize the amount of JavaScript being included, you can choose to only include the individual API that your application is using:

ex:

* ebapi.js - core APIs needed 
* eb.network.js - just the NativeToolbar API
* other individual JavaScript files included with the Enterprise Browser installation

        


##Methods



### cancel()
<p>Cancel the request identified by callback. If callback is not specified then all requests will be canceled.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Network.cancel()</code> 


### connectWan(<span class="text-info">STRING</span> connectionDestination)
<p>Connects the device to a Wide Area Network. The connection destination must be first configured through the Connection Manager (on the device) and the destination name provided to this method. If a connection is already established, you must first call disconnectWan before attempting another connection. A list of available connection destinations is written to the log file when either connectWan or disconnectWan are first specified. Specify the connection as &lsquo;Internet&rsquo; to use the default internet connection defined on the device. If the specified destination does not exist no connection attempt will be made and an entry will be made in the log file.</p>


####Parameters
<ul><li>connectionDestination : <span class='text-info'>STRING</span><p>
<p>The connection in the Windows Connection manager to use, specify &lsquo;Internet&rsquo; to use the default internet connection.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>phoneSignalStrength : <span class='text-info'>STRING</span><p>
<p>The signal strength of the phone as a percentage of maximum strength. Returned as a number between 0 and 100. If there is no phone service this field will be 0.</p>
 </p></li><li>networkOperator : <span class='text-info'>STRING</span><p>
<p>The name of the current network operator associated with the SIM card.</p>
 </p></li><li>connectionTypeAvailable : <span class='text-info'>STRING</span><p>
<p>The current data connection type available to RhoElements as provided by the Network. Values can be &lsquo;Unavailable&rsquo;, GPRS, 1XRTT, EVDO, EDGE, UMTS, EVDV or HSDPA.</p>
 </p></li><li>connectionTypeConnected : <span class='text-info'>STRING</span><p>
<p>The data connection type to which the device is currently connected. The values returned are identical to connectionTypeAvailable, with the exception that &lsquo;Not Connected&rsquo; replaces &lsquo;Unavailable&rsquo;.</p>
 </p></li><li>connectionManagerMessage : <span class='text-info'>STRING</span><p>
<p>This is the last received status from the Connection Manager. Do NOT use this parameter to determine if you are able to physically send / receive data to a remote host, it only provides an indication of whether the Connection Manager believes the connection is available. To determine if you are connected to a remote host use the detectConnection method.</p>
 </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Network.connectWan(<span class="text-info">STRING</span> connectionDestination)</code> 


### detectConnection(<span class="text-info">HASH</span> propertyMap)
<p>Begins polling the specified host on the specified URL to check if there is a network connection available. The connection status is reported back via the provided callback. Note that callback will be called only if connection status has changed compared to previous polling.</p>


####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>
<p>Properties map.</p>
 </p></li><ul><li>host : <span class='text-info'>STRING</span><span class='label '> Default: www.motorolasolutions.com</span><p>
<p>When detecting a network connection, this is the URL or IP address of the server to attempt to connect to.</p>
 </p></li><li>port : <span class='text-info'>INTEGER</span><span class='label '> Default: 80</span><p>
<p>When detecting a network connection, this is the port on the host to connect to.</p>
 </p></li><li>pollInterval : <span class='text-info'>INTEGER</span><span class='label '> Default: 30000</span><p>
<p>The time, in milliseconds, between each check for a connection. Note that the actual connection report interval will be the sum of the poll interval and the detection timeout.  The minimum allowed value is 5000ms.</p>
 </p></li><li>detectionTimeout : <span class='text-info'>INTEGER</span><span class='label '> Default: 1000</span><p>
<p>The amount of time to attempt to connect to the specified URL before giving up and assuming &lsquo;disconnected&rsquo;.  Value is specified in milliseconds.</p>
 </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>connectionInformation : <span class='text-info'>STRING</span><p>
<p>Whether the device is connected to the specified host and port.  Either &lsquo;Connected&rsquo; or &lsquo;Disconnected&rsquo;.</p>
 </p></li><li>failureMessage : <span class='text-info'>STRING</span><p>
<p>If the device is disconnected this field will contain information about why the connection failed.</p>
 </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Network.detectConnection(<span class="text-info">HASH</span> propertyMap)</code> 


### disconnectWan()
<p>Disconnects the current WAN connection. DisconnectWan will only affect connections established by RhoElements so if you have not previously called connectWan this function will have no effect.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Network.disconnectWan()</code> 


### downloadFile(<span class="text-info">HASH</span> propertyMap)
<p>Download a file to the specified filename. Note: if &lsquo;overwriteFile&rsquo; flag is default or false, the HEAD request to the server will be performed before actual download to retrieve &lsquo;last-modified&rsquo; header which is used to support resuming interrupted download. If targeted server doesn&rsquo;t support HEAD requests, &lsquo;overwriteFile&rsquo; should be set to true.</p>


####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>
<p>Properties to be used in this request.</p>
 </p></li><ul><li>url : <span class='text-info'>STRING</span><p>
<p>URL of file to be downloaded. HTTP and HTTPS protocols are supported.</p>
 </p></li><li>filename : <span class='text-info'>STRING</span><p>
<p>The path and name of the file to be uploaded.</p>
 </p></li><li>overwriteFile : <span class='text-info'>BOOLEAN</span><span class='label '> Default: false</span><p>
<p>OverWriteFile will overwrite the destination file if it already exists.</p>
 </p></li><li>createFolders : <span class='text-info'>BOOLEAN</span><span class='label '> Default: false</span><p>
<p>CreateFolders can automatically create the directory path.</p>
 </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>body : <span class='text-info'>STRING</span><p>
<p>The body of the HTTP response.</p>
 </p></li><li>headers : <span class='text-info'>HASH</span><p>
<p>A hash containing the response headers.</p>
 </p></li><li>cookies : <span class='text-info'>STRING</span><p>
<p>The server cookies, parsed and usable for subsequent requests.</p>
 </p></li><li>http_error : <span class='text-info'>INTEGER</span><p>
<p>HTTP error code if response code was not 200.</p>
 </p></li><li>fileExists : <span class='text-info'>BOOLEAN</span><p>
<p>When overwriteFile is false and file exists, when error return and this flag set to true.</p>
 </p></li></ul></ul>

####Returns
Synchronous Return:

* HASH<ul><li>body : <span class='text-info'>STRING</span><p>
<p>The body of the HTTP response.</p>
 </p></li><li>headers : <span class='text-info'>HASH</span><p>
<p>A hash containing the response headers.</p>
 </p></li><li>cookies : <span class='text-info'>STRING</span><p>
<p>The server cookies, parsed and usable for subsequent requests.</p>
 </p></li><li>http_error : <span class='text-info'>INTEGER</span><p>
<p>HTTP error code if response code was not 200.</p>
 </p></li><li>fileExists : <span class='text-info'>BOOLEAN</span><p>
<p>When overwriteFile is false and file exists, when error return and this flag set to true.</p>
 </p></li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Network.downloadFile(<span class="text-info">HASH</span> propertyMap)</code> 


### get(<span class="text-info">HASH</span> propertyMap)
<p>Perform a HTTP GET request.</p>


####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>
<p>Properties map.</p>
 Valid `properties` for this parameter are the properties avaliable to this API module. <a href='#Properties'>Check the property section</a> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>body : <span class='text-info'>STRING</span><p>
<p>The body of the HTTP response.</p>
 </p></li><li>headers : <span class='text-info'>HASH</span><p>
<p>A hash containing the response headers.</p>
 </p></li><li>cookies : <span class='text-info'>STRING</span><p>
<p>The server cookies, parsed and usable for subsequent requests.</p>
 </p></li><li>http_error : <span class='text-info'>INTEGER</span><p>
<p>HTTP error code if response code was not 200.</p>
 </p></li></ul></ul>

####Returns
Synchronous Return:

* HASH<ul><li>body : <span class='text-info'>STRING</span><p>
<p>The body of the HTTP response.</p>
 </p></li><li>headers : <span class='text-info'>HASH</span><p>
<p>A hash containing the response headers.</p>
 </p></li><li>cookies : <span class='text-info'>STRING</span><p>
<p>The server cookies, parsed and usable for subsequent requests.</p>
 </p></li><li>http_error : <span class='text-info'>INTEGER</span><p>
<p>HTTP error code if response code was not 200.</p>
 </p></li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Network.get(<span class="text-info">HASH</span> propertyMap)</code> 


### hasCellNetwork()
<p>Returns true if the device is connected to a cell network. Not supported on Windows CE.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:

* BOOLEAN

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Network.hasCellNetwork()</code> 


### hasNetwork()
<p>Returns true if the device is connected to a network. Not supported on Windows CE.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:

* BOOLEAN

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Network.hasNetwork()</code> 


### hasWifiNetwork()
<p>Returns true if the device is connected to a WiFi network. Not supported on Windows CE.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:

* BOOLEAN

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Network.hasWifiNetwork()</code> 


### post(<span class="text-info">HASH</span> propertyMap)
<p>Perform a HTTP Post.</p>


####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>
<p>The properties for the Network module can be used in this hash along with the following:</p>
 </p></li><ul><li>body : <span class='text-info'>STRING</span><p>
<p>The message body of the HTTP request.</p>
 </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>body : <span class='text-info'>STRING</span><p>
<p>The body of the HTTP response.</p>
 </p></li><li>headers : <span class='text-info'>HASH</span><p>
<p>A hash containing the response headers.</p>
 </p></li><li>cookies : <span class='text-info'>STRING</span><p>
<p>The server cookies, parsed and usable for subsequent requests.</p>
 </p></li><li>http_error : <span class='text-info'>INTEGER</span><p>
<p>HTTP error code if response code was not 200.</p>
 </p></li></ul></ul>

####Returns
Synchronous Return:

* HASH<ul><li>body : <span class='text-info'>STRING</span><p>
<p>The body of the HTTP response.</p>
 </p></li><li>headers : <span class='text-info'>HASH</span><p>
<p>A hash containing the response headers.</p>
 </p></li><li>cookies : <span class='text-info'>STRING</span><p>
<p>The server cookies, parsed and usable for subsequent requests.</p>
 </p></li><li>http_error : <span class='text-info'>INTEGER</span><p>
<p>HTTP error code if response code was not 200.</p>
 </p></li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Network.post(<span class="text-info">HASH</span> propertyMap)</code> 


### startStatusNotify(<span class="text-info">INTEGER</span> pollInterval)
<p>Start network status notifications. Notifications are sent when WiFi or Cell network appear/disappear. To check real Internet connectivity use detectConnection method. Not supported on Windows CE.</p>


####Parameters
<ul><li>pollInterval : <span class='text-info'>INTEGER</span><span class='label '> Default: 20</span><p>
<p>The network status polling period for systems that can not notify network status change immediately. In seconds. Currently applies to iOS only as immediate status notification is not available on this platform.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>current_status : <span class='text-info'>STRING</span><p>
<p>Current status of network connection. Can be &ldquo;connected&rdquo; or &ldquo;disconnected&rdquo;.</p>
 </p></li><li>prev_status : <span class='text-info'>STRING</span><p>
<p>Previous status of network connection. Can be &ldquo;connected&rdquo;, &ldquo;disconnected&rdquo; or &ldquo;unknown&rdquo;."</p>
 </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Network.startStatusNotify(<span class="text-info">INTEGER</span> pollInterval)</code> 


### stopDetectingConnection()
<p>Ceases the network detection identified by the given callback.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Network.stopDetectingConnection()</code> 


### stopStatusNotify()
<p>Stop network status notifications. Not supported on Windows CE.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Network.stopStatusNotify()</code> 


### uploadFile(<span class="text-info">HASH</span> propertyMap)
<p>Upload the specified file using HTTP POST.</p>


####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>
<p>The properties for the Network module can be used in this hash along with the following:</p>
 </p></li><ul><li>filename : <span class='text-info'>STRING</span><p>
<p>The path and name of the file to be uploaded.</p>
 </p></li><li>body : <span class='text-info'>STRING</span><p>
<p>The message body of the HTTP request.</p>
 </p></li><li>fileContentType : <span class='text-info'>STRING</span><p>
<p>Content-Type header for the file, defaults to &ldquo;application/octet-stream&rdquo;.</p>
 </p></li><li>multipart : <span class='text-info'>ARRAY</span><p>
<p>Array of hashes containing file information.</p>
 </p></li><ul><li><i>Object</i> : <span class='text-info'>HASH</span><p>
<p>Multipart properties.</p>
 </p></li><ul><li>filename : <span class='text-info'>STRING</span><p>
<p>The path and name of the file to be uploaded.</p>
 </p></li><li>contentType : <span class='text-info'>STRING</span><p>
<p>Content-Type header, defaults to &ldquo;application/octet-stream&rdquo;.</p>
 </p></li><li>filenameBase : <span class='text-info'>STRING</span><p>
<p>Base directory containing the :filename.</p>
 </p></li><li>name : <span class='text-info'>STRING</span><p>
<p>File type, defaults to &ldquo;blob&rdquo;.</p>
 </p></li></ul></ul></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>body : <span class='text-info'>STRING</span><p>
<p>The body of the HTTP response.</p>
 </p></li><li>headers : <span class='text-info'>HASH</span><p>
<p>A hash containing the response headers.</p>
 </p></li><li>cookies : <span class='text-info'>STRING</span><p>
<p>The server cookies, parsed and usable for subsequent requests.</p>
 </p></li><li>http_error : <span class='text-info'>INTEGER</span><p>
<p>HTTP error code if response code was not 200.</p>
 </p></li></ul></ul>

####Returns
Synchronous Return:

* HASH<ul><li>body : <span class='text-info'>STRING</span><p>
<p>The body of the HTTP response.</p>
 </p></li><li>headers : <span class='text-info'>HASH</span><p>
<p>A hash containing the response headers.</p>
 </p></li><li>cookies : <span class='text-info'>STRING</span><p>
<p>The server cookies, parsed and usable for subsequent requests.</p>
 </p></li><li>http_error : <span class='text-info'>INTEGER</span><p>
<p>HTTP error code if response code was not 200.</p>
 </p></li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Network.uploadFile(<span class="text-info">HASH</span> propertyMap)</code> 


##Properties



###authPassword

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Password for basic authentication. You must also specify `authType=&lsquo;basic&rsquo;</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Network.authPassword</code>

This property cannot be accessed via setter or getter methods. It can be used in methods that allow a HASH or Array of properties to be passed in.


####Platforms

* Android
* Windows Mobile/CE

###authType

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Type of authentication used for this request. Check the list of available options below. Leaving blank will result in no authentication type.</p>

####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.Network.AUTH_BASIC - String: basic 
<p>Basic Authentication Type. uses authUser and authPassword.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Network.authType</code>

This property cannot be accessed via setter or getter methods. It can be used in methods that allow a HASH or Array of properties to be passed in.


####Platforms

* Android
* Windows Mobile/CE

###authUser

####Type
<span class='text-info'>STRING</span> 
####Description

<p>User name for basic authentication. You must also specify <code>authType='basic'</code></p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Network.authUser</code>

This property cannot be accessed via setter or getter methods. It can be used in methods that allow a HASH or Array of properties to be passed in.


####Platforms

* Android
* Windows Mobile/CE

###headers

####Type
<span class='text-info'>HASH</span> 
####Description

<p>List of HTTP headers to be used in the network  request.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Network.headers</code>

This property cannot be accessed via setter or getter methods. It can be used in methods that allow a HASH or Array of properties to be passed in.


####Platforms

* Android
* Windows Mobile/CE

###<span class="text-info">httpVerb</span>

####Type
<span class='text-info'>STRING</span> 
####Description
<span class='label label-info'>Replaces:http_command</span> 
<p>HTTP verb to be used in the network request.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Network.httpVerb</code>

This property cannot be accessed via setter or getter methods. It can be used in methods that allow a HASH or Array of properties to be passed in.


####Platforms

* Android
* Windows Mobile/CE

###responseTimeout

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Timeout of network requests in seconds. This property has module scope. Do not pass it as hash parameter to methods, use property accessors instead.</p>

####Params
<p><strong>Default:</strong> 30</p>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Network.responseTimeout</code>

This property cannot be accessed via setter or getter methods. It can be used in methods that allow a HASH or Array of properties to be passed in.


####Platforms

* Android
* Windows Mobile/CE

###url

####Type
<span class='text-info'>STRING</span> 
####Description

<p>URL of the request. This should be fully formatted URL like http://domain.com/</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Network.url</code>

This property cannot be accessed via setter or getter methods. It can be used in methods that allow a HASH or Array of properties to be passed in.


####Platforms

* Android
* Windows Mobile/CE

###<span class="text-info">verifyPeerCertificate</span>

####Type
<span class='text-info'>BOOLEAN</span> 
####Description
<span class='label label-info'>Replaces:ssl_verify_peer</span> 
<p>Verify SSL certificates. When set to false it will allow untrusted certificates.</p>

####Params
<p><strong>Default:</strong> true</p>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Network.verifyPeerCertificate</code>

This property cannot be accessed via setter or getter methods. It can be used in methods that allow a HASH or Array of properties to be passed in.


####Platforms

* Android
* Windows Mobile/CE

##Remarks



###Detecting a connection through proxies
<p>Because the detectConnection method is protocol agnostic, it will not communicate through HTTP proxies to reach a specified URL. In order to determine if you are connected when sitting behind a proxy you should call the method to attempt to connect to your proxy on the appropriate port. A successful connection to the proxy should be taken to assume the device is connected to a network. When configuring your WAN connection bear in mind that the proxy settings defined in the RhoElements configuration file will take precedence.</p>


###Detecting a connection over WAN
<p>When detecting a network connection over WAN bear in mind if you specify a low networkPollInterval your device will frequently have an active data connection and may prevent the device occasionally from accepting incoming calls.</p>


###Preventing access to the device (WEH / WM)
<p>Receiving phone calls or texts whilst running RhoElements will cause the start button to be displayed on Windows Embedded Handheld devices, potentially offering users access to the operating system. It is recommended to set the following registry keys to disable Operating System access on Windows Embedded Handheld as required. The registry keys will be applied after a warm boot, omit them entirely to restore the Start and &lsquo;X&rsquo; icons.</p>

<pre>
[HKEY_LOCAL_MACHINE\Software\Microsoft\Shell\BubbleTiles]   Location in Registry
"HardwareStartKeyEnabled"=dword:00000001                    Prevents the Start icon from appearing in the bottom left
"HardwareDoneKeyEnabled"=dword:00000001                     Prevents the 'X' icon from appearing in the bottom right
</pre>



