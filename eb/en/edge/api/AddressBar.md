# AddressBar
## Overview
The AddressBar API is used to set the parameters of the address bar. The address bar should only be used for debugging and is not designed to be used as a replacement for a web browser address bar. Press the ‘Go’ button or enter key to navigate to the typed URI.

> Note: When using the addressBar on a VC5090 device, there is the possibility that the display will be slightly distorted while the addressBar is displayed. This only occurs when the addressBar or other similar overlays are on set to be visible.
Other overlays consist of, but are not necessarily limited to:
* backbutton
* keystate indicator
* forwardbutton
* gobutton
* minimizebutton
* quitbutton
* reloadButton
* sipbutton
* stopbutton

## Enabling the API
In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* elements.js 

> Note: this file either needs to be on the device in a relative folder from where your HTML page is, or it must be copied to your web server appropriately.

	:::html
    <script type="text/javascript" charset="utf-8" src="elements.js"></script>;

### API Usage
This API does not use the `EB` namespace. It is simply referenced using the API name:

	:::javascript
	addressBar.left = 0;

## Properties
### visibility
#### Type
<span class='text-info'>STRING</span> 
#### Description
Sets the visibility of the address bar.

#### Possible Value

* visible
* hidden

#### Platforms

* Android
* Windows Mobile/CE

#### Example
	:::js
	addressBar.visibility = "visible";

### left
#### Type
<span class='text-info'>INTEGER</span> - Positive number, representing pixels

#### Description
Sets the X position of the address bar. Default Value = 0.

#### Platforms

* Android
* Windows Mobile/CE

#### Example
	:::js
	addressBar.left = 100;

### top
#### Type
<span class='text-info'>INTEGER</span> - Positive number, representing pixels

#### Description
Sets the Y position of the address bar. Default Value = 0.

#### Platforms

* Android
* Windows Mobile/CE

#### Example
	:::js
	addressBar.top = 100;

### width
#### Type
<span class='text-info'>INTEGER</span> - Positive number, representing pixels

#### Description
Sets the width of the address bar. Default Value = Most of the screen width.

#### Platforms

* Android
* Windows Mobile/CE

#### Example
	:::js
	addressBar.width = EB.System.screenWidth;

> Note: The above example requires that the System API be available.

## Remarks
### Default Positions
By default this control will be placed a the top of the screen. On Windows Mobile if the ‘FullScreen’ configuration setting is disabled the control will need to be moved, otherwise it will appear beneath the task bar.

### Switching to Other Applications
All controls are designed to be shown on top of Enteprise Browser. If you require to switch to an application other than Enterprise Browser, you should minimize Enterprise Browser to ensure the buttons do not remain shown. (Not applicable to Android)

### Screen Orientation
When the screen orientation changes, either using the ScreenOrientation API or by rotating a device with hardware support, the command areas will automatically move and resize to fit the new layout. However the buttons themselves are not moved and in some cases this may result in them being off the screen or not in the expected position. If so they must be moved manually by detecting the ScreenOrientationEvent.

### Named Anchors
The address bar is not compatible with named anchors (page bookmarks) eg. <a name=“bookmark”/>

### Use in Production
This API is designed for debugging your application only and should not be used in production

### Internet Explorer (IE) Rendering Engine
When using the addressBar on a CE device using the IE engine, screen distortion may be noticed when scrolling. This is due to a limitation of the IE engine and can be worked around by any of the following options:

* Not using debug buttons - If your app must use the IE engine, do not use debug buttons in the app.
* If you need to use the signal or battery indicators either:
	* Don't scroll the page.
	* Don't use the signal / battery indicators
	* Use the Webkit engine.

## Example File
The following file can be used to test all the APIs listed above.

	:::html
	<head>
		<script type="text/javascript" charset="utf-8" src="apis/BackwardCompatibility/elements.js"></script>
		<script type="text/javascript" charset="utf-8" src="apis/EnterpriseBrowser/ebapi-modules.js"></script>

		<script>
			function onLoad(){
				visible = 0;
				screenWidth = EB.System.screenWidth;
			}

			function toggleAddressBar(){
				if(visible){
					addressBar.visibility = "hidden";
					visible = 0;
				}
				else{
					addressBar.visibility = "visible";
					// Reset addressBar to (0, 0)
					addressBar.left = 0;
					addressBar.top = 0;
					visible = 1;
				}
			}

			function moveAddressBar(direction, distance){
				switch(direction){
					case "left":
						addressBar.left = distance;
						break;
					case "top":
						addressBar.top = distance;
						break;
					default:
						alert("Invalid direction!!");
				}
			}

			function addressBarWidth(percent){
				width = screenWidth*(percent/100);
				addressBar.width = width;
			}
		</script>
	</head>

	<!-- Changing the body color to see that the BG of the address bar is white -->
	<body onload="onLoad()" bgcolor="#C8C8C8">
		<br/> <!-- Add break at the top of the screen to account for addressBar -->
		<h3>Toggle the Address Bar</h3>
		<button onclick="toggleAddressBar()">Toggle address bar</button>

		<h3>Move the Address Bar</h3>
		<button onclick="moveAddressBar('left', 100)">Left, 100px</button>
		<button onclick="moveAddressBar('top', 100)">Top, 100px</button>
		<button onclick="moveAddressBar('left', 0)">Left, 0px</button>
		<button onclick="moveAddressBar('top', 0)">Top, 0px</button>

		<h3>Change the width</h3>
		<button onclick="addressBarWidth(100)">Full screen width</button>
		<button onclick="addressBarWidth(50)">Half-screen width</button>
	</body>