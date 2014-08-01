#System


## Overview
The System API is used to control and modify core aspects of the device such as the screen, OS and device capabilities.
## Enabling the API
In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* ebapi-modules.js - this file contains all available Enterprise Browser APIs

If you wish to minimize the amount of JavaScript being included, you can choose to only include the individual API that your application is using:

ex:

* ebapi.js - core APIs needed 
* eb.system.js - just the System API
* other individual JavaScript files included with the Enterprise Browser installation

        


##Methods



### applicationInstall(<span class="text-info">STRING</span> applicationUrl)
<p>Install an application.</p>


####Parameters
<ul><li>applicationUrl : <span class='text-info'>STRING</span><p>
<p>The url of an application to install on the device.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.applicationInstall(<span class="text-info">STRING</span> applicationUrl)</code> 


### applicationUninstall(<span class="text-info">STRING</span> applicationName)
<p>Uninstall the application. Not Supported on Windows CE devices.</p>


####Parameters
<ul><li>applicationName : <span class='text-info'>STRING</span><p>
<p>The name of the application.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.applicationUninstall(<span class="text-info">STRING</span> applicationName)</code> 


### bringToFront()
<p>Bring application window to the top of the screen.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.bringToFront()</code> 


### clearNetworkStatusNotify()
<p>Use Network.clearStatusNotify: Clear network status callback.</p>


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
	* <code>EB.System.clearNetworkStatusNotify()</code> 


### deleteFolder(<span class="text-info">STRING</span> pathToFolder)
<p>Delete folder.</p>


####Parameters
<ul><li>pathToFolder : <span class='text-info'>STRING</span><p>
<p>Path to folder.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.deleteFolder(<span class="text-info">STRING</span> pathToFolder)</code> 


### deleteRegistrySetting(<span class="text-info">HASH</span> propertyMap)
<p>Deletes the specified value from the device registry. Only applicable on Windows Mobile / Embedded Handheld and CE devices.</p>


####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>
<p>Map of properties associated with the registry key being set.</p>
 </p></li><ul><li>hive : <span class='text-info'>STRING</span><p>
<p>The hive name, setRegistrySetting.</p>
 </p></li><li>key : <span class='text-info'>STRING</span><p>
<p>Full path of the key, including &lsquo;\&rsquo; separators as required. Remember to use &lsquo;\&rsquo; in JavaScript to specify backslash.</p>
 </p></li><li>setting : <span class='text-info'>STRING</span><p>
<p>The name of the setting to be deleted.</p>
 </p></li><li>persistent : <span class='text-info'>BOOLEAN</span><p>
<p>If the registry value was set to be persistent, ie a corresponding .reg file was created in the \Application folder then setting true here will delete that .reg file.</p>
 </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:

* BOOLEAN : 
<p>Whether or not the registry key was successfully deleted.</p>


####Platforms

* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.deleteRegistrySetting(<span class="text-info">HASH</span> propertyMap)</code> 


### exit()
<p>Use Application.quit: exit application.</p>


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
	* <code>EB.System.exit()</code> 


### getAllProperties()
<p>This method will return all of object/value pairs for the propertyNames of the API class.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:

* HASH : 
<p>Map of all available properties</p>
<ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.getAllProperties()</code> 


### getProperties(<span class="text-info">ARRAY</span> arrayofNames)
<p>This method will return a set of object/value pairs for the list of the propertyName that is passed in. The propertyNames must be a valid property of the API class.</p>


####Parameters
<ul><li>arrayofNames : <span class='text-info'>ARRAY</span><p>
<p>List of properties I want to know about</p>
 </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:

* HASH : 
<p>Map of properties I want to know about</p>
<ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code> 


### getProperty(<span class="text-info">STRING</span> propertyName)
<p>This method will return the value of the propertyName that is passed in. The propertyName must be a valid property of the API class.</p>


####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p>
<p>The property to return info about.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING : 
<p>The property to return info about.</p>


####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.getProperty(<span class="text-info">STRING</span> propertyName)</code> 


### getRegistrySetting(<span class="text-info">HASH</span> propertyMap)
<p>Retrieve a value from the device registry. Only applicable on Windows Mobile / Embedded Handheld and CE devices.</p>


####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>
<p>Map of properties associated with the registry key being set.</p>
 </p></li><ul><li>hive : <span class='text-info'>STRING</span><p>
<p>The hive name, see setRegistrySetting.</p>
 </p></li><li>key : <span class='text-info'>STRING</span><p>
<p>Full path of the key, including &lsquo;\&rsquo; separators as required. Remember to use &lsquo;\&rsquo; in JavaScript to specify backslash.</p>
 </p></li><li>setting : <span class='text-info'>STRING</span><p>
<p>The name of the setting to be retrieved.</p>
 </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING : 
<p>Registry value of the key.</p>


####Platforms

* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.getRegistrySetting(<span class="text-info">HASH</span> propertyMap)</code> 


### getStartParams()
<p>Return the command line parameters. At Android start parameters are returned as URL query string starting with &lsquo;?&rsquo;, name-value delimiter &lsquo;=&rsquo; and name value pairs delimiter &lsquo;&amp;&rsquo;.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.getStartParams()</code> 


### get_locale()
<p>Use System.locale property: Current device locale.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.get_locale()</code> 


### isApplicationInstalled(<span class="text-info">STRING</span> applicationName)
<p>Checks if the specified applicationName is installed on the device.</p>


####Parameters
<ul><li>applicationName : <span class='text-info'>STRING</span><p>
<p>The name of the application.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:

* BOOLEAN

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.isApplicationInstalled(<span class="text-info">STRING</span> applicationName)</code> 


### isBlobAttr(<span class="text-info">STRING</span> partition, <span class="text-info">INTEGER</span> sourceID, <span class="text-info">STRING</span> attrName)
<p>Use Database.SQLite3.isBlobAttr: is model attribute is blob.</p>


####Parameters
<ul><li>partition : <span class='text-info'>STRING</span><p> </p></li><li>sourceID : <span class='text-info'>INTEGER</span><p> </p></li><li>attrName : <span class='text-info'>STRING</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:

* BOOLEAN

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.isBlobAttr(<span class="text-info">STRING</span> partition, <span class="text-info">INTEGER</span> sourceID, <span class="text-info">STRING</span> attrName)</code> 


### openUrl(<span class="text-info">STRING</span> url)
<p>Open the application associated with the URL. Behavior may be different on different platforms and depend on installed software. For example, open URL with http:// prefix will execute the Web Browser installed on system and open URL in executed browser. Note: Opening pdf files on Android devices is not supported.</p>


####Parameters
<ul><li>url : <span class='text-info'>STRING</span><p>
<p>URL as string.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.openUrl(<span class="text-info">STRING</span> url)</code> 


### runApplication(<span class="text-info">STRING</span> appName, <span class="text-info">STRING</span> params, <span class="text-info">BOOLEAN</span> blockingCall)
<p>Run an application.</p>


####Parameters
<ul><li>appName : <span class='text-info'>STRING</span><p>
<p>The name of the application on the device to run.</p>
 </p></li><li>params : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>
<p>Start parameters string. Executed Application can receive this string by getStartParams method. Parameter could be just value, or key-value pair separated by &lsquo;=&rsquo; sign. Please note that for each platform there are distinct ways to write several params at once. On Android parameters should be separated by &ldquo;&amp;&rdquo;, on other platforms by &lsquo;,&rsquo; or &lsquo; &rsquo;.</p>
 </p></li><li>blockingCall : <span class='text-info'>BOOLEAN</span> <span class='label label-info'>Optional</span><p>
<p>Not Implemented.</p>
 
<p>False by default.</p>
</p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.runApplication(<span class="text-info">STRING</span> appName, <span class="text-info">STRING</span> params, <span class="text-info">BOOLEAN</span> blockingCall)</code> 


### setDoNotBackupAttribute(<span class="text-info">STRING</span> pathToFile, <span class="text-info">BOOLEAN</span> doNotBackup)
<p>Set do not backup attribute for file.</p>


####Parameters
<ul><li>pathToFile : <span class='text-info'>STRING</span><p>
<p>Path to file.</p>
 </p></li><li>doNotBackup : <span class='text-info'>BOOLEAN</span><p>
<p>True set doNotBackup attribute to file (exclude this file from backup), false for remove doNotBackup attribute from file.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.setDoNotBackupAttribute(<span class="text-info">STRING</span> pathToFile, <span class="text-info">BOOLEAN</span> doNotBackup)</code> 


### setNetworkStatusNotify(<span class="text-info">STRING</span> url, <span class="text-info">INTEGER</span> poll_interval)
<p>Use Network.setStatusNotify: set network notification callback.</p>


####Parameters
<ul><li>url : <span class='text-info'>STRING</span><p>
<p>The url to the user-defined callback method.</p>
 </p></li><li>poll_interval : <span class='text-info'>INTEGER</span><p>
<p>IOS. The network status polling period for systems that can not notify network status change immediately. Default value is 20 seconds.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.setNetworkStatusNotify(<span class="text-info">STRING</span> url, <span class="text-info">INTEGER</span> poll_interval)</code> 


### setProperties(<span class="text-info">HASH</span> propertyMap)
<p>This method will set the values of a list of properties for the API class. The propertyName must be a valid property for the class and must also not be read only.</p>


####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>
<p>Map of properties I want to set</p>
 </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.setProperties(<span class="text-info">HASH</span> propertyMap)</code> 


### setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)
<p>This method will set the value of a property for the API class. The propertyName must be a valid property for the class and must also not be read only.</p>


####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p>
<p>The one property name that I want to set</p>
 </p></li><li>propertyValue : <span class='text-info'>STRING</span><p>
<p>The one property value that I want to set</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code> 


### setPushNotification(<span class="text-info">STRING</span> url, <span class="text-info">STRING</span> url_params, <span class="text-info">STRING</span> push_client)
<p>Use Push.setPushNotification: Register push callback, the method to call upon receiving a push message.</p>


####Parameters
<ul><li>url : <span class='text-info'>STRING</span><p>
<p>URL of the callback method. If empty, unregisters rhoconnect-push.</p>
 </p></li><li>url_params : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>
<p>Parameters which will be added to callback URL.</p>
 </p></li><li>push_client : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>
<p>Name of a push service client. Current values can be &lsquo;rhoconnect_push&rsquo; or &lsquo;gcm&rsquo; or &lsquo;legacy&rsquo; or empty.</p>
 
<p>The call will be applied to every push client.</p>
</p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.setPushNotification(<span class="text-info">STRING</span> url, <span class="text-info">STRING</span> url_params, <span class="text-info">STRING</span> push_client)</code> 


### setRegistrySetting(<span class="text-info">HASH</span> propertyMap)
<p>Set a value in the device registry. Only applicable on Windows Mobile / Embedded Handheld and CE devices.</p>


####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>
<p>Map of properties associated with the registry key being set.</p>
 </p></li><ul><li>hive : <span class='text-info'>STRING</span><p>
<p>The hive name.</p>
 </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>Constant: EB.System.REGKEY_CLASSES_ROOT <br/> String:HKCR</dt><dd>
<p>Set the property in the HKEY_CLASSES_ROOT hive.</p>
</dd><dt>Constant: EB.System.REGKEY_CURRENT_USER <br/> String:HKCU</dt><dd>
<p>Set the property in the HKEY_CURRENT_USER hive.</p>
</dd><dt>Constant: EB.System.REGKEY_LOCAL_MACHINE <br/> String:HKLM</dt><dd>
<p>Set the property in the HKEY_LOCAL_MACHINE hive.</p>
</dd><dt>Constant: EB.System.REGKEY_USERS <br/> String:HKU</dt><dd>
<p>Set the property in the HKEY_USERS hive.</p>
</dd></dl></li><li>type : <span class='text-info'>STRING</span><p>
<p>The type.</p>
 </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>Constant: EB.System.REGTYPE_SZ <br/> String:String</dt><dd>
<p>The type of the value being set is a string.</p>
</dd><dt>Constant: EB.System.REGTYPE_BINARY <br/> String:Binary</dt><dd>
<p>The type of the value being set is a binary number.</p>
</dd><dt>Constant: EB.System.REGTYPE_DWORD <br/> String:DWORD</dt><dd>
<p>The type of the value being set is a natural number (DWORD)</p>
</dd><dt>Constant: EB.System.REGTYPE_MULTI_SZ <br/> String:MultiSZ</dt><dd>
<p>The type of the value being set is a multi line string. Separate your lines with \n (\n in JavaScript)</p>
</dd></dl></li><li>key : <span class='text-info'>STRING</span><p>
<p>Full path of the key, including &lsquo;\&rsquo; separators as required. Remember to use &lsquo;\&rsquo; in JavaScript to specify backslash.</p>
 </p></li><li>setting : <span class='text-info'>STRING</span><p>
<p>The name of the registry setting to be set.</p>
 </p></li><li>value : <span class='text-info'>STRING</span><p>
<p>The registry value to be set.</p>
 </p></li><li>persistent : <span class='text-info'>BOOLEAN</span><p>
<p>Whether or not to create a corresponding merge file, setting to true will cause your value to persist across a device clean boot. A .reg file is written to the \Application folder on the device to persist the setting.</p>
 </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:

* BOOLEAN : 
<p>Whether or not the registry key was successfully set.</p>


####Platforms

* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.setRegistrySetting(<span class="text-info">HASH</span> propertyMap)</code> 


### setScreenRotationNotification(<span class="text-info">STRING</span> url, <span class="text-info">STRING</span> url_params)
<p>Use ScreenOrientation.setScreenOrientationEvent: Notify (call a callback method) when the screen rotates.</p>


####Parameters
<ul><li>url : <span class='text-info'>STRING</span><p>
<p>URL of the callback method. If empty, unregisters notification callback.</p>
 </p></li><li>url_params : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>
<p>Parameters which will be added to callback URL.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.setScreenRotationNotification(<span class="text-info">STRING</span> url, <span class="text-info">STRING</span> url_params)</code> 


### setWindowFrame(<span class="text-info">INTEGER</span> x, <span class="text-info">INTEGER</span> y, <span class="text-info">INTEGER</span> width, <span class="text-info">INTEGER</span> height)
<p>Change application window position and size.</p>


####Parameters
<ul><li>x : <span class='text-info'>INTEGER</span><p>
<p>Left corner of window.</p>
 </p></li><li>y : <span class='text-info'>INTEGER</span><p>
<p>Top corner of window.</p>
 </p></li><li>width : <span class='text-info'>INTEGER</span><p>
<p>Width of window.</p>
 </p></li><li>height : <span class='text-info'>INTEGER</span><p>
<p>Height of window.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.setWindowFrame(<span class="text-info">INTEGER</span> x, <span class="text-info">INTEGER</span> y, <span class="text-info">INTEGER</span> width, <span class="text-info">INTEGER</span> height)</code> 


### setWindowPosition(<span class="text-info">INTEGER</span> x, <span class="text-info">INTEGER</span> y)
<p>Change application window position.</p>


####Parameters
<ul><li>x : <span class='text-info'>INTEGER</span><p>
<p>Left corner of window.</p>
 </p></li><li>y : <span class='text-info'>INTEGER</span><p>
<p>Top corner of window.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.setWindowPosition(<span class="text-info">INTEGER</span> x, <span class="text-info">INTEGER</span> y)</code> 


### setWindowSize(<span class="text-info">INTEGER</span> width, <span class="text-info">INTEGER</span> height)
<p>Change application window size.</p>


####Parameters
<ul><li>width : <span class='text-info'>INTEGER</span><p>
<p>Width of the window.</p>
 </p></li><li>height : <span class='text-info'>INTEGER</span><p>
<p>Width of the of window.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.setWindowSize(<span class="text-info">INTEGER</span> width, <span class="text-info">INTEGER</span> height)</code> 


### set_application_icon_badge(<span class="text-info">INTEGER</span> badgeNumber)
<p>Use System.applicationIconBadge: Set the application icon to have this badge number. Set to 0 (zero) to remove badge.iOS only.</p>


####Parameters
<ul><li>badgeNumber : <span class='text-info'>INTEGER</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.set_application_icon_badge(<span class="text-info">INTEGER</span> badgeNumber)</code> 


### set_http_proxy_url(<span class="text-info">STRING</span> proxyURI)
<p>Use System.httpProxyURI property: To use client with the HTTP proxy.</p>


####Parameters
<ul><li>proxyURI : <span class='text-info'>STRING</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.set_http_proxy_url(<span class="text-info">STRING</span> proxyURI)</code> 


### set_locale(<span class="text-info">STRING</span> locale_code, <span class="text-info">STRING</span> country_code)
<p>Use Application.setLocale method: set application specific locale.</p>


####Parameters
<ul><li>locale_code : <span class='text-info'>STRING</span><p> </p></li><li>country_code : <span class='text-info'>STRING</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.set_locale(<span class="text-info">STRING</span> locale_code, <span class="text-info">STRING</span> country_code)</code> 


### set_sleeping(<span class="text-info">BOOLEAN</span> enable)
<p>Use System.screenSleeping property: enable / disable phone sleeping.</p>


####Parameters
<ul><li>enable : <span class='text-info'>BOOLEAN</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.set_sleeping(<span class="text-info">BOOLEAN</span> enable)</code> 


### startTimer(<span class="text-info">INTEGER</span> interval, <span class="text-info">STRING</span> url, <span class="text-info">STRING</span> url_params)
<p>Use Timer.start: start timer.</p>


####Parameters
<ul><li>interval : <span class='text-info'>INTEGER</span><p>
<p>Timer interval.</p>
 </p></li><li>url : <span class='text-info'>STRING</span><p>
<p>URL of the callback method.</p>
 </p></li><li>url_params : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>
<p>Parameters which will be added to callback URL.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.startTimer(<span class="text-info">INTEGER</span> interval, <span class="text-info">STRING</span> url, <span class="text-info">STRING</span> url_params)</code> 


### stopTimer(<span class="text-info">STRING</span> url)
<p>Use Timer.stop: stop timer.</p>


####Parameters
<ul><li>url : <span class='text-info'>STRING</span><p>
<p>URL of the callback method which identify the timer to stop.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.stopTimer(<span class="text-info">STRING</span> url)</code> 


### unset_http_proxy()
<p>Use System.httpProxyURI property: Stop using HTTP proxy that was set by the command line, rhoconfig.txt or set_http_proxy_url.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.unset_http_proxy()</code> 


### unzipFile(<span class="text-info">STRING</span> localPathToZip, <span class="text-info">STRING</span> password)
<p>Unzip file.</p>


####Parameters
<ul><li>localPathToZip : <span class='text-info'>STRING</span><p>
<p>The path to the file to be unzipped. Application should have write permissions to this folder.</p>
 </p></li><li>password : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>
<p>Password for the zip.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.unzipFile(<span class="text-info">STRING</span> localPathToZip, <span class="text-info">STRING</span> password)</code> 


### updateBlobAttribs(<span class="text-info">STRING</span> partition, <span class="text-info">INTEGER</span> sourceID)
<p>Use Database.updateBlobAttribs: update model blob attributes list.</p>


####Parameters
<ul><li>partition : <span class='text-info'>STRING</span><p> </p></li><li>sourceID : <span class='text-info'>INTEGER</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.updateBlobAttribs(<span class="text-info">STRING</span> partition, <span class="text-info">INTEGER</span> sourceID)</code> 


### zipFile(<span class="text-info">STRING</span> localPathToZip, <span class="text-info">STRING</span> localPathToFile, <span class="text-info">STRING</span> password)
<p>Zip one file. Zip archive must placed to the folder where application can write files.</p>


####Parameters
<ul><li>localPathToZip : <span class='text-info'>STRING</span><p>
<p>The path to the specified zip. Application should have write permissions to this folder.</p>
 </p></li><li>localPathToFile : <span class='text-info'>STRING</span><p>
<p>The path to the file to be zipped.</p>
 </p></li><li>password : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>
<p>Password for the zip.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.zipFile(<span class="text-info">STRING</span> localPathToZip, <span class="text-info">STRING</span> localPathToFile, <span class="text-info">STRING</span> password)</code> 


### zipFiles(<span class="text-info">STRING</span> localPathToZip, <span class="text-info">STRING</span> basePath, <span class="text-info">ARRAY</span> filePathsToZip, <span class="text-info">STRING</span> password)
<p>Zip list of files.</p>


####Parameters
<ul><li>localPathToZip : <span class='text-info'>STRING</span><p>
<p>The path to the specified zip.</p>
 </p></li><li>basePath : <span class='text-info'>STRING</span><p>
<p>Base path to the files to be zipped.</p>
 </p></li><li>filePathsToZip : <span class='text-info'>ARRAY</span><p>
<p>List of file paths to be zipped.</p>
 </p></li><li>password : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>
<p>Password for the zip.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.System.zipFiles(<span class="text-info">STRING</span> localPathToZip, <span class="text-info">STRING</span> basePath, <span class="text-info">ARRAY</span> filePathsToZip, <span class="text-info">STRING</span> password)</code> 


##Properties



###applicationIconBadge

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Set the application icon to have this badge number. Set to 0 (zero) to remove badge.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.applicationIconBadge</code>


###country

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>Current device country code.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.country</code>



####Platforms

* Android
* Windows Mobile/CE

###deviceName

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>Name of device application running on. Examples: &lsquo;9000&rsquo; (BB), &lsquo;iPhone&rsquo;, &lsquo;dream&rsquo; (Android).</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.deviceName</code>



####Platforms

* Android
* Windows Mobile/CE

###deviceOwnerEmail

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>Primary email of phone owner. To access this property &lsquo;pim&rsquo; capability must be enabled in your build.yml.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.deviceOwnerEmail</code>



####Platforms

* Android

###deviceOwnerName

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>Name(account name) of phone owner. To access this property &lsquo;pim&rsquo; capability must be enabled in your build.yml.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.deviceOwnerName</code>



####Platforms

* Android

###<span class="text-info">devicePushId</span>

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description
<span class='label label-info'>Replaces:deviceId</span> 
<p>Push notifications device ID which may be used to receive push messages.To get this ID , Push service should be configured on the device. Please refer to Push documentation.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.devicePushId</code>



####Platforms

* Android
* Windows Mobile/CE

###freeServerPort

####Type
<span class='text-info'>INTEGER</span> <span class='label'>Read Only</span>
####Description

<p>Get free local server port, available for binding.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.freeServerPort</code>



####Platforms

* Android
* Windows Mobile/CE

###hasCalendar

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description

<p>Returns true if calendar support is available.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.hasCalendar</code>



####Platforms

* Android
* Windows Mobile/CE

###hasCamera

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description

<p>Returns true if there is a camera available on the device.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.hasCamera</code>



####Platforms

* Android
* Windows Mobile/CE

###<span class="text-error">hasCellNetwork</span>

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description
<span class='label label-important'>Deprecated</span> 
<p>Use Network.hasCellNetwork to tell if device is connected to the cell network.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.hasCellNetwork</code>



####Platforms

* Android
* Windows Mobile/CE

###<span class="text-error">hasNetwork</span>

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description
<span class='label label-important'>Deprecated</span> 
<p>Use Network.hasNetwork to tell if the device is connected to the network.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.hasNetwork</code>



####Platforms

* Android
* Windows Mobile/CE

###<span class="text-error">hasSqlite</span>

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description
<span class='label label-important'>Deprecated</span> 
<p>Returns true if the device has sqlite capabilities (previously only BlackBerry did not support this).</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.hasSqlite</code>



####Platforms

* Android
* Windows Mobile/CE

###hasTouchscreen

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description

<p>Returns true if the device has touch screen capabilities.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.hasTouchscreen</code>



####Platforms

* Android
* Windows Mobile/CE

###<span class="text-error">hasWifiNetwork</span>

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description
<span class='label label-important'>Deprecated</span> 
<p>Use Network.hasWifiNetwork to tell if the device is connected to the wifi network.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.hasWifiNetwork</code>



####Platforms

* Android
* Windows Mobile/CE

###<span class="text-info">httpProxyURI</span>

####Type
<span class='text-info'>STRING</span> 
####Description
<span class='label label-info'>Replaces:http_proxy_url</span> 
<p>Set HTTP proxy parameters for using by Network module. Example: user:password@url:port . Support only basic authentication. Setting the property overrides http_proxy_uri (or http_proxy_host, http_proxy_port, http_proxy_user, http_proxy_password). To set proxy for Motorola WebKit for Windows Mobile/CE use config.xml settings.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.httpProxyURI</code>



####Platforms

* Android
* Windows Mobile/CE

###isEmulator

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description

<p>Returns true if the application is running on a platform emulator.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.isEmulator</code>



####Platforms

* Android
* Windows Mobile/CE

###isMotorolaDevice

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description

<p>Returns true if the device supports Motorola device capabilities. APIs will indicate if the property or method is available on MSI devices only. You can use this property to help your application decide when to take advantage of advanced MSI capabilities.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.isMotorolaDevice</code>



####Platforms

* Android
* Windows Mobile/CE

###keyboardState

####Type
<span class='text-info'>STRING</span> 
####Description

<p>For Windows Mobile and Windows CE the keyboard can be manually shown or hidden as required. All other platforms only support &lsquo;automatic&rsquo;. The default state for Windows Mobile and Windows CE is manual, for all other platforms it is automatic.</p>

####Params
<p><strong>Default:</strong> See Description</p>
####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.System.KEYBOARD_SHOWN - String: shown 
<p>Shows the on screen keyboard, after setting the keyboard to shown or hidden it will no longer appear / disappear automatically until you set this property to automatic.</p>

* Constant: EB.System.KEYBOARD_HIDDEN - String: hidden 
<p>Hides the on screen keyboard, after setting the keyboard to shown or hidden it will no longer appear / disappear automatically until you set this property to automatic. This is most useful if your device has a hardware keyboard or you are scanning / capturing data to an input field.</p>

* Constant: EB.System.KEYBOARD_AUTOMATIC - String: automatic 
<p>Automatically shows or hides the keyboard as needed by the application.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.keyboardState</code>



####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only

###localServerPort

####Type
<span class='text-info'>INTEGER</span> <span class='label'>Read Only</span>
####Description

<p>Port of the local (embedded) HTTP server. This parameter is mainly for debug purposes. If not specified, the platform will detect a free port on the device and use that one.</p>

####Params
<p><strong>Default:</strong> 8080</p>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.localServerPort</code>



####Platforms

* Android
* Windows Mobile/CE

###locale

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>Current device locale Like &lsquo;en&rsquo;, &lsquo;ru&rsquo; etc.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.locale</code>



####Platforms

* Android
* Windows Mobile/CE

###lockWindowSize

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Lock / unlock the window size change by the user. When running on RhoSimulator, this method is supported only for Windows OS.</p>

####Params
<p><strong>Default:</strong> false</p>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.lockWindowSize</code>


###oemInfo

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>The OEM Information string for the terminal.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.oemInfo</code>



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only

###osVersion

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>Version OS of device. Examples:  &lsquo;4.1&rsquo; (Android).</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.osVersion</code>



####Platforms

* Android
* Windows Mobile/CE

###phoneId

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>Hardware based ID. It depends on capabilities configured for an application and has to remain same even across application uninstall/install.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.phoneId</code>



####Platforms

* Android
* Windows Mobile/CE

###platform

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>Platform where application is running.</p>

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
* Windows Mobile/CE

###ppiX

####Type
<span class='text-info'>INTEGER</span> <span class='label'>Read Only</span>
####Description

<p>Horizontal PPI (Pixels Per Inch).</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.ppiX</code>



####Platforms

* Android
* Windows Mobile/CE

###ppiY

####Type
<span class='text-info'>INTEGER</span> <span class='label'>Read Only</span>
####Description

<p>Vertical PPI (Pixels Per Inch).</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.ppiY</code>



####Platforms

* Android
* Windows Mobile/CE

###realScreenHeight

####Type
<span class='text-info'>INTEGER</span> <span class='label'>Read Only</span>
####Description

<p>Screen height in real pixels.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.realScreenHeight</code>



####Platforms

* Android
* Windows Mobile/CE

###realScreenWidth

####Type
<span class='text-info'>INTEGER</span> <span class='label'>Read Only</span>
####Description

<p>Screen width in real pixels.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.realScreenWidth</code>



####Platforms

* Android
* Windows Mobile/CE

###screenAutoRotate

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Screen auto rotate.</p>

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

<p>Screen height in logical pixels (used for set coordinates).</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.screenHeight</code>



####Platforms

* Android
* Windows Mobile/CE

###screenOrientation

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>Current screen orientation.</p>

####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.System.SCREEN_PORTRAIT - String: portrait 
<p>The return value if the screen is in portrait mode.</p>

* Constant: EB.System.SCREEN_LANDSCAPE - String: landscape 
<p>The return value if the screen is in landscape mode.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.screenOrientation</code>



####Platforms

* Android
* Windows Mobile/CE

###screenSleeping

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>If true, then screen will go to sleep by system inactivity timeout. If false then screen never go to sleep while application is in foreground.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.screenSleeping</code>



####Platforms

* Android

###screenWidth

####Type
<span class='text-info'>INTEGER</span> <span class='label'>Read Only</span>
####Description

<p>Screen width in logical pixels (used for set coordinates).</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.screenWidth</code>



####Platforms

* Android
* Windows Mobile/CE

###uuid

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>The Unique Unit IDentifier for the terminal.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.uuid</code>



####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only

###webviewFramework

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>Browser framework identity string.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.System.webviewFramework</code>



####Platforms

* Android
* Windows Mobile/CE