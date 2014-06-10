
#ScreenOrientation Module

<b>
The ScreenOrientation Module is used to control the screen orientation/layout and register to receive an event when it changes.
</b>

##Syntax

<table class="re-table"><tr><th class="tableHeading">screenOrientation (Module) &lt;META&gt; Syntax
</th></tr><tr><td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="ScreenOrientation" content="[orientation]"&gt;</p></td></tr><tr><td class="clsSyntaxCells clsEvenRow"><p>&lt;META HTTP-Equiv="ScreenOrientation" content="ScreenOrientationEvent:url('[jsFunction | url]')"&gt;</p></td></tr></table>
<table class="re-table"><tr><th class="tableHeading">ScreenOrientation JavaScript Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the JavaScript Object <b>'screenOrientation'</b> will exist on the current page and can be used to interact directly with the screenOrientation.
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Invoke screenOrientation methods via JavaScript use the following syntax: screenorientation.method();
<P />e.g. <b>screenOrientation</b>.normal();
</td></tr><tr><td class="clsSyntaxCells clsOddRow">
To Set screenOrientation parameters via JavaScript use the following syntax: screenorientation.parameter = 'value'; remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>screenOrientation</b>.autoRotate = 'value';
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">						
To Set screenOrientation return events via JavaScript use the following syntax: screenorientation.event = JavaScript Function;
<P />e.g. <b>screenOrientation</b>.screenOrientationEvent = 'doFunction(%json)';
<P />
For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents">Retrieval Events</a> page.

</td></tr><tr><td class="clsSyntaxCells clsOddRow">							
To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: screenorientation.setEMML("[Your EMML Tags]");
<P />
e.g. <b>screenOrientation</b>.setEMML("autoRotate:<i>value</i>;screenOrientationEvent:url('JavaScript:doFunction(%json)');normal");							
</td></tr></table>

<table class="re-table"><tr><th class="tableHeading">ScreenOrientation Ruby Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the Ruby Object <b>'ScreenOrientation'</b> will exist on the current page and can be used to interact directly with the ScreenOrientation. All Methods, Parameters and Events are the same as JavaScript, however, notice <b>'ScreenOrientation'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b></td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Invoke ScreenOrientation methods via Ruby use the following syntax: ScreenOrientation.method()
<P />e.g. <b>ScreenOrientation</b>.normal</td></tr><tr><td class="clsSyntaxCells clsOddRow">
To Set ScreenOrientation parameters via Ruby use the following syntax: ScreenOrientation.parameter = 'value' remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>ScreenOrientation</b>.autoRotate = 'value'
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">						
To Set ScreenOrientation return events via Ruby use the following syntax: ScreenOrientation.event = url_for(:action =&gt; :event_callback) 
<P />e.g. <b>ScreenOrientation</b>.screenOrientationEvent = url_for(:action =&gt; :screenorientation_event_callback)
<P />
For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents#params-object">Retrieval Events</a> page.
<p>To access the event parameters in a Ruby callback function, you reference the @params object within the callback function. This object is simply a ruby hash {"parameter1 name" =&gt; "parameter1 value", "parameter2 name" =&gt; "parameter2 value", ...}</p></td></tr><tr><td class="clsSyntaxCells clsOddRow" /></tr></table>


	

##Methods


Items listed in this section indicate methods or, in some cases, indicate parameters which will be retrieved.

<table class="re-table"><col width="10%" /><col width="68%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>normal</b></td><td class="clsSyntaxCells clsOddRow">Sets the screen orientation to portrait</td><td class="clsSyntaxCells clsOddRow">Device Dependant</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>rightHanded</b></td><td class="clsSyntaxCells clsEvenRow">Sets the screen orientation to righthanded (landscape).  Note the webpage will not reformat in line with the new screen size automatically.</td><td class="clsSyntaxCells clsEvenRow">Device Dependant</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>leftHanded</b></td><td class="clsSyntaxCells clsOddRow">Sets the screen orientation to lefthanded (landscape).  Note the webpage will not reformat in line with the new screen size automatically.</td><td class="clsSyntaxCells clsOddRow">Device Dependant</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>upsideDown</b></td><td class="clsSyntaxCells clsEvenRow">Sets the screen orientation to upside down, useful if presenting the device to a customer to obtain a signature.</td><td class="clsSyntaxCells clsEvenRow">Device Dependant</td></tr></table>


##Parameters


Items listed in this section indicate parameters, or attributes which can be set.
<table class="re-table"><col width="20%" /><col width="20%" /><col width="38%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Possible Values</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>autoRotate:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">'Enabled' or 'Disabled'</td><td class="clsSyntaxCells clsOddRow">Enables or Disables autorotation of the screen orientation when the device is rotated</td><td class="clsSyntaxCells clsOddRow">Defined in Configuration File</td></tr></table>
<table class="re-table"><col width="78%" /><col width="8%" /><col width="1%" /><col width="5%" /><col width="1%" /><col width="5%" /><col width="2%" /></table>	

##Events


Values are returned to the caller in RhoElements via Events.  Most modules contain events and those returned from this module are given below along with the event parameters.  Events can cause a navigation to a new URL or a JavaScript function on the page to be invoked.  Each event will in most cases have a number of parameters associated with it which will either be strings or JavaScript arrays.  Event parameters can be accessed either directly or via JSON objects.

<br />
###screenOrientationEvent
The screen orientation event is sent when the current RhoElements application changes the orientation of the screen. For devices with an inbuilt accelerometer this event will also be sent when the user physically rotates the device to a new orientation.
<table class="re-table"><col width="3%" /><col width="20%" /><col width="77%" /><tr><th class="tableHeading">ID</th><th class="tableHeading">Name</th><th class="tableHeading">Description</th></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">1</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>orientation</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">Either 'normal', 'rightHanded', 'leftHanded' or 'upsideDown'</td></tr></table>



##Multi Instance
When multiple RhoElememts applications are running the following considerations should be made: The screen orientation settings are application specific.  Switching to another application which uses the ScreenOrientation module will cause the screen to be rotated automatically if necessary


##Remarks


###Effect on Command Areas and Control Buttons
When the screen orientation changes, either using the ScreenOrientation tag or by rotating a device with hardware support, the command areas will automatically move and resize to fit the new layout. However the buttons themselves are not moved and in some cases this may result in them being off the screen or not in the expected position. If so they must be moved manually by detecting the ScreenOrientationEvent.


###Orientation Persistence
In all devices apart from the Enterprise Tablet, orientation changes will persist if RhoElements is closed or the device is warm booted.


###Landscape Windows Devices
By default the Screen Orientation module will assume the "Normal" orientation of your device is portrait mode. Devices which default to landscape mode (e.g. VC model devices) may need to be set to "leftHanded" in order to achieve an 'out of the box' orientation.




##Requirements

<table class="re-table"><tr><th class="tableHeading">RhoElements Version</th><td class="clsSyntaxCell clsEvenRow">1.0.0 or above
</td></tr><tr><th class="tableHeading">Supported Devices</th><td class="clsSyntaxCell clsOddRow">All supported devices. autoRotate is only supported in devices that have IST.</td></tr><tr><th class="tableHeading">Minimum Requirements</th><td class="clsSyntaxCell clsOddRow">A device with a screen.</td></tr><tr><th class="tableHeading">Persistence</th><td class="clsSyntaxCell clsEvenRow">Partially Persistent - Changes to this module will persist when navigating to a new page with the exception of ScreenOrientationEvent</td></tr></table>


##HTML/JavaScript Examples

The following example orientates the screen to righthanded in landscape mode:

	<META HTTP-Equiv="ScreenOrientation" Content="RightHanded">
	


