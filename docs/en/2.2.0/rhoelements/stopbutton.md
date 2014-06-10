
#StopButton Module

<b>
The StopButton Module is used to set the parameters of the Stop Button. The Stop Button will only be displayed whilst a page is loading and when clicked will cease the current navigation and navigate to the badlink page (if defined), this prevents partially rendered pages being displayed in the browser.
</b>

##Syntax

<table class="re-table"><tr><th class="tableHeading">stopButton (Module) &lt;META&gt; Syntax
</th></tr><tr><td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="StopButton" content="[parameter]"&gt;</p></td></tr></table>
<table class="re-table"><tr><th class="tableHeading">StopButton JavaScript Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the JavaScript Object <b>'stopButton'</b> will exist on the current page and can be used to interact directly with the stopButton.
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Set stopButton parameters via JavaScript use the following syntax: stopbutton.parameter = 'value'; remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>stopButton</b>.left = 'value';
</td></tr><tr><td class="clsSyntaxCells clsOddRow">							
To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: stopbutton.setEMML("[Your EMML Tags]");
<P />
e.g. <b>stopButton</b>.setEMML("left:<i>value</i>");							
</td></tr></table>

<table class="re-table"><tr><th class="tableHeading">StopButton Ruby Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the Ruby Object <b>'StopButton'</b> will exist on the current page and can be used to interact directly with the StopButton. All Methods, Parameters and Events are the same as JavaScript, however, notice <b>'StopButton'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b></td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Set StopButton parameters via Ruby use the following syntax: StopButton.parameter = 'value' remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>StopButton</b>.left = 'value'
</td></tr><tr><td class="clsSyntaxCells clsOddRow" /></tr></table>




##Parameters


Items listed in this section indicate parameters, or attributes which can be set.
<table class="re-table"><col width="20%" /><col width="20%" /><col width="38%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Possible Values</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>left:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Positive number, representing pixels</td><td class="clsSyntaxCells clsOddRow">Sets the X position of the Stop button.</td><td class="clsSyntaxCells clsOddRow">Same location as the 'Go' Button</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>top:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Positive number, representing pixels</td><td class="clsSyntaxCells clsEvenRow">Sets the Y position of the Stop button.</td><td class="clsSyntaxCells clsEvenRow">Same location as the 'Go' Button</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>height:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Positive number, representing pixels</td><td class="clsSyntaxCells clsOddRow">Sets the height of the Stop button.</td><td class="clsSyntaxCells clsOddRow">Dependant on screen resolution</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>width:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Positive number, representing pixels</td><td class="clsSyntaxCells clsEvenRow">Sets the width of the Stop button.</td><td class="clsSyntaxCells clsEvenRow">Dependant on screen resolution</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>imageUp:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">URL</td><td class="clsSyntaxCells clsOddRow">Sets the image to be displayed when the Stop Button is in the up state. See Remarks.</td><td class="clsSyntaxCells clsOddRow">Default image</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>imageDown:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">URL</td><td class="clsSyntaxCells clsEvenRow">Sets the image to be displayed when the Stop Button is in the down state. See Remarks.</td><td class="clsSyntaxCells clsEvenRow">Default image</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>visibility:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Visible, Hidden</td><td class="clsSyntaxCells clsOddRow">Sets the visibility of the Stop button.</td><td class="clsSyntaxCells clsOddRow">Hidden.</td></tr></table>
<table class="re-table"><col width="78%" /><col width="8%" /><col width="1%" /><col width="5%" /><col width="1%" /><col width="5%" /><col width="2%" /></table>




##Remarks


###Use of Images on Buttons.
Images can be specified as local to the device or on an HTTP / FTP server, just specify the required protocol as part of your URL (file://\, HTTP:// and FTP://). Image will be scaled to the size of the button. JPEG and GIF images are only supported on WM devices. Both CE and WM support BMP files.


###Default Positions
By default this control will be placed a the top of the screen. On Windows Mobile if the 'FullScreen' configuration setting is disabled the control will need to be moved, otherwise it will appear beneath the task bar.


###Switching to Other Applications
All controls are designed to be shown on top of RhoElements. If you require to switch to an application other than RhoElements you should minimize RhoElements to ensure the buttons do not remain shown. (Not applicable to Enterprise Tablet)


###Visibility of Stop Button
Depending on how quickly the navigation is completed, whether the target page is cached, and what operating system the device is using, the stop button may not be visible immediately after starting navigation.


###Screen Orientation
When the screen orientation changes, either using the ScreenOrientation tag or by rotating a device with hardware support, the command areas will automatically move and resize to fit the new layout. However the buttons themselves are not moved and in some cases this may result in them being off the screen or not in the expected position. If so they must be moved manually by detecting the ScreenOrientationEvent.


###Use in Production
This API is designed for debugging your application only and should not be used in production




##Requirements

<table class="re-table"><tr><th class="tableHeading">RhoElements Version</th><td class="clsSyntaxCell clsEvenRow">1.0.0 or above
</td></tr><tr><th class="tableHeading">Supported Devices</th><td class="clsSyntaxCell clsOddRow">All supported touch devices.</td></tr><tr><th class="tableHeading">Minimum Requirements</th><td class="clsSyntaxCell clsOddRow">None.</td></tr><tr><th class="tableHeading">Persistence</th><td class="clsSyntaxCell clsEvenRow">Persistent - Changes to this module will persist when navigating to a new page.</td></tr></table>


##HTML/JavaScript Examples

The following example shows the Stop button and sets the left and top coordinates to 50.

	<META HTTP-Equiv="StopButton" Content="Visibility:Visible">
	<META HTTP-Equiv="StopButton" Content="Left:50">
	<META HTTP-Equiv="StopButton" Content="Top:50">
					
The following example shows the Stop button and displays the stop_up.gif / stop_down images on it (resizing the images if necessary).

	<META HTTP-Equiv="StopButton" Content="ImageUp:url('http://myaddress/stop_up.gif'); ImageDown:url('http://myaddress/stop_down.gif'); Visibility:Visible">
					


