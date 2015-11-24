#Camera


## Overview
The Camera API provides access to the device camera(s). Use this API to give users the ability to take a photo via one of the cameras and return it to the application. Photos can either be stored on the device as an image file or returned as a DataURI object for storage and/or display. Optionally, image files also can be transfered to online storage using the Network API.
## Enabling the API

There are two methods of enabling the Camera API:

* Include all 'ebapi' modules
* Include only the API modules you need

Both methods are explained below. 

Either way, the included files will be found in: 
`/Enterprise Browser/JavaScript Files/Enterprise Browser`,
a directory on the computer that contains the Enterprise Browser installation.

### Include all JS API modules
To include all JavaScript APIs, copy the `ebapi-modules.js` file to a location accessible by your app's files and include the JavaScript modules file in your app. For instance, to include the modules file in your `index.html`, copy the file to the same directory as your index.html and add the following line to the HEAD section of your index.html file:

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi-modules.js"></script>

> This will define the EB class within the page. **Note that the path for this file is relative to the current page** (index.html). Any page on which the modules are required will need to have the required .js file(s) included in this fashion.

### Include only the modules you need
To include individual APIs, you must first include the `ebapi.js` in your HTML, and then the additional required API file(s). For instance, to use the Camera API, add the following code to the HTML file(s). Again, this assumes that relevant API files have been copied to the same directory as the HTML.

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi.js"></script>
    <script type="text/javascript" charset="utf-8" src="eb.camera.js"></script>

> In the code lines above, notice that `ebapi.js` is included first, followed by `eb.camera.js`, which is the Camera API for Enterprise Browser. **This coding is required on each HTML page whenever an individual API will be called from that page**.

        


##Methods



### capture()
Capture the image and save it to a file.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>Whether or not the image was successfully captured. The returned string will be one of 'ok' or 'error'. </p></li><li>imageUri : <span class='text-info'>STRING</span><p>If the specified 'outputFormat' was 'image' then this field is the URI to the taken image stored on the device. If the specified 'outputFormat' was 'dataUri' then this field will be the image encoded as a Data URI, If the specified 'outputFormat' was 'imagePath' then this field will have the image path on the device. User can use image path to transfer image over http. </p></li><li>imageHeight : <span class='text-info'>INTEGER</span><p>The actual height of the image that was captured, this may differ from the requested height as the Camera will only support a finite resolutions. </p></li><li>imageWidth : <span class='text-info'>INTEGER</span><p>The actual width of the image that was captured, this may differ from the requested width as the Camera will only support a finite resolutions. </p></li><li>imageFormat : <span class='text-info'>STRING</span><p>The format in which the image was captured, either 'png' or 'jpg'. </p></li><li>message : <span class='text-info'>STRING</span><p>If the returned status is 'error' then this field will contain more information on the error. </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile
* Windows CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.capture()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Camera.capture()</code> 


### choosePicture(<span class="text-info">HASH</span> propertyMap)
Choose a picture from the album.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span> <span class='label label-info'>Optional</span><p>Provide a set of properties to configure an image, for example to specify the image size or color mode. In WM/CE,Android devices user can only specify the outputFormat in the property bag. Valid `properties` for this parameter are the properties available to this API module. Check the <a href='#api-camera?Properties'>property section</a> for applicable properties. Not providing properties to this function will use the Camera's default properties, or those previously set on the Camera instance.</p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>Whether or not the image was successfully chosen from the gallery. The returned string will be one of 'ok', 'cancel' or 'error'. </p></li><li>imageUri : <span class='text-info'>STRING</span><p>If the specified 'outputFormat' was 'image' then this field is the URI to the taken image stored on the device. If the specified 'outputFormat' was 'dataUri' then this field will be the image encoded as a Data URI, If the specified 'outputFormat' was 'imagePath' then this field will have the image path on the device. User can use image path to transfer image over http. Platforms:
Android, WM, CE </p></li><li>imageHeight : <span class='text-info'>INTEGER</span><p>The height of the image. </p></li><li>imageWidth : <span class='text-info'>INTEGER</span><p>The width of the image. </p></li><li>imageFormat : <span class='text-info'>STRING</span><p>The format of the image, either 'png' or 'jpg'. </p></li><li>message : <span class='text-info'>STRING</span><p>If the returned status is 'error' then this field will contain more information on the error. To maintain backward compatibility WM and Android platforms provides message for cancel status as well. </p></li><li>image_uri : <span class='text-info'>STRING</span><p>If the specified 'outputFormat' was 'image' then this field is the URI to the taken image stored on the device. If the specified 'outputFormat' was 'dataUri' then this field will be the image encoded as a Data URI, If the specified 'outputFormat' was 'imagePath' then this field will have the image path on the device. User can use image path to transfer image over http. Platforms:
Android, WM, CE </p></li><li>image_height : <span class='text-info'>INTEGER</span><p>It is recommended to use imageHeight in preference to this parameter. </p></li><li>image_width : <span class='text-info'>INTEGER</span><p>It is recommended to use imageWidth in preference to this parameter. </p></li><li>image_format : <span class='text-info'>STRING</span><p>It is recommended to use imageFormat in preference to this parameter. </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Camera.choosePicture(<span class="text-info">HASH</span> propertyMap)</code> 


### copyImageToDeviceGallery(<span class="text-info">STRING</span> pathToImage)
Save an image to the device gallery.

####Parameters
<ul><li>pathToImage : <span class='text-info'>STRING</span><p>The real path to the image that is to be saved in the device gallery. You need to use the RhoApplication method `expandDatabaseBlobFilePath` to have the real path, such as `Rho::RhoApplication::expandDatabaseBlobFilePath(img.image_uri)`. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Camera.copyImageToDeviceGallery(<span class="text-info">STRING</span> pathToImage)</code> 


### enumerate()
Returns the cameras present on your device, allowing you to access your device's front or back camera.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul><ul><li>cameraArray : <span class='text-info'>SELF_INSTANCE: EB.Camera</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:

* ARRAY : Array of objects.<ul><li>cameraArray : <span class='text-info'>SELF_INSTANCE: EB.Camera</span><p> </p></li></ul>

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Camera.enumerate()</code> 


### getAllProperties()
This method will return all of object/value pairs for the propertyNames of the API class.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:

* HASH : Map of all available properties<ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul>

####Platforms

* Android
* Windows Mobile

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getAllProperties()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Camera.getAllProperties()</code> 


### getCameraByType(<span class="text-info">STRING</span> cameraType)
Returns the camera of requested type if that camera exist - else return nil.

####Parameters
<ul><li>cameraType : <span class='text-info'>STRING</span><p>CameraType: 'back' or 'front' in the case of Android and 'color' or 'imager' in the case of WM, CE devices </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>SELF_INSTANCE</span></p><ul></ul>

####Returns
Synchronous Return:

* SELF_INSTANCE : Camera with requested type or nil if not requested type does not exist. Refer example section for more details.

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Camera.getCameraByType(<span class="text-info">STRING</span> cameraType)</code> 


### getDefault()
This method will return an object that represents the default instance of the API Class. For example Camera.getDefault will return a Camera object that represents the default camera.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>SELF_INSTANCE</span></p><ul></ul>

####Returns
Synchronous Return:

* SELF_INSTANCE : Default object of Module.

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Camera.getDefault()</code> 


### getProperties(<span class="text-info">ARRAY</span> arrayofNames)
This method will return a set of object/value pairs for the list of the propertyName that is passed in. The propertyNames must be a valid property of the API class.

####Parameters
<ul><li>arrayofNames : <span class='text-info'>ARRAY</span><p>List of properties I want to know about </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:

* HASH : Map of properties I want to know about<ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul>

####Platforms

* Android
* Windows Mobile

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Camera.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code> 


### getProperty(<span class="text-info">STRING</span> propertyName)
This method will return the value of the propertyName that is passed in. The propertyName must be a valid property of the API class.

####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p>The property to return info about. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING : The property to return info about.

####Platforms

* Android
* Windows Mobile

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getProperty(<span class="text-info">STRING</span> propertyName)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Camera.getProperty(<span class="text-info">STRING</span> propertyName)</code> 


### hidePreview()
Hides the preview opened by using showPreview.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile
* Windows CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.hidePreview()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Camera.hidePreview()</code> 


### setDefault(<span class="text-info">SELF_INSTANCE: EB.Camera</span> defaultInstance)
This method allows you to set the attributes of the default object instance by passing in an object of the same class.

####Parameters
<ul><li>defaultInstance : <span class='text-info'>SELF_INSTANCE: EB.Camera</span><p>An instance object that is of the same class. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Camera.setDefault(<span class="text-info">SELF_INSTANCE: EB.Camera</span> defaultInstance)</code> 


### setProperties(<span class="text-info">HASH</span> propertyMap)
This method will set the values of a list of properties for the API class. The propertyName must be a valid property for the class and must also not be read only.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>Map of properties I want to set </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.setProperties(<span class="text-info">HASH</span> propertyMap)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Camera.setProperties(<span class="text-info">HASH</span> propertyMap)</code> 


### setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)
This method will set the value of a property for the API class. The propertyName must be a valid property for the class and must also not be read only.

####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p>The one property name that I want to set </p></li><li>propertyValue : <span class='text-info'>STRING</span><p>The one property value that I want to set </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Camera.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code> 


### showPreview(<span class="text-info">HASH</span> propertyMap)
Shows the preview in user configurable viewer window.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span> <span class='label label-info'>Optional</span><p>Provide a set of properties to configure the camera. Valid `properties` for this parameter are the properties available to this API module. Check the <a href='#api-camera?Properties'>property section</a> for applicable properties. Not providing properties to this function will use the Camera's default properties, or those previously set on the Camera instance.</p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile
* Windows CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.showPreview(<span class="text-info">HASH</span> propertyMap)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Camera.showPreview(<span class="text-info">HASH</span> propertyMap)</code> 


### takePicture(<span class="text-info">HASH</span> propertyMap)
Start the camera application to take a picture. The user can capture the displayed image by interacting with the resident camera app. In Windows, this method always shows the preview in full screen and user can use the native button to capture the image.
				On wp8,wm when 'outputFormat' is 'image' then imageUri/image_uri shall have only Image name with \ sign, on WP8 ImageName shall be suffixed by DTF when 'outputFormat' is 'image'
> Note: To display an image, it is recommended that you use the full path to the image instead of a relative path. To do this, you can use the [`expandDatabaseBlobFilePath`](Application#mexpandDatabaseBlobFilePath) method of the [Application module](Application) as such:

##### Ruby
    :::ruby
    Rho::RhoApplication.expandDatabaseBlobFilePath(x.image_uri)

##### JavaScript
    :::js
    Rho.RhoApplication.expandDatabaseBlobFilePath(x.image_uri)
                

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span> <span class='label label-info'>Optional</span><p>Provide a set of properties to configure the camera, for example to specify the flashMode or compressionFormat. Valid `properties` for this parameter are the properties available to this API module. Check the <a href='#api-camera?Properties'>property section</a> for applicable properties. Not providing properties to this function will use the Camera's default properties, or those previously set on the Camera instance.</p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>Whether or not the image was successfully captured. The returned string will be one of 'ok', 'cancel' or 'error'. Platforms:
Android, WM, CE </p></li><li>imageUri : <span class='text-info'>STRING</span><p>If the specified 'outputFormat' was 'image' then this field is the URI to the taken image stored on the device. If the specified 'outputFormat' was 'dataUri' then this field will be the image encoded as a Data URI, If the specified 'outputFormat' was 'imagePath' then this field will have the image path on the device. User can use image path to transfer image over http. Platforms:
Android, WM, CE </p></li><li>imageHeight : <span class='text-info'>INTEGER</span><p>The actual height of the image that was captured, this may differ from the requested height as the Camera will only support a finite resolutions. Platforms:
Android, WM, CE </p></li><li>imageWidth : <span class='text-info'>INTEGER</span><p>The actual width of the image that was captured, this may differ from the requested width as the Camera will only support a finite resolutions. Platforms:
Android, WM, CE </p></li><li>imageFormat : <span class='text-info'>STRING</span><p>The format in which the image was captured, either 'png' or 'jpg'. Platforms:
Android, WM, CE </p></li><li>message : <span class='text-info'>STRING</span><p>If the returned status is 'error' then this field will contain more information on the error. To maintain backward compatibility WM and Android platforms provides message for cancel status as well. Platforms:
Android, WM, CE </p></li><li>image_uri : <span class='text-info'>STRING</span><p>If the specified 'outputFormat' was 'image' then this field is the URI to the taken image stored on the device. If the specified 'outputFormat' was 'dataUri' then this field will be the image encoded as a Data URI, If the specified 'outputFormat' was 'imagePath' then this field will have the image path on the device. User can use image path to transfer image over http. Platforms:
Android, WM, CE </p></li><li>image_height : <span class='text-info'>INTEGER</span><p>It is recommended to use imageHeight in preference to this parameter. Platforms:
Android, WM, CE </p></li><li>image_width : <span class='text-info'>INTEGER</span><p>It is recommended to use imageWidth in preference to this parameter. Platforms:
Android, WM, CE </p></li><li>image_format : <span class='text-info'>STRING</span><p>It is recommended to use imageFormat in preference to this parameter. Platforms:
Android, WM, CE </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.takePicture(<span class="text-info">HASH</span> propertyMap)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Camera.takePicture(<span class="text-info">HASH</span> propertyMap)</code> 


##Properties



###aimMode

####Type
<span class='text-info'>STRING</span> 
####Description
Specifies the aim behaviour when taking a picture. Applicable only for imager module.
				This Property shall accept/return one among the values mentioned in constant section which starts with AIM_...
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.aimMode</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Camera.aimMode</code> 



####Platforms

* Windows Mobile
* Windows CE

###<span class="text-info">cameraType</span>

####Type
<span class='text-info'>STRING</span> <span class='label label-warning'>Read Only</span>
####Description
<span class='label label-info'>Replaces:camera_type</span> This property is device specific. The value for this property can be either 'back' or 'front' in the case of Android devices.In the case of windows it could be either 'imager' or 'color'. WM/CE devices will use 'color'as default and if color camera not available the default value will be 'imager'. Android devices will use 'back'as default and if back camera not available the default value will be 'front'.
				This Property shall return one among the values mentioned in constant section which starts with CAMERA_TYPE_...
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.cameraType</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Camera.cameraType</code> 



####Platforms

* Android
* Windows Mobile
* Windows CE

###captureSound

####Type
<span class='text-info'>STRING</span> 
####Description
Path to a sound file resident on the device which will be played when the image is captured.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.captureSound</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Camera.captureSound</code> 



####Platforms

* Android
* Windows Mobile
* Windows CE

###<span class="text-info">colorModel</span>

####Type
<span class='text-info'>STRING</span> 
####Description
<span class='label label-info'>Replaces:color_model</span> Where supported by the hardware this property can be used to select whether to capture a color or a grayscale image.
				This Property shall accept/return one among the values mentioned in constant section which starts with COLOR_MODEL_...
				
####Params
<p><strong>Default:</strong> rgb</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.colorModel</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Camera.colorModel</code> 



####Platforms

* Android

###<span class="text-info">compressionFormat</span>

####Type
<span class='text-info'>STRING</span> 
####Description
<span class='label label-info'>Replaces:format</span> The format of the captured image in subsequent calls to takePicture(). On windows devices the format will be always .jpg type.
				This Property shall accept/return one among the values mentioned in constant section which starts with COMPRESSION_FORMAT_...
				
####Params
<p><strong>Default:</strong> jpg</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.compressionFormat</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Camera.compressionFormat</code> 



####Platforms

* Android
* Windows Mobile
* Windows CE(JPG is supported on all devices, Android, WP8 and Windows Mobile does not support PNG images)

###<span class="text-info">desiredHeight</span>

####Type
<span class='text-info'>INTEGER</span> 
####Description
<span class='label label-info'>Replaces:desired_height</span> Camera hardware is limited to taking photos in a finite number of resolutions, eg 2048x1536, 640x480 etc. Specifying a desiredHeight will request to take the photo with the specified height but if it is not supported by the hardware then the closest match will be selected. The callback received when a photo is taken contains the actual resolution of the captured photo.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.desiredHeight</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Camera.desiredHeight</code> 



####Platforms

* Android
* Windows Mobile
* Windows CE

###<span class="text-info">desiredWidth</span>

####Type
<span class='text-info'>INTEGER</span> 
####Description
<span class='label label-info'>Replaces:desired_width</span> Camera hardware is limited to taking photos in a finite number of resolutions, eg 2048x1536, 640x480 etc. Specifying a desiredWidth will request to take the photo with the specified width but if it is not supported by the hardware then the closest match will be selected. The callback received when a photo is taken contains the actual resolution of the captured photo.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.desiredWidth</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Camera.desiredWidth</code> 



####Platforms

* Android
* Windows Mobile
* Windows CE

###fileName

####Type
<span class='text-info'>STRING</span> 
####Description
The image file path without file extension to store captured image in subsequent calls to takePicture() or capture(). Default filename will be IMG_timestamp and will be saved under root directory. The filename extension will be added automatically according to compressionFormat property value.
				In Wp8, only filename can be changed, by default the path shall be under picture=>CameraRoll
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.fileName</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Camera.fileName</code> 



####Platforms

* Android
* Windows Mobile
* Windows CE

###<span class="text-info">flashMode</span>

####Type
<span class='text-info'>STRING</span> 
####Description
<span class='label label-info'>Replaces:flash_mode</span> Specifies the flash behavior when taking a picture.
				This Property shall accept/return one among the values mentioned in constant section which starts with FLASH_...
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.flashMode</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Camera.flashMode</code> 



####Platforms

* Android
* Windows Mobile
* Windows CE

###maxHeight

####Type
<span class='text-info'>INTEGER</span> <span class='label label-warning'>Read Only</span>
####Description
The maximum height of images which can be captured. This is measured in pixels. On WM/CE devices this is applicable only for color camera. Imager does not support this property.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.maxHeight</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Camera.maxHeight</code> 



####Platforms

* Android
* Windows Mobile
* Windows CE

###maxWidth

####Type
<span class='text-info'>INTEGER</span> <span class='label label-warning'>Read Only</span>
####Description
The maximum width of images which can be captured. This is measured in pixels. On WM/CE devices this is applicable only for color camera. Imager does not support this property.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.maxWidth</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Camera.maxWidth</code> 



####Platforms

* Android
* Windows Mobile
* Windows CE

###outputFormat

####Type
<span class='text-info'>STRING</span> 
####Description
Specifies the way to return the captured image to the application.
				This Property shall accept/return one among the values mentioned in constant section which starts with OUTPUT_FORMAT_...
				
####Params
<p><strong>Default:</strong> imagePath</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.outputFormat</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Camera.outputFormat</code> 



####Platforms

* Android
* Windows Mobile
* Windows CE

###previewHeight

####Type
<span class='text-info'>INTEGER</span> 
####Description
In cases where the resident camera application on the device is not used this API is used to control the position of the viewfinder preview window when taking a photo.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.previewHeight</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Camera.previewHeight</code> 



####Platforms

* Windows Mobile
* Windows CE

###<span class="text-info">previewLeft</span>

####Type
<span class='text-info'>INTEGER</span> 
####Description
<span class='label label-info'>Replaces:left</span> In cases where the resident camera application on the device is not used this API is used to control the position of the viewfinder preview window when taking a photo.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.previewLeft</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Camera.previewLeft</code> 



####Platforms

* Windows Mobile
* Windows CE

###<span class="text-info">previewTop</span>

####Type
<span class='text-info'>INTEGER</span> 
####Description
<span class='label label-info'>Replaces:top</span> In cases where the resident camera application on the device is not used this API is used to control the position of the viewfinder preview window when taking a photo.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.previewTop</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Camera.previewTop</code> 



####Platforms

* Windows Mobile
* Windows CE

###previewWidth

####Type
<span class='text-info'>INTEGER</span> 
####Description
In cases where the resident camera application on the device is not used this API is used to control the position of the viewfinder preview window when taking a photo.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.previewWidth</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Camera.previewWidth</code> 



####Platforms

* Windows Mobile
* Windows CE

###<span class="text-info">saveToDeviceGallery</span>

####Type
<span class='text-info'>BOOLEAN</span> 
####Description
<span class='label label-info'>Replaces:save_to_shared_gallery</span> If true, the picture you take will be added to the device photo gallery.
####Params
<p><strong>Default:</strong> false</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.saveToDeviceGallery</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Camera.saveToDeviceGallery</code> 



####Platforms

* Android

###supportedSizeList

####Type
<span class='text-info'>ARRAY</span> <span class='label label-warning'>Read Only</span>
####Description
List of resolutions (width and height in pixels) supported by the camera. On WM/CE devices this feature is supported only by color camera and it is not supported by imager. Refer example section for more details.
####Params
<li><i>Object</i> : <span class='text-info'>HASH</span><p> </p></li><ul><li>width : <span class='text-info'>INTEGER</span><p> </p></li><li>height : <span class='text-info'>INTEGER</span><p> </p></li></ul>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.supportedSizeList</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Camera.supportedSizeList</code> 



####Platforms

* Android
* Windows Mobile
* Windows CE

###useSystemViewfinder

####Type
<span class='text-info'>BOOLEAN</span> 
####Description
Setting the value of this property to "true", shall open the System ViewFinder with its properties. None of the Rho camera properties shall be applicable.
####Params
<p><strong>Default:</strong> false</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.useSystemViewfinder</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Camera.useSystemViewfinder</code> 



####Platforms

* Android

##Constants


* CAMERA_TYPE_BACKBack camera. This is not supported in WM/CE devices.
* CAMERA_TYPE_FRONTFront camera. This is not supported in WM/CE devices.
* CAMERA_TYPE_IMAGERCamera is an imager. This is supported only in WM/CE devices.
* CAMERA_TYPE_COLORCamera is color camera. This is supported only in WM/CE devices.
* COMPRESSION_FORMAT_JPGJPG compression.
* COMPRESSION_FORMAT_PNGPNG compression.
* OUTPUT_FORMAT_IMAGEThis shall provide the image uri. This can be used to display image directly on the page. An example is shown in the example section
* OUTPUT_FORMAT_DATAURIThis is a base 64 encoding of the image and can be used to easily embed the image on the page or store the image in a database. On some consumer devices, captured image will be rotated 90 degrees while displaying.
* OUTPUT_FORMAT_IMAGE_PATHIf this value used for setting the outputFormat property, the takePicture or capture API will return imageUri as the path to the saved image in the device. User can use this image path to transfer the file to an http server if required. An example is given to demonstrate, transferring a file to http server.This property is not applicable for Android and windows phone 8.
* COLOR_MODEL_RGBA colour image is captured.
* COLOR_MODEL_GRAYSCALEA grayscale image is captured.
* FLASH_ONFlash will be used.
* FLASH_OFFFlash will not be used.
* FLASH_AUTOFlash will be used if lighting conditions deem it necessary. This is not supported in WM/CE devices.
* FLASH_RED_EYEFlash with red eye reduction is used. This is supported only in Android devices.
* FLASH_TORCHThe flash is turned on in torch mode. This is supported only in Android devices.
* AIM_ONSwitches the imager's aim to ON 
* AIM_OFFSwitches the imager's aim to OFF 

##Remarks



###SD Card Access
SD Card access is enabled by default; grants of additional access will be ignored. The following extensions are able to write to the SD card by default.

###Camera Preview
Despite a user-selected full screen mode, preview rendering size will be overridden by the driver on some WM/CE devices.

###DataUri
DataUri output is dependent on availability of virtual space. DataUri may fail, be unresponsive, cause reboot, degraded performance or fail to load in certain devices. In such cases, image path is recommended.

###ImageUri
Image Uri display is dependent on browser capability.

###GetSupportedProperties in WP8
WP8 does not support getSupportedProperties or SetSupportedProperties.

###colorModel as Grayscale in Android
Grayscale is supported only in the front camera of Android consumer devices.

###Invalid/Null values for properties in Android and iOS
Only valid and non-empty values for properties are supported in Android and iOS.

###Ruby Support
Due to platform limitations, imager and color camera are not supported in ruby applications for CE5 and CE6 devices.

###Camera in Suspend mode
All WM and CE7 devices automatically turn off both color and imager cameras when the device is suspended. User must restart the camera to resume. Whereas CE5 (eg: MC9000) and CE6 (eg: MC31) devices retain the preview on resuming from suspend state.

###Image saving after taking picture
In some devices (eg: Samsung), an image will be saved in landscape mode even if captured in portrait mode. This behavior is determined by the device's default settings.

###WM/CE devices lacking support
Due to platform limitations, the ES400, MC65 and MC67 do not support the color camera.

###takePicture resolution issue on low-memory devices with WM
Due to platform limitations, the ES400, MC65 and MC67 do not support a color camera. The imager on the MC55 with WM does not support the Fullscreen window (eg: takePicture). Parameters such as previewLeft, previewWidth, previewTop and previewHeight are supported by the device to set up a user-defined viewer window.

###takePicture resolution issue on low-memory devices with WM
Processor limitations of some devices may cause a low-resolution image captures to appear as a small preview with a black background when transitioning back to the application.

###Android KitKat gallery displays black image
For images captured with the camera using a Rho app, the image might initially appear black. Refresh the view to correct the problem.

###Android preview
High-resolution settings are not recommended for low-memory devices. Image previews on tablet devices might appear stretched or shrunken.