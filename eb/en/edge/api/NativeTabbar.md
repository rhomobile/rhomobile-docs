#NativeTabbar


## Overview
The NativeTabbar methods let you use multiple instances of the RhoMobile webview in separate tabs. On Android, iOS and WIndows Phone 8 the tabs are true Native Tabbar controls to give your application a native look and feel.
## Enabling the API
In order to use this API you must TBD INSERT Eb specific instructions here

        


##Methods



### create(<span class="text-info">ARRAY</span> tabElements, <span class="text-info">HASH</span> tabBarProperties)
Removes the current tabbar / toolbar and replaces it with this one. Callback will be called when tab is switched.  Whilst the actual number of tabs you can create will depend on the memory available on your device there is an absolute upper limit of 30 tabs in any one application.

####Parameters
<ul><li>tabElements : <span class='text-info'>ARRAY</span><p>
Array of Tab elements. </p></li><ul><li>tabElement : <span class='text-info'>HASH</span><p>
Properties of Tab elements. </p></li><ul><li>label : <span class='text-info'>STRING</span><p>
Visible label to display on the tabbar. </p></li><li>action : <span class='text-info'>STRING</span><p>
URL to page which will be loaded into tab. Predefined actions are not supported. It may be path to Ruby controller action; i.e. '/app/Account' would load the Account index action. For ruby callback use 'callback:/app/Account' Or javascript method to call: 'javascript: methodOnTab();'. Or path to html page to load. </p></li><li>icon : <span class='text-info'>STRING</span><p>
Relative path to tabbar item icon in your rhodes app; typically located in /public/images/. Platforms:
Win32, Android, iOS, WP8 </p></li><li>reload : <span class='text-info'>BOOLEAN</span><span class='label '> Default: false</span><p>
When tab is activated  - page in tab will be reloaded. </p></li><li>selectedColor : <span class='text-info'>INTEGER</span><p>
Change the selected color of this tab. On Android this works only if you setup selectedColor for all tabs and also setup backgroundColor for the whole Tabbar. Platforms:
Win32, Android, iOS, WP8 </p></li><li>disabled : <span class='text-info'>BOOLEAN</span><span class='label '> Default: false</span><p>
Tab will be displayed as disabled. Platforms:
Win32, Android, iOS, WP8 </p></li><li>backgroundColor : <span class='text-info'>INTEGER</span><p>
 Background color for tab. Use when your application background color is not white for removing blink during switch tabs. Platforms:
Win32, Android, iOS, WP8 </p></li><li>useCurrentViewForTab : <span class='text-info'>BOOLEAN</span><span class='label '> Default: false</span><p>
Gives a smooth transfer to a newly opened tab from the current view into this Tab and make this Tab active. Only one Tab can have this parameter. Platforms:
WM, Win32, Android, iOS </p></li><li>perishable : <span class='text-info'>BOOLEAN</span><span class='label '> Default: false</span><p>
Sets whether this tab is allowed to be destroyed when a memory limit is reached (Windows Mobile) Platforms:
WM </p></li><li>createOnInit : <span class='text-info'>BOOLEAN</span><span class='label '> Default: false</span><p>
Create tab immediately when TabBar is created. Action also will be executed. If false, the tab will be created when it is switched to. Platforms:
WM </p></li></ul></ul><li>tabBarProperties : <span class='text-info'>HASH</span><p>
Properties of TabBar. </p></li><ul><li>verticalOrientation : <span class='text-info'>BOOLEAN</span><span class='label '> Default: false</span><p>
Creates a vertical tabbar on the iPad. Platforms:
iOS </p></li><li>backgroundColor : <span class='text-info'>INTEGER</span><p>
Background color of the tabbar. Platforms:
Win32, Android, iOS, WP8 </p></li><li>hiddenTabs : <span class='text-info'>BOOLEAN</span><span class='label '> Default: true</span><p>
Do not display Tabs with labels.Only hiddenTab=true is currently supported. Platforms:
WM </p></li><li>createOnInit : <span class='text-info'>BOOLEAN</span><span class='label '> Default: false</span><p>
Create tabs immediately when TabBar is created. Action also will be executed. If false, then each tab will be created when first switch to the tab is executed. Platforms:
WM </p></li><li>placeTabsBottom : <span class='text-info'>BOOLEAN</span><p>
Place TabBar to bottom instead of default top - only for Android. Platforms:
Android </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>tab_index : <span class='text-info'>INTEGER</span><p>
New tab index. </p></li><li>newTabIndex : <span class='text-info'>INTEGER</span><p>
New tab index. Platforms:
WM </p></li><li>oldTabIndex : <span class='text-info'>INTEGER</span><p>
New tab index. If you switched to first activated tab, when oldTabIndex will be -1, which means that there was no old tab index exists. Platforms:
WM </p></li><li>tabEvent : <span class='text-info'>STRING</span><p>
{} Platforms:
WM </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>onTabFocus</dt><dd>
Fires when a tab gains focus.</dd><dt>onTabNewError</dt><dd>
Fires when a new tab cannot be created.</dd></dl></li></ul></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.NativeTabbar.create(<span class="text-info">ARRAY</span> tabElements, <span class="text-info">HASH</span> tabBarProperties)</code> </li></ul></li></ul>

### currentTabIndex()
Returns the current tab 0-based index.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>INTEGER</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.NativeTabbar.currentTabIndex()</code> </li></ul></li></ul>

### remove()
Removes the current tabbar. Does nothing if there is no active tabbar.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.NativeTabbar.remove()</code> </li></ul></li></ul>

### removeTab(<span class="text-info">INTEGER</span> tabIndex)
Removes the Tab by index. Method will remove the WebView for the specific tab, it will not remove the tab from the tab array, so all indexes will remain the same.You cannot delete the tab with useCurrentViewForTab flag.If you switch to previously removed tab, tab will be recreated.

####Parameters
<ul><li>tabIndex : <span class='text-info'>INTEGER</span><p>
The index for tab (index numbered from 0) to delete. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.NativeTabbar.removeTab(<span class="text-info">INTEGER</span> tabIndex)</code> </li></ul></li></ul>

### setTabBadge(<span class="text-info">INTEGER</span> tabIndex, <span class="text-info">STRING</span> badge)
Set the iPhone badge to tab.

####Parameters
<ul><li>tabIndex : <span class='text-info'>INTEGER</span><p>
The index for this tab (index numbered from 0). You can also set -1 to select current tab for set badge. </p></li><li>badge : <span class='text-info'>STRING</span><p>
String for iPhone badge, such as '12'. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.NativeTabbar.setTabBadge(<span class="text-info">INTEGER</span> tabIndex, <span class="text-info">STRING</span> badge)</code> </li></ul></li></ul>

### switchTab(<span class="text-info">INTEGER</span> tabIndex)
Switch active tab.

####Parameters
<ul><li>tabIndex : <span class='text-info'>INTEGER</span><p>
The index for this tab (index numbered from 0). </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.NativeTabbar.switchTab(<span class="text-info">INTEGER</span> tabIndex)</code> </li></ul></li></ul>