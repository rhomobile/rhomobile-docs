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



### databaseFilePath()
Path to database file by partition name. Please note that this function does not create a database file. This function only generates the file path based on the application path and partition name.

### expandDatabaseBlobFilePath()
Generates the absolute path to database blob file. Please note that this function does not the create database file. This function only generates the file path based on application path and partition name.

### minimize()
Minimize or move the application to background. When running in RhoSimulator this method is supported only for Windows OS.

### modelFolderPath()
Folder of the model by name.

### processApplicationEvent()
Ruby applications must use this method for processing of the application Event. May be called from setApplicationNotify callback.This method should be called for each event. The only exception is SyncUserChanged, where you can choose your own reset database logic.

### quit()
Quit the application.

### relativeDatabaseBlobFilePath()
Generates the relative path to database blob file. Please note that this function does not create a database file. This function only generates the file path based on the application path and partition name.

### restore()
Restores the application to be in the foreground. When running in RhoSimulator the method is supported only for windows OS.

### setApplicationNotify()
This method allows your application to register for application specific events like application activation/deactivation, UI creation/destruction as well as others. Check the Callback tab for details.