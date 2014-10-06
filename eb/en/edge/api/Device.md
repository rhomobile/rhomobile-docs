#Device


## Overview
The Device Module controls device functions like suspend and wake.

## Enabling the API
In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* elements.js 

> Note - this file either needs to be on the device in a relative folder from where your HTML page is, or it must be copied to your web server appropriately.

	:::html
    <script type="text/javascript" charset="utf-8" src="elements.js"></script>;


### API Usage
This API does not use the `EB` namespace. It is simply referenced using the API name:

	:::javascript
	device.suspend();

##Methods

### suspend()
Puts the device into suspend mode.

####Returns
* Void

####Platforms

* Windows Mobile/CE

### powerOff()
Puts the device into power off mode. In this mode the device will draw no power. Only supported on SB1.

####Returns
* Void

####Platforms

* SB1 Only

### wake()
Wakes the device from suspend mode.

####Returns
* Void

####Platforms

* Android
* Windows Mobile/CE

### calibrate()
Carries out the screen calibration routine.

####Returns
* Void

####Platforms

* Windows Mobile/CE

## Remarks
###Multi Instance
When multiple RhoElememts applications are running the following considerations should be made: Only the application with Focus will have the ability to control device functions.

