#AddressBar


## Overview
The AddressBar API is used to set the parameters of the address bar. The address bar should only be used for debugging and is not designed to be used as a replacement for a web browser address bar. Press the ‘Go’ button or enter key to navigate to the typed URI.

## Enabling the API
In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* elements.js 

> Note - this file either needs to be on the device in a relative folder from where your HTML page is, or it must be copied to your web server appropriately.

	:::html
    <script type="text/javascript" charset="utf-8" src="elements.js"></script>;

### API Usage
This API does not use the `EB` namespace. It is simply referenced using the API name:

	:::javascript
	addressBar.left = 0;
        


##Properties

###visibility

####Type
<span class='text-info'>STRING</span> 
####Description
Sets the visibility of the address bar.

#### Possible Value

* visible
* hidden

####Platforms

* Android
* Windows Mobile/CE

###left

####Type
<span class='text-info'>INTEGER</span> - Positive number, representing pixels
####Description
Sets the X position of the address bar. Default Value = 0.

####Platforms

* Android
* Windows Mobile/CE

###top

####Type
<span class='text-info'>INTEGER</span> - Positive number, representing pixels
####Description
Sets the Y position of the address bar. Default Value = 0.

####Platforms

* Android
* Windows Mobile/CE

###width

####Type
<span class='text-info'>INTEGER</span> - Positive number, representing pixels
####Description
Sets the width of the address bar. Default Value = Most of the screen width.

####Platforms

* Android
* Windows Mobile/CE

## Remarks
###Default Positions
By default this control will be placed a the top of the screen. On Windows Mobile if the ‘FullScreen’ configuration setting is disabled the control will need to be moved, otherwise it will appear beneath the task bar.

###Switching to Other Applications
All controls are designed to be shown on top of Enteprise Browser. If you require to switch to an application other than Enterprise Browser, you should minimize Enterprise Browser to ensure the buttons do not remain shown. (Not applicable to Android)

###Screen Orientation
When the screen orientation changes, either using the ScreenOrientation API or by rotating a device with hardware support, the command areas will automatically move and resize to fit the new layout. However the buttons themselves are not moved and in some cases this may result in them being off the screen or not in the expected position. If so they must be moved manually by detecting the ScreenOrientationEvent.

###Named Anchors
The address bar is not compatible with named anchors (page bookmarks) eg. <a name=“bookmark”/>

###Use in Production
This API is designed for debugging your application only and should not be used in production