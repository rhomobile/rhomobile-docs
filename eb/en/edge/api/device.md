#Device


## Overview
The Device API provides access to some device level functionality that is only available on Symbol devices such as suspend, calibrate, powerOff, wake, reboot etc.
## Enabling the API
There are two methods of enabling the Device API: 

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
To include single APIs, you must first include the `ebapi.js` in your HTML as well as the API file you want to use. For instance, to use the Device API, I would add the following code to my HTML file(s), assuming the API files have been copied to the same directory as the HTML.

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi.js"></script>
    <script type="text/javascript" charset="utf-8" src="eb.device.js"></script>

The ebapi.js file is necessary for all single API inclusions.
        


##Methods



### calibrate()
Carries out the screen calibration routine.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>Whether or not the calibration was successfully done, status will be 'success' or 'failed'. </p></li><li>message : <span class='text-info'>STRING</span><p>If 'status' == 'success', the message will contain 'Calibration was done succesfully.' and if 'status' == 'failed', the message will contain 'Calibration was failed.'. </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Device.calibrate()</code> 


### idle()
Puts the device into idle mode. In this mode, the screen display is turned off. Callback is triggered only for 'failed' status.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>If the mode of the device was not changed to idle mode, status will be 'failed'. In all other cases, it will remain empty. </p></li><li>message : <span class='text-info'>STRING</span><p>If 'status' == 'failed', the message will contain an error message. In all other cases, it will remain empty. </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Device.idle()</code> 


### powerOff()
Puts the device into power off mode. In this mode the device will draw no power. Only supported on SB1. Callback is triggered only for 'failed' status.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>If the powerOff was unsuccessful, status will be 'failed'. In all other cases, it will remain empty. </p></li><li>message : <span class='text-info'>STRING</span><p>If 'status' == 'failed', the message will contain an error message. In all other cases, it will remain empty. </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Device.powerOff()</code> 


### reboot(<span class="text-info">STRING</span> bootType)
It reboots the terminal using either a Warm or Cold software boot (as specified). Note on CE6 devices a "ColdCAD" boot is required to replicate the Coldboot key sequence, e.g. 1+9+Power on an MC3000. Callback is triggered only for 'failed' status.

####Parameters
<ul><li>bootType : <span class='text-info'>STRING</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>If the reboot was unsuccessful, status will be 'failed'. In all other cases, it will remain empty. </p></li><li>message : <span class='text-info'>STRING</span><p>If 'status' == 'failed', the message will contain an error message. In all other cases, it will remain empty. </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Device.reboot(<span class="text-info">STRING</span> bootType)</code> 


### suspend()
Puts the device into suspend mode. On suspend, the device goes to hibernation mode. Callback is triggered only for 'failed' status. In some devices, the suspend doesnot happen instead it puts the device into an idle state.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>If the suspend was unsuccessful, status will be 'failed'. In all other cases, it will remain empty. </p></li><li>message : <span class='text-info'>STRING</span><p>If 'status' == 'failed', the message will contain an error message. In all other cases, it will remain empty. </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Device.suspend()</code> 


### wake()
In WM/CE, wakes the device from idle state to active state. Callback is triggered only for 'failed' status. In Android, it will turn on the display, if it was off. The callback parameter is ignored in Android platform.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>In WM/CE, if the wake was unsuccessful, status will be 'failed'. In all other cases, it will remain empty. </p></li><li>message : <span class='text-info'>STRING</span><p>In WM/CE, if 'status' == 'failed', the message will contain an error message. In all other cases, it will remain empty. </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Device.wake()</code> 


##Remarks



###General

                    
Note that some devices may not support all the API's or there is a possiblities of discrepancy across BSP's & platforms.
                    
                

###Power Off

                    
Note that some devices may not support power off feature. Those devices may either throw an error message or it may enter into Sleep mode.
                    
                

###Reboot

					
Note that in WM5.0 and above, there is no software difference between a warm and a cold boot as the device uses persistent storage; both the file and registry will remain the same after boot. In WM/CE, not all device support Cold or ColdCAD feature. Device may warm boot even though any of these option has been selected.
					
				

###Interaction with Unattended Method of the Push Module

					
The suspend functionality is incompatible with the unattended functionality of the push module and they should not be used together.
					
				

###wake Method

					
The wake functionality can be used along with Push module. For eg: in the push detected event the user can call the wake method to wake the device.
					
				