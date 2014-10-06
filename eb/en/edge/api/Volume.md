#Volume

## Overview
The Volume Module is used to set the audio output volume of the device. This is the wave output volume, not the volume of the device beeper.

## Enabling the API
In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* elements.js 

> Note - this file either needs to be on the device in a relative folder from where your HTML page is, or it must be copied to your web server appropriately.

	:::html
    <script type="text/javascript" charset="utf-8" src="elements.js"></script>;


### API Usage
This API does not use the `EB` namespace. It is simply referenced using the API name:

	:::javascript
	volume.setVolume = '0xFFFF';


##Properties

###setVolume

####Type
<span class='text-info'>STRING</span> 
####Description
Specifies a new volume setting. The low-order word contains the left-channel volume setting, and the high-order word contains the right-channel setting. A value of 0xFFFF represents full volume, and a value of 0x0000 is silence. If a device does not support both left and right volume control, the low-order word specifies the volume level and the high-order word is ignored.

#### Possible Value

* Volume in the format 0xnnnn

####Platforms

* Android
* Windows Mobile/CE


## Remarks
###Multi Instance
When multiple Enterprise Browser applications are running the following considerations should be made: The volume settings are application specific. Switching to another application which uses the volume module will cause the device volume to change to that specified by the application with focus. Only the application with Focus will have the ability to change the volume settings.