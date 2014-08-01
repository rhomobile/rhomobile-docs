#ScreenOrientation


## Overview
The ScreenOrientation Module is used to control the screen orientation / layout and register to receive an event when it changes.
## Enabling the API
In order to use this API you must TBD INSERT Eb specific instructions here

        


##Methods



### leftHanded()
<p>Sets the screen orientation to left-handed orientation. Note the webpage will not reformat in line with the new screen size automatically.</p>


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
	* <code>EB.ScreenOrientation.leftHanded()</code> 


### normal()
<p>Sets the screen orientation to default device orientation.</p>


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
	* <code>EB.ScreenOrientation.normal()</code> 


### rightHanded()
<p>Sets the screen orientation to right-handed orientation. Note the webpage will not reformat in line with the new screen size automatically.</p>


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
	* <code>EB.ScreenOrientation.rightHanded()</code> 


### setScreenOrientationEvent()
<p>Sets the callback to be called when a screen orientation event occurs.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.ScreenOrientation.setScreenOrientationEvent()</code> 


### upsideDown()
<p>Sets the screen orientation to upside down, useful if presenting the device to a customer to obtain a signature.</p>


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
	* <code>EB.ScreenOrientation.upsideDown()</code> 


##Properties



###autoRotate

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Enables or Disables auto-rotation of the screen orientation when the device is rotated. For Windows Mobile/CE devices, support is limited to only Motorola Solutions devices with IST Sensor support.</p>

####Params
<p><strong>Default:</strong> true</p>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.ScreenOrientation.autoRotate</code>



####Platforms

* Android
* Windows Mobile/CE