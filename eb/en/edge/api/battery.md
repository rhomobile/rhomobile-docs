#Battery


## Overview
The Battery API is used to notify the user of the remaining power in the battery. Windows Mobile / CE devices also support displaying a small indicator to show the available power.
## Enabling the API
In order to use this API you must TBD INSERT Eb specific instructions here

        


##Methods



### batteryStatus(<span class="text-info">HASH</span> propertyMap)
<p>Retrieve the current battery level. If a callback is provided to retrieve the battery then it will be called periodically at a frequency determined by the trigger property.</p>


####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>
<p>The properties associated with accessing the battery status.</p>
 </p></li><ul><li>trigger : <span class='text-info'>STRING</span><span class='label '> Default: Platform Dependant</span><p>
<p>What will cause the batteryStatus callback to fire. It is recommended to use system events to conserve battery life. Please note, that iOS devices have no system triggers and will provide updates only with a specified period (Trigger value will be ignored)</p>
 </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>Constant: Battery.BATTERY_TRIGGER_PERIODIC <br/> String:periodic</dt><dd>
<p>The batteryStatus callback will fire periodically at the specified refresh interval. This is the default setting on Windows Mobile / CE / Embedded but those platforms do also support the system trigger. Not supported on Android.</p>
</dd><dt>Constant: Battery.BATTERY_TRIGGER_SYSTEM <br/> String:system</dt><dd>
<p>The batteryStatus callback will fire when the underlying operating system notifies that there has been a change to the battery level. The resolution of this change will vary depending on operating system, for example on WP8 you are notified every percentage value change but on Windows Mobile the notifications only occur when &lsquo;critical&rsquo;, &lsquo;full&rsquo; etc.</p>
</dd></dl></li><li>refreshInterval : <span class='text-info'>INTEGER</span><p>
<p>Alternative way of specifying the refreshInterval parameter. If you are using a system trigger then this parameter will be ignored.</p>
 </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>acLineStatus : <span class='text-info'>BOOLEAN</span><p>
<p>Whether or not the device is connected to external power.</p>
 </p></li><li>batteryLifePercent : <span class='text-info'>INTEGER</span><p>
<p>The remaining battery power as a value between 0 and 100.</p>
 </p></li><li>backupBatteryLifePercent : <span class='text-info'>INTEGER</span><p>
<p>The remaining backup battery power as a percentage between 0 and 100. Only supported on Motorola Windows Mobile / CE / Embedded devices.</p>
 Platforms:
WM </p></li><li>trigger : <span class='text-info'>STRING</span><p>
<p>Human readable form of what has caused this callback to fire. This value will be OS dependent. On Windows Mobile / CE / Embedded it will be one of: &ldquo;High Battery&rdquo;, &ldquo;Low Battery&rdquo;, &ldquo;Critical Battery&rdquo;, &ldquo;Charging&rdquo;, &ldquo;No Battery&rdquo;, &ldquo;Unknown&rdquo;. In the case of periodic updates, this field will contain the last known status of the battery.</p>
 Platforms:
WM, Android </p></li><li>batteryLifeKnown : <span class='text-info'>BOOLEAN</span><p>
<p>Only supported on Motorola Solutions' Windows Mobile / CE / Embedded devices. The battery life will not be readable for a period of time after removing from an AC power source and this parameter will state whether the batteryLifePercent value is accurate.</p>
 Platforms:
WM </p></li><li>backupBatteryLifeKnown : <span class='text-info'>BOOLEAN</span><p>
<p>Only supported on Motorola Solutions' Windows Mobile / CE / Embedded devices. The battery life will not be readable for a period of time after removing from an AC power source and this parameter will state whether the backupBatteryLifePercent value is accurate.</p>
 Platforms:
WM </p></li></ul></ul>

####Returns
Synchronous Return:

* HASH<ul><li>acLineStatus : <span class='text-info'>BOOLEAN</span><p>
<p>Whether or not the device is connected to external power.</p>
 </p></li><li>batteryLifePercent : <span class='text-info'>INTEGER</span><p>
<p>The remaining battery power as a value between 0 and 100.</p>
 </p></li><li>backupBatteryLifePercent : <span class='text-info'>INTEGER</span><p>
<p>The remaining backup battery power as a percentage between 0 and 100. Only supported on Motorola Windows Mobile / CE / Embedded devices.</p>
 Platforms:
WM </p></li><li>trigger : <span class='text-info'>STRING</span><p>
<p>Human readable form of what has caused this callback to fire. This value will be OS dependent. On Windows Mobile / CE / Embedded it will be one of: &ldquo;High Battery&rdquo;, &ldquo;Low Battery&rdquo;, &ldquo;Critical Battery&rdquo;, &ldquo;Charging&rdquo;, &ldquo;No Battery&rdquo;, &ldquo;Unknown&rdquo;. In the case of periodic updates, this field will contain the last known status of the battery.</p>
 Platforms:
WM, Android </p></li><li>batteryLifeKnown : <span class='text-info'>BOOLEAN</span><p>
<p>Only supported on Motorola Solutions' Windows Mobile / CE / Embedded devices. The battery life will not be readable for a period of time after removing from an AC power source and this parameter will state whether the batteryLifePercent value is accurate.</p>
 Platforms:
WM </p></li><li>backupBatteryLifeKnown : <span class='text-info'>BOOLEAN</span><p>
<p>Only supported on Motorola Solutions' Windows Mobile / CE / Embedded devices. The battery life will not be readable for a period of time after removing from an AC power source and this parameter will state whether the backupBatteryLifePercent value is accurate.</p>
 Platforms:
WM </p></li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Battery.batteryStatus(<span class="text-info">HASH</span> propertyMap)</code> 


### hideIcon()
<p>Hide the icon if it has been previously set by the &lsquo;showIcon&rsquo; call.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Battery.hideIcon()</code> 


### showIcon(<span class="text-info">HASH</span> propertyMap)
<p>Overlays a small battery icon on top of the view indicating the remaining battery strength. This is particularly useful in full screen applications which cover the system battery level indicator.</p>


####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>
<p>The properties associated with the indicator, its position and color.</p>
 </p></li><ul><li>left : <span class='text-info'>INTEGER</span><span class='label '> Default: [Top left of the screen]</span><p>
<p>The absolute horizontal position of the indicator in pixels. This value is relative to the screen and not the view, so non-fullscreen applications should take care not to display the indicator off screen.</p>
 </p></li><li>top : <span class='text-info'>INTEGER</span><span class='label '> Default: [Top left of the screen]</span><p>
<p>The absolute vertical position of the indicator in pixels. Positive numbers go towards the bottom of the screen. This value is relative to the screen and not the view, so non-fullscreen applications should take care not to display the indicator off screen.</p>
 </p></li><li>layout : <span class='text-info'>STRING</span><span class='label '> Default: [Right]</span><p>
<p>Sets the orientation of the icon, see the remarks section for illustrations.</p>
 </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>Constant: EB.Battery.BATTERY_LAYOUT_LEFT <br/> String:left</dt><dd>
<p>See the remarks section for illustrations of icon layout.</p>
</dd><dt>Constant: EB.Battery.BATTERY_LAYOUT_RIGHT <br/> String:right</dt><dd>
<p>See the remarks section for illustrations of icon layout.</p>
</dd><dt>Constant: EB.Battery.BATTERY_LAYOUT_UP <br/> String:up</dt><dd>
<p>See the remarks section for illustrations of icon layout.</p>
</dd><dt>Constant: EB.Battery.BATTERY_LAYOUT_DOWN <br/> String:down</dt><dd>
<p>See the remarks section for illustrations of icon layout.</p>
</dd></dl></li><li>color : <span class='text-info'>STRING</span><p>
<p>The color of the icon. This value must be specified as a Hex value in the format #000000 to #FFFFFF. Alpha values are not supported, i.e. You can only use the component parts RRGGBB.</p>
 </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Battery.showIcon(<span class="text-info">HASH</span> propertyMap)</code> 


### smartBatteryStatus()
<p>Returns the various parameters relating to battery charge and battery hardware. Not all return values may be supported by all batteries.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>serialNumber : <span class='text-info'>STRING</span><p>
<p>The serial number of the battery.</p>
 </p></li><li>partNumber : <span class='text-info'>STRING</span><p>
<p>The Motorola Solutions' part number of the battery, e.g. 21-65587 Rev. A.</p>
 </p></li><li>batteryChargeCycles : <span class='text-info'>INTEGER</span><p>
<p>The number of times the battery has been charged. Partial charges are aggregated, therefore each charge cycle count represents one full charge / discharge cycle. The battery charge cycle count gets updated when the battery charging state changes from charging to not charging. Cycle count may not accurately predict the life of a battery.</p>
 </p></li><li>ratedCapacity : <span class='text-info'>INTEGER</span><p>
<p>Rated capacity of the battery in mAh.</p>
 </p></li><li>manufactureDate : <span class='text-info'>STRING</span><p>
<p>Date the battery was manufactured expressed as MM/DD/YYYY.</p>
 </p></li><li>stateOfHealth : <span class='text-info'>STRING</span><p>
<p>The health of the battery.</p>
 </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>Constant: EB.Battery.SMART_BATTERY_HEALTHY <br/> String:healthy</dt><dd>
<p>The battery is healthy.</p>
</dd><dt>Constant: EB.Battery.SMART_BATTERY_UNHEALTHY <br/> String:unhealthy</dt><dd>
<p>The battery is unhealthy.</p>
</dd><dt>Constant: EB.Battery.SMART_BATTERY_UNKNOWN <br/> String:unknown</dt><dd>
<p>The battery health is unknown.</p>
</dd></dl></li></ul></ul>

####Returns
Synchronous Return:

* HASH<ul><li>serialNumber : <span class='text-info'>STRING</span><p>
<p>The serial number of the battery.</p>
 </p></li><li>partNumber : <span class='text-info'>STRING</span><p>
<p>The Motorola Solutions' part number of the battery, e.g. 21-65587 Rev. A.</p>
 </p></li><li>batteryChargeCycles : <span class='text-info'>INTEGER</span><p>
<p>The number of times the battery has been charged. Partial charges are aggregated, therefore each charge cycle count represents one full charge / discharge cycle. The battery charge cycle count gets updated when the battery charging state changes from charging to not charging. Cycle count may not accurately predict the life of a battery.</p>
 </p></li><li>ratedCapacity : <span class='text-info'>INTEGER</span><p>
<p>Rated capacity of the battery in mAh.</p>
 </p></li><li>manufactureDate : <span class='text-info'>STRING</span><p>
<p>Date the battery was manufactured expressed as MM/DD/YYYY.</p>
 </p></li><li>stateOfHealth : <span class='text-info'>STRING</span><p>
<p>The health of the battery.</p>
 </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>Constant: EB.Battery.SMART_BATTERY_HEALTHY <br/> String:Constant: EB.Battery.SMART_BATTERY_HEALTHY <br/> String:healthy</dt><dd>
<p>The battery is healthy.</p>
</dd><dt>Constant: EB.Battery.SMART_BATTERY_UNHEALTHY <br/> String:Constant: EB.Battery.SMART_BATTERY_UNHEALTHY <br/> String:unhealthy</dt><dd>
<p>The battery is unhealthy.</p>
</dd><dt>Constant: EB.Battery.SMART_BATTERY_UNKNOWN <br/> String:Constant: EB.Battery.SMART_BATTERY_UNKNOWN <br/> String:unknown</dt><dd>
<p>The battery health is unknown.</p>
</dd></dl></li></ul>

####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Battery.smartBatteryStatus()</code> 


### stopBatteryStatus()
<p>If the battery status is being retrieved via callback, by a previously invoked call to batteryStatus, this method will stop the callback from firing.</p>


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
	* <code>EB.Battery.stopBatteryStatus()</code> 


##Properties



###refreshInterval

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>A callback to retrieve the battery strength can be specified to occur periodically with the batteryStatus method. This value specifies the periodicity of the callback as well as the update frequency of the battery icon, if shown. Note that most platforms will not support periodic updates to the battery level, this is only supported on Windows Mobile / CE / Embedded.</p>

####Params
<p><strong>Default:</strong> 5000</p>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Battery.refreshInterval</code>



####Platforms

* Windows Mobile/CE

##Remarks



###Icon Layout
<p>Windows Mobile / CE and Handheld devices support the display of a small battery icon, this section explains the layout parameter which can be provided to showIcon(&hellip;).</p>

<h2>Layout:Left</h2>

<p><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAI4AAABiCAIAAAAJGXymAAAAAXNSR0IArs4c6QAAAAZiS0dEAP8A/wD/oL2nkwAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB9sIBQouCLvI+XcAAAGaSURBVHja7d3tjYIwAIBhe3EARnAD2aCMwggdwREYwVFgA9xAN3AD7u/luJy1UfHjeX+aapo+oeDlwDBN0yqjEMJKyxVj/LIKrxIqVEKFSqiECpVQCRUqPVfrG35WjLFpGmt6bfv9/nQ6PZSqaZrdbmfpr63v+xwqG6BzlVCh0iddAd6vcRxTSgVvbNu2bdufr6SUxnEsO/nfaUpvRXU+n4dhKLsonauXfdT9pmQDfLsNsPhA1qOpig9kuQIUKlRCJVSohEqoUAnVR5f7l/XtdltV1f9jNpuNBV2equs6/41kAxQqVEIlVKiESqhQCZVQoRIqoUIlVKiESqhQCZVQoRIqoUIlVEKFSouWeydISuniTTvFz+TSLakOh8PFMe7qsQEKFSqhQiVUQoVKqITqg1pXVRVjvDjOU6OXp6rr+tdPKPxZCMFi2QCVd1S9xCwzd+l584ep1XX9bFN6K6rMXTqnruuebUo2QOcqoRIqV4Cz+r73u8AFHY/HnGFhmqascb4CL1qM0QboXCVUqIRKqFAJlVChEioV9Q38vGIHwMPikwAAAABJRU5ErkJggg==" title="Battery Indicator" alt="Left Layout Battery Indicator" /></p>

<h2>Layout:Right</h2>

<p><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAI4AAABiCAIAAAAJGXymAAAAAXNSR0IArs4c6QAAAAZiS0dEAP8A/wD/oL2nkwAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB9sIBQouHk8cTCYAAAGRSURBVHja7d3hbYJAGIBh0nQANpAR2ADdhE1khBuBUc4R3IARbgP7t6lpOAgnYp7np7GG8IaPq9Gz6rquYlePPF/O1FFIJRVSSYVUSCUVUiGVVLyX75wnnU6nvu+drKVijLfb7aWpmqYZhsGpX2oYhg1TGYDuVUglFR+xAnw2juM4jiv+MITQtu3vR87n84rXads2hFDokD4q1TRN69Y2KaU/j2y1RtrwkAxA9riq2FDOLSCEINX+cuZ2SskAtFhHKqmQCqmkQiqkkor34o2lgpqmmf2mYUrpfr9LtbO+72c/6RVjvFwuBqB7FVIhlVRIhVRSIRVSSYVUSCUVUkmFVEglFVIhlVRIhVRSIRVSSYVUZPBNkIJyNlPL34xLqoJWb6ZmALpXIRVSSYVUSCUVUknFAXhjaX+zm/tUVVXXtVT7izEagAZg3p5c/13IKy7/Z88/uLLhIR14UHZd92C56/WakyDz1QxAi3WkkoqPWAFO0+R3gcv9w7TlCpCirADdq5AKqaRCKqSSCqmQSipK+gHwTQYZtwZTVQAAAABJRU5ErkJggg==" title="Battery Indicator" alt="Right Layout Battery Indicator" /></p>

<h2>Layout:Up</h2>

<p><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGIAAACOCAIAAABFQUqgAAAAAXNSR0IArs4c6QAAAAZiS0dEAP8A/wD/oL2nkwAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB9sIBQouKm6ouJMAAAGWSURBVHja7d3RkYIwFEBR3LEAO9AOpINnKZaQDmjBkrAD7EA7sAO2gP1YJjFonHO/HYQzJA5gdDPPc1fQNE3P57P77Ha7Xd/3RZuYy4qI7uOLiMLD/Om0IEyYMGHChAmTMGHCtHabFd7jeDxeLpdKG08p3W632oewXecC/XQ61du4QWduwoQJkzBhwoQJ0xe26GIlIkquNg6HQ70DOJ/PJfs2juP1en3NrgzDMH9pwzAYdOYmTJgwYRImTJgwYcKESZgwYcKECRMmYcKECRMmTJiEaWmZX59vYl3937JX2mcypZRe9n2XFYuIcRwNOnMTJkyYMAkTJkyYMGHCJEyYMGFqocy7l4WL/d5V9gLIfCaDTpgwYWrzky6lNE1Tc0fb933ez7flP/Vt8XGmQYcJEyZMmIQJEyZMmDBhEiZMmDC1U+bdy7wlDc4mTMKE6QOmcMsOF2XZoTBhwoQJEyZMwoQJEyZMmDAJE6bKWXZYmcmgEyZMmN7cZsmL9vt91f/mfWP3+/3xeDgPJEmSJDV6TRcRFP7tF5VvpjOfDnyyAAAAAElFTkSuQmCC" title="Battery Indicator" alt="Up Layout Battery Indicator" /></p>

<h2>Layout:Down</h2>

<p><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGIAAACOCAIAAABFQUqgAAAAAXNSR0IArs4c6QAAAAZiS0dEAP8A/wD/oL2nkwAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB9sIBQotLKzmTmUAAAF9SURBVHja7d3hkUNQFIDR2EkBOqAEHVyl6EQLSkgpdKAEOtCBbcGwrCfn+51InMmTEXMji4iXJEmSJCnJsi0PKoqiLMtH7v80TfM8/8222rZdH1rbtlsEfiwoTJgw3bD3vqd9Pp9pmpLb27Ism6a5lGkYhuSYImIfk0WHCRMmTJgwCRMmTJgwYcIkTJgwXd7OXy+7rluWJbm9zfP8Uqaqqiw6YcKEKU2muq6zBKvr2qfJosOECRMmYcKECRMmTJiECRMmTIn0XRegdr/t/ZczLTphwoQpzW86Y4dbmYwdChMmTJgwYcIkTJgwYcKECZMwYTozY4dnMhk7FCZMmDBhwoRJmDBhwoQJEyZhwoQJEyZMmIQJEyZMmDB9Y5vu6xsRu/9Y83Vg2G9LBwcg+76/y2BgRJx3Y96IsOgcmzBhwiRMmDBhwvTA3he8xrIsfd+ft/ErnJI4pfr3k0qLzrEJEyZMmDAJEyZMmG5Ztq7rkeeP43j/Sfs8zw+Ouv8CFfQAjSZxPXkAAAAASUVORK5CYII=" title="Battery Indicator" alt="Down Layout Battery Indicator" /></p>


###Overlapping Indicators
<p>The position of the signal and battery indicators should not be set to overlap</p>


###Screen Orientation
<p>The indicator positions are absolute and so when rotating the screen you should also move the indicator positions accordingly to accommodate the new screen layout.</p>
