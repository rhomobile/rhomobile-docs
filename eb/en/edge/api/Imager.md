#Imager


## Overview
The Imager API allows the device to capture images using a 2D imager or camera on the device that appears as an imager. This API is not supported on Micro Kiosk devices.

In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* elements.js 

> Note - this file either needs to be on the device in a relative folder from where your HTML page is, or it must be copied to your web server appropriately.

	:::html
    <script type="text/javascript" charset="utf-8" src="elements.js"></script>;


### API Usage
This API does not use the `EB` namespace. It is simply referenced using the API name:

	:::javascript
	imager.capture();


## Events
To handle events, you assign a string value to the event name that represents a function name or javascript statement to execute.

### imagerEvent 
The imagerEvent is called when the captured image has been successfully transfered to the specified destination.  This should be used in conjunction with the Capture method.

#### Callback Parameters

* transferResult - In response to an upload to an HTTP site, the reply from the web server will be returned. There will be no response to an upload to an FTP site.

#### Usage  
	:::javascript
	imager.imagerEvent = "url('JavaScript:imageSaveHandler(%json);')";
  	imager.capture();
	
	function imageSaveHandler(params){
		alert('Status' + params['transferResult']);
	}

### imagerCaptureEvent 
Specifying an ImagerCaptureEvent will cause the captured image to be returned as a Data URI object when the capture() method is invoked. A Data URI is a base 64 encoding of the image and can be used to easily embed the image on the page, store the image in a database or transfer the image to a server.

#### Callback Parameters

* imageData - A DataURI representation of the captured Image.

#### Usage  
	:::javascript
	imager.imagerCaptureEvent = "url('JavaScript:imageUriHandler(%json);')";
  	imager.capture();
	
	function imageUriHandler(params){
		//imagerImage may be an IMG tag object 
		//We can use this to display the image
		imagerImage.src = params.imageData;
	}

### imagerEnumEvent 
The imagerEnumEvent is called after the enumerate method is invoked to provide the available imagers on the device. 

#### Callback Parameters

* imagerArray (deviceName, friendlyName) - Two dimensional array of imagers present on the device.


>The imagerArray attribute returned from imagerEnumEvent will enumerate each imager present on the device in a 2D array, associating each Imager’s device name with a user friendly name. The deviceName can be assigned imager.enabled property. The friendly name is a user readable description of the Imager, e.g: ["IMG1", "Imager"],["IMG2", "Color Camera"].

	:::javascript
	[
	   [            //  Array for Imager 1
	      deviceName,    //  The internal name given to the Imager, use this when enabling a specific imager.
	      friendlyName,  //  A human readable description of the Imager.
	   ]
	   [            //  Array for Imager 2
	      deviceName,
	      friendlyName,
	   ]
	]

#### Usage  
	:::javascript
	imager.imagerEnumEvent = "url('JavaScript:imageEnumHandler(%json);')";
  	imager.enumerate();
	
	function imageEnumHandler(params)
	{
	    var imagerArray = params["imagerArray"];
	    var imagerInfo = "Imagers On Device: " + imagerArray.length + "<BR>ID  --  Name<BR>" 

	    for (i=0; i < imagerArray.length; i++)
	    {
	        imagerInfo = imagerInfo + imagerArray[i][0] + ' -- ' + imagerArray[i][1] + '<BR>';
	    }
	    message.innerHTML = imagerInfo;
	}

##Methods
### enable()
Enables the imager device and shows the viewer window 

####Returns
* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

### disable()
Disables the imager device and hides the viewer window

####Returns
* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

### capture()
Captures the current image and sends the file to the specified destination address. If an imagerCaptureEvent is specified the image will also be returned as a Data URI object.

####Returns
* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

### enumerate()
Return a list of imagers available on the device using ImagerEnumEvent. This event will be triggered immediately.

####Returns
* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

        
##Properties

###enabled

####Type
<span class='text-info'>STRING</span> 
####Description
Enables the referenced imager device and shows the viewer window.

#### Possible Value

* Imager ID -  Imager `devicename` IDs can be obtained via ImagerEnumEvent. Do not use the friendlyName. ex: `imager.enabled ='IMG1';`

####Platforms

* Android
* Windows Mobile
* Windows CE

###desiredWidth

####Type
<span class='text-info'>STRING</span> 
####Description
Sets the desired width of the output image, in pixels. Depending on the camera hardware in use the closest matching image size will be chosen; the width of the chosen image will equal or exceed the value specified up to the capabilities of the hardware. 

#### Possible Value

* Numeric Value

####Platforms

* Android
* Windows Mobile
* Windows CE

###desiredHeight

####Type
<span class='text-info'>STRING</span> 
####Description
Sets the desired height of the output image, in pixels. Depending on the camera hardware in use the closest matching image size will be chosen; the width of the chosen image will equal or exceed the value specified up to the capabilities of the hardware. 

#### Possible Value

* Numeric Value

####Platforms

* Android
* Windows Mobile
* Windows CE

###username

####Type
<span class='text-info'>STRING</span> 
####Description
The username for the HTTP or FTP server if required.

####Platforms

* Android
* Windows Mobile
* Windows CE

###password

####Type
<span class='text-info'>STRING</span> 
####Description
The password for the HTTP or FTP server if required.

####Platforms

* Android
* Windows Mobile
* Windows CE

###left

####Type
<span class='text-info'>INTEGER</span> - Positive number, representing pixels
####Description
Sets the top left horizontal position of the viewer window in pixels.
#### Possible Value

* Numeric Value (0 - ScreenWidth)

####Platforms

* Android
* Windows Mobile
* Windows CE

###top

####Type
<span class='text-info'>INTEGER</span> - Positive number, representing pixels
####Description
Sets the top left vertical position of the viewer window in pixels.
#### Possible Value

* Numeric values (0 - ScreenHeight)

####Platforms

* Android
* Windows Mobile
* Windows CE

###width

####Type
<span class='text-info'>INTEGER</span> - Positive number, representing pixels
####Description
Sets the width of the viewer window in pixels.
#### Possible Value

* Numeric values (0 - ScreenWidth)

####Platforms

* Android
* Windows Mobile
* Windows CE

###height

####Type
<span class='text-info'>INTEGER</span> - Positive number, representing pixels
####Description
Sets the height of the viewer window in pixels.
#### Possible Value

* Numeric values (0 - ScreenHeight)

>Note: On Android the height of the viewfinder cannot be set to any value less than 200.

####Platforms

* Android
* Windows Mobile
* Windows CE

###destination

####Type
<span class='text-info'>STRING</span> 
####Description
Sets the destination path and name for the captured video file.

#### Possible Value

* Fully qualified URL or file name. Supports HTTP, FTP and File protocols.

>Note: The protocol, port number, username (optional) and password (optional) are all derived from the URL string and should be specified in the following manner: [protocol]://[username]:[password@]Server[:Port]FileNameAndPath. FTP Example: ftp://admin:root@192.168.1.1:2500/Folder/Cap.mov. HTTP Example: http://admin:root@192.168.1.1:8080/Folder/Upload.aspx. File Example: file://\path\Cap.mov.

####Platforms

* Android
* Windows Mobile
* Windows CE

###lamp

####Type
<span class='text-info'>STRING</span> 
####Description
Switches the illumination lamp ON or OFF.

#### Possible Value

* ON/OFF 

####Platforms

* Android
* Windows Mobile
* Windows CE

###aim

####Type
<span class='text-info'>STRING</span> 
####Description
Switches the imager laser aimer ON or OFF.

#### Possible Value

* ON/OFF 

####Platforms

* Android
* Windows Mobile
* Windows CE

###sound

####Type
<span class='text-info'>STRING</span> 
####Description
Specifies the wave file to play when capturing an image.

#### Possible Value

* wav file name - ex: '\windows\alarm2.wav' 

####Platforms

* Android
* Windows Mobile
* Windows CE


##Remarks

###Scanning and Image Capture Interaction
In some device configurations the scanner and imager share the same hardware, e.g. the blockbuster scanner and top mounted imager on the MC75a. Where two modules share the same physical hardware they cannot be enabled simultaneously, once the scanner is enabled it must be disabled before the imager can be used, and vice versa.

###Setting up a Transfer to a remote HTTP or FTP location
The Imager API is designed to be configured before any transfer is made to a remote location. If the 'Destination' parameter is specified as either HTTP or an FTP location the 'destination' / 'username' / 'password' parameters can not be guaranteed to stay the same after the capture has completed, therefore configure your destination for each capture.

### Image Size
The image can only be stretched as far as the screen dimensions will allow, do not expect to be able to create an image larger than the dimensions of your device's screen.

###Multi Instance
When multiple Enterprise Browser applications are running the following considerations should be made: Only the foreground application is given access to the imaging hardware, when an application is sent to the background its state will be saved and it will automatically relinquish control of the imager. When brought back to the foreground, an application previously using the imager will have its previous configuration (eg. whether it was enabled or not) reapplied to the imager automatically. Please note that any file transfer that is in progress continues even if the application is sent to the background and capture will not have any effect on an application that is in the background
