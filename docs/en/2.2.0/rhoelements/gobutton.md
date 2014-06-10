
#GoButton Module

<b>
The GoButton Module is used to set the parameters of the GoButton. When clicked, the Go button shall navigate to the page shown in the Address Bar. The Go button will not be visible when the browser is navigating as it is replaced by the stop button (if visible), in line with all major browsers.
</b>

##Syntax

<table class="re-table"><tr><th class="tableHeading">goButton (Module) &lt;META&gt; Syntax
</th></tr><tr><td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="GoButton" content="[parameter]"&gt;</p></td></tr></table>
<table class="re-table"><tr><th class="tableHeading">GoButton JavaScript Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the JavaScript Object <b>'goButton'</b> will exist on the current page and can be used to interact directly with the goButton.
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Set goButton parameters via JavaScript use the following syntax: gobutton.parameter = 'value'; remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>goButton</b>.left = 'value';
</td></tr><tr><td class="clsSyntaxCells clsOddRow">							
To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: gobutton.setEMML("[Your EMML Tags]");
<P />
e.g. <b>goButton</b>.setEMML("left:<i>value</i>");							
</td></tr></table>

<table class="re-table"><tr><th class="tableHeading">GoButton Ruby Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the Ruby Object <b>'GoButton'</b> will exist on the current page and can be used to interact directly with the GoButton. All Methods, Parameters and Events are the same as JavaScript, however, notice <b>'GoButton'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b></td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Set GoButton parameters via Ruby use the following syntax: GoButton.parameter = 'value' remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>GoButton</b>.left = 'value'
</td></tr><tr><td class="clsSyntaxCells clsOddRow" /></tr></table>




##Parameters


Items listed in this section indicate parameters, or attributes which can be set.
<table class="re-table"><col width="20%" /><col width="20%" /><col width="38%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Possible Values</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>left:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Positive number, representing pixels</td><td class="clsSyntaxCells clsOddRow">Sets the left X position of the Go button.</td><td class="clsSyntaxCells clsOddRow">To the right of the address bar</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>top:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Positive number, representing pixels</td><td class="clsSyntaxCells clsEvenRow">Sets the Y position of the Go button.</td><td class="clsSyntaxCells clsEvenRow">To the right of the address bar</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>height:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Positive number, representing pixels</td><td class="clsSyntaxCells clsOddRow">Sets the height of the Go button.</td><td class="clsSyntaxCells clsOddRow">Dependant on screen resolution</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>width:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Positive number, representing pixels</td><td class="clsSyntaxCells clsEvenRow">Sets the width of the Go button in pixels.</td><td class="clsSyntaxCells clsEvenRow">Dependant on screen resolution</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>imageUp:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">URL</td><td class="clsSyntaxCells clsOddRow">Sets the image to be displayed when the Go Button is in the up state. See Remarks.</td><td class="clsSyntaxCells clsOddRow">Default image</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>imageDown:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">URL</td><td class="clsSyntaxCells clsEvenRow">Sets the image to be displayed when the Go Button is in the down state. See Remarks.</td><td class="clsSyntaxCells clsEvenRow">Default image</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>visibility:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Visible, Hidden</td><td class="clsSyntaxCells clsOddRow">Sets the visibility of the Go button.</td><td class="clsSyntaxCells clsOddRow">Hidden.</td></tr></table>
<table class="re-table"><col width="78%" /><col width="8%" /><col width="1%" /><col width="5%" /><col width="1%" /><col width="5%" /><col width="2%" /></table>




##Remarks


###Use of Images on Buttons.
Images can be specified as local to the device or on an HTTP / FTP server, just specify the required protocol as part of your URL (file://\, HTTP:// and FTP://). Image will be scaled to the size of the button. JPEG and GIF images are only supported on WM devices. Both CE and WM support BMP files.


###Default Positions
By default this control will be placed a the top of the screen. On Windows Mobile if the 'FullScreen' configuration setting is disabled the control will need to be moved, otherwise it will appear beneath the task bar.


###Switching to Other Applications
All controls are designed to be shown on top of RhoElements. If you require to switch to an application other than RhoElements you should minimize RhoElements to ensure the buttons do not remain shown.


###Screen Orientation
When the screen orientation changes, either using the ScreenOrientation tag or by rotating a device with hardware support, the command areas will automatically move and resize to fit the new layout. However the buttons themselves are not moved and in some cases this may result in them being off the screen or not in the expected position. If so they must be moved manually by detecting the ScreenOrientationEvent.


###Use in Production
This API is designed for debugging your application only and should not be used in production




##Requirements

<table class="re-table"><tr><th class="tableHeading">RhoElements Version</th><td class="clsSyntaxCell clsEvenRow">1.0.0 or above
</td></tr><tr><th class="tableHeading">Supported Devices</th><td class="clsSyntaxCell clsOddRow">All supported touch devices.</td></tr><tr><th class="tableHeading">Minimum Requirements</th><td class="clsSyntaxCell clsOddRow">None.</td></tr><tr><th class="tableHeading">Persistence</th><td class="clsSyntaxCell clsEvenRow">Persistent - Changes to this module will persist when navigating to a new page.</td></tr></table>


##HTML/JavaScript Examples

The following example shows the Go button and sets the left and top coordinates to 50.

	<META HTTP-Equiv="GoButton" Content="Visibility:Visible">
	<META HTTP-Equiv="GoButton" Content="Left:50">
	<META HTTP-Equiv="GoButton" Content="Top:50">
	
The following example shows the Go button, sets its width to 30 pixels, its left coordinate to 50, and displays the go_up.gif / go_down.gif image on it (resizing the image if necessary).

	<META HTTP-Equiv="GoButton" Content="Width:30; Left:50; ImageUp:url('http://myaddress/go_up.gif'); ImageDown:url('http://myaddress/go_down.gif'); Visibility:Visible">
	


