#Key Handling in RhoElements
<b>Using a combination of Key Capture and Accelerator Keys it is possible for the web page designer to fully customise how RhoElements processes keyboard button presses, this document outlines how this can be achieved.</b>

## Key Capture </span>

The key capture meta tag is used to either navigate to a URL or execute a JavaScript function when the specified button is pressed. All keys on the device can be caught using this tag except the modifier keys (coloured buttons) or scanner trigger, the latter being intercepted using the TriggerEvent which is not covered in this document.

The meta tag can specify whether the intercepted key is allowed to pass through (dispatch) to the web page or not, this requires a degree of thought when developing applications. Keys caught and not dispatched will never be seen by the web page, so catching the number '1' will prevent the user from typing a '1' into any text box unless the key is also dispatched.

The Key capture meta tag will only last for the lifespan of the currently loaded page but can also be cancelled in JavaScript by setting their content to the empty string, "".

	<META HTTP-Equiv="KeyCapture" content="KeyValue:All; KeyEvent:url('javascript:onKeys('%s')')">
	<SCRIPT>
	function unsetOnAllKeys()
	{
		keyCapture.keyEvent = url('');  
	}
	</SCRIPT>

##Capturing a Single Key 

KeyCapture-KeyValue:0xnn will navigate to the URL or JavaScript function specified by the KeyEvent when the key specified in the "nn" part of the tag is pressed, where nn is a hexadecimal number. For most keys an ASCII table can be used for mapping keys to hex numbers, if unsure first use KeyCapture-KeyValue:All and capture your desired a key with a KeyEvent:url('javascript:OnAllKeys('%s');'). The %s will be replaced with the code for your desired key in decimal, convert this to hex and you can then replace the nn above. The key will not be passed onto the Browser.

Specifying the additional Parameter Dispatch:True will do exactly the same as KeyCapture-KeyValue:0xnn but will also send the key press on to the browser.

In the following example the browser will disallow the user from pressing left to advance to the previous character in a textbox, however the function 'keyTest' is called for both left and right keys.

	<META HTTP-Equiv="KeyCapture" content="KeyValue:0x25; KeyEvent:url('javascript:keyTest('Left');')">
	<META HTTP-Equiv="KeyCapture" content="KeyValue:0x27; Dispatch:True; KeyEvent:url('javascript:keyTest('Right');')">

KeyCapture can accept an alternative parameter to send a different key to the browser to that which was pressed, the following example will delete the previous character in a textbox when the user presses the left arrow

	<META HTTP-Equiv="KeyCapture" content="KeyValue:0x25; RemapTo:0x08">

This has a number of applications, for example code written for a device with a certain keyboard can be easily ported to another device which may only have a subset of the keys present on the original device. The key being remapped to does not have to exist asa physical key on the device.

##Capturing All Keys

KeyCapture-KeyValue:All acts in exactly the same was as capturing a single key but will action every key pressed, similarly you can also specify Dispatch:True to ensure the pressed key still reaches the browser.

Capturing a single key will always take priority over capturing all keys, if both are specified on a web page developers should be aware of a potential pitfall. Specifying KeyCapture-KeyValue:0xnn to navigate to a different page and also specifying KeyCapture-KeyValue:All to invoke a JavaScript function on the original page doesn't make logical sense as by the time KeyCapture-KeyValue:All is called the JavaScript function will be out of context.

If you specify a KeyCapture to occur with Dispatch:True and an associated KeyEvent be aware that the KeyEvent will be executed before the key reaches the browser component. If the key executes some JavaScript which steals focus (e.g. brings up an alert box) the key will be sent to whatever currently has focus.

Be aware that alert boxes take a while for the browser to create and the key is sent immediately after the JavaScript begins executing, it is <i>unlikely</i> the following will bring up an alert box and then immediately clear it

	<META HTTP-Equiv="KeyCapture" content="KeyValue:0x25; RemapTo:0x0D">
	<META HTTP-Equiv="KeyCapture" content="KeyValue:All; Dispatch:True; KeyEvent:url('javascript:keyTest('BOX');')">
	<SCRIPT>
	function keyTest(param)
	{
	   alert(param);
	}
	</SCRIPT>


Using KeyCapture-RemapTo:0xnn to remap to a different key will start the whole process over, consider the following example:
	<META HTTP-Equiv="KeyCapture" content="KeyValue:0x25; RemapTo:0x08">
	<META HTTP-Equiv="KeyCapture" content="KeyValue:All; Dispatch:True; KeyEvent:url('javascript:keyTest('ALL');')">

When the left arrow is pressed it is intercepted by RhoElements before reaching the browser component and a backspace key is sent. The backspace is intercepted by RhoElements and the OnAllKeysDispatch tag will cause the keyTest() JavaScript function to be executed, the backspace is then allowed to continue to the browser to delete the previous character. As already stated if keyTest changes the current focus (e.g. brings up an alert) the character will not be deleted.

Although it is theoretically possible to chain together a number of key remaps it is not recommended, e.g.

	<META HTTP-Equiv="KeyCapture" content="KeyValue:0x25; RemapTo:0x26">
	<META HTTP-Equiv="KeyCapture" content="KeyValue:0x26; RemapTo:0x27">
	<META HTTP-Equiv="KeyCapture" content="KeyValue:0x27; RemapTo:0x28">
	<META HTTP-Equiv="KeyCapture" content="KeyValue:0x28; RemapTo:0x08">

##Control key
Control keys are only implemented on CE devices. For example CTRL+C can be configured to copy text and CTRL+V will paste that text. See the [Configuration Settings](ConfigurationSettings) for details of how to achieve this.
		
Take the example of the user pressing CTRL+C, this is seen by RhoElements as two key presses, 'CTRL' and 'C', both of which must reach the browser in order to copy text, e.g. specifying any of the following would cause text to not be copied:

	<META HTTP-Equiv="KeyCapture" content="KeyValue:0x11; KeyEvent:url('javascript:keyTest('CTRL');')">

Or
	<META HTTP-Equiv="KeyCapture" content="KeyValue:0x43; KeyEvent:url('javascript:keyTest('C');')">

If you want to perform custom actions for the 'CTRL' or 'C' keys and still allow CTRL+C you will need to use use the Dispatch:True parameter.

##JavaScript OnKeyDown Event
The onkeydown event is used in JavaScript to capture all keys pressed on the keyboard, RhoElements uses its own meta tag to handle key processing and as such does not fully support the onkeydown event. Developers are strongly encouraged to use the KeyCapture meta tag in preference to the onkeydown event as the same functionality can be achieved with fewer lines of code. Consider the example of making the enter key function as the tab key, using onkeydown it will look like:
		
	<META HTTP-Equiv="KeyCapture" Content="AccelerateKey:All">
	<script type="text/javascript">
	document.onkeydown=enterToTab;
	function enterToTab(event) 
	{
	   k = window.event.keyCode;
	   if(k == 13) 
	   {
		  if(nextControl.length != 0) 
		  {
			 eval('form1.' + nextControl + '.focus()');
		  }
		  return false;
	   }
	}
	</script>

In RhoElements this can be rewritten as:

	<META HTTP-Equiv="KeyCapture" Content="AccelerateKey:All">
	<META HTTP-Equiv="KeyCapture" Content="KeyValue:0x0D; RemapTo:0x09">
The onkeydown JavaScript will need to execute enterToTab for each key press slowing the application whereas RhoElements will map each enter key press to a tab key.

The Accelerate ALL meta tag (explained in the next section) does offer near full support for the onkeydown event and the top code block will function on RhoElements, the only keys which can not be caught are 'Up arrow', 'Down arrow', 'Left arrow' and 'Right arrow'. The NoSIP edit box will also display similar behaviour in its OnKeyDown event. Using the KeyCapture meta tag with Dispatch:True will intercept keys before they reach the browser component and therefore captured keys will not invoke the onkeydown event.

##Untrappable Keys
Certain keys are not trappable in RhoElements, those which are intercepted by the keyboard driver and never passed to the application. Examples of untrappable keys include but are not limited to: Orange key, blue key, display backlight, Shift Key and on certain devices the calibration shortcut (blue key + backspace). Also the Home key on the ET1 device

##Accelerator Keys </span>
	
<b>Accelerator Keys are only applicable when using the Internet Explorer engine on Windows CE devices, see the [Configuration Settings](ConfigurationSettings) page for more information on the IE engine.</b>

##Overview 
		
Accelerator keys are specific to Windows CE and the Internet Explorer engine and define the behaviour of the keys which perform some special browser behaviour:
<table class="re-table">

<tr><th>Key</th><th>           Code</th><th>    Usual Behaviour</th><th>               Special behaviour in Internet Explorer</th></tr>
<tr><td>Left Arrow </td><td>   0x25 </td><td>   Cursor left  </td><td>                 Scroll window left </td></tr>
<tr><td class="clsEvenRow">Right Arrow</td><td class="clsEvenRow">   0x27  </td><td class="clsEvenRow">  Cursor right  </td><td class="clsEvenRow">                Scroll window right</td></tr>
<tr><td>Up Arrow </td><td>     0x26  </td><td>  Cursor up	  </td><td>                  Scroll window up</td></tr>
<tr><td class="clsEvenRow">Down Arrow </td><td class="clsEvenRow">   0x28  </td><td class="clsEvenRow">  Cursor down   </td><td class="clsEvenRow">                Scroll window down</td></tr>
<tr><td>Backspace </td><td>    0x08  </td><td>  Delete previous character. </td><td>   Navigate to previous page</td></tr>
<tr><td class="clsEvenRow">Enter </td><td class="clsEvenRow">        0x0D  </td><td class="clsEvenRow">  Cursor line feed      </td><td class="clsEvenRow">        Submit form</td></tr>
<tr><td>Tab </td><td>          0x09  </td><td>  Advance to next control </td><td>      Advance to next control</td></tr>
<tr><td colspan="4" align="center">Table 1 : RhoElements Accelerate Keys</td></tr>
</table>
A web page written for RhoElements may not always wish to implement the special browser behaviour, e.g. to maintain the flow of the application the developer may not want the user pressing 'backspace' to navigate to the previous page. The 'AccelerateKey' meta tag is used to customise which accelerator functionality is implemented and can take three values, 'none', 'norm' and 'all'.

In order for any accelerator key to be actioned the key must reach the browser, i.e. specifying the KeyCapture tag without the Dispatch:True parameter will disable all accelerator key behaviour regardless of the AccelerateKey tag.

##Accelerate NORM 
	
The Accelerate 'norm' parameter is reserved for 'normal' RhoElements behaviour, that which will suit the majority of RhoElements applications. This is the default behaviour.

The following table outlines the behaviour of RhoElements under Accelerate NORM, provided the keys are not swallowed by KeyCapture:
<table class="re-table">

<tr><th>Key</th><th>            Cursor inside text box</th><th>	   Cursor outside text box</th></tr>

<tr><td>Left Arrow</td><td>     Cursor left </td><td>                Scroll window left</td></tr>
<tr><td class="clsEvenRow">Right Arrow</td><td class="clsEvenRow">    Cursor right </td><td class="clsEvenRow">               Scroll window right</td></tr>
<tr><td>Up Arrow</td><td>       Cursor up </td><td>                  Scroll window up</td></tr>
<tr><td class="clsEvenRow">Down Arrow</td><td class="clsEvenRow">     Cursor down </td><td class="clsEvenRow">                Scroll window down</td></tr>
<tr><td>Backspace</td><td>      Delete previous character</td><td>   No Action</td></tr>
<tr><td class="clsEvenRow">Enter</td><td class="clsEvenRow">          No Action </td><td class="clsEvenRow">                  No Action</td></tr>
<tr><td>Tab</td><td>            Advance to next control</td><td>     Advance to next control</td></tr>
<tr><td colspan="3" align="center">Table 2 : Accelerate Keys - 'NORM'al Behaviour</td></tr>
</table>
##Accelerate None 
	
The Accelerate 'none' parameter will disable all Accelerator key behaviour. Accelerator keys can still be caught using the KeyCapture meta tag but the keys themselves will have no effect on the application.
<table class="re-table">
<tr><th>	Key</th><th>            Cursor inside text box</th><th>	   Cursor outside text box</th></tr>
<tr><td>Left Arrow</td><td>     No Action</td><td>	               No Action</td></tr>
<tr><td class="clsEvenRow">Right Arrow</td><td class="clsEvenRow">    No Action</td><td class="clsEvenRow">	               No Action</td></tr>
<tr><td>Up Arrow</td><td>       No Action</td><td>	               No Action</td></tr>
<tr><td class="clsEvenRow">Down Arrow</td><td class="clsEvenRow">     No Action</td><td class="clsEvenRow">	               No Action</td></tr>
<tr><td>Backspace</td><td>      No Action</td><td>	               No Action</td></tr>
<tr><td class="clsEvenRow">Enter</td><td class="clsEvenRow">          No Action</td><td class="clsEvenRow">	               No Action</td></tr>
<tr><td>Tab</td><td>            No Action</td><td>	               No Action</td></tr>

>tr><td colspan="3" align="center">Table 3 : Accelerate Keys NONE Behaviour</td></tr>
</table>

##Accelerate ALL
	
The Accelerate 'all' parameter indicates to RhoElements that the user wishes all accelerator keys to be handled as they would be in Internet Explorer.

The following table outlines the behaviour of RhoElements under Accelerate ALL, provided the keys are not swallowed by the KeyCapture tag:
<table class="re-table">
<tr>
<tr><th>Key</th>            <th>Cursor inside text box</th>	                    <th>Cursor outside text box</th></tr>
<tr><td>Left Arrow</td><td>     Cursor left </td><td>                                 Scroll window left</td></tr>
<tr><td class="clsEvenRow">Right Arrow</td><td class="clsEvenRow">    Cursor right</td><td class="clsEvenRow">                                 Scroll window right</td></tr>
<tr><td>Up Arrow</td><td>       Cursor up       </td><td>                             Scroll window up</td></tr>
<tr><td class="clsEvenRow">Down Arrow</td><td class="clsEvenRow">     Cursor down              </td><td class="clsEvenRow">                    Scroll window down</td></tr>
<tr><td>Backspace<td></td>      Delete previous character        </td><td>            Navigate to previous page</td></tr>
<tr><td class="clsEvenRow">Enter</td><td class="clsEvenRow">          In multi-line text area:   Line feed  <br/>In any other form control: Submit the form </td><td class="clsEvenRow">      No Action<br/>No Action</td></tr>
	   
<tr><td>Tab</td><td>            Advance to next control                      Advance to next control</td></tr>
<tr><td colspan="3" align="center">Table 4 : Accelerate Keys ALL Behaviour</td></tr>
</table>
##Windows Mobile 
	
As already stated Accelerator keys are only applicable to Windows CE, Windows Mobile devices will behave as follows:
<table class="re-table">
<tr>
<th>Key</th>            <th>Cursor inside text box</th>	                    <th>Cursor outside text box</th>
</tr>
<tr>
<td>Left Arrow</td><td>    Cursor left </td><td>                                 Scroll window left</td>
</tr>
<tr>
<td class="clsEvenRow">Right Arrow</td><td class="clsEvenRow">    Cursor right </td><td class="clsEvenRow">                                Scroll window right</td>
</tr>
<tr>
<td>Up Arrow</td><td>       Back to form control above *</td><td>                 Back to form control above</td>
</tr>
<tr>
<td class="clsEvenRow">Down Arrow</td><td class="clsEvenRow">     Advance to form control below *</td><td class="clsEvenRow">              Advance to form control below</td>
</tr>
<tr>
<td>Backspace</td><td>      Delete previous character</td><td>                    No Action</td>
</tr>
<tr>
<td class="clsEvenRow">Enter</td><td class="clsEvenRow">          In multi-line text area:   Line feed<br>In any other form control: No Action</td><td class="clsEvenRow"	>         No Action<br/>No Action</td>
</tr>
<tr>
<td>Tab </td><td>           Advance to next control</td><td>                      Advance to next control</td>
</tr>
<tr>
<td colspan="3" align="center">Table 5 : Accelerate Keys under Windows Mobile</td>
</tr>
</table>
Although this behaviour can not be customised with the 'AccelerateKey' metatag the developer can still use the KeyCapture tag to intercept the keys and disable the behaviour. In a multi-line text area pressing up when the cursor is on the top line will go back to the previous form control however pressing down will move to the next line (if applicable). Similarly if the cursor is in the bottom-most line of the text area pressing up will move the cursor to the previous line; pressing down will advance to the next control.

Although the AccelerateKey behaviour can not be customised with the 'AccelerateKey' metatag the developer can still use the KeyCapture tag to intercept the keys and disable the behaviour.