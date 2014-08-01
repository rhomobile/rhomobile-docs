#NativeTabbar


## Overview
The NativeTabbar methods let you use multiple instances of the RhoMobile webview in separate tabs. On Android, the tabs are true Native Tabbar controls to give your application a native look and feel. On Windows Mobile/CE there are no visible tabs, but can be used in conjunction with shortcuts to run multiple 'applications' from a single instance. At one time only Toolbar or Tabbar can present in application - Toolbar and Tabbar can not be used both in one time. 
## Enabling the API
In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* ebapi-modules.js - this file contains all available Enterprise Browser APIs

If you wish to minimize the amount of JavaScript being included, you can choose to only include the individual API that your application is using:

ex:

* ebapi.js - core APIs needed 
* eb.nativetabbar.js - just the NativeTabBar API
* other individual JavaScript files included with the Enterprise Browser installation


        


##Methods



### create(<span class="text-info">ARRAY</span> tabElements, <span class="text-info">HASH</span> tabBarProperties)
<p>Removes the current tabbar / toolbar and replaces it with this one. Callback will be called when tab is switched.  Whilst the actual number of tabs you can create will depend on the memory available on your device there is an absolute upper limit of 30 tabs in any one application.</p>


####Parameters
<ul><li>tabElements : <span class='text-info'>ARRAY</span><p>
<p>Array of Tab elements.</p>
 </p></li><ul><li>tabElement : <span class='text-info'>HASH</span><p>
<p>Properties of Tab elements.</p>
 </p></li><ul><li>label : <span class='text-info'>STRING</span><p>
<p>Visible label to display on the tabbar.</p>
 </p></li><li>action : <span class='text-info'>STRING</span><p>
<p>URL to page which will be loaded into tab. It may be JavaScript method to call: &lsquo;javascript: methodOnTab();&rsquo;. Or path to html page to load.</p>
 </p></li><li>icon : <span class='text-info'>STRING</span><p>
<p>Icon Relative path (from Enterprise Browser application) to local files on the device.</p>
 Platforms:
Win32, Android, iOS, WP8 </p></li><li>reload : <span class='text-info'>BOOLEAN</span><span class='label '> Default: false</span><p>
<p>When tab is activated  &ndash; page in tab will be reloaded.</p>
 </p></li><li>selectedColor : <span class='text-info'>INTEGER</span><p>
<p>Change the selected color of this tab. On Android this works only if you setup selectedColor for all tabs and also setup backgroundColor for the whole Tabbar.</p>
 Platforms:
Win32, Android, iOS, WP8 </p></li><li>disabled : <span class='text-info'>BOOLEAN</span><span class='label '> Default: false</span><p>
<p>Tab will be displayed as disabled.</p>
 Platforms:
Win32, Android, iOS, WP8 </p></li><li>backgroundColor : <span class='text-info'>INTEGER</span><p>
<p> Background color for tab. Use when your application background color is not white for removing blink during switch tabs.</p>
 Platforms:
Win32, Android, iOS, WP8 </p></li><li>useCurrentViewForTab : <span class='text-info'>BOOLEAN</span><span class='label '> Default: false</span><p>
<p>Gives a smooth transfer to a newly opened tab from the current view into this Tab and make this Tab active. Only one Tab can have this parameter.</p>
 Platforms:
WM, Win32, Android, iOS </p></li><li>perishable : <span class='text-info'>BOOLEAN</span><span class='label '> Default: false</span><p>
<p>Sets whether this tab is allowed to be destroyed when a memory limit is reached (Windows Mobile)</p>
 Platforms:
WM </p></li><li>createOnInit : <span class='text-info'>BOOLEAN</span><span class='label '> Default: false</span><p>
<p>Create tab immediately when TabBar is created. Action also will be executed. If false, the tab will be created when it is switched to.</p>
 Platforms:
WM </p></li></ul></ul><li>tabBarProperties : <span class='text-info'>HASH</span><p>
<p>Properties of TabBar.</p>
 </p></li><ul><li>verticalOrientation : <span class='text-info'>BOOLEAN</span><span class='label '> Default: false</span><p>
<p>Creates a vertical tabbar on the iPad.</p>
 Platforms:
iOS </p></li><li>backgroundColor : <span class='text-info'>INTEGER</span><p>
<p>Background color of the tabbar.</p>
 Platforms:
Win32, Android, iOS, WP8 </p></li><li>hiddenTabs : <span class='text-info'>BOOLEAN</span><span class='label '> Default: true</span><p>
<p>Do not display Tabs with labels.Only hiddenTab=true is currently supported.</p>
 Platforms:
WM </p></li><li>createOnInit : <span class='text-info'>BOOLEAN</span><span class='label '> Default: false</span><p>
<p>Create tabs immediately when TabBar is created. Action also will be executed. If false, then each tab will be created when first switch to the tab is executed.</p>
 Platforms:
WM </p></li><li>placeTabsBottom : <span class='text-info'>BOOLEAN</span><p>
<p>Place TabBar to bottom instead of default top &ndash; only for Android.</p>
 Platforms:
Android </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>tab_index : <span class='text-info'>INTEGER</span><p>
<p>New tab index.</p>
 </p></li><li>newTabIndex : <span class='text-info'>INTEGER</span><p>
<p>New tab index.</p>
 Platforms:
WM </p></li><li>oldTabIndex : <span class='text-info'>INTEGER</span><p>
<p>New tab index. If you switched to first activated tab, when oldTabIndex will be -1, which means that there was no old tab index exists.</p>
 Platforms:
WM </p></li><li>tabEvent : <span class='text-info'>STRING</span><p>
<p>{}</p>
 Platforms:
WM </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>onTabFocus</dt><dd>
<p>Fires when a tab gains focus.</p>
</dd><dt>onTabNewError</dt><dd>
<p>Fires when a new tab cannot be created.</p>
</dd></dl></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.NativeTabbar.create(<span class="text-info">ARRAY</span> tabElements, <span class="text-info">HASH</span> tabBarProperties)</code> 


### currentTabIndex()
<p>Returns the current tab 0-based index.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></p><ul></ul>

####Returns
Synchronous Return:

* INTEGER

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.NativeTabbar.currentTabIndex()</code> 


### remove()
<p>Removes the current tabbar. Does nothing if there is no active tabbar.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.NativeTabbar.remove()</code> 


### removeTab(<span class="text-info">INTEGER</span> tabIndex)
<p>Removes the Tab by index. Method will remove the WebView for the specific tab, it will not remove the tab from the tab array, so all indexes will remain the same.You cannot delete the tab with useCurrentViewForTab flag.If you switch to previously removed tab, tab will be recreated.</p>


####Parameters
<ul><li>tabIndex : <span class='text-info'>INTEGER</span><p>
<p>The index for tab (index numbered from 0) to delete.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.NativeTabbar.removeTab(<span class="text-info">INTEGER</span> tabIndex)</code> 


### setTabBadge(<span class="text-info">INTEGER</span> tabIndex, <span class="text-info">STRING</span> badge)
<p>Set the iPhone badge to tab.</p>


####Parameters
<ul><li>tabIndex : <span class='text-info'>INTEGER</span><p>
<p>The index for this tab (index numbered from 0). You can also set -1 to select current tab for set badge.</p>
 </p></li><li>badge : <span class='text-info'>STRING</span><p>
<p>String for iPhone badge, such as &lsquo;12&rsquo;.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.NativeTabbar.setTabBadge(<span class="text-info">INTEGER</span> tabIndex, <span class="text-info">STRING</span> badge)</code> 


### switchTab(<span class="text-info">INTEGER</span> tabIndex)
<p>Switch active tab.</p>


####Parameters
<ul><li>tabIndex : <span class='text-info'>INTEGER</span><p>
<p>The index for this tab (index numbered from 0).</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.NativeTabbar.switchTab(<span class="text-info">INTEGER</span> tabIndex)</code> 
