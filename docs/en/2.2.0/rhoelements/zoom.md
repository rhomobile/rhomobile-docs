
#Zoom Module

<b>
The Zoom Module is used to set the zoom size of the text or page.
</b>

##Syntax

<table class="re-table"><tr><th class="tableHeading">zoom (Module) &lt;META&gt; Syntax
</th></tr><tr><td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="zoom" content="[Parameter]"&gt;</p></td></tr></table>
<table class="re-table"><tr><th class="tableHeading">Zoom JavaScript Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the JavaScript Object <b>'zoom'</b> will exist on the current page and can be used to interact directly with the zoom.
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Set zoom parameters via JavaScript use the following syntax: zoom.parameter = 'value'; remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>zoom</b>.text = 'value';
</td></tr><tr><td class="clsSyntaxCells clsOddRow">							
To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: zoom.setEMML("[Your EMML Tags]");
<P />
e.g. <b>zoom</b>.setEMML("text:<i>value</i>");							
</td></tr></table>

<table class="re-table"><tr><th class="tableHeading">Zoom Ruby Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the Ruby Object <b>'Zoom'</b> will exist on the current page and can be used to interact directly with the Zoom. All Methods, Parameters and Events are the same as JavaScript, however, notice <b>'Zoom'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b></td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Set Zoom parameters via Ruby use the following syntax: Zoom.parameter = 'value' remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>Zoom</b>.text = 'value'
</td></tr><tr><td class="clsSyntaxCells clsOddRow" /></tr></table>




##Parameters


Items listed in this section indicate parameters, or attributes which can be set.
<table class="re-table"><col width="20%" /><col width="20%" /><col width="38%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Possible Values</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>text:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Number in the range 0 to 4</td><td class="clsSyntaxCells clsOddRow">Sets the font size to be displayed on the page, set to 0 for the smallest font and 4 for the largest font.</td><td class="clsSyntaxCells clsOddRow">2</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>page:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Number greater than 0.0</td><td class="clsSyntaxCells clsEvenRow">Sets the zoom factor of the page.  Factor 1.0 is no zoom, values less than 1.0 are zoomed out and values greater than 1.0 are zoomed in. In android,zoom will take effect after page refresh or page transition.</td><td class="clsSyntaxCells clsEvenRow">1.0</td></tr></table>
<table class="re-table"><col width="78%" /><col width="8%" /><col width="1%" /><col width="5%" /><col width="1%" /><col width="5%" /><col width="2%" /></table>





##Requirements

<table class="re-table"><tr><th class="tableHeading">RhoElements Version</th><td class="clsSyntaxCell clsEvenRow">1.0.0 or above
</td></tr><tr><th class="tableHeading">Supported Devices</th><td class="clsSyntaxCell clsOddRow">All supported devices.</td></tr><tr><th class="tableHeading">Minimum Requirements</th><td class="clsSyntaxCell clsOddRow">None.</td></tr><tr><th class="tableHeading">Persistence</th><td class="clsSyntaxCell clsEvenRow">Persistent - Changes to this module will persist when navigating to a new page.</td></tr></table>


##HTML/JavaScript Examples

The following example uses zoom to set the text zoom level to the smallest:

	<META HTTP-Equiv="zoom" Content="text:0">
	
The following example will zoom the page to enable an application written for a QVGA screen to be displayed properly on a VGA screen:

	<META HTTP-Equiv="zoom" Content="page:2.0">
	


