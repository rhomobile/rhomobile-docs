
#Stylus Module

<b>
The Stylus Module is used to enable or disable the touch screen.
</b>

##Syntax

<table class="re-table"><tr><th class="tableHeading">stylus (Module) &lt;META&gt; Syntax
</th></tr><tr><td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-EQUIV="Stylus" content="[method]"&gt;</p></td></tr></table>
<table class="re-table"><tr><th class="tableHeading">Stylus JavaScript Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the JavaScript Object <b>'stylus'</b> will exist on the current page and can be used to interact directly with the stylus.
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Invoke stylus methods via JavaScript use the following syntax: stylus.method();
<P />e.g. <b>stylus</b>.enable();
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">							
To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: stylus.setEMML("[Your EMML Tags]");
<P />
e.g. <b>stylus</b>.setEMML("enable");							
</td></tr></table>

<table class="re-table"><tr><th class="tableHeading">Stylus Ruby Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the Ruby Object <b>'Stylus'</b> will exist on the current page and can be used to interact directly with the Stylus. All Methods, Parameters and Events are the same as JavaScript, however, notice <b>'Stylus'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b></td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Invoke Stylus methods via Ruby use the following syntax: Stylus.method()
<P />e.g. <b>Stylus</b>.enable</td></tr><tr><td class="clsSyntaxCells clsEvenRow" /></tr></table>


	

##Methods


Items listed in this section indicate methods or, in some cases, indicate parameters which will be retrieved.

<table class="re-table"><col width="10%" /><col width="68%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>enable</b></td><td class="clsSyntaxCells clsOddRow">Enables the touch screen</td><td class="clsSyntaxCells clsOddRow">Device Dependant</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>disable</b></td><td class="clsSyntaxCells clsEvenRow">Disables the touch screen</td><td class="clsSyntaxCells clsEvenRow">Device Dependant</td></tr></table>





##Remarks


###Remote Display
This tag does not affect the behaviour of remote display applications for controlling the device

###Devices lacking support
Due to platform limitations this API is not available on the following Symbol Technologies' devices:

1. Workabout Pro 4


##Requirements

<table class="re-table"><tr><th class="tableHeading">RhoElements Version</th><td class="clsSyntaxCell clsEvenRow">1.0.0 or above
</td></tr><tr><th class="tableHeading">Supported Devices</th><td class="clsSyntaxCell clsOddRow">All supported devices.</td></tr><tr><th class="tableHeading">Minimum Requirements</th><td class="clsSyntaxCell clsOddRow">Touch Screen.</td></tr><tr><th class="tableHeading">Persistence</th><td class="clsSyntaxCell clsEvenRow">Persistent - Changes to this module will persist when navigating to a new page.</td></tr></table>


##HTML/JavaScript Examples

The following example disables the touch screen until the Enter key is pressed:

	<META HTTP-EQUIV="Stylus" content="Disabled">
	<META HTTP-EQUIV="OnKey0x0d" content="javascript:doTest();">
	
	<SCRIPT>
	   function doTest()
	   {
	      stylus.enable();
	   }
	</SCRIPT>
	


