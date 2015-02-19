#Keylight


## Overview
The Keylight Module is used to illuminate / extinguish the keyboard backlight as well as setting the intensity of the keylight.

## Enabling the API
In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* elements.js 

> Note - this file either needs to be on the device in a relative folder from where your HTML page is, or it must be copied to your web server appropriately.

	:::html
    <script type="text/javascript" charset="utf-8" src="elements.js"></script>;


### API Usage
This API does not use the `EB` namespace. It is simply referenced using the API name:

	:::javascript
	keylight.on();

##Methods

### on()
Turns the keyboard backlight on.

####Returns
* Void

####Platforms

* Windows Mobile/CE

### off()
Turn off the keyboard backlight.

####Returns
* Void

####Platforms

* Windows Mobile/CE

##Properties

###intensity

####Type
<span class='text-info'>INTEGER</span> - Positive Number, see remarks for range
####Description
Sets the keyboard backlight to the specified intensity.

>Note: The intensity tag will only have an observable effect if the keyboard backlight is turned on, setting the intensity by its self is insufficient to illuminate the backlight.

####Platforms

* Windows Mobile/CE


## Remarks
###Device Limits
The levels of supported keylight intensity is device dependent. When the Keylight module is first loaded it writes the supported levels to the log file as INFORMATION so you can determine the maximum setting from the log file.