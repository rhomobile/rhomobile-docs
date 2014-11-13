#Notification


## Overview
The Notification API allows you to provide feedback to the user, either auditory, tactile or visual. Use this API to give a visual popup window, sound the device beeper or illuminate the device LEDs (hardware permitting).
## Enabling the API
There are two methods of enabling the Notification API: 

* Include all ebapi modules or 
* Include only the API modules you need 

For either of these methods, you'll need to include files from the `/Enterprise Browser/JavaScript Files/Enterprise Browser` directory on the computer that you installed the Enterprise Browser.

### Include all JS API modules
To include all JS APIs, you must copy the ebapi-modules.js file to a location accessible by your app's files and include the JavaScript file in your app. For instance, to include the modules file in your index.html, with the file in the same directory as your index.html, you would add the following line to the <head> section of your index.html:

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi-modules.js"></script>

> Note: that the pathing for this file is relative to the current page.

This will define the EB class within the page. Any page you need to use the modules will need to have the .js file included in this fashion.

### Include only the modules you need
To include single APIs, you must first include the `ebapi.js` in your HTML as well as the API file you want to use. For instance, to use the Notification API, I would add the following code to my HTML file(s), assuming the API files have been copied to the same directory as the HTML.

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi.js"></script>
    <script type="text/javascript" charset="utf-8" src="eb.notification.js"></script>

The ebapi.js file is necessary for all single API inclusions.

        


##Methods



### beep(<span class="text-info">HASH</span> propertyMap)
If the device is equipped with a beeper then a beep will be emitted. Not supported on iOS devices.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>The properties associated with the beep. </p></li><ul><li>frequency : <span class='text-info'>Integer</span><span class='label '> Default: 2000</span><p>The frequency of the beep, in Hz. </p></li><li>volume : <span class='text-info'>Integer</span><span class='label '> Default: 1</span><p>A number between 0 and 3. 0 represents minimum volume and 3 is maximum volume, the decibels each volume level represents is device dependant. </p></li><li>duration : <span class='text-info'>Integer</span><span class='label '> Default: 1000</span><p>The duration of the beep, in milliseconds. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Notification.beep(<span class="text-info">HASH</span> propertyMap)</code> 


### hidePopup()
Closes the current popup window. On Windows Mobile/CE only Status window, displayed by showStatus can be hide.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Notification.hidePopup()</code> 


### playFile(<span class="text-info">STRING</span> path, <span class="text-info">STRING</span> media_type)
Play an audio file if that media type is supported by the device.

####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>The full path to the file, ending in the file name and extension. </p></li><li>media_type : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><span class='label '> Default: </span><p>Media type can be specified explicitly, or can be recognized from the file extension. The known file extensions are ".mp3" - "audio/mpeg" and ".wav" - "audio/x-wav". </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Notification.playFile(<span class="text-info">STRING</span> path, <span class="text-info">STRING</span> media_type)</code> 


### showPopup(<span class="text-info">HASH</span> propertyMap)
Bring the application up front and show a message in a popup window. The message can be passed as a string or a hash. The popup window closes after you click on one of the buttons in the `button` array. Icon is not supported on iOS devices.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>The properties associated with the popup. </p></li><ul><li>message : <span class='text-info'>String</span><span class='label '> Default: </span><p>Text displayed in the popup window. </p></li><li>title : <span class='text-info'>String</span><span class='label '> Default: </span><p>Title of the popup window. </p></li><li>icon : <span class='text-info'>String</span><span class='label '> Default: </span><p>Icon to be displayed in the popup window. path to an image, or :alert for ! icon, :question for ? icon, :info for information icon. On Windows Mobile/CE only predefined icons are supported. Platforms:
Android </p></li><li>buttons : <span class='text-info'>Array</span><span class='label '> Default: </span><p>Array of buttons. Specify each button either by hash with :id and :title keys or string.When using strings, the `id` and `title` will have the same value.
For example: 

    :::javascript
    buttonHash = [{id:'yes',title:'Ok to Delete'},{id:'no',title:'No'}];
    buttonString = ['Yes', 'No'];

>NOTE: For Android, if TYPE_NOTIFICATION_DIALOG is used, every button in the notification uses an icon. By default a star icon is used. If the button id is 'accept' then the system accept icon is used. If the button id is 'cancel' then the system cancel icon is used.
 </p></li><li>types : <span class='text-info'>Array</span><p>List which notification kinds will be shown. Several types may be listed at same time. `TYPE_NOTIFICATION` and `TYPE_NOTIFICATION_DIALOG` take no effect if application is in the foreground. By default `[Rho.Notification.TYPE_DIALOG, Rho.Notification.TYPE_NOTIFICATION]` is used.
Example:

    :::javascript
    typeToast = [Rho.Notification.TYPE_DIALOG, Rho.Notification.TYPE_TOAST]; </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>Constant: EB.Notification.TYPE_DIALOG <br/> String:dialog</dt><dd>Show common dialog window with buttons visible if application is active.</dd><dt>Constant: EB.Notification.TYPE_NOTIFICATION <br/> String:notification</dt><dd>Show message in Android notification bar if application is at background. Touch the message opens the application.</dd><dt>Constant: EB.Notification.TYPE_NOTIFICATION_DIALOG <br/> String:notificationDialog</dt><dd>This is the same as `TYPE_DIALOG` + `TYPE_NOTIFICATION`. 

>NOTE: In Android 4.1 and above, buttons are also added to the notification message so the user can interact with the application without application activation (dialog window is not shown if user pressed button in notification). Buttons are not always displayed in the notification area - this depends on screen size and layout and system decides whether to show buttons. You need to drag notification to make buttons appear.</dd><dt>Constant: EB.Notification.TYPE_TOAST <br/> String:toast</dt><dd>Show toast window with message at foreground for a short time. The toast is visible nevertheless the application is at background or foreground but is not shown same time with any foreground pop-up.</dd></dl></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>button_id : <span class='text-info'>STRING</span><p>ID assigned to the button when showing the popup. </p></li><li>button_title : <span class='text-info'>STRING</span><p>Button text. </p></li><li>button_index : <span class='text-info'>STRING</span><p>The index in the 'buttons' array. </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Notification.showPopup(<span class="text-info">HASH</span> propertyMap)</code> 


### showStatus(<span class="text-info">STRING</span> title, <span class="text-info">STRING</span> status_text, <span class="text-info">STRING</span> hide_button_label)
Display a window containing a status message. The window closes after the user clicks on its hide button. Note: Android will show a toast message for a short time in addition to a dialog window.

####Parameters
<ul><li>title : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>The title on the status message popup window. </p></li><li>status_text : <span class='text-info'>STRING</span><p>The status message displayed in the popup status window. </p></li><li>hide_button_label : <span class='text-info'>STRING</span><p>The label text for the hide button in the popup status window. On Windows Mobile/CE Close icon used to hide the status window. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Notification.showStatus(<span class="text-info">STRING</span> title, <span class="text-info">STRING</span> status_text, <span class="text-info">STRING</span> hide_button_label)</code> 


### vibrate(<span class="text-info">Integer</span> duration)
Vibrate the device's pager hardware. Need 'vibrate' capability set at build.yml for Android.

####Parameters
<ul><li>duration : <span class='text-info'>Integer</span> <span class='label label-info'>Optional</span><span class='label '> Default: 1000</span><p>The duration of the vibration, in milliseconds. Note you may also need to add the vibration capability to your build.yml file. See remarks for maximum duration. iOS devices have fixed system vibration time. It could not be changed. Android and Windows devices have default vibration time 1000 ms. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Notification.vibrate(<span class="text-info">Integer</span> duration)</code> 


##Remarks



###Maximum vibrate duration
On Android, the maximum duration for vibrate is 15 seconds (15000ms).

###Spuriously reported hardware
Some Windows Mobile or CE devices may report hardware which is not present on the device such as a pager or LEDs. This is a limitation of the underlying driver layer reporting spurious results to the application, though all real hardware will be controllable.