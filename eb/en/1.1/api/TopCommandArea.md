# TopCommandArea
## Overview
The TopCommandArea API is used to set the parameters of the Top Command Area. The top command area is a region at the top of the screen designed to hold Enterprise Browser controls such as the address bar or Go button to separate them from the rest of the user application.

## Enabling the API
In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* elements.js 

> Note - this file either needs to be on the device in a relative folder from where your HTML page is, or it must be copied to your web server appropriately.

	:::html
    <script type="text/javascript" charset="utf-8" src="elements.js"></script>;

### API Usage
This API does not use the `EB` namespace. It is simply referenced using the API name:

	:::javascript
	topCommandArea.visibility = 'visible';

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

### height
#### Type
<span class='text-info'>INTEGER</span> - Positive number, representing pixels

#### Description
Slightly greater than the height of a buttons default height, which depends on the screen resolution.

#### Platforms

* Android
* Windows Mobile/CE

### image
#### Type
<span class='text-info'>STRING</span>

#### Description
Sets the image to be displayed on the bottom command area. See Remarks.

#### Possible Value

* String - URL to location of image file in relation to the Enterprise Browser device folder. A default image is provided.

#### Platforms

* Android
* Windows Mobile/CE

### color
#### Type
<span class='text-info'>STRING</span> 

#### Description
The color to set the bottom command area to.

#### Possible Value

* Color in the #RRGGBB format ex: `bottomCommandArea.color='#FF0000';`

#### Platforms

* Android
* Windows Mobile/CE

## Remarks
### Use of Images.
Images can be specified as local to the device or on an HTTP / FTP server, just specify the required protocol as part of your URL (file://\, HTTP:// and FTP://). Image will be scaled to the size of the command area. JPEG and GIF images are only supported on WM devices. Both CE and WM support BMP files.

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