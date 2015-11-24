#Reboot


## Overview
The Reboot Module is used to reboot the terminal immediately.

## Enabling the API
In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* elements.js 

### API Usage
This API does not use the `EB` namespace. It is simply referenced using the API name:

	:::javascript
	reboot.bootType = 'Warm';

##Properties

### bootType 

####Type
<span class='text-info'>STRING</span>
####Description
Reboots the device using either a Warm or Cold software boot (as specified). Note on CE6 devices a 'ColdCAD' boot is required to replicate the Coldboot key sequence, e.g. 1+9+Power on an MC3000. **Not all Windows Mobile/CE devices support Cold or ColdCAD features. If a cold boot is attempted on such devices, a warm boot will be performed instead**.

####Possible Values

* Warm
* Cold
* ColdCAD

####Platforms

* Windows Mobile/CE

##Remarks

###Suggested Use
The Reboot tag can be used to apply new settings after downloading files (eg. .REG) or applications from a server.

###Windows Mobile
In WM 5.0 and higher, there is no software difference between a warm and a cold boot as the device uses persistent storage; both the file and registry will remain the same after boot.

