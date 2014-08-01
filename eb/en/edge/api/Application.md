#Application


## Overview
The Application class is used for accessing or setting application level configuration settings.
## Enabling the API
In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* ebapi-modules.js - this file contains all available Enterprise Browser APIs

If you wish to minimize the amount of JavaScript being included, you can choose to only include the individual API that your application is using:

ex:

* ebapi.js - core APIs needed 
* eb.application.js - just the Application API
* other individual JavaScript files included with the Enterprise Browser installation

        


##Methods



### databaseFilePath(<span class="text-info">STRING</span> partitionName)
<p>Path to the ORM database file by partition name. Please note that this function does not create a database file. This function only generates the file path based on the application path and partition name.</p>


####Parameters
<ul><li>partitionName : <span class='text-info'>STRING</span><p>
<p>Partition name.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING : 
<p>Full path to the database file for given partition.</p>


####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Application.databaseFilePath(<span class="text-info">STRING</span> partitionName)</code> 


### expandDatabaseBlobFilePath(<span class="text-info">STRING</span> relativePath)
<p>Generates the absolute path to database blob file. Please note that this function does not the create database file. This function only generates the file path based on application path and partition name.</p>


####Parameters
<ul><li>relativePath : <span class='text-info'>STRING</span><p>
<p>Relative path to the blob file, as it is stored in the database.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING : 
<p>Full path to the database blob.</p>


####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Application.expandDatabaseBlobFilePath(<span class="text-info">STRING</span> relativePath)</code> 


### minimize()
<p>Minimize or move the application to background.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Application.minimize()</code> 


### modelFolderPath(<span class="text-info">STRING</span> name)
<p>Folder of the model by name.</p>


####Parameters
<ul><li>name : <span class='text-info'>STRING</span><p>
<p>Model name.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

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
	* <code>EB.Application.modelFolderPath(<span class="text-info">STRING</span> name)</code> 


### quit()
<p>Quit the application.</p>


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
	* <code>EB.Application.quit()</code> 


### relativeDatabaseBlobFilePath(<span class="text-info">STRING</span> absolutePath)
<p>Generates the relative path to database blob file. Please note that this function does not create a database file. This function only generates the file path based on the application path and partition name.</p>


####Parameters
<ul><li>absolutePath : <span class='text-info'>STRING</span><p>
<p>Absolute path to database blob file.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

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
	* <code>EB.Application.relativeDatabaseBlobFilePath(<span class="text-info">STRING</span> absolutePath)</code> 


### restore()
<p>Restores the application to be in the foreground.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Application.restore()</code> 


### setApplicationNotify()
<p>This method allows your application to register for application specific events like application activation/deactivation, UI creation/destruction as well as others. Check the Callback section for details.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>applicationEvent : <span class='text-info'>STRING</span><p>
<p>{}</p>
 </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>Constant: EB.Application.APP_EVENT_ACTIVATED <br/> String:Activated</dt><dd>
<p>The application has been activated.</p>
</dd><dt>Constant: EB.Application.APP_EVENT_DEACTIVATED <br/> String:Deactivated</dt><dd>
<p>The application has been deactivated.</p>
</dd><dt>Constant: EB.Application.APP_EVENT_UIDESTROYED <br/> String:UIDestroyed</dt><dd>
<p>This event is triggered when the application is closing and the UI has been cleared.</p>
</dd><dt>Constant: EB.Application.APP_EVENT_SCREEN_OFF <br/> String:ScreenOff</dt><dd>
<p>Device screen was turned off when power button was pressed or due to idle timeout. On Android the application is not deactivated.Not supported on Windows CE.</p>
 Platforms: 
Android, iOS, WM</dd><dt>Constant: EB.Application.APP_EVENT_SCREEN_ON <br/> String:ScreenOn</dt><dd>
<p>Device screen was turned on and unlocked.Not supported on Windows CE.</p>
 Platforms: 
Android, iOS, WM</dd></dl></li><li>eventData : <span class='text-info'>HASH</span><p>
<p>This will only contain values for the <code>APP_EVENT_CONFIGCONFLICT</code> event. This event may be triggered after an application was upgraded. If your rhoconfig.txt file contains custom properties that are different then what is being provided in the application upgrade package. By default local values are kept in place but you may overwrite configuration with new values and any other steps required for your application upgrade. <code>eventData</code> will be a hash. It will look like {&ldquo;conflicting key&rdquo; : [&ldquo;new value&rdquo;,&ldquo;old value&rdquo;].. }</p>
 </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Application.setApplicationNotify()</code> 


##Properties



###appName

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>Application name.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Application.appName</code>



####Platforms

* Android
* Windows Mobile/CE

###badLinkURI

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>Bad link URI to navigate in browser. This is defined in config.xml: Navigation\BadLinkURI.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Application.badLinkURI</code>



####Platforms

* Windows Mobile/CE(Motorola Solutions' WebKit)

###bundleFolder

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>Path to the Enterprise Browser folder on the device.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Application.bundleFolder</code>



####Platforms

* Android
* Windows Mobile/CE

###configPath

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>Path to the configuration file.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Application.configPath</code>



####Platforms

* Android
* Windows Mobile/CE

###databaseBlobFolder

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>Path to folder where the database blob files are stored. Blobs are usually images or binary files. In the ORM Model you would specify that the attribute is of type blob Ex. When capturing an image, the actual file is saved in the databaseBlobFolder.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Application.databaseBlobFolder</code>



####Platforms

* Android
* Windows Mobile/CE

###defaultNativeMenu

####Type
<span class='text-info'>ARRAY</span> <span class='label'>Read Only</span>
####Description

<p>Native Menu items.</p>

####Params
<li><i>Object</i> : <span class='text-info'>HASH</span><p>
<p>Same values as nativeMenu.</p>
 </p></li>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Application.defaultNativeMenu</code>



####Platforms

* Android
* Windows Mobile/CE

###invalidSecurityTokenStartPath

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>Page to navigate to in case of check of SecurityToken failed. Can be set in rhoconfig.txt: invalid_security_token_start_path; This file is located in the installation folder of the EnetrpriseBrowser application installed on the device.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Application.invalidSecurityTokenStartPath</code>



####Platforms

* Android
* Windows Mobile/CE

###modelsManifestPath

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>Path to file with the model list.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Application.modelsManifestPath</code>



####Platforms

* Android
* Windows Mobile/CE

###nativeMenu

####Type
<span class='text-info'>ARRAY</span> 
####Description

<p>Native Menu items.</p>

####Params
<li><i>Object</i> : <span class='text-info'>HASH</span><p> </p></li><ul><li>label : <span class='text-info'>STRING</span><p>
<p>Visible label.</p>
 </p></li><li>action : <span class='text-info'>STRING</span><p>
<p>URL to page which will be loaded. Or it can be a JavaScript method to call: &lsquo;javascript: methodOnTab();&rsquo;. Or path to html page to load.</p>
 </p></li></ul>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Application.nativeMenu</code>



####Platforms

* Android
* Windows Mobile/CE

###publicFolder

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>Path to the application&rsquo;s public folder.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Application.publicFolder</code>



####Platforms

* Android
* Windows Mobile/CE

###securityTokenNotPassed

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description

<p>Indicates if the security token check was failed. Security token can be passed as command line parameter &lsquo;-security_token=token_value&rsquo; to the application. If security token check failed : if this page exist then application navigate to it, otherwise application will exit.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Application.securityTokenNotPassed</code>



####Platforms

* Android
* Windows Mobile/CE

###settingsPageURI

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Settings page URI. Will be used when Options menu or toolbar item is chosen by user.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Application.settingsPageURI</code>



####Platforms

* Android
* Windows Mobile/CE

###splash

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>Splash screen image display options. This a string with several parameters divided by &lsquo;;&rsquo;: delay=5;center;hcenter;vcenter;vzoom;hzoom;zoom.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Application.splash</code>



####Platforms

* Android
* Windows Mobile/CE

###startURI

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Startup page for your application.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Application.startURI</code>



####Platforms

* Android
* Windows Mobile/CE

###title

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Define Window caption text. If missed &ndash; caption from page used. Not supported on Windows CE devices.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Application.title</code>



####Platforms

* Windows Mobile/CE

###userFolder

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>Path to folder where the application can write files and create subfolders.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Application.userFolder</code>



####Platforms

* Android
* Windows Mobile/CE

###version

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>Version of Enterprise Browser.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Application.version</code>



####Platforms

* Android
* Windows Mobile/CE