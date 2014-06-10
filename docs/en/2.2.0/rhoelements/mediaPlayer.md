
#MediaPlayer Module

<b>
The MediaPlayer Module plays audio/video files.
</b>

##Syntax

<table class="re-table"><tr><th class="tableHeading">mediaPlayer (Module) &lt;META&gt; Syntax
</th></tr><tr><td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="mediaPlayer" content="[method / parameter]"&gt;</p></td></tr></table>
<table class="re-table"><tr><th class="tableHeading">MediaPlayer JavaScript Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the JavaScript Object <b>'mediaPlayer'</b> will exist on the current page and can be used to interact directly with the mediaPlayer.
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Invoke mediaPlayer methods via JavaScript use the following syntax: mediaplayer.method();
<P />e.g. <b>mediaPlayer</b>.start();
</td></tr><tr><td class="clsSyntaxCells clsOddRow">
To Set mediaPlayer parameters via JavaScript use the following syntax: mediaplayer.parameter = 'value'; remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>mediaPlayer</b>.filename = 'value';
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">							
To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: mediaplayer.setEMML("[Your EMML Tags]");
<P />
e.g. <b>mediaPlayer</b>.setEMML("filename:<i>value</i>start");							
</td></tr></table>

<table class="re-table"><tr><th class="tableHeading">MediaPlayer Ruby Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the Ruby Object <b>'MediaPlayer'</b> will exist on the current page and can be used to interact directly with the MediaPlayer. All Methods, Parameters and Events are the same as JavaScript, however, notice <b>'MediaPlayer'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b></td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Invoke MediaPlayer methods via Ruby use the following syntax: MediaPlayer.method()
<P />e.g. <b>MediaPlayer</b>.start</td></tr><tr><td class="clsSyntaxCells clsOddRow">
To Set MediaPlayer parameters via Ruby use the following syntax: MediaPlayer.parameter = 'value' remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>MediaPlayer</b>.filename = 'value'
</td></tr><tr><td class="clsSyntaxCells clsEvenRow" /></tr></table>


	

##Methods


Items listed in this section indicate methods or, in some cases, indicate parameters which will be retrieved.

<table class="re-table"><col width="10%" /><col width="68%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>start</b></td><td class="clsSyntaxCells clsOddRow">Starts playing the audio/video file until either the end or 'stop' is received. Please note that at any time only one file can be played.</td><td class="clsSyntaxCells clsOddRow">N/A</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>stop</b></td><td class="clsSyntaxCells clsEvenRow">Stops playing the aduio/video file.</td><td class="clsSyntaxCells clsEvenRow">N/A</td></tr></table>


##Parameters


Items listed in this section indicate parameters, or attributes which can be set.
<table class="re-table"><col width="20%" /><col width="20%" /><col width="38%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Possible Values</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>filename:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Fully qualified URL or file name.  Supports HTTP and File protocols.</td><td class="clsSyntaxCells clsOddRow">Plays the specified file. Please note that the file format has to be supported on the platform for playback.</td><td class="clsSyntaxCells clsOddRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>type:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">"audio" or "video"</td><td class="clsSyntaxCells clsEvenRow">The type of the file.</td><td class="clsSyntaxCells clsEvenRow">"video"</td></tr></table>
<table class="re-table"><col width="78%" /><col width="8%" /><col width="1%" /><col width="5%" /><col width="1%" /><col width="5%" /><col width="2%" /></table>


##Multi Instance
When multiple RhoElememts applications are running the following considerations should be made: Only the foreground RhoElements application is given access to play the media files, when an application is sent to the background any playback that is in progress will be stopped and it will automatically relinquish control of the Audio/Video hardware.  When brought back to the foreground, an application previously using the media player will have its previous configuration (eg. name etc.) reapplied to the plugin automatically.


##Remarks


###Full Screen Videos
Video playback always happens in full screen and the user can use the back button to stop the video. While the video is being palyed there will be controls for Pause, seek, forward and rewind operations.


###Licensing issues
The user is responsible for installing the required CODEC and for any legal problems or licensing issues that arise from installing the additional codecs. The media player would play the formats that are available on the device.


###File formats
The supported formats vary according to the platform. On Android devices we can play a 3GPP/MP4/MP3/WebM file.


###Format of the filename URL
Supports only HTTP and FILE formats. HTTP Example: http://192.168.1.1:8080/Folder/Media.mp4. File Example: file:///Application/Media.mp4. Remember to also wrap your URL with url('') when being used as part of a meta tag, as shown in the examples above.




##Requirements

<table class="re-table"><tr><th class="tableHeading">RhoElements Version</th><td class="clsSyntaxCell clsEvenRow">2.2 (SP1 on windows devices) or above
</td></tr><tr><th class="tableHeading">Supported Devices</th><td class="clsSyntaxCell clsOddRow">All supported devices</td></tr><tr><th class="tableHeading">Minimum Requirements</th><td class="clsSyntaxCell clsOddRow" /></tr><tr><th class="tableHeading">Persistence</th><td class="clsSyntaxCell clsEvenRow">Not Persistent - Changes to this module will not persist when navigating to a new page.</td></tr></table>


##HTML/JavaScript Examples

The following META Tag example plays a video file.

	<META HTTP-Equiv="mediaPlayer" Content="filename:url('HTTP://192.168.1.1:80/Media/RhoElements.mp4')">
	<META HTTP-Equiv="mediaPlayer" Content="start">
	
The following JavaScript will start and stop a media playback respectively when onStart and onStop are called

	<script>
	   function onStart()
	   {
		mediaPlayer.filename = url('wtgdev.co.uk/audio.mp3');
		mediaPlayer.type = 'audio';
		mediaPlayer.start();
	   }
	   
	   function onStop()
	   {
		mediaPlayer.stop();
	   }
	</script>
	


