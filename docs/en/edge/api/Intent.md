#Intent
<div class="btn-group"><a href="#Methods" class="btn"><i class="icon-cog"></i> Methods<sup>&nbsp;3</sub></a><a class="btn dropdown-toggle" data-toggle="dropdown" data-target="#" href="#Methods" >  <span class="caret"></span>&nbsp;</a><ul class="dropdown-menu" style="max-height: 500px;overflow: auto;"><li class="disabled"><a tabindex="-1" href="#"><b><i>Methods - Class</i></b></a><li><a href="#msend" data-target="cMethodsend" class="autouncollapse">send</a></li><li><a href="#mstartListening" data-target="cMethodstartListening" class="autouncollapse">startListening</a></li><li><a href="#mstopListening" data-target="cMethodstopListening" class="autouncollapse">stopListening</a></li></li></ul></div><div class="btn-group"><a href="#Examples" class="btn"><i class="icon-edit"></i> Examples<sup>&nbsp;2</sup></a><button href="#" class="btn dropdown-toggle" data-toggle="dropdown">  <span class="caret"></span>&nbsp;</button><ul class="dropdown-menu" style="max-height: 500px;overflow: auto;"><li><a href="#e0" data-target="eExample0" class="autouncollapse">Plot a location on a map</a></li><li><a href="#e1" data-target="eExample1" class="autouncollapse">Sending Extras</a></li></ul></div><div class="btn-group"><a href="#Remarks" class="btn"><i class="icon-warning-sign"></i> Remarks<sup>&nbsp;1</sup></a><button href="#" class="btn dropdown-toggle" data-toggle="dropdown">  <span class="caret"></span>&nbsp;</button><ul class="dropdown-menu" style="max-height: 500px;overflow: auto;"><li><a href="#r0" data-target="rRemark0" class="autouncollapse">Registering Intent Receiver</a></li></ul></div><div class="btn-group pull-right"><button class="btn dropdown-toggle" id="apiFilterBtn" data-toggle="dropdown" href="#" title="Filter Properties and Methods"><i class="icon-filter "></i>Show</button><select id="apiFilter" class="dropdown-menu apiFilter"><option value="all">All</option><option value="js">JavaScript</option><option value="ruby">Ruby</option><option value="android">Android</option><option value="ios">iOS</option><option value="wm">Windows Mobile</option><option value="wp8">Windows Phone 8</option><option value="w32">Windows Desktop</option><option value="msi">MSI Only</option></select></div><div  id="apibody" style="overflow:auto;padding-right: 5px;">
<p>The Intent API provides an inter-application broadcast message-passing framework.</p>
<h2>Enabling the API</h2>

<p>This API is part of the <code>coreapi</code> extension that is included automatically.</p>

<pre><code>:::ruby
extensions: ["coreapi"]
</code></pre>

<h2>JavaScript Usage</h2>

<p>Be sure to review the <a href="/guide/api_js">JavaScript API Usage</a> guide for important information about using this API in JavaScript.</p>

<h2>Ruby Usage</h2>

<p>Be sure to review the <a href="/guide/api_ruby">Ruby API Usage</a> guide for important information about using this API in Ruby.</p>


<a name='Methods'></a>
<h2><i class='icon-cog'></i>Methods</h2>

<div class="accordion" id="accordion"><a name ='msend'/><div class=' method  js ruby android ios' id='msend'><h3><strong  >send</strong><span style='font-size:.7em;font-weight:normal;'>(<span class="text-info">HASH</span> params, <span class='text-info'>CallBackHandler</span> callback)</span></h3><ul class="nav nav-tabs" style="padding-left:8px"><li class='active'><a href="#msend1" data-toggle="tab">Description</a></li><li ><a href="#msend2" data-toggle="tab">Parameters</a></li><li ><a href="#msend3" data-toggle="tab">Callback</a></li><li ><a href="#msend4" data-toggle="tab">Return</a></li><li ><a href="#msend6" data-toggle="tab">Access</a></li></ul><div class='tab-content' style='padding-left:8px' id='tc-send'><div class="tab-pane fade active in" id="msend1"><p>Sends an intent. The receiver of the intent can either be another RhoMobile  application that is listening for this Intent characteristic or on Android can be a native Android application setup with an Intent-Filter that will trigger based on the parameters of this method.</p>

<p><strong>Android Note</strong>: On Android, the callback should be used only when the intentType is set to START_ACTIVITY. The only valid way for an Android app to pass a private file from a package directly to another application is to set the &lsquo;uri&rsquo; parameter with content URI:</p>

<p>Sample JavaScript:</p>

<pre><code>:::javascript
var params = {
    intentType: Rho.Intent.START_ACTIVITY,
    action: "ACTION_VIEW",
    uri: "content://com.rhomobile.sample/rhodata/apps/public/sample.pdf"
}
Rho.Intent.send(params);
</code></pre>

<p>In most cases the extension of the exported file also must be added to the &lsquo;android:no_compression&rsquo; list in the <code>build.yml:</code></p>

<p>Sample Build.yml</p>

<pre><code>:::ruby
android:
  no_compression: ['pdf','html','css']
</code></pre>
<p><div><p><img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript"><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"><img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android"><img src="/img/ios.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="iphone, ipod touch, ipad"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"></p></div></p></div><div class="tab-pane fade" id="msend2"><div><p><strong>Parameters</strong></p><ul><li>params : <span class='text-info'>HASH</span><p><p>A hash-map with intent parameters.</p>
 </p></li><ul><li>intentType : <span class='text-info'>STRING</span><p><p>Type of Intent to send.</p>
 </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>Constant: Intent.BROADCAST (For Ruby use "::" for all "." when referencing constants)<br/> String:broadcast</dt><dd><p>Use the intent as broadcast intent.</p>
</dt><dt>Constant: Intent.START_ACTIVITY (For Ruby use "::" for all "." when referencing constants)<br/> String:startActivity</dt><dd><p>Use the intent to start a UI activity.</p>
 Platforms: <p>Android</p>
</dt><dt>Constant: Intent.START_SERVICE (For Ruby use "::" for all "." when referencing constants)<br/> String:startService</dt><dd><p>Use the intent to start a background service.</p>
 Platforms: <p>Android</p>
</dt></dl></li><li>permission : <span class='text-info'>STRING</span><p><p>Permission used to send a broadcast intent.</p>
 Platforms:Android </p></li><li>action : <span class='text-info'>STRING</span><p><p>Intent action. See  <a href="http://developer.android.com/reference/android/content/Intent.html#setAction(java.lang.String))">Android docs</a> for possible values. Use the Constant Value instead of the actual Constant Name. For example, for the Constant <a href="http://developer.android.com/reference/android/content/Intent.html#ACTION_PICK)">ACTION_PICK</a> use &lsquo;android.intent.action.PICK&rsquo; instead.</p>
 Platforms:Android </p></li><li>categories : <span class='text-info'>ARRAY</span><p><p>List of intent categories. See  <a href="http://developer.android.com/reference/android/content/Intent.html#addCategory(java.lang.String\)"> Android docs</a>  for possible values. Use the Constant Value instead of the actual Constant Name. For example, for the Constant  <a href="http://developer.android.com/reference/android/content/Intent.html#CATEGORY_HOME)">CATEGORY_HOME</a>  use &lsquo;android.intent.category.HOME&rsquo; instead.</p>
 Platforms:Android </p></li><ul><li><i>Object<i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>appName : <span class='text-info'>STRING</span><p><p>Explicit name of the application to run on the device. The platform will determine the value to use.</p>

<ul>
<li>iOS it is BundleURLScheme of executed application.</li>
<li>Android it is application package name.</li>
<li>Windows it is the application/executable name. For shared runtime based applications, the application name is taken from the &ldquo;Name&rdquo; attribute from the Config.xml file. Hence use the application name which is mentioned in config.xml.</li>
</ul>

 </p></li><li>targetClass : <span class='text-info'>STRING</span><p><p>Explicit name of the class in the application that will receive the intent. Must be specified if and only if &lsquo;appName&rsquo; is defined.</p>
 Platforms:Android </p></li><li>uri : <span class='text-info'>STRING</span><p><p>Open the application associated with the URI. Behavior may be different on different platforms and on software installed. For example, open URL with &lsquo;http://&rsquo; prefix usually executes the Web Browser installed on system and opens the URL in that browser. On Android, this is similar to  <a href="http://developer.android.com/reference/android/content/Intent.html#setData(android.net.Uri\))">Intent.setData()</a>. For example, if sending a &lt;![CDATA[ <a href="http://developer.android.com/guide/components/intents-common.html#Maps)">Map Intent</a>, you might set this value to something like &lsquo;geo:47.6,-122.3.&rsquo;</p>
 </p></li><li>mimeType : <span class='text-info'>STRING</span><p><p>MIME type of data defined in the intent. For example, for Plain Text one would use &lsquo;text/plain.&rsquo; On Android, this is similar to  <a href="http://developer.android.com/reference/android/content/Intent.html#setType(java.lang.String\))">Intent.setType</a>.</p>
 </p></li><li>data : <span class='text-info'>HASH</span><p><p>Data to be sent within the intent. On Android, this is similar to  <a href="http://developer.android.com/reference/android/content/Intent.html#putExtra(java.lang.String, java.lang.String\))">Intent.putExtra</a>, and &lsquo;data&rsquo; should contain a HASH of Extra-String/Value pairs. The &lsquo;Value&rsquo; type of the &lsquo;Extra&rsquo; can be a String, Integer, Boolean or Double. Other object types are not supported at this time. For sample code, please refer to examples section, below. Use the full constant string &lsquo;android.intent.extra.TEXT&rsquo; in place of <a href="http://developer.android.com/reference/android/content/Intent.html#EXTRA_TEXT">Intent.EXTRA_TEXT</a>.</p>
 </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span> <span class='label label-info'>Optional</span> </li></ul></div></div><div class="tab-pane fade" id="msend3"><div><p><strong>Async Callback Returning Parameters: <span class='text-info'>HASH</span></strong></p><ul><ul><li>responseCode : <span class='text-info'>INTEGER</span><p><p>Response code passed to Android Activity.setResult() method.  <a href="http://developer.android.com/reference/android/app/Activity.html#RESULT_OK)">RESULT_OK</a> = -1. Check <a href="http://developer.android.com/reference/android/app/Activity.html#setResult(int\))">Android Docs</a> for more information. Other attributes, such as &lsquo;uri&rsquo; may be returned depending on the Intent that was triggered. Possible parameters include the same params that are used in this &lsquo;send(params)&rsquo; method.</p>
 Platforms:Android </p></li></ul></ul></div></div><div class="tab-pane fade" id="msend4"><div><p><strong>Synchronous Return:</strong></p><ul><li>Void : this method also supports async callbacks - check the Callback tab for callback return parameters.</li></ul></div></div><div class="tab-pane fade" id="msend6"><div><p><strong>Method Access:</strong></p><ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li>JavaScript: <code>Rho.Intent.send(<span class="text-info">HASH</span> params, <span class='text-info'>CallBackHandler</span> callback)</code> </li><li>Ruby: <code>Rho::Intent.send(<span class="text-info">HASH</span> params, <span class='text-info'>CallBackHandler</span> callback)</code></li></ul></li></ul></div></div></div>  </div><a name ='mstartListening'/><div class=' method  js ruby android ios' id='mstartListening'><h3><strong  >startListening</strong><span style='font-size:.7em;font-weight:normal;'>(<span class='text-info'>CallBackHandler</span> callback)</span></h3><ul class="nav nav-tabs" style="padding-left:8px"><li class='active'><a href="#mstartListening1" data-toggle="tab">Description</a></li><li ><a href="#mstartListening2" data-toggle="tab">Parameters</a></li><li ><a href="#mstartListening3" data-toggle="tab">Callback</a></li><li ><a href="#mstartListening4" data-toggle="tab">Return</a></li><li ><a href="#mstartListening6" data-toggle="tab">Access</a></li></ul><div class='tab-content' style='padding-left:8px' id='tc-startListening'><div class="tab-pane fade active in" id="mstartListening1"><p>Start listening for custom intents.</p>

<p>For Android, this is how we have implemented <a href="http://developer.android.com/guide/components/intents-filters.html#Receiving">Android Intent Filters</a>. In order to listen for Intents you will have to update the <code>AndroidManifest.erb</code> file and add a special section to it. This file is now generated with RhoMobile Version 4.1 when you create a new project. The file is located in the root of project.</p>

<p>Add the following snippet to AndroidManifest.erb within the <code>manifest</code> tags</p>

<pre><code>:::xml
&lt;receiver android:name='com.rho.intent.IntentReceiver'&gt;
  &lt;intent-filter&gt;
    &lt;action android:name="Intent.ACTION_BATTERY_CHANGED" /&gt;
  &lt;/intent-filter&gt;
&lt;/receiver&gt;
</code></pre>

<p>Notice that this looks very similar to a standard AndroidManifest.XML file section except the <code>receiver</code> is the common RhoMobile intent receiver. The <code>intent-filter</code> tags within this section are standard AndroidManifest.XML notation that you would put in for the Intent-Filters that you want to listen for. Consult the <a href="http://developer.android.com/guide/components/intents-filters.html#Receiving">Android Docs</a> for more information about Intent Filters. From your Android application, you would use the <a href="http://developer.android.com/reference/android/content/Context.html#sendBroadcast(android.content.Intent)">sendBroadcast() method</a> with the appropriate parameters for this filter.</p>
<p><div><p><img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript"><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"><img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android"><img src="/img/ios.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="iphone, ipod touch, ipad"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"></p></div></p></div><div class="tab-pane fade" id="mstartListening2"><div><p><strong>Parameters</strong></p><ul><li>callback : <span class='text-info'>CallBackHandler</span> <span class='label label-warning'>Mandatory</span> </li></ul></div></div><div class="tab-pane fade" id="mstartListening3"><div><p><strong>Async Callback Returning Parameters: <span class='text-info'>HASH</span></strong></p><ul></ul></div></div><div class="tab-pane fade" id="mstartListening4"><div><p><strong>Synchronous Return:</strong></p><ul><li>Void : this method also supports async callbacks - check the Callback tab for callback return parameters.</li></ul></div></div><div class="tab-pane fade" id="mstartListening6"><div><p><strong>Method Access:</strong></p><ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li>JavaScript: <code>Rho.Intent.startListening(<span class='text-info'>CallBackHandler</span> callback)</code> </li><li>Ruby: <code>Rho::Intent.startListening(<span class='text-info'>CallBackHandler</span> callback)</code></li></ul></li></ul></div></div></div>  </div><a name ='mstopListening'/><div class=' method  js ruby android ios' id='mstopListening'><h3><strong  >stopListening</strong><span style='font-size:.7em;font-weight:normal;'>()</span></h3><ul class="nav nav-tabs" style="padding-left:8px"><li class='active'><a href="#mstopListening1" data-toggle="tab">Description</a></li><li ><a href="#mstopListening4" data-toggle="tab">Return</a></li><li ><a href="#mstopListening6" data-toggle="tab">Access</a></li></ul><div class='tab-content' style='padding-left:8px' id='tc-stopListening'><div class="tab-pane fade active in" id="mstopListening1"><p>Stop listening for custom intents.</p>
<p><div><p><img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript"><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"><img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android"><img src="/img/ios.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="iphone, ipod touch, ipad"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"></p></div></p></div><div class="tab-pane fade" id="mstopListening2"></div><div class="tab-pane fade" id="mstopListening3"></div><div class="tab-pane fade" id="mstopListening4"><div><p><strong>Synchronous Return:</strong></p><ul><li>Void</li></ul></div></div><div class="tab-pane fade" id="mstopListening6"><div><p><strong>Method Access:</strong></p><ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li>JavaScript: <code>Rho.Intent.stopListening()</code> </li><li>Ruby: <code>Rho::Intent.stopListening()</code></li></ul></li></ul></div></div></div>  </div></div>
<a name='Examples'></a>
<h2><i class='icon-edit'></i>Examples</h2>

<a name='e0'></a><div class=' example' id='e0'><div class="accordion-group"><div class="accordion-heading"><span class="accordion-toggle"   href="#cExample0"><strong>Plot a location on a map</strong></div><div id="cExample0" class="accordion-body">  <div class="accordion-inner">
<p>You can use the Intent API to use the default mapping program to plot locations.</p>
<ul class='nav nav-tabs' id='exI0-S0Tab'><li class='active'><a href='#exI0-S0JS' data-toggle='tab'>JavaScript</a></li><li ><a href='#exI0-S0RUBY' data-toggle='tab'>Ruby</a></li></ul><div class='tab-content'><div class='tab-pane active' id='exI0-S0JS'><pre class='CodeRay'><code>:::javascript

function sendGeo(){
  var intentParams = {action     : "android.intent.action.VIEW",
                      intentType : Rho.Intent.START_ACTIVITY,
                      uri        : "geo:37.422, -122.084"};

  Rho.Intent.send(intentParams);
}</code></pre></div><div class='tab-pane' id='exI0-S0RUBY'><pre class='CodeRay'><code>:::ruby

def send_geo
  intent_params = {:action     =&gt; "android.intent.action.VIEW",
                   :intentType =&gt; Rho::Intent::START_ACTIVITY,
                   :uri        =&gt; "geo:37.422, -122.084"}

  Rho::Intent.send intent_params
end</code></pre></div></div>  </div></div></div></div><a name='e1'></a><div class=' example' id='e1'><div class="accordion-group"><div class="accordion-heading"><span class="accordion-toggle"   href="#cExample1"><strong>Sending Extras</strong></div><div id="cExample1" class="accordion-body">  <div class="accordion-inner">
<p>Sometimes you will want to send some extras along with an intent such as an SMS body or do a web search with a given string. Here is an example of an intent that will launch the default web browser and perform a search with the default search engine.</p>
<ul class='nav nav-tabs' id='exI1-S0Tab'><li class='active'><a href='#exI1-S0JS' data-toggle='tab'>JavaScript</a></li><li ><a href='#exI1-S0RUBY' data-toggle='tab'>Ruby</a></li></ul><div class='tab-content'><div class='tab-pane active' id='exI1-S0JS'><pre class='CodeRay'><code>:::javascript

function webSearch(){}
  var intentParams = {action     : "android.intent.action.WEB_SEARCH",
                      intentType : Rho.Intent.START_ACTIVITY,
                      data       : {query : "Rhomobile docs"}}

  Rho.Intent.send(intentParams)
}</code></pre></div><div class='tab-pane' id='exI1-S0RUBY'><pre class='CodeRay'><code>:::ruby

def web_search
  intent_params = { :action     =&gt; "android.intent.action.WEB_SEARCH",
                    :intentType =&gt; Rho::Intent::START_ACTIVITY,
                    :data       =&gt; { :query =&gt; "Rhomobile docs" } }

  Rho::Intent.send intent_params
end</code></pre></div></div>  </div></div></div></div>
<a name='Remarks'></a>
<h2><i class='icon-warning-sign'></i>Remarks</h2>

<a name='r0'></a><div class=' remarks' id='r0'><div class="accordion-group"><div class="accordion-heading"><span class="accordion-toggle"  href="#cRemark0"><strong>Registering Intent Receiver</strong></div><div id="cRemark0" class="accordion-body">  <div class="accordion-inner"><p>For an Android app to receive intent data, the Intent receiver must be registered in the app&rsquo;s <code>AndroidManifest.erb</code> file. Please refer to the <a href="../guide/intent">Intent Guide</a> for more information.</p>
  </div></div></div></div></div>