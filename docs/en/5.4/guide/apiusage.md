# Migrating Your RhoMobile App to v5.4

RhoMobile Suite 5.x and higher offers a set of common APIs to access device, system and framework capabilities from your JavaScript and Ruby code. 


## RhoConnect Client
In RhoMobile Suite 5.4, the [RhoConnectClient API](../api/rhoconnectclient) is accessed through an extension. To use the RhoConnect Client, you must specify `rhoconnect-client` in the extensions section of your application's `build.yml` (as below). If you are using RhoConnect, you should also consult the [RhoConnect Migration Guide](../rhoconnect/migration) for details about migrating your RhoConnect application.

	:::ruby
	extensions: ["rhoconnect-client"]

## Android WebKit
RhoMobile Suite 5.4 uses the stock Android WebKit included with the Android SDK you're building with as the default. Version 5.x RhoElement APIs will work only with the stock WebKit. However, [pre-5.x RhoElement APIs](#using-22-apis) **must be used with the Zebra WebKit for Android**.

## Shared Runtime
RhoMobile Suite 2.0 included the RhoElements Shared Runtime, a pre-built RhoMobile application that provided application configuration options for the Zebra WebKit and RhoElements API extensions. This allowed HTML/JS applications to run without requiring the developer to build a separate a RhoMobile application. 

Since the RhoMobile suite 5.4 no longer includes a pre-built shared runtime, it is recommended that you build a simple RhoMobile application to point to your HTML application. This will allow you to optimize the application by including only the extensions and capabilities used by your application.

## JavaScript Licensing
RhoMobile Suite 5.4 increases the number of APIs with JavaScript access from prior versions. In addition, JavaScript licensing restrictions associated with some APIs and the Zebra WebKit are removed, and are now in sync with those of Ruby. Licensing restrictions are now at the API class level rather than the language level. For example, use of the Camera API is now free on JavaScript *and* Ruby. [Read more about licensing](licensing).

## API Platform Support
It is the intention for all APIs to work across all supported platforms. In RhoMobile Suite 2.2, support for platforms was indicated using an [API compatibility matrix](../../2.2.0/rhoelements/apicompatibility) at the API class level. Version 5.4 contains fewer exceptions, and the platforms that are supported will be indicated at the individual API property or method level. Please [refer to the API Summary](apisummary) for an overview.

## Replaced APIs
New APIs that have replaced those previously available will be highlighted in the menus and descriptions of the API reference documentation, as below: 

[System.applicationInstall API](../api/system#mapplicationInstall) <span class="label label-info">Replaces: app_install</span>. 

## Deprecated APIs
Deprecated APIs will be highlighted as such in menus and descriptions of the API reference documentation. While some deprecated APIs might remain functional, they will no longer be supported or enhanced, as below: 

[System.hasNetwork](../api/system#phasNetwork) <span class="label label-important">Deprecated</span>

The associated description will indicate alternative API(s).

## API Migration Table
The following is a summary of new APIs and how previous APIs relate to it.

<table class="table">
<thead>	
<tr>
<th>
Class
</th>
<th>
Description
</th>
<th>
<a href="/v/2.2/rhoelements/apicompatibility">Previous RhoMobile Suite 2.2 API</a>
</th>
</tr>
</thead>
<tbody>
<tr>
<td>
<a href="/api/Application">Application</a>
</td>
<td>
Interface with application level methods and properties
</td>
<td>
Rename of <a href="/v/2.2/rhodesapi/rhoapplication-api/">RhoApplication</a> and will also contain the MSI specific <a href="/v/2.2/rhoelements/application/">Application</a>
</td>
</tr>
<tr>
<td>
<a href="/api/barcode">Barcode</a>
</td>
<td>
Scan bar codes using device's camera, laser or 2d imager
</td>
<td>
<a href="/v/2.2/rhodesapi/barcode-api/">Barcode</a> and <a href="/v/2.2/rhoelements/scanner/">Scanner</a> have been amalgamated.  All decoders have now been brought into the same API rather than having a separate API for each.
</td>
</tr>
<tr>
<td>
<a href="/api/battery">Battery</a>
</td>
<td>
Displays a battery signal icon in a native window without requiring users to draw their own icon
</td>
<td>
Previously existed in 2.2 <a href="/v/2.2/rhoelements/battery">Battery</a> 
</td>
</tr>

<tr>
<td>
<a href="/api/cardreader">CardReader</a>
</td>
<td>
Interface for device's Mag Stripe Reader (MSR)
</td>
<td>
Previously existed in 2.2: <a href="/v/2.2/rhoelements/cardreader/">CardReader</a>
</td>
</tr>
<tr>
<td>
<a href="/api/Database">Database</a>
</td>
<td>
Accessing RhoMobile's built in database
</td>
<td>
Same as <a href="/v/2.2/rhodesapi/database-api/">Database</a> class in 2.2
</td>
</tr>
<tr>
<td>
<a href="/api/keycapture">KeyCapture</a>
</td>
<td>
Allows capturing hardware key events.
</td>
<td>
Previously existed in 2.2: <a href="/v/2.2/rhoelements/keycapture"> KeyCapture</a>
</td>
</tr>
<tr>
<td>
<a href="/api/keystate">KeyState</a>
</td>
<td>
Indicator of hardware key state (Shift, Caps, Alt).
</td>
<td>
Previously existed in 2.2: <a href="/v/2.2/rhoelements/keystate"> KeyState</a>

</td>
</tr>
<tr>
<td>
<a href="/api/Log">Log</a>
</td>
<td>
Interface for Rhomobile logging capabilities
</td>
<td>
Rename of <a href="/v/2.2/rhodesapi/rholog-api/">RhoLog</a> as well as combine log settings from RhoElement's Config.xml file
</td>
</tr>
<tr>
<td>
<a href="/api/mediaplayer">Mediaplayer</a>
</td>
<td>
Playback audio and ringtones.
</td>
<td>
Added functionality to <a href="/v/2.2/rhodesapi/ringtonemanager-api">RingtoneManager</a> class
</td>
</tr>
<tr>
<td>
<a href="/api/NativeMenubar">NativeMenubar</a>
</td>
<td>
Defining custom menus for your application.
</td>
<td>
Replaces <a href="/v/2.2/rhodesapi/menu-apis">@menu and @default_menu</a> api
</td>
</tr>
<tr>
<td>
<a href="/api/NativeTabbar">NativeTabbar</a>
</td>
<td>
Provides native UI tabs with multiple webview instances.
</td>
<td>
Similar to previous <a href="/v/2.2/rhodesapi/nativetabbar-api">NativeTabbar</a> class
</td>
</tr>
<tr>
<td>
<a href="/api/NativeToolbar">NativeToolbar</a>
</td>
<td>
Provides a native toolbar UI element.
</td>
<td>
Similar to previous <a href="/v/2.2/rhodesapi/nativetoolbar-api">NativeToolbar</a> class
</td>
</tr>
<tr>
<td>
<a href="/api/Navbar">Navbar</a>
</td>
<td>
Native navigation for iOS applications.
</td>
<td>
Similar to previous <a href="/v/2.2/rhodesapi/navigationbar-iphone-api">Navbar</a> class
</td>
</tr>
<tr>
<td>
<a href="/api/Network">Network</a>
</td>
<td>
See device's network status or make network connections
</td>
<td>
<a href="/v/2.2/rhodesapi/asynchttp-api/">AsyncHTTP</a> and <a href="/v/2.2/rhoelements/network/">Network</a> have been amalgamated
</td>
</tr>
<tr>
<td>
<a href="/api/Notification">Notification</a>
</td>
<td>
Provides visual, audio and tactile alerts to the user.
</td>
<td>
2.2 APIs: <a href="/v/2.2/rhodesapi/alert-api/">Alert</a> and <a href="/v/2.2/rhoelements/notification/">Notification</a> have been combined
</td>
</tr>
<tr>
<td>
<a href="/api/Orm">Orm</a> & <a href="/api/OrmModel">OrmModel</a>
</td>
<td>
Apis for user defined Data models
</td>
<td>
Previously Rhomobile Data Models were accessible only through the<a href="/v/2.2/rhodesapi/rhom-api/"> Rhom API via Ruby</a> 
</td>
</tr>
<tr>
<td>
<a href="/api/push">Push</a>
</td>
<td>
HTTP based push messaging 
</td>
<td>
RhoElemnents <a href="/v/2.2/rhoelements/push/">Push</a> API
</td>
</tr>
<tr>
<td>
<a href="/api/RhoConnectClient">RhoConnectClient</a>
</td>
<td>
Synchronization interface with RhoConnect server applications
</td>
<td>
Rename of <a href="/v/2.2/rhodesapi/syncengine-api/">SyncEngine</a>
</td>
</tr>
<tr>
<td>
<a href="/api/File">RhoFile</a>
</td>
<td>
Allows access to the device's file system.
</td>
<td>
Mostly the same as the previous <a href="/rhodesapi/file-api">File</a> class
</td>
</tr>
<tr>
<td>
<a href="/api/screenorientation">ScreenOrientation</a>
</td>
<td>
Allows control or detection of screen orientation behavior.
</td>
<td>
Uses 2.2 <a href="/v/2.2/rhoelements/screenorientation">ScreenOrientation</a> class and replaces <a href="/v/2.2/rhodesapi/system-api#setscreenrotationnotification">set_screen_rotation_notification</a>
</td>
</tr>
<tr>
<td>
<a href="/api/sensor">Sensor</a>
</td>
<td>
Allows direct access to device sensors like accelerometer, proximity, light, etc
</td>
<td>
Rename of  2.2 <a href="/v/2.2/rhoelements/RawSensors">RawSensors</a> class and adds additional functionality.
</td>
</tr>
<tr>
<td>
<a href="/api/signalIndicators">SignalIndicators</a>
</td>
<td>
Graphical indicator of WiFi strength
</td>
<td>
Previous 2.2 API: <a href="/v/2.2/rhoelements/signal">Signal</a> 
</td>
</tr>



<tr>
<td>
<a href="/api/system">System</a>
</td>
<td>
Control and modify core aspects of the device such as the screen, OS and device capabilities.
</td>
<td>
Amalgamation of <a href="/v/2.2/rhodesapi/system-api/">System</a> and <a href="/v/2.2/rhoelements/generic/">Generic</a>
</td>	
</tr>
<tr>
<td>
<a href="/api/webview">Webview</a>
</td>
<td>
Interface with application's Webview container
</td>
<td>
Same as <a href="/v/2.2/rhodesapi/webview-api/">Webview</a> class in 2.2. Also Contains text zoom and page zoom parameters previously found in the Zoom module.
</td>
</tr>
</tbody>
</table>

## Using 2.2 APIs
Below is a list of API classes available in RhoMobile Suite 2.2 and have not yet have been incorporated in the new Common API class set for RhoMobile Suite 5.4. These APIs are still available in the 2.2 format. The following API classes will be incorporated into furture versions of the RhoMobile Suite so as to supply a common API format for in both JavaScript and Ruby.

**NOTE: When using 2.2 APIs in RhoMobile 5.4, the [2.2 API compatibility matrix](../../2.2.0/rhoelements/apicompatibility) still applies.**

* [Mapview](../../2.2.0/rhodesapi/mapview-api)
* [Contacts](../../2.2.0/rhodesapi/rhocontact-api)
* Calendar
* System.Process
* [Registry](../../2.2.0/rhoelements/registry)
* [AudioCapture](../../2.2.0/rhoelements/AudioCapture)
* [Config](../../2.2.0/rhodesapi/rhoconfig-api)
* [GeoLocation](../../2.2.0/rhodesapi/geolocation-api)
* [Gesture](../../2.2.0/rhoelements/Gesture)
* Printing
* [Systemtime](../../2.2.0/rhoelements/systemTime)
* [Comm](../../2.2.0/rhoelements/comm)
* [Addressbar](../../2.2.0/rhoelements/addressbar)
* [Alarm](../../2.2.0/rhoelements/alarm)
* [Bluetooth](../../2.2.0/rhodesapi/bluetoothmanager-api)
* [NFC](../../2.2.0/rhodesapi/NFCManager-api)
* [Timer](../../2.2.0/rhodesapi/timer-api)
* [Backlight](../../2.2.0/rhoelements/backlight)
* [Keylight](../../2.2.0/rhoelements/Keylight)
* [Memory](../../2.2.0/rhoelements/memory)
* [Reboot](../../2.2.0/rhoelements/reboot)

### RhoElements 2.2 APIs
The 2.2 RhoElement APIs are supported on Zebra WebKit only. This WebKit is still available on Windows Mobile/CE and some Android platforms, but the default for 5.4 is the stock Android WebKit.

### Rhodes 2.2 APIs
2.2 Rhodes APIs that were not replaced by an equivalent RhoMobile 5.4 API (ex: Camera) are supported on all platforms that were supported previously. Ruby APIs will behave exactly as they did before. Note that some of the Rhodes 2.2 APIs provided JavaScript support, but used a different version of the RhoMobile JavaScript API library: `rho_javascript_api.js`. 

To generate this file, you must enable JavaScript by including `rho-javascript` in the extensions section of your `build.yml` file.

	:::yaml
	extensions: ["rho-javascript"]

To use the JavaScript API, **you must add the `public/js/rho_javascript_api.js` file to the .html, .erb, or .js file that's calling the JavaScript method**. This file is created at build time as part of the application package and can coexist with RhoMobile 5.4 the JavaScript API file `rhoapi-modules.js`. However, it has been altered from the version built using 2.2, and must be regenerated to allow it to properly coexist with other files of your 5.4 app.


### JavaScript ORM
If you're using the JavaScript ORM API, include this line in any files that will be calling it:

	:::html
	<script type="text/javascript" charset="utf-8" src="/public/api/rhoapi-modules-ORM.js"></script>

## Backward Compatibility

### RhoElements Meta Tags
Meta tags that are specific to RhoElements should continue to function in a RhoMobile 5.4 application, as long as its `build.yml` contains the following:

	:::yaml
	app_type: 'rhoelements'
	capabilities: 'motorola_browser'

However, the use of Meta tags is a deprecated feature and will not be supported in future versions of RhoMobile. It is recommended that all Meta tags be converted to use the associated JavaScript capability using the new common API classes.

Deprecated format: 
	:::html
	<META HTTP-Equiv="scanner" Content="Enable">

Use instead:
	:::javascript
	Rho.Barcode.enable();

### RhoElements JavaScript APIs
JavaScript APIs that are specific to RhoElements should continue to function in a RhoMobile 5.4 application, as long as its `build.yml` contains the following:

	:::yaml
	app_type: 'rhoelements'
	capabilities: 'motorola_browser'

It is recommended that JavaScript API calls be converted to use the associated JavaScript capability using the new common API classes.

Old format:
	:::JavaScript
	scanner.enable()  // should still work

New format: 
	Rho.Barcode.enable() // the current 5.4 equivalent

### Parameter ordering
In a few rare cases, an API in version 2.2 has the same naming as in 5.4, but the ordering of parameters may have changed. For example:

	:::ruby
	# In RhoMobile 2.2 Params are callback, paramHash
	# This will fail in a 5.4 application
	Rho::Barcode.enable(url_for(:action => :barcode_callback), {:camera => 'front'})

	# In RhoMobile 5.4 Params are now paramHash, callback
	Rho::Barcode.enable( {:camera => 'front'},url_for(:action => :barcode_callback))

In all new 5.4 API classes, callbacks are now specified as the last parameter.

**NOTE: The benefit of converting these APIs to the current 5.4 methods includes support for additional combinations of supported operating systems and platforms. There also are several [new ways of accessing](api_js) these APIs through instance objects and special common methods that were not implemented previously.**

### API behavior on Page change
In version 2.2, some APIs by default will reset the device they control when navigating between app pages. In 5.4, the devices are not reset between page navigations, but is left in the previous state. Therefore, it will be up to the application to control behavior on page load. 

For example, if a 2.2 application activates the barcode scanner on Page1 with a callbackhandler, navigating to a page with no scanner will disable it. Depending on the desired behavior, an equivalent 5.4 app must handle the setting or disabling of the scanner on page load.

## Removed APIs
The following APIs are no longer included in the RhoMobile Suite:

* [DateTimePicker](../rhodesapi/datetimepicker-api) - There are many HTML5 options available for this
* [Airbeam](../rhoelements/airbeam) - Can be controlled via [System.runApplication](../api/system#mrunApplication)
* [BottomCommandArea](../rhoelements/bottomcommandarea) & [TopCommandArea](../rhoelements/topcommandarea) - RhoElements-specific APIs used for debugging
* [History](../rhoelements/historyback2) - Better JavaScript methods exist
* [ODAX](../rhoelements/odax) - Better HTML5 methods exist
* [Zoom](../rhoelements/zoom) - Incorporated into the [WebView API](../api/webview)