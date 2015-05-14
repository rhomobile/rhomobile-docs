# APD Preexisting JavaScript Object
**The APD Preexisting JavaScript Object contains read only properties and methods for interacting with the Adaptive Printer Driver. If you have configured 'PreloadLegacyAPD' to be '1' the JavaScript object 'apd' will be inserted automatically into your page's DOM by RhoElements.**

## Syntax

<table class="re-table">
	<tr>
		<th class="tableHeading">APD (Preexisting JavaScript Object) &lt;META&gt; Syntax</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">apd.PSExternal(iCommand, 'strParameter');</td>
	</tr>
</table>

## Methods

<table class="re-table"><col width="40%"/><col width="40%"/><col width="20%"/>
	<tr>
		<th class="tableHeading">Name</th>
		<th class="tableHeading">Parameters</th>
		<th class="tableHeading">Returns</th>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">
			<b>PSExternal</b><br/>
			Used to send commands via the Zebra Adaptive Printer Driver without returning a result.
		</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">
			<b>Name:</b> iCommand<br/>
			<b>Values:</b> Four digit numeric value, See APD documentation for values.<br/>
			<b>Description:</b> A numeric value representing the required Adaptive Printer Driver function ID.<br/>
			<br/>
			<b>Name:</b> strParameter<br/>
			<b>Values:</b> String, See APD documentation for values<br/>
			<b>Description:</b> String containing function specific parameters / data to be passed to the Adaptive Printer Driver.
		</td>
		<td style="text-align:center;" valign="top" class="clsSyntaxCells clsOddRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">
			<b>PSExternalEx</b><br/>
			Used to send commands via the Zebra Adaptive Printer Driver, returning the result of the command.
		</td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">
			<b>Name:</b> iCommand<br/>
			<b>Values:</b> Four digit numeric value, See APD documentation for values<br/>
			<b>Description:</b> A numeric value representing the required Adaptive Printer Driver function ID.<br/>
			<br/>
			<b>Name:</b> strParameter<br/>
			<b>Values:</b> String, See APD documentation for values<br/>
			<b>Description:</b> String containing function specific parameters / data to be passed to the Adaptive Printer Driver.
		</td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;" valign="top">Integer representing the result of sending the command (See APD documentation)</td>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">
			<b>PSGetLastMessage</b><br/>
			Returns the last error message encountered by the Zebra Adaptive Printer Driver.
		</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"/>
		<td style="text-align:left;" valign="top" class="clsSyntaxCells clsOddRow">String representing the last error message from the APD</td>
	</tr>
</table>

## Remarks
### More Documentation
More documentation on the APD is available at http://docs.rhomobile.com

### Backwards Compatibility
The APD Preexisting JavaScript Object provides backwards compatibility with code written for PocketBrowser and also supports the syntax below. Because RhoElements inserts the object 'apd' on the page automatically when 'PreloadLegacyAPD' is configured to be '1' you can not create your own objects by this name, see below:

	:::js
	<script>
		//  Old PocketBrowser syntax supported by APD
		var myObj = new ActiveXObject("PocketBrowser.NarrowBand");

		//  Note: var apd = new ... will fail because the object already exists on the page.
		myObj.PSExternal(261, '2350C');
	</script>

###APD version
The APD version returned by the Cmd_PSGetVersion command (decimal code 260) is not assumed to be the same across the supported platforms, even though the supported capabilities are the same. For instance, at the time of writing, the current version for Windows is 'Zebra APD V2.19.06', whereas the version for Android is Zebra APD V1.00.00A, with the terminating 'A' standing for Android.

###Embedded Commands
If an embedded command with a malformed code is sent via APD, for instance 'apd.PSExternal(266, "$$[CMD:-0104]$$")', Windows APD will not generate any output to the printer, but on Android the malformed command will be treated as a common string and therefore printed out.

###Printing on the MC2100
Additional steps are required to pair your MC2100 via Bluetooth for printing. Please refer to the "Bluetooth Printing" section in the MC2100 User Guide

## Requirements

<table class="re-table">
	<tr>
		<th class="tableHeading">RhoElements Version</th>
		<td class="clsSyntaxCell clsEvenRow">1.0.0 or above</td>
	</tr>
	<tr>
		<th class="tableHeading">Supported Devices</th>
		<td class="clsSyntaxCell clsOddRow">All devices</td>
	</tr>
	<tr>
		<th class="tableHeading">Minimum Requirements</th>
		<td class="clsSyntaxCell clsEvenRow">None.</td>
	</tr>
	<tr>
		<th class="tableHeading">Persistence</th>
		<td class="clsSyntaxCell clsOddRow">Executes immediately.</td>
	</tr>
</table>

## HTML/JavaScript Examples
The Following example shows usage PSExternal:

	:::js
	<script>
		var printerID = '2350C';
		apd.PSExternal(261, printerID);
	</script>

The Following example shows usage PSExternalEx and PSGetLastMessage:

	:::js
	<script>
		if(apd.PSExternalEx(257, 'Hello World') > 0)
		{
		  alert(apd.PSGetLastMessage());
		}
	</script>


