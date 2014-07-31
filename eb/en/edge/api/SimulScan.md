#SimulScan


## Overview
The SimulScan is a software solution that enables customers to extract and
process various types of information from documents. A single document may contain barcodes, text, image data and
forms, using SimulScan this data can be extracted programmatically using OCR, barcode decoding and image capture. For
example, a driver's license can be thought of as a template containing regions such as name and address, signature
and photo, each of these regions are processed and returned to RhoElements separately by SimulScan so Optical Character
Recognition captures the owners name and address whilst their photo is captured separately. These regions are
defined by a template which maps the various regions of the document to the data they contain and can be created
on-line at [The SimulScan template builder](https://dpx-uat.motorolasolutions.com/). This API is available only on Motorola Android devices with firmware supporting SimulScan.
    
## Enabling the API
In order to use this API you must TBD INSERT Eb specific instructions here

        


##Methods



### captureDocument()
Capture a document by either taking a photo of it and process that image for fields defined in the template. You must specify the template associated with the capture either through the template property or as part of the propertyMap when calling this method. If the document processing does not succeed the returned callback will contain failure description. If the captured document is processed successfully a callback will contain document data.
        

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>callbackType : <span class='text-info'>STRING</span><p>
Indicates whether the document was decoded successfully or not. </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>Constant: Signature.SUCCESS <br/> String:success</dt><dd>
The document was decoded and processed successfully and this callback contains information about the processed form. Look at processedForm parameter.</dd><dt>Constant: Signature.FAILURE <br/> String:failure</dt><dd>
An error has occurred whilst processing the document. Look at failureReason parameter.</dd><dt>Constant: Signature.STOP <br/> String:stop</dt><dd>
The processing is over. No more notifications until next captureDocument.</dd></dl></li><li>failureReason : <span class='text-info'>STRING</span><p>
Describes reason for failure. </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>Constant: Signature.FAILURE_ERROR <br/> String:error</dt><dd>
SimulScan engine generic error.</dd><dt>Constant: Signature.FAILURE_IDENTIFICATION_TIMEOUT <br/> String:identificationTimeout</dt><dd>
Identification timeout. Refer to identificationTimeout property.</dd><dt>Constant: Signature.FAILURE_PROCESSING_TIMEOUT <br/> String:processingTimeout</dt><dd>
Processing timeout. Refer to processingTimeout property.</dd></dl></li><li>processedForm : <span class='text-info'>HASH</span><p> </p></li><ul><li>template : <span class='text-info'>HASH</span><p> </p></li><ul><li>name : <span class='text-info'>STRING</span><p>
The name of the template was used for recognition. </p></li><li>number : <span class='text-info'>INTEGER</span><p>
The number of the template was used for recognition. </p></li></ul><li>formCapture : <span class='text-info'>HASH</span><p> </p></li><ul><li>name : <span class='text-info'>STRING</span><p>
The name of the template was used for recognition. </p></li><li>image : <span class='text-info'>HASH</span><p>
The image of whole scanned form. </p></li><ul><li>width : <span class='text-info'>INTEGER</span><p>
Width of scanned form in pixels. </p></li><li>height : <span class='text-info'>INTEGER</span><p>
Height of scanned form in pixels. </p></li><li>id : <span class='text-info'>INTEGER</span><p>
Id of scanned form image. Use getDataUri method to retrieve image data. The id is valid until close method is called. </p></li></ul></ul><li>regions : <span class='text-info'>ARRAY</span><p> </p></li><ul><li>group : <span class='text-info'>STRING</span><p>
The name of the group this region is found in, as defined in the template associated with the recognized region. It's optional parameter.
                   </p></li><li>name : <span class='text-info'>STRING</span><p>
The name of the region, as defined in the template associated with the document. </p></li><li>number : <span class='text-info'>INTEGER</span><p>
The number of the region, as defined in the template section associated with the recognized region. </p></li><li>processingMode : <span class='text-info'>STRING</span><p>
The type of region which has been decoded. </p><p><strong>Possible Values</strong> :</p> <dt>Constant: Signature.PM_OCR <br/> String: ocr </dt><dd>
Optical Character Recognition. The region is a text field. The processedData parameter contains array of lines.
                      </dd><dt>Constant: Signature.PM_OMR <br/> String: omr </dt><dd>
Optical Mark Recognition. The region is a check box or radio box. The processedData parameter of this callback will contain a boolean value.
                      </dd><dt>Constant: Signature.PM_PICTURE <br/> String: picture </dt><dd>
The defined region was captured as a picture. No processedData parameter. Use the `image` callback property with the [getDataUri()](#mgetDataUri) to get a DataURI of the image.</dd><dt>Constant: Signature.PM_BARCODE <br/> String: barcode </dt><dd>
The region is a barcode and the decoded barcode data is given in the processedData parameter.</dd></dl></li><li>processedData : <span class='text-info'>STRING</span><p>
The processed data contained in the specified region, this will depend on the type of region being captured. See the values of the `processingMode` parameter.
                   </p></li><li>image : <span class='text-info'>STRING</span><p>
The image of region. </p></li><ul><li>width : <span class='text-info'>INTEGER</span><p>
Width of region in pixels. </p></li><li>height : <span class='text-info'>INTEGER</span><p>
Height of region in pixels. </p></li><li>id : <span class='text-info'>INTEGER</span><p>
Id of region image. Use [getDataUri method](#mgetDataUri) to retrieve image data. Id is valid until the close method is called. </p></li></ul><li>relativeOcrConfidence : <span class='text-info'>INTEGER</span><p>
Relative OCR confidence for processed data if applicable. </p></li><li>absoluteOcrConfidence : <span class='text-info'>INTEGER</span><p>
Absolute OCR confidence for processed data if applicable. </p></li></ul></ul></ul></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.captureDocument()</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>EB.SimulScan.captureDocument()</code> </li></ul></li></ul>

### <span class="label label-inverse"> Destructor</span> close()
Close SimulScan engine, and release allocated resources. When capturing images, this is especially important since they are made available temporarily.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android

####Method Access:
<ul><li>Class Method: This method is a destructor and can only be accessed via the object that was created by the `new` constructor. <ul><li><code>myObj.close()</code> </li></ul></li></ul>

### fetchTemplates(<span class="text-info">STRING</span> userName, <span class="text-info">STRING</span> password)
Fetch templates from dedicated SimulScan server and place into template directory. See [templateDirectory property](#ptemplateDirectory). The device must have access to the network and can access the [SimulScan Template Builder Website](http://dpx-uat.motorolasolutions.com)

####Parameters
<ul><li>userName : <span class='text-info'>STRING</span><p>
Username of the user. </p></li><li>password : <span class='text-info'>STRING</span><p>
Password of the user. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.fetchTemplates(<span class="text-info">STRING</span> userName, <span class="text-info">STRING</span> password)</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>EB.SimulScan.fetchTemplates(<span class="text-info">STRING</span> userName, <span class="text-info">STRING</span> password)</code> </li></ul></li></ul>

### getAllProperties()
This method will return all of object/value pairs for the propertyNames of the API class.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>HASH : 
Map of all available properties<ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul></li></ul>

####Platforms

* Android

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.getAllProperties()</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>EB.SimulScan.getAllProperties()</code> </li></ul></li></ul>

### getDataUri(<span class="text-info">INTEGER</span> imageId)
Return data URI encoding of the raw image associated with the region or captured form, this allows the operator to easily verify that the captured data is accurate and if necessary perform any post processing changes by hand. To show the image on the HTML page insert the data URI  string into the src attribute of the img tag: 
    <img src="dataURI string;">.
        

####Parameters
<ul><li>imageId : <span class='text-info'>INTEGER</span><p>
Id of image to retrieve. Ids are valid until close method call. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.getDataUri(<span class="text-info">INTEGER</span> imageId)</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>EB.SimulScan.getDataUri(<span class="text-info">INTEGER</span> imageId)</code> </li></ul></li></ul>

### getDefault()
This method will return an object that represents the default instance of the API Class. For example Camera.getDefault will return a Camera object that represents the default camera.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>SELF_INSTANCE</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>SELF_INSTANCE : 
Default object of Module.</li></ul>

####Platforms

* Android

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.SimulScan.getDefault()</code> </li></ul></li></ul>

### getProperties(<span class="text-info">ARRAY</span> arrayofNames)
This method will return a set of object/value pairs for the list of the propertyName that is passed in. The propertyNames must be a valid property of the API class.

####Parameters
<ul><li>arrayofNames : <span class='text-info'>ARRAY</span><p>
List of properties I want to know about </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>HASH : 
Map of properties I want to know about<ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul></li></ul>

####Platforms

* Android

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>EB.SimulScan.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code> </li></ul></li></ul>

### getProperty(<span class="text-info">STRING</span> propertyName)
This method will return the value of the propertyName that is passed in. The propertyName must be a valid property of the API class.

####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p>
The property to return info about. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>STRING : 
The property to return info about.</li></ul>

####Platforms

* Android

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.getProperty(<span class="text-info">STRING</span> propertyName)</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>EB.SimulScan.getProperty(<span class="text-info">STRING</span> propertyName)</code> </li></ul></li></ul>

### setDefault(<span class="text-info">SELF_INSTANCE: EB.SimulScan</span> defaultInstance)
This method allows you to set the attributes of the default object instance by passing in an object of the same class.

####Parameters
<ul><li>defaultInstance : <span class='text-info'>SELF_INSTANCE: EB.SimulScan</span><p>
An instance object that is of the same class. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.SimulScan.setDefault(<span class="text-info">SELF_INSTANCE: EB.SimulScan</span> defaultInstance)</code> </li></ul></li></ul>

### setProperties(<span class="text-info">HASH</span> propertyMap)
This method will set the values of a list of properties for the API class. The propertyName must be a valid property for the class and must also not be read only.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>
Map of properties I want to set </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.setProperties(<span class="text-info">HASH</span> propertyMap)</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>EB.SimulScan.setProperties(<span class="text-info">HASH</span> propertyMap)</code> </li></ul></li></ul>

### setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)
This method will set the value of a property for the API class. The propertyName must be a valid property for the class and must also not be read only.

####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p>
The one property name that I want to set </p></li><li>propertyValue : <span class='text-info'>STRING</span><p>
The one property value that I want to set </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>EB.SimulScan.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code> </li></ul></li></ul>

##Properties



###audioFeedback

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

Whether or not to provide audio feedback to the user following document processing.
####Params
<p><strong>Default:</strong> true</p>
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.audioFeedback</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class. <ul><li><code>EB.SimulScan.audioFeedback</code> </li></ul></li></ul>


####Platforms

* Android

###autoImageCapture

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

If true, form will be captured automatically when detected.
          If false, user must manually tap screen or press trigger to capture the form.
####Params
<p><strong>Default:</strong> true</p>
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.autoImageCapture</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class. <ul><li><code>EB.SimulScan.autoImageCapture</code> </li></ul></li></ul>


####Platforms

* Android

###debug

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

If enabled, allows a session to write form capture, region images, region values, and other data to storage.
####Params
<p><strong>Default:</strong> false</p>
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.debug</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class. <ul><li><code>EB.SimulScan.debug</code> </li></ul></li></ul>


####Platforms

* Android

###decodeAudioFeedback

####Type
<span class='text-info'>STRING</span> 
####Description

Specifies the decode sound (beep) that is heard when a form is decoded.
####Params
<p><strong>Default:</strong> system/media/audio/notifications/decode.wav</p>
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.decodeAudioFeedback</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class. <ul><li><code>EB.SimulScan.decodeAudioFeedback</code> </li></ul></li></ul>


####Platforms

* Android

###delayResultDisplay

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

If true, the success event will be sent only after the SimulScan dialog is dismissed. If false, the event will be sent immediately after the results are ready. A false value is recommended unless direct interaction with the underlying application is necessary (e.g. keystroke input).
####Params
<p><strong>Default:</strong> false</p>
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.delayResultDisplay</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class. <ul><li><code>EB.SimulScan.delayResultDisplay</code> </li></ul></li></ul>


####Platforms

* Android

###flashMode

####Type
<span class='text-info'>STRING</span> 
####Description

Flash mode (off, on, disabled).
####Params
<p><strong>Default:</strong> off</p>
####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.SimulScan.FLASH_OFF 
	* String: off
	* 
Turn flash off.
* Constant: EB.SimulScan.FLASH_ON 
	* String: on
	* 
Turn flash on.
* Constant: EB.SimulScan.FLASH_DISABLED 
	* String: disabled
	* 
Disable flash.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.flashMode</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class. <ul><li><code>EB.SimulScan.flashMode</code> </li></ul></li></ul>


####Platforms

* Android

###frameThreshold

####Type
<span class='text-info'>INTEGER</span> 
####Description

Only used if autoImageCapture is enabled. The number of correct frames that is needed to pass before SimulScan will automatically start to process form. This should be between 5 and 30.
####Params
<p><strong>Default:</strong> 15</p>
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.frameThreshold</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class. <ul><li><code>EB.SimulScan.frameThreshold</code> </li></ul></li></ul>


####Platforms

* Android

###hapticFeedback

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

Whether or not to provide haptic feedback to the user following document processing.
####Params
<p><strong>Default:</strong> true</p>
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.hapticFeedback</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class. <ul><li><code>EB.SimulScan.hapticFeedback</code> </li></ul></li></ul>


####Platforms

* Android

###identificationTimeout

####Type
<span class='text-info'>INTEGER</span> 
####Description

The length of time, in milliseconds that the processing engine has to recognize the image from the provided template. From 0 to 20000 in increments of 100.
####Params
<p><strong>Default:</strong> 15000</p>
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.identificationTimeout</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class. <ul><li><code>EB.SimulScan.identificationTimeout</code> </li></ul></li></ul>


####Platforms

* Android

###inputSource

####Type
<span class='text-info'>STRING</span> 
####Description

Defines where the document should be captured from. The only supported source is camera.
####Params
<p><strong>Default:</strong> camera</p>
####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.SimulScan.SOURCE_CAMERA 
	* String: camera
	* 
The document will be captured from the device camera. After calling the captureDocument method the camera preview will be presented, the user should place the document to be captured in the preview frame and press the soft button to capture & process the image.
            
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.inputSource</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class. <ul><li><code>EB.SimulScan.inputSource</code> </li></ul></li></ul>


####Platforms

* Android

###ledFeedback

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

Whether or not to provide LED feedback to the user following document processing.
####Params
<p><strong>Default:</strong> true</p>
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.ledFeedback</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class. <ul><li><code>EB.SimulScan.ledFeedback</code> </li></ul></li></ul>


####Platforms

* Android

###logDirectory

####Type
<span class='text-info'>STRING</span> 
####Description

Specify which directory to search for logs in.
####Params
<p><strong>Default:</strong> /sdcard/SimulScanLog</p>
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.logDirectory</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class. <ul><li><code>EB.SimulScan.logDirectory</code> </li></ul></li></ul>


####Platforms

* Android

###negativeFrameThreshold

####Type
<span class='text-info'>INTEGER</span> 
####Description

Only used if autoImageCapture is enabled. Number of incorrect frames that is allowed to pass before the frame counter is reset for automatic image capture. This should be between 0 and 20.
####Params
<p><strong>Default:</strong> 2</p>
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.negativeFrameThreshold</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class. <ul><li><code>EB.SimulScan.negativeFrameThreshold</code> </li></ul></li></ul>


####Platforms

* Android

###processingTimeout

####Type
<span class='text-info'>INTEGER</span> 
####Description

Amount of time in milliseconds to wait before timing out processing.
####Params
<p><strong>Default:</strong> 10000</p>
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.processingTimeout</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class. <ul><li><code>EB.SimulScan.processingTimeout</code> </li></ul></li></ul>


####Platforms

* Android

###template

####Type
<span class='text-info'>STRING</span> 
####Description

The template XML which defines the document to be processed. This should be file URI to the template on the device. You must provide this property to define the form being captured and what is contained in each region on that form. Templates are specific to each document format you intend on capturing and can be created online at https://dpx-uat.motorolasolutions.com/.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.template</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class. <ul><li><code>EB.SimulScan.template</code> </li></ul></li></ul>


####Platforms

* Android

###templateDirectory

####Type
<span class='text-info'>STRING</span> 
####Description

Specify where to store downloaded templates. See [fetchTemplates()](#mfetchTemplates)
####Params
<p><strong>Default:</strong> /sdcard/templates</p>
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.templateDirectory</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class. <ul><li><code>EB.SimulScan.templateDirectory</code> </li></ul></li></ul>


####Platforms

* Android

###uiResultConfirmation

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

If enabled, shows a UI confirmation with results in SimulScan View before sending results back to application.
####Params
<p><strong>Default:</strong> true</p>
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.uiResultConfirmation</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class. <ul><li><code>EB.SimulScan.uiResultConfirmation</code> </li></ul></li></ul>


####Platforms

* Android

###version

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

Version of SimulScan engine.
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.SimulScan.version</code> </li></ul></li></ul>


####Platforms

* Android