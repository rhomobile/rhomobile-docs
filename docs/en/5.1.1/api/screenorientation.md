#ScreenOrientation
<div class="btn-group"><a href="#Methods" class="btn"><i class="icon-cog"></i> Methods<sup>&nbsp;5</sub></a><a class="btn dropdown-toggle" data-toggle="dropdown" data-target="#" href="#Methods" >  <span class="caret"></span>&nbsp;</a><ul class="dropdown-menu" style="max-height: 500px;overflow: auto;"><li class="disabled"><a tabindex="-1" href="#"><b><i>Methods - Class</i></b></a><li><a href="#mleftHanded" data-target="cMethodleftHanded" class="autouncollapse">leftHanded</a></li><li><a href="#mnormal" data-target="cMethodnormal" class="autouncollapse">normal</a></li><li><a href="#mrightHanded" data-target="cMethodrightHanded" class="autouncollapse">rightHanded</a></li><li><a href="#msetScreenOrientationEvent" data-target="cMethodsetScreenOrientationEvent" class="autouncollapse">setScreenOrientationEvent</a></li><li><a href="#mupsideDown" data-target="cMethodupsideDown" class="autouncollapse">upsideDown</a></li></li></ul></div><div class="btn-group"><a href="#Properties" class="btn"><i class="icon-list"></i> Properties<sup>&nbsp;1</sup></a><button href="#" class="btn dropdown-toggle" data-toggle="dropdown">  <span class="caret"></span>&nbsp;</button><ul class="dropdown-menu" style="max-height: 500px;overflow: auto;"><li class="disabled"><a tabindex="-1" href="#"><b><i>Class Properties</i></b></a><li><a href="#pautoRotate" data-target="cPropertyautoRotate" class="autouncollapse">autoRotate</a></li></li></ul></div><div class="btn-group"><a href="#Examples" class="btn"><i class="icon-edit"></i> Examples<sup>&nbsp;3</sup></a><button href="#" class="btn dropdown-toggle" data-toggle="dropdown">  <span class="caret"></span>&nbsp;</button><ul class="dropdown-menu" style="max-height: 500px;overflow: auto;"><li><a href="#e0" data-target="eExample0" class="autouncollapse">Detect screen orientation changes</a></li><li><a href="#e1" data-target="eExample1" class="autouncollapse">Change screen orientation</a></li><li><a href="#e2" data-target="eExample2" class="autouncollapse">Enable / disable auto rotate</a></li></ul></div><div class="btn-group pull-right"><button class="btn dropdown-toggle" id="apiFilterBtn" data-toggle="dropdown" href="#" title="Filter Properties and Methods"><i class="icon-filter "></i>Show</button><select id="apiFilter" class="dropdown-menu apiFilter"><option value="all">All</option><option value="js">JavaScript</option><option value="ruby">Ruby</option><option value="android">Android</option><option value="ios">iOS</option><option value="wm">Windows Mobile</option><option value="wp8">Windows Phone 8</option><option value="w32">Windows Desktop</option><option value="msi">MSI Only</option></select></div><div  id="apibody" style="overflow:auto;padding-right: 5px;">
<p>The ScreenOrientation Module is used to control the screen orientation / layout and register to receive an event when it changes.</p>
<h2>Enabling the API</h2>

<p>In order to use this API you must include the following extension in your <code>build.yml</code>.</p>

<pre><code>:::ruby
extensions: ["screenorientation"]
</code></pre>

<h2>JavaScript Usage</h2>

<p>Be sure to review the <a href="/guide/api_js">JavaScript API Usage</a> guide for important information about using this API in JavaScript.</p>

<h2>Ruby Usage</h2>

<p>Be sure to review the <a href="/guide/api_ruby">Ruby API Usage</a> guide for important information about using this API in Ruby.</p>

<h2>Persistence</h2>

<p>With the old PocketBrowser / RhoElements 1 APIs, any events, such as <code>screenOrientationEvent</code> were canceled when a full navigate was performed. The original reason for this was a limitation of the IE engine on WM5 devices. When moving to the common API this was changed so that callbacks are not canceled.</p>


<a name='Methods'></a>
<h2><i class='icon-cog'></i>Methods</h2>

<div class="accordion" id="accordion"><a name ='mleftHanded'/><div class=' method  js ruby android' id='mleftHanded'><h3><strong  >leftHanded</strong><span style='font-size:.7em;font-weight:normal;'>()</span></h3><ul class="nav nav-tabs" style="padding-left:8px"><li class='active'><a href="#mleftHanded1" data-toggle="tab">Description</a></li><li ><a href="#mleftHanded4" data-toggle="tab">Return</a></li><li ><a href="#mleftHanded6" data-toggle="tab">Access</a></li></ul><div class='tab-content' style='padding-left:8px' id='tc-leftHanded'><div class="tab-pane fade active in" id="mleftHanded1"><p>Sets the screen orientation to left-handed orientation. Note the webpage will not reformat in line with the new screen size automatically.</p>
<p><div><p><img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript"><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"><img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"></p></div></p></div><div class="tab-pane fade" id="mleftHanded2"></div><div class="tab-pane fade" id="mleftHanded3"></div><div class="tab-pane fade" id="mleftHanded4"><div><p><strong>Synchronous Return:</strong></p><ul><li>Void</li></ul></div></div><div class="tab-pane fade" id="mleftHanded6"><div><p><strong>Method Access:</strong></p><ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li>JavaScript: <code>Rho.ScreenOrientation.leftHanded()</code> </li><li>Ruby: <code>Rho::ScreenOrientation.leftHanded()</code></li></ul></li></ul></div></div></div>  </div><a name ='mnormal'/><div class=' method  js ruby android' id='mnormal'><h3><strong  >normal</strong><span style='font-size:.7em;font-weight:normal;'>()</span></h3><ul class="nav nav-tabs" style="padding-left:8px"><li class='active'><a href="#mnormal1" data-toggle="tab">Description</a></li><li ><a href="#mnormal4" data-toggle="tab">Return</a></li><li ><a href="#mnormal6" data-toggle="tab">Access</a></li></ul><div class='tab-content' style='padding-left:8px' id='tc-normal'><div class="tab-pane fade active in" id="mnormal1"><p>Sets the screen orientation to default device orientation.</p>
<p><div><p><img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript"><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"><img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"></p></div></p></div><div class="tab-pane fade" id="mnormal2"></div><div class="tab-pane fade" id="mnormal3"></div><div class="tab-pane fade" id="mnormal4"><div><p><strong>Synchronous Return:</strong></p><ul><li>Void</li></ul></div></div><div class="tab-pane fade" id="mnormal6"><div><p><strong>Method Access:</strong></p><ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li>JavaScript: <code>Rho.ScreenOrientation.normal()</code> </li><li>Ruby: <code>Rho::ScreenOrientation.normal()</code></li></ul></li></ul></div></div></div>  </div><a name ='mrightHanded'/><div class=' method  js ruby android' id='mrightHanded'><h3><strong  >rightHanded</strong><span style='font-size:.7em;font-weight:normal;'>()</span></h3><ul class="nav nav-tabs" style="padding-left:8px"><li class='active'><a href="#mrightHanded1" data-toggle="tab">Description</a></li><li ><a href="#mrightHanded4" data-toggle="tab">Return</a></li><li ><a href="#mrightHanded6" data-toggle="tab">Access</a></li></ul><div class='tab-content' style='padding-left:8px' id='tc-rightHanded'><div class="tab-pane fade active in" id="mrightHanded1"><p>Sets the screen orientation to right-handed orientation. Note the webpage will not reformat in line with the new screen size automatically.</p>
<p><div><p><img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript"><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"><img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"></p></div></p></div><div class="tab-pane fade" id="mrightHanded2"></div><div class="tab-pane fade" id="mrightHanded3"></div><div class="tab-pane fade" id="mrightHanded4"><div><p><strong>Synchronous Return:</strong></p><ul><li>Void</li></ul></div></div><div class="tab-pane fade" id="mrightHanded6"><div><p><strong>Method Access:</strong></p><ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li>JavaScript: <code>Rho.ScreenOrientation.rightHanded()</code> </li><li>Ruby: <code>Rho::ScreenOrientation.rightHanded()</code></li></ul></li></ul></div></div></div>  </div><a name ='msetScreenOrientationEvent'/><div class=' method  js ruby android ios' id='msetScreenOrientationEvent'><h3><strong  >setScreenOrientationEvent</strong><span style='font-size:.7em;font-weight:normal;'>(<span class='text-info'>CallBackHandler</span> callback)</span></h3><ul class="nav nav-tabs" style="padding-left:8px"><li class='active'><a href="#msetScreenOrientationEvent1" data-toggle="tab">Description</a></li><li ><a href="#msetScreenOrientationEvent2" data-toggle="tab">Parameters</a></li><li ><a href="#msetScreenOrientationEvent3" data-toggle="tab">Callback</a></li><li ><a href="#msetScreenOrientationEvent4" data-toggle="tab">Return</a></li><li ><a href="#msetScreenOrientationEvent6" data-toggle="tab">Access</a></li></ul><div class='tab-content' style='padding-left:8px' id='tc-setScreenOrientationEvent'><div class="tab-pane fade active in" id="msetScreenOrientationEvent1"><p>Sets the callback to be called when a screen orientation event occurs.</p>
<p><div><p><img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript"><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"><img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android"><img src="/img/ios.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="iphone, ipod touch, ipad"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"></p></div></p></div><div class="tab-pane fade" id="msetScreenOrientationEvent2"><div><p><strong>Parameters</strong></p><ul><li>callback : <span class='text-info'>CallBackHandler</span> <span class='label label-warning'>Mandatory</span> </li></ul></div></div><div class="tab-pane fade" id="msetScreenOrientationEvent3"><div><p><strong>Async Callback Returning Parameters: <span class='text-info'>STRING</span></strong></p><ul></ul></div></div><div class="tab-pane fade" id="msetScreenOrientationEvent4"><div><p><strong>Synchronous Return:</strong></p><ul><li>Void : this method also supports async callbacks - check the Callback tab for callback return parameters.</li></ul></div></div><div class="tab-pane fade" id="msetScreenOrientationEvent6"><div><p><strong>Method Access:</strong></p><ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li>JavaScript: <code>Rho.ScreenOrientation.setScreenOrientationEvent(<span class='text-info'>CallBackHandler</span> callback)</code> </li><li>Ruby: <code>Rho::ScreenOrientation.setScreenOrientationEvent(<span class='text-info'>CallBackHandler</span> callback)</code></li></ul></li></ul></div></div></div>  </div><a name ='mupsideDown'/><div class=' method  js ruby android' id='mupsideDown'><h3><strong  >upsideDown</strong><span style='font-size:.7em;font-weight:normal;'>()</span></h3><ul class="nav nav-tabs" style="padding-left:8px"><li class='active'><a href="#mupsideDown1" data-toggle="tab">Description</a></li><li ><a href="#mupsideDown4" data-toggle="tab">Return</a></li><li ><a href="#mupsideDown6" data-toggle="tab">Access</a></li></ul><div class='tab-content' style='padding-left:8px' id='tc-upsideDown'><div class="tab-pane fade active in" id="mupsideDown1"><p>Sets the screen orientation to upside down, useful if presenting the device to a customer to obtain a signature.</p>
<p><div><p><img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript"><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"><img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"></p></div></p></div><div class="tab-pane fade" id="mupsideDown2"></div><div class="tab-pane fade" id="mupsideDown3"></div><div class="tab-pane fade" id="mupsideDown4"><div><p><strong>Synchronous Return:</strong></p><ul><li>Void</li></ul></div></div><div class="tab-pane fade" id="mupsideDown6"><div><p><strong>Method Access:</strong></p><ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li>JavaScript: <code>Rho.ScreenOrientation.upsideDown()</code> </li><li>Ruby: <code>Rho::ScreenOrientation.upsideDown()</code></li></ul></li></ul></div></div></div>  </div></div>
<a name='Properties'></a>
<h2><i class='icon-list'></i>Properties</h2>

<a name='pautoRotate'></a><div class=' method  js ruby android ios' id='pautoRotate'><h3><strong  >autoRotate</strong><span style='font-size:.7em;font-weight:normal;'> : <span class='text-info'>BOOLEAN</span>  </span></h3><ul class="nav nav-tabs" style="padding-left:8px"><li class='active'><a href="#pautoRotate1" data-toggle="tab">Description</a></li><li ><a href="#pautoRotate2" data-toggle="tab">Params</a></li><li ><a href="#pautoRotate6" data-toggle="tab">Access</a></li></ul><div class='tab-content' style='padding-left:8px' id='tc-autoRotate'><div class="tab-pane fade active in" id="pautoRotate1"><p>Enables or Disables auto-rotation of the screen orientation when the device is rotated. For Windows Mobile/CE devices, support is limited to only Symbol Technologies devices with IST Sensor support.</p>
<p><div><p><img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript"><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"><img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android"><img src="/img/ios.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="iphone, ipod touch, ipad"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"> </p></div></p></div><div class="tab-pane fade" id="pautoRotate2"><p><strong>Default:</strong> true</p></div><div class="tab-pane fade" id="pautoRotate5"></div><div class="tab-pane fade" id="pautoRotate6"><div><p><strong>Property Access:</strong></p><ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.autoRotate</code></li></ul></li></ul></div></div></div>  </div>
<a name='Examples'></a>
<h2><i class='icon-edit'></i>Examples</h2>

<a name='e0'></a><div class=' example' id='e0'><div class="accordion-group"><div class="accordion-heading"><span class="accordion-toggle"   href="#cExample0"><strong>Detect screen orientation changes</strong></div><div id="cExample0" class="accordion-body">  <div class="accordion-inner">
<p>Detect when the device changes orientation.</p>
<ul class='nav nav-tabs' id='exI0-S0Tab'><li class='active'><a href='#exI0-S0JS' data-toggle='tab'>JavaScript</a></li><li ><a href='#exI0-S0RUBY' data-toggle='tab'>Ruby</a></li></ul><div class='tab-content'><div class='tab-pane active' id='exI0-S0JS'><pre class='CodeRay'><code>:::javascript

function start_detecting_orientation_changes(){
  ScreenOrientation.setScreenOrientationEvent(orientation_callback)
}

function orientation_callback(){

  Alert.show_popup("The screen changed orientation")
}
                   
                            </code></pre></div><div class='tab-pane' id='exI0-S0RUBY'><pre class='CodeRay'><code>:::ruby

def start_detecting_orientation_changes
  Rho::ScreenOrientation.setScreenOrientationEvent(url_for(:action =&gt; :orientation_callback))
end

def orientation_callback
  Alert.show_popup("The screen changed orientation")
end

                            </code></pre></div></div>  </div></div></div></div><a name='e1'></a><div class=' example' id='e1'><div class="accordion-group"><div class="accordion-heading"><span class="accordion-toggle"   href="#cExample1"><strong>Change screen orientation</strong></div><div id="cExample1" class="accordion-body">  <div class="accordion-inner">
<p>Set the screen orientation programmatically. Particularly useful in a tablet: before capturing a signature, set the orientation to upside-down so that the interface will look right from the signer&rsquo;s point of view without having to physically rotate the device.</p>
<ul class='nav nav-tabs' id='exI1-S0Tab'><li class='active'><a href='#exI1-S0JS' data-toggle='tab'>JavaScript</a></li><li ><a href='#exI1-S0RUBY' data-toggle='tab'>Ruby</a></li></ul><div class='tab-content'><div class='tab-pane active' id='exI1-S0JS'><pre class='CodeRay'><code>:::javascript

function capture_signature_with_attention_to_details() {
    // Set screen orientation to upside down
    Rho.ScreenOrientation.upsideDown();

    // At this point, offer the device to the user. You just saved the user the hassle of rotating the tablet
    // and there's less potential for the device to be dropped along the way
    Rho.Signature.takeFullScreen({}, signature_callback);
}

function signature_callback(params) {
    // do whatever we need to do with the signature
    ...
    // restore screen orientation to default
    Rho.ScreenOrientation.normal();
}
                   
                            </code></pre></div><div class='tab-pane' id='exI1-S0RUBY'><pre class='CodeRay'><code>:::ruby

def capture_signature_with_attention_to_details
    # Set screen orientation to upside down
    Rho::ScreenOrientation.upsideDown
    # At this point, offer the device to the user. You just saved the user the hassle of rotating the tablet
    # and there's less potential for the device to be dropped along the way
    Rho::Signature.takeFullScreen({}, url_for(:action =&gt; :signature_callback))
end

def signature_callback
    # do whatever we need to do with the signature
    ...
    # restore screen orientation to default
    Rho::ScreenOrientation.normal
end
                   
                            </code></pre></div></div>  </div></div></div></div><a name='e2'></a><div class=' example' id='e2'><div class="accordion-group"><div class="accordion-heading"><span class="accordion-toggle"   href="#cExample2"><strong>Enable / disable auto rotate</strong></div><div id="cExample2" class="accordion-body">  <div class="accordion-inner">
<p>Enable / disable automatic rotation of the screen according to device orientation.</p>
<ul class='nav nav-tabs' id='exI2-S0Tab'><li class='active'><a href='#exI2-S0JS' data-toggle='tab'>JavaScript</a></li><li ><a href='#exI2-S0RUBY' data-toggle='tab'>Ruby</a></li></ul><div class='tab-content'><div class='tab-pane active' id='exI2-S0JS'><pre class='CodeRay'><code>:::javascript

// Enable autorotate
Rho.ScreenOrientation.autoRotate=true;

// Disable autorotate
Rho.ScreenOrientation.autoRotate=false;
                   
                            </code></pre></div><div class='tab-pane' id='exI2-S0RUBY'><pre class='CodeRay'><code>:::ruby

# Enable autorotate
Rho::ScreenOrientation.autoRotate=true

# Disable autorotate
Rho::ScreenOrientation.autoRotate=false
                   
                            </code></pre></div></div>  </div></div></div></div></div>