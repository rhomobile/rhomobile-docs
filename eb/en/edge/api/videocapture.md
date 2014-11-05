#Videocapture


## Overview
The VideoCapture Module captures video files from the default camera device.

In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* elements.js 

> Note - this file either needs to be on the device in a relative folder from where your HTML page is, or it must be copied to your web server appropriately.

	:::html
    <script type="text/javascript" charset="utf-8" src="elements.js"></script>;


### API Usage
This API does not use the `EB` namespace. It is simply referenced using the API name:

	:::javascript
	videoCapture.duration = '60000';
	videocapture.videoSaveEvent = "url('JavaScript:videoSaveHandler(%json);')";
    videoCapture.start();


## Events
To handle events, you assign a string value to the event name that represents a function name or javascript statement to execute.

### videoSaveEvent 
The videoSaveEvent is called when the captured video has been successfully transfered to the specified destination.  This should be used in conjunction with the Start method.

#### Callback Parameters

* transferResult - Success or failure of transfer. When a capture is started with the HTTP protocol, the destination server message is returned. When it is called with the FTP protocol, either ‘OK: File Sent’, ‘OK: File Received’ or ‘ERROR’ is returned.

#### Usage  
	:::javascript
	videocapture.videoSaveEvent = "url('JavaScript:videoSaveHandler(%json);')";
  	videocapture.start();
	
	function videoSaveHandler(params){
		alert('Status' + params['transferResult']);
	}


##Methods
### cancel()
Stops capturing video and discards any captured video data. No file transfer takes place if the video capture is canceled. 

>NOTE: This is not applicable for Android as the video capture window is full screen and provides a button to cancel the video capture.

####Returns
* Void

####Platforms

* Windows Mobile
* Windows CE

### start()
Starts capturing video until either 'stop' is received, or 'duration' is reached. 

>NOTE: On Android this method wouldn't immediately start recording and presents a preview window with controls (start, stop and cancel) for recording.

####Returns
* Void : The function specified in the videoSaveEvent will be called upon a successful transfer of the video to the specified destination.

####Platforms

* Android
* Windows Mobile
* Windows CE


### stop()
Stops capturing video and either saves the file locally, or transfers it to a remote server. 

>NOTE: This is not applicable for Android as the video capture window is full screen and provides a button to stop the video capture. Please note that the file transfer happens as specified even if we don't call the stop method.

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile
* Windows CE

        
##Properties

###duration

####Type
<span class='text-info'>STRING</span> 
####Description
Specifies the number of milliseconds of video to capture. It is the maximum number of milliseconds of video to capture when the 'start' method is called if not interrupted with the 'stop' method. The duration cannot be set to less than 1000 milliseconds, if a value of less than 1000 milli seconds is specified, the interval will be defaulted to 5000 milliseconds.

#### Possible Value

* Milliseconds

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

###name

####Type
<span class='text-info'>STRING</span> 
####Description
The password for the HTTP or FTP server if required.
#### Possible Value

* When the video capture completes a video file is saved in the root directory of the device (package directory in case of Android). This parameter is used to specify the filename when storing the file locally. Default is `VideoCapture`.

####Platforms

* Android
* Windows Mobile
* Windows CE

##Remarks

###Buffer full
Once duration has been reached the video file will be saved or transferred. Calling 'stop' once this has occurred will have no effect.

###File Formats
The output file format on Android is MP4 and on Windows is WMV.

###File Storage Error
A Video Capture will fail if there is not sufficient space on the device's filesystem to store it.

###Setting up a Transfer to a remote HTTP or FTP location
Video Capture is designed to be configured before any transfer is made to a remote location. If the 'Destination' parameter is specified as either HTTP or an FTP location the 'destination' / 'username' / 'password' parameters can not be guaranteed to stay the same after the capture has completed, therefore configure your destination for each capture.