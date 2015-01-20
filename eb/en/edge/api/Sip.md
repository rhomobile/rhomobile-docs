# Sip
## Overview
The Sip Module is used to control attributes of the soft input panel. Note that these settings apply to both text boxes on the current page as well as the [address bar](../api/AddressBar).

## Enabling the API
In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* elements.js 

> Note: this file either needs to be on the device in a relative folder from where your HTML page is, or it must be copied to your web server appropriately.

	:::html
    <script type="text/javascript" charset="utf-8" src="elements.js"></script>;

### API Usage
This API does not use the `EB` namespace. It is simply referenced using the API name:

	:::javascript
	sip.manual();

## Methods
### manual()
The SIP will show or hide only when the SIP button is pressed.

#### Returns
* Void

#### Platforms

* Windows Mobile/CE

### automatic()
Shows and hides the SIP when editable fields have focus.

#### Returns

* Void

#### Platforms

* Android
* Windows Mobile/CE

## Properties
### left
#### Type
<span class='text-info'>INTEGER</span>

#### Description
Sets the horizontal position of the SIP in pixels. 

> Note: Note compatible with Finger Scrolling on Windows devices

### Possible Values

* Horizontal position, in pixels - Default: Center of Screen

#### Platforms

* Windows Mobile/CE

### top
#### Type
<span class='text-info'>INTEGER</span> 
#### Description
Sets the vertical position of the SIP in pixels. 

> Note: Note compatible with Finger Scrolling on Windows devices

### Possible Values

* Vertical position, in pixels - Default: Bottom of Screen

####Platforms

* Windows Mobile/CE

## Remarks
### Multi Instance
When multiple Enterprise Browser applications are running the following considerations should be made: The SIP settings are application specific. Switching to another application which uses the SIP module will apply the focused application’s settings to it, e.g. the SIP may move position.

### Disabling the SIP
If you want to completely disable to the use of the SIP, set it to appear off the visible area of the screen by setting the Left and Top coordinates to be off the device's display size. Alternatively on Android, call the manual method.

###Interaction with Hardware Keyboard
The SIP used is the standard keyboard input panel supplied with Windows. Certain incompatibilities exist when using the software keyboard on a device which also has a hardware keyboard though this will have no impact on the average user. For example moving the SIP will reset the alpha or function key (orange or blue key) lock and using the orange or blue keys may reset the position of the SIP on certain devices. Also note that if you press a hardware key the SIP will disappear if you are using the Internet Explorer engine and you will need to press the SIP button again or return focus to an editable field to get it to appear

###Interaction with Screen Rotation
Depending on the underlying operating system the SIP position may change following screen rotation. The SIP left and top parameters can be applied in a ScreenOrientationEvent to bypass this feature if required.

###IE Rendering Engine
The SIP behavior have slightly different behavior when using Internet Explorer as the rendering engine:

* Manual: When shown by the SIP Button, will show and hide when text boxes have focus.
* Automatic: Shows and hides when text boxes have focus. Applying SIP control Automatic will prevent SIP control Manual being applied in the same application. To return to Manual SIP control you can press a hardware key. 
* Manual and Automatic do not apply for Windows CE, only Windows Mobile.

### Webkit Rendering Engine
When using the webkit rendering engine, the SIP is by default, manually controlled, not automatic. Keep this in mind when using the SIP on devices which use the webkit rendering engine.