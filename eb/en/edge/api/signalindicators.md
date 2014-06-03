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



### hideIcon()Hide the icon if it has been previously set by the 'showIcon' call.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* Windows Embedded
* Motorola Solutions Devices Only

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.SignalIndicators.hideIcon()</code> </li></ul></li></ul>

### showIcon(<span class="text-info">HASH</span> propertyMap)Overlays a small signal icon on top of the view indicating the remaining signal strength.  This is particularly useful in full screen applications which cover the system signal level indicator.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>The properties associated with the indicator, its position and colour. </p></li><ul><li>left : <span class='text-info'>INTEGER</span><span class='label '> Default: [Top right of the screen]</span><p>The absolute horizontal position of the indicator in pixels.  This value is relative to the screen and not the view, so non-fullscreen applications should take care not to display the indicator off screen. </p></li><li>top : <span class='text-info'>INTEGER</span><span class='label '> Default: [Top right of the screen]</span><p>The absolute vertical position of the indicator in pixels.  Positive numbers go towards the bottom of the screen.  The value is relative to the screen and not the view, so non-fullscreen applications should take care not to display the indicator off screen. </p></li><li>layout : <span class='text-info'>STRING</span><span class='label '> Default: [Right]</span><p>Sets the orientation of the icon, see the remarks section for illustrations. </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>Constant: Rho.SignalIndicators.SIGNAL_LAYOUT_LEFT <br/> String:left</dt><dd>See the remarks section for illustrations of icon layout</dd><dt>Constant: Rho.SignalIndicators.SIGNAL_LAYOUT_RIGHT <br/> String:right</dt><dd>See the remarks section for illustrations of icon layout</dd><dt>Constant: Rho.SignalIndicators.SIGNAL_LAYOUT_UP <br/> String:up</dt><dd>See the remarks section for illustrations of icon layout</dd><dt>Constant: Rho.SignalIndicators.SIGNAL_LAYOUT_DOWN <br/> String:down</dt><dd>See the remarks section for illustrations of icon layout</dd></dl></li><li>color : <span class='text-info'>STRING</span><span class='label '> Default: #000000</span><p>The color of the icon.  This value must be specified as a Hex value in the format #000000 to #FFFFFF.  Alpha values are not supported, i.e. you can only use the component parts RRGGBB. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* Windows Embedded
* Motorola Solutions Devices Only

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.SignalIndicators.showIcon(<span class="text-info">HASH</span> propertyMap)</code> </li></ul></li></ul>

### stopWlanStatus()If the signal is being retrieved via callback, by a previously invoked call to wlanStatus, this method will stop the callback from firing.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.SignalIndicators.stopWlanStatus()</code> </li></ul></li></ul>

### wlanStatus()Retrieve the current signal status.  If a callback is provided to retrieve the signal then it will be called periodically at the specified refreshInterval. On Android, instead of being called periodically, the callback will be called when one of the below values changes.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>signalStrength : <span class='text-info'>INTEGER</span><p>The signal strength as a value between 0 and 100. Not supported on iOS Platforms:WM, Android </p></li><li>essid : <span class='text-info'>STRING</span><p>The current ESSID </p></li><li>macAddress : <span class='text-info'>STRING</span><p>The Device's MAC address </p></li><li>adapterName : <span class='text-info'>STRING</span><p>The Device's adapter name </p></li><li>dhcpServer : <span class='text-info'>STRING</span><p>The current DHCP server's address.  Always populated on Android, even on static IP configurations. Not supported on iOS  Platforms:WM, Android </p></li><li>dhcpStatic : <span class='text-info'>STRING</span><p>Whether the unit hsa a static or DHCP address.  Not available on Android and iOS. Platforms:WM </p></li><li>gateway : <span class='text-info'>STRING</span><p>The current gateway IP address </p></li><li>ipAddress : <span class='text-info'>STRING</span><p>The device's IP address </p></li><li>rssi : <span class='text-info'>STRING</span><p>Signal strength in RSSI terms. Not supported on iOS. Platforms:WM, Android </p></li><li>subnetMask : <span class='text-info'>STRING</span><p>The current subnet mask </p></li><li>wins : <span class='text-info'>STRING</span><p>The current WINs server IP address.  Not available on Android and iOS. Platforms:WM </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>HASH<ul><li>signalStrength : <span class='text-info'>INTEGER</span><p>The signal strength as a value between 0 and 100. Not supported on iOS Platforms:WM, Android </p></li><li>essid : <span class='text-info'>STRING</span><p>The current ESSID </p></li><li>macAddress : <span class='text-info'>STRING</span><p>The Device's MAC address </p></li><li>adapterName : <span class='text-info'>STRING</span><p>The Device's adapter name </p></li><li>dhcpServer : <span class='text-info'>STRING</span><p>The current DHCP server's address.  Always populated on Android, even on static IP configurations. Not supported on iOS  Platforms:WM, Android </p></li><li>dhcpStatic : <span class='text-info'>STRING</span><p>Whether the unit hsa a static or DHCP address.  Not available on Android and iOS. Platforms:WM </p></li><li>gateway : <span class='text-info'>STRING</span><p>The current gateway IP address </p></li><li>ipAddress : <span class='text-info'>STRING</span><p>The device's IP address </p></li><li>rssi : <span class='text-info'>STRING</span><p>Signal strength in RSSI terms. Not supported on iOS. Platforms:WM, Android </p></li><li>subnetMask : <span class='text-info'>STRING</span><p>The current subnet mask </p></li><li>wins : <span class='text-info'>STRING</span><p>The current WINs server IP address.  Not available on Android and iOS. Platforms:WM </p></li></ul></li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.SignalIndicators.wlanStatus()</code> </li></ul></li></ul>

##Properties



###refreshInterval

####Type
<span class='text-info'>INTEGER</span> 
####Description
A callback to retrieve the signal strength can be specified to occur periodically with the wlanStatus method.  This value specifies the periodicity of the callback as well as the update frequency of the indicator icon, if shown. On Android this value is not used as the signal icon will be updated as soon as the signal strength changes.
####Params
<p><strong>Default:</strong> 5000</p>
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>Rho.SignalIndicators.refreshInterval</code> </li></ul></li></ul>