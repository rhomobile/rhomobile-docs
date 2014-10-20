# Backlight Module
**The Backlight Module is used to illuminate / extinguish the display backlight as well as setting the intensity of the backlight.**

## Syntax

<table class="re-table">
	<tr>
		<th class="tableHeading">backlight (Module) &lt;META&gt; Syntax</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="backlight" content="[parameter]"&gt;</p></td>
	</tr>
</table>

<table class="re-table">
	<tr>
		<th class="tableHeading">Backlight JavaScript Object Syntax:</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			By default the JavaScript Object <b>'backlight'</b> will exist on the current page and can be used to interact directly with the backlight.
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow">
			To Invoke backlight methods via JavaScript use the following syntax: backlight.method();
			<br/><br/>
			e.g. <b>backlight</b>.on();
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			To Set backlight parameters via JavaScript use the following syntax: backlight.parameter = 'value'; remembering to enclose your value in quotes where appropriate.
			<br/><br/>
			e.g. <b>backlight</b>.intensity = 'value';
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow">
			To Set backlight return events via JavaScript use the following syntax: backlight.event = JavaScript Function;
			<br/><br/>
			e.g. <b>backlight</b>.backlightSettingsEvent = 'doFunction(%json)';
			<br/><br/>
			For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents">Retrieval Events</a> page.
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: backlight.setEMML("[Your EMML Tags]");
			<br/><br/>
			e.g. <b>backlight</b>.setEMML("intensity:<i>value</i>;backlightSettingsEvent:url('JavaScript:doFunction(%json)');on");
		</td>
	</tr>
</table>

<table class="re-table">
	<tr>
		<th class="tableHeading">Backlight Ruby Object Syntax:</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			By default the Ruby Object <b>'Backlight'</b> will exist on the current page and can be used to interact directly with the Backlight. All Methods, Parameters and Events are the same as JavaScript, however, notice <b>'Backlight'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b>
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow">
			To Invoke Backlight methods via Ruby use the following syntax: Backlight.method()
			<br/><br/>
			e.g. <b>Backlight</b>.on
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			To Set Backlight parameters via Ruby use the following syntax: Backlight.parameter = 'value' remembering to enclose your value in quotes where appropriate.
			<br/><br/>
			e.g. <b>Backlight</b>.intensity = 'value'
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow">
			To Set Backlight return events via Ruby use the following syntax: Backlight.event = url_for(:action =&gt; :event_callback)
			<br/><br/>
			e.g. <b>Backlight</b>.backlightSettingsEvent = url_for(:action =&gt; :backlight_event_callback)
			<br/><br/>
			For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents#params-object">Retrieval Events</a> page.<br/>
			To access the event parameters in a Ruby callback function, you reference the @params object within the callback function. This object is simply a ruby hash {"parameter1 name" =&gt; "parameter1 value", "parameter2 name" =&gt; "parameter2 value", ...}
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
		<td class="clsSyntaxCells clsOddRow"><b>on</b></td>
		<td class="clsSyntaxCells clsOddRow">Turn on the screen backlight. N/A for Android devices, please use the wake module to keep the screen ON.</td>
		<td class="clsSyntaxCells clsOddRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>off</b></td>
		<td class="clsSyntaxCells clsEvenRow">Turn off the screen backlight</td>
		<td class="clsSyntaxCells clsEvenRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>getBacklightSettings</b></td>
		<td class="clsSyntaxCells clsOddRow">Returns the backlight settings via a 'backlightSettingsEvent'</td>
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
		<td class="clsSyntaxCells clsOddRow"><b>intensity:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">Positive Number, see remarks for range</td>
		<td class="clsSyntaxCells clsOddRow">Sets the screen backlight to the specified intensity.</td>
		<td class="clsSyntaxCells clsOddRow">Device Dependant</td>
	</tr>
</table>

## Events
Values are returned to the caller in RhoElements via Events.  Most modules contain events and those returned from this module are given below along with the event parameters.  Events can cause a navigation to a new URL or a JavaScript function on the page to be invoked.  Each event will in most cases have a number of parameters associated with it which will either be strings or JavaScript arrays.  Event parameters can be accessed either directly or via JSON objects.

### backlightSettingsEvent
The backlight display settings.

<table class="re-table"><col width="3%"/><col width="20%"/><col width="77%"/>
	<tr>
		<th class="tableHeading">ID</th>
		<th class="tableHeading">Name</th>
		<th class="tableHeading">Description</th>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">1</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>intensity</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">
			The current backlight intensity value E.g. 2. On Android a negative value indicates the default system value.
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">2</td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>intensityRange</b></td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">
			A JavaScript array of integers containing the valid range of intensity values.  e.g. ['0','1','2'].
		</td>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">3</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>state</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">The current backlight state "on" or "off" or "timeout"</td>
	</tr>
</table>

## Multi Instance
When multiple RhoElememts applications are running the following considerations should be made: The backlight settings are application specific.  Switching to another application which uses the backlight module will cause the screen illumination settings to change to those of the application with focus. Only the application with Focus will have the ability to change the backlight settings. 

## Remarks
### General
The intensity tag will only have an observable effect if the screen backlight is turned on, setting the intensity by its self is insufficient to illuminate the backlight.

### Device Limits
The levels of supported screen backlight intensity are device dependent. You can determine the levels on your device using the backlightSettingsEvent and getBacklightSettings method.

### 'Auto' and 'Manual' Backlight Intensity
Windows Mobile 6.5 Devices with a light sensor, such as the ES400 will support two modes for the Backlight: Auto Mode (default) where the light sensor input affects the backlight intensity and Manual Mode where the user sets the backlight manually. In order to use the Intensity setting in RhoElements the device must be put into Manual Mode, most easily achieved via the 'Backlight &amp; Keylight' applet accessed via Start-&gt;Settings-&gt;System.

### Enterprise Tablet
Unlike all other devices, changes made to the backlight intensity are made only to RhoElements. Switching native applications or quitting RhoElements will revert the backlight intensity to the system's default level until RhoElements is resumed. Also the method "on" does not work as the backlight settings are application specific, please use the Wake module to keep the screen on.

## Requirements

<table class="re-table">
	<tr>
		<th class="tableHeading">RhoElements Version</th>
		<td class="clsSyntaxCell clsEvenRow">1.0.0 or above</td>
	</tr>
	<tr>
		<th class="tableHeading">Supported Devices</th>
		<td class="clsSyntaxCell clsOddRow">All supported devices.</td>
	</tr>
	<tr>
		<th class="tableHeading">Minimum Requirements</th>
		<td class="clsSyntaxCell clsOddRow">None</td>
	</tr>
	<tr>
		<th class="tableHeading">Persistence</th>
		<td class="clsSyntaxCell clsEvenRow">Persistent - Changes to this module will persist when navigating to a new page.</td>
	</tr>
</table>

## HTML/JavaScript Examples
The following turns on the screen backlight and sets the intensity to level 2

	:::html
	<META HTTP-Equiv="Backlight-On" Content="Intensity:2">

The following example retrieves the backlight settings

	:::html
	<META HTTP-EQUIV="backlight" content="backlightSettingsEvent:url('javascript:fnBacklightJSON(%json);')">

	<SCRIPT>
		function fnBacklightJSON(jsonObject){
			var theOutput = "<B>Backlight State:</B>" + jsonObject.state + "<P>";
			theOutput = theOutput + "<B>Backlight Intensity:</b> " + jsonObject.intensity + "<P>";
			theOutput = theOutput + "<b>Backlight Intensity Range:</b><P>";
			
			for (var i=0; i<jsonObject.intensityRange.length; i = i + 1){
			        theOutput = theOutput + jsonObject.intensityRange[i] + "<BR>";
			}
			theOutput = theOutput + "<P>";
			outputDiv.innerHTML = theOutput;
		}
	</SCRIPT>

	<div id="outputDiv">Backlight settings go here</div>
	<br/>
	<INPUT align="center" type="button" value="Retrieve Backlight Settings" onclick="backlight.getBacklightSettings()";>