#KeyCapture


## Overview
The KeyCapture module is used to intercept or override hardware keys. It is typically used to provide certain application functions through the use of the device's physical keyboard or other hardware enabled buttons.
## Enabling the API
There are two ways to enable Enterprise Browser APIs: 

* Include all 'ebapi' modules
* Include only the API modules you need

Both methods are explained below. 

Either way, the included files will be from: 
`/Enterprise Browser/JavaScript Files/Enterprise Browser`,
a directory on the computer that contains the Enterprise Browser installation.

### Include all JS API modules
To include all JavaScript APIs, copy the `ebapi-modules.js` file to a location accessible by your app's files and include the JavaScript modules file in your app. For instance, to include the modules file in your `index.html`, copy the file to the same directory as your index.html and add the following line to the HEAD section of your index.html file:

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi-modules.js"></script>

> This will define the EB class within the page. **Note that the path for this file is relative to the current page** (index.html). Any page on which the modules are required will need to have the required .js file(s) included in this fashion.

### Include only the modules you need

To include individual APIs, you must first include the `ebapi.js` in your HTML, and then the additional required API file(s). For instance, to use the KeyCapture API, add the following code to the HTML file(s). Again, this assumes that relevant API files have been copied to the same directory as the HTML.

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi.js"></script>
    <script type="text/javascript" charset="utf-8" src="keycapture.js"></script>

> In the code lines above, notice that `ebapi.js` is included first, followed by `eb.keycapture.js`, which is the KeyCapture API for Enterprise Browser. **This coding is required on each HTML page whenever an individual API will be called from that page**.

        


##Methods



### captureKey(<span class="text-info">BOOLEAN</span> dispatch, <span class="text-info">STRING</span> keyValue)
Notifies the user when a specified physical key is pressed. The key event can also be absorbed so that it isn't delivered to the web view. If the callback is not set then the capture setting for the given key will be cleared.

####Parameters
<ul><li>dispatch : <span class='text-info'>BOOLEAN</span><p>After a key has been intercepted this parameter will determine whether or not it will still be received by the Web View. For example if you have focus in a text box and are intercepting keys set this to 'False' to avoid having the keys appear in the box. If any of the volume keys are captured, real sound volume will not be changed. </p></li><li>keyValue : <span class='text-info'>STRING</span><p>Specifies the identifier of the key to capture. This this value is the operating system's identifier for the key, not the ASCII representation of the key (for example, the 'a' key on Windows Mobile devices has a keyValue of 101). Alternatively, this parameter can be set to 'all'. This value will capture all hardware key presses. This parameter needs to be passed as a string (for example '101' or '0x65' or 'all'). </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>keyValue : <span class='text-info'>INTEGER</span><p>The internal representation of the key expressed in decimal, e.g. 13 is the return key. Platforms:
WM, CE, Android </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.KeyCapture.captureKey(<span class="text-info">BOOLEAN</span> dispatch, <span class="text-info">STRING</span> keyValue)</code> 


### captureTrigger()
Captures the event whenever a device hardware trigger is pressed or released. If the callback is not set then the capture setting for the trigger will be cleared. The trigger presses cannot be absorbed. All trigger presses will propagate to the Enterprise Browser. Note: On Android, PTT keys are capturable using captureTrigger method only.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>triggerFlag : <span class='text-info'>INTEGER</span><p>The combination of the triggers pressed and the state of the triggers. Older devices may report duplicate values for different triggers on the device due to a platform issue, this has been resolved in newer devices. </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE
* Zebra Devices Only

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.KeyCapture.captureTrigger()</code> 


### remapKey(<span class="text-info">STRING</span> keyValue, <span class="text-info">STRING</span> remapTo)
Captures and consumes a specific key value and spawns a new key event with the remapped key code. If remapTo is empty or null, the remapping for this key value will be cleared.

####Parameters
<ul><li>keyValue : <span class='text-info'>STRING</span><p>Specifies the identifier of the key to capture. This this value is the operating system's identifier for the key, not the ASCII representation of the key (for example, the 'a' key on Windows Mobile devices has a keyValue of 101). This parameter needs to be passed as a string (for example '101' or '0x65'). </p></li><li>remapTo : <span class='text-info'>STRING</span><p>The operating system's identifier of the key press event to generate when the keyValue is captured. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.KeyCapture.remapKey(<span class="text-info">STRING</span> keyValue, <span class="text-info">STRING</span> remapTo)</code> 


##Properties



###homeKeyValue

####Type
<span class='text-info'>STRING</span> 
####Description
Specifies a key which, when pressed, will navigate to the start page as defined in the config.xml file. Set to 'Disabled' to prevent this behavior.
####Params
<p><strong>Default:</strong> Disabled</p>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.KeyCapture.homeKeyValue</code>



####Platforms

* Windows Mobile

##Remarks



###Keys which cannot be captured
It is not possible to capture the following types of keys:

1.  Keyboard modifiers such as SHIFT, ALT, ORANGE button, BLUE button etc.
2.  Device Keys such as the screen backlight or keyboard backlight.
3.  Hot keys such as phone keys or 'soft' buttons, those whose function changes based on the running application.
4.  The Home key and the power key on Android and devices.
5.  Depending on the device keyboard driver, some keys may not be easily capturable as they are interpreted as a shifted character by the device.  One example of such a key is the '#' character on CE7 devices, whilst the character code for this key is 23 it is interpreted as 33.  This applies to both capturing keys and specifying the HomeKeyValue.
6.  On Android devices, keys reserved for use by the "PTT" apps (such as the left trigger button), if a "PTT" app has been enabled.
7. On consumer Jelly Bean (Android) devices, the search button cannot be captured, as it has been reserved for the sole use of "Google Now".
8. On ET1, Search (P3) key is application specific. Dispatching this key within the Enterprise Browser wont do anything as the Enterprise Browser doesn't do anything specific with this key (unlike the menu key which raises the menu).
Although on some device configurations pressing the SHIFT key twice generates CAPS LOCK which can be captured with a key value of 16.

###Precedence of APIs using the same keyValue
If captureKey and remapKey have been called with the same keyValue, the remapKey will take precedence. In this case this means that the keyEvent for the inputted key will not be fired as the remapping will occur and consume the key event.

If the same key has been set as the homeKeyValue and captureKey with a callback, the captureKey will take precedence over the homeKeyValue. For example:

    :::javascript
    EB.KeyCapture.homeKeyValue = '0x0D';
    EB.KeyCapture.captureKey(true, '0x0D', capturekeyCallback);

When the specified key is pressed, the event will fire but the homeKey event will not occur.

###Precedence of captureKey events
Any captureKey calls set with a specific key will take precedence over any captureKey calls with value 'all'. This means that the 'all' callback will not be called when individual keys that have been registered with captureKey are pressed. This also goes for dispatch values. If captureKey 'all' has a dispatch value of false, and captureKey with an individual keyCode value has a dispatch value of true, then this individual key will be dispatched to the app when pressed.

###Device Lockdown on Symbol Technologies Android devices
Because the Home key cannot be captured on the ET1 and MC40 it is possible for users to return to the system home page by pressing it. If you need to prevent this then please consult the Symbol Technologies Android documentation for other device lock-down options.

###Capturing Function
If you have enabled the function key in the configuration settings and that function key has some special behavior in the Operating system the key will not be capturable unless you also set the 'FunctionKeysCapturable' option (see the Configuration Reference). An example of special behavior is the F6 and F7 keys on the MC75a (non QWERTY) which control the volume up and volume down. Although 'FunctionKeysCapturable' will allow you to capture Function keys it will also disable the special Function key behavior. Which buttons map to which function keys will differ from device to device, some devices such as the MC9500 have dedicated, labeled function keys whereas other devices such as the MC75a do not label the fact that their volume / red phone / green phone keys all behave as function keys internally.

###Keys with multiple functionalities
Some keys which are meant for performing multiple functionalities but performs the single functionality may return the single code value. In that case it is recommended to remap the key code value with the expected desired keycode value.

###VC70 Hardware Keys
The VC70 has a hardware keys (P1, P2, P3 and P4 as well as a brightness button) which are not capturable by the KeyCapture module. Additionally the the default Operating system behavior (like volume up / down) of hardware keys can not be blocked when the app is running in full-screen mode.

###ES400 Application Keys
The ES400 has a hardware messaging key with an envelope icon on it that does not function like a standard Application Key. To disable this key go to 'Settings' on the device, then 'Personal', then 'KeyRemap' and remap it to a key not in use. Also note that the 'Sym' key on the ES400 is not capturable.

###F5 Key
In Internet Explorer the F5 key is used to refresh the current page. It is not recommended to rely on this functionality on Windows Mobile and it is not supported.

###PTT Keys
On Android, PTT keys are capturable using captureTrigger method only.

###Accelerator Keys
The following keys will be affected by the 'AccelerateKey' tag, see the Key Capture Overview for a more detailed explanation of Accelerator Keys. Accelerator Keys are only applicable when the app is run with the Internet Explorer engine on a Windows CE device.

* Key (Code)
    * Usual - Usual Behavior
    * I.E. - Special behavior in Internet Explorer
* Left Arrow (0x25)
    * Usual - Cursor left
    * I.E. - Scroll window left
* Right Arrow (0x27)
    * Usual - Cursor right
    * I.E. - Scroll window right
* Up Arrow (0x26)
    * Usual - Cursor up
    * I.E. - Scroll window up
* Down Arrow (0x28)
    * Usual - Cursor down
    * I.E. - Scroll window down
* Backspace (0x08)
    * Usual - Delete previous character
    * I.E. - Navigate to previous page
* Enter (0x0D)
    * Usual - Cursor line feed
    * I.E. - Submit form
* Tab (0x09)
    * Usual - Advance to next control
    * I.E. - Advance to next control

###Remapping a key to itself
If a key is remapped to itself, the app will appear to hang if that key is pressed because it will generate another press of the same key, and so on forever. A similar endless loop will occur if, for example, key 1 is remapped to key 2, and key 2 is remapped to key 1.
                

###Symbol Keys
On some devices certain keys containing special characters, these keys are known as symbol keys and they trigger two separate key events. This happens because such characters are translated by the platform into the combination of a Shift and a Base Key. Characters behaving in such way are $, %, &, ", (, ), !, :, ?, #, _, @. Capturing symbol key input via the SIP is not possible on WM/CE as all symbol keys return the same value; there is no such limitation on the physical keys representing the special characters.

###Device Specific Exceptions
Certain devices may map their function keys to apparently normal keys. For example, the VC6090 maps the '{' key to F12 and the '}' key to F14. To capture those two keys it is necessary to enable F12 and F14 in the Configuration Settings. You may also find on some devices special keys like 'OK' return the same code as a function key, depending on your keyboard layout. The MK3100 and other kiosk devices will report their symbol keys as '0' rather than assigning each key a different value.

###Use of Key Capture module on Localized Operating Systems
Users of the key capture module with Chinese, Korean and Japanese operating systems should bear the following in mind: Internally the KeyCapture module stores key representations as VK codes, therefore the key event will always return VK_PROCESSKEY (229) and keys can not be individually specified. In JavaScript the DOM element's keyup event can be used as an indication of which key has been pressed.