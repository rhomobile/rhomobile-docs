
# SettingsButton
## Overview
The SettingsButton module is used to display/hide the system settings button and set its parameters. When pressed, the settings button brings up the settings HTML page. **Applies to Android and Windows Mobile/CE**.

##Enabling the API
To use this API in an Android app, the app must contain a reference to `elements.js`, the JavaScript file that includes it: 

	:::html
    <script type="text/javascript" charset="utf-8" src="elements.js"></script>;

> **Important**: The `elements.js` must be in a location accessible by the HTML page from which it will be called. That location can be on the device or the web server on which the app resides. **The** `elements.js` **file is required only for Android**.  

### API Usage
The SettingsButton API is accessed using meta tag references: 

	:::html
	<META HTTP-Equiv="SettingsButton" Content="Visibility:Visible">

**Note**: Use of SettingsButton on a VC5090 device might result in slight screen distortion while the button is being displayed. This distortion also might occur with other overlays:

* addressBar
* backButton
* keyState 
* forwardButton
* goButton
* minimizeButton
* quitButton
* reloadButton
* sipButton
* stopButton

##Properties
###Visibility
####Type
<span class='text-info'>STRING</span> 
####Description
Determines whether the Settings button is displayed.

####Possible Values
* Visible
* **Hidden (defaut)**

####Platforms
* Android
* Windows Mobile/CE

####Example

	:::html
	<META HTTP-Equiv="SettingsButton" Content="Visibility:Visible">


###Left
####Type
<span class='text-info'>INTEGER</span> 
####Description
Sets the X position of the Settings button.

####Possible Value
* Positive number (in pixels) (default = top-right corner of the screen)

####Platforms

* Android
* Windows Mobile/CE

####Example

	:::html
	<META HTTP-Equiv="SettingsButton" Content="Left:50">

###Top
####Type
<span class='text-info'>INTEGER</span> 
####Description
Sets the Y position of the Settings button.

####Possible Value
* Positive number (in pixels)

####Platforms
* Android
* Windows Mobile/CE

####Example

	:::html
	<META HTTP-Equiv="SettingsButton" Content="Top:50">

###Height
####Type
<span class='text-info'>INTEGER</span> 
####Description
Sets the height of the Settings button.

####Possible Value
* Positive number (in pixels)

####Platforms
* Android
* Windows Mobile/CE

####Example

	:::html
	<META HTTP-Equiv="SettingsButton" Content="Height:50">

###Width
####Type
<span class='text-info'>INTEGER</span> 
####Description
Sets the width of the Settings button.

####Possible Value
* Positive number (in pixels)

####Platforms
* Android
* Windows Mobile/CE

####Example

	:::html
	<META HTTP-Equiv="SettingsButton" Content="Width:150">


###imageUp
####Type
<span class='text-info'>STRING</span> 
####Description
Sets the image to be displayed when the Settings Button is in the 'up' (not pressed) state. [See Remarks](../api/settingsButton?Remarks).

####Possible Value
* URL or fully-qualified local path to image

####Platforms
* Android
* Windows Mobile/CE

####Example

	:::html
	<META HTTP-Equiv="SettingsButton" Content="imageUp:http://image.com/sb_up_image.gif">

###imageDown
####Type
<span class='text-info'>STRING</span> 
####Description
Sets the image to be displayed when the Settings Button is in the 'down' state (pressed). [See Remarks](../api/settingsButton?Remarks).

####Possible Value
* URL or fully-qualified local path to image

####Platforms
* Android
* Windows Mobile/CE

####Example

	:::html
	<META HTTP-Equiv="SettingsButton" Content="imageDown:http://image.com/sb_down_image.gif">

##Remarks
###Button visibility
The Settings button is designed to remain in the foreground, appearing on top of all Enterprise Browser pages. It might therefore remain visible when switching to some non-EB apps. On Windows Mobile/CE devices, this can be prevented by minimizing Enterprise Browser before switching to another app. This issue does not apply to Android. 

###Device support
The Settings button is supported by any Zebra device equipped with a touch-sensitive display. 

###Images
Images can be specified for the 'up' (not pressed) and 'down' (pressed) state of the Settings button. Image files can be stored on the device (recommended) or a server. Specify the file protocol in the URL (file://, http://, ftp://). Image will be scaled to the size of the button. Windows Mobile/CE devices support .JPEG and .GIF; Windows CE also supports .BMP.

###Persistence
Changes to this module will persist when navigating to a new page.

###Sample code
In this example, the Settings button is made visible and its top and left coordinates are set to 50:

	:::html
	<META HTTP-Equiv="SettingsButton" Content="Visibility:Visible">
	<META HTTP-Equiv="SettingsButton" Content="Top:50">
	<META HTTP-Equiv="SettingsButton" Content="Left:50">

**Note**: Button position will vary based on whether the display is in portrait or landscape mode. To lock the screen in portrait mode, please refer to the [Screen orientation section](../guide/configreference?AutoRotate) of the [Config.xml Reference](../guide/configreference).   