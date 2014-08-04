#NativeMenubar


## Overview
The NativeMenubar API lets you customize the Windows Mobile/CE native menu buttons.
## Enabling the API
In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* ebapi-modules.js - this file contains all available Enterprise Browser APIs

If you wish to minimize the amount of JavaScript being included, you can choose to only include the individual API that your application is using:

ex:

* ebapi.js - core APIs needed 
* eb.nativemenubar.js - just the NativeMenuBar API
* other individual JavaScript files included with the Enterprise Browser installation


        


##Properties



###extraButton

####Type
<span class='text-info'>HASH</span> 
####Description
Defined behavior of the Left menu button for Windows Mobile applications. This takes the same HASH as a menu item {label: 'Left Button', action: 'alert("You pressed the left button")'}. If your menu is using menu items via mainMenu, then be sure to not set an action for the extraButton. Setting an action for the extraButton will cause the mainMenu setting to be ignored. 
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.NativeMenubar.extraButton</code>



####Platforms

* Windows Mobile/CE

###extraMenu

####Type
<span class='text-info'>ARRAY</span> 
####Description
The Left menu items for Windows Mobile applications. This defines the list of menu choices when the extraButton is pressed.
####Params
<li><i>Object</i> : <span class='text-info'>HASH</span><p>Same values as for mainMenu. </p></li>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.NativeMenubar.extraMenu</code>



####Platforms

* Windows Mobile/CE

###mainButton

####Type
<span class='text-info'>HASH</span> 
####Description
Defined behavior of the Right menu button for Windows Mobile applications. This takes the same HASH as a menu item {label: 'Right Button', action: 'javascript: alert("You pressed the right button");'}. If your menu is using menu items via mainMenu, then be sure to not set an action for the mainButton. Setting an action for the mainButton will cause the mainMenu setting to be ignored.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.NativeMenubar.mainButton</code>



####Platforms

* Windows Mobile/CE

###mainMenu

####Type
<span class='text-info'>ARRAY</span> 
####Description
The Right menu items in Windows Mobile applications. This defines the list of menu choices when the mainButton is pressed.
####Params
<li><i>Object</i> : <span class='text-info'>HASH</span><p> </p></li><ul><li>label : <span class='text-info'>STRING</span><p>Visible label. </p></li><li>action : <span class='text-info'>STRING</span><p>URL to page which will be loaded into tab. It may be a JavaScript method to call: 'javascript: methodOnTab();'. Or path to html page to load. </p></li><li>disabled : <span class='text-info'>BOOLEAN</span><span class='label '> Default: false</span><p>Menu item will be displayed as disabled. Platforms:
WM </p></li></ul>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.NativeMenubar.mainMenu</code>



####Platforms

* Windows Mobile/CE