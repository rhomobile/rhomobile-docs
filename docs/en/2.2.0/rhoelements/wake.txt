
#Wake Module

<b>
The Wake Module is used to keep the display and wifi ON as long as RhoElements is active
</b>

##Syntax

<table class="re-table"><tr><th class="tableHeading">wake (Module) &lt;META&gt; Syntax
</th></tr><tr><td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="wake" content="[parameter]"&gt;</p></td></tr></table>
<table class="re-table"><tr><th class="tableHeading">Wake JavaScript Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the JavaScript Object <b>'wake'</b> will exist on the current page and can be used to interact directly with the wake.
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Set wake parameters via JavaScript use the following syntax: wake.parameter = 'value'; remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>wake</b>.wakeLock = 'value';
</td></tr><tr><td class="clsSyntaxCells clsOddRow">							
To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: wake.setEMML("[Your EMML Tags]");
<P />
e.g. <b>wake</b>.setEMML("wakeLock:<i>value</i>");							
</td></tr></table>

<table class="re-table"><tr><th class="tableHeading">Wake Ruby Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the Ruby Object <b>'Wake'</b> will exist on the current page and can be used to interact directly with the Wake. All Methods, Parameters and Events are the same as JavaScript, however, notice <b>'Wake'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b></td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Set Wake parameters via Ruby use the following syntax: Wake.parameter = 'value' remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>Wake</b>.wakeLock = 'value'
</td></tr><tr><td class="clsSyntaxCells clsOddRow" /></tr></table>




##Parameters


Items listed in this section indicate parameters, or attributes which can be set.
<table class="re-table"><col width="20%" /><col width="20%" /><col width="38%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Possible Values</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>wakeLock:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Enabled, disabled</td><td class="clsSyntaxCells clsOddRow">Enables / disables the screen</td><td class="clsSyntaxCells clsOddRow">Disabled</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>wifiLock:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Enabled, disabled</td><td class="clsSyntaxCells clsEvenRow">Enables / disables the network</td><td class="clsSyntaxCells clsEvenRow">Disabled</td></tr></table>
<table class="re-table"><col width="78%" /><col width="8%" /><col width="1%" /><col width="5%" /><col width="1%" /><col width="5%" /><col width="2%" /></table>




##Remarks


###wake Method
Please note that enabling locks override the system values and consume more battery power.




##Requirements

<table class="re-table"><tr><th class="tableHeading">RhoElements Version</th><td class="clsSyntaxCell clsEvenRow">2.2 or above
</td></tr><tr><th class="tableHeading">Supported Devices</th><td class="clsSyntaxCell clsOddRow">Enterprise Tablet only</td></tr><tr><th class="tableHeading">Minimum Requirements</th><td class="clsSyntaxCell clsOddRow">None</td></tr><tr><th class="tableHeading">Persistence</th><td class="clsSyntaxCell clsEvenRow">Persistent - Changes to this module will persist when navigating to a new page.</td></tr></table>


##HTML/JavaScript Examples

The following keeps the device on and doesn't go to standby

	<META HTTP-Equiv="wake" Content="wakeLock:Enabled;wifiLock:Enabled">
					


