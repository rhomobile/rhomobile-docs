#Wake

## Overview
The Wake Module is used to keep the display and wifi ON as long as Enterprise Browser is active

## Enabling the API
In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* elements.js 

### API Usage
This API does not use the `EB` namespace. It is simply referenced using the API name:

	:::javascript
	wake.wakeLock = 'enabled';


##Properties

###wakeLock

####Type
<span class='text-info'>STRING</span> 
####Description
Enables / disables the screen.

#### Possible Value

* Enabled
* **Disabled**

####Platforms

* Android

###wifiLock

####Type
<span class='text-info'>STRING</span> 
####Description
Enables / disables the network.

#### Possible Value

* Enabled
* **Disabled**

####Platforms

* Android


## Remarks
###wake Method
Please note that enabling locks override the system values and consume more battery power.