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
<p>Capture a document by either taking a photo of it and process that image for fields defined in the template. You must specify the template associated with the capture either through the template property or as part of the propertyMap when calling this method. If the document processing does not succeed the returned callback will contain failure description. If the captured document is processed successfully a callback will contain document data.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>callbackType : <span class='text-info'>STRING</span><p>
<p>Indicates whether the document was decoded successfully or not.</p>
 </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>Constant: SimulScan.SUCCESS <br/> String:success</dt><dd>
<p>The document was decoded and processed successfully and this callback contains information about the processed form. Look at processedForm parameter.</p>
</dd><dt>Constant: SimulScan.FAILURE <br/> String:failure</dt><dd>
<p>An error has occurred whilst processing the document. Look at failureReason parameter.</p>
</dd><dt>Constant: SimulScan.STOP <br/> String:stop</dt><dd>
<p>The processing is over. No more notifications until next captureDocument.</p>
</dd></dl></li><li>failureReason : <span class='text-info'>STRING</span><p>
<p>Describes reason for failure.</p>
 </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>Constant: SimulScan.FAILURE_ERROR <br/> String:error</dt><dd>
<p>SimulScan engine generic error.</p>
</dd><dt>Constant: SimulScan.FAILURE_IDENTIFICATION_TIMEOUT <br/> String:identificationTimeout</dt><dd>
<p>Identification timeout. Refer to identificationTimeout property.</p>
</dd><dt>Constant: SimulScan.FAILURE_PROCESSING_TIMEOUT <br/> String:processingTimeout</dt><dd>
<p>Processing timeout. Refer to processingTimeout property.</p>
</dd></dl></li><li>processedForm : <span class='text-info'>HASH</span><p> </p></li><ul><li>template : <span class='text-info'>HASH</span><p> </p></li><ul><li>name : <span class='text-info'>STRING</span><p>
<p>The name of the template was used for recognition.</p>
 </p></li><li>number : <span class='text-info'>INTEGER</span><p>
<p>The number of the template was used for recognition.</p>
 </p></li></ul><li>formCapture : <span class='text-info'>HASH</span><p> </p></li><ul><li>name : <span class='text-info'>STRING</span><p>
<p>The name of the template was used for recognition.</p>
 </p></li><li>image : <span class='text-info'>HASH</span><p>
<p>The image of whole scanned form.</p>
 </p></li><ul><li>width : <span class='text-info'>INTEGER</span><p>
<p>Width of scanned form in pixels.</p>
 </p></li><li>height : <span class='text-info'>INTEGER</span><p>
<p>Height of scanned form in pixels.</p>
 </p></li><li>id : <span class='text-info'>INTEGER</span><p>
<p>Id of scanned form image. Use getDataUri method to retrieve image data. The id is valid until close method is called.</p>
 </p></li></ul></ul><li>regions : <span class='text-info'>ARRAY</span><p> </p></li><ul><li>group : <span class='text-info'>STRING</span><p>
<p>The name of the group this region is found in, as defined in the template associated with the recognized region. It&rsquo;s optional parameter.</p>
 </p></li><li>name : <span class='text-info'>STRING</span><p>
<p>The name of the region, as defined in the template associated with the document.</p>
 </p></li><li>number : <span class='text-info'>INTEGER</span><p>
<p>The number of the region, as defined in the template section associated with the recognized region.</p>
 </p></li><li>processingMode : <span class='text-info'>STRING</span><p>
<p>The type of region which has been decoded.</p>
 </p><p><strong>Possible Values</strong> :</p> <dt>Constant: SimulScan.PM_OCR <br/> String: ocr </dt><dd>
<p>Optical Character Recognition. The region is a text field. The processedData parameter contains array of lines.</p>
</dd><dt>Constant: SimulScan.PM_OMR <br/> String: omr </dt><dd>
<p>Optical Mark Recognition. The region is a check box or radio box. The processedData parameter of this callback will contain a boolean value.</p>
</dd><dt>Constant: SimulScan.PM_PICTURE <br/> String: picture </dt><dd>
<p>The defined region was captured as a picture. No processedData parameter. Use the <code>image</code> callback property with the <a href="#mgetDataUri">getDataUri()</a> to get a DataURI of the image.</p>
</dd><dt>Constant: SimulScan.PM_BARCODE <br/> String: barcode </dt><dd>
<p>The region is a barcode and the decoded barcode data is given in the processedData parameter.</p>
</dd></dl></li><li>processedData : <span class='text-info'>STRING</span><p>
<p>The processed data contained in the specified region, this will depend on the type of region being captured. See the values of the <code>processingMode</code> parameter.</p>
 </p></li><li>image : <span class='text-info'>STRING</span><p>
<p>The image of region.</p>
 </p></li><ul><li>width : <span class='text-info'>INTEGER</span><p>
<p>Width of region in pixels.</p>
 </p></li><li>height : <span class='text-info'>INTEGER</span><p>
<p>Height of region in pixels.</p>
 </p></li><li>id : <span class='text-info'>INTEGER</span><p>
<p>Id of region image. Use <a href="#mgetDataUri">getDataUri method</a> to retrieve image data. Id is valid until the close method is called.</p>
 </p></li></ul><li>relativeOcrConfidence : <span class='text-info'>INTEGER</span><p>
<p>Relative OCR confidence for processed data if applicable.</p>
 </p></li><li>absoluteOcrConfidence : <span class='text-info'>INTEGER</span><p>
<p>Absolute OCR confidence for processed data if applicable.</p>
 </p></li></ul></ul></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.captureDocument()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.SimulScan.captureDocument()</code> 


### <span class="label label-inverse"> Destructor</span> close()
<p>Close SimulScan engine, and release allocated resources. When capturing images, this is especially important since they are made available temporarily.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android

####Method Access:

* Class Method: This method is a destructor and can only be accessed via the object that was created by the `new` constructor. 
	* <code>myObj.close()</code>


### fetchTemplates(<span class="text-info">STRING</span> userName, <span class="text-info">STRING</span> password)
<p>Fetch templates from dedicated SimulScan server and place into template directory. See <a href="#ptemplateDirectory">templateDirectory property</a>. The device must have access to the network and can access the <a href="http://dpx-uat.motorolasolutions.com">SimulScan Template Builder Website</a></p>


####Parameters
<ul><li>userName : <span class='text-info'>STRING</span><p>
<p>Username of the user.</p>
 </p></li><li>password : <span class='text-info'>STRING</span><p>
<p>Password of the user.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.fetchTemplates(<span class="text-info">STRING</span> userName, <span class="text-info">STRING</span> password)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.SimulScan.fetchTemplates(<span class="text-info">STRING</span> userName, <span class="text-info">STRING</span> password)</code> 


### getAllProperties()
<p>This method will return all of object/value pairs for the propertyNames of the API class.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:

* HASH : 
<p>Map of all available properties</p>
<ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul>

####Platforms

* Android

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getAllProperties()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.SimulScan.getAllProperties()</code> 


### getDataUri(<span class="text-info">INTEGER</span> imageId)
<p>Return data URI encoding of the raw image associated with the region or captured form, this allows the operator to easily verify that the captured data is accurate and if necessary perform any post processing changes by hand. To show the image on the HTML page insert the data URI  string into the src attribute of the img tag:</p>

<pre><code>&lt;img src="dataURI string;"&gt;.
</code></pre>


####Parameters
<ul><li>imageId : <span class='text-info'>INTEGER</span><p>
<p>Id of image to retrieve. Ids are valid until close method call.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getDataUri(<span class="text-info">INTEGER</span> imageId)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.SimulScan.getDataUri(<span class="text-info">INTEGER</span> imageId)</code> 


### getDefault()
<p>This method will return an object that represents the default instance of the API Class. For example Camera.getDefault will return a Camera object that represents the default camera.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>SELF_INSTANCE</span></p><ul></ul>

####Returns
Synchronous Return:

* SELF_INSTANCE : 
<p>Default object of Module.</p>


####Platforms

* Android

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.SimulScan.getDefault()</code> 


### getProperties(<span class="text-info">ARRAY</span> arrayofNames)
<p>This method will return a set of object/value pairs for the list of the propertyName that is passed in. The propertyNames must be a valid property of the API class.</p>


####Parameters
<ul><li>arrayofNames : <span class='text-info'>ARRAY</span><p>
<p>List of properties I want to know about</p>
 </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:

* HASH : 
<p>Map of properties I want to know about</p>
<ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul>

####Platforms

* Android

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.SimulScan.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code> 


### getProperty(<span class="text-info">STRING</span> propertyName)
<p>This method will return the value of the propertyName that is passed in. The propertyName must be a valid property of the API class.</p>


####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p>
<p>The property to return info about.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING : 
<p>The property to return info about.</p>


####Platforms

* Android

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getProperty(<span class="text-info">STRING</span> propertyName)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.SimulScan.getProperty(<span class="text-info">STRING</span> propertyName)</code> 


### setDefault(<span class="text-info">SELF_INSTANCE: EB.SimulScan</span> defaultInstance)
<p>This method allows you to set the attributes of the default object instance by passing in an object of the same class.</p>


####Parameters
<ul><li>defaultInstance : <span class='text-info'>SELF_INSTANCE: EB.SimulScan</span><p>
<p>An instance object that is of the same class.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.SimulScan.setDefault(<span class="text-info">SELF_INSTANCE: EB.SimulScan</span> defaultInstance)</code> 


### setProperties(<span class="text-info">HASH</span> propertyMap)
<p>This method will set the values of a list of properties for the API class. The propertyName must be a valid property for the class and must also not be read only.</p>


####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>
<p>Map of properties I want to set</p>
 </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.setProperties(<span class="text-info">HASH</span> propertyMap)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.SimulScan.setProperties(<span class="text-info">HASH</span> propertyMap)</code> 


### setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)
<p>This method will set the value of a property for the API class. The propertyName must be a valid property for the class and must also not be read only.</p>


####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p>
<p>The one property name that I want to set</p>
 </p></li><li>propertyValue : <span class='text-info'>STRING</span><p>
<p>The one property value that I want to set</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.SimulScan.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code> 


##Properties



###audioFeedback

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Whether or not to provide audio feedback to the user following document processing.</p>

####Params
<p><strong>Default:</strong> true</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.audioFeedback</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.SimulScan.audioFeedback</code> 



####Platforms

* Android

###autoImageCapture

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>If true, form will be captured automatically when detected.</p>

<pre><code>      If false, user must manually tap screen or press trigger to capture the form.
</code></pre>

####Params
<p><strong>Default:</strong> true</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.autoImageCapture</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.SimulScan.autoImageCapture</code> 



####Platforms

* Android

###debug

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>If enabled, allows a session to write form capture, region images, region values, and other data to storage.</p>

####Params
<p><strong>Default:</strong> false</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.debug</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.SimulScan.debug</code> 



####Platforms

* Android

###decodeAudioFeedback

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Specifies the decode sound (beep) that is heard when a form is decoded.</p>

####Params
<p><strong>Default:</strong> system/media/audio/notifications/decode.wav</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.decodeAudioFeedback</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.SimulScan.decodeAudioFeedback</code> 



####Platforms

* Android

###delayResultDisplay

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>If true, the success event will be sent only after the SimulScan dialog is dismissed. If false, the event will be sent immediately after the results are ready. A false value is recommended unless direct interaction with the underlying application is necessary (e.g. keystroke input).</p>

####Params
<p><strong>Default:</strong> false</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.delayResultDisplay</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.SimulScan.delayResultDisplay</code> 



####Platforms

* Android

###flashMode

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Flash mode (off, on, disabled).</p>

####Params
<p><strong>Default:</strong> off</p>
####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.SimulScan.FLASH_OFF - String: off 
<p>Turn flash off.</p>

* Constant: EB.SimulScan.FLASH_ON - String: on 
<p>Turn flash on.</p>

* Constant: EB.SimulScan.FLASH_DISABLED - String: disabled 
<p>Disable flash.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.flashMode</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.SimulScan.flashMode</code> 



####Platforms

* Android

###frameThreshold

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Only used if autoImageCapture is enabled. The number of correct frames that is needed to pass before SimulScan will automatically start to process form. This should be between 5 and 30.</p>

####Params
<p><strong>Default:</strong> 15</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.frameThreshold</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.SimulScan.frameThreshold</code> 



####Platforms

* Android

###hapticFeedback

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Whether or not to provide haptic feedback to the user following document processing.</p>

####Params
<p><strong>Default:</strong> true</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.hapticFeedback</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.SimulScan.hapticFeedback</code> 



####Platforms

* Android

###identificationTimeout

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>The length of time, in milliseconds that the processing engine has to recognize the image from the provided template. From 0 to 20000 in increments of 100.</p>

####Params
<p><strong>Default:</strong> 15000</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.identificationTimeout</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.SimulScan.identificationTimeout</code> 



####Platforms

* Android

###inputSource

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Defines where the document should be captured from. The only supported source is camera.</p>

####Params
<p><strong>Default:</strong> camera</p>
####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.SimulScan.SOURCE_CAMERA - String: camera 
<p>The document will be captured from the device camera. After calling the captureDocument method the camera preview will be presented, the user should place the document to be captured in the preview frame and press the soft button to capture &amp; process the image.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.inputSource</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.SimulScan.inputSource</code> 



####Platforms

* Android

###ledFeedback

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>Whether or not to provide LED feedback to the user following document processing.</p>

####Params
<p><strong>Default:</strong> true</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.ledFeedback</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.SimulScan.ledFeedback</code> 



####Platforms

* Android

###logDirectory

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Specify which directory to search for logs in.</p>

####Params
<p><strong>Default:</strong> /sdcard/SimulScanLog</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.logDirectory</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.SimulScan.logDirectory</code> 



####Platforms

* Android

###negativeFrameThreshold

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Only used if autoImageCapture is enabled. Number of incorrect frames that is allowed to pass before the frame counter is reset for automatic image capture. This should be between 0 and 20.</p>

####Params
<p><strong>Default:</strong> 2</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.negativeFrameThreshold</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.SimulScan.negativeFrameThreshold</code> 



####Platforms

* Android

###processingTimeout

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Amount of time in milliseconds to wait before timing out processing.</p>

####Params
<p><strong>Default:</strong> 10000</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.processingTimeout</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.SimulScan.processingTimeout</code> 



####Platforms

* Android

###template

####Type
<span class='text-info'>STRING</span> 
####Description

<p>The template XML which defines the document to be processed. This should be file URI to the template on the device. You must provide this property to define the form being captured and what is contained in each region on that form. Templates are specific to each document format you intend on capturing and can be created online at https://dpx-uat.motorolasolutions.com/.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.template</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.SimulScan.template</code> 



####Platforms

* Android

###templateDirectory

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Specify where to store downloaded templates. See <a href="#mfetchTemplates">fetchTemplates()</a></p>

####Params
<p><strong>Default:</strong> /sdcard/templates</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.templateDirectory</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.SimulScan.templateDirectory</code> 



####Platforms

* Android

###uiResultConfirmation

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

<p>If enabled, shows a UI confirmation with results in SimulScan View before sending results back to application.</p>

####Params
<p><strong>Default:</strong> true</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.uiResultConfirmation</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.SimulScan.uiResultConfirmation</code> 



####Platforms

* Android

###version

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>Version of SimulScan engine.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.SimulScan.version</code>



####Platforms

* Android