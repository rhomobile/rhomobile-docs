#Network


## Overview
This API class allows you to interact with either the WAN or WiFI network of the device.
## Enabling the API
This API is part of the `coreapi` extension that is included automatically.
    :::ruby
    extensions: ["coreapi"]

## JavaScript Usage
Be sure to review the [JavaScript API Usage](/guide/api_js) guide for important information about using this API in JavaScript.

## Ruby Usage
Be sure to review the [Ruby API Usage](/guide/api_ruby) guide for important information about using this API in Ruby.
        


##Methods



### cancel()
Cancel the request identified by callback. If callback is not specified then all requests will be canceled.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Network.cancel()</code> </li></ul></li></ul>

### connectWan(<span class="text-info">STRING</span> connectionDestination)
Connects the device to a Wide Area Network. The connection destination must be first configured through the Connection Manager (on the device) and the destination name provided to this method. If a connection is already established, you must first call disconnectWan before attempting another connection. A list of available connection destinations is written to the log file when either connectWan or disconnectWan are first specified. Specify the connection as 'Internet' to use the default internet connection defined on the device. If the specified destination does not exist no connection attempt will be made and an entry will be made in the log file.

####Parameters
<ul><li>connectionDestination : <span class='text-info'>STRING</span><p>
The connection in the Windows Connection manager to use, specify 'Internet' to use the default internet connection. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>phoneSignalStrength : <span class='text-info'>STRING</span><p>
The signal strength of the phone as a percentage of maximum strength. Returned as a number between 0 and 100. If there is no phone service this field will be 0. </p></li><li>networkOperator : <span class='text-info'>STRING</span><p>
The name of the current network operator associated with the SIM card. </p></li><li>connectionTypeAvailable : <span class='text-info'>STRING</span><p>
The current data connection type available to RhoElements as provided by the Network. Values can be 'Unavailable', GPRS, 1XRTT, EVDO, EDGE, UMTS, EVDV or HSDPA. </p></li><li>connectionTypeConnected : <span class='text-info'>STRING</span><p>
The data connection type to which RhoElements is currently connected. The values returned are identical to connectionTypeAvailable, with the exception that 'Not Connected' replaces 'Unavailable'. </p></li><li>connectionManagerMessage : <span class='text-info'>STRING</span><p>
This is the last received status from the Connection Manager. Do NOT use this parameter to determine if you are able to physically send / receive data to a remote host, it only provides an indication of whether the Connection Manager believes the connection is available. To determine if you are connected to a remote host use the detectConnection method. </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Network.connectWan(<span class="text-info">STRING</span> connectionDestination)</code> </li></ul></li></ul>

### detectConnection(<span class="text-info">HASH</span> propertyMap)
Begins polling the specified host on the specified URL to check if there is a network connection available. The connection status is reported back via the provided callback. Note that callback will be called only if connection status has changed compared to previous polling.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>
Properties map. </p></li><ul><li>host : <span class='text-info'>STRING</span><span class='label '> Default: www.motorolasolutions.com</span><p>
When detecting a network connection, this is the URL or IP address of the server to attempt to connect to. </p></li><li>port : <span class='text-info'>INTEGER</span><span class='label '> Default: 80</span><p>
When detecting a network connection, this is the port on the host to connect to. </p></li><li>pollInterval : <span class='text-info'>INTEGER</span><span class='label '> Default: 30000</span><p>
The time, in milliseconds, between each check for a connection. Note that the actual connection report interval will be the sum of the poll interval and the detection timeout.  The minimum allowed value is 5000ms. </p></li><li>detectionTimeout : <span class='text-info'>INTEGER</span><span class='label '> Default: 1000</span><p>
The amount of time to attempt to connect to the specified URL before giving up and assuming 'disconnected'.  Value is specified in milliseconds. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>connectionInformation : <span class='text-info'>STRING</span><p>
Whether the device is connected to the specified host and port.  Either 'Connected' or 'Disconnected'. </p></li><li>failureMessage : <span class='text-info'>STRING</span><p>
If the device is disconnected this field will contain information about why the connection failed. </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Network.detectConnection(<span class="text-info">HASH</span> propertyMap)</code> </li></ul></li></ul>

### disconnectWan()
Disconnects the current WAN connection. DisconnectWan will only affect connections established by RhoElements so if you have not previously called connectWan this function will have no effect.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Network.disconnectWan()</code> </li></ul></li></ul>

### downloadFile(<span class="text-info">HASH</span> propertyMap)
Download a file to the specified filename. Note: if 'overwriteFile' flag is default or false, the HEAD request to the server will be performed before actual download to retrieve 'last-modified' header which is used to support resuming interrupted download. If targeted server doesn't support HEAD requests, 'overwriteFile' should be set to true.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>
Properties to be used in this request. </p></li><ul><li>url : <span class='text-info'>STRING</span><p>
URL of file to be downloaded. HTTP and HTTPS protocols are supported. </p></li><li>filename : <span class='text-info'>STRING</span><p>
The path and name of the file to be uploaded. </p></li><li>overwriteFile : <span class='text-info'>BOOLEAN</span><span class='label '> Default: false</span><p>
OverWriteFile will overwrite the destination file if it already exists. </p></li><li>createFolders : <span class='text-info'>BOOLEAN</span><span class='label '> Default: false</span><p>
CreateFolders can automatically create the directory path. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>body : <span class='text-info'>STRING</span><p>
The body of the HTTP response. </p></li><li>headers : <span class='text-info'>HASH</span><p>
A hash containing the response headers. </p></li><li>cookies : <span class='text-info'>STRING</span><p>
The server cookies, parsed and usable for subsequent requests. </p></li><li>http_error : <span class='text-info'>INTEGER</span><p>
HTTP error code if response code was not 200. </p></li><li>fileExists : <span class='text-info'>BOOLEAN</span><p>
When overwriteFile is false and file exists, when error return and this flag set to true. </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>HASH<ul><li>body : <span class='text-info'>STRING</span><p>
The body of the HTTP response. </p></li><li>headers : <span class='text-info'>HASH</span><p>
A hash containing the response headers. </p></li><li>cookies : <span class='text-info'>STRING</span><p>
The server cookies, parsed and usable for subsequent requests. </p></li><li>http_error : <span class='text-info'>INTEGER</span><p>
HTTP error code if response code was not 200. </p></li><li>fileExists : <span class='text-info'>BOOLEAN</span><p>
When overwriteFile is false and file exists, when error return and this flag set to true. </p></li></ul></li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Network.downloadFile(<span class="text-info">HASH</span> propertyMap)</code> </li></ul></li></ul>

### get(<span class="text-info">HASH</span> propertyMap)
Perform a HTTP GET request.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>
Properties map. Valid `properties` for this parameter are the properties avaliable to this API module. <a href='#Properties'>Check the property section</a> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>body : <span class='text-info'>STRING</span><p>
The body of the HTTP response. </p></li><li>headers : <span class='text-info'>HASH</span><p>
A hash containing the response headers. </p></li><li>cookies : <span class='text-info'>STRING</span><p>
The server cookies, parsed and usable for subsequent requests. </p></li><li>http_error : <span class='text-info'>INTEGER</span><p>
HTTP error code if response code was not 200. </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>HASH<ul><li>body : <span class='text-info'>STRING</span><p>
The body of the HTTP response. </p></li><li>headers : <span class='text-info'>HASH</span><p>
A hash containing the response headers. </p></li><li>cookies : <span class='text-info'>STRING</span><p>
The server cookies, parsed and usable for subsequent requests. </p></li><li>http_error : <span class='text-info'>INTEGER</span><p>
HTTP error code if response code was not 200. </p></li></ul></li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Network.get(<span class="text-info">HASH</span> propertyMap)</code> </li></ul></li></ul>

### hasCellNetwork()
Returns true if the device is connected to a cell network. Not supported on Windows CE.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>BOOLEAN</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Network.hasCellNetwork()</code> </li></ul></li></ul>

### hasNetwork()
Returns true if the device is connected to a network. Not supported on Windows CE.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>BOOLEAN</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Network.hasNetwork()</code> </li></ul></li></ul>

### hasWifiNetwork()
Returns true if the device is connected to a WiFi network. Not supported on Windows CE.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>BOOLEAN</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Network.hasWifiNetwork()</code> </li></ul></li></ul>

### post(<span class="text-info">HASH</span> propertyMap)
Perform a HTTP Post.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>
The properties for the Network module can be used in this hash along with the following: </p></li><ul><li>body : <span class='text-info'>STRING</span><p>
The message body of the HTTP request. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>body : <span class='text-info'>STRING</span><p>
The body of the HTTP response. </p></li><li>headers : <span class='text-info'>HASH</span><p>
A hash containing the response headers. </p></li><li>cookies : <span class='text-info'>STRING</span><p>
The server cookies, parsed and usable for subsequent requests. </p></li><li>http_error : <span class='text-info'>INTEGER</span><p>
HTTP error code if response code was not 200. </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>HASH<ul><li>body : <span class='text-info'>STRING</span><p>
The body of the HTTP response. </p></li><li>headers : <span class='text-info'>HASH</span><p>
A hash containing the response headers. </p></li><li>cookies : <span class='text-info'>STRING</span><p>
The server cookies, parsed and usable for subsequent requests. </p></li><li>http_error : <span class='text-info'>INTEGER</span><p>
HTTP error code if response code was not 200. </p></li></ul></li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Network.post(<span class="text-info">HASH</span> propertyMap)</code> </li></ul></li></ul>

### startStatusNotify(<span class="text-info">INTEGER</span> pollInterval)
Start network status notifications. Notifications are sent when WiFi or Cell network appear/disappear. To check real Internet connectivity use detectConnection method. Not supported on Windows CE.

####Parameters
<ul><li>pollInterval : <span class='text-info'>INTEGER</span><span class='label '> Default: 20</span><p>
The network status polling period for systems that can not notify network status change immediately. In seconds. Currently applies to iOS only as immediate status notification is not available on this platform. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>current_status : <span class='text-info'>STRING</span><p>
Current status of network connection. Can be "connected" or "disconnected". </p></li><li>prev_status : <span class='text-info'>STRING</span><p>
Previous status of network connection. Can be "connected", "disconnected" or "unknown"." </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Network.startStatusNotify(<span class="text-info">INTEGER</span> pollInterval)</code> </li></ul></li></ul>

### stopDetectingConnection()
Ceases the network detection identified by the given callback.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Network.stopDetectingConnection()</code> </li></ul></li></ul>

### stopStatusNotify()
Stop network status notifications. Not supported on Windows CE.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Network.stopStatusNotify()</code> </li></ul></li></ul>

### uploadFile(<span class="text-info">HASH</span> propertyMap)
Upload the specified file using HTTP POST.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>
The properties for the Network module can be used in this hash along with the following: </p></li><ul><li>filename : <span class='text-info'>STRING</span><p>
The path and name of the file to be uploaded. </p></li><li>body : <span class='text-info'>STRING</span><p>
The message body of the HTTP request. </p></li><li>fileContentType : <span class='text-info'>STRING</span><p>
Content-Type header for the file, defaults to "application/octet-stream". </p></li><li>multipart : <span class='text-info'>ARRAY</span><p>
Array of hashes containing file information. </p></li><ul><li><i>Object</i> : <span class='text-info'>HASH</span><p>
Multipart properties. </p></li><ul><li>filename : <span class='text-info'>STRING</span><p>
The path and name of the file to be uploaded. </p></li><li>contentType : <span class='text-info'>STRING</span><p>
Content-Type header, defaults to "application/octet-stream". </p></li><li>filenameBase : <span class='text-info'>STRING</span><p>
Base directory containing the :filename. </p></li><li>name : <span class='text-info'>STRING</span><p>
File type, defaults to "blob". </p></li></ul></ul></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>body : <span class='text-info'>STRING</span><p>
The body of the HTTP response. </p></li><li>headers : <span class='text-info'>HASH</span><p>
A hash containing the response headers. </p></li><li>cookies : <span class='text-info'>STRING</span><p>
The server cookies, parsed and usable for subsequent requests. </p></li><li>http_error : <span class='text-info'>INTEGER</span><p>
HTTP error code if response code was not 200. </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>HASH<ul><li>body : <span class='text-info'>STRING</span><p>
The body of the HTTP response. </p></li><li>headers : <span class='text-info'>HASH</span><p>
A hash containing the response headers. </p></li><li>cookies : <span class='text-info'>STRING</span><p>
The server cookies, parsed and usable for subsequent requests. </p></li><li>http_error : <span class='text-info'>INTEGER</span><p>
HTTP error code if response code was not 200. </p></li></ul></li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Network.uploadFile(<span class="text-info">HASH</span> propertyMap)</code> </li></ul></li></ul>

##Properties



###authPassword

####Type
<span class='text-info'>STRING</span> 
####Description

Password for basic authentication. You must also specify `authType='basic'
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.Network.authPassword</code> </li></ul></li></ul>
This property cannot be accessed via setter or getter methods. It can be used in methods that allow a HASH or Array of properties to be passed in.


####Platforms

* Android
* Windows Mobile/CE

###authType

####Type
<span class='text-info'>STRING</span> 
####Description

Type of authentication used for this request. Check the list of available options below. Leaving blank will result in no authentication type.
####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.Network.AUTH_BASIC 
	* String: basic
	* 
Basic Authentication Type. uses authUser and authPassword.
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.Network.authType</code> </li></ul></li></ul>
This property cannot be accessed via setter or getter methods. It can be used in methods that allow a HASH or Array of properties to be passed in.


####Platforms

* Android
* Windows Mobile/CE

###authUser

####Type
<span class='text-info'>STRING</span> 
####Description

User name for basic authentication. You must also specify `authType='basic'`
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.Network.authUser</code> </li></ul></li></ul>
This property cannot be accessed via setter or getter methods. It can be used in methods that allow a HASH or Array of properties to be passed in.


####Platforms

* Android
* Windows Mobile/CE

###headers

####Type
<span class='text-info'>HASH</span> 
####Description

List of HTTP headers to be used in the network  request.
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.Network.headers</code> </li></ul></li></ul>
This property cannot be accessed via setter or getter methods. It can be used in methods that allow a HASH or Array of properties to be passed in.


####Platforms

* Android
* Windows Mobile/CE

###<span class="text-info">httpVerb</span>

####Type
<span class='text-info'>STRING</span> 
####Description
<span class='label label-info'>Replaces:http_command</span> 
HTTP verb to be used in the network request.
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.Network.httpVerb</code> </li></ul></li></ul>
This property cannot be accessed via setter or getter methods. It can be used in methods that allow a HASH or Array of properties to be passed in.


####Platforms

* Android
* Windows Mobile/CE

###responseTimeout

####Type
<span class='text-info'>INTEGER</span> 
####Description

Timeout of network requests in seconds. This property has module scope. Do not pass it as hash parameter to methods, use property accessors instead.
####Params
<p><strong>Default:</strong> 30</p>
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.Network.responseTimeout</code> </li></ul></li></ul>
This property cannot be accessed via setter or getter methods. It can be used in methods that allow a HASH or Array of properties to be passed in.


####Platforms

* Android
* Windows Mobile/CE

###url

####Type
<span class='text-info'>STRING</span> 
####Description

URL of the request. This should be fully formatted URL like http://domain.com/
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.Network.url</code> </li></ul></li></ul>
This property cannot be accessed via setter or getter methods. It can be used in methods that allow a HASH or Array of properties to be passed in.


####Platforms

* Android
* Windows Mobile/CE

###<span class="text-info">verifyPeerCertificate</span>

####Type
<span class='text-info'>BOOLEAN</span> 
####Description
<span class='label label-info'>Replaces:ssl_verify_peer</span> 
Verify SSL certificates. When set to false it will allow untrusted certificates.
####Params
<p><strong>Default:</strong> true</p>
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.Network.verifyPeerCertificate</code> </li></ul></li></ul>
This property cannot be accessed via setter or getter methods. It can be used in methods that allow a HASH or Array of properties to be passed in.


####Platforms

* Android
* Windows Mobile/CE

##Remarks



###Detecting a connection through proxies

Because the detectConnection method is protocol agnostic, it will not communicate through HTTP proxies to reach a specified URL. In order to determine if you are connected when sitting behind a proxy you should call the method to attempt to connect to your proxy on the appropriate port. A successful connection to the proxy should be taken to assume the device is connected to a network. When configuring your WAN connection bear in mind that the proxy settings defined in the RhoElements configuration file will take precedence.
                

###Detecting a connection over WAN

When detecting a network connection over WAN bear in mind if you specify a low networkPollInterval your device will frequently have an active data connection and may prevent the device occasionally from accepting incoming calls.
                    

###Preventing access to the device (WEH / WM)

Receiving phone calls or texts whilst running RhoElements will cause the start button to be displayed on Windows Embedded Handheld devices, potentially offering users access to the operating system. It is recommended to set the following registry keys to disable Operating System access on Windows Embedded Handheld as required. The registry keys will be applied after a warm boot, omit them entirely to restore the Start and 'X' icons.

<pre>
[HKEY_LOCAL_MACHINE\Software\Microsoft\Shell\BubbleTiles]   Location in Registry
"HardwareStartKeyEnabled"=dword:00000001                    Prevents the Start icon from appearing in the bottom left
"HardwareDoneKeyEnabled"=dword:00000001                     Prevents the 'X' icon from appearing in the bottom right
</pre>

                    