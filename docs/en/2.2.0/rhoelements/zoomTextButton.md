
#ZoomTextButton Module

<b>
The ZoomTextButton Module is used to set the parameters of the ZoomTextButton. When clicked the font size in the browser will cycle from smallest to largest.
</b>

##Syntax

<table class="re-table"><tr><th class="tableHeading">zoomTextButton (Module) &lt;META&gt; Syntax
</th></tr><tr><td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="ZoomTextButton" content="[parameter]"&gt;</p></td></tr></table>
<table class="re-table"><tr><th class="tableHeading">ZoomTextButton JavaScript Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the JavaScript Object <b>'zoomTextButton'</b> will exist on the current page and can be used to interact directly with the zoomTextButton.
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Set zoomTextButton parameters via JavaScript use the following syntax: zoomtextbutton.parameter = 'value'; remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>zoomTextButton</b>.left = 'value';
</td></tr><tr><td class="clsSyntaxCells clsOddRow">							
To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: zoomtextbutton.setEMML("[Your EMML Tags]");
<P />
e.g. <b>zoomTextButton</b>.setEMML("left:<i>value</i>");							
</td></tr></table>

<table class="re-table"><tr><th class="tableHeading">ZoomTextButton Ruby Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the Ruby Object <b>'ZoomTextButton'</b> will exist on the current page and can be used to interact directly with the ZoomTextButton. All Methods, Parameters and Events are the same as JavaScript, however, notice <b>'ZoomTextButton'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b></td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Set ZoomTextButton parameters via Ruby use the following syntax: ZoomTextButton.parameter = 'value' remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>ZoomTextButton</b>.left = 'value'
</td></tr><tr><td class="clsSyntaxCells clsOddRow" /></tr></table>




##Parameters


Items listed in this section indicate parameters, or attributes which can be set.
<table class="re-table"><col width="20%" /><col width="20%" /><col width="38%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Possible Values</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>left:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Positive number, representing pixels</td><td class="clsSyntaxCells clsOddRow">Sets the X position of the ZoomText button in pixels.</td><td class="clsSyntaxCells clsOddRow">Bottom right of the screen</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>top:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Positive number, representing pixels</td><td class="clsSyntaxCells clsEvenRow">Sets the Y position of the ZoomText button in pixels.</td><td class="clsSyntaxCells clsEvenRow">Bottom right of the screen</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>height:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Positive number, representing pixels</td><td class="clsSyntaxCells clsOddRow">Sets the height of the ZoomText button.</td><td class="clsSyntaxCells clsOddRow">Dependant on screen resolution</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>width:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Positive number, representing pixels</td><td class="clsSyntaxCells clsEvenRow">Sets the width of the ZoomText button.</td><td class="clsSyntaxCells clsEvenRow">Dependant on screen resolution</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>imageUp:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">URL</td><td class="clsSyntaxCells clsOddRow">Sets the image to be displayed when the ZoomText Button is in the up state. See Remarks.</td><td class="clsSyntaxCells clsOddRow">Default image</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>imageDown:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">URL</td><td class="clsSyntaxCells clsEvenRow">Sets the image to be displayed when the ZoomText Button is in the down state. See Remarks.</td><td class="clsSyntaxCells clsEvenRow">Default image</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>visibility:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">visible, hidden</td><td class="clsSyntaxCells clsOddRow">Sets the visibility of the ZoomText button.</td><td class="clsSyntaxCells clsOddRow">Hidden.</td></tr></table>
<table class="re-table"><col width="78%" /><col width="8%" /><col width="1%" /><col width="5%" /><col width="1%" /><col width="5%" /><col width="2%" /></table>




##Remarks


###Use of Images on Buttons.
Images can be specified as local to the device or on an HTTP / FTP server, just specify the required protocol as part of your URL (file://\, HTTP:// and FTP://). Image will be scaled to the size of the button. JPEG and GIF images are only supported on WM devices. Both CE and WM support BMP files.


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

The following example shows the ZoomText button, sets its left and top coordinates to 50 pixels, and its height and width to 20 pixels.

	<META HTTP-Equiv="ZoomTextButton" Content="Visibility:Visible">
	<META HTTP-Equiv="ZoomTextButton" Content="Left:50">
	<META HTTP-Equiv="ZoomTextButton" Content="Top:50">
	<META HTTP-Equiv="ZoomTextButton" Content="Height:20">
	<META HTTP-Equiv="ZoomTextButton" Content="Width:20">
					
The following example shows the ZoomText button and displays the zoomText_up.gif / zoomText_down.gif images on it (resizing the images if necessary).

	<META HTTP-Equiv="ZoomTextButton" Content="ImageUp:url('http://myaddress/zoomText_up.gif'); ImageDown:url('http://myaddress.zoomText_down.gif'); Visibility:Visible">
					


