# BottomCommandArea Module
**The BottomCommandArea Module is used to set the parameters of the Bottom Command Area. The bottom command area is a region at the bottom of the screen designed to hold RhoElements controls such as the SIP button or Zoom button to separate them from the rest of the user application.**

## Syntax

<table class="re-table">
	<tr>
		<th class="tableHeading">bottomCommandArea (Module) &lt;META&gt; Syntax</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="BottomCommandArea" content="[parameter]"&gt;</p>
		</td>
	</tr>
</table>

<table class="re-table">
	<tr>
		<th class="tableHeading">BottomCommandArea JavaScript Object Syntax:</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			By default the JavaScript Object <b>'bottomCommandArea'</b> will exist on the current page and can be used to interact directly with the bottomCommandArea.
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow">
			To Set bottomCommandArea parameters via JavaScript use the following syntax: bottomcommandarea.parameter = 'value'; remembering to enclose your value in quotes where appropriate.
			<br/><br/>
			e.g. <b>bottomCommandArea</b>.visibility = 'value';
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: bottomcommandarea.setEMML("[Your EMML Tags]");
			<br/><br/>
			e.g. <b>bottomCommandArea</b>.setEMML("visibility:<i>value</i>");
		</td>
	</tr>
</table>

<table class="re-table">
	<tr>
		<th class="tableHeading">BottomCommandArea Ruby Object Syntax:</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			By default the Ruby Object <b>'BottomCommandArea'</b> will exist on the current page and can be used to interact directly with the BottomCommandArea. All Methods, Parameters and Events are the same as JavaScript, however, notice <b>'BottomCommandArea'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b>
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow">
			To Set BottomCommandArea parameters via Ruby use the following syntax: BottomCommandArea.parameter = 'value' remembering to enclose your value in quotes where appropriate.
			<br/><br/>
			e.g. <b>BottomCommandArea</b>.visibility = 'value'
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
		<td class="clsSyntaxCells clsOddRow"><b>visibility:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">visible, hidden</td>
		<td class="clsSyntaxCells clsOddRow">Sets the Visibility of the Bottom Command area.</td>
		<td class="clsSyntaxCells clsOddRow">Hidden.</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>height:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">Positive number, representing pixels</td>
		<td class="clsSyntaxCells clsEvenRow">Sets the height of the bottom command area</td>
		<td class="clsSyntaxCells clsEvenRow">Slightly greater than the height of a buttons default height, which depends on the screen resolution.</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>color:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">Color in the #RRGGBB format</td>
		<td class="clsSyntaxCells clsOddRow">The color to set the bottom command area to.</td>
		<td class="clsSyntaxCells clsOddRow">None. The default image is displayed by default.</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>image:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">URL</td>
		<td class="clsSyntaxCells clsEvenRow">Sets the image to be displayed on the bottom command area. See Remarks for more details.</td>
		<td class="clsSyntaxCells clsEvenRow">Default image</td>
	</tr>
</table>

## Remarks
### Use of Images.
Images can be specified as local to the device or on an HTTP / FTP server, just specify the required protocol as part of your URL (file://\, HTTP:// and FTP://). Image will be scaled to the size of the command area. JPEG and GIF images are only supported on WM devices. Both CE and WM support BMP files.

### Switching to Other Applications
All controls are designed to be shown on top of RhoElements. If you require to switch to an application other than RhoElements you should minimize RhoElements to ensure the buttons do not remain shown. (Not applicable to Enterprise Tablet)

### Screen Orientation
When the screen orientation changes, either using the ScreenOrientation tag or by rotating a device with hardware support, the command areas will automatically move and resize to fit the new layout. However the buttons themselves are not moved and in some cases this may result in them being off the screen or not in the expected position. If so they must be moved manually by detecting the ScreenOrientationEvent.

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
		<td class="clsSyntaxCell clsOddRow">None.</td>
	</tr>
	<tr>
		<th class="tableHeading">Persistence</th>
		<td class="clsSyntaxCell clsEvenRow">Persistent - Changes to this module will persist when navigating to a new page.</td>
	</tr>
</table>

## HTML/JavaScript Examples
The following example shows the BottomCommandArea, sets the height to 100 pixels and background color to red.

	:::html
	<META HTTP-Equiv="BottomCommandArea" Content="Visibility:Visible">
	<META HTTP-Equiv="BottomCommandArea" Content="Height:100">
	<META HTTP-Equiv="BottomCommandArea" Content="Color:#FF0000">
	
The following example shows the BottomCommandArea, sets the height to 100 pixels and displays image bca.gif on it (resizing the image if necessary).

	:::html
	<META HTTP-Equiv="BottomCommandArea" Content="Visibility:Visible; Height:100; Image:url('http://myaddress/bca.gif')">