#KeyState


## Overview
<p>The KeyState API is used to display small icons to the user indicating the current shifted state of the hardware keyboard. The KeyState indicator will display icons for Shift, Alt, Control, Function, Caps, Num lock and Orange key states, growing from the right as necessry if more than one key state is set at once. This API is only supported on a subset of Motorola Solutions' Windows Mobile / CE / Embedded handheld devices (see remarks).</p>
<h2>Enabling the API</h2>

<p>In order to use this API you must include the following extension in your <code>build.yml</code>.</p>

<pre><code>:::ruby
extensions: ["indicators"]
</code></pre>

<p>The <code>indicators</code> extension is also included automatically if you specify the following in your <code>build.yml</code>.</p>

<pre><code>:::ruby
app_type: "rhoelements"
</code></pre>

<p>NOTE: If you are building a Windows Mobile or Windows CE app with this API, you must set your app_type as &ldquo;rhoelements&rdquo; in your build.yml as shown <a href="../guide/build_config#other-build-time-settings">here</a>.</p>

<h2>JavaScript Usage</h2>

<p>Be sure to review the <a href="/guide/api_js">JavaScript API Usage</a> guide for important information about using this API in JavaScript.</p>

<h2>Ruby Usage</h2>

<p>Be sure to review the <a href="/guide/api_ruby">Ruby API Usage</a> guide for important information about using this API in Ruby.</p>



##Methods



### hideStates()
Stops showing keystate icons representing the shifted state of the hardware keyboard.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Windows Embedded
* Motorola Solutions Devices Only

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.KeyState.hideStates()</code> </li></ul></li></ul>

### showStates(<span class="text-info">HASH</span> propertyMap)
Display keystate icons representing the shifted state of the hardware keyboard.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span> <span class='label label-info'>Optional</span><p>
The properties associated with the keystate indicator, its size and position. 
Not specifying any properties will display the keystate indicators at the bottom right hand corner of the screen.</p></li><ul><li>right : <span class='text-info'>INTEGER</span><span class='label '> Default: [Keystate Indicators start at the bottom right of the screen]</span><p>
The absolute horizontal position of the keystate indicators in pixels. This is the rightmost edge of the rightmost indicator, where multiple indicators are displayed simultaneously they will grow from right to left. </p></li><li>top : <span class='text-info'>INTEGER</span><span class='label '> Default: [Keystate Indicators start at the bottom right of the screen]</span><p>
The absolute vertical position of the keystate indicators in pixels. </p></li><li>width : <span class='text-info'>INTEGER</span><span class='label '> Default: [A sensible width based on Screen Resolution]</span><p>
The width of each keystate indicator in pixels. </p></li><li>height : <span class='text-info'>INTEGER</span><span class='label '> Default: [A sensible height based on Screen Resolution]</span><p>
The width of each keystate indicator in pixels. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Windows Embedded
* Motorola Solutions Devices Only

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.KeyState.showStates(<span class="text-info">HASH</span> propertyMap)</code> </li></ul></li></ul>

##Remarks



###Devices lacking support

Due to platform limitations this API is not available on the following Motorola Solutions' devices:

- ES400
- MC45
- MC65
- VC70
- MC45
                

###Rotating the Screen
The keystate indicator positions are absolute and so when rotating the screen you should also reposition the keystate accordingly to accommodate the new screen layout.

##Examples



###Show the Keystate Indicators

If you just want to display the keystate indicators in their default positions with size 25x25 pixels then call as follows.
<pre><code>

                            
function show_keystates(){
    Rho.Keystate.showStates({width:25;height:25});
}
                        
</code></pre>