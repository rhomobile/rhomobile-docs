
#TopCommandArea Module

<b>
The TopCommandArea Module is used to set the parameters of the Top Command Area. The top command area is a region at the top of the screen designed to hold RhoElements controls such as the address bar or Go button to separate them from the rest of the user application.
</b>

##Syntax

<table class="re-table"><tr><th class="tableHeading">topCommandArea (Module) &lt;META&gt; Syntax
</th></tr><tr><td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="TopCommandArea" content="[parameter]"&gt;</p></td></tr></table>
<table class="re-table"><tr><th class="tableHeading">TopCommandArea JavaScript Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the JavaScript Object <b>'topCommandArea'</b> will exist on the current page and can be used to interact directly with the topCommandArea.
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Set topCommandArea parameters via JavaScript use the following syntax: topcommandarea.parameter = 'value'; remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>topCommandArea</b>.visibility = 'value';
</td></tr><tr><td class="clsSyntaxCells clsOddRow">							
To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: topcommandarea.setEMML("[Your EMML Tags]");
<P />
e.g. <b>topCommandArea</b>.setEMML("visibility:<i>value</i>");							
</td></tr></table>

<table class="re-table"><tr><th class="tableHeading">TopCommandArea Ruby Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the Ruby Object <b>'TopCommandArea'</b> will exist on the current page and can be used to interact directly with the TopCommandArea. All Methods, Parameters and Events are the same as JavaScript, however, notice <b>'TopCommandArea'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b></td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Set TopCommandArea parameters via Ruby use the following syntax: TopCommandArea.parameter = 'value' remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>TopCommandArea</b>.visibility = 'value'
</td></tr><tr><td class="clsSyntaxCells clsOddRow" /></tr></table>




##Parameters


Items listed in this section indicate parameters, or attributes which can be set.
<table class="re-table"><col width="20%" /><col width="20%" /><col width="38%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Possible Values</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>visibility:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Visible, Hidden</td><td class="clsSyntaxCells clsOddRow">Sets the visibility of the top command area.</td><td class="clsSyntaxCells clsOddRow">Hidden.</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>height:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Positive number, representing pixels</td><td class="clsSyntaxCells clsEvenRow">Sets the height of the top command area</td><td class="clsSyntaxCells clsEvenRow">Slightly greater than the height of a buttons default height, which depends on the screen resolution.</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>color:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Color in the #RRGGBB format</td><td class="clsSyntaxCells clsOddRow">The color to set the top command area to.</td><td class="clsSyntaxCells clsOddRow">None. The default image is displayed by default.</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>image:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">URL</td><td class="clsSyntaxCells clsEvenRow">Sets the image to be displayed on the top command area.  See Remarks.</td><td class="clsSyntaxCells clsEvenRow">Default image</td></tr></table>
<table class="re-table"><col width="78%" /><col width="8%" /><col width="1%" /><col width="5%" /><col width="1%" /><col width="5%" /><col width="2%" /></table>




##Remarks


###Default Positions
By default this control will be placed a the top of the screen. On Windows Mobile if the 'FullScreen' configuration setting is disabled the control will need to be moved, otherwise it will appear beneath the task bar.


###Switching to Other Applications
All controls are designed to be shown on top of RhoElements. If you require to switch to an application other than RhoElements you should minimize RhoElements to ensure the buttons do not remain shown. (Not applicable to Enterprise Tablet)


###Screen Orientation
When the screen orientation changes, either using the ScreenOrientation tag or by rotating a device with hardware support, the command areas will automatically move and resize to fit the new layout. However the buttons themselves are not moved and in some cases this may result in them being off the screen or not in the expected position. If so they must be moved manually by detecting the ScreenOrientationEvent.




##Requirements

<table class="re-table"><tr><th class="tableHeading">RhoElements Version</th><td class="clsSyntaxCell clsEvenRow">1.0.0 or above
</td></tr><tr><th class="tableHeading">Supported Devices</th><td class="clsSyntaxCell clsOddRow">All supported devices.</td></tr><tr><th class="tableHeading">Minimum Requirements</th><td class="clsSyntaxCell clsOddRow">None.</td></tr><tr><th class="tableHeading">Persistence</th><td class="clsSyntaxCell clsEvenRow">Persistent - Changes to this module will persist when navigating to a new page.</td></tr></table>


##HTML/JavaScript Examples

The following example shows the Top Command Area, sets the Height to 100 and background color to red

	<META HTTP-Equiv="TopCommandArea" Content="Visibility:Visible">
	<META HTTP-Equiv="TopCommandArea" Content="Height:100">
	<META HTTP-Equiv="TopCommandArea" Content="Color:#FF0000">
	
The following example shows the Top Command Area, sets the height to 100 and displays image tca.gif on it (resizing the image if necessary)

	<META HTTP-Equiv="TopCommandArea" Content="Height:100; Visibility:Visible; Image:url('http://myaddress/tca.gif')">