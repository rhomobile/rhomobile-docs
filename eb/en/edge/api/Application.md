#Application


## Overview
<p>The Application class is used for accessing or setting application level configuration settings.</p>
<h2>Enabling the API</h2>

<p>This API is part of the <code>coreapi</code> extension that is included automatically.</p>

<pre><code>:::ruby
extensions: ["coreapi"]
</code></pre>

<h2>JavaScript Usage</h2>

<p>Be sure to review the <a href="/guide/api_js">JavaScript API Usage</a> guide for important information about using this API in JavaScript</p>

<h2>Ruby Usage</h2>

<p>Be sure to review the <a href="/guide/api_ruby">Ruby API Usage</a> guide for important information about using this API in Ruby</p>



##Methods



### databaseFilePath(<span class="text-info">STRING</span> partitionName)
Path to database file by partition name. Please note that this function does not create a database file. This function only generates the file path based on the application path and partition name.

####Parameters
<ul><li>partitionName : <span class='text-info'>STRING</span><p>
Partition name. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>STRING : 
Full path to the database file for given partition.</li></ul>

####Platforms

* Android
* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Application.databaseFilePath(<span class="text-info">STRING</span> partitionName)</code> </li></ul></li></ul>

### expandDatabaseBlobFilePath(<span class="text-info">STRING</span> relativePath)
Generates the absolute path to database blob file. Please note that this function does not the create database file. This function only generates the file path based on application path and partition name.

####Parameters
<ul><li>relativePath : <span class='text-info'>STRING</span><p>
Relative path to the blob file, as it is stored in the database. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>STRING : 
Full path to the database blob.</li></ul>

####Platforms

* Android
* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Application.expandDatabaseBlobFilePath(<span class="text-info">STRING</span> relativePath)</code> </li></ul></li></ul>

### minimize()
Minimize or move the application to background. When running in RhoSimulator this method is supported only for Windows OS.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Application.minimize()</code> </li></ul></li></ul>

### modelFolderPath(<span class="text-info">STRING</span> name)
Folder of the model by name.

####Parameters
<ul><li>name : <span class='text-info'>STRING</span><p>
Model name. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>STRING</li></ul>

####Platforms

* Android
* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Application.modelFolderPath(<span class="text-info">STRING</span> name)</code> </li></ul></li></ul>

### quit()
Quit the application.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Application.quit()</code> </li></ul></li></ul>

### relativeDatabaseBlobFilePath(<span class="text-info">STRING</span> absolutePath)
Generates the relative path to database blob file. Please note that this function does not create a database file. This function only generates the file path based on the application path and partition name.

####Parameters
<ul><li>absolutePath : <span class='text-info'>STRING</span><p>
Absolute path to database blob file. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>STRING</li></ul>

####Platforms

* Android
* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Application.relativeDatabaseBlobFilePath(<span class="text-info">STRING</span> absolutePath)</code> </li></ul></li></ul>

### restore()
Restores the application to be in the foreground. When running in RhoSimulator the method is supported only for windows OS.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Application.restore()</code> </li></ul></li></ul>

### setApplicationNotify()
This method allows your application to register for application specific events like application activation/deactivation, UI creation/destruction as well as others. Check the Callback tab for details.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>applicationEvent : <span class='text-info'>STRING</span><p>
{} </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>Constant: EB.Application.APP_EVENT_ACTIVATED <br/> String:Activated</dt><dd>
The application has been activated.</dd><dt>Constant: EB.Application.APP_EVENT_DEACTIVATED <br/> String:Deactivated</dt><dd>
The application has been deactivated.</dd><dt>Constant: EB.Application.APP_EVENT_UICREATED <br/> String:UICreated</dt><dd>
Generated before the start page is loaded. There are no means to set callback and catch event in javascript. Ruby Application class descendant can to set callback and process this event.</dd><dt>Constant: EB.Application.APP_EVENT_UIDESTROYED <br/> String:UIDestroyed</dt><dd>
This event is triggered when the application is closing and the UI has been cleared.</dd><dt>Constant: EB.Application.APP_EVENT_SCREEN_OFF <br/> String:ScreenOff</dt><dd>
Device screen was turned off when power button was pressed or due to idle timeout. NB: On iOS application is also deactivated (APP_EVENT_DEACTIVATED is fired). On Android the application is not deactivated.Not supported on Windows CE. Platforms: 
Android, iOS, WM</dd><dt>Constant: EB.Application.APP_EVENT_SCREEN_ON <br/> String:ScreenOn</dt><dd>
Device screen was turned on and unlocked.Not supported on Windows CE. Platforms: 
Android, iOS, WM</dd><dt>Constant: EB.Application.APP_EVENT_SYNCUSERCHANGED <br/> String:SyncUserChanged</dt><dd>
Event when the current RhoConnect user has changed. This is available under Ruby Only.</dd><dt>Constant: EB.Application.APP_EVENT_CONFIGCONFLICT <br/> String:ConfigConflict</dt><dd>
This is available under Ruby Only.</dd><dt>Constant: EB.Application.APP_EVENT_DBMIGRATESOURCE <br/> String:DBMigrateSource</dt><dd>
This is available under Ruby Only.</dd></dl></li><li>eventData : <span class='text-info'>HASH</span><p>
This will only contain values for the `APP_EVENT_CONFIGCONFLICT` event. This event may be triggered after an application was upgraded. If your rhoconfig.txt file contains custom properties that are different then what is being provided in the application upgrade package. By default local values are kept in place but you may overwrite configuration with new values and any other steps required for your application upgrade. `eventData` will be a hash. It will look like {"conflicting key" : ["new value","old value"].. } </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Application.setApplicationNotify()</code> </li></ul></li></ul>

##Properties



###appBundleFolder

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

Path to apps/app folder inside the application bundle.
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.Application.appBundleFolder</code> </li></ul></li></ul>

###appName

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

Application name.
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.Application.appName</code> </li></ul></li></ul>

###appsBundleFolder

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

Path to apps folder inside the application bundle.
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.Application.appsBundleFolder</code> </li></ul></li></ul>

###badLinkURI

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

Bad link URI to navigate in browser. This is defined in config.xml: Navigation\\BadLinkURI.
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.Application.badLinkURI</code> </li></ul></li></ul>

###bundleFolder

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

Path to application bundle folder.
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.Application.bundleFolder</code> </li></ul></li></ul>

###configPath

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

Path to the configuration file.
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.Application.configPath</code> </li></ul></li></ul>

###databaseBlobFolder

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

Path to folder where the database blob files are stored. Blobs are usually images or binary files. In the ORM Model you would specify that the attribute is of type blob Ex. When capturing an image, the actual file is saved in the databaseBlobFolder.
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.Application.databaseBlobFolder</code> </li></ul></li></ul>

###defaultNativeMenu

####Type
<span class='text-info'>ARRAY</span> <span class='label'>Read Only</span>
####Description

Native Menu items.
####Params
<li><i>Object</i> : <span class='text-info'>HASH</span><p>
Same values as nativeMenu. </p></li>
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.Application.defaultNativeMenu</code> </li></ul></li></ul>

###invalidSecurityTokenStartPath

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

Page to navigate to in case of check of SecurityToken failed. Can be set in rhoconfig.txt: invalid_security_token_start_path;
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.Application.invalidSecurityTokenStartPath</code> </li></ul></li></ul>

###modelsManifestPath

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

Path to file with the model list.
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.Application.modelsManifestPath</code> </li></ul></li></ul>

###nativeMenu

####Type
<span class='text-info'>ARRAY</span> 
####Description

Native Menu items.
####Params
<li><i>Object</i> : <span class='text-info'>HASH</span><p> </p></li><ul><li>label : <span class='text-info'>STRING</span><p>
Visible label. </p></li><li>action : <span class='text-info'>STRING</span><p>
URL to page which will be loaded into tab. It may be path to Ruby controller action; i.e. '/app/Account' would load the Account index action. For ruby callback use 'callback:/app/Account' Or JavaScript method to call: 'javascript: methodOnTab();'. Or path to html page to load. </p></li></ul>
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.Application.nativeMenu</code> </li></ul></li></ul>

###publicFolder

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

Path to the application's public folder.
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.Application.publicFolder</code> </li></ul></li></ul>

###securityTokenNotPassed

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description

Is the security token check was failed. Security token can be set in build.yml: security_token. Same security token should be passed as command line parameter '-security_token=token_value' to application. If security token check failed : if this page exist then application navigate to it, otherwise application will exit.
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.Application.securityTokenNotPassed</code> </li></ul></li></ul>

###settingsPageURI

####Type
<span class='text-info'>STRING</span> 
####Description

Settings page URI. Will be used when Options menu or toolbar item is chosen by user.
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.Application.settingsPageURI</code> </li></ul></li></ul>

###splash

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

Splash screen image display options. This a string with several parameters divided by ';': delay=5;center;hcenter;vcenter;vzoom;hzoom;zoom.
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.Application.splash</code> </li></ul></li></ul>

###startURI

####Type
<span class='text-info'>STRING</span> 
####Description

Startup page for your application.
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.Application.startURI</code> </li></ul></li></ul>

###title

####Type
<span class='text-info'>STRING</span> 
####Description

Define Window caption text. If missed - caption from page used. Not supported on Windows CE devices.
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.Application.title</code> </li></ul></li></ul>

###userFolder

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

Path to folder where the application can write files and create subfolders.
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.Application.userFolder</code> </li></ul></li></ul>

###version

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

Version from build time configuration file (build.yml).
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.Application.version</code> </li></ul></li></ul>

##Examples



###Set the locale

If your application is internationalized, you may want to set the locale depending on the user's preference.
<pre><code>:::javascript
           
Rho.Application.setLocale('en')
var current_locale = Rho.Application.locale();
alert(current_locale)
                   
                 
</code></pre>

###Get folders where items are stored

There are times where you need access to files bundled with your application, or to write files to a safe folder. These examples show how to retrieve each of the several important folders available.
<pre><code>:::javascript
           
     // Get and show the various app folders
     var appFolder = Rho.Application.appBundleFolder;
     var appsBundleFolder = Rho.Application.appsBundleFolder;
     var databaseBlobFolder = Rho.Application.databaseBlobFolder;
     var publicFolder = Rho.Application.publicFolder;
     var userFolder = Rho.Application.userFolder;
     
     var message = "App bundle folder: "+appFolder+"\n"+
     "Apps bundle folder: "+appsBundleFolder+"\n"+ 
     "Database blob folder: "+databaseBlobFolder+"\n"+ 
     "Public folder: "+publicFolder+"\n"+ 
     "User folder: "+userFolder;
     
     alert(message);
                   
                 
</code></pre>

###Minimize your application

This will minimize your application.
<pre><code>:::javascript
Rho.Application.minimize();
                 
</code></pre>

###Quit your application

This will exit your application.
<pre><code>:::javascript
Rho.Application.quit();
                 
</code></pre>

###Restore your application

This will restore you application.
<pre><code>:::javascript
Rho.Application.restore();
                 
</code></pre>