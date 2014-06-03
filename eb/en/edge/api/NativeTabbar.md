#NativeTabbar


## Overview
<p>The NativeTabbar methods let you use multiple instances of the RhoMobile webview in separate tabs. On Android, iOS and WIndows Phone 8 the tabs are true Native Tabbar controls to give your application a native look and feel.</p>
<p>No more than 4 tabs can be created in the Windows Phone 8 tabbar. A tabbar separator doesn&rsquo;t exist in Windows Phone 8. On Windows Mobile/CE there are no visible tabs. At one time only Toolbar or Tabbar can present in application &ndash; Toolbar and Tabbar can not be used both in one time.</p>

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



### create()
Removes the current tabbar / toolbar and replaces it with this one. Callback will be called when tab is switched.

### currentTabIndex()
Returns the current tab 0-based index.

### remove()
Removes the current tabbar. Does nothing if there is no active tabbar.

### removeTab()
Removes the Tab by index. Method will remove the WebView for the specific tab, it will not remove the tab from the tab array, so all indexes will remain the same.You cannot delete the tab with useCurrentViewForTab flag.If you switch to previously removed tab, tab will be recreated.

### setTabBadge()
Set the iPhone badge to tab.

### switchTab()
Switch active tab.