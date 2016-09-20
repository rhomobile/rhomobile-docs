#SignalIndicators
<div class="btn-group"><a href="#Methods" class="btn"><i class="icon-cog"></i> Methods<sup>&nbsp;4</sub></a><a class="btn dropdown-toggle" data-toggle="dropdown" data-target="#" href="#Methods" >  <span class="caret"></span>&nbsp;</a><ul class="dropdown-menu" style="max-height: 500px;overflow: auto;"><li class="disabled"><a tabindex="-1" href="#"><b><i>Methods - Class</i></b></a><li><a href="#mhideIcon" data-target="cMethodhideIcon" class="autouncollapse">hideIcon</a></li><li><a href="#mshowIcon" data-target="cMethodshowIcon" class="autouncollapse">showIcon</a></li><li><a href="#mstopWlanStatus" data-target="cMethodstopWlanStatus" class="autouncollapse">stopWlanStatus</a></li><li><a href="#mwlanStatus" data-target="cMethodwlanStatus" class="autouncollapse">wlanStatus</a></li></li></ul></div><div class="btn-group"><a href="#Properties" class="btn"><i class="icon-list"></i> Properties<sup>&nbsp;1</sup></a><button href="#" class="btn dropdown-toggle" data-toggle="dropdown">  <span class="caret"></span>&nbsp;</button><ul class="dropdown-menu" style="max-height: 500px;overflow: auto;"><li class="disabled"><a tabindex="-1" href="#"><b><i>Class Properties</i></b></a><li><a href="#prefreshInterval" data-target="cPropertyrefreshInterval" class="autouncollapse">refreshInterval</a></li></li></ul></div><div class="btn-group"><a href="#Examples" class="btn"><i class="icon-edit"></i> Examples<sup>&nbsp;2</sup></a><button href="#" class="btn dropdown-toggle" data-toggle="dropdown">  <span class="caret"></span>&nbsp;</button><ul class="dropdown-menu" style="max-height: 500px;overflow: auto;"><li><a href="#e0" data-target="eExample0" class="autouncollapse">Retrieve the WLAN status</a></li><li><a href="#e1" data-target="eExample1" class="autouncollapse">Working with the Signal indicator</a></li></ul></div><div class="btn-group"><a href="#Remarks" class="btn"><i class="icon-warning-sign"></i> Remarks<sup>&nbsp;3</sup></a><button href="#" class="btn dropdown-toggle" data-toggle="dropdown">  <span class="caret"></span>&nbsp;</button><ul class="dropdown-menu" style="max-height: 500px;overflow: auto;"><li><a href="#r0" data-target="rRemark0" class="autouncollapse">Icon Layout</a></li><li><a href="#r1" data-target="rRemark1" class="autouncollapse">Overlapping Indicators</a></li><li><a href="#r2" data-target="rRemark2" class="autouncollapse">Screen Orientation</a></li></ul></div><div class="btn-group pull-right"><button class="btn dropdown-toggle" id="apiFilterBtn" data-toggle="dropdown" href="#" title="Filter Properties and Methods"><i class="icon-filter "></i>Show</button><select id="apiFilter" class="dropdown-menu apiFilter"><option value="all">All</option><option value="js">JavaScript</option><option value="ruby">Ruby</option><option value="android">Android</option><option value="ios">iOS</option><option value="wm">Windows Mobile</option><option value="wp8">Windows Phone 8</option><option value="w32">Windows Desktop</option><option value="msi">MSI Only</option></select></div><div  id="apibody" style="overflow:auto;padding-right: 5px;">
<p>The Signal API is used to notify the user of the strength of the WLAN signal.  For Windows Mobile / CE, only Symbol devices are supported and it is also possible to display a small indicator showing the available signal.  The WLAN signal strength is not available on Windows Phone 8 and therefore this API is not supported on that platform.</p>
<h2>Enabling the API</h2>

<p>In order to use this API you must include the following extension in your <code>build.yml</code>.</p>

<pre><code>:::ruby
extensions: ["indicators"]
</code></pre>

<p>The <code>indicators</code> extension is also included automatically if you specify the following in your <code>build.yml</code>.</p>

<pre><code>:::ruby
app_type: "rhoelements"
</code></pre>

<blockquote><p>Note: If you are building a Windows Mobile or Windows CE app with this API, you must set your app_type as &ldquo;rhoelements&rdquo; in your build.yml as shown <a href="../guide/build_config#other-build-time-settings">here</a>.</p></blockquote>

<h2>JavaScript Usage</h2>

<p>Be sure to review the <a href="/guide/api_js">JavaScript API Usage</a> guide for important information about using this API in JavaScript.</p>

<h3>Ruby Usage</h3>

<p>Be sure to review the <a href="/guide/api_ruby">Ruby API Usage</a> guide for important information about using this API in Ruby.</p>


<a name='Methods'></a>
<h2><i class='icon-cog'></i>Methods</h2>

<div class="accordion" id="accordion"><a name ='mhideIcon'/><div class=' method  js ruby android msi' id='mhideIcon'><h3><strong  >hideIcon</strong><span style='font-size:.7em;font-weight:normal;'>()</span></h3><ul class="nav nav-tabs" style="padding-left:8px"><li class='active'><a href="#mhideIcon1" data-toggle="tab">Description</a></li><li ><a href="#mhideIcon4" data-toggle="tab">Return</a></li><li ><a href="#mhideIcon6" data-toggle="tab">Access</a></li></ul><div class='tab-content' style='padding-left:8px' id='tc-hideIcon'><div class="tab-pane fade active in" id="mhideIcon1"><p>Hide the icon if it has been previously set by the &lsquo;showIcon&rsquo; call.</p>
<p><div><p><img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript"><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"><img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"><img src="/img/motowebkit.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Zebra Technologies Devices Only">(All platforms support wlanStatus which can be used to draw your own level indicator or display an appropriate graphic.)</p></div></p></div><div class="tab-pane fade" id="mhideIcon2"></div><div class="tab-pane fade" id="mhideIcon3"></div><div class="tab-pane fade" id="mhideIcon4"><div><p><strong>Synchronous Return:</strong></p><ul><li>Void</li></ul></div></div><div class="tab-pane fade" id="mhideIcon6"><div><p><strong>Method Access:</strong></p><ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li>JavaScript: <code>Rho.SignalIndicators.hideIcon()</code> </li><li>Ruby: <code>Rho::SignalIndicators.hideIcon()</code></li></ul></li></ul></div></div></div>  </div><a name ='mshowIcon'/><div class=' method  js ruby android msi' id='mshowIcon'><h3><strong  >showIcon</strong><span style='font-size:.7em;font-weight:normal;'>(<span class="text-info">HASH</span> propertyMap)</span></h3><ul class="nav nav-tabs" style="padding-left:8px"><li class='active'><a href="#mshowIcon1" data-toggle="tab">Description</a></li><li ><a href="#mshowIcon2" data-toggle="tab">Parameters</a></li><li ><a href="#mshowIcon4" data-toggle="tab">Return</a></li><li ><a href="#mshowIcon6" data-toggle="tab">Access</a></li></ul><div class='tab-content' style='padding-left:8px' id='tc-showIcon'><div class="tab-pane fade active in" id="mshowIcon1"><p>Overlays a small signal icon on top of the view indicating the remaining signal strength. This is particularly useful in full screen applications which cover the system signal level indicator.</p>
<p><div><p><img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript"><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"><img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"><img src="/img/motowebkit.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Zebra Technologies Devices Only">(All platforms support wlanStatus which can be used to draw your own level indicator or display an appropriate graphic.)</p></div></p></div><div class="tab-pane fade" id="mshowIcon2"><div><p><strong>Parameters</strong></p><ul><li>propertyMap : <span class='text-info'>HASH</span><p><p>The properties associated with the indicator, its position and colour.</p>
 </p></li><ul><li>left : <span class='text-info'>INTEGER</span><span class='label '> Default: [Top right of the screen]</span><p><p>The absolute horizontal position of the indicator in pixels. This value is relative to the screen and not the view, so non-fullscreen applications should take care not to display the indicator off screen.</p>
 </p></li><li>top : <span class='text-info'>INTEGER</span><span class='label '> Default: [Top right of the screen]</span><p><p>The absolute vertical position of the indicator in pixels. Positive numbers push the icon towards the bottom of the screen. The value is relative to the screen and not the view, so non-fullscreen applications should take care not to display the indicator off screen.</p>
 </p></li><li>layout : <span class='text-info'>STRING</span><span class='label '> Default: [Right]</span><p><p>Sets the orientation of the icon, see the remarks section for illustrations.</p>
 </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>Constant: Rho::SignalIndicators.SIGNAL_LAYOUT_LEFT (For Ruby use "::" for all "." when referencing constants)<br/> String:left</dt><dd><p>See the remarks section for illustrations of icon layout</p>
</dt><dt>Constant: Rho::SignalIndicators.SIGNAL_LAYOUT_RIGHT (For Ruby use "::" for all "." when referencing constants)<br/> String:right</dt><dd><p>See the remarks section for illustrations of icon layout</p>
</dt><dt>Constant: Rho::SignalIndicators.SIGNAL_LAYOUT_UP (For Ruby use "::" for all "." when referencing constants)<br/> String:up</dt><dd><p>See the remarks section for illustrations of icon layout</p>
</dt><dt>Constant: Rho::SignalIndicators.SIGNAL_LAYOUT_DOWN (For Ruby use "::" for all "." when referencing constants)<br/> String:down</dt><dd><p>See the remarks section for illustrations of icon layout</p>
</dt></dl></li><li>color : <span class='text-info'>STRING</span><span class='label '> Default: #000000</span><p><p>The color of the icon. This value must be specified as a Hex value in the format #000000 to #FFFFFF. Alpha values are not supported, i.e. you can only use the component parts RRGGBB.</p>
 </p></li></ul></ul></div></div><div class="tab-pane fade" id="mshowIcon3"></div><div class="tab-pane fade" id="mshowIcon4"><div><p><strong>Synchronous Return:</strong></p><ul><li>Void</li></ul></div></div><div class="tab-pane fade" id="mshowIcon6"><div><p><strong>Method Access:</strong></p><ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li>JavaScript: <code>Rho.SignalIndicators.showIcon(<span class="text-info">HASH</span> propertyMap)</code> </li><li>Ruby: <code>Rho::SignalIndicators.showIcon(<span class="text-info">HASH</span> propertyMap)</code></li></ul></li></ul></div></div></div>  </div><a name ='mstopWlanStatus'/><div class=' method  js ruby android ios' id='mstopWlanStatus'><h3><strong  >stopWlanStatus</strong><span style='font-size:.7em;font-weight:normal;'>()</span></h3><ul class="nav nav-tabs" style="padding-left:8px"><li class='active'><a href="#mstopWlanStatus1" data-toggle="tab">Description</a></li><li ><a href="#mstopWlanStatus4" data-toggle="tab">Return</a></li><li ><a href="#mstopWlanStatus6" data-toggle="tab">Access</a></li></ul><div class='tab-content' style='padding-left:8px' id='tc-stopWlanStatus'><div class="tab-pane fade active in" id="mstopWlanStatus1"><p>If the signal is being retrieved via callback, by a previously invoked call to wlanStatus, this method will stop the callback from firing.</p>
<p><div><p><img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript"><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"><img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android"><img src="/img/ios.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="iphone, ipod touch, ipad"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"></p></div></p></div><div class="tab-pane fade" id="mstopWlanStatus2"></div><div class="tab-pane fade" id="mstopWlanStatus3"></div><div class="tab-pane fade" id="mstopWlanStatus4"><div><p><strong>Synchronous Return:</strong></p><ul><li>Void</li></ul></div></div><div class="tab-pane fade" id="mstopWlanStatus6"><div><p><strong>Method Access:</strong></p><ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li>JavaScript: <code>Rho.SignalIndicators.stopWlanStatus()</code> </li><li>Ruby: <code>Rho::SignalIndicators.stopWlanStatus()</code></li></ul></li></ul></div></div></div>  </div><a name ='mwlanStatus'/><div class=' method  js ruby android ios' id='mwlanStatus'><h3><strong  >wlanStatus</strong><span style='font-size:.7em;font-weight:normal;'>(<span class='text-info'>CallBackHandler</span> callback)</span></h3><ul class="nav nav-tabs" style="padding-left:8px"><li class='active'><a href="#mwlanStatus1" data-toggle="tab">Description</a></li><li ><a href="#mwlanStatus2" data-toggle="tab">Parameters</a></li><li ><a href="#mwlanStatus3" data-toggle="tab">Callback</a></li><li ><a href="#mwlanStatus4" data-toggle="tab">Return</a></li><li ><a href="#mwlanStatus6" data-toggle="tab">Access</a></li></ul><div class='tab-content' style='padding-left:8px' id='tc-wlanStatus'><div class="tab-pane fade active in" id="mwlanStatus1"><p>Retrieve the current signal status. If a callback is provided to retrieve the signal then it will be called periodically at the specified refreshInterval. On Android, instead of being called periodically, the callback will be called when one of the below values changes.</p>
<p><div><p><img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript"><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"><img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android"><img src="/img/ios.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="iphone, ipod touch, ipad"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"></p></div></p></div><div class="tab-pane fade" id="mwlanStatus2"><div><p><strong>Parameters</strong></p><ul><li>callback : <span class='text-info'>CallBackHandler</span> <span class='label label-info'>Optional</span> </li></ul></div></div><div class="tab-pane fade" id="mwlanStatus3"><div><p><strong>Async Callback Returning Parameters: <span class='text-info'>HASH</span></strong></p><ul><ul><li>signalStrength : <span class='text-info'>INTEGER</span><p><p>The signal strength as a value between 0 and 100. Not supported on iOS</p>
 Platforms:WM, CE, Android </p></li><li>essid : <span class='text-info'>STRING</span><p><p>The current ESSID</p>
 </p></li><li>macAddress : <span class='text-info'>STRING</span><p><p>The Device&rsquo;s MAC address</p>
 </p></li><li>adapterName : <span class='text-info'>STRING</span><p><p>The Device&rsquo;s adapter name</p>
 </p></li><li>dhcpServer : <span class='text-info'>STRING</span><p><p>The current DHCP server&rsquo;s address. Always populated on Android, even on static IP configurations. Not supported on iOS</p>
 Platforms:WM, CE, Android </p></li><li>dhcpStatic : <span class='text-info'>STRING</span><p><p>Whether the unit has a static or DHCP address. Not available on Android and iOS.</p>
 Platforms:WM </p></li><li>gateway : <span class='text-info'>STRING</span><p><p>The current gateway IP address</p>
 </p></li><li>ipAddress : <span class='text-info'>STRING</span><p><p>The device&rsquo;s IP address</p>
 </p></li><li>rssi : <span class='text-info'>STRING</span><p><p>Signal strength in RSSI terms. Not supported on iOS.</p>
 Platforms:WM, CE, Android </p></li><li>subnetMask : <span class='text-info'>STRING</span><p><p>The current subnet mask</p>
 </p></li><li>wins : <span class='text-info'>STRING</span><p><p>The current WINs server IP address. Not available on Android and iOS.</p>
 Platforms:WM </p></li></ul></ul></div></div><div class="tab-pane fade" id="mwlanStatus4"><div><p><strong>Synchronous Return:</strong></p><ul><li>HASH : this method also supports async callbacks - check the Callback tab for callback return parameters.<ul><li>signalStrength : <span class='text-info'>INTEGER</span><p><p>The signal strength as a value between 0 and 100. Not supported on iOS</p>
 Platforms:WM, CE, Android </p></li><li>essid : <span class='text-info'>STRING</span><p><p>The current ESSID</p>
 </p></li><li>macAddress : <span class='text-info'>STRING</span><p><p>The Device&rsquo;s MAC address</p>
 </p></li><li>adapterName : <span class='text-info'>STRING</span><p><p>The Device&rsquo;s adapter name</p>
 </p></li><li>dhcpServer : <span class='text-info'>STRING</span><p><p>The current DHCP server&rsquo;s address. Always populated on Android, even on static IP configurations. Not supported on iOS</p>
 Platforms:WM, CE, Android </p></li><li>dhcpStatic : <span class='text-info'>STRING</span><p><p>Whether the unit has a static or DHCP address. Not available on Android and iOS.</p>
 Platforms:WM </p></li><li>gateway : <span class='text-info'>STRING</span><p><p>The current gateway IP address</p>
 </p></li><li>ipAddress : <span class='text-info'>STRING</span><p><p>The device&rsquo;s IP address</p>
 </p></li><li>rssi : <span class='text-info'>STRING</span><p><p>Signal strength in RSSI terms. Not supported on iOS.</p>
 Platforms:WM, CE, Android </p></li><li>subnetMask : <span class='text-info'>STRING</span><p><p>The current subnet mask</p>
 </p></li><li>wins : <span class='text-info'>STRING</span><p><p>The current WINs server IP address. Not available on Android and iOS.</p>
 Platforms:WM </p></li></ul></li></ul></div></div><div class="tab-pane fade" id="mwlanStatus6"><div><p><strong>Method Access:</strong></p><ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li>JavaScript: <code>Rho.SignalIndicators.wlanStatus(<span class='text-info'>CallBackHandler</span> callback)</code> </li><li>Ruby: <code>Rho::SignalIndicators.wlanStatus(<span class='text-info'>CallBackHandler</span> callback)</code></li></ul></li></ul></div></div></div>  </div></div>
<a name='Properties'></a>
<h2><i class='icon-list'></i>Properties</h2>

<a name='prefreshInterval'></a><div class=' method  js ruby ios' id='prefreshInterval'><h3><strong  >refreshInterval</strong><span style='font-size:.7em;font-weight:normal;'> : <span class='text-info'>INTEGER</span>  <span class='muted pull-right'>1.0.0</span></span></h3><ul class="nav nav-tabs" style="padding-left:8px"><li class='active'><a href="#prefreshInterval1" data-toggle="tab">Description</a></li><li ><a href="#prefreshInterval2" data-toggle="tab">Params</a></li><li ><a href="#prefreshInterval6" data-toggle="tab">Access</a></li></ul><div class='tab-content' style='padding-left:8px' id='tc-refreshInterval'><div class="tab-pane fade active in" id="prefreshInterval1"><p>A callback to retrieve the signal strength can be specified to occur periodically with the wlanStatus method. This value specifies the periodicity of the callback as well as the update frequency of the indicator icon, if shown. On Android this value is not used as the signal icon will be updated as soon as the signal strength changes.</p>
<p><div><p><img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript"><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"><img src="/img/ios.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="iphone, ipod touch, ipad"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"> </p></div></p></div><div class="tab-pane fade" id="prefreshInterval2"><p><strong>Default:</strong> 5000</p></div><div class="tab-pane fade" id="prefreshInterval5"></div><div class="tab-pane fade" id="prefreshInterval6"><div><p><strong>Property Access:</strong></p><ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.refreshInterval</code></li></ul></li></ul></div></div></div>  </div>
<a name='Examples'></a>
<h2><i class='icon-edit'></i>Examples</h2>

<a name='e0'></a><div class=' example' id='e0'><div class="accordion-group"><div class="accordion-heading"><span class="accordion-toggle"   href="#cExample0"><strong>Retrieve the WLAN status</strong></div><div id="cExample0" class="accordion-body">  <div class="accordion-inner">
<p>Synchronously: If you are only interested in the current signal state, for example to decide whether to perform some online operation then you can immediately determine the WLAN status as follows</p>
<ul class='nav nav-tabs' id='exI0-S0Tab'><li class='active'><a href='#exI0-S0JS' data-toggle='tab'>JavaScript</a></li><li ><a href='#exI0-S0RUBY' data-toggle='tab'>Ruby</a></li></ul><div class='tab-content'><div class='tab-pane active' id='exI0-S0JS'><pre class='CodeRay'><code>:::javascript

  function signal_status_sync(){

    signalValue = Rho.SignalIndicators.wlanStatus;
    console.log(signalValue);
    console.log("Signal Strength is: " + signalValue['signalStrength']);
  }
                    
                            </code></pre></div><div class='tab-pane' id='exI0-S0RUBY'><pre class='CodeRay'><code>:::ruby

  def signal_status_sync
    signalValue = Rho::SignalIndicators.wlanStatus
    puts signalValue
    puts "Signal Strength is: " + signalValue['signalStrength']
  end
                    
                            </code></pre></div></div>
<p>Asynchronously:  If you want to be notified of changes to the WLAN signal then you can register to receive values through a callback</p>
<ul class='nav nav-tabs' id='exI0-S1Tab'><li class='active'><a href='#exI0-S1JS' data-toggle='tab'>JavaScript</a></li><li ><a href='#exI0-S1RUBY' data-toggle='tab'>Ruby</a></li></ul><div class='tab-content'><div class='tab-pane active' id='exI0-S1JS'><pre class='CodeRay'><code>:::javascript

  function signal_status_async(){
    console.log("Registering Signal Callback");
    Rho.SignalIndicators.wlanStatus(signalEvent);
  }

  function signalEvent(params){
    console.log("Signal Event: (Asynchronous).  Strength: " + params["signalStrength"] + ", ESS ID: " + params["essid"] + ", MacAddress: " + params["macAddress"] + ", AdapterName: " + params["adapterName"] + ", DHCP Server: " + params["dhcpServer"] + ", DHCP Static: " + params["dhcpStatic"] + ", Gateway: " + params["gateway"] + ", IP Address: " + params["ipAddress"] + ", RSSI: " + params["rssi"] + ", Subnet Mask: " + params["subnetMask"] + ", Wins: " + params["wins"]);
  }
  
                            </code></pre></div><div class='tab-pane' id='exI0-S1RUBY'><pre class='CodeRay'><code>:::ruby

  def signal_status_async
    puts "Registering Signal Callback"
    Rho::SignalIndicators.wlanStatus(url_for(:action =&gt; :signalEvent))
  end

   def signalEvent
    puts "Signal Event: (Asynchronous).  Strength: #{@params["signalStrength"]}, ESS ID: #{@params["essid"]}, MacAddress: #{@params["macAddress"]}, AdapterName: #{@params["adapterName"]}, DHCP Server: #{@params["dhcpServer"]}, DHCP Static: #{@params["dhcpStatic"]}, Gateway: #{@params["gateway"]}, IP Address: #{@params["ipAddress"]}, RSSI: #{@params["rssi"]}, Subnet Mask: #{@params["subnetMask"]}, Wins: #{@params["wins"]}"
  end
  
                            </code></pre></div></div>  </div></div></div></div><a name='e1'></a><div class=' example' id='e1'><div class="accordion-group"><div class="accordion-heading"><span class="accordion-toggle"   href="#cExample1"><strong>Working with the Signal indicator</strong></div><div id="cExample1" class="accordion-body">  <div class="accordion-inner">
<p>If you just want to display the signal indicator in the default position and default colour then call as follows</p>
<ul class='nav nav-tabs' id='exI1-S0Tab'><li class='active'><a href='#exI1-S0JS' data-toggle='tab'>JavaScript</a></li><li ><a href='#exI1-S0RUBY' data-toggle='tab'>Ruby</a></li></ul><div class='tab-content'><div class='tab-pane active' id='exI1-S0JS'><pre class='CodeRay'><code>:::javascript

  function show_signal_icon(){
    Rho.SignalIndicators.showIcon({});
  }
                    
                            </code></pre></div><div class='tab-pane' id='exI1-S0RUBY'><pre class='CodeRay'><code>:::ruby

  def show_signal_icon
    Rho::SignalIndicators.showIcon({})
  end
                    
                            </code></pre></div></div>
<p>To display the signal icon at the default position but blue and vertical specify as follows</p>
<ul class='nav nav-tabs' id='exI1-S1Tab'><li class='active'><a href='#exI1-S1JS' data-toggle='tab'>JavaScript</a></li><li ><a href='#exI1-S1RUBY' data-toggle='tab'>Ruby</a></li></ul><div class='tab-content'><div class='tab-pane active' id='exI1-S1JS'><pre class='CodeRay'><code>:::javascript

  function show_signal_icon(){
    Rho.SignalIndicators.showIcon({color:'#0000FF',layout: Rho.SignalIndicators.SIGNAL_LAYOUT_UP});
  }
  
                            </code></pre></div><div class='tab-pane' id='exI1-S1RUBY'><pre class='CodeRay'><code>:::ruby

  def show_signal_icon
    Rho::SignalIndicators.showIcon({color:'#0000FF',layout: Rho::SignalIndicators.SIGNAL_LAYOUT_UP})
  end
  
                            </code></pre></div></div>  </div></div></div></div>
<a name='Remarks'></a>
<h2><i class='icon-warning-sign'></i>Remarks</h2>

<a name='r0'></a><div class=' remarks' id='r0'><div class="accordion-group"><div class="accordion-heading"><span class="accordion-toggle"  href="#cRemark0"><strong>Icon Layout</strong></div><div id="cRemark0" class="accordion-body">  <div class="accordion-inner"><p>Windows Mobile / CE and Handheld devices support the display of a small signal icon, this section explains the layout parameter which can be provided to showIcon(&hellip;).</p>

<h2>Layout:Left</h2>

<p><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAI4AAABjCAIAAADCRa8DAAAAAXNSR0IArs4c6QAAAAZiS0dEAAAAAAAA+UO7fwAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB9sIBQsDMysrIIsAAAOXSURBVHja7ZztceIwEEDFDb8ZV5BJBQkdABUkVJDQAVTgpALTQZwKSAcmHXhSAelAQwPcDzIgryzjT87KvTf+E4/ONvvYXVn2MTgcDurKfH+r3U5BRYb/4JxxrF5eCH1V/hACVAGqUAWogrZmgGmqlsumh1mv1XhMNDtWpbX6/Gx6GK0JJQXwiqxWar/PbLe3/TkFqjwqgIIwLPtPX187vK75XL2/Z/ZEkfPaVit5MWGoosh52atVZs/NTYUCvt/X+Th3d83X0ixV5Zd8OlWVJEprFQTnPbOZU5U9oymY48xmmT/T1JdG29cCqLVKEhl909yJIFDz+QUf5mBhcbNhWtGYNC0lIHenrcQ12PxCRJEajTJb608AGpyix6pEVrnKmqvW5SoUg7XO+UJU4u1Nhj53a0N5v7NKfMLyWXWcmFwcbH8bKIA1EY3EbleuQldy8HYrRYqbntZpcIp+q7rYrhYLWY4KBtv558+coveqLrYr80+tpSoxeDr1dJrugyp7yl6QKJuNjL4YLLqXV41KebCwJNqJ2YFENzqONAUUDLaPXI/FQvYesX19+aAqTdV2e97qTYvt7/4pV3Kncx8fpQbb+dp7unxjabnMPF6ZTutE51jTzIQYj3+mA2ZBO5U+cYrHx5/Bom/55kn5sbIu5mnH/BAz71PoxV2tK6sa3vn+tqxqsV2Zk/Jj1ykIfZKcLZ6MikbVVlYliXp4IKsK25WYppuZZ9/Y2l49zCofVNkrdeNxJvrC5fEBijnY/0alvHkKLNrVfJ6Jvp0ipozcrELVlWqgeB/BzhJTRhB01ahQ5ZyylyyPqnBxb7Px9P0qf16DcaVCrpXdzlnl/Kx+XqlyrQO59rvU+ln9vFLlqmmu0OdmT/PHvqiqM2Uv7mG5Cr16QOWtqtzoF1QzcV9cXC1R1Xm7Kq5mxfdbvjH0LKtGowrjo8j5jm3t41e6gOYfwdes+r9BFaoAVagCVNmEoToc2KpuZBX3Vbk3pK7/CuDi/l6t1zn7qx7H5ulJPT+jyoHWldd1XL+q1nx9aDKhVwGqUEUIUAWoQhWgClCFKkAVoApV0CuGhOBMHKs4bnqQzl41RJXBbtfCz/hSAAFVqAJUoQpQBahCFaAKUIUqQBXUguXaq9D816eDAFVXQfw2bA0mEwogvQpQhSpAFaAKVYAqQBWqAFWAKlQBqgBVqAJUAapQBagCN9ZrMIMBQSGrAFWogl7xF92qR0MwnLlVAAAAAElFTkSuQmCC" title="Signal Indicator" alt="Left Layout Signal Indicator" /></p>

<h2>Layout:Right</h2>

<p><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAI4AAABjCAIAAADCRa8DAAAAAXNSR0IArs4c6QAAAAZiS0dEAAAAAAAA+UO7fwAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB9sIBQsDEIlMUfkAAAOXSURBVHja7Z3dbeowFIDdKx4jlAl6O0HFBvRO0LIBbAATABOkG7SdgG4QukHaCTJChHjnPlBR5zg2+XNo2u+TXxpZCfjLOcd2gF6lafo3TRVUZTzu+oqH1eqgFK1y65w/hEdfQBWqAFWogu/OgCHwzT5Jgvm86UkeH1HlnSDL1Ntb85N84wS4WKjdLtdubvp3CWoVtcrCZKJeXnJHokgtl9Zbdb3OHVkuVRQVd16v1WKRO3J9rbKs7Mvf7eq86dtbdcG9NNu4FQ5OZVVxrLJMheHXkX//rJccjc4f0c+jkyQVPPWU1aqeqnIJMMtUHMvR182dCEM1mZzxoXcWFjcbEl3jWpUkpQQUHjSV2DrrN0QUqeEw11rPWh1c4gKqRFTZ0pot1xUqFJ2zrOCGqMTTkxz6wtbPhz5Vokq8w/JRdZyYnO1s3g1Qc7IuColZrmyJrmTn7VaKFIue1ungEpdRdbZczWYyHTk6m/HHnKI1VWfLlf5nlklVovPd3a+bpnenypyyOwJls5GjLzqL6kWhalOVWU70CiSq0bGnLsDR2TxzPWYzWXtE+/j4NarMe/8UK4XTudfXUp3NeO0J+yRR2+2p7RsuNpxUfAhyzGl6QIxGn9MBPaGdUp8Q8PDw2VnUrd5mv2Cx0PNBMB63kx5aiCpznnaMDzHzPg29WNXaosrnzfhjqP5ocbvNTcqPVccx9HH8ZfFkVBSqtqIqjtX9PdMKZ7kS03Q98syFremVqPKiytypG41yoy9cHh+g6J1/SqH69qrMcjWZ5EbfDBFdRmFUgS9VIg7E5xHMKNFlhKGvQoUq65S9ZHpUzs29zYb9JJ+qHKFQaCVNrVmO7OddlW2hZztuU0v2867KltNsQ18YPc0f+6KqzpTdXcMKFfKAqgtVhaPvyGZiXezOltCyKnOg3dnMvd6CcwwaRdVwWKF/FFk/Y1v7/JVeQPO30NeoAlQBqlAFqIK8quVSHQ60yo2oAg/rqkvx/Cy/QtnKVotSaj5X7+/VztPhHmYPVaWprx2pJGn+VXgSIKAKVYAqVAGqAFWoAlQBqlAFqIJ6+NyuFb9MUYPpVE2nSPKvqvkudXPZJEBAFaAKVYAqQBWqAFWAKlQBqlAFPWGwT5Kg2U/n7MMwcPyDFmhLVTCfN9wC9/oroEACRBWgClCFKkAVqgBVgCpUAaoAVagCVAGqUAWoAlShClAFJRgwBF1zdUVUkQABVVCJ/62iI55gpej+AAAAAElFTkSuQmCC" title="Signal Indicator" alt="Right Layout Signal Indicator" /></p>

<h2>Layout:Up</h2>

<p><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGMAAACOCAIAAACqgyGeAAAAAXNSR0IArs4c6QAAAAZiS0dEAAAAAAAA+UO7fwAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB9sIBQsCFnk0xY0AAANcSURBVHja7Z3bbatAEIaXozxHlEAFCR2AG4hCB04FkStIUkHSgUsgqcCkA5fgElAaIA9Y+IZhl90c9vL9QpZMJJt8mpmdmR1D1Gw2Ah0rjkWa9pxvOM6OLGv69A8bkhSkIPW3pJom0OPlBZvC+yAFKUhBCkEKUpCCFKQgBSkkpZuTd1EEEWwKUpCyL06xi3WmOO49HTVNAxy8D1KQghSkQlLUZJn//+XHR//4ilo+9f3tP6m6xvuIU5Byue6zvwrTDsbXSjm/SKWpJTU83ueNTXV6e5vz25dL6yd583w/uzvvZVQV3kecghSkIAUpSCFIQQpSkLJNcSyKwqMK2bjSVCwW+9c4FmU5RsryvZn7e8Pm09IpCpEkil2XqgrFfPJcLBaTP8Nf72vNJ89FUYTRHZ5mPkVhoPvuIal28Wqda4L5bLcyrXqXSXWhZ4L5tHTaV7kdZpdJfX39NZ2Q8ik9OqekLJ/Wz3Pl/b7dTpSlETq+21SSHPImc7A89b40PYT57VaU5d4HNRTZPmPded9llGiTJvm1r673vNZrZUOrKpdJ6aTjqpHeE1IDHQIZteH//T0wUpPd8/Y2YFJK7jlGKoyeZ12LshTPz+LhQazXZAmDBvX4OLF+9p+UTv3sP6kkOURxSfPpkiz/SXWtcSXzUU/cXSa1Wu33Dui6jEhm8rN1rs9PE10XL3OCznb0quJjsYccQi/h5+f/2Zfb1YwMqctMvaqmxCy3SensfYbbdenyKfmk4Yza8A11PewlTEtEpbouEjcnnrlAWS4ndl2UunrjpFy5W4nmbttowQypHvfsHWKA1Lh7tu0HSMka2nCuwK/WDkkpdZ8p3YjX1znXfs3lbLK6qZDV6uT89V2/mTLPLFOexNWv+3pzgrMPuRbXiVPyghSkIDXf2ueuhrNqSd3dBUDKiHY7vI84BSlIsfbNLp1qRn0lxabwPkhBioj+d5L5jdZxt+9yavjpSf7bXO7kqa6Pl6vb8F+PRSePOAUpSLmw9vG8GWwKUpCCFNWMC5LeUAielPQmlQSpPDd2WSYegGMtR6NP5jF3ExULfZOIHkKccnjSbLMxGfXOr5RJMzJPSEEKebv2MWlmZ/KJ9xGnIAUpSEEKUghSkIIUpFytkA0+mcfEw0qs1S9R7tiZjYt9FQAAAABJRU5ErkJggg==" title="Signal Indicator" alt="Up Layout Signal Indicator" /></p>

<h2>Layout:Down</h2>

<p><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGMAAACOCAIAAACqgyGeAAAAAXNSR0IArs4c6QAAAAZiS0dEAAAAAAAA+UO7fwAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB9sIBQsED0sFyssAAAOESURBVHja7Z3RcYJAEIaXDM8ZSqCCDB2AHeQ60BKoIEkF2oElkFQgSQWWYAmMDVweIChE5DgW4e7+fxgf1DDyze7e7t4GPBnHxKXdjqKIJtLHB82o9dqTjKc7HChJpvqtnjcnqTx/IkhNIAVSIAVSIAVSIAWBFEiB1KMUBCRE77d8dwFFEa1W1WsQUJaBVNN8SjpCUBgO+lPfIfNJElqttM/hW24+SUJCUBCMP59vp/kIwd5T9C0xHyEq59Iwn+ORDgerSdWhR8N8Sjrla1HYblNfX1PTcWntG0enSYpxb4ZjiWHQ6URZxkKnSSrPbbOjMLzkTXywPCmlGdf/fxfrfFZ1wCyrfFBbeW4yqTJpUl/7iqLitd8PNjSzSY1Jx4dGektI3ekQqKgM/9utY6S03fP52WFSg9yzn9Qslx3Hg7MTlgmOKKLNhjYbDVIO9KdKg3p91ayf7a9mxtTP9pMKw0sUVzSfOsmyn1TdGh9kPsMTd5NJpWm1d4CuS49UJj9L5/r85Oi62Kc69IysipvCHrJ618XczFOl68JlX2bn6Ir9qWtqWUZ5rhOzzCY1Zu9Tp+tiR91X51PqSUOL2tubYxWyXiLqei9hUFfP6V7C8XhZ70YXzI71p6h7iKHPpkjSHEccy6Ga4mdEkUxT+fMjz+eeb7pOqj6CoJcUqpm/pBR1H5cMn5/SVj1alqaN97t3/Tx5PzedSGFI6/Wj676b2VPrJF0roNn7fY8lhTiFTh5IYe0bEWvG6OXFAVIsOp2USb2/L/pKNPKJiSQXfiTJI+q+3gNZAtY+rH1cOfrwlRQ2Be8DKZBCRJ9OCv/o2ej27fftT28OEXfIW3p3KkkqInq7WNfr4//V7f6n10LmiTgFUiAFUiAFUhBIgRSqGR4pbyg4T0p5k8p5UnwcfTJlgmNu30REd8H7Hj1phvmpm++3hP4U4hRIzRnRp3tCDIuiiHa7ZZD6/jYskPdG32mST0yaqSafiFOI6CAFUiAFUiAFgRRIgRRIgZTdMqdCnruLDZtS1eInYoOA4Sav2+34kyze+4qC4UkTHI9ygPeBFEjNlyUwPplnycsCw9rn8qwLvA+kQAqkQMrNLMG+p9JNVGlKHGp30IT3IU6B1DJISenooXCrTtgUvA+kQAqkQAqkIJACKZACKZACKYioPevC9UQl2BRIQSDFGadU7h/qlDoGY34BQ9/qdocP8aYAAAAASUVORK5CYII=" title="Signal Indicator" alt="Down Layout Signal Indicator" /></p>
  </div></div></div></div><a name='r1'></a><div class=' remarks' id='r1'><div class="accordion-group"><div class="accordion-heading"><span class="accordion-toggle"  href="#cRemark1"><strong>Overlapping Indicators</strong></div><div id="cRemark1" class="accordion-body">  <div class="accordion-inner"><p>The position of the signal and battery indicators should not be set to overlap</p>
  </div></div></div></div><a name='r2'></a><div class=' remarks' id='r2'><div class="accordion-group"><div class="accordion-heading"><span class="accordion-toggle"  href="#cRemark2"><strong>Screen Orientation</strong></div><div id="cRemark2" class="accordion-body">  <div class="accordion-inner"><p>The indicator positions are absolute and so when rotating the screen you should also move the indicator positions accordingly to accommodate the new screen layout.</p>
  </div></div></div></div></div>