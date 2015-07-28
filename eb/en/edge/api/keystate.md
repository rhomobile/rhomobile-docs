#KeyState


## Overview
The KeyState API is used to display small icons to the user indicating the current shifted state of the hardware keyboard. The KeyState indicator will display icons for Shift, Alt, Control, Function, Caps, Num lock and Orange key states, growing from the right as necessary if more than one key state is set at once. This API is only supported on a subset of Symbol Technologies' Windows Mobile / CE / Embedded handheld devices (see remarks).

> Note: When using the keyState indicator on a VC5090 device, there is the possibility that the display will be slightly distorted while the keyState indicator is displayed. This only occurs when the keyState indicator or other similar overlays are on set to be visible.
Other overlays consist of, but are not necessarily limited to:
* addressBar
* backbutton
* forwardbutton
* gobutton
* minimizebutton
* quitbutton
* reloadButton
* sipbutton
* stopbutton
        
## Enabling the API
There are two methods of enabling the KeyState API: 

* Include all ebapi modules or 
* Include only the API modules you need 

For either of these methods, you'll need to include files from the `/Enterprise Browser/JavaScript Files/Enterprise Browser` directory on the computer that you installed the Enterprise Browser.

### Include all JS API modules
To include all JS APIs, you must copy the ebapi-modules.js file to a location accessible by your app's files and include the JavaScript file in your app. For instance, to include the modules file in your index.html, with the file in the same directory as your index.html, you would add the following line to the <head> section of your index.html:

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi-modules.js"></script>

> Note: that the pathing for this file is relative to the current page.

This will define the EB class within the page. Any page you need to use the modules will need to have the .js file included in this fashion.

### Include only the modules you need
To include single APIs, you must first include the `ebapi.js` in your HTML as well as the API file you want to use. For instance, to use the KeyState API, I would add the following code to my HTML file(s), assuming the API files have been copied to the same directory as the HTML.

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi.js"></script>
    <script type="text/javascript" charset="utf-8" src="eb.keystate.js"></script>

The ebapi.js file is necessary for all single API inclusions.
        


##Methods



### hideStates()
Stops showing keystate icons representing the shifted state of the hardware keyboard.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile
* Zebra Devices Only

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.KeyState.hideStates()</code> 


### showStates(<span class="text-info">HASH</span> propertyMap)
Display keystate icons representing the shifted state of the hardware keyboard.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span> <span class='label label-info'>Optional</span><p>The properties associated with the keystate indicator, its size and position. Not specifying any properties will display the keystate indicators at the bottom right hand corner of the screen.</p></li><ul><li>right : <span class='text-info'>INTEGER</span><span class='label '> Default: [Keystate Indicators start at the bottom right of the screen]</span><p>The absolute horizontal position of the keystate indicators in pixels. This is the rightmost edge of the rightmost indicator, where multiple indicators are displayed simultaneously they will grow from right to left. </p></li><li>top : <span class='text-info'>INTEGER</span><span class='label '> Default: [Keystate Indicators start at the bottom right of the screen]</span><p>The absolute vertical position of the keystate indicators in pixels. </p></li><li>width : <span class='text-info'>INTEGER</span><span class='label '> Default: [A sensible width based on Screen Resolution]</span><p>The width of each keystate indicator in pixels. </p></li><li>height : <span class='text-info'>INTEGER</span><span class='label '> Default: [A sensible height based on Screen Resolution]</span><p>The width of each keystate indicator in pixels. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile
* Zebra Devices Only

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.KeyState.showStates(<span class="text-info">HASH</span> propertyMap)</code> 


##Remarks



###Devices lacking support
Due to platform limitations this API is not available on the following Zebra Technologies devices:

* ES400
* MC45
* MC65
* VC70
* MC45
* Workabout Pro 4

###Rotating the Screen
The keystate indicator positions are absolute and so when rotating the screen you should also reposition the keystate accordingly to accommodate the new screen layout.