# VideoCapture
## Overview
The VideoCapture Module captures video files from the default camera device.

## Enabling the API
In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* elements.js

> Note - this file either needs to be on the device in a relative folder from where your HTML page is, or it must be copied to your web server appropriately.

	:::html
	<script type="text/javascript" charset="utf-8" src="elements.js"></script>;

### API Usage
This API does not use the `EB` namespace. It is simply referenced using the API name:

	:::javascript
	videoCapture.duration = '60000';
	videoCapture.videoSaveEvent = "url('JavaScript:videoSaveHandler(%json);')";
	videoCapture.start();

## Events
To handle events, you assign a string value to the event name that represents a function name or JavaScript statement to execute.

### videoSaveEvent
The videoSaveEvent is called when the captured video has been successfully transfered to the specified destination. This should be used in conjunction with the Start method.

#### Callback Parameters
* transferResult - Success or failure of the transfer

Using the HTTP protocol:

* 'OK: File Received' is returned;
* 'destination server message' for HTTP uploads

Using the FTP protocol:

* 'OK: File Sent'
* 'OK: File Received'
* 'Error':  If there is an error during the transfer and may be followed by the relevant Windows error code; see the log file for more information on the error.

#### Usage
	:::javascript
	videoCapture.videoSaveEvent = "url('JavaScript:videoSaveHandler(%json);')";
	videoCapture.start();

	function videoSaveHandler(params){
		alert('Status' + params['transferResult']);
	}

## Methods
Items listed in this section indicate methods or, in some cases, indicate parameters which will be retrieved.

> NOTE: On Android the operating System presents a preview window with controls (Start, stop and cancel) for recording. The file transfer will happen as specified even if the stop  is not sent by this API.

### start()
Starts capturing video until either 'stop' is received, or 'duration' is reached.

#### Returns
* Void

#### Platforms

* Android
* Windows Mobile/CE

### stop()
Stops capturing video and either saves the file locally, or transfers it to a remote server.

#### Returns
* Void

#### Platforms

* Android
* Windows Mobile/CE

### cancel()
Stops capturing video and discards any captured video data.

#### Returns
* Void

#### Platforms

* Android
* Windows Mobile/CE

## Properties
### duration
#### Type
<span class='text-info'>INTEGER</span> - Number of milliseconds of video to capture.

#### Description
Specifies the number of milliseconds of video to capture. It is the maximum number of milliseconds of video to capture when the 'start' method is called if not interrupted with the 'stop' method. The duration cannot be set to less than 1000 milliseconds, if a value of less than 1000 milliseconds is specified, the interval will be defaulted to 5000 milliseconds.

#### Platforms

* Android
* Windows Mobile/CE

### destination
#### Type
<span class='text-info'>STRING</span> - Fully qualified URL or file name. Supports HTTP, FTP and File protocols.

#### Description
Sets the destination path and name for the captured video file. See Remarks.

#### Platforms

* Android
* Windows Mobile/CE

### username
#### Type
<span class='text-info'>STRING</span>

#### Description
The username for the HTTP or FTP server if required. Default is no username.
#### Platforms

* Android
* Windows Mobile/CE

### password
#### Type
<span class='text-info'>STRING</span>

#### Description
The password for the HTTP or FTP server if required. Default is no password.

#### Platforms

* Android
* Windows Mobile/CE

### name
#### Type
<span class='text-info'>STRING</span> - Must be compliant with Windows Naming restrictions.

#### Description
When the video capture completes a video file is saved in the root directory of the device (package directory in case of Android). This parameter is used to specify the filename when storing the file locally. Default is "VideoCapture".

#### Platforms

* Android
* Windows Mobile/CE

## Remarks
### Buffer full
Once duration has been reached the video file will be saved or transferred. Calling 'stop' once this has occurred will have no effect.

### File Formats
The output file format on Android is MP4 and on Windows is WMV.

### File Storage Error
A Video Capture will fail if there is not sufficient space on the device's file system to store it.

### Setting up a Transfer to a remote HTTP or FTP location
Video Capture is designed to be configured before any transfer is made to a remote location. If the 'Destination' parameter is specified as either HTTP or an FTP location the 'destination' / 'username' / 'password' parameters can not be guaranteed to stay the same after the capture has completed, therefore configure your destination for each capture.

### Format of the Destination URL
The protocol, port number, username (optional) and password (optional) are all derived from the URL string and should be specified in the following manner: [protocol]://[username]:[password@]Server[:Port]FileNameAndPath. FTP Example: ftp://admin:root@192.168.1.1:2500/Folder/Cap.mov. HTTP Example: http://admin:root@192.168.1.1:8080/Folder/Upload.aspx. File Example: file://\path\Cap.mov. Remember to also wrap your URL with url('') when being used as part of a meta tag, as shown in the examples above.

## Example
The following JavaScript will start and stop a video capture respectively when onStart and onStop are called with a 60 second limit:

	:::javascript
	<script>
		function onStart()
		{
			videoCapture.duration = '60000';
			videoCapture.start();
		}

		function onStop()
		{
			videoCapture.stop();
		}
	</script>

The following JavaScript will start a 30 second video capture when onStart is called:

	<script>
		function onStart()
		{
			videoCapture.duration = '30000';
			videoCapture.start();
		}
	</script>