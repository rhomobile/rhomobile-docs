#Stylus


## Overview
The Stylus Module is used to enable or disable the touch screen.

## Enabling the API
In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* elements.js 

> Note - this file either needs to be on the device in a relative folder from where your HTML page is, or it must be copied to your web server appropriately.

	:::html
    <script type="text/javascript" charset="utf-8" src="elements.js"></script>;


### API Usage
This API does not use the `EB` namespace. It is simply referenced using the API name:

	:::javascript
	stylus.enable();


##Methods

### enable()
Enables the touch screen.

####Returns
* Void

####Platforms

* Windows Mobile/CE

### disable()
Disables the touch screen.

####Returns
* Void

####Platforms

* Windows Mobile/CE

## Remarks
###Remote Display
This tag does not affect the behavior of remote display applications for controlling the device

###Devices lacking support
Due to platform limitations this API is not available on the following Zebra Technologies' devices:

* Workabout Pro 4
