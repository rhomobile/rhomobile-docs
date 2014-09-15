#System


## Overview
The System API is used to control and modify core aspects of the device such as the screen, OS and device capabilities.
## Enabling the API
There are two methods of enabling the System API: 

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
To include single APIs, you must first include the `ebapi.js` in your HTML as well as the API file you want to use. For instance, to use the System API, I would add the following code to my HTML file(s), assuming the API files have been copied to the same directory as the HTML.

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi.js"></script>
    <script type="text/javascript" charset="utf-8" src="eb.system.js"></script>

The ebapi.js file is necessary for all single API inclusions.

        


##Methods



### applicationInstall(<span class="text-info">STRING</span> applicationUrl)
Install an application.

####Parameters
<ul><li>applicationUrl : <span class='text-info'>STRING</span><p>The url of an application to install on the device. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.applicationInstall(<span class="text-info">STRING</span> applicationUrl)</code> 


### applicationUninstall(<span class="text-info">STRING</span> applicationName)
Uninstall the application. Not Supported on Windows CE devices.

####Parameters
<ul><li>applicationName : <span class='text-info'>STRING</span><p>The name of the application. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.applicationUninstall(<span class="text-info">STRING</span> applicationName)</code> 


### bringToFront()
Bring application window to the top of the screen.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.bringToFront()</code> 


### clearNetworkStatusNotify()
Use Network.clearStatusNotify: Clear network status callback.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.clearNetworkStatusNotify()</code> 


### deleteFolder(<span class="text-info">STRING</span> pathToFolder)
Delete folder.

####Parameters
<ul><li>pathToFolder : <span class='text-info'>STRING</span><p>Path to folder. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.deleteFolder(<span class="text-info">STRING</span> pathToFolder)</code> 


### deleteRegistrySetting(<span class="text-info">HASH</span> propertyMap)
Deletes the specified value from the device registry. Only applicable on Windows Mobile / Embedded Handheld and CE devices. 

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>Map of properties associated with the registry key being set. </p></li><ul><li>hive : <span class='text-info'>STRING</span><p>The hive name, setRegistrySetting. </p></li><li>key : <span class='text-info'>STRING</span><p>Full path of the key, including '\' separators as required. Remember to use '\\' in JavaScript to specify backslash. </p></li><li>setting : <span class='text-info'>STRING</span><p>The name of the setting to be deleted. </p></li><li>persistent : <span class='text-info'>BOOLEAN</span><p>If the registry value was set to be persistent, ie a corresponding .reg file was created in the \Application folder then setting true here will delete that .reg file. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:

* BOOLEAN : Whether or not the registry key was successfully deleted.

####Platforms

* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.deleteRegistrySetting(<span class="text-info">HASH</span> propertyMap)</code> 


### exit()
Use Application.quit: exit application.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.exit()</code> 


### getAllProperties()
This method will return all of object/value pairs for the propertyNames of the API class.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:

* HASH : Map of all available properties<ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul>

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.getAllProperties()</code> 


### getProperties(<span class="text-info">ARRAY</span> arrayofNames)
This method will return a set of object/value pairs for the list of the propertyName that is passed in. The propertyNames must be a valid property of the API class.

####Parameters
<ul><li>arrayofNames : <span class='text-info'>ARRAY</span><p>List of properties I want to know about </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:

* HASH : Map of properties I want to know about<ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul>

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code> 


### getProperty(<span class="text-info">STRING</span> propertyName)
This method will return the value of the propertyName that is passed in. The propertyName must be a valid property of the API class.

####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p>The property to return info about. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING : The property to return info about.

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.getProperty(<span class="text-info">STRING</span> propertyName)</code> 


### getRegistrySetting(<span class="text-info">HASH</span> propertyMap)
Retrieve a value from the device registry. Only applicable on Windows Mobile / Embedded Handheld and CE devices. 

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>Map of properties associated with the registry key being set. </p></li><ul><li>hive : <span class='text-info'>STRING</span><p>The hive name, see setRegistrySetting. </p></li><li>key : <span class='text-info'>STRING</span><p>Full path of the key, including '\' separators as required. Remember to use '\\' in JavaScript to specify backslash. </p></li><li>setting : <span class='text-info'>STRING</span><p>The name of the setting to be retrieved. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING : Registry value of the key.

####Platforms

* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.getRegistrySetting(<span class="text-info">HASH</span> propertyMap)</code> 


### getStartParams()
Return the command line parameters. At Android start parameters are returned as URL query string starting with '?', name-value delimiter '=' and name value pairs delimiter '&'.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.getStartParams()</code> 


### get_locale()
Use System.locale property: Current device locale.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.get_locale()</code> 


### isApplicationInstalled(<span class="text-info">STRING</span> applicationName)
Checks if the specified applicationName is installed on the device.

####Parameters
<ul><li>applicationName : <span class='text-info'>STRING</span><p>The name of the application. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:

* BOOLEAN

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.isApplicationInstalled(<span class="text-info">STRING</span> applicationName)</code> 


### isBlobAttr(<span class="text-info">STRING</span> partition, <span class="text-info">INTEGER</span> sourceID, <span class="text-info">STRING</span> attrName)
Use Database.SQLite3.isBlobAttr: is model attribute is blob.

####Parameters
<ul><li>partition : <span class='text-info'>STRING</span><p> </p></li><li>sourceID : <span class='text-info'>INTEGER</span><p> </p></li><li>attrName : <span class='text-info'>STRING</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:

* BOOLEAN

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.isBlobAttr(<span class="text-info">STRING</span> partition, <span class="text-info">INTEGER</span> sourceID, <span class="text-info">STRING</span> attrName)</code> 


### openUrl(<span class="text-info">STRING</span> url)
Open the application associated with the URL. Behavior may be different on different platforms and depend on installed software. For example, open URL with http:// prefix will execute the Web Browser installed on system and open URL in executed browser. Note: Opening pdf files on Android devices is not supported.
                

####Parameters
<ul><li>url : <span class='text-info'>STRING</span><p>URL as string. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.openUrl(<span class="text-info">STRING</span> url)</code> 


### runApplication(<span class="text-info">STRING</span> appName, <span class="text-info">STRING</span> params, <span class="text-info">BOOLEAN</span> blockingCall)
Run an application.

####Parameters
<ul><li>appName : <span class='text-info'>STRING</span><p>The name of the application on the device to run.  </p></li><li>params : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>Start parameters string. Executed Application can receive this string by getStartParams method. Parameter could be just value, or key-value pair separated by '=' sign. Please note that for each platform there are distinct ways to write several params at once. On Android parameters should be separated by "&", on other platforms by ',' or ' '. </p></li><li>blockingCall : <span class='text-info'>BOOLEAN</span> <span class='label label-info'>Optional</span><p>Not Implemented. False by default.</p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.runApplication(<span class="text-info">STRING</span> appName, <span class="text-info">STRING</span> params, <span class="text-info">BOOLEAN</span> blockingCall)</code> 


### setDoNotBackupAttribute(<span class="text-info">STRING</span> pathToFile, <span class="text-info">BOOLEAN</span> doNotBackup)
Set do not backup attribute for file.

####Parameters
<ul><li>pathToFile : <span class='text-info'>STRING</span><p>Path to file. </p></li><li>doNotBackup : <span class='text-info'>BOOLEAN</span><p>True set doNotBackup attribute to file (exclude this file from backup), false for remove doNotBackup attribute from file. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.setDoNotBackupAttribute(<span class="text-info">STRING</span> pathToFile, <span class="text-info">BOOLEAN</span> doNotBackup)</code> 


### setNetworkStatusNotify(<span class="text-info">STRING</span> url, <span class="text-info">INTEGER</span> poll_interval)
Use Network.setStatusNotify: set network notification callback.

####Parameters
<ul><li>url : <span class='text-info'>STRING</span><p>The url to the user-defined callback method. </p></li><li>poll_interval : <span class='text-info'>INTEGER</span><p>IOS. The network status polling period for systems that can not notify network status change immediately. Default value is 20 seconds. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.setNetworkStatusNotify(<span class="text-info">STRING</span> url, <span class="text-info">INTEGER</span> poll_interval)</code> 


### setProperties(<span class="text-info">HASH</span> propertyMap)
This method will set the values of a list of properties for the API class. The propertyName must be a valid property for the class and must also not be read only.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>Map of properties I want to set </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.setProperties(<span class="text-info">HASH</span> propertyMap)</code> 


### setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)
This method will set the value of a property for the API class. The propertyName must be a valid property for the class and must also not be read only.

####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p>The one property name that I want to set </p></li><li>propertyValue : <span class='text-info'>STRING</span><p>The one property value that I want to set </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code> 


### setPushNotification(<span class="text-info">STRING</span> url, <span class="text-info">STRING</span> url_params, <span class="text-info">STRING</span> push_client)
Use Push.setPushNotification: Register push callback, the method to call upon receiving a push message.

####Parameters
<ul><li>url : <span class='text-info'>STRING</span><p>URL of the callback method. If empty, unregisters rhoconnect-push. </p></li><li>url_params : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>Parameters which will be added to callback URL. </p></li><li>push_client : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>Name of a push service client. Current values can be 'rhoconnect_push' or 'gcm' or 'legacy' or empty. The call will be applied to every push client.</p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.setPushNotification(<span class="text-info">STRING</span> url, <span class="text-info">STRING</span> url_params, <span class="text-info">STRING</span> push_client)</code> 


### setRegistrySetting(<span class="text-info">HASH</span> propertyMap)
Set a value in the device registry. Only applicable on Windows Mobile / Embedded Handheld and CE devices. 

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>Map of properties associated with the registry key being set. </p></li><ul><li>hive : <span class='text-info'>STRING</span><p>The hive name. </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>Constant: EB.System.REGKEY_CLASSES_ROOT <br/> String:HKCR</dt><dd>Set the property in the HKEY_CLASSES_ROOT hive.</dd><dt>Constant: EB.System.REGKEY_CURRENT_USER <br/> String:HKCU</dt><dd>Set the property in the HKEY_CURRENT_USER hive.</dd><dt>Constant: EB.System.REGKEY_LOCAL_MACHINE <br/> String:HKLM</dt><dd>Set the property in the HKEY_LOCAL_MACHINE hive.</dd><dt>Constant: EB.System.REGKEY_USERS <br/> String:HKU</dt><dd>Set the property in the HKEY_USERS hive.</dd></dl></li><li>type : <span class='text-info'>STRING</span><p>The type. </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>Constant: EB.System.REGTYPE_SZ <br/> String:String</dt><dd>The type of the value being set is a string.</dd><dt>Constant: EB.System.REGTYPE_BINARY <br/> String:Binary</dt><dd>The type of the value being set is a binary number.</dd><dt>Constant: EB.System.REGTYPE_DWORD <br/> String:DWORD</dt><dd>The type of the value being set is a natural number (DWORD)</dd><dt>Constant: EB.System.REGTYPE_MULTI_SZ <br/> String:MultiSZ</dt><dd>The type of the value being set is a multi line string. Separate your lines with \n (\\n in JavaScript)</dd></dl></li><li>key : <span class='text-info'>STRING</span><p>Full path of the key, including '\' separators as required. Remember to use '\\' in JavaScript to specify backslash. </p></li><li>setting : <span class='text-info'>STRING</span><p>The name of the registry setting to be set. </p></li><li>value : <span class='text-info'>STRING</span><p>The registry value to be set. </p></li><li>persistent : <span class='text-info'>BOOLEAN</span><p>Whether or not to create a corresponding merge file, setting to true will cause your value to persist across a device clean boot. A .reg file is written to the \Application folder on the device to persist the setting. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:

* BOOLEAN : Whether or not the registry key was successfully set.

####Platforms

* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.setRegistrySetting(<span class="text-info">HASH</span> propertyMap)</code> 


### setScreenRotationNotification(<span class="text-info">STRING</span> url, <span class="text-info">STRING</span> url_params)
Use ScreenOrientation.setScreenOrientationEvent: Notify (call a callback method) when the screen rotates.

####Parameters
<ul><li>url : <span class='text-info'>STRING</span><p>URL of the callback method. If empty, unregisters notification callback. </p></li><li>url_params : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>Parameters which will be added to callback URL. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.setScreenRotationNotification(<span class="text-info">STRING</span> url, <span class="text-info">STRING</span> url_params)</code> 


### setWindowFrame(<span class="text-info">INTEGER</span> x, <span class="text-info">INTEGER</span> y, <span class="text-info">INTEGER</span> width, <span class="text-info">INTEGER</span> height)
Change application window position and size.

####Parameters
<ul><li>x : <span class='text-info'>INTEGER</span><p>Left corner of window. </p></li><li>y : <span class='text-info'>INTEGER</span><p>Top corner of window. </p></li><li>width : <span class='text-info'>INTEGER</span><p>Width of window. </p></li><li>height : <span class='text-info'>INTEGER</span><p>Height of window. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.setWindowFrame(<span class="text-info">INTEGER</span> x, <span class="text-info">INTEGER</span> y, <span class="text-info">INTEGER</span> width, <span class="text-info">INTEGER</span> height)</code> 


### setWindowPosition(<span class="text-info">INTEGER</span> x, <span class="text-info">INTEGER</span> y)
Change application window position.

####Parameters
<ul><li>x : <span class='text-info'>INTEGER</span><p>Left corner of window. </p></li><li>y : <span class='text-info'>INTEGER</span><p>Top corner of window. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.setWindowPosition(<span class="text-info">INTEGER</span> x, <span class="text-info">INTEGER</span> y)</code> 


### setWindowSize(<span class="text-info">INTEGER</span> width, <span class="text-info">INTEGER</span> height)
Change application window size.

####Parameters
<ul><li>width : <span class='text-info'>INTEGER</span><p>Width of the window. </p></li><li>height : <span class='text-info'>INTEGER</span><p>Width of the of window. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.setWindowSize(<span class="text-info">INTEGER</span> width, <span class="text-info">INTEGER</span> height)</code> 


### set_application_icon_badge(<span class="text-info">INTEGER</span> badgeNumber)
Use System.applicationIconBadge: Set the application icon to have this badge number. Set to 0 (zero) to remove badge.iOS only.

####Parameters
<ul><li>badgeNumber : <span class='text-info'>INTEGER</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.set_application_icon_badge(<span class="text-info">INTEGER</span> badgeNumber)</code> 


### set_http_proxy_url(<span class="text-info">STRING</span> proxyURI)
Use System.httpProxyURI property: To use client with the HTTP proxy.

####Parameters
<ul><li>proxyURI : <span class='text-info'>STRING</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.set_http_proxy_url(<span class="text-info">STRING</span> proxyURI)</code> 


### set_locale(<span class="text-info">STRING</span> locale_code, <span class="text-info">STRING</span> country_code)
Use Application.setLocale method: set application specific locale.

####Parameters
<ul><li>locale_code : <span class='text-info'>STRING</span><p> </p></li><li>country_code : <span class='text-info'>STRING</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.set_locale(<span class="text-info">STRING</span> locale_code, <span class="text-info">STRING</span> country_code)</code> 


### set_sleeping(<span class="text-info">BOOLEAN</span> enable)
Use System.screenSleeping property: enable / disable phone sleeping.

####Parameters
<ul><li>enable : <span class='text-info'>BOOLEAN</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.set_sleeping(<span class="text-info">BOOLEAN</span> enable)</code> 


### startTimer(<span class="text-info">INTEGER</span> interval, <span class="text-info">STRING</span> url, <span class="text-info">STRING</span> url_params)
Use Timer.start: start timer.

####Parameters
<ul><li>interval : <span class='text-info'>INTEGER</span><p>Timer interval. </p></li><li>url : <span class='text-info'>STRING</span><p>URL of the callback method. </p></li><li>url_params : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>Parameters which will be added to callback URL. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.startTimer(<span class="text-info">INTEGER</span> interval, <span class="text-info">STRING</span> url, <span class="text-info">STRING</span> url_params)</code> 


### stopTimer(<span class="text-info">STRING</span> url)
Use Timer.stop: stop timer.

####Parameters
<ul><li>url : <span class='text-info'>STRING</span><p>URL of the callback method which identify the timer to stop. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.stopTimer(<span class="text-info">STRING</span> url)</code> 


### unset_http_proxy()
Use System.httpProxyURI property: Stop using HTTP proxy that was set by the command line, rhoconfig.txt or set_http_proxy_url.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.unset_http_proxy()</code> 


### unzipFile(<span class="text-info">STRING</span> localPathToZip, <span class="text-info">STRING</span> password)
Unzip file.

####Parameters
<ul><li>localPathToZip : <span class='text-info'>STRING</span><p>The path to the file to be unzipped. Application should have write permissions to this folder. </p></li><li>password : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>Password for the zip. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.unzipFile(<span class="text-info">STRING</span> localPathToZip, <span class="text-info">STRING</span> password)</code> 


### updateBlobAttribs(<span class="text-info">STRING</span> partition, <span class="text-info">INTEGER</span> sourceID)
Use Database.updateBlobAttribs: update model blob attributes list.

####Parameters
<ul><li>partition : <span class='text-info'>STRING</span><p> </p></li><li>sourceID : <span class='text-info'>INTEGER</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.updateBlobAttribs(<span class="text-info">STRING</span> partition, <span class="text-info">INTEGER</span> sourceID)</code> 


### zipFile(<span class="text-info">STRING</span> localPathToZip, <span class="text-info">STRING</span> localPathToFile, <span class="text-info">STRING</span> password)
Zip one file. Zip archive must placed to the folder where application can write files. 

####Parameters
<ul><li>localPathToZip : <span class='text-info'>STRING</span><p>The path to the specified zip. Application should have write permissions to this folder. </p></li><li>localPathToFile : <span class='text-info'>STRING</span><p>The path to the file to be zipped. </p></li><li>password : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>Password for the zip. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.zipFile(<span class="text-info">STRING</span> localPathToZip, <span class="text-info">STRING</span> localPathToFile, <span class="text-info">STRING</span> password)</code> 


### zipFiles(<span class="text-info">STRING</span> localPathToZip, <span class="text-info">STRING</span> basePath, <span class="text-info">ARRAY</span> filePathsToZip, <span class="text-info">STRING</span> password)
Zip list of files.

####Parameters
<ul><li>localPathToZip : <span class='text-info'>STRING</span><p>The path to the specified zip. </p></li><li>basePath : <span class='text-info'>STRING</span><p>Base path to the files to be zipped. </p></li><li>filePathsToZip : <span class='text-info'>ARRAY</span><p>List of file paths to be zipped. </p></li><li>password : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>Password for the zip. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.zipFiles(<span class="text-info">STRING</span> localPathToZip, <span class="text-info">STRING</span> basePath, <span class="text-info">ARRAY</span> filePathsToZip, <span class="text-info">STRING</span> password)</code> 


##Properties



###applicationIconBadge

####Type
<span class='text-info'>INTEGER</span> 
####Description
Set the application icon to have this badge number. Set to 0 (zero) to remove badge.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.applicationIconBadge</code>


###country

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description
Current device country code.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.country</code>



####Platforms

* Android
* Windows Mobile

###deviceName

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description
Name of device application running on. Examples: '9000' (BB), 'iPhone', 'dream' (Android).
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.deviceName</code>



####Platforms

* Android
* Windows Mobile

###deviceOwnerEmail

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description
Primary email of phone owner. To access this property 'pim' capability must be enabled in your build.yml.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.deviceOwnerEmail</code>



####Platforms

* Android

###deviceOwnerName

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description
Name(account name) of phone owner. To access this property 'pim' capability must be enabled in your build.yml.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.deviceOwnerName</code>



####Platforms

* Android

###<span class="text-info">devicePushId</span>

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description
<span class='label label-info'>Replaces:deviceId</span> Push notifications device ID which may be used to receive push messages.To get this ID , Push service should be configured on the device. Please refer to Push documentation.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.devicePushId</code>



####Platforms

* Android
* Windows Mobile

###freeServerPort

####Type
<span class='text-info'>INTEGER</span> <span class='label'>Read Only</span>
####Description
Get free local server port, available for binding.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.freeServerPort</code>



####Platforms

* Android
* Windows Mobile

###hasCalendar

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description
Returns true if calendar support is available.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.hasCalendar</code>



####Platforms

* Android
* Windows Mobile

###hasCamera

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description
Returns true if there is a camera available on the device.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.hasCamera</code>



####Platforms

* Android
* Windows Mobile

###<span class="text-error">hasCellNetwork</span>

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description
<span class='label label-important'>Deprecated</span> Use Network.hasCellNetwork to tell if device is connected to the cell network.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.hasCellNetwork</code>



####Platforms

* Android
* Windows Mobile

###<span class="text-error">hasNetwork</span>

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description
<span class='label label-important'>Deprecated</span> Use Network.hasNetwork to tell if the device is connected to the network.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.hasNetwork</code>



####Platforms

* Android
* Windows Mobile

###<span class="text-error">hasSqlite</span>

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description
<span class='label label-important'>Deprecated</span> Returns true if the device has sqlite capabilities (previously only BlackBerry did not support this).
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.hasSqlite</code>



####Platforms

* Android
* Windows Mobile

###hasTouchscreen

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description
Returns true if the device has touch screen capabilities.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.hasTouchscreen</code>



####Platforms

* Android
* Windows Mobile

###<span class="text-error">hasWifiNetwork</span>

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description
<span class='label label-important'>Deprecated</span> Use Network.hasWifiNetwork to tell if the device is connected to the wifi network.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.hasWifiNetwork</code>



####Platforms

* Android
* Windows Mobile

###<span class="text-info">httpProxyURI</span>

####Type
<span class='text-info'>STRING</span> 
####Description
<span class='label label-info'>Replaces:http_proxy_url</span> Set HTTP proxy parameters for using by Network module. Example: user:password@url:port . Support only basic authentication. Setting the property overrides http_proxy_uri (or http_proxy_host, http_proxy_port, http_proxy_user, http_proxy_password). To set proxy for Motorola WebKit for Windows Mobile/CE use config.xml settings.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.httpProxyURI</code>



####Platforms

* Android
* Windows Mobile

###isEmulator

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description
Returns true if the application is running on a platform emulator.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.isEmulator</code>



####Platforms

* Android
* Windows Mobile

###isMotorolaDevice

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description
Returns true if the device supports Motorola device capabilities. APIs will indicate if the property or method is available on MSI devices only. You can use this property to help your application decide when to take advantage of advanced MSI capabilities.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.isMotorolaDevice</code>



####Platforms

* Android
* Windows Mobile

###keyboardState

####Type
<span class='text-info'>STRING</span> 
####Description
For Windows Mobile and Windows CE the keyboard can be manually shown or hidden as required. All other platforms only support 'automatic'. The default state for Windows Mobile and Windows CE is manual, for all other platforms it is automatic.
####Params
<p><strong>Default:</strong> See Description</p>
####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.System.KEYBOARD_SHOWN - String: shown Shows the on screen keyboard, after setting the keyboard to shown or hidden it will no longer appear / disappear automatically until you set this property to automatic.
* Constant: EB.System.KEYBOARD_HIDDEN - String: hidden Hides the on screen keyboard, after setting the keyboard to shown or hidden it will no longer appear / disappear automatically until you set this property to automatic. This is most useful if your device has a hardware keyboard or you are scanning / capturing data to an input field.
* Constant: EB.System.KEYBOARD_AUTOMATIC - String: automatic Automatically shows or hides the keyboard as needed by the application.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.keyboardState</code>



####Platforms

* Windows Mobile
* Motorola Solutions Devices Only

###localServerPort

####Type
<span class='text-info'>INTEGER</span> <span class='label'>Read Only</span>
####Description
Port of the local (embedded) HTTP server. This parameter is mainly for debug purposes. If not specified, the platform will detect a free port on the device and use that one.
####Params
<p><strong>Default:</strong> 8080</p>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.localServerPort</code>



####Platforms

* Android
* Windows Mobile

###locale

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description
Current device locale Like 'en', 'ru' etc.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.locale</code>



####Platforms

* Android
* Windows Mobile

###lockWindowSize

####Type
<span class='text-info'>BOOLEAN</span> 
####Description
Lock / unlock the window size change by the user. When running on RhoSimulator, this method is supported only for Windows OS.
####Params
<p><strong>Default:</strong> false</p>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.lockWindowSize</code>


###oemInfo

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description
The OEM Information string for the terminal.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.oemInfo</code>



####Platforms

* Android
* Windows Mobile
* Motorola Solutions Devices Only

###osVersion

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description
Version OS of device. Examples:  '4.1' (Android).
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.osVersion</code>



####Platforms

* Android
* Windows Mobile

###phoneId

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description
Hardware based ID. It depends on capabilities configured for an application and has to remain same even across application uninstall/install.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.phoneId</code>



####Platforms

* Android
* Windows Mobile

###platform

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description
Platform where application is running.
####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.System.PLATFORM_WM_CE - String: WINDOWS 
* Constant: EB.System.PLATFORM_ANDROID - String: ANDROID 
* Constant: EB.System.PLATFORM_IOS - String: APPLE 
* Constant: EB.System.PLATFORM_WP8 - String: WP8 
* Constant: EB.System.PLATFORM_WINDOWS_DESKTOP - String: WINDOWS_DESKTOP 
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.platform</code>



####Platforms

* Android
* Windows Mobile

###ppiX

####Type
<span class='text-info'>INTEGER</span> <span class='label'>Read Only</span>
####Description
Horizontal PPI (Pixels Per Inch).
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.ppiX</code>



####Platforms

* Android
* Windows Mobile

###ppiY

####Type
<span class='text-info'>INTEGER</span> <span class='label'>Read Only</span>
####Description
Vertical PPI (Pixels Per Inch).
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.ppiY</code>



####Platforms

* Android
* Windows Mobile

###realScreenHeight

####Type
<span class='text-info'>INTEGER</span> <span class='label'>Read Only</span>
####Description
Screen height in real pixels.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.realScreenHeight</code>



####Platforms

* Android
* Windows Mobile

###realScreenWidth

####Type
<span class='text-info'>INTEGER</span> <span class='label'>Read Only</span>
####Description
Screen width in real pixels.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.realScreenWidth</code>



####Platforms

* Android
* Windows Mobile

###screenAutoRotate

####Type
<span class='text-info'>BOOLEAN</span> 
####Description
Screen auto rotate.
####Params
<p><strong>Default:</strong> true</p>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.screenAutoRotate</code>



####Platforms

* Android

###screenHeight

####Type
<span class='text-info'>INTEGER</span> <span class='label'>Read Only</span>
####Description
Screen height in logical pixels (used for set coordinates).
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.screenHeight</code>



####Platforms

* Android
* Windows Mobile

###screenOrientation

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description
Current screen orientation.
####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.System.SCREEN_PORTRAIT - String: portrait The return value if the screen is in portrait mode.
* Constant: EB.System.SCREEN_LANDSCAPE - String: landscape The return value if the screen is in landscape mode.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.screenOrientation</code>



####Platforms

* Android
* Windows Mobile

###screenSleeping

####Type
<span class='text-info'>BOOLEAN</span> 
####Description
If true, then screen will go to sleep by system inactivity timeout. If false then screen never go to sleep while application is in foreground.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.screenSleeping</code>



####Platforms

* Android

###screenWidth

####Type
<span class='text-info'>INTEGER</span> <span class='label'>Read Only</span>
####Description
Screen width in logical pixels (used for set coordinates).
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.screenWidth</code>



####Platforms

* Android
* Windows Mobile

###uuid

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description
The Unique Unit IDentifier for the terminal.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.uuid</code>



####Platforms

* Android
* Windows Mobile
* Motorola Solutions Devices Only

###webviewFramework

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description
Browser framework identity string.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.webviewFramework</code>



####Platforms

* Android
* Windows Mobile