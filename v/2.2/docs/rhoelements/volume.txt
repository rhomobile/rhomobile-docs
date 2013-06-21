
#Volume Module

<b>
The Volume Module is used to set the audio output volume of the device. This is the wave output volume, not the volume of the device beeper.
</b>

##Syntax

<table class="re-table"><tr><th class="tableHeading">volume (Module) &lt;META&gt; Syntax
</th></tr><tr><td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="Volume" content="[parameter]"&gt;</p></td></tr></table>
<table class="re-table"><tr><th class="tableHeading">Volume JavaScript Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the JavaScript Object <b>'volume'</b> will exist on the current page and can be used to interact directly with the volume.
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Set volume parameters via JavaScript use the following syntax: volume.parameter = 'value'; remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>volume</b>.setVolume = 'value';
</td></tr><tr><td class="clsSyntaxCells clsOddRow">							
To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: volume.setEMML("[Your EMML Tags]");
<P />
e.g. <b>volume</b>.setEMML("setVolume:<i>value</i>");							
</td></tr></table>

<table class="re-table"><tr><th class="tableHeading">Volume Ruby Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the Ruby Object <b>'Volume'</b> will exist on the current page and can be used to interact directly with the Volume. All Methods, Parameters and Events are the same as Javascript, however, notice <b>'Volume'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b></td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Set Volume parameters via Ruby use the following syntax: Volume.parameter = 'value' remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>Volume</b>.setVolume = 'value'
</td></tr><tr><td class="clsSyntaxCells clsOddRow" /></tr></table>




##Parameters


Items listed in this section indicate parameters, or attributes which can be set.
<table class="re-table"><col width="20%" /><col width="20%" /><col width="38%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Possible Values</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>setVolume:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Volume in the format 0xnnnn</td><td class="clsSyntaxCells clsOddRow">Specifies a new volume setting. The low-order word contains the left-channel volume setting, and the high-order word contains the right-channel setting. A value of 0xFFFF represents full volume, and a value of 0x0000 is silence.  If a device does not support both left and right volume control, the low-order word specifies the volume level and the high-order word is ignored</td><td class="clsSyntaxCells clsOddRow">Device Dependant</td></tr></table>
<table class="re-table"><col width="78%" /><col width="8%" /><col width="1%" /><col width="5%" /><col width="1%" /><col width="5%" /><col width="2%" /></table>


##Multi Instance
When multiple RhoElememts applications are running the following considerations should be made: The volume settings are application specific.  Switching to another application which uses the volume module will cause the device volume to change to that specified by the application with focus. Only the application with Focus will have the ability to change the volume settings.



##Requirements

<table class="re-table"><tr><th class="tableHeading">RhoElements Version</th><td class="clsSyntaxCell clsEvenRow">1.0.0 or above
</td></tr><tr><th class="tableHeading">Supported Devices</th><td class="clsSyntaxCell clsOddRow">All supported devices.</td></tr><tr><th class="tableHeading">Minimum Requirements</th><td class="clsSyntaxCell clsOddRow">The device must have a speaker.</td></tr><tr><th class="tableHeading">Persistence</th><td class="clsSyntaxCell clsEvenRow">Persistent - Changes to this module will persist when navigating to a new page.</td></tr></table>


##HTML/Javascript Examples

The following example sets the device volume to its maximum for all devices

	<meta http-equiv="Volume" content="SetVolume:0xFFFF">
	
The following example sets the device volume to its maximum for devices with a single wave output channel.

	<meta http-equiv="Volume" content="SetVolume:0x00FF">
	


##Ruby Examples

The following function sets the volume of the system and displays a popup message for the same: 

	def setVolume
		volume = @params['volume']
		if volume == 0
			Volume.setVolume=0x0000
			Alert.show_popup "Volume set to mute. You should not have hear a beep"
		else
			Volume.setVolume='0xFFFF'
			Alert.show_popup "Volume set to max. You should hear a loud beep"
		end    
	end

It can be called from HTML using the any of the following: 

	<li onclick="setMaxVolume(); ">Set maximum volume</li>
    <li onclick="mute(); ">Mute device</li>
	
Where 'setMaxVolume()' and 'mute()' are JavaScript functions defined below: 

	function setMaxVolume() {
		$.get('/app/VolumeControl/setVolume', {volume: 1});
		return false;
	}

	function mute() {
		$.get('/app/VolumeControl/setVolume', {volume: 0});
		return false;
	}
	
The following example sets the device volume to its maximum for devices with a single wave output channel. It can be called from HTML in a manner similar to the one described above.

	def setSingleChannel
		Volume.setVolume="0x00FF"
		Alert.show_popup "Volume set to mute. You should not have hear a single channel beep"
	end