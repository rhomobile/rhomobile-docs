#Application


## Overview
The Application class is used for accessing or setting application level configuration settings.
## Enabling the API
There are two methods of enabling the Application API:

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
To include single APIs, you must first include the `ebapi.js` in your HTML as well as the API file you want to use. For instance, to use the Application API, I would add the following code to my HTML file(s), assuming the API files have been copied to the same directory as the HTML.

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi.js"></script>
    <script type="text/javascript" charset="utf-8" src="eb.application.js"></script>

The ebapi.js file is necessary for all single API inclusions.

        


##Methods



### databaseFilePath(<span class="text-info">STRING</span> partitionName)
Path to the ORM database file by partition name. Please note that this function does not create a database file. This function only generates the file path based on the application path and partition name.

####Parameters
<ul><li>partitionName : <span class='text-info'>STRING</span><p>Partition name. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING : Full path to the database file for given partition.

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Application.databaseFilePath(<span class="text-info">STRING</span> partitionName)</code> 


### expandDatabaseBlobFilePath(<span class="text-info">STRING</span> relativePath)
Generates the absolute path to database blob file. Please note that this function does not the create database file. This function only generates the file path based on application path and partition name.

####Parameters
<ul><li>relativePath : <span class='text-info'>STRING</span><p>Relative path to the blob file, as it is stored in the database. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING : Full path to the database blob.

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Application.expandDatabaseBlobFilePath(<span class="text-info">STRING</span> relativePath)</code> 


### minimize()
Minimize or move the application to background. 

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Application.minimize()</code> 


### modelFolderPath(<span class="text-info">STRING</span> name)
Folder of the model by name.

####Parameters
<ul><li>name : <span class='text-info'>STRING</span><p>Model name. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Application.modelFolderPath(<span class="text-info">STRING</span> name)</code> 


### quit()
Quit the application. Quitting the application while license screen is shown will be slightly delayed.

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
	* <code>EB.Application.quit()</code> 


### relativeDatabaseBlobFilePath(<span class="text-info">STRING</span> absolutePath)
Generates the relative path to database blob file. Please note that this function does not create a database file. This function only generates the file path based on the application path and partition name.

####Parameters
<ul><li>absolutePath : <span class='text-info'>STRING</span><p>Absolute path to database blob file. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Application.relativeDatabaseBlobFilePath(<span class="text-info">STRING</span> absolutePath)</code> 


### restore()
Restores the application to be in the foreground.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Application.restore()</code> 


### setApplicationNotify()
This method allows your application to register for application specific events like application activation/deactivation, UI creation/destruction as well as others. Check the Callback section for details.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>applicationEvent : <span class='text-info'>STRING</span><p> </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>Constant: EB.Application.APP_EVENT_ACTIVATED <br/> String:Activated</dt><dd>The application has been activated.</dd><dt>Constant: EB.Application.APP_EVENT_DEACTIVATED <br/> String:Deactivated</dt><dd>The application has been deactivated.</dd><dt>Constant: EB.Application.APP_EVENT_UIDESTROYED <br/> String:UIDestroyed</dt><dd>This event is triggered when the application is closing and the UI has been cleared.</dd><dt>Constant: EB.Application.APP_EVENT_SCREEN_OFF <br/> String:ScreenOff</dt><dd>Device screen was turned off when power button was pressed or due to idle timeout. On Android the application is not deactivated.Not supported on Windows CE. Platforms: 
Android, WM</dd><dt>Constant: EB.Application.APP_EVENT_SCREEN_ON <br/> String:ScreenOn</dt><dd>Device screen was turned on and unlocked.Not supported on Windows CE. Platforms: 
Android, WM</dd></dl></li><li>eventData : <span class='text-info'>HASH</span><p>This will only contain values for the `APP_EVENT_CONFIGCONFLICT` event. This event may be triggered after an application was upgraded. If your rhoconfig.txt file contains custom properties that are different then what is being provided in the application upgrade package. By default local values are kept in place but you may overwrite configuration with new values and any other steps required for your application upgrade. `eventData` will be a hash. It will look like {"conflicting key" : ["new value","old value"].. } </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Application.setApplicationNotify()</code> 


##Properties



###appName

####Type
<span class='text-info'>STRING</span> <span class='label label-warning'>Read Only</span>
####Description
Application name.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Application.appName</code>



####Platforms

* Android
* Windows Mobile
* Windows CE

###badLinkURI

####Type
<span class='text-info'>STRING</span> <span class='label label-warning'>Read Only</span>
####Description
Bad link URI to navigate in browser. This is defined in config.xml: Navigation\\BadLinkURI.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Application.badLinkURI</code>



####Platforms

* Windows Mobile(WebKit)

###bundleFolder

####Type
<span class='text-info'>STRING</span> <span class='label label-warning'>Read Only</span>
####Description
Path to the Enterprise Browser folder on the device.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Application.bundleFolder</code>



####Platforms

* Android
* Windows Mobile
* Windows CE

###configPath

####Type
<span class='text-info'>STRING</span> <span class='label label-warning'>Read Only</span>
####Description
Path to the configuration file.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Application.configPath</code>



####Platforms

* Android
* Windows Mobile
* Windows CE

###databaseBlobFolder

####Type
<span class='text-info'>STRING</span> <span class='label label-warning'>Read Only</span>
####Description
Path to folder where the database blob files are stored. Blobs are usually images or binary files. In the ORM Model you would specify that the attribute is of type blob Ex. When capturing an image, the actual file is saved in the databaseBlobFolder.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Application.databaseBlobFolder</code>



####Platforms

* Android
* Windows Mobile
* Windows CE

###defaultNativeMenu

####Type
<span class='text-info'>ARRAY</span> <span class='label label-warning'>Read Only</span>
####Description
Native Menu items.
####Params
<li><i>Object</i> : <span class='text-info'>HASH</span><p>Same values as nativeMenu. </p></li>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Application.defaultNativeMenu</code>



####Platforms

* Android
* Windows Mobile
* Windows CE

###invalidSecurityTokenStartPath

####Type
<span class='text-info'>STRING</span> <span class='label label-warning'>Read Only</span>
####Description
Page to navigate to in case of check of SecurityToken failed. Can be set in rhoconfig.txt: invalid_security_token_start_path; This file is located in the installation folder of the EnetrpriseBrowser application installed on the device.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Application.invalidSecurityTokenStartPath</code>



####Platforms

* Android
* Windows Mobile
* Windows CE

###modelsManifestPath

####Type
<span class='text-info'>STRING</span> <span class='label label-warning'>Read Only</span>
####Description
Path to file with the model list.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Application.modelsManifestPath</code>



####Platforms

* Android
* Windows Mobile
* Windows CE

###nativeMenu

####Type
<span class='text-info'>ARRAY</span> 
####Description
Native Menu items. To customise the native application menu and controller menu items in ruby follow [Application Menu API](http://docs.rhomobile.com/en/2.2.0/rhodesapi/menu-apis)
####Params
<li><i>Object</i> : <span class='text-info'>HASH</span><p> </p></li><ul><li>label : <span class='text-info'>STRING</span><p>Visible label. </p></li><li>action : <span class='text-info'>STRING</span><p>URL to page which will be loaded. Or it can be a JavaScript method to call: 'javascript: methodOnTab();'. Or path to html page to load. </p></li></ul>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Application.nativeMenu</code>



####Platforms

* Android
* Windows Mobile
* Windows CE

###publicFolder

####Type
<span class='text-info'>STRING</span> <span class='label label-warning'>Read Only</span>
####Description
Path to the application's public folder.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Application.publicFolder</code>



####Platforms

* Android
* Windows Mobile
* Windows CE

###securityTokenNotPassed

####Type
<span class='text-info'>BOOLEAN</span> <span class='label label-warning'>Read Only</span>
####Description
Indicates if the security token check was failed. Security token can be passed as command line parameter '-security_token=token_value' to the application. If security token check failed : if this page exist then application navigate to it, otherwise application will exit.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Application.securityTokenNotPassed</code>



####Platforms

* Android
* Windows Mobile
* Windows CE

###settingsPageURI

####Type
<span class='text-info'>STRING</span> 
####Description
Settings page URI. Will be used when Options menu or toolbar item is chosen by user.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Application.settingsPageURI</code>



####Platforms

* Android
* Windows Mobile
* Windows CE

###splash

####Type
<span class='text-info'>STRING</span> <span class='label label-warning'>Read Only</span>
####Description
Splash screen image display options. This a string with several parameters divided by ';': delay=5;center;hcenter;vcenter;vzoom;hzoom;zoom.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Application.splash</code>



####Platforms

* Android
* Windows Mobile
* Windows CE

###startURI

####Type
<span class='text-info'>STRING</span> 
####Description
Startup page for your application.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Application.startURI</code>



####Platforms

* Android
* Windows Mobile
* Windows CE

###title

####Type
<span class='text-info'>STRING</span> 
####Description
Define Window caption text. If missed - caption from page used. Not supported on Windows CE devices.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Application.title</code>



####Platforms

* Windows Mobile

###userFolder

####Type
<span class='text-info'>STRING</span> <span class='label label-warning'>Read Only</span>
####Description
Path to folder where the application can write files and create subfolders.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Application.userFolder</code>



####Platforms

* Android
* Windows Mobile
* Windows CE

###version

####Type
<span class='text-info'>STRING</span> <span class='label label-warning'>Read Only</span>
####Description
Version of Enterprise Browser.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Application.version</code>



####Platforms

* Android
* Windows Mobile
* Windows CE