
#Keylight Module

<b>
The Keylight Module is used to illuminate / extinguish the keyboard backlight as well as setting the intensity of the keylight.
</b>

##Syntax

<table class="re-table"><tr><th class="tableHeading">keylight (Module) &lt;META&gt; Syntax
</th></tr><tr><td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="Keylight" content="[method / parameter]"&gt;</p></td></tr></table>
<table class="re-table"><tr><th class="tableHeading">Keylight JavaScript Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the JavaScript Object <b>'keylight'</b> will exist on the current page and can be used to interact directly with the keylight.
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Invoke keylight methods via JavaScript use the following syntax: keylight.method();
<P />e.g. <b>keylight</b>.on();
</td></tr><tr><td class="clsSyntaxCells clsOddRow">
To Set keylight parameters via JavaScript use the following syntax: keylight.parameter = 'value'; remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>keylight</b>.intensity = 'value';
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">							
To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: keylight.setEMML("[Your EMML Tags]");
<P />
e.g. <b>keylight</b>.setEMML("intensity:<i>value</i>on");							
</td></tr></table>

<table class="re-table"><tr><th class="tableHeading">Keylight Ruby Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the Ruby Object <b>'Keylight'</b> will exist on the current page and can be used to interact directly with the Keylight. All Methods, Parameters and Events are the same as JavaScript, however, notice <b>'Keylight'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b></td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Invoke Keylight methods via Ruby use the following syntax: Keylight.method()
<P />e.g. <b>Keylight</b>.on</td></tr><tr><td class="clsSyntaxCells clsOddRow">
To Set Keylight parameters via Ruby use the following syntax: Keylight.parameter = 'value' remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>Keylight</b>.intensity = 'value'
</td></tr><tr><td class="clsSyntaxCells clsEvenRow" /></tr></table>


	

##Methods


Items listed in this section indicate methods or, in some cases, indicate parameters which will be retrieved.

<table class="re-table"><col width="10%" /><col width="68%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>on</b></td><td class="clsSyntaxCells clsOddRow">Turns the keyboard backlight on.</td><td class="clsSyntaxCells clsOddRow">Device Dependant</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>off</b></td><td class="clsSyntaxCells clsEvenRow">Turns the keyboard backlight off.</td><td class="clsSyntaxCells clsEvenRow">Device Dependant</td></tr></table>


##Parameters


Items listed in this section indicate parameters, or attributes which can be set.
<table class="re-table"><col width="20%" /><col width="20%" /><col width="38%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Possible Values</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>intensity:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Positive Number, see remarks for range</td><td class="clsSyntaxCells clsOddRow">Sets the keyboard backlight to the specified intensity.</td><td class="clsSyntaxCells clsOddRow">Device Dependant</td></tr></table>
<table class="re-table"><col width="78%" /><col width="8%" /><col width="1%" /><col width="5%" /><col width="1%" /><col width="5%" /><col width="2%" /></table>


##Multi Instance
When multiple RhoElememts applications are running the following considerations should be made: The keylight settings are application specific.  Switching to another application which uses the keylight module will cause the keyboard illumination settings to change to those of the application with focus. Only the application with Focus will have the ability to change the keylight settings.


##Remarks


###General
The intensity tag will only have an observable effect if the keyboard backlight is turned on, setting the intensity by its self is insufficient to illuminate the backlight.


###Device Limits
The levels of supported keylight intensity is device dependant. When the Keylight module is first loaded it writes the supported levels to the log file as INFORMATION so you can determine the maximum setting from the log file.




##Requirements

<table class="re-table"><tr><th class="tableHeading">RhoElements Version</th><td class="clsSyntaxCell clsEvenRow">1.0.0 or above
</td></tr><tr><th class="tableHeading">Supported Devices</th><td class="clsSyntaxCell clsOddRow">All supported devices except Enterprise Tablet.</td></tr><tr><th class="tableHeading">Minimum Requirements</th><td class="clsSyntaxCell clsOddRow">This tag requires appropriate hardware and drivers to run, i.e. a device with a keyboard backlight.</td></tr><tr><th class="tableHeading">Persistence</th><td class="clsSyntaxCell clsEvenRow">Persistent - Changes to this module will persist when navigating to a new page.</td></tr></table>


##HTML/JavaScript Examples

The following example turns the keyboard backlight on with an intensity of 3:

	<META HTTP-Equiv="Keylight-On" Content="Intensity:3">
	


