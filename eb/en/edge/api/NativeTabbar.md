#NativeTabbar


## Overview
The NativeTabbar methods let you use multiple instances of the RhoMobile webview in separate tabs. On Android, the tabs are true Native Tabbar controls to give your application a native look and feel. On Windows Mobile/CE there are no visible tabs, but can be used in conjunction with shortcuts to run multiple 'applications' from a single instance. At one time only Toolbar or Tabbar can present in application - Toolbar and Tabbar can not be used both in one time. 
## Enabling the API
There are two methods of enabling the NativeTabbar API: 

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
To include single APIs, you must first include the `ebapi.js` in your HTML as well as the API file you want to use. For instance, to use the NativeTabbar API, I would add the following code to my HTML file(s), assuming the API files have been copied to the same directory as the HTML.

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi.js"></script>
    <script type="text/javascript" charset="utf-8" src="eb.nativetabbar.js"></script>

The ebapi.js file is necessary for all single API inclusions.


        


##Methods



### create(<span class="text-info">ARRAY</span> tabElements, <span class="text-info">HASH</span> tabBarProperties)
Removes the current tabbar / toolbar and replaces it with this one. Callback will be called when tab is switched.  Whilst the actual number of tabs you can create will depend on the memory available on your device there is an absolute upper limit of 30 tabs in any one application.

####Parameters
<ul><li>tabElements : <span class='text-info'>ARRAY</span><p>Array of Tab elements. </p></li><ul><li>tabElement : <span class='text-info'>HASH</span><p>Properties of Tab elements. </p></li><ul><li>label : <span class='text-info'>STRING</span><p>Visible label to display on the tabbar. </p></li><li>action : <span class='text-info'>STRING</span><p>URL to page which will be loaded into tab. It may be JavaScript method to call: 'javascript: methodOnTab();'. Or path to html page to load. </p></li><li>icon : <span class='text-info'>STRING</span><p>Icon Relative path (from Enterprise Browser application) to local files on the device.  Platforms:
Win32, Android </p></li><li>reload : <span class='text-info'>BOOLEAN</span><span class='label '> Default: false</span><p>When tab is activated  - page in tab will be reloaded. </p></li><li>selectedColor : <span class='text-info'>INTEGER</span><p>Change the selected color of this tab. On Android this works only if you setup selectedColor for all tabs and also setup backgroundColor for the whole Tabbar. Platforms:
Win32, Android </p></li><li>disabled : <span class='text-info'>BOOLEAN</span><span class='label '> Default: false</span><p>Tab will be displayed as disabled. Platforms:
Win32, Android </p></li><li>backgroundColor : <span class='text-info'>INTEGER</span><p> Background color for tab. Use when your application background color is not white for removing blink during switch tabs. Platforms:
Win32, Android </p></li><li>useCurrentViewForTab : <span class='text-info'>BOOLEAN</span><span class='label '> Default: false</span><p>Gives a smooth transfer to a newly opened tab from the current view into this Tab and make this Tab active. Only one Tab can have this parameter. Platforms:
WM, CE, Win32, Android </p></li><li>perishable : <span class='text-info'>BOOLEAN</span><span class='label '> Default: false</span><p>Sets whether this tab is allowed to be destroyed when a memory limit is reached (Windows Mobile) Platforms:
WM </p></li><li>createOnInit : <span class='text-info'>BOOLEAN</span><span class='label '> Default: false</span><p>Create tab immediately when TabBar is created. Action also will be executed. If false, the tab will be created when it is switched to. Platforms:
WM </p></li></ul></ul><li>tabBarProperties : <span class='text-info'>HASH</span><p>Properties of TabBar. </p></li><ul><li>backgroundColor : <span class='text-info'>INTEGER</span><p>Background color of the tabbar. Platforms:
Win32, Android </p></li><li>hiddenTabs : <span class='text-info'>BOOLEAN</span><span class='label '> Default: true</span><p>Do not display Tabs with labels.Only hiddenTab=true is currently supported. Platforms:
WM </p></li><li>createOnInit : <span class='text-info'>BOOLEAN</span><span class='label '> Default: false</span><p>Create tabs immediately when TabBar is created. Action also will be executed. If false, then each tab will be created when first switch to the tab is executed. Platforms:
WM </p></li><li>placeTabsBottom : <span class='text-info'>BOOLEAN</span><p>Place TabBar to bottom instead of default top - only for Android. Platforms:
Android </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>tab_index : <span class='text-info'>INTEGER</span><p>New tab index. </p></li><li>newTabIndex : <span class='text-info'>INTEGER</span><p>New tab index. Platforms:
WM </p></li><li>oldTabIndex : <span class='text-info'>INTEGER</span><p>New tab index. If you switched to first activated tab, when oldTabIndex will be -1, which means that there was no old tab index exists. Platforms:
WM </p></li><li>tabEvent : <span class='text-info'>STRING</span><p> Platforms:
WM </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>onTabFocus</dt><dd>Fires when a tab gains focus.</dd><dt>onTabNewError</dt><dd>Fires when a new tab cannot be created.</dd></dl></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.NativeTabbar.create(<span class="text-info">ARRAY</span> tabElements, <span class="text-info">HASH</span> tabBarProperties)</code> 


### currentTabIndex()
Returns the current tab 0-based index.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></p><ul></ul>

####Returns
Synchronous Return:

* INTEGER

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.NativeTabbar.currentTabIndex()</code> 


### remove()
Removes the current tabbar. Does nothing if there is no active tabbar.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.NativeTabbar.remove()</code> 


### removeTab(<span class="text-info">INTEGER</span> tabIndex)
Removes the Tab by index. Method will remove the WebView for the specific tab, it will not remove the tab from the tab array, so all indexes will remain the same.You cannot delete the tab with useCurrentViewForTab flag.If you switch to previously removed tab, tab will be recreated.

####Parameters
<ul><li>tabIndex : <span class='text-info'>INTEGER</span><p>The index for tab (index numbered from 0) to delete. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.NativeTabbar.removeTab(<span class="text-info">INTEGER</span> tabIndex)</code> 


### switchTab(<span class="text-info">INTEGER</span> tabIndex)
Switch active tab.

####Parameters
<ul><li>tabIndex : <span class='text-info'>INTEGER</span><p>The index for this tab (index numbered from 0). </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.NativeTabbar.switchTab(<span class="text-info">INTEGER</span> tabIndex)</code> 
