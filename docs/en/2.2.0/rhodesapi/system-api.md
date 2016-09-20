# System API

Provides access to system information. 

For code examples, see [Rhodes System API Samples view file](https://github.com/rhomobile/rhodes-system-api-samples/blob/master/app/layout.erb) and [Rhodes System API Samples System Test](https://github.com/rhomobile/rhodes-system-api-samples/blob/master/app/SystemTest/controller.rb).

## Using JavaScript API

You can call some of the System methods from JavaScript as well as Ruby. To use the JavaScript API, add the `public/js/rho_javascript_api.js` file -- created at build time as part of the application package -- to the .html, .erb, or .js file calling the JavaScript method.

The JavaScript API methods with a return value can pass it as a parameter in jQuery-compatible continuation (deferred object, a kind of callback). Possible continuations to handle are done, fail, and complete.

	Rho.Class.method(params).done(function(handler) { /* handler... */ })

You must enable JavaScript by putting `rho-javascript` into extensions in your build.yml.

	:::yaml
	extensions: ["rho-javascript"]

You must have a [RhoElements license](../rhoelements/licensing) to use the JavaScript API.

## get_property

Get the value of a system property.

Ruby syntax:

	:::ruby
	System.get_property(system_property)

JavaScript syntax:

	Rho.System.get_property(system_property)

system_property can be any of the properties below:

* platform - APPLE, Blackberry, WINDOWS, ANDROID, WINDOWS_DESKTOP, SYMBIAN
* has_camera - is camera available on the device
* screen_width - screen width in logical pixels (used for set coordinates)
* screen_height - screen height in logical pixels (used for set coordinates)
* real_screen_width - screen width in real pixels
* real_screen_height - screen height in real pixels
* screen_orientation - screen orientation 'portrait', 'landscape'
* ppi_x - horizontal PPI (Pixels Per Inch)
* ppi_y - vertical PPI (Pixels Per Inch)
* has_network - is device connected to the network
* has_cell_network - is device connected to the cell network
* has_wifi_network - is device connected to the wifi network
* device_owner_email - primary email of phone owner (works only on Android)
* device_owner_device_owner_name - name(account name) of phone owner (works only on Android)
* device_id - returns device ID which may be used to receive push messages. This is not phone device id, this is PUSH device id - you should register your phone for PUSH before you get this parameter. Read [Push Notification documentation](../rhoconnect/push) about it. On iPhone, it may be empty right after application started while Rhodes registers to receive PUSH notifications; you should wait till it become non-empty.
* phone_id - returns hardware based id. It depends on capabilities configured for an application and has to remain same even across application uninstall/install.
* full_browser -  is full browser in the WebView control on Blackberry (see [Blackberry browser support in device capabilities](../rhodes/device-caps#blackberry-browser-support) for more details)
* device_name - name of device application running on. Examples: '9000' (BB), 'iPhone', 'dream' (Android)
* os_version - version of OS of device. Examples: '4.6.0.192' (BB), '3.0' (iPhone), '1.6' (Android)
* locale - current language like 'en', 'ru' etc.
* country - country abbreviation
* is_emulator - return true if application is running on emulator
* has_calendar - return true if calendar support is available. By default, Calender db is empty. Please ensuer that you have configured and synced your Email/Calendar prior to this.
* is_motorola_device – return true if device supports Zebra device capabilities, such as Scanner, etc.

## app_install

Install an application.

	:::ruby
	System.app_install(url)

<table border="1">
<tr>
	<td><code>url</code></td>
	<td>The url of an application to install on the device.</td>
</tr>
</table>

## app_installed?

Returns true if the specified application is installed on the device. See [System.run_app](#runapp) for `appname` information.

	:::ruby
	System.app_installed?(appname)

<table border="1">
<tr>
	<td><code>url</code></td>
	<td>The name of the application.</td>
</tr>
</table>

## app_uninstall

Uninstall an application. See [System.run_app](#runapp) for `appname` information.

	:::ruby
	System.app_uninstall(appname)

<table border="1">
<tr>
	<td><code>url</code></td>
	<td>The name of the application to uninstall.</td>
</tr>
</table>

## exit

Exit the application.

	:::ruby
	System.exit

## get_start_params

Return the command line parameters as a string (iPhone only). Resetting when the application goes to background. If your URLBundle is "myapp" and you open application by url: "myapp:/app/page1", then start params will be "/app/page1".

	:::ruby
	System.get_start_params()

## open_url

Open the application associated with the URL. Used to prepare for printing.

Ruby syntax:

	:::ruby
	System.open_url(url)

JavaScript syntax:

	Rho.System.open_url(url)

<table border="1">
<tr>
	<td><code>url</code></td>
	<td>String. Open the application at this url; behavior may be different on different platforms and depend on installed software.</td>
</tr>
</table>

Note: On iPhone, if you post path of local file, then the specific iOS control (UIDocumentInteractionController) where the file will previewed and user will be able to open this file by selected application which supported this filetype.

## run_app

Run an application.

	:::ruby
	System.run_app(appname, params)

<table border="1">
<tr>
	<td><code>appname</code></td>
	<td>The name of the application on the device to run, such as com.android.music.</td>
</tr>
<tr>
	<td><code>params</code></td>
	<td>String. List of parameters for the application; nil if no parameters.</td>
</tr>
</table>

iPhone: `appname` is the same with registered application URL scheme. `params` is string. Example: 

	:::ruby
    System.run_app('myapp', 'someparams'). 
        
  This call is the same as: 
  
	:::ruby
    System.open_url('myapp:someparams')
    
Android: `appname` is package name: `com.<vendor>.<app_name>`. For example:

	:::ruby
    System.run_app('com.rhomobile.store', 'someparams')

Windows Mobile, Windows CE: `appname` is path in registry: `<vendor> <app_name>/<app_name>.exe`. For example:

	:::ruby
    System.run_app('rhomobile store/store.exe', 'someparams')

Windows Desktop: `appname` is path in registry: `<vendor>/<app_name>/<app_name>.exe`. For example:

	:::ruby
    System.run_app('rhomobile/store/store.exe', 'someparams')

Blackberry: `appname` is `<app_name>`. For example:

	:::ruby
    System.run_app('store', 'someparams')

## set_application_icon_badge

Set application icon badge number – only for iPhone.

	:::ruby
	System.set_application_icon_badge(badge_number)

<table border="1">
<tr>
	<td><code>badge_number</code></td>
	<td>Set the application icon to have this badge number. Set to 0 (zero) to remove badge.</td>
</tr>
</table>

## set_locale

Switch application locale at runtime. This does not change OS Locale, it will change only the LocalizationSimplified locale used in helper methods. See [Localization in Device Capabilities](../rhodes/device-caps#localization) for more information.

	:::ruby
	System.set_locale('es') # set current locale to Spanish

To get current application Locale:

	:::ruby
    LocalizationSimplified::get_cur_locale #get current application locale

<table border="1">
<tr>
	<td><code>badge_number</code></td>
	<td>Set the application icon to have this badge number. Set to 0 (zero) to remove badge.</td>
</tr>
</table>

## set_http_proxy_url

To use client with the HTTP proxy, you should pass its URL as the first command line argument `-http_proxy_url=http://<login>:<passwod>@<host>:<port>` (Windows Desktop only), add it to rhoconfig.txt, or call the setter method from Ruby code (only for Windows Mobile, WinCE and Windows Desktop).

	:::ruby
	System.set_http_proxy_url(url)

<table border="1">
<tr>
	<td><code>url</code></td>
	<td>The client url.</td>
</tr>
</table>

## unset_http_proxy

Stop using HTTP proxy that was set by the command line, rhoconfig.txt or `set_http_proxy_url` (only for Windows Mobile, WinCE and Windows Desktop).

	:::ruby
	System.unset_http_proxy()

## set_network_status_notify

Set a network status notification for a callback which receives notifications when the network goes up or down. This callback application can check if there are any local changes and perform a full sync if necessary. Full sync method will be extended with parameter to sync only models with local changes, so sync time will be minimized.

Platforms: iPhone, Android, Windows Mobile, and WinCE.

	:::ruby
	System.set_network_status_notify(callback, poll_interval)

On iOS, network status is polled with a period specified in the `poll_interval` parameter. {See Reachability on the Apple developer site](http://developer.apple.com/library/ios/#samplecode/Reachability/Introduction/Intro.html).

On Android, network status changes can be asynchronously monitored via [BroadcastReceiver mechanism](http://stackoverflow.com/questions/1783117/network-listener-android).

<table border="1">
<tr>
	<td><code>callback</code></td>
	<td>The url to the user-defined callback method.</td>
</tr>
<tr>
	<td><code>poll_interval</code></td>
	<td>iOS. The network status polling period for systems that can not notify network status change immediately. Default value is 20 seconds.</td>
</tr>
</table>

Two parameters are passed to the user-defined callback.

<table border="1">
<tr>
	<td><code>prev_status</code></td>
	<td>Previous status of the network connection. Possible values: 'connected', 'disconnected', 'unknown'.</td>
</tr>
<tr>
	<td><code>current_status</code></td>
	<td>current status of network connection. Possible values: 'connected', 'disconnected', 'unknown'.</td>
</tr>
</table>

## clear_network_status_notify

Clear network status callback from `set_network_status_notify` so notifications will not be fired.

Platforms: iPhone, Android, Windows Mobile, and WinCE.

	:::ruby
	System.clear_network_status_notify()

## set_screen_rotation_notification

Notify (call a callback method) when the screen rotates.

	:::ruby
	System.set_screen_rotation_notification(callback_url, params)

<table border="1">
<tr>
	<td><code>callback_url</code></td>
	<td>Path to callback method to run when screen rotates.</td>
</tr>
<tr>
	<td><code>params</code></td>
	<td>Parameters you passed while setting up notification, as well as 'width', 'height', and 'degrees'.</td>
</tr>
</table>

## set_sleeping

Set to true/false (0/1) to enable/disable phone sleeping. For iOS, Android, and Blackberry.

	:::ruby
	System.set_sleeping

## set_push_notification

Register push callback, the method to call upon receiving a push message.

	:::ruby
	System.set_push_notification(url, url_params, push_client)

<table border="1">
<tr>
	<td><code>url</code></td>
	<td>URL of the callback method. If empty, unregisters rhoconnect-push.</td>
</tr>
<tr>
	<td><code>url_params</code></td>
	<td>string with optional params which will be added to callback URL.</td>
</tr>
<tr>
	<td><code>push_client</code></td>
	<td>string with name of a push service client. Current values can be 'rhoconnect_push' or 'gcm' or 'legacy' or empty. If empty, then the call will be applied to every push client. (Not implemented on bb and wp7)</td>
</tr>
</table>

## set_window_frame

Change application window position and size. Implemented only for Windows desktop.

	:::ruby
	System.set_window_frame(x,y,width,height)

<table border="1">
<tr>
	<td><code>x</code></td>
	<td>Left corner of window.</td>
</tr>
<tr>
	<td><code>y</code></td>
	<td>Top corner of window.</td>
</tr>
<tr>
	<td><code>width</code></td>
	<td>Width of window.</td>
</tr>
<tr>
	<td><code>height</code></td>
	<td>Height of window.</td>
</tr>
</table>

## set_window_position

Change application window position. Implemented only for Windows desktop.

	:::ruby
	System.set_window_position(x,y)

<table border="1">
<tr>
	<td><code>x</code></td>
	<td>Left corner of window.</td>
</tr>
<tr>
	<td><code>y</code></td>
	<td>Top corner of window.</td>
</tr>
</table>

## set_window_size

Change application window size. Implemented only for Windows desktop.

	:::ruby
	System.set_window_size(width,height)

<table border="1">
<tr>
	<td><code>width</code></td>
	<td>Width of window.</td>
</tr>
<tr>
	<td><code>height</code></td>
	<td>Height of window.</td>
</tr>
</table>

## lock_window_size

Lock/unlock the window size change by the user. Implemented only for Windows desktop.

	:::ruby
	System.lock_window_size(locked)

<table border="1">
<tr>
	<td><code>locked</code></td>
	<td>true if locked, flals if unlocked.</td>
</tr>
</table>

## unzip_file

Ruby syntax:

	:::ruby
	System.unzip_file(local_path_to_zip)

JavaScript syntax:

	Rho.System.unzip_file(local_path_to_zip)

<table border="1">
<tr>
	<td><code>local_path_to_zip</code></td>
	<td>String. The path to the file to be zipped.</td>
</tr>
</table>

## zip_file

Zip one file to a specified zip.

Ruby syntax:

	:::ruby
	System.zip_file(local_path_to_zip, local_path_to_file, password)

JavaScript syntax:

	Rho.System.zip_files(local_path_to_zip, local_path_to_file, password)

<table border="1">
<tr>
	<td><code>local_path_to_zip</code></td>
	<td>String. The path to the specified zip.</td>
</tr>
<tr>
	<td><code>local_path_to_file</code></td>
	<td>String. The path to the file to be zipped.</td>
</tr>
<tr>
	<td><code>password</code></td>
	<td>String. Optional. Password for the zip.</td>
</tr>
</table>

## zip_files
 
Zip several files to a specified zip.

Ruby syntax:

	:::ruby
	System.zip_files(local_path_to_zip, base_path, array_of_files_to_be_zipped, password)

JavaScript syntax:

	Rho.System.zip_files(local_path_to_zip, base_path, array_of_files_to_be_zipped, password)

<table border="1">
<tr>
	<td><code>local_path_to_zip</code></td>
	<td>String. The path to the specified zip.</td>
</tr>
<tr>
	<td><code>base_path</code></td>
	<td>String. Base path to the files to be zipped.</td>
</tr>
<tr>
	<td><code>array_of_files_to_be_zipped</code></td>
	<td>Array of strings. An array of files to be zipped.</td>
</tr>
<tr>
	<td><code>password</code></td>
	<td>String. Optional. Password for the zip.</td>
</tr>
</table>
