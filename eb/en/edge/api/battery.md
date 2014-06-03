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



### batteryStatus(<span class="text-info">HASH</span> propertyMap)Retrieve the current battery level. If a callback is provided to retrieve the battery then it will be called periodically at a frequency determined by the trigger property.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>The properties associated with accessing the battery status. </p></li><ul><li>trigger : <span class='text-info'>STRING</span><span class='label '> Default: Platform Dependant</span><p>What will cause the batteryStatus callback to fire. It is recommended to use system events to conserve battery life. Please note, that iOS devices have no system triggers and will provide updates only with a specified period (Trigger value will be ignored)  </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>Constant: Barcode.BATTERY_TRIGGER_PERIODIC <br/> String:periodic</dt><dd>The batteryStatus callback will fire periodically at the specified refresh interval. This is the default setting on Windows Mobile / CE / Embedded but those platforms do also support the system trigger. Not supported on Android.</dd><dt>Constant: Barcode.BATTERY_TRIGGER_SYSTEM <br/> String:system</dt><dd>The batteryStatus callback will fire when the underlying operating system notifies that there has been a change to the battery level. The resolution of this change will vary depending on operating system, for example on WP8 you are notified every percentage value change but on Windows Mobile the notifications only occur when 'critical', 'full' etc.</dd></dl></li><li>refreshInterval : <span class='text-info'>INTEGER</span><p>Alternative way of specifying the refreshInterval parameter. If you are using a system trigger then this parameter will be ignored. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>acLineStatus : <span class='text-info'>BOOLEAN</span><p>Whether or not the device is connected to external power. </p></li><li>batteryLifePercent : <span class='text-info'>INTEGER</span><p>The remaining battery power as a value between 0 and 100. </p></li><li>backupBatteryLifePercent : <span class='text-info'>INTEGER</span><p>The remaining backup battery power as a percentage between 0 and 100. Only supported on Motorola Windows Mobile / CE / Embedded devices. Platforms:WM </p></li><li>trigger : <span class='text-info'>STRING</span><p>Human readable form of what has caused this callback to fire. This value will be OS dependent. On Windows Mobile / CE / Embedded it will be one of: "High Battery", "Low Battery", "Critical Battery", "Charging", "No Battery", "Unknown". In the case of periodic updates, this field will contain the last known status of the battery. Platforms:WM, Android </p></li><li>batteryLifeKnown : <span class='text-info'>BOOLEAN</span><p>Only supported on Motorola Solutions' Windows Mobile / CE / Embedded devices. The battery life will not be readable for a period of time after removing from an AC power source and this parameter will state whether the batteryLifePercent value is accurate. Platforms:WM </p></li><li>backupBatteryLifeKnown : <span class='text-info'>BOOLEAN</span><p>Only supported on Motorola Solutions' Windows Mobile / CE / Embedded devices. The battery life will not be readable for a period of time after removing from an AC power source and this parameter will state whether the backupBatteryLifePercent value is accurate. Platforms:WM </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>HASH<ul><li>acLineStatus : <span class='text-info'>BOOLEAN</span><p>Whether or not the device is connected to external power. </p></li><li>batteryLifePercent : <span class='text-info'>INTEGER</span><p>The remaining battery power as a value between 0 and 100. </p></li><li>backupBatteryLifePercent : <span class='text-info'>INTEGER</span><p>The remaining backup battery power as a percentage between 0 and 100. Only supported on Motorola Windows Mobile / CE / Embedded devices. Platforms:WM </p></li><li>trigger : <span class='text-info'>STRING</span><p>Human readable form of what has caused this callback to fire. This value will be OS dependent. On Windows Mobile / CE / Embedded it will be one of: "High Battery", "Low Battery", "Critical Battery", "Charging", "No Battery", "Unknown". In the case of periodic updates, this field will contain the last known status of the battery. Platforms:WM, Android </p></li><li>batteryLifeKnown : <span class='text-info'>BOOLEAN</span><p>Only supported on Motorola Solutions' Windows Mobile / CE / Embedded devices. The battery life will not be readable for a period of time after removing from an AC power source and this parameter will state whether the batteryLifePercent value is accurate. Platforms:WM </p></li><li>backupBatteryLifeKnown : <span class='text-info'>BOOLEAN</span><p>Only supported on Motorola Solutions' Windows Mobile / CE / Embedded devices. The battery life will not be readable for a period of time after removing from an AC power source and this parameter will state whether the backupBatteryLifePercent value is accurate. Platforms:WM </p></li></ul></li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.Battery.batteryStatus(<span class="text-info">HASH</span> propertyMap)</code> </li></ul></li></ul>

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
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.Battery.hideIcon()</code> </li></ul></li></ul>

### showIcon(<span class="text-info">HASH</span> propertyMap)Overlays a small battery icon on top of the view indicating the remaining battery strength. This is particularly useful in full screen applications which cover the system battery level indicator.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>The properties associated with the indicator, its position and color. </p></li><ul><li>left : <span class='text-info'>INTEGER</span><span class='label '> Default: [Top left of the screen]</span><p>The absolute horizontal position of the indicator in pixels. This value is relative to the screen and not the view, so non-fullscreen applications should take care not to display the indicator off screen. </p></li><li>top : <span class='text-info'>INTEGER</span><span class='label '> Default: [Top left of the screen]</span><p>The absolute vertical position of the indicator in pixels. Positive numbers go towards the bottom of the screen. This value is relative to the screen and not the view, so non-fullscreen applications should take care not to display the indicator off screen. </p></li><li>layout : <span class='text-info'>STRING</span><span class='label '> Default: [Right]</span><p>Sets the orientation of the icon, see the remarks section for illustrations. </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>Constant: Rho.Battery.BATTERY_LAYOUT_LEFT <br/> String:left</dt><dd>See the remarks section for illustrations of icon layout.</dd><dt>Constant: Rho.Battery.BATTERY_LAYOUT_RIGHT <br/> String:right</dt><dd>See the remarks section for illustrations of icon layout.</dd><dt>Constant: Rho.Battery.BATTERY_LAYOUT_UP <br/> String:up</dt><dd>See the remarks section for illustrations of icon layout.</dd><dt>Constant: Rho.Battery.BATTERY_LAYOUT_DOWN <br/> String:down</dt><dd>See the remarks section for illustrations of icon layout.</dd></dl></li><li>color : <span class='text-info'>STRING</span><p>The color of the icon. This value must be specified as a Hex value in the format #000000 to #FFFFFF. Alpha values are not supported, i.e. You can only use the component parts RRGGBB. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* Windows Embedded
* Motorola Solutions Devices Only

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.Battery.showIcon(<span class="text-info">HASH</span> propertyMap)</code> </li></ul></li></ul>

### smartBatteryStatus()Returns the various parameters relating to battery charge and battery hardware. Not all return values may be supported by all batteries.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>serialNumber : <span class='text-info'>STRING</span><p>The serial number of the battery. </p></li><li>partNumber : <span class='text-info'>STRING</span><p>The Motorola Solutions' part number of the battery, e.g. 21-65587 Rev. A. </p></li><li>batteryChargeCycles : <span class='text-info'>INTEGER</span><p>The number of times the battery has been charged. Partial charges are aggregated, therefore each charge cycle count represents one full charge / discharge cycle. The battery charge cycle count gets updated when the battery charging state changes from charging to not charging. Cycle count may not accurately predict the life of a battery. </p></li><li>ratedCapacity : <span class='text-info'>INTEGER</span><p>Rated capacity of the battery in mAh. </p></li><li>manufactureDate : <span class='text-info'>STRING</span><p>Date the battery was manufactured expressed as MM/DD/YYYY. </p></li><li>stateOfHealth : <span class='text-info'>STRING</span><p>The health of the battery. </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>Constant: Rho.Battery.SMART_BATTERY_HEALTHY <br/> String:healthy</dt><dd>The battery is healthy.</dd><dt>Constant: Rho.Battery.SMART_BATTERY_UNHEALTHY <br/> String:unhealthy</dt><dd>The battery is unhealthy.</dd><dt>Constant: Rho.Battery.SMART_BATTERY_UNKNOWN <br/> String:unknown</dt><dd>The battery health is unknown.</dd></dl></li></ul></ul>

####Returns
Synchronous Return:<ul><li>HASH<ul><li>serialNumber : <span class='text-info'>STRING</span><p>The serial number of the battery. </p></li><li>partNumber : <span class='text-info'>STRING</span><p>The Motorola Solutions' part number of the battery, e.g. 21-65587 Rev. A. </p></li><li>batteryChargeCycles : <span class='text-info'>INTEGER</span><p>The number of times the battery has been charged. Partial charges are aggregated, therefore each charge cycle count represents one full charge / discharge cycle. The battery charge cycle count gets updated when the battery charging state changes from charging to not charging. Cycle count may not accurately predict the life of a battery. </p></li><li>ratedCapacity : <span class='text-info'>INTEGER</span><p>Rated capacity of the battery in mAh. </p></li><li>manufactureDate : <span class='text-info'>STRING</span><p>Date the battery was manufactured expressed as MM/DD/YYYY. </p></li><li>stateOfHealth : <span class='text-info'>STRING</span><p>The health of the battery. </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>Constant: Rho.Battery.SMART_BATTERY_HEALTHY <br/> String:Constant: Rho.Battery.SMART_BATTERY_HEALTHY <br/> String:healthy</dt><dd>The battery is healthy.</dd><dt>Constant: Rho.Battery.SMART_BATTERY_UNHEALTHY <br/> String:Constant: Rho.Battery.SMART_BATTERY_UNHEALTHY <br/> String:unhealthy</dt><dd>The battery is unhealthy.</dd><dt>Constant: Rho.Battery.SMART_BATTERY_UNKNOWN <br/> String:Constant: Rho.Battery.SMART_BATTERY_UNKNOWN <br/> String:unknown</dt><dd>The battery health is unknown.</dd></dl></li></ul></li></ul>

####Platforms

* Javascript
* Ruby
* Windows Embedded
* Motorola Solutions Devices Only

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.Battery.smartBatteryStatus()</code> </li></ul></li></ul>

### stopBatteryStatus()If the battery status is being retrieved via callback, by a previously invoked call to batteryStatus, this method will stop the callback from firing.

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
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.Battery.stopBatteryStatus()</code> </li></ul></li></ul>

##Properties



###refreshInterval

####Type
<span class='text-info'>INTEGER</span> 
####Description
A callback to retrieve the battery strength can be specified to occur periodically with the batteryStatus method. This value specifies the periodicity of the callback as well as the update frequency of the battery icon, if shown. Note that most platforms will not support periodic updates to the battery level, this is only supported on Windows Mobile / CE / Embedded.
####Params
<p><strong>Default:</strong> 5000</p>
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>Rho.Battery.refreshInterval</code> </li></ul></li></ul>