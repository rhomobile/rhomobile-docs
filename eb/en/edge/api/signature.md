#Signature


## Overview
creates a rectangular box within which the user can draw by using a finger or the device's stylus to record handwritten data. Common usages for this tag include the capture of client/customer signatures and the input of handwritten text/notations.
## Enabling the API
In order to use this API you must TBD INSERT Eb specific instructions here

        


##Methods



### capture()
Captures the in-line signature area as an image. This function works with a non-modal signature capture area shown inside browser window. All in-line signature capture functions (like this) do not has affect the capture area shown in takeFullScreen (modal full screen capture area).

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>Whether a signature was captured or the signature capture area was dismissed (Fullscreen version only). Possible values:'ok' or 'cancel' </p></li><li>imageUri : <span class='text-info'>STRING</span><p>If the outputFormat is "image", this will be the URI of the captured signature image. If the outputFormat is "dataUri", this will be the DataURI representation of the captured signature image. </p></li><li>signature_uri : <span class='text-info'>STRING</span><p>If the outputFormat is "image", this will be the URI of the captured signature image. If the outputFormat is "dataUri", this will be the DataURI representation of the captured signature image. </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Signature.capture()</code> 


### clear()
Clears an in-line capture area. This function works with a non-modal signature capture area shown inside browser window. All in-line signature capture functions (like this) do not has affect to capture area shown in takeFullScreen (modal full screen capture area) 

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
	* <code>EB.Signature.clear()</code> 


### hide()
Hides an in-line capture area from view. It clears the inputed signature for in-line signature areas. In a hidden state, a user cannot interact with the signature capture area. This function work with non-modal signature capture area showed inside browser window. All in-line signature capture functions (like this) do not has affect to capture area showed in takeFullScreen (modal full screen capture area) 

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
	* <code>EB.Signature.hide()</code> 


### setVectorCallback()
Signature data is formatted into a series of vectors and returned to the application via this callback function. The received data may not represent the entire signature as the vectors will be sent in batches if the signature is large. A single vector (array entry) contains an X, Y coordinate and the beginning / end of the signature is defined by (65535, 65535). This callback is independent of the callback of the capture method, when specified the callback will be called whenever a 'pen up' occurs in the signature box.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>vectorArray : <span class='text-info'>ARRAY</span><p>JavaScript array of vectors which represent the signature. </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Signature.setVectorCallback()</code> 


### show(<span class="text-info">HASH</span> propertyMap)
Show in-line signature window. This function works witha non-modal signature capture area shown inside browser window. All in-line signature capture functions (like this) do not has affect the capture area shown in takeFullScreen (modal full screen capture area).

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span> <span class='label label-info'>Optional</span><p>Map of signature properties to be set Valid `properties` for this parameter are the properties avaliable to this API module. <a href='#Properties'>Check the property section</a> Use already set properties</p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Signature.show(<span class="text-info">HASH</span> propertyMap)</code> 


### takeFullScreen(<span class="text-info">HASH</span> propertyMap)
Shows a modal window with signature capture area and UI (toolbar with buttons) for cancel / capture and return to main application window. The callback is fired when the signature is closed (when in fullscreen) or when capture is called. In WM/CE, the signature area has visible buttons for 'clear', 'capture' and 'cancel'. In Android / iOS, the signature area has images which will behave as buttons for 'clear', 'capture' and 'cancel'. This function open modal full screen window, therefore other functions related to in-line signature capture (work with inside browser window area) do not affect the capture window shown by this function.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span> <span class='label label-info'>Optional</span><p>Map of signature properties to be set Valid `properties` for this parameter are the properties avaliable to this API module. <a href='#Properties'>Check the property section</a> Use already set properties</p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>status : <span class='text-info'>STRING</span><p>Whether a signature was captured or the signature capture area was dismissed (Fullscreen version only). Possible values:'ok' or 'cancel' </p></li><li>imageUri : <span class='text-info'>STRING</span><p>If the outputFormat is "image", this will be the URI of the captured signature image. If the outputFormat is "dataUri", this will be the DataURI representation of the captured signature image. </p></li><li>signature_uri : <span class='text-info'>STRING</span><p>If the outputFormat is "image", this will be the URI of the captured signature image. If the outputFormat is "dataUri", this will be the DataURI representation of the captured signature image. </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Signature.takeFullScreen(<span class="text-info">HASH</span> propertyMap)</code> 


##Properties



###bgColor

####Type
<span class='text-info'>STRING</span> 
####Description
RGB or ARGB value that sets the background color of the signature capture area.
####Params
<p><strong>Default:</strong> #FFFFFFFF</p>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Signature.bgColor</code>



####Platforms

* Android
* Windows Mobile/CE

###border

####Type
<span class='text-info'>BOOLEAN</span> 
####Description
Shows or hides a border for the rectangular capture area. Not applicable to fullscreen signature capture area.
####Params
<p><strong>Default:</strong> true</p>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Signature.border</code>



####Platforms

* Android
* Windows Mobile/CE

###<span class="text-info">compressionFormat</span>

####Type
<span class='text-info'>STRING</span> 
####Description
<span class='label label-info'>Replaces:imageFormat</span> Compression format of the image file for the captured signature. In WM/CE, irrespective of setting any format, the output format will be of bitmap type. In WM/CE, when compressionFormat is queried, it will be of bitmap type always.
####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.Signature.COMPRESSION_FORMAT_JPG - String: jpg JPEG file format (Not available on WM/CE).
* Constant: EB.Signature.COMPRESSION_FORMAT_PNG - String: png Portable Network Graphics file (Not available on WM/CE).
* Constant: EB.Signature.COMPRESSION_FORMAT_BMP - String: bmp Bitmap image file (Not available on iOS).
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Signature.compressionFormat</code>



####Platforms

* Android
* Windows Mobile/CE

###<span class="text-info">fileName</span>

####Type
<span class='text-info'>STRING</span> 
####Description
<span class='label label-info'>Replaces:name</span> The filename in which to store the signature image, if "image" is used as the outputFormat. The file extension is determined by the compressionFormat used.
####Params
<p><strong>Default:</strong> signature</p>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Signature.fileName</code>



####Platforms

* Android
* Windows Mobile/CE

###height

####Type
<span class='text-info'>INTEGER</span> 
####Description
The height of the signature capture area in pixels. Not applicable to fullscreen signature capture area.
####Params
<p><strong>Default:</strong> 150</p>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Signature.height</code>



####Platforms

* Android
* Windows Mobile/CE

###left

####Type
<span class='text-info'>INTEGER</span> 
####Description
The coordinates in pixels of the left side of the signature capture area. Not applicable to fullscreen signature capture area.
####Params
<p><strong>Default:</strong> 15</p>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Signature.left</code>



####Platforms

* Android
* Windows Mobile/CE

###outputFormat

####Type
<span class='text-info'>STRING</span> 
####Description
The return type of the saved signature capture image.
####Params
<p><strong>Default:</strong> image</p>
####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.Signature.OUTPUT_FORMAT_IMAGE - String: image Outputs the signature capture image into an image file. The compression method and extension of the image file can be specified in compressionFormat.
* Constant: EB.Signature.OUTPUT_FORMAT_DATAURI - String: dataUri Outputs the signature capture image as a DataURI string. (Not available on iOS).
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Signature.outputFormat</code>



####Platforms

* Android
* Windows Mobile/CE

###penColor

####Type
<span class='text-info'>STRING</span> 
####Description
RGB or ARGB value that sets the color of the stylus pen ink using HTML web colors.
####Params
<p><strong>Default:</strong> #FF000000</p>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Signature.penColor</code>



####Platforms

* Android
* Windows Mobile/CE

###penWidth

####Type
<span class='text-info'>INTEGER</span> 
####Description
Sets the width of the pen line in pixels. Advised to keep this to 5 or less.
####Params
<p><strong>Default:</strong> 3</p>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Signature.penWidth</code>



####Platforms

* Android
* Windows Mobile/CE

###top

####Type
<span class='text-info'>INTEGER</span> 
####Description
The coordinates in pixels of the top side of the signature capture area. Not applicable to fullscreen signature capture area.
####Params
<p><strong>Default:</strong> 60</p>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Signature.top</code>



####Platforms

* Android
* Windows Mobile/CE

###width

####Type
<span class='text-info'>INTEGER</span> 
####Description
The width of the signature capture area in pixels. Not applicable to fullscreen signature capture area.
####Params
<p><strong>Default:</strong> 200</p>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Signature.width</code>



####Platforms

* Android
* Windows Mobile/CE

##Remarks



###Fullscreen and In-line

                    
                        The signature capture feature can work in two visual modes, Fullscreen and In-line. The fullscreen variant has buttons to capture, clear and cancel the signature capture box, so the methods: "clear", "hide", "capture" don't need to be used. Whereas with the in-line signature capture, there are no such buttons so these will have to be designed into the app itself.
                    
                

###Parameters which clear the signature

                    
                        The signature capture area is designed to be set up prior to capturing the signature, as such the following parameters will clear any current signature: "width", "height", "penColor", "bgColor".
                    
                

###Page Navigation

                    
                        In Android, the state of the signature will not be cleared on page navigation whereas in Windows, the state of the signature is cleared.
                    
                

###Persistent Behaviour

                    
                        While using "takeFullScreen" method, if we press Home button and re-launch the application the state won't be persisted in Android platform.
                    
                