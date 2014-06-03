#System


## Overview
<p>The System API is used to control and modify core aspects of the device such as the screen, OS and device capabilities.</p>
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



### applicationInstall()
Install an application.

### applicationUninstall()
Uninstall the application. Not Supported on Windows CE devices.

### bringToFront()
Bring application window to the top of the screen.

### clearNetworkStatusNotify()
Use Network.clearStatusNotify: Clear network status callback.

### deleteFolder()
Delete folder.

### deleteRegistrySetting()
Deletes the specified value from the device registry. Only applicable on Windows Mobile / Embedded Handheld and CE devices. When running on RhoSimulator, this method is supported only for Windows OS.

### exit()
Use Application.quit: exit application.

### getAllProperties()
This method will return all of object/value pairs for the propertyNames of the API class.

### getProperties()
This method will return a set of object/value pairs for the list of the propertyName that is passed in. The propertyNames must be a valid property of the API class.

### getProperty()
This method will return the value of the propertyName that is passed in. The propertyName must be a valid property of the API class.

### getRegistrySetting()
Retrieve a value from the device registry. Only applicable on Windows Mobile / Embedded Handheld and CE devices. When running on RhoSimulator, this method is supported only for Windows OS.

### getStartParams()
Return the command line parameters. At Android start parameters are returned as URL query string starting with '?', name-value delimiter '=' and name value pairs delimiter '&'.

### get_locale()
Use System.locale property: Current device locale.

### isApplicationInstalled()
Checks if the specified applicationName is installed on the device.

### isBlobAttr()
Use Database.SQLite3.isBlobAttr: is model attribute is blob.

### openUrl()
Open the application associated with the URL. Behavior may be different on different platforms and depend on installed software. For example, open URL with http:// prefix will execute the Web Browser installed on system and open URL in executed browser. Note: For opening pdf files on android devices it is necessary to add option "no_compression: [ pdf ]" to android section in build.yml
                

### replaceCurrentBundle()
Replace application bundle.

### runApplication()
Run an application.

### setDoNotBackupAttribute()
Set do not backup attribute for file.

### setNetworkStatusNotify()
Use Network.setStatusNotify: set network notification callback.

### setProperties()
This method will set the values of a list of properties for the API class. The propertyName must be a valid property for the class and must also not be read only.

### setProperty()
This method will set the value of a property for the API class. The propertyName must be a valid property for the class and must also not be read only.

### setPushNotification()
Use Push.setPushNotification: Register push callback, the method to call upon receiving a push message.

### setRegistrySetting()
Set a value in the device registry. Only applicable on Windows Mobile / Embedded Handheld and CE devices. When running on RhoSimulator, this method is supported only for Windows OS.

### setScreenRotationNotification()
Use ScreenOrientation.setScreenOrientationEvent: Notify (call a callback method) when the screen rotates.

### setWindowFrame()
Change application window position and size.

### setWindowPosition()
Change application window position.

### setWindowSize()
Change application window size.

### set_application_icon_badge()
Use System.applicationIconBadge: Set the application icon to have this badge number. Set to 0 (zero) to remove badge.iOS only.

### set_http_proxy_url()
Use System.httpProxyURI property: To use client with the HTTP proxy.

### set_locale()
Use Application.setLocale method: set application specific locale.

### set_sleeping()
Use System.screenSleeping property: enable / disable phone sleeping.

### startTimer()
Use Timer.start: start timer.

### stopTimer()
Use Timer.stop: stop timer.

### unset_http_proxy()
Use System.httpProxyURI property: Stop using HTTP proxy that was set by the command line, rhoconfig.txt or set_http_proxy_url.

### unzipFile()
Unzip file.

### updateBlobAttribs()
Use Database.updateBlobAttribs: update model blob attributes list.

### zipFile()
Zip one file. Zip archive must placed to the folder where application can write files. 

### zipFiles()
Zip list of files.