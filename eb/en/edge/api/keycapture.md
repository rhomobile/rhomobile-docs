#KeyCapture


## Overview
The KeyCapture module is used to intercept or override hardware keys. It is typically used to provide certain application functions through the use of the device's physical keyboard or other hardware enabled buttons.
## Enabling the API
In order to use this API you must TBD INSERT Eb specific instructions here

        


##Methods



### captureKey(<span class="text-info">BOOLEAN</span> dispatch, <span class="text-info">STRING</span> keyValue)
<p>Notifies the user when a specified physical key is pressed. The key event can also be absorbed so that it isn&rsquo;t delivered to the web view. If the callback is not set then the capture setting for the given key will be cleared.</p>


####Parameters
<ul><li>dispatch : <span class='text-info'>BOOLEAN</span><p>
<p>After a key has been intercepted this parameter will determine whether or not it will still be received by the Web View. For example if you have focus in a text box and are intercepting keys set this to &lsquo;False&rsquo; to avoid having the keys appear in the box. For iOS devices this parameter has no effect. If any of volume keys are captured, real sound volume will not be changed.</p>
 </p></li><li>keyValue : <span class='text-info'>STRING</span><p>
<p>Specifies the identifier of the key to capture. This this value is the operating system&rsquo;s identifier for the key, not the ASCII representation of the key (for example, the &lsquo;a&rsquo; key on Windows Mobile devices has a keyValue of 101). Alternatively, this parameter can be set to &lsquo;all&rsquo;. This value will capture all hardware key presses. This parameter needs to be passed as a string (for example &lsquo;101&rsquo; or &lsquo;0x65&rsquo; or &lsquo;all&rsquo;).</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>keyValue : <span class='text-info'>INTEGER</span><p>
<p>The internal representation of the key expressed in decimal, e.g. 13 is the return key.</p>
 Platforms:
WM, Android </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.KeyCapture.captureKey(<span class="text-info">BOOLEAN</span> dispatch, <span class="text-info">STRING</span> keyValue)</code> 


### captureTrigger()
<p>Captures the event whenever a device hardware trigger is pressed or released. If the callback is not set then the capture setting for the trigger will be cleared. The trigger presses cannot be absorbed. All trigger presses will propagate to RhoElements.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>triggerFlag : <span class='text-info'>INTEGER</span><p>
<p>The combination of the triggers pressed and the state of the triggers. Older devices may report duplicate values for different triggers on the device due to a platform issue, this has been resolved in newer devices.</p>
 </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.KeyCapture.captureTrigger()</code> 


### remapKey(<span class="text-info">STRING</span> keyValue, <span class="text-info">STRING</span> remapTo)
<p>Captures and consumes a specific key value and spawns a new key event with the remapped key code. If remapTo is empty or null, the remapping for this key value will be cleared.</p>


####Parameters
<ul><li>keyValue : <span class='text-info'>STRING</span><p>
<p>Specifies the identifier of the key to capture. This this value is the operating system&rsquo;s identifier for the key, not the ASCII representation of the key (for example, the &lsquo;a&rsquo; key on Windows Mobile devices has a keyValue of 101). This parameter needs to be passed as a string (for example &lsquo;101&rsquo; or &lsquo;0x65&rsquo;).</p>
 </p></li><li>remapTo : <span class='text-info'>STRING</span><p>
<p>The operating system&rsquo;s identifier of the key press event to generate when the keyValue is captured.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.KeyCapture.remapKey(<span class="text-info">STRING</span> keyValue, <span class="text-info">STRING</span> remapTo)</code> 


##Properties



###homeKeyValue

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Specifies a key which, when pressed, will navigate to the start page as defined in the RhoElements configuration. Set to &lsquo;Disabled&rsquo; to prevent this behavior.</p>

####Params
<p><strong>Default:</strong> Disabled</p>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.KeyCapture.homeKeyValue</code>



####Platforms

* Windows Mobile/CE

##Constants


* IPHONE_VOLUME_UP
<p>IPhone volume up keyCode. Used to capture the volume up key when it is pressed.</p>

* IPHONE_VOLUME_DOWN
<p>IPhone volume down keyCode. Used to capture the volume down key when it is pressed.</p>


##Remarks



###Keys which can not be captured
<p>It is not possible to capture the following types of keys:</p>

<ol>
<li>Keyboard modifiers such as SHIFT, ALT, ORANGE button, BLUE button etc.</li>
<li>Device Keys such as the screen backlight or keyboard backlight.</li>
<li>Hot keys such as phone keys or &lsquo;soft&rsquo; buttons, those whose function changes based on the running application.</li>
<li>The Home key and the power key on Android and iOS devices.</li>
<li>On Android devices, keys reserved for use by the &ldquo;PTT&rdquo; apps (such as the left trigger button), if a &ldquo;PTT&rdquo; app has been enabled.</li>
<li>On consumer Jelly Bean (Android) devices, the search button cannot be captured, as it has been reserved for the sole use of &ldquo;Google Now&rdquo;.</li>
<li>On ET1, Search (P3) key is application specific. Dispatching this key within RhoElements wont do anything as it RhoElements doesn&rsquo;t do anything specific with this key (unlike the menu key which raises the menu).                <br/>
Although on some device configurations pressing the SHIFT key twice generates CAPS LOCK which can be captured with a key value of 16.</li>
</ol>



###Precedence of APIs using the same keyValue
<p>If captureKey and remapKey have been called with the same keyValue, the remapKey will take precedence. In this case this means that the keyEvent for the inputted key will not be fired as the remapping will occur and consume the key event.</p>

<p>If the same key has been set as the homeKeyValue and captureKey with a callback, the captureKey will take precedence over the homeKeyValue. For example:</p>

<p><code>Rho.KeyCapture.homeKeyValue = '0x0D';</code></p>

<p><code>Rho.KeyCapture.captureKey(true, '0x0D', capturekeyCallback);</code></p>

<p>When the specified key is pressed, the event will fire but the homeKey event will not occur.</p>


###Precedence of captureKey events
<p>Any captureKey calls set with a specific key will take precedence over any captureKey calls with value &lsquo;all&rsquo;. This means that the &lsquo;all&rsquo; callback will not be called when individual keys that have been registered with captureKey are pressed. This also goes for dispatch values. If captureKey &lsquo;all&rsquo; has a dispatch value of false, and captureKey with an individual keyCode value has a dispatch value of true, then this individual key will be dispatched to the app when pressed.</p>


###Device Lockdown on Motorola Solutions Android devices
<p>Because the Home key cannot be captured on the ET1 and MC40 it is possible for users to return to the system home page by pressing it. If you need to prevent this then please consult the Motorola Solutions Android documentation for other device lock-down options.</p>


###Capturable keys on iOS devices
<p>Only the volume up and volume down keys can be caught on iOS devices.</p>


###Capturing Function
<p>If you have enabled the function key in the configuration settings and that function key has some special behavior in the Operating system the key will not be capturable unless you also set the &lsquo;FunctionKeysCapturable&rsquo; option (see RhoElements Configuration Settings). An example of special behavior is the F6 and F7 keys on the MC75a (non QWERTY) which control the volume up and volume down. Although &lsquo;FunctionKeysCapturable&rsquo; will allow you to capture Function keys it will also disable the special Function key behavior. Which buttons map to which function keys will differ from device to device, some devices such as the MC9500 have dedicated, labeled function keys whereas other devices such as the MC75a do not label the fact that their volume / red phone / green phone keys all behave as function keys internally.</p>


###VC70 Hardware Keys
<p>The VC70 has a hardware keys (P1, P2, P3 and P4 as well as a brightness button) which are not capturable by the KeyCapture module. Additionally the the default Operating system behavior (like volume up / down) of hardware keys can not be blocked when RhoElements is running in fullscreen mode.</p>


###ES400 Application Keys
<p>The ES400 has a hardware messaging key with an envelope icon on it that does not function like a standard Application Key. To disable this key go to &lsquo;Settings&rsquo; on the device, then &lsquo;Personal&rsquo;, then &lsquo;KeyRemap&rsquo; and remap it to a key not in use. Also note that the &lsquo;Sym&rsquo; key on the ES400 is not capturable.</p>


###F5 Key
<p>In Internet Explorer the F5 key is used to refresh the current page. It is not recommended to rely on this functionality on Windows Mobile and it is not supported.</p>


###Accelerator Keys
<p>The following keys will be affected by the &lsquo;AccelerateKeys&rsquo; tag, see the Key Capture Overview for a more detailed explanation of Accelerator Keys. Accelerator Keys are only applicable when RhoElements is run with the Internet Explorer engine on a Windows CE device.</p>

<p>Key           Code    Usual Behavior               Special behavior in Internet Explorer</p>

<p>Left Arrow    0x25    Cursor left                   Scroll window left
Right Arrow   0x27    Cursor right                  Scroll window right
Up Arrow      0x26    Cursor up                     Scroll window up
Down Arrow    0x28    Cursor down                   Scroll window down
Backspace     0x08    Delete previous character.   Navigate to previous page
Enter         0x0D    Cursor line feed              Submit form
Tab           0x09    Advance to next control       Advance to next control</p>


###Remapping a key to itself
<p>If a key is remapped to itself then RhoElements will appear to hang because if that key is pressed it will generate another press of the same key, and so on forever. The same will happen if for instance key 1 is remapped to key 2, which in turn is remapped to key 1.</p>


###Special characters
<p>On some devices certain keys containing special characters trigger two separate key events. This happens because such characters are translated by the platform into the combination of a Shift and a Base Key. Characters behaving in such way are $, %, &amp;, &ldquo;, (, ), !, :, ?, #, _, @.</p>


###Device Specific Exceptions
<p>Certain devices may map their function keys to apparently normal keys, for example the VC6090 maps the &lsquo;{&rsquo; key to F12 and the &lsquo;}&rsquo; key to F14. In order to capture those two keys it is necessary to enable F12 and F14 in the Configuration Settings. You may also find on some devices special keys like &lsquo;OK&rsquo; return the same code as a function key, depending on your keyboard layout.</p>


###Use of Key Capture module on Localized Operating Systems
<p>Users of the key capture module with Chinese, Korean and Japanese operating systems should bear the following in mind: Internally the KeyCapture module stores key representations as VK codes, therefore the key event will always return VK_PROCESSKEY (229) and keys can not be individually specified. In JavaScript the DOM element&rsquo;s keyup event can be used as an indication of which key has been pressed.</p>


###Build Configuration
<p>To build the keycapture API into your application you must specify the &lsquo;hardwarekeys&rsquo; extension and specify your application type to be &lsquo;rhoelements&rsquo;.</p>
