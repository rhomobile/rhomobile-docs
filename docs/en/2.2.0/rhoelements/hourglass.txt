
#Hourglass Module

<b>
The Hourglass Module is used to show or hide the hourglass (wait cursor) as well as adjust its position.
</b>

##Syntax

<table class="re-table"><tr><th class="tableHeading">hourglass (Module) &lt;META&gt; Syntax
</th></tr><tr><td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="Hourglass" content="[parameter]"&gt;</p></td></tr></table>
<table class="re-table"><tr><th class="tableHeading">Hourglass JavaScript Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the JavaScript Object <b>'hourglass'</b> will exist on the current page and can be used to interact directly with the hourglass.
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Set hourglass parameters via JavaScript use the following syntax: hourglass.parameter = 'value'; remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>hourglass</b>.visibility = 'value';
</td></tr><tr><td class="clsSyntaxCells clsOddRow">							
To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: hourglass.setEMML("[Your EMML Tags]");
<P />
e.g. <b>hourglass</b>.setEMML("visibility:<i>value</i>");							
</td></tr></table>

<table class="re-table"><tr><th class="tableHeading">Hourglass Ruby Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the Ruby Object <b>'Hourglass'</b> will exist on the current page and can be used to interact directly with the Hourglass. All Methods, Parameters and Events are the same as JavaScript, however, notice <b>'Hourglass'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b></td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Set Hourglass parameters via Ruby use the following syntax: Hourglass.parameter = 'value' remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>Hourglass</b>.visibility = 'value'
</td></tr><tr><td class="clsSyntaxCells clsOddRow" /></tr></table>




##Parameters


Items listed in this section indicate parameters, or attributes which can be set.
<table class="re-table"><col width="20%" /><col width="20%" /><col width="38%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Possible Values</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>visibility:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Visible or Hidden</td><td class="clsSyntaxCells clsOddRow">Shows or hides the hourglass</td><td class="clsSyntaxCells clsOddRow">Hidden</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>left:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Horizontal position, in pixels</td><td class="clsSyntaxCells clsEvenRow">Sets the horizontal position of the hourglass</td><td class="clsSyntaxCells clsEvenRow">Center of the screen</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>top:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Vertical position, in pixels</td><td class="clsSyntaxCells clsOddRow">Sets the vertical position of the hourglass</td><td class="clsSyntaxCells clsOddRow">Center of the screen</td></tr></table>
<table class="re-table"><col width="78%" /><col width="8%" /><col width="1%" /><col width="5%" /><col width="1%" /><col width="5%" /><col width="2%" /></table>


##Multi Instance
When multiple RhoElememts applications are running the following considerations should be made: The hourglass settings are application specific.  Switching to another application which uses the hourglass module will apply the focused application's settings to it, e.g. it may move position or be shown / hidden.  Applications which do not have focus will not have their hourglass shown.


##Remarks


###Navigation
When navigating between pages the hourglass will be shown and hidden automatically and will override the current visibility settings. The position the hourglass is shown at during page loads will be as set using the Left / Top properties. Because the Hourglass is shown and hidden automatically during page loads it is not recommended to use static meta tags to show or hide it, in preference use InvokeMETATag from JavaScript.


###Scrolling
The hourglass is not compatible with scrolling the browser window. The spinning cursor will move with the HTML page.




##Requirements

<table class="re-table"><tr><th class="tableHeading">RhoElements Version</th><td class="clsSyntaxCell clsEvenRow">1.0.0 or above
</td></tr><tr><th class="tableHeading">Supported Devices</th><td class="clsSyntaxCell clsOddRow">All supported devices.</td></tr><tr><th class="tableHeading">Minimum Requirements</th><td class="clsSyntaxCell clsOddRow">None.</td></tr><tr><th class="tableHeading">Persistence</th><td class="clsSyntaxCell clsEvenRow">Partially Transient - any changes made by changing parameters will be lost when navigating to a new page with the exception that the wait cursor will always be hidden once the new page has loaded.</td></tr></table>


##HTML/JavaScript Examples

The following example sets the Hourglass position to (50, 50).

	<META HTTP-Equiv="Hourglass" Content="left:50; top:50">
	
The following example shows and hides the Hourglass.

	  <SCRIPT LANGUAGE="JavaScript">
	    function showHourglass()
	    {
		    hourglass.visibility = 'visible';
	    }
	
	    function hideHourglass()
	    {
		    hourglass.visibility = 'hidden';
	    }
	  </SCRIPT>
	


