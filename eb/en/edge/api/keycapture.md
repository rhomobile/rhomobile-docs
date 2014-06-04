#KeyCapture


## Overview
<p>The KeyCapture module is used to intercept or override hardware keys. It is typically used to provide certain application functions through the use of the device&rsquo;s physical keyboard or other hardware enabled buttons.</p>
<h2>Enabling the API</h2>

<p>In order to use this API you must include the following extension in your <code>build.yml</code></p>

<pre><code>:::ruby
extensions: ["hardwarekeys"]
</code></pre>

<p>The <code>hardwarekeys</code> extension is also included automatically if you specify the following in your <code>build.yml</code></p>

<pre><code>:::ruby
app_type: "rhoelements"
</code></pre>

<p>NOTE: If you are building a Windows Mobile or Windows CE app with this API, you must set your app_type as &ldquo;rhoelements&rdquo; in your build.yml as shown <a href="../guide/build_config#other-build-time-settings">here</a>.</p>

<h2>JavaScript Usage</h2>

<p>Be sure to review the <a href="/guide/api_js">JavaScript API Usage</a> guide for important information about using this API in JavaScript</p>

<h2>Ruby Usage</h2>

<p>Be sure to review the <a href="/guide/api_ruby">Ruby API Usage</a> guide for important information about using this API in Ruby</p>



##Methods



### captureKey(<span class="text-info">BOOLEAN</span> dispatch, <span class="text-info">STRING</span> keyValue)
Notifies the user when a specified physical key is pressed. The key event can also be absorbed so that it isn't delivered to the web view. If the callback is not set then the capture setting for the given key will be cleared.

####Parameters
<ul><li>dispatch : <span class='text-info'>BOOLEAN</span><p>
After a key has been intercepted this parameter will determine whether or not it will still be received by the Web View. For example if you have focus in a text box and are intercepting keys set this to 'False' to avoid having the keys appear in the box. For iOS devices this parameter has no effect. If any of volume keys are captured, real sound volume will not be changed. </p></li><li>keyValue : <span class='text-info'>STRING</span><p>
Specifies the identifier of the key to capture. This this value is the operating system's identifier for the key, not the ASCII representation of the key (for example, the 'a' key on Windows Mobile devices has a keyValue of 101). Alternatively, this parameter can be set to 'all'. This value will capture all hardware key presses. This parameter needs to be passed as a string (for example '101' or '0x65' or 'all'). </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>keyValue : <span class='text-info'>INTEGER</span><p>
The internal representation of the key expressed in decimal, e.g. 13 is the return key. Platforms:WM, Android </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.KeyCapture.captureKey(<span class="text-info">BOOLEAN</span> dispatch, <span class="text-info">STRING</span> keyValue)</code> </li></ul></li></ul>

### captureTrigger()
Captures the event whenever a device hardware trigger is pressed or released. If the callback is not set then the capture setting for the trigger will be cleared. The trigger presses cannot be absorbed. All trigger presses will propagate to RhoElements.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>triggerFlag : <span class='text-info'>INTEGER</span><p>
The combination of the triggers pressed and the state of the triggers. Older devices may report duplicate values for different triggers on the device due to a platform issue, this has been resolved in newer devices. </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* Windows Embedded
* Motorola Solutions Devices Only

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.KeyCapture.captureTrigger()</code> </li></ul></li></ul>

### remapKey(<span class="text-info">STRING</span> keyValue, <span class="text-info">STRING</span> remapTo)
Captures and consumes a specific key value and spawns a new key event with the remapped key code. If remapTo is empty or null, the remapping for this key value will be cleared.

####Parameters
<ul><li>keyValue : <span class='text-info'>STRING</span><p>
Specifies the identifier of the key to capture. This this value is the operating system's identifier for the key, not the ASCII representation of the key (for example, the 'a' key on Windows Mobile devices has a keyValue of 101). This parameter needs to be passed as a string (for example '101' or '0x65'). </p></li><li>remapTo : <span class='text-info'>STRING</span><p>
The operating system's identifier of the key press event to generate when the keyValue is captured. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.KeyCapture.remapKey(<span class="text-info">STRING</span> keyValue, <span class="text-info">STRING</span> remapTo)</code> </li></ul></li></ul>

##Properties



###homeKeyValue

####Type
<span class='text-info'>STRING</span> 
####Description

Specifies a key which, when pressed, will navigate to the start page as defined in the RhoElements configuration. Set to 'Disabled' to prevent this behavior.
####Params
<p><strong>Default:</strong> Disabled</p>
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>Rho.KeyCapture.homeKeyValue</code> </li></ul></li></ul>

##Constants


* IPHONE_VOLUME_UP
IPhone volume up keyCode. Used to capture the volume up key when it is pressed.
* IPHONE_VOLUME_DOWN
IPhone volume down keyCode. Used to capture the volume down key when it is pressed.

##Remarks



###Keys which can not be captured
It is not possible to capture the following types of keys:

1.  Keyboard modifiers such as SHIFT, ALT, ORANGE button, BLUE button etc.
2.  Device Keys such as the screen backlight or keyboard backlight.
3.  Hot keys such as phone keys or 'soft' buttons, those whose function changes based on the running application.
4.  The Home key and the power key on Android and iOS devices.
5.  On Android devices, keys reserved for use by the "PTT" apps (such as the left trigger button), if a "PTT" app has been enabled.
6. On consumer Jelly Bean (Android) devices, the search button cannot be captured, as it has been reserved for the sole use of "Google Now".
7. On ET1, Search (P3) key is application specific. Dispatching this key within RhoElements wont do anything as it RhoElements doesn't do anything specific with this key (unlike the menu key which raises the menu).                  
Although on some device configurations pressing the SHIFT key twice generates CAPS LOCK which can be captured with a key value of 16.

###Precedence of APIs using the same keyValue
If captureKey and remapKey have been called with the same keyValue, the remapKey will take precedence. In this case this means that the keyEvent for the inputted key will not be fired as the remapping will occur and consume the key event.

If the same key has been set as the homeKeyValue and captureKey with a callback, the captureKey will take precedence over the homeKeyValue. For example:

`Rho.KeyCapture.homeKeyValue = '0x0D';`

`Rho.KeyCapture.captureKey(true, '0x0D', capturekeyCallback);`

When the specified key is pressed, the event will fire but the homeKey event will not occur.

###Precedence of captureKey events
Any captureKey calls set with a specific key will take precedence over any captureKey calls with value 'all'. This means that the 'all' callback will not be called when individual keys that have been registered with captureKey are pressed. This also goes for dispatch values. If captureKey 'all' has a dispatch value of false, and captureKey with an individual keyCode value has a dispatch value of true, then this individual key will be dispatched to the app when pressed.

###Device Lockdown on Motorola Solutions Android devices
Because the Home key cannot be captured on the ET1 and MC40 it is possible for users to return to the system home page by pressing it. If you need to prevent this then please consult the Motorola Solutions Android documentation for other device lock-down options.

###Capturable keys on iOS devices
Only the volume up and volume down keys can be caught on iOS devices.

###Capturing Function
If you have enabled the function key in the configuration settings and that function key has some special behavior in the Operating system the key will not be capturable unless you also set the 'FunctionKeysCapturable' option (see RhoElements Configuration Settings). An example of special behavior is the F6 and F7 keys on the MC75a (non QWERTY) which control the volume up and volume down. Although 'FunctionKeysCapturable' will allow you to capture Function keys it will also disable the special Function key behavior. Which buttons map to which function keys will differ from device to device, some devices such as the MC9500 have dedicated, labeled function keys whereas other devices such as the MC75a do not label the fact that their volume / red phone / green phone keys all behave as function keys internally.

###VC70 Hardware Keys
The VC70 has a hardware keys (P1, P2, P3 and P4 as well as a brightness button) which are not capturable by the KeyCapture module. Additionally the the default Operating system behavior (like volume up / down) of hardware keys can not be blocked when RhoElements is running in fullscreen mode.

###ES400 Application Keys
The ES400 has a hardware messaging key with an envelope icon on it that does not function like a standard Application Key. To disable this key go to 'Settings' on the device, then 'Personal', then 'KeyRemap' and remap it to a key not in use. Also note that the 'Sym' key on the ES400 is not capturable.

###F5 Key
In Internet Explorer the F5 key is used to refresh the current page. It is not recommended to rely on this functionality on Windows Mobile and it is not supported.

###Accelerator Keys
The following keys will be affected by the 'AccelerateKeys' tag, see the Key Capture Overview for a more detailed explanation of Accelerator Keys. Accelerator Keys are only applicable when RhoElements is run with the Internet Explorer engine on a Windows CE device.

Key           Code    Usual Behavior               Special behavior in Internet Explorer

Left Arrow    0x25    Cursor left                   Scroll window left
Right Arrow   0x27    Cursor right                  Scroll window right
Up Arrow      0x26    Cursor up                     Scroll window up
Down Arrow    0x28    Cursor down                   Scroll window down
Backspace     0x08    Delete previous character.   Navigate to previous page
Enter         0x0D    Cursor line feed              Submit form
Tab           0x09    Advance to next control       Advance to next control

###Remapping a key to itself
If a key is remapped to itself then RhoElements will appear to hang because if that key is pressed it will generate another press of the same key, and so on forever. The same will happen if for instance key 1 is remapped to key 2, which in turn is remapped to key 1.

###Special characters
On some devices certain keys containing special characters trigger two separate key events. This happens because such characters are translated by the platform into the combination of a Shift and a Base Key. Characters behaving in such way are $, %, &, ", (, ), !, :, ?, #, _, @.

###Device Specific Exceptions
Certain devices may map their function keys to apparently normal keys, for example the VC6090 maps the '{' key to F12 and the '}' key to F14. In order to capture those two keys it is necessary to enable F12 and F14 in the Configuration Settings. You may also find on some devices special keys like 'OK' return the same code as a function key, depending on your keyboard layout.

###Use of Key Capture module on Localized Operating Systems
Users of the key capture module with Chinese, Korean and Japanese operating systems should bear the following in mind: Internally the KeyCapture module stores key representations as VK codes, therefore the key event will always return VK_PROCESSKEY (229) and keys can not be individually specified. In JavaScript the DOM element's keyup event can be used as an indication of which key has been pressed.

###Build Configuration
To build the keycapture API into your application you must specify the 'hardwarekeys' extension and specify your application type to be 'rhoelements'.

##Examples



###Disabling all keys

This shows how to capture all hardware keys so that they are not propagated through to the page.
<pre class='CodeRay'><code>

                    
    Rho.KeyCapture.captureKey(false, "ALL", callback);
                            
                            
</code></pre>

###Capturing all keys

This shows how to get notified when any hardware key is pressed (except trigger keys). In this example, the keys will pass through to the web page.
<pre class='CodeRay'><code>

                    
    function keyCallback(result)
    {
        alert("this key has just been pressed!: " + result.keyValue);
    }

    Rho.KeyCapture.captureKey(true, "ALL", keyCallback);
                            
                            
</code></pre>

###Remapping ET1 P keys to arrow keys

In this example, the P1 and P2 keys of the ET1 tablet are remapped to the left key and right key respectively.
<pre class='CodeRay'><code>

                
function remap()
{
    Rho.KeyCapture.remapKey('0x19','0x15'); //P1, left
    Rho.KeyCapture.remapKey('0x18','0x16'); //P2, right
}
                        
                        
</code></pre>

###Trigger capture

This example notifies the user when a trigger key is pressed.
<pre class='CodeRay'><code>

                
function trigger()
{
    Rho.KeyCapture.captureTrigger(triggerCallback);
}

function triggerCallback(result)
{
    alert("this trigger event has just been received!: " + result.triggerFlag);
}
                        
                        
</code></pre>

###HomeKeyValue

The following example will navigate to the RhoElements start page when return is pressed.
<pre class='CodeRay'><code>

                
function goHome()
{
    Rho.KeyCapture.homeKeyValue = '0x0D';
}
                        
                        
</code></pre>

###iPhoneVolume

The following example shows how to capture the iPhone Volume Up trigger.
<pre class='CodeRay'><code>

                
    function keyCallback(result)
    {
        if(result.keyValue == Rho.KeyCapture.IPHONE_VOLUME_UP){
            //do something
        }
    }

    Rho.KeyCapture.captureKey(true, Rho.KeyCapture.IPHONE_VOLUME_UP, keyCallback);
                        
                        
</code></pre>