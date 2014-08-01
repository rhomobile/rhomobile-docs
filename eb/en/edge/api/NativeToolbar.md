#NativeToolbar


## Overview
The NativeToolbar method let you create and remove a toolbar at runtime.
## Enabling the API
In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* ebapi-modules.js - this file contains all available Enterprise Browser APIs

If you wish to minimize the amount of JavaScript being included, you can choose to only include the individual API that your application is using:

ex:

* ebapi.js - core APIs needed 
* eb.nativetoolbar.js - just the NativeToolbar API
* other individual JavaScript files included with the Enterprise Browser installation


        


##Methods



### create(<span class="text-info">ARRAY</span> toolbarElements, <span class="text-info">HASH</span> toolBarProperties)
<p>Creates a new toolbar and Removes the current toolbar / tabbar and replaces it with this one.</p>


####Parameters
<ul><li>toolbarElements : <span class='text-info'>ARRAY</span><p>
<p>Array of Toolbar elements. Do not create more than five elements for maximum portability.Toolbar elements are not scrollable, so if some buttons will not fit into the screen dimensions, they will be invisible.</p>
 </p></li><ul><li>toolbarElement : <span class='text-info'>HASH</span><p>
<p>Properties of Toolbar elements. Either :icon or :label must be specified. If both are specified, :icon is drawn and :label is discarded.</p>
 </p></li><ul><li>label : <span class='text-info'>STRING</span><p>
<p>Visible label to display instead of an icon.For predefined actions, icon will be displayed.Android,iOS note: for predefined actions no label will be displayed.</p>
 </p></li><li>action : <span class='text-info'>STRING</span><p>
<p>URL to call when button is pressed or special value.It may be a JavaScript method to call: &lsquo;javascript: methodOnButton();&rsquo;.</p>
 </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>separator</dt><dd>
<p>Add a separator to the toolbar. If only one separator is specified, then elements after separator will be right-aligned. If more then one separator is added: on WM/CE, platform dependent separator will be displayed, on Android center-aligned groups will be created.</p>
 Platforms: 
WM, Win32, iOS, Android</dd><dt>exit</dt><dd>
<p>Exit the application.</p>
</dd><dt>close</dt><dd>
<p>Exit the application.</p>
</dd><dt>options</dt><dd>
<p>Navigate to Settings page, defined in configuration file.</p>
</dd><dt>home</dt><dd>
<p>Navigate to Home page, defined in configuration file.</p>
</dd><dt>refresh</dt><dd>
<p>Refresh current page.</p>
</dd><dt>back</dt><dd>
<p>Perform back action or execute browser back.</p>
</dd><dt>log</dt><dd>
<p>Display Log View window.</p>
 Platforms: 
WM, Win32, iOS, Android</dd><dt>fullscreen</dt><dd>
<p>Expand application window to full screen.</p>
 Platforms: 
WM, Win32, Android, WP8</dd><dt>sync</dt><dd>
<p>Run full sync command.</p>
</dd><dt>minimize</dt><dd>
<p>Minimize application window.</p>
 Platforms: 
WM, Win32</dd><dt>SIP</dt><dd>
<p>Display software keyboard window.Set <code>EB.System.keyboardState</code> to <code>EB.System.KEYBOARD_AUTOMATIC</code> to use this element.</p>
 Platforms: 
WM</dd></dl></li><li>icon : <span class='text-info'>STRING</span><p>
<p>Icon Relative path (from Enteprise browser application to the icon file on the device). Android: Icons must be no more than 30x30 pixels and must be in .png format. Windows Mobile: Icons can be any size, but all icons should have same size (default &ndash; 48x48). .png and .bmp formats are supported.</p>
 </p></li><li>coloredIcon : <span class='text-info'>BOOLEAN</span><span class='label '> Default: false</span><p>
<p>Use colored icon in toolbar on iPhone instead of standard monochrome white icon (prepared from image alpha).</p>
 Platforms:
iOS </p></li><li>width : <span class='text-info'>INTEGER</span><p>
<p>Button width in pixel. Used to define separator width when more than one separator specified.</p>
 Platforms:
WM </p></li></ul></ul><li>toolBarProperties : <span class='text-info'>HASH</span><p>
<p>Properties of TabBar.</p>
 </p></li><ul><li>backgroundColor : <span class='text-info'>INTEGER</span><p>
<p>Background color of the toolbar.</p>
 </p></li><li>maskColor : <span class='text-info'>INTEGER</span><span class='label '> Default: 0xFFFFFF</span><p>
<p>Image mask color(transparent color).</p>
 Platforms:
WM, Win32 </p></li><li>viewHeight : <span class='text-info'>INTEGER</span><p>
<p>Toolbar height in pixels.</p>
 Platforms:
WM, Win32 </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.NativeToolbar.create(<span class="text-info">ARRAY</span> toolbarElements, <span class="text-info">HASH</span> toolBarProperties)</code> 


### remove()
<p>Removes the current toolbar. Does nothing if there is no active toolbar.</p>


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
	* <code>EB.NativeToolbar.remove()</code> 
