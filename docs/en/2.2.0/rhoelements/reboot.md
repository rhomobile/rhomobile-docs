# Reboot Module
*The Reboot Module is used to reboot the terminal immediately.*

## Syntax
<table class="re-table">
	<tr>
		<th class="tableHeading">reboot (Module) &lt;META&gt; Syntax</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="Reboot" content="[parameter]"&gt;</p></td>
	</tr>
</table>

<table class="re-table">
	<tr>
		<th class="tableHeading">Reboot JavaScript Object Syntax:</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">By default the JavaScript Object <b>'reboot'</b> will exist on the current page and can be used to interact directly with the reboot.</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow">To Set reboot parameters via JavaScript use the following syntax: reboot.parameter = 'value'; remembering to enclose your value in quotes where appropriate.<P/>e.g. <b>reboot</b>.bootType = 'value';</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: reboot.setEMML("[Your EMML Tags]");<P/>e.g. <b>reboot</b>.setEMML("bootType:<i>value</i>");</td>
	</tr>
</table>

<table class="re-table">
	<tr>
		<th class="tableHeading">Reboot Ruby Object Syntax:</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">By default the Ruby Object <b>'Reboot'</b> will exist on the current page and can be used to interact directly with the Reboot. All Methods, Parameters and Events are the same as JavaScript, however, notice <b>'Reboot'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b></td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow">To Set Reboot parameters via Ruby use the following syntax: Reboot.parameter = 'value' remembering to enclose your value in quotes where appropriate.<P/>e.g. <b>Reboot</b>.bootType = 'value'</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"/>
	</tr>
</table>

## Parameters
Items listed in this section indicate parameters, or attributes which can be set.
<table class="re-table">
	<col width="20%"/>
	<col width="20%"/>
	<col width="38%"/>
	<col width="22%"/>
	<tr>
		<th class="tableHeading">Name</th>
		<th class="tableHeading">Possible Values</th>
		<th class="tableHeading">Description</th>
		<th class="tableHeading">Default Value</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>bootType:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">"Warm", "Cold" or "ColdCAD"</td>
		<td class="clsSyntaxCells clsOddRow">Reboots the device using either a Warm or Cold software boot (as specified). Note on CE6 & CE7 devices a 'ColdCAD' boot is required to replicate the Coldboot key sequence, e.g. 1+9+Power on an MC3000.</td>
		<td class="clsSyntaxCells clsOddRow">N/A</td>
	</tr>
</table>

<table class="re-table">
	<col width="78%"/>
	<col width="8%"/>
	<col width="1%"/>
	<col width="5%"/>
	<col width="1%"/>
	<col width="5%"/>
	<col width="2%"/>
</table>

## Remarks
### Suggested Use
The Reboot tag can be used to apply new settings after downloading files (eg. .REG) or applications from a server.

### Windows Mobile
**Not all Windows Mobile/CE devices support Cold or ColdCAD features. If a cold boot is attempted on such devices, a warm boot will be performed instead**. On WM 5.0 and higher, there is no software difference between a warm and a cold boot as the device uses persistent storage; both the file and registry will remain the same after boot.

## Requirements
<table class="re-table">
	<tr>
		<th class="tableHeading">RhoElements Version</th>
		<td class="clsSyntaxCell clsEvenRow">1.0.0 or above</td>
	</tr>
	<tr>
		<th class="tableHeading">Supported Devices</th>
		<td class="clsSyntaxCell clsOddRow">All supported devices. (See Above comment for behavior on Windows Mobile)</td>
	</tr>
	<tr>
		<th class="tableHeading">Minimum Requirements</th>
		<td class="clsSyntaxCell clsOddRow">None.</td>
	</tr>
	<tr>
		<th class="tableHeading">Persistence</th>
		<td class="clsSyntaxCell clsEvenRow">Immediate - These methods are actioned immediately.</td>
	</tr>
</table>

## HTML/Javascript Examples
The following example Warm boots the terminal:

	<META HTTP-Equiv="Reboot" Content="BootType:Warm">

## Ruby Examples
The following example warm boots the device after displaying a warning:

	def warmBoot
		Alert.show_popup "The device will now warm boot"
		Reboot.bootType='Warm'
	end

To call the this function from HTML, use the following code:

	<li onclick="doWarmBoot(); ">Warm boot the device</li>

Where 'doWarmBoot()' is a JavaScript function which looks like:

	function doWarmBoot() {
		$.get('/app/RebootModule/warmBoot', { });
		return false;
	}

Similarly, the following example cold boots the device:

	def coldBoot
		Alert.show_popup "The device will now cold boot"
		Reboot.bootType='Cold'
	end

If applicable, the following example performs a cold CAD boot on CE6 devices (1+9+power)

	def coldCADBoot
		Alert.show_popup "The device will now attempt a cold CAD boot"
		Reboot.bootType='ColdCAD'
	end

Both 'coldBoot' and 'coldCADBoot' can be called from HTML in a way similar to the one described for 'warmBoot' above.