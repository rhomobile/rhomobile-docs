#WebView


## Overview
<p>The <code>Webview</code> is the core container used for rendering your application code. You can control certain behaviors of the webview by using this API class.</p>
<h2>Enabling the API</h2>

<p>This API is part of the <code>coreapi</code> extension that is included automatically.</p>

<pre><code>:::ruby
extensions: ["coreapi"]
</code></pre>

<h2>JavaScript Usage</h2>

<p>Be sure to review the <a href="/guide/api_js">JavaScript API Usage</a> guide for important information about using this API in JavaScript.</p>

<h2>Ruby Usage</h2>

<p>Be sure to review the <a href="/guide/api_ruby">Ruby API Usage</a> guide for important information about using this API in Ruby.</p>



##Methods



### active_tab()
Use Rho::NativeTabbar.currentTab property: returns the current tab index.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>INTEGER</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded
* Windows Phone 8
* Windows Desktop

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.WebView.active_tab()</code> </li></ul></li></ul>

### currentLocation(<span class="text-info">INTEGER</span> tabIndex)
Returns the relative url (location) of the current page(without server and port); the last URL loaded to WebView from Ruby controller action.

####Parameters
<ul><li>tabIndex : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><span class='label '> Default: -1</span><p>
TabBar tab index. If no tab bar present, index is ignored.Tab should be loaded once to return current url. 
Current location of active WebView.</p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>STRING</li></ul>

####Platforms

* Ruby
* Android
* iOS
* Windows Embedded
* Windows Phone 8
* Windows Desktop

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul></ul></li></ul>

### currentURL(<span class="text-info">INTEGER</span> tabIndex)
Returns the actual URL in WebView. This works the same as the JavaScript window.location.href.

####Parameters
<ul><li>tabIndex : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><span class='label '> Default: -1</span><p>
TabBar tab index. If no tab bar present, index is ignored. 
Current url of active WebView.</p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>STRING</li></ul>

####Platforms

* Ruby
* Android
* iOS

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul></ul></li></ul>

### executeJavascript(<span class="text-info">STRING</span> javascriptText, <span class="text-info">INTEGER</span> tabIndex)
Execute JavaScript on the current page from your controller.

####Parameters
<ul><li>javascriptText : <span class='text-info'>STRING</span><p>
The call to the JavaScript method on the current page, such as "test();". </p></li><li>tabIndex : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><span class='label '> Default: -1</span><p>
TabBar tab index. If no tab bar present, index is ignored. 
Execute javascript in active WebView.</p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Ruby
* Android
* iOS
* Windows Embedded
* Windows Phone 8
* Windows Desktop

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul></ul></li></ul>

### full_screen_mode(<span class="text-info">BOOLEAN</span> enable)
Use WebView.fullScreen property: Switch to / from full screen mode.

####Parameters
<ul><li>enable : <span class='text-info'>BOOLEAN</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded
* Windows Phone 8
* Windows Desktop

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.WebView.full_screen_mode(<span class="text-info">BOOLEAN</span> enable)</code> </li></ul></li></ul>

### navigate(<span class="text-info">STRING</span> url, <span class="text-info">INTEGER</span> tabIndex)
Force WebView to navigate to a URL.

####Parameters
<ul><li>url : <span class='text-info'>STRING</span><p>
Navigate to this url. </p></li><li>tabIndex : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><span class='label '> Default: -1</span><p>
TabBar tab index. If no tab bar present, index is ignored. Please avoid of navigate in not opened tab - this is unsupported on Android. 
Refresh active WebView.</p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded
* Windows Phone 8
* Windows Desktop

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.WebView.navigate(<span class="text-info">STRING</span> url, <span class="text-info">INTEGER</span> tabIndex)</code> </li></ul></li></ul>

### navigateBack(<span class="text-info">INTEGER</span> tabIndex)
Force WebView to navigate to the previous page using Browser back.

####Parameters
<ul><li>tabIndex : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><span class='label '> Default: -1</span><p>
TabBar tab index. If no tab bar present, index is ignored. 
Navigate back in active WebView.</p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded
* Windows Phone 8
* Windows Desktop

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.WebView.navigateBack(<span class="text-info">INTEGER</span> tabIndex)</code> </li></ul></li></ul>

### refresh(<span class="text-info">INTEGER</span> tabIndex)
Force WebView to refresh the current page.

####Parameters
<ul><li>tabIndex : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><span class='label '> Default: -1</span><p>
TabBar tab index. If no tab bar present, index is ignored. 
Refresh active WebView.</p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded
* Windows Phone 8
* Windows Desktop

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.WebView.refresh(<span class="text-info">INTEGER</span> tabIndex)</code> </li></ul></li></ul>

### save(<span class="text-info">STRING</span> format, <span class="text-info">STRING</span> path, <span class="text-info">INTEGER</span> tabIndex)
Save current page to file system.

####Parameters
<ul><li>format : <span class='text-info'>STRING</span><p>
Format of the saved page. </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>Constant: Rho.WebView.SAVE_FORMAT_JPEG <br/> String:jpeg</dt><dd>
Save as jpeg image.</dd></dl></li><li>path : <span class='text-info'>STRING</span><p>
Path to the file / folder to save the page. </p></li><li>tabIndex : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><span class='label '> Default: -1</span><p>
TabBar tab index. If no tab bar present, index is ignored. 
If tabbar index omitted then active WebView will be saved.</p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.WebView.save(<span class="text-info">STRING</span> format, <span class="text-info">STRING</span> path, <span class="text-info">INTEGER</span> tabIndex)</code> </li></ul></li></ul>

### setCookie(<span class="text-info">STRING</span> url, <span class="text-info">STRING</span> cookie)
When WebView loads the specified url (either by selecting link or from calling WebView.navigate), it will add this cookie to the HTTP request.Not implemented for Motorola Solutions' WebKit.

####Parameters
<ul><li>url : <span class='text-info'>STRING</span><p>
Set a cookie to be used by WebView for this url. </p></li><li>cookie : <span class='text-info'>STRING</span><p>
One or more name-value pairs of the format "NAME=VALUE". Separate multiple name-value pairs with a semicolon, such as "NAME1=VALUE1; NAME2=VALUE2". </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Ruby
* Android
* iOS
* Windows Desktop

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul></ul></li></ul>

### set_menu_items(<span class="text-info">HASH</span> menuItems)
Use Rho::Application.nativeMenu property: set native menu items.

####Parameters
<ul><li>menuItems : <span class='text-info'>HASH</span><p>
Map of menu items: name to action. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.WebView.set_menu_items(<span class="text-info">HASH</span> menuItems)</code> </li></ul></li></ul>

##Properties



###activeTab

####Type
<span class='text-info'>INTEGER</span> <span class='label'>Read Only</span>
####Description

Return an active tab index. For change active tab use Use Rho.NativeTabbar.currentTab property.
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>Rho.WebView.activeTab</code> </li></ul></li></ul>

###cacheSize

####Type
<span class='text-info'>INTEGER</span> <span class='label'>Read Only</span>
####Description

The browser cache size, in whole MBs. Defines in config.xml: Navigation\\Cache.
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>Rho.WebView.cacheSize</code> </li></ul></li></ul>

###enableCache

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description

Enable / disable Browser cache. Use 'WebView.enableCache' parameter in rhoconfig.txt to configure this value.
####Params
<p><strong>Default:</strong> true</p>
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>Rho.WebView.enableCache</code> </li></ul></li></ul>

###enablePageLoadingIndication

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description

Show page loading indication. On Windows Mobile/CE this property can be set only in config.xml: GUI\\HourglassEnabled. At Android  use 'disable_loading_indication' parameter in rhoconfig.txt to configure this value.
####Params
<p><strong>Default:</strong> true</p>
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>Rho.WebView.enablePageLoadingIndication</code> </li></ul></li></ul>

###enableWebPlugins

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description

Enable / disable web plug-ins. Use 'enable_web_plugins' parameter in rhoconfig.txt to configure this value. This option only has effect on Android versions before 4.0 (ICS). It mainly affects if Flash content is displayed.
####Params
<p><strong>Default:</strong> true</p>
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>Rho.WebView.enableWebPlugins</code> </li></ul></li></ul>

###enableZoom

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description

Enable WebView zoom. Use 'enable_screen_zoom' parameter in rhoconfig.txt to configure this value.
####Params
<p><strong>Default:</strong> true</p>
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>Rho.WebView.enableZoom</code> </li></ul></li></ul>

###fontFamily

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

Specifies the default font to use when rendering text in web pages. The specified font should be a TrueType font present on the device. On Windows the default font has been set to 'Tahoma' as this is present on all Motorola WM / CE devices, note that Tahoma has no italic or oblique variants. On the Enterprise Tablet the default is Droid Sans Fallback. The font specified must be stored in \Windows for Windows WM / CE devices, or /system/fonts for Enterprise Tablet. Defines in config.xml: HTMLStyles\\FontFamily 
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>Rho.WebView.fontFamily</code> </li></ul></li></ul>

###framework

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

Same as System.webViewFramework.
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>Rho.WebView.framework</code> </li></ul></li></ul>

###fullScreen

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

Use full screen mode.
####Params
<p><strong>Default:</strong> false</p>
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>Rho.WebView.fullScreen</code> </li></ul></li></ul>

###navigationTimeout

####Type
<span class='text-info'>INTEGER</span> 
####Description

Can be defined in config.xml: Navigation\\NavTimeout. Number of milliseconds(maximum is 45000) before the browser times out and navigates to the page specified in the badlink setting. If it is determined that the destination is unreachable regardless of wait time, the badlink may be loaded before NAVTIMEOUT. This is the time taken to establish communication with the server, not the time taken to fully load the page.
####Params
<p><strong>Default:</strong> 0</p>
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>Rho.WebView.navigationTimeout</code> </li></ul></li></ul>

###scrollTechnique

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

Specifies the technique used to scroll about the page.Defines in config.xml: Scrolling\\ScrollTechnique.
####Params
<p><strong>Default:</strong> FingerScroll</p>
####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: Rho.WebView.SCROLL_NONE 
	* String: None
	* 
No scrollbars will be displayed and the page will not respond to finger swipes.
* Constant: Rho.WebView.SCROLL_SCROLLBARS 
	* String: Scrollbars
	* 
When the size of the page is larger than the screen scrollbars will be presented which can be used to scroll the page.
* Constant: Rho.WebView.SCROLL_FINGER 
	* String: FingerScroll
	* 
You can scroll around the page using finger swiping.
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>Rho.WebView.scrollTechnique</code> </li></ul></li></ul>

###textZoomLevel

####Type
<span class='text-info'>INTEGER</span> 
####Description

Sets the font size to be displayed on the page, set to 0 for the smallest font and 4 for the largest font.
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>Rho.WebView.textZoomLevel</code> </li></ul></li></ul>

###userAgent

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

Defines in config.xml: Navigation\\UserAgent. When visiting a web server the WebKit browser will report its self as the specified user agent. Use the following substitution variables:
                    %p - platform name ("Windows CE " + version number)
                    %w - WebKit version number
                    %e - MotorolaWebKit version number.
                
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>Rho.WebView.userAgent</code> </li></ul></li></ul>

###viewportEnabled

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description

Whether to enable or disable viewport meta tag processing.Defines in config.xml: Navigation\\ViewportEnabled.
####Params
<p><strong>Default:</strong> true</p>
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>Rho.WebView.viewportEnabled</code> </li></ul></li></ul>

###viewportWidth

####Type
<span class='text-info'>INTEGER</span> <span class='label'>Read Only</span>
####Description

Default viewport width to use for pages that do not have a viewport meta tag (uses 1:1 scaling if not specified).Defines in config.xml: Navigation\\ViewportWidth.
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>Rho.WebView.viewportWidth</code> </li></ul></li></ul>

###zoomPage

####Type
<span class='text-info'>FLOAT</span> 
####Description

Sets the zoom factor of the page. Factor 1.0 is no zoom, values less than 1.0 are zoomed out and values greater than 1.0 are zoomed in.
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>Rho.WebView.zoomPage</code> </li></ul></li></ul>

##Examples



###Execute javascript

You can call the WebView and make it execute JavaScript code from a Ruby controller. This can be particularly helpful in order to reuse JavaScript functionality that is already included in your pages.

As an example, you can invoke JQuery Mobile's changePage.

You can also call your own functions.
<pre><code>

function greet(name) {
    alert("Hello, "+name);  
}

                            
</code></pre>

From the Ruby controller we can execute the JavaScript function that may be in the view.

###Use full-screen mode

The WebView can be set to use all the available screen real-estate by turning on "full-screen" mode.

This property can also be assigned to in JavaScript.
<pre><code>

// Fullscreen can also be invoked from JavaScript
Rho.WebView.fullScreen = true;

Rho.WebView.fullScreen = false;

                            
</code></pre>

###Navigate

This is the section that will appear before the code block.

You can also navigate outside of your application, to an external site.

This API is also available from JavaScript.
<pre><code>

//Navigate out of the local application and into an externally-served site
Rho.WebView.navigate("http://www.example.com");

                            
</code></pre>

###Navigate back

This is the section that will appear before the code block.

The same method is available in JavaScript.
<pre><code>

//Force WebView to navigate to the previous page using Browser back.
Rho.WebView.navigateBack();

                            
</code></pre>

###Refresh the page

Reload the current URL into the WebView. This is useful especially after having updated data that must be now shown to the user 

By default, "refresh" will update the current view. If you are using the native Tabbar and have multiple WebViews, you can specify which one to refresh.

Also available from JavaScript.
<pre><code>

// Reload the current page
Rho.WebView.refresh()

// Reload the page on WebView number 3
Rho.WebView.refresh(3)

                            
</code></pre>