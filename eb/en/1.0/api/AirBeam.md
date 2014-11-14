# Airbeam
## Overview
The AirBeam Preexisting JavaScript Object contains properties and methods which can be used to control the AirBeam Smart client. AirBeam is a separate application provided by Symbol Technologies and provides the ability to download software packages to your mobile device. If you have configured ‘PreloadLegacyAirBeam’ to be ‘1’ the JavaScript object ‘airbeam’ will be inserted automatically into your page’s DOM.

## Enabling the API
In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* elements.js 

> Note - this file either needs to be on the device in a relative folder from where your HTML page is, or it must be copied to your web server appropriately.

	:::html
    <script type="text/javascript" charset="utf-8" src="elements.js"></script>;


### API Usage
This API does not use the `EB` namespace. It is simply referenced using the API name:

	:::javascript
	airbeam.AddPackage('myPackage');
        
##Methods

### AddPackage(<span class="text-info">STRING</span> PackageName)
Instructs the AirBeam Smart client to add the named package to the package list (can be added up to four times).

####Parameters

* PackageName : <span class='text-info'>STRING</span>
The name of the AirBEAM package to add.

####Returns
Synchronous Return:

* Boolean : True if the package was successfully added or false if it was not

### DeletePackage(<span class="text-info">STRING</span> PackageName)
Instructs the AirBeam Smart client to delete the specified package.

####Parameters

* PackageName : <span class='text-info'>STRING</span>
The name of the AirBEAM package to be deleted.

####Returns
Synchronous Return:

* Void

### UploadPackage(<span class="text-info">STRING</span> PackageName)
Instructs the AirBeam Smart client to process the specified package for upload.

####Parameters

* PackageName : <span class='text-info'>STRING</span>
The name of the AirBEAM package to process for upload.

####Returns
Synchronous Return:

* Void

### Run()
Instructs the AirBeam Smart client to run the client and perform the current configuration. Note that the client is run as the foreground application.

####Returns
Synchronous Return:

* Integer - The exit code of the AirBeam Smart client

##Properties

###AutoLoadMode

####Type
<span class='text-info'>INTEGER</span> - 0-3
####Description
Describes how synchronization is started. The following mode settings apply to the AutoLoadMode Property:

* 0: Synchronization is not automatically started.
* 1: Synchronization is automatically started in interactive mode.
* 2: Synchronization is automatically started in non-interactive mode.
* 3: Synchronization is automatically started in background mode.


####Platforms

* Android
* Windows Mobile/CE

###AutoReboot

####Type
<span class='text-info'>BOOLEAN</span> -True/False
####Description
Indicates if auto reboot mode is enabled.

####Platforms

* Android
* Windows Mobile/CE

###RAMManagement

####Type
<span class='text-info'>BOOLEAN</span> -True/False
####Description
Enables or Disables RAM Management mode.

####Platforms

* Android
* Windows Mobile/CE

###TestMode

####Type
<span class='text-info'>BOOLEAN</span> -True/False
####Description
Whether or not packages should be loaded when added.

####Platforms

* Android
* Windows Mobile/CE

## Remarks
###Backwards Compatibility
The AirBeam Preexisting JavaScript Object provides backwards compatibility with code written for PocketBrowser and also supports the syntax below. Because RhoElements inserts the object ‘airbeam’ on the page automatically when ‘PreloadLegacyAirBeam’ is configured to be ‘1’ you can not create your own objects by this name, see below:

	:::javascript
	<script>
	  //  Old PocketBrowser syntax to support AirBeam
	  var myObj = new ActiveXObject("PocketBrowser.AirBEAMSmart"); 
	  
	  //  Note: var airbeam = new ... will fail because the object already exists on the page.
	  myObj.Run();
	</script>

