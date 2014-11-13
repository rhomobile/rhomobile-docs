#Registry


## Overview
The Registry API is used to write and delete registry settings, and create corresponding merge files.

## Enabling the API
In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* elements.js 

> Note - this file either needs to be on the device in a relative folder from where your HTML page is, or it must be copied to your web server appropriately.

	:::html
    <script type="text/javascript" charset="utf-8" src="elements.js"></script>;


### API Usage
This API does not use the `EB` namespace. It is simply referenced using the API name:

	:::javascript
	registry.delete();

##Methods

### delete()
Deletes the setting.

####Returns
* Void

####Platforms

* Windows Mobile/CE

##Properties

###hive

####Type
<span class='text-info'>STRING</span>
####Description
Name of the root hive.	

####Possible Values

* HKLM - HKEY_LOCAL_MACHINE
* HKCU - HKEY_CURRENT_USER
* HKCR - HKEY_CLASSES_ROOT 
* HKU - HKEY_USERS

####Platforms

* Windows Mobile/CE

###key

####Type
<span class='text-info'>STRING</span>
####Description
Full path of the key, including '\' separators as required. Remember to use '\\' in JavaScript to specify backslash whereas just a single '\' should be used in META tags.

####Possible Values

* Any string

####Platforms

* Windows Mobile/CE

###setting

####Type
<span class='text-info'>STRING</span>
####Description
Name of the setting.

####Possible Values

* Any string

####Platforms

* Windows Mobile/CE

###type

####Type
<span class='text-info'>STRING</span>
####Description
Data type of the setting.

####Possible Values

* DWORD -  A decimal number.
* STRING - Any string of characters.
* BINARY - A string of hexadecimal digits (0-9, A-F). There must be an even number of digits.
* MULTISZ - Multiple strings of characters, separated by \n. To include a backslash (\) in a string write a double backslash (\\).

####Platforms

* Windows Mobile/CE

###persistent

####Type
<span class='text-info'>BOOLEAN</span>
####Description
Whether to create the corresponding merge file.

####Possible Values

* True
* **False**

>When the persistent tag is given the module will write a .reg file to the \Application folder on the device, which will add the setting to the registry when merged by Windows CE/WM, e.g. during a cold boot. When the persistent tag is given when deleting a setting, the module deletes any existing .reg file created above, and creates a new .reg file which will delete the setting when merged – this is in addition to deleting the registry setting itself.

####Platforms

* Windows Mobile/CE

###value

####Type
<span class='text-info'>STRING</span>
####Description
Value for the setting.

####Possible Values

* Valid string for the setting type specified 

####Platforms

* Windows Mobile/CE


## Remarks
###Device Limits
The levels of supported keylight intensity is device dependent. When the Keylight module is first loaded it writes the supported levels to the log file as INFORMATION so you can determine the maximum setting from the log file.