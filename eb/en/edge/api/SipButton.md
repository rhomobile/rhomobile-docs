# SipButton
## Overview
The SipButton Module is used to set the parameters of the SIP Button. The SIPButton will toggle the display of the soft input panel allowing keyboard input via a stylus.

> Note: When using the sipbutton on a VC5090 device, there is the possibility that the display will be slightly distorted while the sipbutton is displayed. This only occurs when the sipbutton or other similar overlays are on set to be visible.
Other overlays consist of, but are not necessarily limited to:
* addressBar
* backbutton
* keystate indicator
* forwardbutton
* gobutton
* minimizebutton
* quitbutton
* reloadButton
* stopbutton

## Enabling the API
In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* elements.js 

### API Usage
This API does not use the `EB` namespace. It is simply referenced using the API name:

	:::javascript
	sipButton.visibility = 'visible';

## Properties
### visibility
#### Type
<span class='text-info'>STRING</span> 
#### Description
Sets the visibility of the button.

#### Possible Value

* visible
* hidden

#### Platforms

* Android
* Windows Mobile/CE

### left
#### Type
<span class='text-info'>INTEGER</span> - Positive number, representing pixels
#### Description
Sets the X position of the button. Default Value = Bottom right of the screen.

#### Platforms

* Android
* Windows Mobile/CE

### top
#### Type
<span class='text-info'>INTEGER</span> - Positive number, representing pixels
#### Description
Sets the Y position of the button. Default Value = Bottom right of the screen.

#### Platforms

* Android
* Windows Mobile/CE

### width
#### Type
<span class='text-info'>INTEGER</span> - Positive number, representing pixels
#### Description
Sets the width of the button. Default Value = Dependant on screen resolution.

#### Platforms

* Android
* Windows Mobile/CE

### height
#### Type
<span class='text-info'>INTEGER</span> - Positive number, representing pixels
#### Description
Sets the height of the button. Default Value = Dependant on screen resolution.

#### Platforms

* Android
* Windows Mobile/CE

### imageUp
#### Type
<span class='text-info'>STRING</span> 
#### Description
Sets the image to be displayed when the button is in the up state. See Remarks.

#### Possible Value

* String - URL to location of image file in relation to the Enterprise Browser device folder. A default image is provided.

#### Platforms

* Android
* Windows Mobile/CE

### imageDown
#### Type
<span class='text-info'>STRING</span> 
#### Description
Sets the image to be displayed when the button is in the down state. See Remarks.

#### Possible Value

* String - URL to location of image file in relation to the Enterprise Browser device folder. A default image is provided.

#### Platforms

* Android
* Windows Mobile/CE

## Remarks
### Use of Images on Buttons.
Images can be specified as local to the device or on an HTTP / FTP server, just specify the required protocol as part of your URL (ex: file://\, HTTP:// ). Image will be scaled to the size of the button. JPEG and GIF images are only supported on WM devices. Both CE and WM support BMP files.

### Default Positions
By default this control will be placed a the top of the screen. On Windows Mobile if the ‘FullScreen’ configuration setting is disabled the control will need to be moved, otherwise it will appear beneath the task bar.

### Switching to Other Applications
All controls are designed to be shown on top of Enterprise Browser. If you require to switch to an application other than Enterprise Browser you should minimize Enterprise Browser to ensure the buttons do not remain shown. (Not applicable to Android)

### Screen Orientation
When the screen orientation changes, either using the ScreenOrientation tag or by rotating a device with hardware support, the command areas will automatically move and resize to fit the new layout. However the buttons themselves are not moved and in some cases this may result in them being off the screen or not in the expected position. If so they must be moved manually by detecting the ScreenOrientationEvent.

### Internet Explorer (IE) Rendering Engine">
When using the this feature on a CE device using the IE engine, screen distortion may be noticed when scrolling. This is due to a limitation of the IE engine and can be worked around by any of the following options:

* Not using debug buttons - If your app must use the IE engine, do not use debug buttons in the app.
* If you need to use the signal or battery indicators either:
    * Don't scroll the page.
    * Don't use the signal / battery indicators
    * Use the Webkit engine.