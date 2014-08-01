#WebView


## Overview
The `Webview` is the core container used for rendering your application code. You can control certain behaviors of the webview by using this API class.
## Enabling the API
In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* ebapi-modules.js - this file contains all available Enterprise Browser APIs

If you wish to minimize the amount of JavaScript being included, you can choose to only include the individual API that your application is using:

ex:

* ebapi.js - core APIs needed 
* eb.webview.js - just the Webview API
* other individual JavaScript files included with the Enterprise Browser installation

        


##Methods



### active_tab()
<p>Use NativeTabbar.currentTab property: returns the current tab index.</p>


####Parameters

callback : <span class='text-info'>CallBackHandler</span>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span>

####Returns
Synchronous Return:

* INTEGER

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.WebView.active_tab()</code> 


### full_screen_mode(<span class="text-info">BOOLEAN</span> enable)
<p>Use WebView.fullScreen property: Switch to / from full screen mode.</p>


####Parameters
<ul><li>enable : <span class='text-info'>BOOLEAN</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.WebView.full_screen_mode(<span class="text-info">BOOLEAN</span> enable)</code> 


### navigate(<span class="text-info">STRING</span> url, <span class="text-info">INTEGER</span> tabIndex)
<p>Force WebView to navigate to a URL. White page flickering during transition may happen if a controller action method doesn&rsquo;t return any rendered value, but instead performs a WebView.navigate(someUrl) call. It is important to avoid using WebView.navigate in Ruby action methods because WebView.navigate is intended to be used in callback methods asynchronously.</p>


####Parameters
<ul><li>url : <span class='text-info'>STRING</span><p>
<p>Navigate to this url.</p>
 </p></li><li>tabIndex : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><span class='label '> Default: -1</span><p>
<p>TabBar tab index. If no tab bar present, index is ignored. Please avoid of navigate in not opened tab &ndash; this is unsupported on Android.</p>
 
<p>Refresh active WebView.</p>
</p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.WebView.navigate(<span class="text-info">STRING</span> url, <span class="text-info">INTEGER</span> tabIndex)</code> 


### navigateBack(<span class="text-info">INTEGER</span> tabIndex)
<p>Force WebView to navigate to the previous page using Browser back.</p>


####Parameters
<ul><li>tabIndex : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><span class='label '> Default: -1</span><p>
<p>TabBar tab index. If no tab bar present, index is ignored.</p>
 
<p>Navigate back in active WebView.</p>
</p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.WebView.navigateBack(<span class="text-info">INTEGER</span> tabIndex)</code> 


### refresh(<span class="text-info">INTEGER</span> tabIndex)
<p>Force WebView to refresh the current page.</p>


####Parameters
<ul><li>tabIndex : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><span class='label '> Default: -1</span><p>
<p>TabBar tab index. If no tab bar present, index is ignored.</p>
 
<p>Refresh active WebView.</p>
</p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.WebView.refresh(<span class="text-info">INTEGER</span> tabIndex)</code> 


### save(<span class="text-info">STRING</span> format, <span class="text-info">STRING</span> path, <span class="text-info">INTEGER</span> tabIndex)
<p>Save current page to file system.</p>


####Parameters
<ul><li>format : <span class='text-info'>STRING</span><p>
<p>Format of the saved page.</p>
 </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>Constant: EB.WebView.SAVE_FORMAT_JPEG <br/> String:jpeg</dt><dd>
<p>Save as jpeg image.</p>
</dd></dl></li><li>path : <span class='text-info'>STRING</span><p>
<p>Path to the file / folder to save the page.</p>
 </p></li><li>tabIndex : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><span class='label '> Default: -1</span><p>
<p>TabBar tab index. If no tab bar present, index is ignored.</p>
 
<p>If tabbar index omitted then active WebView will be saved.</p>
</p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.WebView.save(<span class="text-info">STRING</span> format, <span class="text-info">STRING</span> path, <span class="text-info">INTEGER</span> tabIndex)</code> 


### set_menu_items(<span class="text-info">HASH</span> menuItems)
<p>Use Application.nativeMenu property: set native menu items.</p>


####Parameters
<ul><li>menuItems : <span class='text-info'>HASH</span><p>
<p>Map of menu items: name to action.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.WebView.set_menu_items(<span class="text-info">HASH</span> menuItems)</code> 


##Properties



###activeTab

####Type
<span class='text-info'>INTEGER</span> <span class='label'>Read Only</span>
####Description

<p>Return an active tab index. For change active tab use Use Rho.NativeTabbar.currentTab property.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.WebView.activeTab</code>



####Platforms

* Android
* Windows Mobile/CE

###cacheSize

####Type
<span class='text-info'>INTEGER</span> <span class='label'>Read Only</span>
####Description

<p>The browser cache size, in whole MBs. Defines in config.xml: Navigation\Cache.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.WebView.cacheSize</code>



####Platforms

* Windows Mobile/CE(Motorola Solutions' WebKit)

###enableCache

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description

<p>Enable / disable Browser cache. Use &lsquo;WebView.enableCache&rsquo; parameter in rhoconfig.txt to configure this value.</p>

####Params
<p><strong>Default:</strong> true</p>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.WebView.enableCache</code>



####Platforms

* Android

###enablePageLoadingIndication

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description

<p>Show page loading indication. On Windows Mobile/CE this property can be set only in config.xml: GUI\HourglassEnabled. At Android  use &lsquo;disable_loading_indication&rsquo; parameter in Config.xml to configure this value.</p>

####Params
<p><strong>Default:</strong> true</p>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.WebView.enablePageLoadingIndication</code>



####Platforms

* Android
* Windows Mobile/CE(Motorola Solutions' WebKit on Windows Mobile/CE)

###enableWebPlugins

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description

<p>Enable / disable web plug-ins. Use &lsquo;enable_web_plugins&rsquo; parameter in Config.xml to configure this value. This option only has effect on Android versions before 4.0 (ICS). It mainly affects if Flash content is displayed.</p>

####Params
<p><strong>Default:</strong> true</p>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.WebView.enableWebPlugins</code>



####Platforms

* Android

###enableZoom

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description

<p>Enable WebView zoom. Use &lsquo;enable_screen_zoom&rsquo; parameter in Config.xml to configure this value.</p>

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

<p>Specifies the default font to use when rendering text in web pages. The specified font should be a TrueType font present on the device. On Windows the default font has been set to &lsquo;Tahoma&rsquo; as this is present on all Motorola WM / CE devices, note that Tahoma has no italic or oblique variants. On the Enterprise Tablet the default is Droid Sans Fallback. The font specified must be stored in \Windows for Windows WM / CE devices, or /system/fonts for Enterprise Tablet. Defines in config.xml: HTMLStyles\FontFamily</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.WebView.fontFamily</code>



####Platforms

* Windows Mobile/CE(Motorola Solutions' WebKit)

###framework

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>Same as System.webViewFramework.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.WebView.framework</code>



####Platforms

* Android
* Windows Mobile/CE

###fullScreen

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Use full screen mode.</p>

####Params
<p><strong>Default:</strong> false</p>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.WebView.fullScreen</code>



####Platforms

* Android
* Windows Mobile/CE

###navigationTimeout

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Can be defined in config.xml: Navigation\NavTimeout. Number of milliseconds(maximum is 45000) before the browser times out and navigates to the page specified in the badlink setting. If it is determined that the destination is unreachable regardless of wait time, the badlink may be loaded before NAVTIMEOUT. This is the time taken to establish communication with the server, not the time taken to fully load the page.Note that the navigation timeout will not be invoked when navigating to the start page, best practice is to store your first page locally to avoid connectivity issues at start up, you can then redirect to an online page if desired.</p>

####Params
<p><strong>Default:</strong> 45000</p>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.WebView.navigationTimeout</code>



####Platforms

* Windows Mobile/CE(Motorola Solutions' WebKit)

###scrollTechnique

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>Specifies the technique used to scroll about the page.Defines in config.xml: Scrolling\ScrollTechnique.</p>

####Params
<p><strong>Default:</strong> FingerScroll</p>
####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.WebView.SCROLL_NONE - String: None 
<p>No scrollbars will be displayed and the page will not respond to finger swipes.</p>

* Constant: EB.WebView.SCROLL_SCROLLBARS - String: Scrollbars 
<p>When the size of the page is larger than the screen scrollbars will be presented which can be used to scroll the page.</p>

* Constant: EB.WebView.SCROLL_FINGER - String: FingerScroll 
<p>You can scroll around the page using finger swiping.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.WebView.scrollTechnique</code>



####Platforms

* Windows Mobile/CE(Motorola Solutions' WebKit)

###textZoomLevel

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Sets the font size to be displayed on the page, set to 0 for the smallest font and 4 for the largest font.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.WebView.textZoomLevel</code>



####Platforms

* Windows Mobile/CE(Motorola Solutions' WebKit)

###userAgent

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>Defines in config.xml: Navigation\UserAgent. When visiting a web server the WebKit browser will report its self as the specified user agent. Use the following substitution variables:</p>

<ul>
<li>%p &ndash; platform name (&ldquo;Windows CE &rdquo; + version number)</li>
<li>%w &ndash; WebKit version number</li>
<li>%e &ndash; MotorolaWebKit version number.</li>
</ul>


<p>Use the UserAgent setting to spoof your device to the server, e.g. to view content designed for the desktop on your mobile screen.
From RhoElements 2.1 onwards the default value was changed to work out of the box with a greater number of server configurations, prior to RhoElements 2.1 the default user agent was: &ldquo;Mozilla/5.0 (%p) AppleWebKit/%w (KHTML, like Gecko) MotorolaWebKit/%e Safari/%w&rdquo;</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.WebView.userAgent</code>



####Platforms

* Windows Mobile/CE(Motorola Solutions' WebKit)

###viewportEnabled

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description

<p>Whether to enable or disable viewport meta tag processing.Defines in config.xml: Navigation\ViewportEnabled.</p>

####Params
<p><strong>Default:</strong> true</p>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.WebView.viewportEnabled</code>



####Platforms

* Windows Mobile/CE(Motorola Solutions' WebKit)

###viewportWidth

####Type
<span class='text-info'>INTEGER</span> <span class='label'>Read Only</span>
####Description

<p>Default viewport width to use for pages that do not have a viewport meta tag (uses 1:1 scaling if not specified).Defines in config.xml: Navigation\ViewportWidth.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.WebView.viewportWidth</code>



####Platforms

* Windows Mobile/CE(Motorola Solutions' WebKit)

###zoomPage

####Type
<span class='text-info'>FLOAT</span> 
####Description

<p>Sets the zoom factor of the page. Factor 1.0 is no zoom, values less than 1.0 are zoomed out and values greater than 1.0 are zoomed in.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.WebView.zoomPage</code>



####Platforms

* Windows Mobile/CE(Motorola Solutions' WebKit)