# AirBeam Preexisting JavaScript Object
**The AirBeam Preexisting JavaScript Object contains properties and methods which can be used to control the AirBeam Smart client. AirBeam is a separate application provided by Zebra Technologies and provides the ability to download software packages to your mobile device. If you have configured 'PreloadLegacyAirBeam' to be '1' the JavaScript object 'airbeam' will be inserted automatically into your page's DOM by RhoElements.**

## Syntax

<table class="re-table"><tr><th class="tableHeading">AirBeam (Preexisting JavaScript Object) &lt;META&gt; Syntax
</th></tr><tr><td class="clsSyntaxCells clsOddRow"><p>airbeam.AddPackage('myPackage');</p></td></tr></table>

## Methods

<table class="re-table"><col width="40%" /><col width="40%" /><col width="20%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Parameters</th><th class="tableHeading">Returns</th></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>AddPackage<br /></b>Instructs the AirBeam Smart client to add the named package to the package list (can be added up to four times)</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>Name: </b>PackageName, 
<b>Values: </b>String<br /><b>Description: </b>The name of the AirBEAM package to add.<P /></td><td style="text-align:left;" valign="top" class="clsSyntaxCells clsOddRow">True if the package was successfully added or false if it was not</td></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>DeletePackage<br /></b>Instructs the AirBeam Smart client to delete the specified package</td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>Name: </b>PackageName, 
<b>Values: </b>String<br /><b>Description: </b>The name of the AirBEAM package to be deleted.<P /></td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;" valign="top">N/A</td></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>UploadPackage<br /></b>Instructs the AirBeam Smart client to process the specified package for upload</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>Name: </b>PackageName, 
<b>Values: </b>String<br /><b>Description: </b>The name of the AirBEAM package to process for upload.<P /></td><td style="text-align:left;" valign="top" class="clsSyntaxCells clsOddRow">N/A</td></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>Run<br /></b>Instructs the AirBeam Smart client to run the client and perform the current configuration.  Note that the client is run as the foreground application.</td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;" /><td class="clsSyntaxCells clsEvenRow" style="text-align:left;" valign="top">The exit code of the AirBeam Smart client</td></tr>
</table>

## Properties

<table class="re-table"><col width="20%" /><col width="80%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Description</th></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>AutoLoadMode</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">0 - 3, describes how synchronization is started.  See remarks.</td></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>AutoReboot</b></td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">True or False, whether or not the enable auto reboot mode.</td></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>RAMManagement</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">True or False, Enables or Disables RAM Management mode.</td></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>TestMode</b></td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">True or False, Whether or not packages should be loaded when added.</td></tr>
</table>

## Remarks
### Mode Settings
The following mode settings apply to the AutoLoadMode Property

	:::term
	0: Synchronization is not automatically started.
	1: Synchronization is automatically started in interactive mode.
	2: Synchronization is automatically started in non-interactive mode.
	3: Synchronization is automatically started in background mode.

### Backwards Compatibility
The AirBeam Preexisting JavaScript Object provides backwards compatibility with code written for PocketBrowser and also supports the syntax below. Because RhoElements inserts the object 'airbeam' on the page automatically when 'PreloadLegacyAirBeam' is configured to be '1' you can not create your own objects by this name, see below:

	:::js
	<script>
	  //  Old PocketBrowser syntax to support AirBeam
	  var myObj = new ActiveXObject("PocketBrowser.AirBEAMSmart"); 
	  
	  //  Note: var airbeam = new ... will fail because the object already exists on the page.
	  myObj.Run();
	</script>

## Requirements

<table class="re-table"><tr><th class="tableHeading">RhoElements Version</th><td class="clsSyntaxCell clsEvenRow">1.0.0 or above
</td></tr><tr><th class="tableHeading">Supported Devices</th><td class="clsSyntaxCell clsOddRow">All supported devices.</td></tr><tr><th class="tableHeading">Minimum Requirements</th><td class="clsSyntaxCell clsOddRow">None.</td></tr><tr><th class="tableHeading">Persistence</th><td class="clsSyntaxCell clsEvenRow">Immediate - These methods are actioned immediately.</td></tr>
</table>

## HTML/JavaScript Examples
The Following example shows usage of the AddPackage and Run methods:

	:::js
	<script>
		function doSync(){
			if(airbeam.AddPackage("myPackage"))
			{
				setTimeout('airbeam.Run();', 100);
			}
			else{
				alert('Add Package Failed.  You can only have a maximum of 4 packages');
			}
		}
	</script>

The Following example shows usage of the AutoLoadMode, AutoReboot, RAMManagement and TestMode properties:

	:::js
	<script>
		function doSync(){
			airbeam.AutoLoadMode = 2;
			airbeam.AutoReboot = false;
			airbeam.RAMManagement = true;
			airbeam.TestMode = false;
			airbeam.AddPackage('myPackage');
			setTimeout('airbeam.Run()', 100);
		}
	</script>

The Following example shows usage of the DeletePackage method:

	:::js
	<script>
		function doSync(){
			airbeam.DeletePackage = 'myPackage';
			setTimeout('airbeam.Run()', 100);
		}
	</script>

The Following example shows usage of the UploadPackage method:

	:::js
	<script>
		function doSync(){
			airbeam.UploadPackage = 'myPackage';
			setTimeout('airbeam.Run()', 100);
		}
	</script>