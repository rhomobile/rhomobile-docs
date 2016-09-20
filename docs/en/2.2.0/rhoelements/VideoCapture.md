
#VideoCapture Module

<b>
The VideoCapture Module captures video files from the default camera device.
</b>

##Syntax

<table class="re-table"><tr><th class="tableHeading">videoCapture (Module) &lt;META&gt; Syntax
</th></tr><tr><td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="VideoCapture" content="[method / parameter]"&gt;</p></td></tr><tr><td class="clsSyntaxCells clsEvenRow"><p>&lt;META HTTP-Equiv="VideoCapture" content="VideoSaveEvent:url('[jsFunction | url]')"&gt;</p></td></tr></table>
<table class="re-table"><tr><th class="tableHeading">VideoCapture JavaScript Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the JavaScript Object <b>'videoCapture'</b> will exist on the current page and can be used to interact directly with the videoCapture.
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Invoke videoCapture methods via JavaScript use the following syntax: videocapture.method();
<P />e.g. <b>videoCapture</b>.start();
</td></tr><tr><td class="clsSyntaxCells clsOddRow">
To Set videoCapture parameters via JavaScript use the following syntax: videocapture.parameter = 'value'; remembering to enclose your value in quotes where appropriate.
<P />e.g. <b>videoCapture</b>.duration = 'value';
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Set videoCapture return events via JavaScript use the following syntax: videocapture.event = JavaScript Function;
<P />e.g. <b>videoCapture</b>.videoSaveEvent = 'doFunction(%json)';
<P />
For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents">Retrieval Events</a> page.

</td></tr><tr><td class="clsSyntaxCells clsOddRow">
To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: videocapture.setEMML("[Your EMML Tags]");
<P />
e.g. <b>videoCapture</b>.setEMML("duration:<i>value</i>;videoSaveEvent:url('JavaScript:doFunction(%json)');start");
</td></tr></table>

<table class="re-table"><tr><th class="tableHeading">VideoCapture Ruby Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the Ruby Object <b>'VideoCapture'</b> will exist on the current page and can be used to interact directly with the VideoCapture. All Methods, Parameters and Events are the same as JavaScript, however, notice <b>'VideoCapture'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b></td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Invoke VideoCapture methods via Ruby use the following syntax: VideoCapture.method()
<P />e.g. <b>VideoCapture</b>.start</td></tr><tr><td class="clsSyntaxCells clsOddRow">
To Set VideoCapture parameters via Ruby use the following syntax: VideoCapture.parameter = 'value' remembering to enclose your value in quotes where appropriate.
<P />e.g. <b>VideoCapture</b>.duration = 'value'
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Set VideoCapture return events via Ruby use the following syntax: VideoCapture.event = url_for(:action =&gt; :event_callback)
<P />e.g. <b>VideoCapture</b>.videoSaveEvent = url_for(:action =&gt; :videocapture_event_callback)
<P />
For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents#params-object">Retrieval Events</a> page.
<p>To access the event parameters in a Ruby callback function, you reference the @params object within the callback function. This object is simply a ruby hash {"parameter1 name" =&gt; "parameter1 value", "parameter2 name" =&gt; "parameter2 value", ...}</p></td></tr><tr><td class="clsSyntaxCells clsOddRow" /></tr></table>

## Methods
Items listed in this section indicate methods or, in some cases, indicate parameters which will be retrieved.

> NOTE: On Android the operating System presents a preview window with controls (Start, stop and cancel) for recording. The file transfer will happen as specified even if the stop  is not sent by this API.

<table class="re-table">
	<col width="10%"/>
	<col width="68%"/>
	<col width="22%"/>
	<tr>
		<th class="tableHeading">Name</th>
		<th class="tableHeading">Description</th>
		<th class="tableHeading">Default Value</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>start</b></td>
		<td class="clsSyntaxCells clsOddRow">
			Starts capturing video until either 'stop' is received, or 'duration' is reached.
		</td>
		<td class="clsSyntaxCells clsOddRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>stop</b></td>
		<td class="clsSyntaxCells clsEvenRow">
			Stops capturing video and either saves the file locally, or transfers it to a remote server.
		</td>
		<td class="clsSyntaxCells clsEvenRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>cancel</b></td>
		<td class="clsSyntaxCells clsOddRow">
			Stops capturing video and discards any captured video data.
		</td>
		<td class="clsSyntaxCells clsOddRow">N/A</td>
	</tr>
</table>

##Parameters


Items listed in this section indicate parameters, or attributes which can be set.
<table class="re-table"><col width="20%" /><col width="20%" /><col width="38%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Possible Values</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>duration:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Milliseconds</td><td class="clsSyntaxCells clsOddRow">Specifies the number of milliseconds of video to capture.  It is the maximum number of milliseconds of video to capture when the 'start' method is called if not interrupted with the 'stop' method. The duration cannot be set to less than 1000 milliseconds, if a value of less than 1000 milli seconds is specified, the interval will be defaulted to 5000 milli seconds.</td><td class="clsSyntaxCells clsOddRow">5000</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>destination:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Fully qualified URL or file name.  Supports HTTP, FTP and File protocols.</td><td class="clsSyntaxCells clsEvenRow">Sets the destination path and name for the captured video file.  See Remarks</td><td class="clsSyntaxCells clsEvenRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>username:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">String</td><td class="clsSyntaxCells clsOddRow">The username for the HTTP or FTP server if required</td><td class="clsSyntaxCells clsOddRow">No username</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>password:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">String</td><td class="clsSyntaxCells clsEvenRow">The password for the HTTP or FTP server if required</td><td class="clsSyntaxCells clsEvenRow">No password</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>name:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">String compliant with Windows Naming restrictions</td><td class="clsSyntaxCells clsOddRow">When the video capture completes a video file is saved in the root directory of the device (package directory in case of Android).  This parameter is used to specify the filename when storing the file locally. </td><td class="clsSyntaxCells clsOddRow">VideoCapture</td></tr></table>
<table class="re-table"><col width="78%" /><col width="8%" /><col width="1%" /><col width="5%" /><col width="1%" /><col width="5%" /><col width="2%" /></table>

##Events


Values are returned to the caller in RhoElements via Events.  Most modules contain events and those returned from this module are given below along with the event parameters.  Events can cause a navigation to a new URL or a JavaScript function on the page to be invoked.  Each event will in most cases have a number of parameters associated with it which will either be strings or JavaScript arrays.  Event parameters can be accessed either directly or via JSON objects.

<br />
###videoSaveEvent
The Video Save Event is called when the captured video has been successfully transfered to the specified destination. When a capture is started with the HTTP protocol, the destination server message is returned. When it is called with the FTP protocol, either 'OK: File Sent', 'OK: File Received' or 'ERROR' is returned. This tag should be used in conjunction with the Start method.
<table class="re-table"><col width="3%" /><col width="20%" /><col width="77%" /><tr><th class="tableHeading">ID</th><th class="tableHeading">Name</th><th class="tableHeading">Description</th></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">1</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>transferResult</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">Success or failure of transfer, see note above.</td></tr></table>



##Multi Instance
When multiple RhoElememts applications are running the following considerations should be made: Only the foreground RhoElements application is given access to capture video, when an application is sent to the background any capture that is in progress will be cancelled and it will automatically relinquish control of the video hardware.  When brought back to the foreground, an application previously using the video capture will have its previous configuration (eg. name etc.) reapplied to the plugin automatically. Please note that any file transfer that is in progress continues even if the application is sent to the background.


##Remarks


###Buffer full
Once duration has been reached the video file will be saved or transferred. Calling 'stop' once this has occurred will have no effect.


###File Formats
The output file format on Android is MP4 and on Windows is WMV.


###File Storage Error
A Video Capture will fail if there is not sufficient space on the device's filesystem to store it.


###Setting up a Transfer to a remote HTTP or FTP location
Video Capture is designed to be configured before any transfer is made to a remote location. If the 'Destination' parameter is specified as either HTTP or an FTP location the 'destination' / 'username' / 'password' parameters can not be guaranteed to stay the same after the capture has completed, therefore configure your destination for each capture.


###Format of the Destination URL
The protocol, port number, username (optional) and password (optional) are all derived from the URL string and should be specified in the following manner: [protocol]://[username]:[password@]Server[:Port]FileNameAndPath. FTP Example: ftp://admin:root@192.168.1.1:2500/Folder/Cap.mov. HTTP Example: http://admin:root@192.168.1.1:8080/Folder/Upload.aspx. File Example: file://\path\Cap.mov. Remember to also wrap your URL with url('') when being used as part of a meta tag, as shown in the examples above.




##Requirements

<table class="re-table"><tr><th class="tableHeading">RhoElements Version</th><td class="clsSyntaxCell clsEvenRow">2.2 or above
</td></tr><tr><th class="tableHeading">Supported Devices</th><td class="clsSyntaxCell clsOddRow">All devices.</td></tr><tr><th class="tableHeading">Minimum Requirements</th><td class="clsSyntaxCell clsOddRow">Camera</td></tr><tr><th class="tableHeading">Persistence</th><td class="clsSyntaxCell clsEvenRow">Not Persistent - Changes to this module will not persist when navigating to a new page.</td></tr></table>


##HTML/JavaScript Examples

The following META Tag example performs a 30 second capture. The resulting video file will be transferred to a server via HTTP and an alert will inform the user whether or not the transfer succeeded.

	<META HTTP-Equiv="VideoCapture" Content="duration:30000">
	<META HTTP-Equiv="VideoCapture" Content="Destination:url('HTTP://192.168.1.1:80/Uploaded/upload.aspx')">
	<META HTTP-Equiv="VideoCapture" Content="VideoSaveEvent:url('javascript:alert('%s');')">
	<META HTTP-Equiv="VideoCapture" Content="start">

The following JavaScript will start and stop a video capture respectively when onStart and onStop are called with a 60 second limit:

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



