#ScreenOrientation


## Overview
The ScreenOrientation Module is used to control the screen orientation / layout and register to receive an event when it changes.
## Enabling the API
In order to use this API you must include the following extension in your `build.yml`.
    :::ruby
    extensions: ["screenorientation"]

## JavaScript Usage
Be sure to review the [JavaScript API Usage](/guide/api_js) guide for important information about using this API in JavaScript.

## Ruby Usage
Be sure to review the [Ruby API Usage](/guide/api_ruby) guide for important information about using this API in Ruby.
        


##Methods



### leftHanded()
Sets the screen orientation to left-handed orientation. Note the webpage will not reformat in line with the new screen size automatically.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.ScreenOrientation.leftHanded()</code> </li></ul></li></ul>

### normal()
Sets the screen orientation to default device orientation.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.ScreenOrientation.normal()</code> </li></ul></li></ul>

### rightHanded()
Sets the screen orientation to right-handed orientation. Note the webpage will not reformat in line with the new screen size automatically.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.ScreenOrientation.rightHanded()</code> </li></ul></li></ul>

### setScreenOrientationEvent()
Sets the callback to be called when a screen orientation event occurs.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.ScreenOrientation.setScreenOrientationEvent()</code> </li></ul></li></ul>

### upsideDown()
Sets the screen orientation to upside down, useful if presenting the device to a customer to obtain a signature.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.ScreenOrientation.upsideDown()</code> </li></ul></li></ul>

##Properties



###autoRotate

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

Enables or Disables auto-rotation of the screen orientation when the device is rotated. For Windows Mobile/CE devices, support is limited to only Motorola Solutions devices with IST Sensor support.
####Params
<p><strong>Default:</strong> true</p>
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.ScreenOrientation.autoRotate</code> </li></ul></li></ul>


####Platforms

* Android
* Windows Mobile/CE