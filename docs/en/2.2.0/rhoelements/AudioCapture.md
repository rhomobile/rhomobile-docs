# AudioCapture Module
**The AudioCapture Module captures audio files from the default microphone device.**

## Syntax

<table class="re-table">
	<tr>
		<th class="tableHeading">audioCapture (Module) &lt;META&gt; Syntax</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="AudioCapture" content="[method / parameter]"&gt;</p></td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><p>&lt;META HTTP-Equiv="AudioCapture" content="AudioSaveEvent:url('[jsFunction | url]')"&gt;</p></td>
	</tr>
</table>

<table class="re-table">
	<tr>
		<th class="tableHeading">AudioCapture JavaScript Object Syntax:</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			By default the JavaScript Object <b>'audioCapture'</b> will exist on the current page and can be used to interact directly with the audioCapture.
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow">
			To Invoke audioCapture methods via JavaScript use the following syntax:<br/>
			<code>audiocapture.method();</code>
			<br/><br/>
			e.g. <b>audioCapture</b>.start();
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			To Set audioCapture parameters via JavaScript use the following syntax:<br/>
			<code>audiocapture.parameter = 'value';</code><br/>
			remembering to enclose your value in quotes where appropriate.
			<br/><br/>
			e.g. <b>audioCapture</b>.duration = 'value';
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow">
			To Set audioCapture return events via JavaScript use the following syntax:<br/>
			<code>audiocapture.event = JavaScript Function;</code>
			<br/><br/>
			e.g. <b>audioCapture</b>.audioSaveEvent = 'doFunction(%json)';
			<br/><br/>
			For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents">Retrieval Events</a> page.
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: audiocapture.setEMML("[Your EMML Tags]");
			<br/><br/>
			e.g. <b>audioCapture</b>.setEMML("duration:<i>value</i>;audioSaveEvent:url('JavaScript:doFunction(%json)');start");
		</td>
	</tr>
</table>

<table class="re-table">
	<tr>
		<th class="tableHeading">AudioCapture Ruby Object Syntax:</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			By default the Ruby Object <b>'AudioCapture'</b> will exist on the current page and can be used to interact directly with the AudioCapture. All Methods, Parameters and Events are the same as JavaScript, however, notice <b>'AudioCapture'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b>
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow">
			To Invoke AudioCapture methods via Ruby use the following syntax: AudioCapture.method()
			<br/><br/>
			e.g. <b>AudioCapture</b>.start
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			To Set AudioCapture parameters via Ruby use the following syntax: AudioCapture.parameter = 'value' remembering to enclose your value in quotes where appropriate.
			<br/><br/>
			e.g. <b>AudioCapture</b>.duration = 'value'
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow">
			To Set AudioCapture return events via Ruby use the following syntax: AudioCapture.event = url_for(:action =&gt; :event_callback) 
			<br/><br/>
			e.g. <b>AudioCapture</b>.audioSaveEvent = url_for(:action =&gt; :audiocapture_event_callback)
			<br/><br/>
			For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents#params-object">Retrieval Events</a> page.<p>To access the event parameters in a Ruby callback function, you reference the @params object within the callback function. This object is simply a ruby hash {"parameter1 name" =&gt; "parameter1 value", "parameter2 name" =&gt; "parameter2 value", ...}</p>
		</td>
	</tr>
</table>

## Methods
Items listed in this section indicate methods or, in some cases, indicate parameters which will be retrieved.

<table class="re-table"><col width="10%"/><col width="68%"/><col width="22%"/>
	<tr>
		<th class="tableHeading">Name</th>
		<th class="tableHeading">Description</th>
		<th class="tableHeading">Default Value</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>start</b></td>
		<td class="clsSyntaxCells clsOddRow">Starts capturing audio until either 'stop' is received, or 'duration' is reached (i.e. until the buffer is full).</td>
		<td class="clsSyntaxCells clsOddRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>stop</b></td>
		<td class="clsSyntaxCells clsEvenRow">Stops capturing audio and either saves the file locally, or transfers it to a remote server</td>
		<td class="clsSyntaxCells clsEvenRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>cancel</b></td>
		<td class="clsSyntaxCells clsOddRow">Stops capturing audio and discards any captured audio data</td>
		<td class="clsSyntaxCells clsOddRow">N/A</td>
	</tr>
</table>

## Parameters
Items listed in this section indicate parameters, or attributes which can be set.

<table class="re-table"><col width="20%"/><col width="20%"/><col width="38%"/><col width="22%"/>
	<tr>
		<th class="tableHeading">Name</th>
		<th class="tableHeading">Possible Values</th>
		<th class="tableHeading">Description</th>
		<th class="tableHeading">Default Value</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>duration:[Value]</b></td><td class="clsSyntaxCells clsOddRow">Milliseconds</td>
		<td class="clsSyntaxCells clsOddRow">
			Specifies the number of milliseconds of audio to capture, defining the size of the capture buffer. This is also the maximum number of milliseconds of audio to capture when the 'start' method is called if not interrupted with the 'stop' method. The duration cannot be set to less than 1000 milliseconds, if a value of less than 1000 milliseconds is specified, the interval will be defaulted to 20000 milliseconds.
		</td>
		<td class="clsSyntaxCells clsOddRow">20000</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>destination:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">Fully qualified URL or file name. Supports HTTP, FTP and File protocols.</td>
		<td class="clsSyntaxCells clsEvenRow">Sets the destination path and name for the captured WAV file.  See Remarks</td>
		<td class="clsSyntaxCells clsEvenRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>username:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">String</td>
		<td class="clsSyntaxCells clsOddRow">The username for the HTTP or FTP server if required</td>
		<td class="clsSyntaxCells clsOddRow">No username</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>password:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">String</td>
		<td class="clsSyntaxCells clsEvenRow">The password for the HTTP or FTP server if required</td>
		<td class="clsSyntaxCells clsEvenRow">No password</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>name:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">String compliant with Windows Naming restrictions</td>
		<td class="clsSyntaxCells clsOddRow">
			When the audio capture completes a file is saved in the root directory of the device (package directory in case of Android).  This parameter is used to specify the filename when storing the file locally.
		</td>
		<td class="clsSyntaxCells clsOddRow">AudioCapture</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>codec:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">"AAC", "AMR_NB" or "AMR_WB"</td>
		<td class="clsSyntaxCells clsEvenRow">The Audio Encoder can be specified through this attribute. Note This is only on Android</td>
		<td class="clsSyntaxCells clsEvenRow">"AAC"</td>
	</tr>
</table>

## Events
Values are returned to the caller in RhoElements via Events.  Most modules contain events and those returned from this module are given below along with the event parameters.  Events can cause a navigation to a new URL or a JavaScript function on the page to be invoked.  Each event will in most cases have a number of parameters associated with it which will either be strings or JavaScript arrays.  Event parameters can be accessed either directly or via JSON objects.

### audioSaveEvent
The Audio Save Event is called when the captured audio has been successfully transfered to the specified destination. When a capture is started with the HTTP protocol, the destination server message is returned. When it is called with the FTP protocol, either 'OK: File Sent', 'OK: File Received' or 'ERROR' is returned. This tag should be used in conjunction with the Start method.

<table class="re-table"><col width="3%"/><col width="20%"/><col width="77%"/>
	<tr>
		<th class="tableHeading">ID</th>
		<th class="tableHeading">Name</th>
		<th class="tableHeading">Description</th>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">1</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>transferResult</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">Success or failure of transfer, see note above.</td>
	</tr>
</table>

## Multi Instance
When multiple RhoElememts applications are running the following considerations should be made: Only the foreground RhoElements application is given access to capture audio, when an application is sent to the background any capture that is in progress will be canceled and it will automatically relinquish control of the Audio hardware.  When brought back to the foreground, an application previously using the audio capture will have its previous configuration (eg. name etc.) reapplied to the plug-in automatically. Please note that any file transfer that is in progress continues even if the application is sent to the background.

## Remarks
### Rhodes Applications
If your application is a 'Rhodes' application then AudioCapture will create a WAV format file with 22050 Hz 16 bit MONO. The destination property only supports a local path. The Code and Username/Password properties are not used. If your application is 'rhoelements' type application, then AudioCapture is automatically added to the application. If your application is built for Android and your application is 'rhoelements' type and you do not setup 'non_motorola_device' capability, then the AudioCapture native extension is removed from the application automatically because in this case, the application already has Zebra rhoelements extension with implementation of the same AudioCapture API.

### Buffer full
Once duration has been reached the audio file will be saved or transferred. Calling 'stop' once this has occurred will have no effect.

### Audio Encoder
Not all the audio encoders are supported on all the platforms. The encoders AAC, AMR_NB and AMR_WB are supported only on Android and the encoder WAV is supported only on Windows. The output file format for AMR_NB and AMR_WB encoders is 3GPP and for AAC encoder is MP4.

### File Storage Error
An Audio Capture will fail if there is not sufficient space on the device's file system to store it.

### Setting up a Transfer to a remote HTTP or FTP location
Audio Capture is designed to be configured before any transfer is made to a remote location. If the 'Destination' parameter is specified as either HTTP or an FTP location the 'destination' / 'username' / 'password' parameters can not be guaranteed to stay the same after the capture has completed, therefore configure your destination for each capture.

### Format of the Destination URL
The protocol, port number, username (optional) and password (optional) are all derived from the URL string and should be specified in the following manner: [protocol]://[username]:[password@]Server[:Port]FileNameAndPath. FTP Example: ftp://admin:root@192.168.1.1:2500/Folder/Cap.wav. HTTP Example: http://admin:root@192.168.1.1:8080/Folder/Upload.aspx. File Example: file://\path\Cap.wav. Remember to also wrap your URL with url('') when being used as part of a meta tag, as shown in the examples above.

## Requirements

<table class="re-table">
	<tr>
		<th class="tableHeading">RhoElements Version</th>
		<td class="clsSyntaxCell clsEvenRow">2.2 or above</td>
	</tr>
	<tr>
		<th class="tableHeading">Supported Devices</th>
		<td class="clsSyntaxCell clsOddRow">All devices</td>
	</tr>
	<tr>
		<th class="tableHeading">Minimum Requirements</th>
		<td class="clsSyntaxCell clsOddRow">Microphone</td>
	</tr>
	<tr>
		<th class="tableHeading">Persistence</th>
		<td class="clsSyntaxCell clsEvenRow">Not Persistent - Changes to this module will not persist when navigating to a new page.</td>
	</tr>
</table>

##HTML/JavaScript Examples
The following META Tag example performs a 30 second capture. The resulting audio file will be transferred to a server via HTTP and an alert will inform the user whether or not the transfer succeeded.

	:::html
	<META HTTP-Equiv="AudioCapture" Content="duration:30000">
	<META HTTP-Equiv="AudioCapture" Content="Destination:url('HTTP://192.168.1.1:80/Uploaded/upload.aspx')">
	<META HTTP-Equiv="AudioCapture" Content="AudioSaveEvent:url('javascript:alert('%s');')">
	<META HTTP-Equiv="AudioCapture" Content="start">

The following JavaScript will start and stop an audio capture respectively when onStart and onStop are called with a 60 second limit:

	:::html
	<script>
	  function onStart()
	  {
	    audioCapture.duration = '60000';
	    audioCapture.start();
	  }

	  function onStop()
	  {
	    audioCapture.stop();
	  }
	</script>

The following JavaScript will start a 30 second audio capture when onStart is called:

	:::html
	<script>
	  function onStart()
	  {
	    audioCapture.duration = '30000';
	    audioCapture.start();
	  }
	</script>