#Notification


## Overview
The Notification API allows you to provide feedback to the user, either auditory, tactile or visual. Use this API to give a visual popup window, sound the device beeper or illuminate the device LEDs (hardware permitting).
## Enabling the API
In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* ebapi-modules.js - this file contains all available Enterprise Browser APIs

If you wish to minimize the amount of JavaScript being included, you can choose to only include the individual API that your application is using:

ex:

* ebapi.js - core APIs needed 
* eb.notification.js - just the Notification API
* other individual JavaScript files included with the Enterprise Browser installation

        


##Methods



### beep(<span class="text-info">HASH</span> propertyMap)
<p>If the device is equipped with a beeper then a beep will be emitted. Not supported on iOS devices.</p>


####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>
<p>The properties associated with the beep.</p>
 </p></li><ul><li>frequency : <span class='text-info'>Integer</span><span class='label '> Default: 2000</span><p>
<p>The frequency of the beep, in Hz.</p>
 </p></li><li>volume : <span class='text-info'>Integer</span><span class='label '> Default: 1</span><p>
<p>A number between 0 and 3. 0 represents minimum volume and 3 is maximum volume, the decibels each volume level represents is device dependant.</p>
 </p></li><li>duration : <span class='text-info'>Integer</span><span class='label '> Default: 1000</span><p>
<p>The duration of the beep, in milliseconds.</p>
 </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Notification.beep(<span class="text-info">HASH</span> propertyMap)</code> 


### hidePopup()
<p>Closes the current popup window. On Windows Mobile/CE only Status window, displayed by showStatus can be hide.</p>


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
	* <code>EB.Notification.hidePopup()</code> 


### playFile(<span class="text-info">STRING</span> path, <span class="text-info">STRING</span> media_type)
<p>Play an audio file if that media type is supported by the device.</p>


####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>
<p>The full path to the file, ending in the file name and extension.</p>
 </p></li><li>media_type : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><span class='label '> Default: </span><p>
<p>Media type can be specified explicitly, or can be recognized from the file extension. The known file extensions are &ldquo;.mp3&rdquo; &ndash; &ldquo;audio/mpeg&rdquo; and &ldquo;.wav&rdquo; &ndash; &ldquo;audio/x-wav&rdquo;.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Notification.playFile(<span class="text-info">STRING</span> path, <span class="text-info">STRING</span> media_type)</code> 


### showPopup(<span class="text-info">HASH</span> propertyMap)
<p>Bring the application up front and show a message in a popup window. The message can be passed as a string or a hash. The popup window closes after you click on one of the buttons in the <code>button</code> array. Icon is not supported on iOS devices.</p>


####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>
<p>The properties associated with the popup.</p>
 </p></li><ul><li>message : <span class='text-info'>String</span><span class='label '> Default: </span><p>
<p>Text displayed in the popup window.</p>
 </p></li><li>title : <span class='text-info'>String</span><span class='label '> Default: </span><p>
<p>Title of the popup window.</p>
 </p></li><li>icon : <span class='text-info'>String</span><span class='label '> Default: </span><p>
<p>Icon to be displayed in the popup window. path to an image, or :alert for ! icon, :question for ? icon, :info for information icon. On Windows Mobile/CE only predefined icons are supported.</p>
 Platforms:
Android </p></li><li>buttons : <span class='text-info'>Array</span><span class='label '> Default: </span><p>
<p>Array of buttons. Specify each button either by hash with :id and :title keys or string.When using strings, the <code>id</code> and <code>title</code> will have the same value.
For example:</p>

<pre><code>:::javascript
buttonHash = [{id:'yes',title:'Ok to Delete'},{id:'no',title:'No'}];
buttonString = ['Yes', 'No'];
</code></pre>

<blockquote><p>NOTE: For Android, if TYPE_NOTIFICATION_DIALOG is used, every button in the notification uses an icon. By default a star icon is used. If the button id is &lsquo;accept&rsquo; then the system accept icon is used. If the button id is &lsquo;cancel&rsquo; then the system cancel icon is used.</p></blockquote>
 </p></li><li>types : <span class='text-info'>Array</span><p>
<p>List which notification kinds will be shown. Several types may be listed at same time. <code>TYPE_NOTIFICATION</code> and <code>TYPE_NOTIFICATION_DIALOG</code> take no effect if application is in the foreground. By default <code>[Rho.Notification.TYPE_DIALOG, Rho.Notification.TYPE_NOTIFICATION]</code> is used.
Example:</p>

<pre><code>:::javascript
typeToast = [Rho.Notification.TYPE_DIALOG, Rho.Notification.TYPE_TOAST];
</code></pre>
 </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>Constant: EB.Notification.TYPE_DIALOG <br/> String:dialog</dt><dd>
<p>Show common dialog window with buttons visible if application is active.</p>
</dd><dt>Constant: EB.Notification.TYPE_NOTIFICATION <br/> String:notification</dt><dd>
<p>Show message in Android notification bar if application is at background. Touch the message opens the application.</p>
</dd><dt>Constant: EB.Notification.TYPE_NOTIFICATION_DIALOG <br/> String:notificationDialog</dt><dd>
<p>This is the same as <code>TYPE_DIALOG</code> + <code>TYPE_NOTIFICATION</code>.</p>

<blockquote><p>NOTE: In Android 4.1 and above, buttons are also added to the notification message so the user can interact with the application without application activation (dialog window is not shown if user pressed button in notification). Buttons are not always displayed in the notification area &ndash; this depends on screen size and layout and system decides whether to show buttons. You need to drag notification to make buttons appear.</p></blockquote>
</dd><dt>Constant: EB.Notification.TYPE_TOAST <br/> String:toast</dt><dd>
<p>Show toast window with message at foreground for a short time. The toast is visible nevertheless the application is at background or foreground but is not shown same time with any foreground pop-up.</p>
</dd></dl></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>button_id : <span class='text-info'>STRING</span><p>
<p>ID assigned to the button when showing the popup.</p>
 </p></li><li>button_title : <span class='text-info'>STRING</span><p>
<p>Button text.</p>
 </p></li><li>button_index : <span class='text-info'>STRING</span><p>
<p>The index in the &lsquo;buttons&rsquo; array.</p>
 </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Notification.showPopup(<span class="text-info">HASH</span> propertyMap)</code> 


### showStatus(<span class="text-info">STRING</span> title, <span class="text-info">STRING</span> status_text, <span class="text-info">STRING</span> hide_button_label)
<p>Display a window containing a status message. The window closes after the user clicks on its hide button. Note: Android will show a toast message for a short time in addition to a dialog window.</p>


####Parameters
<ul><li>title : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>
<p>The title on the status message popup window.</p>
 </p></li><li>status_text : <span class='text-info'>STRING</span><p>
<p>The status message displayed in the popup status window.</p>
 </p></li><li>hide_button_label : <span class='text-info'>STRING</span><p>
<p>The label text for the hide button in the popup status window. On Windows Mobile/CE Close icon used to hide the status window.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Notification.showStatus(<span class="text-info">STRING</span> title, <span class="text-info">STRING</span> status_text, <span class="text-info">STRING</span> hide_button_label)</code> 


### vibrate(<span class="text-info">Integer</span> duration)
<p>Vibrate the device&rsquo;s pager hardware. Need &lsquo;vibrate&rsquo; capability set at build.yml for Android.</p>


####Parameters
<ul><li>duration : <span class='text-info'>Integer</span> <span class='label label-info'>Optional</span><span class='label '> Default: 1000</span><p>
<p>The duration of the vibration, in milliseconds. Note you may also need to add the vibration capability to your build.yml file. See remarks for maximum duration. iOS devices have fixed system vibration time. It could not be changed. Android and Windows devices have default vibration time 1000 ms.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Notification.vibrate(<span class="text-info">Integer</span> duration)</code> 


##Remarks



###Maximum vibrate duration
<p>On Android, the maximum duration for vibrate is 15 seconds (15000ms).</p>


###Spuriously reported hardware
<p>Some Windows Mobile or CE devices may report hardware which is not present on the device such as a pager or LEDs. This is a limitation of the underlying driver layer reporting spurious results to the application, though all real hardware will be controllable.</p>
