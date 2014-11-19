# AddressBar Module
<div class="btn-group"><a href="#Methods" class="btn"><i class="icon-cog"></i> Methods<sup>&nbsp;6</sub></a><a class="btn dropdown-toggle" data-toggle="dropdown" data-target="#" href="#Methods" >  <span class="caret"></span>&nbsp;</a><ul class="dropdown-menu" style="max-height: 500px;overflow: auto;"><li class="disabled"><a tabindex="-1" href="#"><b><i>Methods - Class</i></b></a><li><a href="#mbatteryDiagnostics" data-target="cMethodbatteryDiagnostics" class="autouncollapse">batteryDiagnostics</a></li><li><a href="#mbatteryStatus" data-target="cMethodbatteryStatus" class="autouncollapse">batteryStatus</a></li><li><a href="#mhideIcon" data-target="cMethodhideIcon" class="autouncollapse">hideIcon</a></li><li><a href="#mshowIcon" data-target="cMethodshowIcon" class="autouncollapse">showIcon</a></li><li><a href="#msmartBatteryStatus" data-target="cMethodsmartBatteryStatus" class="autouncollapse">smartBatteryStatus</a></li><li><a href="#mstopBatteryStatus" data-target="cMethodstopBatteryStatus" class="autouncollapse">stopBatteryStatus</a></li></li></ul></div><div class="btn-group"><a href="#Properties" class="btn"><i class="icon-list"></i> Properties<sup>&nbsp;3</sup></a><button href="#" class="btn dropdown-toggle" data-toggle="dropdown">  <span class="caret"></span>&nbsp;</button><ul class="dropdown-menu" style="max-height: 500px;overflow: auto;"><li class="disabled"><a tabindex="-1" href="#"><b><i>Class Properties</i></b></a><li><a href="#paverageCurrentConsumption" data-target="cPropertyaverageCurrentConsumption" class="autouncollapse">averageCurrentConsumption</a></li><li><a href="#prefreshInterval" data-target="cPropertyrefreshInterval" class="autouncollapse">refreshInterval</a></li><li><a href="#ptripDuration" data-target="cPropertytripDuration" class="autouncollapse">tripDuration</a></li></li></ul></div><div class="btn-group"><a href="#Examples" class="btn"><i class="icon-edit"></i> Examples<sup>&nbsp;2</sup></a><button href="#" class="btn dropdown-toggle" data-toggle="dropdown">  <span class="caret"></span>&nbsp;</button><ul class="dropdown-menu" style="max-height: 500px;overflow: auto;"><li><a href="#e0" data-target="eExample0" class="autouncollapse">Retrieve the Battery status</a></li><li><a href="#e1" data-target="eExample1" class="autouncollapse">Working with the Battery indicator</a></li></ul></div><div class="btn-group"><a href="#Remarks" class="btn"><i class="icon-warning-sign"></i> Remarks<sup>&nbsp;3</sup></a><button href="#" class="btn dropdown-toggle" data-toggle="dropdown">  <span class="caret"></span>&nbsp;</button><ul class="dropdown-menu" style="max-height: 500px;overflow: auto;"><li><a href="#r0" data-target="rRemark0" class="autouncollapse">Icon Layout</a></li><li><a href="#r1" data-target="rRemark1" class="autouncollapse">Overlapping Indicators</a></li><li><a href="#r2" data-target="rRemark2" class="autouncollapse">Screen Orientation</a></li></ul></div><div class="btn-group"><a href="#License" class="btn"><i class="icon-shopping-cart"></i> Licensing</a></div><div class="btn-group pull-right"><button class="btn dropdown-toggle" id="apiFilterBtn" data-toggle="dropdown" href="#" title="Filter Properties and Methods"><i class="icon-filter "></i>Show</button><select id="apiFilter" class="dropdown-menu apiFilter"><option value="all">All</option><option value="js">JavaScript</option><option value="ruby">Ruby</option><option value="android">Android</option><option value="ios">iOS</option><option value="wm">Windows Mobile</option><option value="wp8">Windows Phone 8</option><option value="w32">Windows Desktop</option><option value="msi">MSI Only</option></select></div><div  id="apibody" style="overflow:auto;padding-right: 5px;">

<p>The AddressBar Module is used to set the parameters of the address bar. The address bar should only be used for debugging Hybrid applications and is not designed to be used as a replacement for a web browser address bar. Press the 'Go' button or enter key to navigate to the typed URI.</p>

<h2>Syntax</h2>

<table class="re-table">
	<tr>
		<th class="tableHeading">addressBar (Module) &lt;META&gt; Syntax</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="AddressBar" content="[parameter]"&gt;</p></td>
	</tr>
</table>

<table class="re-table">
	<tr>
		<th class="tableHeading">AddressBar JavaScript Object Syntax:</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			By default the JavaScript Object <b>'addressBar'</b> will exist on the current page and can be used to interact directly with the addressBar.
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow">
			To Set addressBar parameters via JavaScript use the following syntax: addressbar.parameter = 'value'; remembering to enclose your value in quotes where appropriate.
			<br/><br/>
			e.g. <b>addressBar</b>.left = 'value';
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: addressbar.setEMML("[Your EMML Tags]");
			<br/><br/>
			e.g. <b>addressBar</b>.setEMML("left:<i>value</i>");
		</td>
	</tr>
</table>

<table class="re-table">
	<tr>
		<th class="tableHeading">AddressBar Ruby Object Syntax:</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			By default the Ruby Object <b>'AddressBar'</b> will exist on the current page and can be used to interact directly with the AddressBar. All Methods, Parameters and Events are the same as JavaScript, however, notice <b>'AddressBar'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b>
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow">
			To Set AddressBar parameters via Ruby use the following syntax: AddressBar.parameter = 'value' remembering to enclose your value in quotes where appropriate.
			<br/><br/>
			e.g. <b>AddressBar</b>.left = 'value'
		</td>
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
		<td class="clsSyntaxCells clsOddRow"><b>left:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">Positive number, representing pixels</td>
		<td class="clsSyntaxCells clsOddRow">Sets the X position of the address bar.</td>
		<td class="clsSyntaxCells clsOddRow">0</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>top:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">Positive number, representing pixels</td>
		<td class="clsSyntaxCells clsEvenRow">Sets the Y position of the address bar.</td>
		<td class="clsSyntaxCells clsEvenRow">0</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>width:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">Positive number, representing pixels</td>
		<td class="clsSyntaxCells clsOddRow">Sets the width of the address bar.</td>
		<td class="clsSyntaxCells clsOddRow">Most of the screen width</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>visibility:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">visible, hidden</td>
		<td class="clsSyntaxCells clsEvenRow">Sets the visibility of the address bar</td>
		<td class="clsSyntaxCells clsEvenRow">Hidden</td>
	</tr>
</table>

## Remarks
### Default Positions
By default this control will be placed a the top of the screen. On Windows Mobile if the 'FullScreen' configuration setting is disabled the control will need to be moved, otherwise it will appear beneath the task bar.

### Switching to Other Applications
All controls are designed to be shown on top of RhoElements. If you require to switch to an application other than RhoElements you should minimize RhoElements to ensure the buttons do not remain shown. (Not applicable to Android)

### Screen Orientation
When the screen orientation changes, either using the ScreenOrientation tag or by rotating a device with hardware support, the command areas will automatically move and resize to fit the new layout. However the buttons themselves are not moved and in some cases this may result in them being off the screen or not in the expected position. If so they must be moved manually by detecting the ScreenOrientationEvent.

### Named Anchors
The address bar is not compatible with named anchors (page bookmarks) eg. &lt;a name="bookmark"/&gt;

### Use in Production
This API is designed for debugging your application only and should not be used in production

## Requirements

<table class="re-table">
	<tr>
		<th class="tableHeading">RhoElements Version</th>
		<td class="clsSyntaxCell clsEvenRow">1.0.0 or above</td>
	</tr>
	<tr>
		<th class="tableHeading">Supported Devices</th>
		<td class="clsSyntaxCell clsOddRow">All supported touch devices.</td>
	</tr>
	<tr>
		<th class="tableHeading">Minimum Requirements</th>
		<td class="clsSyntaxCell clsOddRow">None.</td>
	</tr>
	<tr>
		<th class="tableHeading">Persistence</th>
		<td class="clsSyntaxCell clsEvenRow">Persistent - Changes to this module will persist when navigating to a new page.</td>
	</tr>
</table>

## HTML/JavaScript Examples
The following example shows the address bar, sets the left and top coordinates to 50, and the width to 100.

	:::html
	<META HTTP-Equiv="AddressBar" Content="visibility:visible">
	<META HTTP-Equiv="AddressBar" Content="left:50">
	<META HTTP-Equiv="AddressBar" Content="top:50">
	<META HTTP-Equiv="AddressBar" Content="width:100">

The following example shows the address bar, sets the left and top coordinates to 0, and the width to 50.

	:::html
	<META HTTP-Equiv="AddressBar" Content="left:0; top:0; width:50">