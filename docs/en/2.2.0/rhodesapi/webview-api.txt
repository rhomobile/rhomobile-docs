# WebView API

Call on the WebView directly from your controller.

Refer to [Rhodes Application User Interface](..//rhodes/ui) for a general discussion of the Rhodes application user interface.

WebView does not support opening internet URLs required authentification. Use the [AsyncHTTP/AsyncHTTPS API](asynchttp-api) for access to URL required authentification.

## refresh

Force WebView to refresh the current page.

	:::ruby
	WebView.refresh
	WebView.refresh(index)

<table border="1">
<tr>
	<td><code>index</code></td>
	<td>(optional) Force the WebView to refresh the page on the tab with the specified index. If no tab bar present, index is ignored.</td>
</tr>
</table>

## navigate

Force WebView to navigate to a URL.

	:::ruby
	WebView.navigate(url, index)

**NOTE: White page flickering during transition may happen if a controller action method doesn't return any rendered value, but instead performs a WebView.navigate(someUrl) call. It is important to avoid using WebView.navigate in action methods because WebView.navigate is intended to be used in callback methods asynchronously.**

<table border="1">
<tr>
	<td><code>url</code></td>
	<td>Navigate to this url.</td>
</tr>
<tr>
	<td><code>index</code></td>
	<td>(optional) Force the WebView to navigate using the page on the tab with the specified index. If no tab bar present, index is ignored.</td>
</tr>
</table>

## navigate_back

Force WebView to navigate to the previous page using Browser back.

	:::ruby
	WebView.navigate_back

## current_location

Returns the url (location) of the current page; the last URL loaded to WebView by Rhodes.

**NOTE: f you open your page in WebView, and after it makes a few jumps by linking (for example, to outside web adresses for example), `current_location` will still return the initial url opened in WebView. Also, if you use QJMobile, `current_location` has the initial URL, but does not reflect the actual window.location containing the JQMobile additional address by adding #, etc. See get_current_url.**

	:::ruby
	WebView.current_location
	WebView.current_location(index)

<table border="1">
<tr>
	<td><code>index</code></td>
	<td>(optional) Return the url for the page on the tab with the specified index. If no tab bar present, index is ignored.</td>
</tr>
</table>

## execute_js

Execute JavaScript on the current page from your controller. Supported on iPhone, Android, Windows Mobile and Blackberry 5.0 in full browser mode.

	:::ruby
	WebView.execute_js(string)

**NOTE: For most mobile platforms, WebView.execute_js has been implemented via redirection to URL with 'javascript:' schema. If WebView.execute_js used in an AJAX call handler method in the controller, it may lead to the situation where the *success* JavaScript handler will never be executed. This may happen because, at the moment of *success* handler should be executed, a URL of the page already has been changed. This means no handlers from the previous page are valid.**

Refer to [Control WebView from controller actions](..//rhodes/ui#control-webview-from-controller-actions) for an example.

<table border="1">
<tr>
	<td><code>string</code></td>
	<td>The call to the JavaScript method on the current page, such as "test();".</td>
</tr>
</table>

## active_tab

Returns an index of @tab array for the currently selected tab.

	:::ruby
	WebView.active_tab

## full_screen_mode

Switch to/from full screen mode.

	:::ruby
	WebView.full_screen_mode(enable)

<table border="1">
<tr>
	<td><code>enable</code></td>
	<td>1- enable full screen mode. 0 - disable full screen mode.</td>
</tr>
</table>

## set_cookie

When WebView loads the specified url (either by selecting link or from calling WebView.navigate), it will add this cookie to the HTTP request.

	:::ruby
	WebView.set_cookie(url, cookie)

<table border="1">
<tr>
	<td><code>url</code></td>
	<td>Set a cookie to be used by WebView for this url.</td>
</tr>
<tr>
	<td><code>cookie</code></td>
	<td>One or more name/value pairs of the format "NAME=VALUE". Separate multiple name/value pairs with a semicolon, such as "NAME1=VALUE1; NAME2=VALUE2”.</td>
</tr>
</table>

## get_current_url

Returns the actual URL in WebView. This works the same as the JavaScript `window.location.href`.

	:::ruby
	WebView.get_current_url()




