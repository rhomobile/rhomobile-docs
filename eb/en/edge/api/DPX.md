#DPX


## Overview
<p>The DPX (Document Processing eXtensions) is a software solution that enables customers to extract and
process various types of information from documents. A single document may contain barcodes, text, image data and
forms, using DPX this data can be extracted programmatically using OCR, barcode decoding and image capture. For
example, a driver&rsquo;s license can be thought of as a template containing regions such as name and address, signature
and photo, each of these regions are processed and returned to RhoElements separately by DPX so Optical Character
Recognition captures the owners name and address whilst their photo is captured separately. These regions are
defined by a template which maps the various regions of the document to the data they contain and can be created
on-line at <a href="https://dpx-uat.motorolasolutions.com/">The MSI DPX template builder</a>.</p>
<h2>Enabling the API</h2>

<p>In order to use this API you must include the following extension in your <code>build.yml</code>.</p>

<pre><code>:::ruby
extensions: ["dpx"]
</code></pre>

<h2>JavaScript Usage</h2>

<p>Be sure to review the <a href="/guide/api_js">JavaScript API Usage</a> guide for important information about using this API
in JavaScript.</p>

<h2>Ruby Usage</h2>

<p>Be sure to review the <a href="/guide/api_ruby">Ruby API Usage</a> guide for important information about using this API in
Ruby.</p>



##Methods



### captureDocument()
Capture a document by either taking a photo of it and process that image for fields defined in the template. You must specify the template associated with the capture either through the template property or as part of the propertyMap when calling this method. If the document processing does not succeed the returned callback will contain failure description. If the captured document is processed successfully a callback will contain document data.
        

### <span class="label label-inverse"> Destructor</span> close()
Close DPX engine, and release allocated resources. When capturing images, this is especially important since they are made available temporarily.

### fetchTemplates()
Fetch templates from dedicated DPX server and place into template directory. See [templateDirectory property](#ptemplateDirectory). The device must have access to the network and can access the [DPX Template Builder Website](http://dpx-uat.motorolasolutions.com)

### getAllProperties()
This method will return all of object/value pairs for the propertyNames of the API class.

### getDataUri()
Return data URI encoding of the raw image associated with the region or captured form, this allows the operator to easily verify that the captured data is accurate and if necessary perform any post processing changes by hand. To show the image on the HTML page insert the data URI  string into the src attribute of the img tag: 
    <img src="dataURI string;">.
        

### getDefault()
This method will return an object that represents the default instance of the API Class. For example Camera.getDefault will return a Camera object that represents the default camera.

### getProperties()
This method will return a set of object/value pairs for the list of the propertyName that is passed in. The propertyNames must be a valid property of the API class.

### getProperty()
This method will return the value of the propertyName that is passed in. The propertyName must be a valid property of the API class.

### setDefault()
This method allows you to set the attributes of the default object instance by passing in an object of the same class.

### setProperties()
This method will set the values of a list of properties for the API class. The propertyName must be a valid property for the class and must also not be read only.

### setProperty()
This method will set the value of a property for the API class. The propertyName must be a valid property for the class and must also not be read only.