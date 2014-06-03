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

### currentLocation()
Returns the relative url (location) of the current page(without server and port); the last URL loaded to WebView from Ruby controller action.

### currentURL()
Returns the actual URL in WebView. This works the same as the JavaScript window.location.href.

### executeJavascript()
Execute JavaScript on the current page from your controller.

### full_screen_mode()
Use WebView.fullScreen property: Switch to / from full screen mode.

### navigate()
Force WebView to navigate to a URL.

### navigateBack()
Force WebView to navigate to the previous page using Browser back.

### refresh()
Force WebView to refresh the current page.

### save()
Save current page to file system.

### setCookie()
When WebView loads the specified url (either by selecting link or from calling WebView.navigate), it will add this cookie to the HTTP request.Not implemented for Motorola Solutions' WebKit.

### set_menu_items()
Use Rho::Application.nativeMenu property: set native menu items.