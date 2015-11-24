#Battery


## Overview
The Battery API is used to notify the user of the remaining power in the battery. Windows Mobile / CE devices also support displaying a small indicator to show the available power.
## Enabling the API
There are two methods of enabling the Battery API:

* Include all ebapi modules or
* Include only the API modules you need

For either of these methods, you'll need to include files from the `/Enterprise Browser/JavaScript Files/Enterprise Browser` directory on the computer that you installed the Enterprise Browser.

### Include all JS API modules
To include all JS APIs, you must copy the ebapi-modules.js file to a location accessible by your app's files and include the JavaScript file in your app. For instance, to include the modules file in your index.html, with the file in the same directory as your index.html, you would add the following line to the <head> section of your index.html:

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi-modules.js"></script>

> Note: that the pathing for this file is relative to the current page.

This will define the EB class within the page. Any page you need to use the modules will need to have the .js file included in this fashion.

### Include only the modules you need
To include single APIs, you must first include the `ebapi.js` in your HTML as well as the API file you want to use. For instance, to use the Battery API, I would add the following code to my HTML file(s), assuming the API files have been copied to the same directory as the HTML.

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi.js"></script>
    <script type="text/javascript" charset="utf-8" src="eb.battery.js"></script>

The ebapi.js file is necessary for all single API inclusions.

## Persistence
With the old PocketBrowser APIs, any events, such as `batteryEvent` were canceled when a full navigate was performed. The original reason for this was a limitation of the IE engine on WM5 devices. When moving to the common API this was changed so that callbacks are not canceled.
        


##Methods



### batteryDiagnostics()
The BatteryDiagnostics method returns parameters for further battery analysis. Not all return values will be supported by all batteries. Any parameters that cannot be retrieved will return 'undefined'. In Android, Currently supported only on the MC18 device

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>stateOfHealthPercent : <span class='text-info'>STRING</span><p>The current maximum battery capacity as a percentage of the battery rated capacity </p></li><li>batteryCapacityPercent : <span class='text-info'>STRING</span><p>The remaining battery capacity percentage </p></li><li>batteryCapacityMinutes : <span class='text-info'>STRING</span><p>The remaining battery capacity in minutes. Calculations are based on the averageCurrentConsumption parameter </p></li><li>batteryExpirationInMonths : <span class='text-info'>STRING</span><p>Prediction in number of months when the battery should be replaced. Returns undefined for Android. </p></li><li>previousBatteryReplacement : <span class='text-info'>STRING</span><p>Duration in days since the battery was last replaced </p></li><li>timeSinceLastColdBoot : <span class='text-info'>STRING</span><p>Time in minutes since the device was last cold booted </p></li><li>requiredChargeTime : <span class='text-info'>STRING</span><p>Calculates the charge time required in minutes based on the tripDuration and averageCurrentConsumption parameters. </p></li><li>chargingTime : <span class='text-info'>STRING</span><p>The duration of time for which the unit was last charging, in minutes </p></li></ul></ul>

####Returns
Synchronous Return:

* HASH<ul><li>stateOfHealthPercent : <span class='text-info'>STRING</span><p>The current maximum battery capacity as a percentage of the battery rated capacity </p></li><li>batteryCapacityPercent : <span class='text-info'>STRING</span><p>The remaining battery capacity percentage </p></li><li>batteryCapacityMinutes : <span class='text-info'>STRING</span><p>The remaining battery capacity in minutes. Calculations are based on the averageCurrentConsumption parameter </p></li><li>batteryExpirationInMonths : <span class='text-info'>STRING</span><p>Prediction in number of months when the battery should be replaced. Returns undefined for Android. </p></li><li>previousBatteryReplacement : <span class='text-info'>STRING</span><p>Duration in days since the battery was last replaced </p></li><li>timeSinceLastColdBoot : <span class='text-info'>STRING</span><p>Time in minutes since the device was last cold booted </p></li><li>requiredChargeTime : <span class='text-info'>STRING</span><p>Calculates the charge time required in minutes based on the tripDuration and averageCurrentConsumption parameters. </p></li><li>chargingTime : <span class='text-info'>STRING</span><p>The duration of time for which the unit was last charging, in minutes </p></li></ul>

####Platforms

* Android
* Windows CE
* Zebra Devices Only

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Battery.batteryDiagnostics()</code> 


### batteryStatus(<span class="text-info">HASH</span> propertyMap)
Retrieve the current battery level. If a callback is provided to retrieve the battery then it will be called periodically at a frequency determined by the trigger property.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>The properties associated with accessing the battery status. </p></li><ul><li>trigger : <span class='text-info'>STRING</span><span class='label '> Default: Platform Dependant</span><p>What will cause the batteryStatus callback to fire. It is recommended to use system events to conserve battery life. </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>Constant: EB.Battery.BATTERY_TRIGGER_PERIODIC <br/> String:periodic</dt><dd>The batteryStatus callback will fire periodically at the specified refresh interval. This is the default setting on Windows Mobile / CE / Embedded but those platforms do also support the system trigger. Not supported on Android.</dd><dt>Constant: EB.Battery.BATTERY_TRIGGER_SYSTEM <br/> String:system</dt><dd>The batteryStatus callback will fire when the underlying operating system notifies that there has been a change to the battery level. The resolution of this change will vary depending on operating system, for example on Windows Mobile the notifications only occur when 'critical', 'full' etc.</dd></dl></li><li>refreshInterval : <span class='text-info'>INTEGER</span><p>Alternative way of specifying the refreshInterval parameter. If you are using a system trigger then this parameter will be ignored. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>acLineStatus : <span class='text-info'>BOOLEAN</span><p>Whether or not the device is connected to external power. </p></li><li>batteryLifePercent : <span class='text-info'>INTEGER</span><p>Displays the remaining battery power as a percentage value between 0 and 100. For some Zebra Android devices, the API will return a value of 255 at all times while the battery is being charged. The same value also might be displayed for a few seconds initially after reboot while the battery is being discharged. This is in accordance with hardware design specs and should be taken into account when using the API. </p></li><li>backupBatteryLifePercent : <span class='text-info'>INTEGER</span><p>The remaining backup battery power as a percentage between 0 and 100. Supported only on Symbol Technologies Windows Mobile / CE / Embedded devices. Platforms:
WM </p></li><li>trigger : <span class='text-info'>STRING</span><p>Human readable form of what has caused this callback to fire. This value will be OS dependent. On Windows Mobile / CE / Embedded it will be one of: "High Battery", "Low Battery", "Critical Battery", "Charging", "No Battery", "Unknown". In the case of periodic updates, this field will contain the last known status of the battery. Platforms:
WM, CE, Android </p></li><li>batteryLifeKnown : <span class='text-info'>BOOLEAN</span><p>Supported only on Symbol Technologies' Windows Mobile / CE / Embedded devices. The battery life will not be readable for a period of time after removing from an AC power source and this parameter will state whether the batteryLifePercent value is accurate. Platforms:
WM </p></li><li>backupBatteryLifeKnown : <span class='text-info'>BOOLEAN</span><p>Supported only on Symbol Technologies' Windows Mobile / CE / Embedded devices. The battery life will not be readable for a period of time after removing from an AC power source and this parameter will state whether the backupBatteryLifePercent value is accurate. Platforms:
WM </p></li></ul></ul>

####Returns
Synchronous Return:

* HASH<ul><li>acLineStatus : <span class='text-info'>BOOLEAN</span><p>Whether or not the device is connected to external power. </p></li><li>batteryLifePercent : <span class='text-info'>INTEGER</span><p>Displays the remaining battery power as a percentage value between 0 and 100. For some Zebra Android devices, the API will return a value of 255 at all times while the battery is being charged. The same value also might be displayed for a few seconds initially after reboot while the battery is being discharged. This is in accordance with hardware design specs and should be taken into account when using the API. </p></li><li>backupBatteryLifePercent : <span class='text-info'>INTEGER</span><p>The remaining backup battery power as a percentage between 0 and 100. Supported only on Symbol Technologies Windows Mobile / CE / Embedded devices. Platforms:
WM </p></li><li>trigger : <span class='text-info'>STRING</span><p>Human readable form of what has caused this callback to fire. This value will be OS dependent. On Windows Mobile / CE / Embedded it will be one of: "High Battery", "Low Battery", "Critical Battery", "Charging", "No Battery", "Unknown". In the case of periodic updates, this field will contain the last known status of the battery. Platforms:
WM, CE, Android </p></li><li>batteryLifeKnown : <span class='text-info'>BOOLEAN</span><p>Supported only on Symbol Technologies' Windows Mobile / CE / Embedded devices. The battery life will not be readable for a period of time after removing from an AC power source and this parameter will state whether the batteryLifePercent value is accurate. Platforms:
WM </p></li><li>backupBatteryLifeKnown : <span class='text-info'>BOOLEAN</span><p>Supported only on Symbol Technologies' Windows Mobile / CE / Embedded devices. The battery life will not be readable for a period of time after removing from an AC power source and this parameter will state whether the backupBatteryLifePercent value is accurate. Platforms:
WM </p></li></ul>

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Battery.batteryStatus(<span class="text-info">HASH</span> propertyMap)</code> 


### hideIcon()
Hide the icon if it has been previously set by the 'showIcon' call.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE
* Zebra Devices Only

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Battery.hideIcon()</code> 


### showIcon(<span class="text-info">HASH</span> propertyMap)
Overlays a small battery icon on top of the view indicating the remaining battery strength. This is particularly useful in full screen applications that cover the system battery level indicator.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>The properties associated with the indicator, its position and color. </p></li><ul><li>left : <span class='text-info'>INTEGER</span><span class='label '> Default: [Top left of the screen]</span><p>The absolute horizontal position of the indicator in pixels. This value is relative to the screen and not the view, so non-fullscreen applications should take care not to display the indicator off screen. </p></li><li>top : <span class='text-info'>INTEGER</span><span class='label '> Default: [Top left of the screen]</span><p>The absolute vertical position of the indicator in pixels. Positive numbers go towards the bottom of the screen. This value is relative to the screen and not the view, so non-fullscreen applications should take care not to display the indicator off screen. </p></li><li>layout : <span class='text-info'>STRING</span><span class='label '> Default: [Right]</span><p>Sets the orientation of the icon, see the remarks section for illustrations. </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>Constant: EB.Battery.BATTERY_LAYOUT_LEFT <br/> String:left</dt><dd>See the remarks section for illustrations of icon layout.</dd><dt>Constant: EB.Battery.BATTERY_LAYOUT_RIGHT <br/> String:right</dt><dd>See the remarks section for illustrations of icon layout.</dd><dt>Constant: EB.Battery.BATTERY_LAYOUT_UP <br/> String:up</dt><dd>See the remarks section for illustrations of icon layout.</dd><dt>Constant: EB.Battery.BATTERY_LAYOUT_DOWN <br/> String:down</dt><dd>See the remarks section for illustrations of icon layout.</dd></dl></li><li>color : <span class='text-info'>STRING</span><p>The color of the icon. This value must be specified as a Hex value in the format #000000 to #FFFFFF. Alpha values are not supported, i.e. you can only use the component parts RRGGBB. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE
* Zebra Devices Only

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Battery.showIcon(<span class="text-info">HASH</span> propertyMap)</code> 


### smartBatteryStatus()
Returns the various parameters relating to battery charge and battery hardware. Not all return values may be supported by all batteries.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>serialNumber : <span class='text-info'>STRING</span><p>The serial number of the battery. </p></li><li>partNumber : <span class='text-info'>STRING</span><p>The Symbol Technologies' part number of the battery, e.g. 21-65587 Rev. A. </p></li><li>batteryChargeCycles : <span class='text-info'>INTEGER</span><p>The number of times the battery has been charged. Partial charges are aggregated, therefore each charge cycle count represents one full charge / discharge cycle. The battery charge cycle count gets updated when the battery charging state changes from charging to not charging. Cycle count may not accurately predict the life of a battery. </p></li><li>ratedCapacity : <span class='text-info'>INTEGER</span><p>Rated capacity of the battery in mAh. </p></li><li>manufactureDate : <span class='text-info'>STRING</span><p>Date the battery was manufactured expressed as MM/DD/YYYY. </p></li><li>stateOfHealth : <span class='text-info'>STRING</span><p>The health of the battery. </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>Constant: EB.Battery.SMART_BATTERY_HEALTHY <br/> String:healthy</dt><dd>The battery is healthy.</dd><dt>Constant: EB.Battery.SMART_BATTERY_UNHEALTHY <br/> String:unhealthy</dt><dd>The battery is unhealthy.</dd><dt>Constant: EB.Battery.SMART_BATTERY_UNKNOWN <br/> String:unknown</dt><dd>The battery health is unknown.</dd></dl></li></ul></ul>

####Returns
Synchronous Return:

* HASH<ul><li>serialNumber : <span class='text-info'>STRING</span><p>The serial number of the battery. </p></li><li>partNumber : <span class='text-info'>STRING</span><p>The Symbol Technologies' part number of the battery, e.g. 21-65587 Rev. A. </p></li><li>batteryChargeCycles : <span class='text-info'>INTEGER</span><p>The number of times the battery has been charged. Partial charges are aggregated, therefore each charge cycle count represents one full charge / discharge cycle. The battery charge cycle count gets updated when the battery charging state changes from charging to not charging. Cycle count may not accurately predict the life of a battery. </p></li><li>ratedCapacity : <span class='text-info'>INTEGER</span><p>Rated capacity of the battery in mAh. </p></li><li>manufactureDate : <span class='text-info'>STRING</span><p>Date the battery was manufactured expressed as MM/DD/YYYY. </p></li><li>stateOfHealth : <span class='text-info'>STRING</span><p>The health of the battery. </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>Constant: EB.Battery.SMART_BATTERY_HEALTHY <br/> String:Constant: EB.Battery.SMART_BATTERY_HEALTHY <br/> String:healthy</dt><dd>The battery is healthy.</dd><dt>Constant: EB.Battery.SMART_BATTERY_UNHEALTHY <br/> String:Constant: EB.Battery.SMART_BATTERY_UNHEALTHY <br/> String:unhealthy</dt><dd>The battery is unhealthy.</dd><dt>Constant: EB.Battery.SMART_BATTERY_UNKNOWN <br/> String:Constant: EB.Battery.SMART_BATTERY_UNKNOWN <br/> String:unknown</dt><dd>The battery health is unknown.</dd></dl></li></ul>

####Platforms

* Windows Mobile
* Zebra Devices Only

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Battery.smartBatteryStatus()</code> 


### stopBatteryStatus()
If the battery status is being retrieved via callback by a previously invoked call to batteryStatus, this method will stop the callback from firing.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Battery.stopBatteryStatus()</code> 


##Properties



###averageCurrentConsumption

####Type
<span class='text-info'>INTEGER</span> 
####Description
Supported only by the MC18 device. Sets an average current consumption (in mA) that is used in subsequent power-related calculations. If set to 0, the value will be provided by the device driver based on the running average.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Battery.averageCurrentConsumption</code>



####Platforms

* Android
* Windows CE

###refreshInterval

####Type
<span class='text-info'>INTEGER</span> 
####Description
A callback to retrieve the battery strength can be specified to occur periodically with the batteryStatus method. This value specifies the periodicity of the callback as well as the update frequency of the battery icon, if shown. Setting this value to zero will disable the batteryStatus callback. Note that most platforms will not support periodic updates to the battery level, this is only supported on Windows Mobile / CE / Embedded.
####Params
<p><strong>Default:</strong> 5000</p>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Battery.refreshInterval</code>



####Platforms

* Windows Mobile
* Windows CE

###tripDuration

####Type
<span class='text-info'>INTEGER</span> 
####Description
Supported only by the MC18 device. Sets the desired working time (in minutes) out of the cradle, which is used in subsequent power-related calculations. If set to 0, the driver default value of 45 minutes will be used.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Battery.tripDuration</code>



####Platforms

* Android
* Windows CE

##Remarks



###Icon Layout
Windows Mobile / CE and Handheld devices support the display of a small battery icon. This section explains the layout parameter, which can be provided to showIcon(...).

Layout:Left
-----------
![Left Layout Battery Indicator](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAI4AAABiCAIAAAAJGXymAAAAAXNSR0IArs4c6QAAAAZiS0dEAP8A/wD/oL2nkwAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB9sIBQouCLvI+XcAAAGaSURBVHja7d3tjYIwAIBhe3EARnAD2aCMwggdwREYwVFgA9xAN3AD7u/luJy1UfHjeX+aapo+oeDlwDBN0yqjEMJKyxVj/LIKrxIqVEKFSqiECpVQCRUqPVfrG35WjLFpGmt6bfv9/nQ6PZSqaZrdbmfpr63v+xwqG6BzlVCh0iddAd6vcRxTSgVvbNu2bdufr6SUxnEsO/nfaUpvRXU+n4dhKLsonauXfdT9pmQDfLsNsPhA1qOpig9kuQIUKlRCJVSohEqoUAnVR5f7l/XtdltV1f9jNpuNBV2equs6/41kAxQqVEIlVKiESqhQCZVQoRIqoUIlVKiESqhQCZVQoRIqoUIlVEKFSouWeydISuniTTvFz+TSLakOh8PFMe7qsQEKFSqhQiVUQoVKqITqg1pXVRVjvDjOU6OXp6rr+tdPKPxZCMFi2QCVd1S9xCwzd+l584ep1XX9bFN6K6rMXTqnruuebUo2QOcqoRIqV4Cz+r73u8AFHY/HnGFhmqascb4CL1qM0QboXCVUqIRKqFAJlVChEioV9Q38vGIHwMPikwAAAABJRU5ErkJggg== "Battery Indicator")

Layout:Right
------------
![Right Layout Battery Indicator](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAI4AAABiCAIAAAAJGXymAAAAAXNSR0IArs4c6QAAAAZiS0dEAP8A/wD/oL2nkwAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB9sIBQouHk8cTCYAAAGRSURBVHja7d3hbYJAGIBh0nQANpAR2ADdhE1khBuBUc4R3IARbgP7t6lpOAgnYp7np7GG8IaPq9Gz6rquYlePPF/O1FFIJRVSSYVUSCUVUiGVVLyX75wnnU6nvu+drKVijLfb7aWpmqYZhsGpX2oYhg1TGYDuVUglFR+xAnw2juM4jiv+MITQtu3vR87n84rXads2hFDokD4q1TRN69Y2KaU/j2y1RtrwkAxA9riq2FDOLSCEINX+cuZ2SskAtFhHKqmQCqmkQiqkkor34o2lgpqmmf2mYUrpfr9LtbO+72c/6RVjvFwuBqB7FVIhlVRIhVRSIRVSSYVUSCUVUkmFVEglFVIhlVRIhVRSIRVSSYVUZPBNkIJyNlPL34xLqoJWb6ZmALpXIRVSSYVUSCUVUknFAXhjaX+zm/tUVVXXtVT7izEagAZg3p5c/13IKy7/Z88/uLLhIR14UHZd92C56/WakyDz1QxAi3WkkoqPWAFO0+R3gcv9w7TlCpCirADdq5AKqaRCKqSSCqmQSipK+gHwTQYZtwZTVQAAAABJRU5ErkJggg== "Battery Indicator")

Layout:Up
---------
![Up Layout Battery Indicator](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGIAAACOCAIAAABFQUqgAAAAAXNSR0IArs4c6QAAAAZiS0dEAP8A/wD/oL2nkwAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB9sIBQouKm6ouJMAAAGWSURBVHja7d3RkYIwFEBR3LEAO9AOpINnKZaQDmjBkrAD7EA7sAO2gP1YJjFonHO/HYQzJA5gdDPPc1fQNE3P57P77Ha7Xd/3RZuYy4qI7uOLiMLD/Om0IEyYMGHChAmTMGHCtHabFd7jeDxeLpdKG08p3W632oewXecC/XQ61du4QWduwoQJkzBhwoQJ0xe26GIlIkquNg6HQ70DOJ/PJfs2juP1en3NrgzDMH9pwzAYdOYmTJgwYRImTJgwYcKESZgwYcKECRMmYcKECRMmTJiEaWmZX59vYl3937JX2mcypZRe9n2XFYuIcRwNOnMTJkyYMAkTJkyYMGHCJEyYMGFqocy7l4WL/d5V9gLIfCaDTpgwYWrzky6lNE1Tc0fb933ez7flP/Vt8XGmQYcJEyZMmIQJEyZMmDBhEiZMmDC1U+bdy7wlDc4mTMKE6QOmcMsOF2XZoTBhwoQJEyZMwoQJEyZMmDAJE6bKWXZYmcmgEyZMmN7cZsmL9vt91f/mfWP3+/3xeDgPJEmSJDV6TRcRFP7tF5VvpjOfDnyyAAAAAElFTkSuQmCC "Battery Indicator")

Layout:Down
-----------
![Down Layout Battery Indicator](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGIAAACOCAIAAABFQUqgAAAAAXNSR0IArs4c6QAAAAZiS0dEAP8A/wD/oL2nkwAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB9sIBQotLKzmTmUAAAF9SURBVHja7d3hkUNQFIDR2EkBOqAEHVyl6EQLSkgpdKAEOtCBbcGwrCfn+51InMmTEXMji4iXJEmSJCnJsi0PKoqiLMtH7v80TfM8/8222rZdH1rbtlsEfiwoTJgw3bD3vqd9Pp9pmpLb27Ism6a5lGkYhuSYImIfk0WHCRMmTJgwCRMmTJgwYcIkTJgwXd7OXy+7rluWJbm9zfP8Uqaqqiw6YcKEKU2muq6zBKvr2qfJosOECRMmYcKECRMmTJiECRMmTIn0XRegdr/t/ZczLTphwoQpzW86Y4dbmYwdChMmTJgwYcIkTJgwYcKECZMwYTozY4dnMhk7FCZMmDBhwoRJmDBhwoQJEyZhwoQJEyZMmIQJEyZMmDB9Y5vu6xsRu/9Y83Vg2G9LBwcg+76/y2BgRJx3Y96IsOgcmzBhwiRMmDBhwvTA3he8xrIsfd+ft/ErnJI4pfr3k0qLzrEJEyZMmDAJEyZMmG5Ztq7rkeeP43j/Sfs8zw+Ouv8CFfQAjSZxPXkAAAAASUVORK5CYII= "Battery Indicator")

###Overlapping Indicators
The position of the signal and battery indicators should not be set to overlap.

###Screen Orientation
The indicator positions are absolute and so when rotating the screen you should also move the indicator positions accordingly to accommodate the new screen layout.

###Internet Explorer (IE) Rendering Engine
When using the this feature on a CE device using the IE engine, screen distortion may be noticed when scrolling. This is due to a limitation of the IE engine and can be worked around using any of the following options:

* Not using debug buttons - If your app must use the IE engine, do not use debug buttons in the app.
* If you need to use the signal or battery indicators either:
    * Don't scroll the page.
    * Don't use the signal / battery indicators
    * Use the Webkit engine.

##Examples



###Show battery icon
This example shows how to show/hide the Battery icon as well as a way to adjust for a change in screen orientation. This example assumes that the ebapi-modules.js file is in the same folder as the html file invoking it.
<pre><code>:::javascript
&lt;head&gt;
    &lt;script type="text/javascript" charset="utf-8" src="ebapi-modules.js"&gt;&lt;/script&gt;

    &lt;title&gt;Battery API Test&lt;/title&gt;

    &lt;script&gt;
        function showBatteryIcon(){
            EB.Battery.showIcon(defineIconProperties(), batteryCallback);
            EB.Battery.batteryStatus({trigger:EB.Battery.BATTERY_TRIGGER_SYSTEM}, batteryCallback);
            // The batteryStatus() is used to tell the icon when to refresh.
            // We are leaving this up to the system events by using the BATTERY_TRIGGER_SYSTEM constant.
        }

        function hideBatteryIcon(){
            EB.Battery.hideIcon();
            EB.Battery.stopBatteryStatus();
        }

        function batteryCallback(params){
            if(params){     // Most of these methods have callbacks but null 'params' sent.
                console.log(params);
            }
            else
                console.log("No Params");
        }

        function defineIconProperties(){
            var props = {
                color:  "#66CD00",
                layout: EB.Battery.BATTERY_LAYOUT_UP,
                top:        0,                                                      // Top of screen
                left:   EB.System.screenWidth - 25      // Far right of screen, accounting for actual viewable area.
            }
            return props;
        }

        function adjustIcon(){
            EB.Battery.hideIcon();
            EB.Battery.showIcon(defineIconProperties(), batteryCallback);
        }

        // If the screen orientation changes, adjust the battery Icon.
        EB.ScreenOrientation.setScreenOrientationEvent(adjustIcon);
    &lt;/script&gt;
&lt;/head&gt;

&lt;body&gt;
    &lt;h1&gt;Battery API Test&lt;/h1&gt;
    &lt;div id="display"&gt;
    &lt;/div&gt;
    &lt;br/&gt;
    &lt;br/&gt;
    &lt;button onclick="showBatteryIcon()"&gt;Show Battery Status Icon&lt;/button&gt;&lt;br/&gt;
    &lt;button onclick="hideBatteryIcon()"&gt;Hide Battery Status Icon&lt;/button&gt;
&lt;/body&gt;
                                
                            
</code></pre>