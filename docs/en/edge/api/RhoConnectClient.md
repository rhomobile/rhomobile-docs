#RhoConnectClient
<div class="btn-group"><a href="#Methods" class="btn"><i class="icon-cog"></i> Methods<sup>&nbsp;13</sub></a><a class="btn dropdown-toggle" data-toggle="dropdown" data-target="#" href="#Methods" >  <span class="caret"></span>&nbsp;</a><ul class="dropdown-menu" style="max-height: 500px;overflow: auto;"><li class="disabled"><a tabindex="-1" href="#"><b><i>Methods - Class</i></b></a><li><a href="#maddObjectNotify" data-target="cMethodaddObjectNotify" class="autouncollapse">&nbsp;<span class='text-info'>addObjectNotify</span></a></li><li><a href="#mcleanObjectNotify" data-target="cMethodcleanObjectNotify" class="autouncollapse">&nbsp;<span class='text-info'>cleanObjectNotify</span></a></li><li><a href="#mclearNotification" data-target="cMethodclearNotification" class="autouncollapse">clearNotification</a></li><li><a href="#mdoSync" data-target="cMethoddoSync" class="autouncollapse">&nbsp;<span class='text-info'>doSync</span></a></li><li><a href="#mdoSyncSource" data-target="cMethoddoSyncSource" class="autouncollapse">doSyncSource</a></li><li><a href="#misLoggedIn" data-target="cMethodisLoggedIn" class="autouncollapse">isLoggedIn</a></li><li><a href="#misSyncing" data-target="cMethodisSyncing" class="autouncollapse">isSyncing</a></li><li><a href="#mlogin" data-target="cMethodlogin" class="autouncollapse">login</a></li><li><a href="#mlogout" data-target="cMethodlogout" class="autouncollapse">logout</a></li><li><a href="#msearch" data-target="cMethodsearch" class="autouncollapse">search</a></li><li><a href="#msetNotification" data-target="cMethodsetNotification" class="autouncollapse">setNotification</a></li><li><a href="#msetObjectNotification" data-target="cMethodsetObjectNotification" class="autouncollapse">&nbsp;<span class='text-info'>setObjectNotification</span></a></li><li><a href="#mstopSync" data-target="cMethodstopSync" class="autouncollapse">&nbsp;<span class='text-info'>stopSync</span></a></li></li></ul></div><div class="btn-group"><a href="#Properties" class="btn"><i class="icon-list"></i> Properties<sup>&nbsp;7</sup></a><button href="#" class="btn dropdown-toggle" data-toggle="dropdown">  <span class="caret"></span>&nbsp;</button><ul class="dropdown-menu" style="max-height: 500px;overflow: auto;"><li class="disabled"><a tabindex="-1" href="#"><b><i>Class Properties</i></b></a><li><a href="#pbulksyncState" data-target="cPropertybulksyncState" class="autouncollapse">bulksyncState</a></li><li><a href="#ppageSize" data-target="cPropertypageSize" class="autouncollapse">pageSize</a></li><li><a href="#ppollInterval" data-target="cPropertypollInterval" class="autouncollapse">pollInterval</a></li><li><a href="#pshowStatusPopup" data-target="cPropertyshowStatusPopup" class="autouncollapse">showStatusPopup</a></li><li><a href="#psslVerifyPeer" data-target="cPropertysslVerifyPeer" class="autouncollapse">sslVerifyPeer</a></li><li><a href="#psyncServer" data-target="cPropertysyncServer" class="autouncollapse">syncServer</a></li><li><a href="#puserName" data-target="cPropertyuserName" class="autouncollapse">userName</a></li></li></ul></div><div class="btn-group"><a href="#Examples" class="btn"><i class="icon-edit"></i> Examples<sup>&nbsp;5</sup></a><button href="#" class="btn dropdown-toggle" data-toggle="dropdown">  <span class="caret"></span>&nbsp;</button><ul class="dropdown-menu" style="max-height: 500px;overflow: auto;"><li><a href="#e0" data-target="eExample0" class="autouncollapse">Sync Authentication</a></li><li><a href="#e1" data-target="eExample1" class="autouncollapse">Notifications</a></li><li><a href="#e2" data-target="eExample2" class="autouncollapse">Object notifications</a></li><li><a href="#e3" data-target="eExample3" class="autouncollapse">Handling Errors</a></li><li><a href="#e4" data-target="eExample4" class="autouncollapse">Using search (Ruby Only)</a></li></ul></div><div class="btn-group"><a href="#Remarks" class="btn"><i class="icon-warning-sign"></i> Remarks<sup>&nbsp;2</sup></a><button href="#" class="btn dropdown-toggle" data-toggle="dropdown">  <span class="caret"></span>&nbsp;</button><ul class="dropdown-menu" style="max-height: 500px;overflow: auto;"><li><a href="#r0" data-target="rRemark0" class="autouncollapse">Notification Callback Parameters</a></li><li><a href="#r1" data-target="rRemark1" class="autouncollapse">Backround Sync on iOS</a></li></ul></div><div class="btn-group pull-right"><button class="btn dropdown-toggle" id="apiFilterBtn" data-toggle="dropdown" href="#" title="Filter Properties and Methods"><i class="icon-filter "></i>Show</button><select id="apiFilter" class="dropdown-menu apiFilter"><option value="all">All</option><option value="js">JavaScript</option><option value="ruby">Ruby</option><option value="android">Android</option><option value="ios">iOS</option><option value="wm">Windows Mobile</option><option value="wp8">Windows Phone 8</option><option value="w32">Windows Desktop</option><option value="msi">MSI Only</option></select></div><div  id="apibody" style="overflow:auto;padding-right: 5px;">
<p>RhoConnectClient is used for synchronization with RhoConnect applications.</p>

<h2>Enabling the API</h2>

<p>In order to use this API you must include the following extension in your <code>build.yml</code></p>

<pre><code>:::ruby
extensions: ["rhoconnect-client"]
</code></pre>

<h2>JavaScript Usage</h2>

<p>Be sure to review the <a href="/guide/api_js">JavaScript API Usage</a> guide for important information about using this API in JavaScript</p>

<h2>Ruby Usage</h2>

<p>Be sure to review the <a href="/guide/api_ruby">Ruby API Usage</a> guide for important information about using this API in Ruby</p>


<a name='Methods'></a>
<h2><i class='icon-cog'></i>Methods</h2>

<div class="accordion" id="accordion"><a name ='maddObjectNotify'/><div class=' method  js ruby android ios wp8' id='maddObjectNotify'><h3><strong  ><span class="text-info">addObjectNotify</span></strong><span style='font-size:.7em;font-weight:normal;'>(<span class="text-info">STRING</span> sourceName, <span class="text-info">STRING</span> object)</span></h3><ul class="nav nav-tabs" style="padding-left:8px"><li class='active'><a href="#maddObjectNotify1" data-toggle="tab">Description</a></li><li ><a href="#maddObjectNotify2" data-toggle="tab">Parameters</a></li><li ><a href="#maddObjectNotify4" data-toggle="tab">Return</a></li><li ><a href="#maddObjectNotify6" data-toggle="tab">Access</a></li></ul><div class='tab-content' style='padding-left:8px' id='tc-addObjectNotify'><div class="tab-pane fade active in" id="maddObjectNotify1"><span class='label label-info'>Replaces:</span> <span class='label label-info'>add_objectnotify</span>  <p>Add the object notification by passing in an object ID.</p>
<p><div><p><img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript"><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"><img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android"><img src="/img/ios.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="iphone, ipod touch, ipad"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"><img src="/img/wp8.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Phone 8, Windows Embedded 8"><img src="/img/windows.jpg" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Desktop"></p></div></p></div><div class="tab-pane fade" id="maddObjectNotify2"><div><p><strong>Parameters</strong></p><ul><li>sourceName : <span class='text-info'>STRING</span><p><p>Source name for object notification.</p>
 </p></li><li>object : <span class='text-info'>STRING</span><p><p>Object ID to get notifications.</p>
 </p></li></ul></div></div><div class="tab-pane fade" id="maddObjectNotify3"></div><div class="tab-pane fade" id="maddObjectNotify4"><div><p><strong>Synchronous Return:</strong></p><ul><li>Void</li></ul></div></div><div class="tab-pane fade" id="maddObjectNotify6"><div><p><strong>Method Access:</strong></p><ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li>JavaScript: <code>Rho.RhoConnectClient.addObjectNotify(<span class="text-info">STRING</span> sourceName, <span class="text-info">STRING</span> object)</code> </li><li>Ruby: <code>Rho::RhoConnectClient.addObjectNotify(<span class="text-info">STRING</span> sourceName, <span class="text-info">STRING</span> object)</code></li></ul></li></ul></div></div></div>  </div><a name ='mcleanObjectNotify'/><div class=' method  js ruby android ios wp8' id='mcleanObjectNotify'><h3><strong  ><span class="text-info">cleanObjectNotify</span></strong><span style='font-size:.7em;font-weight:normal;'>()</span></h3><ul class="nav nav-tabs" style="padding-left:8px"><li class='active'><a href="#mcleanObjectNotify1" data-toggle="tab">Description</a></li><li ><a href="#mcleanObjectNotify4" data-toggle="tab">Return</a></li><li ><a href="#mcleanObjectNotify6" data-toggle="tab">Access</a></li></ul><div class='tab-content' style='padding-left:8px' id='tc-cleanObjectNotify'><div class="tab-pane fade active in" id="mcleanObjectNotify1"><span class='label label-info'>Replaces:</span> <span class='label label-info'>clean_objectnotify</span>  <p>Removes callback for object notifications.</p>
<p><div><p><img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript"><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"><img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android"><img src="/img/ios.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="iphone, ipod touch, ipad"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"><img src="/img/wp8.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Phone 8, Windows Embedded 8"><img src="/img/windows.jpg" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Desktop"></p></div></p></div><div class="tab-pane fade" id="mcleanObjectNotify2"></div><div class="tab-pane fade" id="mcleanObjectNotify3"></div><div class="tab-pane fade" id="mcleanObjectNotify4"><div><p><strong>Synchronous Return:</strong></p><ul><li>Void</li></ul></div></div><div class="tab-pane fade" id="mcleanObjectNotify6"><div><p><strong>Method Access:</strong></p><ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li>JavaScript: <code>Rho.RhoConnectClient.cleanObjectNotify()</code> </li><li>Ruby: <code>Rho::RhoConnectClient.cleanObjectNotify()</code></li></ul></li></ul></div></div></div>  </div><a name ='mclearNotification'/><div class=' method  js ruby android ios wp8' id='mclearNotification'><h3><strong  >clearNotification</strong><span style='font-size:.7em;font-weight:normal;'>(<span class="text-info">STRING</span> sourceName)</span></h3><ul class="nav nav-tabs" style="padding-left:8px"><li class='active'><a href="#mclearNotification1" data-toggle="tab">Description</a></li><li ><a href="#mclearNotification2" data-toggle="tab">Parameters</a></li><li ><a href="#mclearNotification4" data-toggle="tab">Return</a></li><li ><a href="#mclearNotification6" data-toggle="tab">Access</a></li></ul><div class='tab-content' style='padding-left:8px' id='tc-clearNotification'><div class="tab-pane fade active in" id="mclearNotification1"><p>Clears the sync notification for a given source.</p>
<p><div><p><img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript"><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"><img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android"><img src="/img/ios.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="iphone, ipod touch, ipad"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"><img src="/img/wp8.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Phone 8, Windows Embedded 8"><img src="/img/windows.jpg" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Desktop"></p></div></p></div><div class="tab-pane fade" id="mclearNotification2"><div><p><strong>Parameters</strong></p><ul><li>sourceName : <span class='text-info'>STRING</span><p><p>Source name to clear notification. Use &lsquo;*&rsquo; to clear notification for all models.</p>
 </p></li></ul></div></div><div class="tab-pane fade" id="mclearNotification3"></div><div class="tab-pane fade" id="mclearNotification4"><div><p><strong>Synchronous Return:</strong></p><ul><li>Void</li></ul></div></div><div class="tab-pane fade" id="mclearNotification6"><div><p><strong>Method Access:</strong></p><ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li>JavaScript: <code>Rho.RhoConnectClient.clearNotification(<span class="text-info">STRING</span> sourceName)</code> </li><li>Ruby: <code>Rho::RhoConnectClient.clearNotification(<span class="text-info">STRING</span> sourceName)</code></li></ul></li></ul></div></div></div>  </div><a name ='mdoSync'/><div class=' method  js ruby android ios wp8' id='mdoSync'><h3><strong  ><span class="text-info">doSync</span></strong><span style='font-size:.7em;font-weight:normal;'>(<span class="text-info">BOOLEAN</span> showStatusPopup, <span class="text-info">STRING</span> queryParams, <span class="text-info">BOOLEAN</span> syncOnlyChangedSources)</span></h3><ul class="nav nav-tabs" style="padding-left:8px"><li class='active'><a href="#mdoSync1" data-toggle="tab">Description</a></li><li ><a href="#mdoSync2" data-toggle="tab">Parameters</a></li><li ><a href="#mdoSync4" data-toggle="tab">Return</a></li><li ><a href="#mdoSync6" data-toggle="tab">Access</a></li></ul><div class='tab-content' style='padding-left:8px' id='tc-doSync'><div class="tab-pane fade active in" id="mdoSync1"><span class='label label-info'>Replaces:</span> <span class='label label-info'>dosync</span>  <p>Start the RhoConnectClient sync process.</p>
<p><div><p><img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript"><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"><img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android"><img src="/img/ios.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="iphone, ipod touch, ipad"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"><img src="/img/wp8.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Phone 8, Windows Embedded 8"><img src="/img/windows.jpg" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Desktop"></p></div></p></div><div class="tab-pane fade" id="mdoSync2"><div><p><strong>Parameters</strong></p><ul><li>showStatusPopup : <span class='text-info'>BOOLEAN</span> <span class='label label-info'>Optional</span><p><p>Set to true to show status popup.</p>
 </p></li><li>queryParams : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p><p>Parameters to be passed to server.</p>
 </p></li><li>syncOnlyChangedSources : <span class='text-info'>BOOLEAN</span> <span class='label label-info'>Optional</span><p><p>Sync only sources that have local changes.</p>
 </p></li></ul></div></div><div class="tab-pane fade" id="mdoSync3"></div><div class="tab-pane fade" id="mdoSync4"><div><p><strong>Synchronous Return:</strong></p><ul><li>STRING</li></ul></div></div><div class="tab-pane fade" id="mdoSync6"><div><p><strong>Method Access:</strong></p><ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li>JavaScript: <code>Rho.RhoConnectClient.doSync(<span class="text-info">BOOLEAN</span> showStatusPopup, <span class="text-info">STRING</span> queryParams, <span class="text-info">BOOLEAN</span> syncOnlyChangedSources)</code> </li><li>Ruby: <code>Rho::RhoConnectClient.doSync(<span class="text-info">BOOLEAN</span> showStatusPopup, <span class="text-info">STRING</span> queryParams, <span class="text-info">BOOLEAN</span> syncOnlyChangedSources)</code></li></ul></li></ul></div></div></div>  </div><a name ='mdoSyncSource'/><div class=' method  js ruby android ios wp8' id='mdoSyncSource'><h3><strong  >doSyncSource</strong><span style='font-size:.7em;font-weight:normal;'>(<span class="text-info">STRING</span> sourceName, <span class="text-info">BOOLEAN</span> showStatusPopup, <span class="text-info">STRING</span> queryParams)</span></h3><ul class="nav nav-tabs" style="padding-left:8px"><li class='active'><a href="#mdoSyncSource1" data-toggle="tab">Description</a></li><li ><a href="#mdoSyncSource2" data-toggle="tab">Parameters</a></li><li ><a href="#mdoSyncSource4" data-toggle="tab">Return</a></li><li ><a href="#mdoSyncSource6" data-toggle="tab">Access</a></li></ul><div class='tab-content' style='padding-left:8px' id='tc-doSyncSource'><div class="tab-pane fade active in" id="mdoSyncSource1"><p>Start RhoConnectClient sync process for a given source name.</p>
<p><div><p><img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript"><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"><img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android"><img src="/img/ios.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="iphone, ipod touch, ipad"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"><img src="/img/wp8.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Phone 8, Windows Embedded 8"><img src="/img/windows.jpg" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Desktop"></p></div></p></div><div class="tab-pane fade" id="mdoSyncSource2"><div><p><strong>Parameters</strong></p><ul><li>sourceName : <span class='text-info'>STRING</span><p><p>Source name.</p>
 </p></li><li>showStatusPopup : <span class='text-info'>BOOLEAN</span> <span class='label label-info'>Optional</span><p><p>Set to true to show status popup.</p>
 </p></li><li>queryParams : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p><p>Parameters to be passed to server.</p>
 </p></li></ul></div></div><div class="tab-pane fade" id="mdoSyncSource3"></div><div class="tab-pane fade" id="mdoSyncSource4"><div><p><strong>Synchronous Return:</strong></p><ul><li>STRING</li></ul></div></div><div class="tab-pane fade" id="mdoSyncSource6"><div><p><strong>Method Access:</strong></p><ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li>JavaScript: <code>Rho.RhoConnectClient.doSyncSource(<span class="text-info">STRING</span> sourceName, <span class="text-info">BOOLEAN</span> showStatusPopup, <span class="text-info">STRING</span> queryParams)</code> </li><li>Ruby: <code>Rho::RhoConnectClient.doSyncSource(<span class="text-info">STRING</span> sourceName, <span class="text-info">BOOLEAN</span> showStatusPopup, <span class="text-info">STRING</span> queryParams)</code></li></ul></li></ul></div></div></div>  </div><a name ='misLoggedIn'/><div class=' method  js ruby android ios wp8' id='misLoggedIn'><h3><strong  >isLoggedIn</strong><span style='font-size:.7em;font-weight:normal;'>()</span></h3><ul class="nav nav-tabs" style="padding-left:8px"><li class='active'><a href="#misLoggedIn1" data-toggle="tab">Description</a></li><li ><a href="#misLoggedIn4" data-toggle="tab">Return</a></li><li ><a href="#misLoggedIn6" data-toggle="tab">Access</a></li></ul><div class='tab-content' style='padding-left:8px' id='tc-isLoggedIn'><div class="tab-pane fade active in" id="misLoggedIn1"><p>Returns true if the RhoConnectClient currently has a user session, false if not.</p>
<p><div><p><img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript"><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"><img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android"><img src="/img/ios.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="iphone, ipod touch, ipad"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"><img src="/img/wp8.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Phone 8, Windows Embedded 8"><img src="/img/windows.jpg" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Desktop"></p></div></p></div><div class="tab-pane fade" id="misLoggedIn2"></div><div class="tab-pane fade" id="misLoggedIn3"></div><div class="tab-pane fade" id="misLoggedIn4"><div><p><strong>Synchronous Return:</strong></p><ul><li>BOOLEAN : <p>True if have logged in user session, false if not.</p>
</li></ul></div></div><div class="tab-pane fade" id="misLoggedIn6"><div><p><strong>Method Access:</strong></p><ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li>JavaScript: <code>Rho.RhoConnectClient.isLoggedIn()</code> </li><li>Ruby: <code>Rho::RhoConnectClient.isLoggedIn()</code></li></ul></li></ul></div></div></div>  </div><a name ='misSyncing'/><div class=' method  js ruby android ios wp8' id='misSyncing'><h3><strong  >isSyncing</strong><span style='font-size:.7em;font-weight:normal;'>()</span></h3><ul class="nav nav-tabs" style="padding-left:8px"><li class='active'><a href="#misSyncing1" data-toggle="tab">Description</a></li><li ><a href="#misSyncing4" data-toggle="tab">Return</a></li><li ><a href="#misSyncing6" data-toggle="tab">Access</a></li></ul><div class='tab-content' style='padding-left:8px' id='tc-isSyncing'><div class="tab-pane fade active in" id="misSyncing1"><p>Returns true if sync is currently in progress.</p>
<p><div><p><img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript"><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"><img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android"><img src="/img/ios.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="iphone, ipod touch, ipad"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"><img src="/img/wp8.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Phone 8, Windows Embedded 8"><img src="/img/windows.jpg" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Desktop"></p></div></p></div><div class="tab-pane fade" id="misSyncing2"></div><div class="tab-pane fade" id="misSyncing3"></div><div class="tab-pane fade" id="misSyncing4"><div><p><strong>Synchronous Return:</strong></p><ul><li>BOOLEAN : <p>True if sync has started but not finished yet, false otherwise.</p>
</li></ul></div></div><div class="tab-pane fade" id="misSyncing6"><div><p><strong>Method Access:</strong></p><ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li>JavaScript: <code>Rho.RhoConnectClient.isSyncing()</code> </li><li>Ruby: <code>Rho::RhoConnectClient.isSyncing()</code></li></ul></li></ul></div></div></div>  </div><a name ='mlogin'/><div class=' method  js ruby android ios wp8' id='mlogin'><h3><strong  >login</strong><span style='font-size:.7em;font-weight:normal;'>(<span class="text-info">STRING</span> login, <span class="text-info">STRING</span> password, <span class='text-info'>CallBackHandler</span> callback)</span></h3><ul class="nav nav-tabs" style="padding-left:8px"><li class='active'><a href="#mlogin1" data-toggle="tab">Description</a></li><li ><a href="#mlogin2" data-toggle="tab">Parameters</a></li><li ><a href="#mlogin3" data-toggle="tab">Callback</a></li><li ><a href="#mlogin4" data-toggle="tab">Return</a></li><li ><a href="#mlogin6" data-toggle="tab">Access</a></li></ul><div class='tab-content' style='padding-left:8px' id='tc-login'><div class="tab-pane fade active in" id="mlogin1"><p>Authenticates the user with RhoConnect. The callback will be executed when it is finished.</p>
<p><div><p><img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript"><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"><img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android"><img src="/img/ios.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="iphone, ipod touch, ipad"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"><img src="/img/wp8.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Phone 8, Windows Embedded 8"><img src="/img/windows.jpg" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Desktop"></p></div></p></div><div class="tab-pane fade" id="mlogin2"><div><p><strong>Parameters</strong></p><ul><li>login : <span class='text-info'>STRING</span><p><p>Login name.</p>
 </p></li><li>password : <span class='text-info'>STRING</span><p><p>Password.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span> <span class='label label-warning'>Mandatory</span> </li></ul></div></div><div class="tab-pane fade" id="mlogin3"><div><p><strong>Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></strong></p><ul></ul></div></div><div class="tab-pane fade" id="mlogin4"><div><p><strong>Synchronous Return:</strong></p><ul><li>INTEGER : this method also supports async callbacks - check the Callback tab for callback return parameters.</li></ul></div></div><div class="tab-pane fade" id="mlogin6"><div><p><strong>Method Access:</strong></p><ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li>JavaScript: <code>Rho.RhoConnectClient.login(<span class="text-info">STRING</span> login, <span class="text-info">STRING</span> password, <span class='text-info'>CallBackHandler</span> callback)</code> </li><li>Ruby: <code>Rho::RhoConnectClient.login(<span class="text-info">STRING</span> login, <span class="text-info">STRING</span> password, <span class='text-info'>CallBackHandler</span> callback)</code></li></ul></li></ul></div></div></div>  </div><a name ='mlogout'/><div class=' method  js ruby android ios wp8' id='mlogout'><h3><strong  >logout</strong><span style='font-size:.7em;font-weight:normal;'>()</span></h3><ul class="nav nav-tabs" style="padding-left:8px"><li class='active'><a href="#mlogout1" data-toggle="tab">Description</a></li><li ><a href="#mlogout4" data-toggle="tab">Return</a></li><li ><a href="#mlogout6" data-toggle="tab">Access</a></li></ul><div class='tab-content' style='padding-left:8px' id='tc-logout'><div class="tab-pane fade active in" id="mlogout1"><p>Logout the user from the RhoConnect server. This removes the local user session.</p>
<p><div><p><img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript"><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"><img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android"><img src="/img/ios.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="iphone, ipod touch, ipad"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"><img src="/img/wp8.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Phone 8, Windows Embedded 8"><img src="/img/windows.jpg" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Desktop"></p></div></p></div><div class="tab-pane fade" id="mlogout2"></div><div class="tab-pane fade" id="mlogout3"></div><div class="tab-pane fade" id="mlogout4"><div><p><strong>Synchronous Return:</strong></p><ul><li>Void</li></ul></div></div><div class="tab-pane fade" id="mlogout6"><div><p><strong>Method Access:</strong></p><ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li>JavaScript: <code>Rho.RhoConnectClient.logout()</code> </li><li>Ruby: <code>Rho::RhoConnectClient.logout()</code></li></ul></li></ul></div></div></div>  </div><a name ='msearch'/><div class=' method  ruby android ios wp8' id='msearch'><h3><strong  >search</strong><span style='font-size:.7em;font-weight:normal;'>(<span class="text-info">HASH</span> args, <span class='text-info'>CallBackHandler</span> callback)</span></h3><ul class="nav nav-tabs" style="padding-left:8px"><li class='active'><a href="#msearch1" data-toggle="tab">Description</a></li><li ><a href="#msearch2" data-toggle="tab">Parameters</a></li><li ><a href="#msearch3" data-toggle="tab">Callback</a></li><li ><a href="#msearch4" data-toggle="tab">Return</a></li><li ><a href="#msearch6" data-toggle="tab">Access</a></li></ul><div class='tab-content' style='padding-left:8px' id='tc-search'><div class="tab-pane fade active in" id="msearch1"><p>If you have a large dataset in your backend service, you don&rsquo;t have to synchronize everything with the RhoConnectClient. Instead you can filter the synchronized dataset using the RhoConnectClient&rsquo;s search function. Provide callback, which will be executed after search is completed.</p>
<p><div><p><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"><img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android"><img src="/img/ios.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="iphone, ipod touch, ipad"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"><img src="/img/wp8.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Phone 8, Windows Embedded 8"><img src="/img/windows.jpg" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Desktop">(Not currently supported in JavaScript.)</p></div></p></div><div class="tab-pane fade" id="msearch2"><div><p><strong>Parameters</strong></p><ul><li>args : <span class='text-info'>HASH</span><p><p>Hash of arguments passed to search.</p>
 </p></li><ul><li>sourceNames : <span class='text-info'>ARRAY</span><p><p>Array of source names to be included in search result.</p>
 </p></li><li>from : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p><p>Default is &lsquo;search&rsquo;</p>
 </p></li><li>searchParams : <span class='text-info'>HASH</span><p><p>Hash of key-value pairs to be included in search result.</p>
 </p></li><li>offset : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><p> </p></li><li>maxResults : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><p><p>Maximum number of results to be returned.</p>
 </p></li><li>progressStep : <span class='text-info'>INTEGER</span> <span class='label label-info'>Optional</span><p> </p></li><li>syncChanges : <span class='text-info'>BOOLEAN</span> <span class='label label-info'>Optional</span><p><p>If true and there are local changes, client sync will be triggered before search.</p>
 </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span> <span class='label label-info'>Optional</span> </li></ul></div></div><div class="tab-pane fade" id="msearch3"><div><p><strong>Async Callback Returning Parameters: <span class='text-info'>OBJECT</span></strong></p><ul><ul><li>status : <span class='text-info'>STRING</span><p><p>Resulting status of search. &lsquo;ok&rsquo; of completed successfully, &lsquo;error&rsquo; otherwise.</p>
 </p></li><li>search_params : <span class='text-info'>HASH</span><p><p>Search_params originally provided for the search call. Typically you want to forward the original search_params to your view that displays the results so you can perform the same query locally. Please see examples section.</p>
 </p></li></ul></ul></div></div><div class="tab-pane fade" id="msearch4"><div><p><strong>Synchronous Return:</strong></p><ul><li>HASH : <p>Will return value only if threadedMode set to false. Otherwise search results returned in callback.</p>
 : this method also supports async callbacks - check the Callback tab for callback return parameters.</li></ul></div></div><div class="tab-pane fade" id="msearch6"><div><p><strong>Method Access:</strong></p><ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li>Ruby: <code>Rho::RhoConnectClient.search(<span class="text-info">HASH</span> args, <span class='text-info'>CallBackHandler</span> callback)</code></li></ul></li></ul></div></div></div>  </div><a name ='msetNotification'/><div class=' method  js ruby android ios wp8' id='msetNotification'><h3><strong  >setNotification</strong><span style='font-size:.7em;font-weight:normal;'>(<span class="text-info">STRING</span> sourceName, <span class='text-info'>CallBackHandler</span> callback)</span></h3><ul class="nav nav-tabs" style="padding-left:8px"><li class='active'><a href="#msetNotification1" data-toggle="tab">Description</a></li><li ><a href="#msetNotification2" data-toggle="tab">Parameters</a></li><li ><a href="#msetNotification4" data-toggle="tab">Return</a></li><li ><a href="#msetNotification6" data-toggle="tab">Access</a></li></ul><div class='tab-content' style='padding-left:8px' id='tc-setNotification'><div class="tab-pane fade active in" id="msetNotification1"><p>The RhoConnectClient system uses notifications to provide information about the sync process to a Rhodes application. Notifications can be setup once for the duration of runtime or each time a sync is triggered. Once a sync is processing for a model, notifications are called with parameters containing sync process state. Your application can use this information to display different wait pages, progress bars, etc. setNotification will set notification for a model.</p>
<p><div><p><img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript"><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"><img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android"><img src="/img/ios.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="iphone, ipod touch, ipad"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"><img src="/img/wp8.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Phone 8, Windows Embedded 8"><img src="/img/windows.jpg" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Desktop"></p></div></p></div><div class="tab-pane fade" id="msetNotification2"><div><p><strong>Parameters</strong></p><ul><li>sourceName : <span class='text-info'>STRING</span><p><p>Source name for which notification will be enabled. Use &lsquo;*&rsquo; to set notification for all models.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span> <span class='label label-warning'>Mandatory</span> </li></ul></div></div><div class="tab-pane fade" id="msetNotification3"></div><div class="tab-pane fade" id="msetNotification4"><div><p><strong>Synchronous Return:</strong></p><ul><li>Void : this method also supports async callbacks - check the Callback tab for callback return parameters.</li></ul></div></div><div class="tab-pane fade" id="msetNotification6"><div><p><strong>Method Access:</strong></p><ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li>JavaScript: <code>Rho.RhoConnectClient.setNotification(<span class="text-info">STRING</span> sourceName, <span class='text-info'>CallBackHandler</span> callback)</code> </li><li>Ruby: <code>Rho::RhoConnectClient.setNotification(<span class="text-info">STRING</span> sourceName, <span class='text-info'>CallBackHandler</span> callback)</code></li></ul></li></ul></div></div></div>  </div><a name ='msetObjectNotification'/><div class=' method  js ruby android ios wp8' id='msetObjectNotification'><h3><strong  ><span class="text-info">setObjectNotification</span></strong><span style='font-size:.7em;font-weight:normal;'>(<span class='text-info'>CallBackHandler</span> callback)</span></h3><ul class="nav nav-tabs" style="padding-left:8px"><li class='active'><a href="#msetObjectNotification1" data-toggle="tab">Description</a></li><li ><a href="#msetObjectNotification2" data-toggle="tab">Parameters</a></li><li ><a href="#msetObjectNotification3" data-toggle="tab">Callback</a></li><li ><a href="#msetObjectNotification4" data-toggle="tab">Return</a></li><li ><a href="#msetObjectNotification6" data-toggle="tab">Access</a></li></ul><div class='tab-content' style='padding-left:8px' id='tc-setObjectNotification'><div class="tab-pane fade active in" id="msetObjectNotification1"><span class='label label-info'>Replaces:</span> <span class='label label-info'>set_objectnotify_url</span>  <p>The RhoConnectClient can send a notification when a specific object on the current page has been modified. This is useful if you have frequently-changing data like feeds or timelines in your application and want them to update without the user taking any action.</p>
<p><div><p><img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript"><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"><img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android"><img src="/img/ios.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="iphone, ipod touch, ipad"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"><img src="/img/wp8.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Phone 8, Windows Embedded 8"><img src="/img/windows.jpg" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Desktop"></p></div></p></div><div class="tab-pane fade" id="msetObjectNotification2"><div><p><strong>Parameters</strong></p><ul><li>callback : <span class='text-info'>CallBackHandler</span> <span class='label label-warning'>Mandatory</span> </li></ul></div></div><div class="tab-pane fade" id="msetObjectNotification3"><div><p><strong>Async Callback Returning Parameters: <span class='text-info'>OBJECT</span></strong></p><ul><ul><li>created : <span class='text-info'>ARRAY</span><p><p>Array of created objects.</p>
 </p></li><li>updated : <span class='text-info'>ARRAY</span><p><p>Array of updated objects.</p>
 </p></li><li>deleted : <span class='text-info'>ARRAY</span><p><p>Array of deleted objects.</p>
 </p></li></ul></ul></div></div><div class="tab-pane fade" id="msetObjectNotification4"><div><p><strong>Synchronous Return:</strong></p><ul><li>Void : this method also supports async callbacks - check the Callback tab for callback return parameters.</li></ul></div></div><div class="tab-pane fade" id="msetObjectNotification6"><div><p><strong>Method Access:</strong></p><ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li>JavaScript: <code>Rho.RhoConnectClient.setObjectNotification(<span class='text-info'>CallBackHandler</span> callback)</code> </li><li>Ruby: <code>Rho::RhoConnectClient.setObjectNotification(<span class='text-info'>CallBackHandler</span> callback)</code></li></ul></li></ul></div></div></div>  </div><a name ='mstopSync'/><div class=' method  js ruby android ios wp8' id='mstopSync'><h3><strong  ><span class="text-info">stopSync</span></strong><span style='font-size:.7em;font-weight:normal;'>()</span></h3><ul class="nav nav-tabs" style="padding-left:8px"><li class='active'><a href="#mstopSync1" data-toggle="tab">Description</a></li><li ><a href="#mstopSync4" data-toggle="tab">Return</a></li><li ><a href="#mstopSync6" data-toggle="tab">Access</a></li></ul><div class='tab-content' style='padding-left:8px' id='tc-stopSync'><div class="tab-pane fade active in" id="mstopSync1"><span class='label label-info'>Replaces:</span> <span class='label label-info'>stop_sync</span>  <p>Stops any sync operations currently in progress.</p>
<p><div><p><img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript"><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"><img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android"><img src="/img/ios.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="iphone, ipod touch, ipad"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"><img src="/img/wp8.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Phone 8, Windows Embedded 8"><img src="/img/windows.jpg" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Desktop"></p></div></p></div><div class="tab-pane fade" id="mstopSync2"></div><div class="tab-pane fade" id="mstopSync3"></div><div class="tab-pane fade" id="mstopSync4"><div><p><strong>Synchronous Return:</strong></p><ul><li>Void</li></ul></div></div><div class="tab-pane fade" id="mstopSync6"><div><p><strong>Method Access:</strong></p><ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li>JavaScript: <code>Rho.RhoConnectClient.stopSync()</code> </li><li>Ruby: <code>Rho::RhoConnectClient.stopSync()</code></li></ul></li></ul></div></div></div>  </div></div>
<a name='Properties'></a>
<h2><i class='icon-list'></i>Properties</h2>

<a name='pbulksyncState'></a><div class=' method  ruby android ios wp8' id='pbulksyncState'><h3><strong  >bulksyncState</strong><span style='font-size:.7em;font-weight:normal;'> : <span class='text-info'>INTEGER</span>  </span></h3><ul class="nav nav-tabs" style="padding-left:8px"><li class='active'><a href="#pbulksyncState1" data-toggle="tab">Description</a></li><li ><a href="#pbulksyncState2" data-toggle="tab">Params</a></li><li ><a href="#pbulksyncState6" data-toggle="tab">Access</a></li></ul><div class='tab-content' style='padding-left:8px' id='tc-bulksyncState'><div class="tab-pane fade active in" id="pbulksyncState1"><p>Set 0 to force bulk sync on next synchronization cycle. After sync is complete, bulksyncState will be set to 1.</p>
<p><div><p><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"><img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android"><img src="/img/ios.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="iphone, ipod touch, ipad"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"><img src="/img/wp8.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Phone 8, Windows Embedded 8"><img src="/img/windows.jpg" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Desktop"> (Not currently supported in JavaScript.)</p></div></p></div><div class="tab-pane fade" id="pbulksyncState2"><p><strong>Default:</strong> 1</p></div><div class="tab-pane fade" id="pbulksyncState5"></div><div class="tab-pane fade" id="pbulksyncState6"><div><p><strong>Property Access:</strong></p><ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.bulksyncState</code></li></ul></li></ul></div></div></div>  </div><a name='ppageSize'></a><div class=' method  js ruby android ios wp8' id='ppageSize'><h3><strong  >pageSize</strong><span style='font-size:.7em;font-weight:normal;'> : <span class='text-info'>INTEGER</span>  </span></h3><ul class="nav nav-tabs" style="padding-left:8px"><li class='active'><a href="#ppageSize1" data-toggle="tab">Description</a></li><li ><a href="#ppageSize6" data-toggle="tab">Access</a></li></ul><div class='tab-content' style='padding-left:8px' id='tc-pageSize'><div class="tab-pane fade active in" id="ppageSize1"><p>Page size for RhoConnectClient. Default size is 2000.</p>
<p><div><p><img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript"><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"><img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android"><img src="/img/ios.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="iphone, ipod touch, ipad"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"><img src="/img/wp8.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Phone 8, Windows Embedded 8"><img src="/img/windows.jpg" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Desktop"> </p></div></p></div><div class="tab-pane fade" id="ppageSize2"></div><div class="tab-pane fade" id="ppageSize5"></div><div class="tab-pane fade" id="ppageSize6"><div><p><strong>Property Access:</strong></p><ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.pageSize</code></li></ul></li></ul></div></div></div>  </div><a name='ppollInterval'></a><div class=' method  js ruby android ios wp8' id='ppollInterval'><h3><strong  >pollInterval</strong><span style='font-size:.7em;font-weight:normal;'> : <span class='text-info'>INTEGER</span>  </span></h3><ul class="nav nav-tabs" style="padding-left:8px"><li class='active'><a href="#ppollInterval1" data-toggle="tab">Description</a></li><li ><a href="#ppollInterval2" data-toggle="tab">Params</a></li><li ><a href="#ppollInterval6" data-toggle="tab">Access</a></li></ul><div class='tab-content' style='padding-left:8px' id='tc-pollInterval'><div class="tab-pane fade active in" id="ppollInterval1"><p>Sync poll interval in seconds. Setting this to 0 will disable polling-based sync. Sync process will be triggered automatically according to this setting.</p>
<p><div><p><img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript"><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"><img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android"><img src="/img/ios.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="iphone, ipod touch, ipad"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"><img src="/img/wp8.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Phone 8, Windows Embedded 8"><img src="/img/windows.jpg" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Desktop"> </p></div></p></div><div class="tab-pane fade" id="ppollInterval2"><p><strong>Default:</strong> 60</p></div><div class="tab-pane fade" id="ppollInterval5"></div><div class="tab-pane fade" id="ppollInterval6"><div><p><strong>Property Access:</strong></p><ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.pollInterval</code></li></ul></li></ul></div></div></div>  </div><a name='pshowStatusPopup'></a><div class=' method  js ruby android ios wp8' id='pshowStatusPopup'><h3><strong  >showStatusPopup</strong><span style='font-size:.7em;font-weight:normal;'> : <span class='text-info'>BOOLEAN</span>  </span></h3><ul class="nav nav-tabs" style="padding-left:8px"><li class='active'><a href="#pshowStatusPopup1" data-toggle="tab">Description</a></li><li ><a href="#pshowStatusPopup2" data-toggle="tab">Params</a></li><li ><a href="#pshowStatusPopup6" data-toggle="tab">Access</a></li></ul><div class='tab-content' style='padding-left:8px' id='tc-showStatusPopup'><div class="tab-pane fade active in" id="pshowStatusPopup1"><p>Enable or disable show status popup.</p>
<p><div><p><img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript"><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"><img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android"><img src="/img/ios.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="iphone, ipod touch, ipad"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"><img src="/img/wp8.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Phone 8, Windows Embedded 8"><img src="/img/windows.jpg" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Desktop"> </p></div></p></div><div class="tab-pane fade" id="pshowStatusPopup2"><p><strong>Default:</strong> true</p></div><div class="tab-pane fade" id="pshowStatusPopup5"></div><div class="tab-pane fade" id="pshowStatusPopup6"><div><p><strong>Property Access:</strong></p><ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.showStatusPopup</code></li></ul></li></ul></div></div></div>  </div><a name='psslVerifyPeer'></a><div class=' method  js ruby android ios wp8' id='psslVerifyPeer'><h3><strong  >sslVerifyPeer</strong><span style='font-size:.7em;font-weight:normal;'> : <span class='text-info'>BOOLEAN</span>  </span></h3><ul class="nav nav-tabs" style="padding-left:8px"><li class='active'><a href="#psslVerifyPeer1" data-toggle="tab">Description</a></li><li ><a href="#psslVerifyPeer2" data-toggle="tab">Params</a></li><li ><a href="#psslVerifyPeer6" data-toggle="tab">Access</a></li></ul><div class='tab-content' style='padding-left:8px' id='tc-sslVerifyPeer'><div class="tab-pane fade active in" id="psslVerifyPeer1"><p>Enable or disable verification of RhoConnect ssl certificates, true by default.</p>
<p><div><p><img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript"><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"><img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android"><img src="/img/ios.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="iphone, ipod touch, ipad"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"><img src="/img/wp8.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Phone 8, Windows Embedded 8"><img src="/img/windows.jpg" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Desktop"> </p></div></p></div><div class="tab-pane fade" id="psslVerifyPeer2"><p><strong>Default:</strong> true</p></div><div class="tab-pane fade" id="psslVerifyPeer5"></div><div class="tab-pane fade" id="psslVerifyPeer6"><div><p><strong>Property Access:</strong></p><ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.sslVerifyPeer</code></li></ul></li></ul></div></div></div>  </div><a name='psyncServer'></a><div class=' method  js ruby android ios wp8' id='psyncServer'><h3><strong  >syncServer</strong><span style='font-size:.7em;font-weight:normal;'> : <span class='text-info'>STRING</span>  </span></h3><ul class="nav nav-tabs" style="padding-left:8px"><li class='active'><a href="#psyncServer1" data-toggle="tab">Description</a></li><li ><a href="#psyncServer6" data-toggle="tab">Access</a></li></ul><div class='tab-content' style='padding-left:8px' id='tc-syncServer'><div class="tab-pane fade active in" id="psyncServer1"><p>Sync server URL.</p>
<p><div><p><img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript"><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"><img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android"><img src="/img/ios.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="iphone, ipod touch, ipad"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"><img src="/img/wp8.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Phone 8, Windows Embedded 8"><img src="/img/windows.jpg" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Desktop"> </p></div></p></div><div class="tab-pane fade" id="psyncServer2"></div><div class="tab-pane fade" id="psyncServer5"></div><div class="tab-pane fade" id="psyncServer6"><div><p><strong>Property Access:</strong></p><ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.syncServer</code></li></ul></li></ul></div></div></div>  </div><a name='puserName'></a><div class=' method  js ruby android ios wp8' id='puserName'><h3><strong  >userName</strong><span style='font-size:.7em;font-weight:normal;'> : <span class='text-info'>STRING</span> <span class='label'>Read Only</span> </span></h3><ul class="nav nav-tabs" style="padding-left:8px"><li class='active'><a href="#puserName1" data-toggle="tab">Description</a></li><li ><a href="#puserName6" data-toggle="tab">Access</a></li></ul><div class='tab-content' style='padding-left:8px' id='tc-userName'><div class="tab-pane fade active in" id="puserName1"><p>Current username of the RhoConnectClient session if isLoggedIn is true, otherwise returns the last logged in username.</p>
<p><div><p><img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript"><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"><img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android"><img src="/img/ios.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="iphone, ipod touch, ipad"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"><img src="/img/wp8.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Phone 8, Windows Embedded 8"><img src="/img/windows.jpg" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Desktop"> </p></div></p></div><div class="tab-pane fade" id="puserName2"></div><div class="tab-pane fade" id="puserName5"></div><div class="tab-pane fade" id="puserName6"><div><p><strong>Property Access:</strong></p><ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.userName</code></li></ul></li></ul></div></div></div>  </div>
<a name='Examples'></a>
<h2><i class='icon-edit'></i>Examples</h2>

<a name='e0'></a><div class=' example' id='e0'><div class="accordion-group"><div class="accordion-heading"><span class="accordion-toggle"   href="#cExample0"><strong>Sync Authentication</strong></div><div id="cExample0" class="accordion-body">  <div class="accordion-inner">
<p>In your controller call login.</p>
<ul class='nav nav-tabs' id='exI0-S0Tab'><li class='active'><a href='#exI0-S0JS' data-toggle='tab'>JavaScript</a></li><li ><a href='#exI0-S0RUBY' data-toggle='tab'>Ruby</a></li></ul><div class='tab-content'><div class='tab-pane active' id='exI0-S0JS'><pre class='CodeRay'><code>:::javascript


Rho.RhoConnectClient.login('john','password',function(result){
   loginCallback(result);
});
                          </code></pre></div><div class='tab-pane' id='exI0-S0RUBY'><pre class='CodeRay'><code>:::ruby


RhoConnectClient.login(
  @params['login'],
  @params['password'],
  url_for(:action =&gt; :login_callback)
)
                          </code></pre></div></div>
<pre><code>                        When RhoConnectClient.login completes, the callback declared is executed and receives parameters including success or failure and error messages (if any).
</code></pre>
<ul class='nav nav-tabs' id='exI0-S1Tab'><li class='active'><a href='#exI0-S1JS' data-toggle='tab'>JavaScript</a></li><li ><a href='#exI0-S1RUBY' data-toggle='tab'>Ruby</a></li></ul><div class='tab-content'><div class='tab-pane active' id='exI0-S1JS'><pre class='CodeRay'><code>:::javascript

// Error codes:
// ERR_NONE = 0
// ERR_NETWORK = 1
// ERR_REMOTESERVER = 2
// ERR_RUNTIME = 3
// ERR_UNEXPECTEDSERVERRESPONSE = 4
// ERR_DIFFDOMAINSINSYNCSRC = 5
// ERR_NOSERVERRESPONSE = 6
// ERR_CLIENTISNOTLOGGEDIN = 7
// ERR_CUSTOMSYNCSERVER = 8
// ERR_UNATHORIZED = 9

function loginCallback(result) {
  var errorCode = parseInt(result.error_code);
  var errorMessage = result.error_message;
  if(errorCode === 0 {
    // process success
  } else {
    // process error with errorMessage
  }
}
                            </code></pre></div><div class='tab-pane' id='exI0-S1RUBY'><pre class='CodeRay'><code>:::ruby

# Error codes:
# ERR_NONE = 0
# ERR_NETWORK = 1
# ERR_REMOTESERVER = 2
# ERR_RUNTIME = 3
# ERR_UNEXPECTEDSERVERRESPONSE = 4
# ERR_DIFFDOMAINSINSYNCSRC = 5
# ERR_NOSERVERRESPONSE = 6
# ERR_CLIENTISNOTLOGGEDIN = 7
# ERR_CUSTOMSYNCSERVER = 8
# ERR_UNATHORIZED = 9

def login_callback
  error_code = @params['error_code'].to_i
  if error_code == Rho::RhoError::ERR_NONE
    # run sync if we were successful
    WebView.navigate Rho::RhoConfig.options_path
    RhoConnectClient.doSync
  else
    if error_code == Rho::RhoError::ERR_CUSTOMSYNCSERVER
      @msg = @params['error_message']
    end

    if not @msg or @msg.length == 0
      @msg = Rho::RhoError.new(error_code).message
    end

    WebView.navigate(
      url_for(:action =&gt; :login, :query =&gt; {:msg =&gt; @msg})
    )
  end
end
                            </code></pre></div></div>  </div></div></div></div><a name='e1'></a><div class=' example' id='e1'><div class="accordion-group"><div class="accordion-heading"><span class="accordion-toggle"   href="#cExample1"><strong>Notifications</strong></div><div id="cExample1" class="accordion-body">  <div class="accordion-inner">
<p>First, assign a sync notification for the Account model:</p>
<ul class='nav nav-tabs' id='exI1-S0Tab'><li class='active'><a href='#exI1-S0JS' data-toggle='tab'>JavaScript</a></li><li ><a href='#exI1-S0RUBY' data-toggle='tab'>Ruby</a></li></ul><div class='tab-content'><div class='tab-pane active' id='exI1-S0JS'><pre class='CodeRay'><code>:::javascript

function syncNotify(params) {
  // handle notifications...
}
Rho.RhoConnectClient.setNotification('Account', syncNotify);

                            </code></pre></div><div class='tab-pane' id='exI1-S0RUBY'><pre class='CodeRay'><code>:::ruby

RhoConnectClient.setNotification(
  'Account',
  url_for(:action =&gt; :sync_notify),
  "sync_complete=true"
)
                            </code></pre></div></div>
<p>Which is the same as:</p>
<ul class='nav nav-tabs' id='exI1-S1Tab'><li class='active'><a href='#exI1-S1JS' data-toggle='tab'>JavaScript</a></li><li ><a href='#exI1-S1RUBY' data-toggle='tab'>Ruby</a></li></ul><div class='tab-content'><div class='tab-pane active' id='exI1-S1JS'><pre class='CodeRay'><code>:::javascript

function syncNotify() {
  // handle notifications...
}
Account.setNotification(syncNotify);

                            </code></pre></div><div class='tab-pane' id='exI1-S1RUBY'><pre class='CodeRay'><code>:::ruby

Account.setNotification(
  url_for(:action =&gt; :sync_notify),
  "sync_complete=true"
)
                            </code></pre></div></div>
<p>You can also set a notification for all models:</p>
<ul class='nav nav-tabs' id='exI1-S2Tab'><li class='active'><a href='#exI1-S2JS' data-toggle='tab'>JavaScript</a></li><li ><a href='#exI1-S2RUBY' data-toggle='tab'>Ruby</a></li></ul><div class='tab-content'><div class='tab-pane active' id='exI1-S2JS'><pre class='CodeRay'><code>:::javascript

function syncNotify(params) {
  // handle notifications...
}
Rho.RhoConnectClient.setNotification('*', syncNotify);

                            </code></pre></div><div class='tab-pane' id='exI1-S2RUBY'><pre class='CodeRay'><code>:::ruby

RhoConnectClient.setNotification(
  '*',
  url_for(:action =&gt; :sync_notify),
  "sync_complete=true"
)
                            </code></pre></div></div>  </div></div></div></div><a name='e2'></a><div class=' example' id='e2'><div class="accordion-group"><div class="accordion-heading"><span class="accordion-toggle"   href="#cExample2"><strong>Object notifications</strong></div><div id="cExample2" class="accordion-body">  <div class="accordion-inner">
<p>To use object notifications, first set the notification callback in application.rb#initialize.</p>
<ul class='nav nav-tabs' id='exI2-S0Tab'><li class='active'><a href='#exI2-S0RUBY' data-toggle='tab'>Ruby</a></li></ul><div class='tab-content'><div class='tab-pane active' id='exI2-S0RUBY'><pre class='CodeRay'><code>:::ruby

class AppApplication &lt; Rho::RhoApplication
    def initialize
        super

        RhoConnectClient.setObjectNotification(
            url_for(
                :controller =&gt; "Product",
                :action =&gt; :sync_object_notify
            )
        )
    end
end
                            </code></pre></div></div>
<p>Next, in your controller action that displays the object(s), add the object notification by passing in a record or collection of records:</p>
<ul class='nav nav-tabs' id='exI2-S1Tab'><li class='active'><a href='#exI2-S1JS' data-toggle='tab'>JavaScript</a></li><li ><a href='#exI2-S1RUBY' data-toggle='tab'>Ruby</a></li></ul><div class='tab-content'><div class='tab-pane active' id='exI2-S1JS'><pre class='CodeRay'><code>:::javascript

function syncObjectNotified(params) {
  // handle notifications...
}

var product = Product.find('first');

Rho.RhoConnectClient.addObjectNotify('Product', product.id);

                            </code></pre></div><div class='tab-pane' id='exI2-S1RUBY'><pre class='CodeRay'><code>:::ruby

class ProductController &lt; Rho::RhoController
  # GET /Product
  def index
    @product = Product.find(:first)

    RhoConnectClient.addObjectNotify('Product', @product.id)
    render
  end

  # ...

  def sync_object_notified
    # process notification data ...

    # refresh the current page
    WebView.refresh
    # or call System.execute_js to update part of the page
  end
end

                            </code></pre></div></div>  </div></div></div></div><a name='e3'></a><div class=' example' id='e3'><div class="accordion-group"><div class="accordion-heading"><span class="accordion-toggle"   href="#cExample3"><strong>Handling Errors</strong></div><div id="cExample3" class="accordion-body">  <div class="accordion-inner">
<p>Here we will set a notification and log an error code 1 or ERR_NETWORK:</p>
<ul class='nav nav-tabs' id='exI3-S0Tab'><li class='active'><a href='#exI3-S0JS' data-toggle='tab'>JavaScript</a></li><li ><a href='#exI3-S0RUBY' data-toggle='tab'>Ruby</a></li></ul><div class='tab-content'><div class='tab-pane active' id='exI3-S0JS'><pre class='CodeRay'><code>:::javascript

function syncNotify(result) {
  var errorCode = parseInt(result.error_code);
  var errorMessage = result.error_message;
  if(errorCode === 1) {
    console.log("We received a network error: " + errorMessage);
    return;
  }
}
Rho.RhoConnectClient.setNotification('*', syncNotify);

                            </code></pre></div><div class='tab-pane' id='exI3-S0RUBY'><pre class='CodeRay'><code>:::ruby

RhoConnectClient.setNotification(
  '*',
  url_for(:action =&gt; :sync_notify),
  "sync_complete=true"
)

# In your controller:
def sync_notify
  error_code = @params['error_code'].to_i
  error_message = @params['error_message']
  if error_code == Rho::RhoError::ERR_NETWORK
    puts "We received a network error: " + error_message 
  end
end


                            </code></pre></div></div>  </div></div></div></div><a name='e4'></a><div class=' example' id='e4'><div class="accordion-group"><div class="accordion-heading"><span class="accordion-toggle"   href="#cExample4"><strong>Using search (Ruby Only)</strong></div><div id="cExample4" class="accordion-body">  <div class="accordion-inner">
<p>First, call search from your controller action:</p>
<ul class='nav nav-tabs' id='exI4-S0Tab'><li class='active'><a href='#exI4-S0RUBY' data-toggle='tab'>Ruby</a></li></ul><div class='tab-content'><div class='tab-pane active' id='exI4-S0RUBY'><pre class='CodeRay'><code>:::ruby

def search
  page = @params['page'] || 0
  page_size = @params['page_size'] || 10
  RhoConnectClient.search(
    {
      'Contact',
      :from =&gt; 'search',
      :search_params =&gt; {
        :FirstName =&gt; @params['FirstName'],
        :LastName =&gt; @params['LastName'],
        :Company =&gt; @params['Company']
      },
      :offset =&gt; page * page_size,
      :max_results =&gt; page_size
    }
    url_for(:action =&gt; :search_callback)
  )
  render :action =&gt; :search_wait
end

                            </code></pre></div></div>
<p>The <code>search_params</code> will be forwarded to your callback so you can update the view with the results:</p>
<ul class='nav nav-tabs' id='exI4-S1Tab'><li class='active'><a href='#exI4-S1RUBY' data-toggle='tab'>Ruby</a></li></ul><div class='tab-content'><div class='tab-pane active' id='exI4-S1RUBY'><pre class='CodeRay'><code>:::ruby

def search_callback
  status = @params["status"]
  if (status and status == "ok")
  WebView.navigate(
    url_for(
      :action =&gt; :show_page,
      :query =&gt; @params['search_params']
    )
  )
  else
    render :action =&gt; :search_error
  end
end

def show_page
  @contacts = Contact.find(
    :all,
    :conditions =&gt; {
    {
      :func =&gt; 'LOWER',
      :name =&gt; 'FirstName',
      :op =&gt; 'LIKE'
    } =&gt; @params[:FirstName],
    {
      :func =&gt; 'LOWER',
      :name=&gt;'LastName',
      :op=&gt;'LIKE'
    } =&gt; @params[:LastName],
    {
      :func=&gt;'LOWER',
      :name=&gt;'Company',
      :op=&gt;'LIKE'
    } =&gt; @params[:Company],
    },
    :op =&gt; 'OR',
    :select =&gt; ['FirstName','LastName', 'Company'],
    :per_page =&gt; page_size,
    :offset =&gt; page * page_size
  )
  render :action =&gt; :show_page
end

                            </code></pre></div></div>  </div></div></div></div>
<a name='Remarks'></a>
<h2><i class='icon-warning-sign'></i>Remarks</h2>

<a name='r0'></a><div class=' remarks' id='r0'><div class="accordion-group"><div class="accordion-heading"><span class="accordion-toggle"  href="#cRemark0"><strong>Notification Callback Parameters</strong></div><div id="cRemark0" class="accordion-body">  <div class="accordion-inner"><p>When the notification is called, it will receive a variable called @params, just like a normal Rhodes controller action.</p>

<h2>Common Parameters</h2>

<p>These parameters are included in all notifications.</p>

<ul>
<li>source_id &ndash; The id of the current model that is synchronizing.</li>
<li>source_name &ndash; Name of the model (i.e. &ldquo;Product&rdquo;)</li>
<li>sync_type &ndash; Type of sync used for this model: &ldquo;incremental&rdquo; or &ldquo;bulk&rdquo;</li>
<li>status &ndash; Status of the current sync process. See below for the possible values:</li>
</ul>


<p>In the following sections we cover the different status values and parameters available with each status.</p>

<h3>status: &ldquo;in_progress&rdquo; &ndash; incremental sync progress</h3>

<ul>
<li>total_count &ndash; Total number of records that exist for this RhoConnect source.</li>
<li>processed_count &ndash; Number of records included in the sync page.</li>
<li>cumulative_count &ndash; Number of records the SyncEngine has processed so far for this source.</li>
</ul>


<h3>status: &ldquo;in_progress&rdquo; &ndash; bulk sync progress</h3>

<ul>
<li><p>bulk_status &ndash; The state of the bulk sync process:</p>

<ul>
<li>start &ndash; Bulk sync has started for a specific partition</li>
<li>download &ndash; Bulk sync file download has started</li>
<li>change_db &ndash; New bulk sync database change has started</li>
<li>blobs &ndash; Bulk sync blob files have started to download</li>
<li>ok &ndash; Current partition has completed</li>
<li>complete &ndash; All partitions have completed</li>
</ul>
</li>
<li><p>partition &ndash; Current bulk sync partition.</p></li>
</ul>


<h3>status: &ldquo;error&rdquo;</h3>

<ul>
<li>error_code &ndash; HTTP response code of the RhoConnect server error: 401, 500, 404, etc.</li>
<li>error_message &ndash; Response body (if any)</li>
<li>server_errors &ndash; Hash of Type objects of RhoConnect adapter error (if exists):

<ul>
<li>login-error &ndash; An error in adapter login method</li>
<li>query-error &ndash; An error in adapter query method</li>
<li>create-error &ndash; An error in adapter create method</li>
<li>update-error &ndash; An error in adapter update method</li>
<li>delete-error &ndash; An error in adapter delete method</li>
<li>logoff-error &ndash; An error in adapter logoff method</li>
</ul>
</li>
</ul>


<p>Each error contains a &lsquo;message&rsquo; key with the error message.</p>

<p>Ruby Example:</p>

<pre><code>:::ruby
@params["server_errors"]["query-error"]["message"] 
#=&gt; "Error connecting to backend server: http://rhostore.herokuapp.com"
</code></pre>

<p>JavaScript Example:</p>

<pre><code>:::javascript
params.server_errors["query-error"].message
//=&gt; "Error connecting to backend server: http://rhostore.herokuapp.com"
</code></pre>

<h4>Handling &lsquo;create-error&rsquo;</h4>

<p>&ldquo;create-error&rdquo; is a unique situation that needs to be handled in your sync callback. See <code>RhoConnectClient.onSyncCreateError()</code> for more details.</p>

<h3>status: &ldquo;complete&rdquo;</h3>

<p>This status returns only when the sync run is complete (all partitions are done synchronizing).</p>

<h3>status: &ldquo;schema-changed&rdquo;</h3>

<p>This is present if a FixedSchema model has changed during the current sync run. A new bulk sync run should be triggered (by setting bulksyncState) and the user should be alerted in the UI.</p>
  </div></div></div></div><a name='r1'></a><div class=' remarks' id='r1'><div class="accordion-group"><div class="accordion-heading"><span class="accordion-toggle"  href="#cRemark1"><strong>Backround Sync on iOS</strong></div><div id="cRemark1" class="accordion-body">  <div class="accordion-inner"><p>On iOS, if the application is backgrounded, it will be suspended. This also means if a current sync is in progress, it will immediately terminate. To prevent this behavior, set &lsquo;finish_sync_in_background&rsquo; to &lsquo;1&rsquo; in rhoconfig.txt. When set to &lsquo;1&rsquo;, the RhoConnectClient will attempt to finish synchronization before the application fully suspends.</p>
  </div></div></div></div></div>