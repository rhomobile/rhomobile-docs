#WebView


## Overview
The `Webview` is the core container used for rendering your application code. You can control certain behaviors of the webview by using this API class.

> Note: There is currently an issue with hyperlinks on CE devices using the IE Engine: if you are attempting to click a link while holding the shift hardware key on the device, the link will not work properly. This is a known issue and is being worked on currently.
        
## Enabling the API
There are two methods of enabling the Webview API: 

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
To include single APIs, you must first include the `ebapi.js` in your HTML as well as the API file you want to use. For instance, to use the Webview API, I would add the following code to my HTML file(s), assuming the API files have been copied to the same directory as the HTML.

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi.js"></script>
    <script type="text/javascript" charset="utf-8" src="eb.webview.js"></script>

The ebapi.js file is necessary for all single API inclusions.

        


##Methods



### navigate(<span class="text-info">STRING</span> url, <span class="text-info">INTEGER</span> tabIndex)
Force WebView to navigate to a URL. White page flickering during transition may happen if a controller action method doesn't return any rendered value, but instead performs a WebView.navigate(someUrl) call. It is important to avoid using WebView.navigate in Ruby action methods because WebView.navigate is intended to be used in callback methods asynchronously.

####Parameters
<ul><li>url : <span class='text-info'>STRING</span><p>Navigate to this url. </p></li><li>tabIndex : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><span class='label '> Default: -1</span><p>TabBar tab index. If no tab bar present, index is ignored. Please avoid of navigate in not opened tab - this is unsupported on Android. Refresh active WebView.</p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.WebView.navigate(<span class="text-info">STRING</span> url, <span class="text-info">INTEGER</span> tabIndex)</code> 


### navigateBack(<span class="text-info">INTEGER</span> tabIndex)
Force WebView to navigate to the previous page using Browser back.

####Parameters
<ul><li>tabIndex : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><span class='label '> Default: -1</span><p>TabBar tab index. If no tab bar present, index is ignored. Navigate back in active WebView.</p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.WebView.navigateBack(<span class="text-info">INTEGER</span> tabIndex)</code> 


### refresh(<span class="text-info">INTEGER</span> tabIndex)
Force WebView to refresh the current page.

####Parameters
<ul><li>tabIndex : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><span class='label '> Default: -1</span><p>TabBar tab index. If no tab bar present, index is ignored. Refresh active WebView.</p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.WebView.refresh(<span class="text-info">INTEGER</span> tabIndex)</code> 


### save(<span class="text-info">STRING</span> format, <span class="text-info">STRING</span> path, <span class="text-info">INTEGER</span> tabIndex)
Save current page to file system.

####Parameters
<ul><li>format : <span class='text-info'>STRING</span><p>Format of the saved page. </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>Constant: EB.WebView.SAVE_FORMAT_JPEG <br/> String:jpeg</dt><dd>Save as jpeg image.</dd></dl></li><li>path : <span class='text-info'>STRING</span><p>Path to the file / folder to save the page. </p></li><li>tabIndex : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><span class='label '> Default: -1</span><p>TabBar tab index. If no tab bar present, index is ignored. If tabbar index omitted then active WebView will be saved.</p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.WebView.save(<span class="text-info">STRING</span> format, <span class="text-info">STRING</span> path, <span class="text-info">INTEGER</span> tabIndex)</code> 


##Properties



###activeTab

####Type
<span class='text-info'>INTEGER</span> <span class='label'>Read Only</span>
####Description
Return an active tab index. For change active tab use Use Rho.NativeTabbar.currentTab property.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.WebView.activeTab</code>



####Platforms

* Android
* Windows Mobile
* Windows CE

###cacheSize

####Type
<span class='text-info'>INTEGER</span> <span class='label'>Read Only</span>
####Description
The browser cache size, in whole MBs. Defines in config.xml: Navigation\\Cache.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.WebView.cacheSize</code>



####Platforms

* Windows Mobile(WebKit)

###enableCache

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description
Enable / disable Browser cache. Use 'WebView.enableCache' parameter in rhoconfig.txt to configure this value.
####Params
<p><strong>Default:</strong> true</p>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.WebView.enableCache</code>



####Platforms

* Android

###enableZoom

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description
Enable WebView zoom. Use 'enable_screen_zoom' parameter in Config.xml to configure this value.
####Params
<p><strong>Default:</strong> true</p>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.WebView.enableZoom</code>



####Platforms

* Android

###fontFamily

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description
Specifies the default font to use when rendering text in web pages. The specified font should be a TrueType font present on the device. On Windows the default font has been set to 'Tahoma' as this is present on all Symbol WM / CE devices, note that Tahoma has no italic or oblique variants. On the Enterprise Tablet the default is Droid Sans Fallback. The font specified must be stored in \Windows for Windows WM / CE devices, or /system/fonts for Enterprise Tablet. Defines in config.xml: HTMLStyles\\FontFamily 
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.WebView.fontFamily</code>



####Platforms

* Windows Mobile(WebKit)

###framework

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description
Same as System.webViewFramework.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.WebView.framework</code>



####Platforms

* Android
* Windows Mobile
* Windows CE

###fullScreen

####Type
<span class='text-info'>BOOLEAN</span> 
####Description
Use full screen mode.
####Params
<p><strong>Default:</strong> true</p>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.WebView.fullScreen</code>



####Platforms

* Android
* Windows Mobile
* Windows CE

###navigationTimeout

####Type
<span class='text-info'>INTEGER</span> 
####Description
Can be defined in config.xml: Navigation\\NavTimeout. Number of milliseconds(maximum is 45000) before the browser times out and navigates to the page specified in the badlink setting. If it is determined that the destination is unreachable regardless of wait time, the badlink may be loaded before NAVTIMEOUT. This is the time taken to establish communication with the server, not the time taken to fully load the page.Note that the navigation timeout will not be invoked when navigating to the start page, best practice is to store your first page locally to avoid connectivity issues at start up, you can then redirect to an online page if desired.
####Params
<p><strong>Default:</strong> 45000</p>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.WebView.navigationTimeout</code>



####Platforms

* Windows Mobile(WebKit)

###scrollTechnique

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description
Specifies the technique used to scroll about the page.Defines in config.xml: Scrolling\\ScrollTechnique.
####Params
<p><strong>Default:</strong> FingerScroll</p>
####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.WebView.SCROLL_NONE - String: None No scrollbars will be displayed and the page will not respond to finger swipes.
* Constant: EB.WebView.SCROLL_SCROLLBARS - String: Scrollbars When the size of the page is larger than the screen scrollbars will be presented which can be used to scroll the page.
* Constant: EB.WebView.SCROLL_FINGER - String: FingerScroll You can scroll around the page using finger swiping.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.WebView.scrollTechnique</code>



####Platforms

* Windows Mobile(WebKit)

###textZoomLevel

####Type
<span class='text-info'>INTEGER</span> 
####Description
Sets the font size to be displayed on the page, set to 0 for the smallest font and 4 for the largest font.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.WebView.textZoomLevel</code>



####Platforms

* Windows Mobile(WebKit)

###userAgent

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description
Defines in config.xml: Navigation\\UserAgent. When visiting a web server the WebKit browser will report its self as the specified user agent. Use the following substitution variables:

* %p - platform name ("Windows CE " + version number)
* %w - WebKit version number
* %e - WebKit version number.

Use the UserAgent setting to spoof your device to the server, e.g. to view content designed for the desktop on your mobile screen.
From RhoElements 2.1 onwards the default value was changed to work out of the box with a greater number of server configurations, prior to RhoElements 2.1 the default user agent was: "Mozilla/5.0 (%p) AppleWebKit/%w (KHTML, like Gecko) WebKit/%e Safari/%w"
                
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.WebView.userAgent</code>



####Platforms

* Windows Mobile(WebKit)

###viewportEnabled

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description
Whether to enable or disable viewport meta tag processing.Defines in config.xml: Navigation\\ViewportEnabled.
####Params
<p><strong>Default:</strong> true</p>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.WebView.viewportEnabled</code>



####Platforms

* Windows Mobile(WebKit)

###viewportWidth

####Type
<span class='text-info'>INTEGER</span> <span class='label'>Read Only</span>
####Description
Default viewport width to use for pages that do not have a viewport meta tag (uses 1:1 scaling if not specified).Defines in config.xml: Navigation\\ViewportWidth.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.WebView.viewportWidth</code>



####Platforms

* Windows Mobile(WebKit)

###zoomPage

####Type
<span class='text-info'>FLOAT</span> 
####Description
Sets the zoom factor of the page. Factor 1.0 is no zoom, values less than 1.0 are zoomed out and values greater than 1.0 are zoomed in.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.WebView.zoomPage</code>



####Platforms

* Windows Mobile(WebKit)