#KeyState


## Overview
The KeyState API is used to display small icons to the user indicating the current shifted state of the hardware keyboard. The KeyState indicator will display icons for Shift, Alt, Control, Function, Caps, Num lock and Orange key states, growing from the right as necessry if more than one key state is set at once. This API is only supported on a subset of Motorola Solutions' Windows Mobile / CE / Embedded handheld devices (see remarks).
## Enabling the API
In order to use this API you must TBD INSERT Eb specific instructions here

        


##Methods



### hideStates()
<p>Stops showing keystate icons representing the shifted state of the hardware keyboard.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.KeyState.hideStates()</code> 


### showStates(<span class="text-info">HASH</span> propertyMap)
<p>Display keystate icons representing the shifted state of the hardware keyboard.</p>


####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span> <span class='label label-info'>Optional</span><p>
<p>The properties associated with the keystate indicator, its size and position.</p>
 
<p>Not specifying any properties will display the keystate indicators at the bottom right hand corner of the screen.</p>
</p></li><ul><li>right : <span class='text-info'>INTEGER</span><span class='label '> Default: [Keystate Indicators start at the bottom right of the screen]</span><p>
<p>The absolute horizontal position of the keystate indicators in pixels. This is the rightmost edge of the rightmost indicator, where multiple indicators are displayed simultaneously they will grow from right to left.</p>
 </p></li><li>top : <span class='text-info'>INTEGER</span><span class='label '> Default: [Keystate Indicators start at the bottom right of the screen]</span><p>
<p>The absolute vertical position of the keystate indicators in pixels.</p>
 </p></li><li>width : <span class='text-info'>INTEGER</span><span class='label '> Default: [A sensible width based on Screen Resolution]</span><p>
<p>The width of each keystate indicator in pixels.</p>
 </p></li><li>height : <span class='text-info'>INTEGER</span><span class='label '> Default: [A sensible height based on Screen Resolution]</span><p>
<p>The width of each keystate indicator in pixels.</p>
 </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile/CE
* Motorola Solutions Devices Only

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.KeyState.showStates(<span class="text-info">HASH</span> propertyMap)</code> 


##Remarks



###Devices lacking support
<p>Due to platform limitations this API is not available on the following Motorola Solutions' devices:</p>

<ul>
<li>ES400</li>
<li>MC45</li>
<li>MC65</li>
<li>VC70</li>
<li>MC45</li>
</ul>



###Rotating the Screen
<p>The keystate indicator positions are absolute and so when rotating the screen you should also reposition the keystate accordingly to accommodate the new screen layout.</p>
