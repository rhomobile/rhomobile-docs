#NativeMenubar
<div class="btn-group"><a href="#Properties" class="btn"><i class="icon-list"></i> Properties<sup>&nbsp;5</sup></a><button href="#" class="btn dropdown-toggle" data-toggle="dropdown">  <span class="caret"></span>&nbsp;</button><ul class="dropdown-menu" style="max-height: 500px;overflow: auto;"><li class="disabled"><a tabindex="-1" href="#"><b><i>Class Properties</i></b></a><li><a href="#pdefaultMainMenu" data-target="cPropertydefaultMainMenu" class="autouncollapse">defaultMainMenu</a></li><li><a href="#pextraButton" data-target="cPropertyextraButton" class="autouncollapse">extraButton</a></li><li><a href="#pextraMenu" data-target="cPropertyextraMenu" class="autouncollapse">extraMenu</a></li><li><a href="#pmainButton" data-target="cPropertymainButton" class="autouncollapse">mainButton</a></li><li><a href="#pmainMenu" data-target="cPropertymainMenu" class="autouncollapse">mainMenu</a></li></li></ul></div><div class="btn-group"><a href="#Examples" class="btn"><i class="icon-edit"></i> Examples<sup>&nbsp;2</sup></a><button href="#" class="btn dropdown-toggle" data-toggle="dropdown">  <span class="caret"></span>&nbsp;</button><ul class="dropdown-menu" style="max-height: 500px;overflow: auto;"><li><a href="#e0" data-target="eExample0" class="autouncollapse">Customize the extra menu</a></li><li><a href="#e1" data-target="eExample1" class="autouncollapse">Clear the main menu</a></li></ul></div><div class="btn-group pull-right"><button class="btn dropdown-toggle" id="apiFilterBtn" data-toggle="dropdown" href="#" title="Filter Properties and Methods"><i class="icon-filter "></i>Show</button><select id="apiFilter" class="dropdown-menu apiFilter"><option value="all">All</option><option value="js">JavaScript</option><option value="ruby">Ruby</option><option value="android">Android</option><option value="ios">iOS</option><option value="wm">Windows Mobile</option><option value="wp8">Windows Phone 8</option><option value="w32">Windows Desktop</option><option value="msi">MSI Only</option></select></div><div  id="apibody" style="overflow:auto;padding-right: 5px;">
<p>The NativeMenubar API lets you customize the Windows Mobile/CE native menu buttons.</p>
<h2>Enabling the API</h2>

<p>This API is part of the <code>coreapi</code> extension that is included automatically.</p>

<pre><code>:::ruby
extensions: ["coreapi"]
</code></pre>

<h2>JavaScript Usage</h2>

<p>Be sure to review the <a href="/guide/api_js">JavaScript API Usage</a> guide for important information about using this API in JavaScript.</p>

<h2>Ruby Usage</h2>

<p>Be sure to review the <a href="/guide/api_ruby">Ruby API Usage</a> guide for important information about using this API in Ruby.</p>


<a name='Properties'></a>
<h2><i class='icon-list'></i>Properties</h2>

<a name='pdefaultMainMenu'></a><div class=' method  ruby' id='pdefaultMainMenu'><h3><strong  >defaultMainMenu</strong><span style='font-size:.7em;font-weight:normal;'> : <span class='text-info'>ARRAY</span> <span class='label'>Read Only</span> </span></h3><ul class="nav nav-tabs" style="padding-left:8px"><li class='active'><a href="#pdefaultMainMenu1" data-toggle="tab">Description</a></li><li ><a href="#pdefaultMainMenu2" data-toggle="tab">Params</a></li><li ><a href="#pdefaultMainMenu6" data-toggle="tab">Access</a></li></ul><div class='tab-content' style='padding-left:8px' id='tc-defaultMainMenu'><div class="tab-pane fade active in" id="pdefaultMainMenu1"><p>This will return what the default right menu should be. This is a read-only property.</p>
<p><div><p><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"> </p></div></p></div><div class="tab-pane fade" id="pdefaultMainMenu2"><li><i>Object<i> : <span class='text-info'>HASH</span><p> </p></li></div><div class="tab-pane fade" id="pdefaultMainMenu5"></div><div class="tab-pane fade" id="pdefaultMainMenu6"><div><p><strong>Property Access:</strong></p><ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.defaultMainMenu</code></li></ul></li></ul></div></div></div>  </div><a name='pextraButton'></a><div class=' method  js ruby' id='pextraButton'><h3><strong  >extraButton</strong><span style='font-size:.7em;font-weight:normal;'> : <span class='text-info'>HASH</span>  </span></h3><ul class="nav nav-tabs" style="padding-left:8px"><li class='active'><a href="#pextraButton1" data-toggle="tab">Description</a></li><li ><a href="#pextraButton6" data-toggle="tab">Access</a></li></ul><div class='tab-content' style='padding-left:8px' id='tc-extraButton'><div class="tab-pane fade active in" id="pextraButton1"><p>Defined behavior of the Left menu button for Windows Mobile applications. This takes the same HASH as a menu item {label: &lsquo;Left Button&rsquo;, action: &lsquo;alert(&ldquo;You pressed the left button&rdquo;)&rsquo;}. If your menu is using menu items via mainMenu, then be sure to not set an action for the extraButton. Setting an action for the extraButton will cause the mainMenu setting to be ignored.</p>
<p><div><p><img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript"><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"> </p></div></p></div><div class="tab-pane fade" id="pextraButton2"></div><div class="tab-pane fade" id="pextraButton5"></div><div class="tab-pane fade" id="pextraButton6"><div><p><strong>Property Access:</strong></p><ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.extraButton</code></li></ul></li></ul></div></div></div>  </div><a name='pextraMenu'></a><div class=' method  js ruby' id='pextraMenu'><h3><strong  >extraMenu</strong><span style='font-size:.7em;font-weight:normal;'> : <span class='text-info'>ARRAY</span>  </span></h3><ul class="nav nav-tabs" style="padding-left:8px"><li class='active'><a href="#pextraMenu1" data-toggle="tab">Description</a></li><li ><a href="#pextraMenu2" data-toggle="tab">Params</a></li><li ><a href="#pextraMenu6" data-toggle="tab">Access</a></li></ul><div class='tab-content' style='padding-left:8px' id='tc-extraMenu'><div class="tab-pane fade active in" id="pextraMenu1"><p>The Left menu items for Windows Mobile applications. This defines the list of menu choices when the extraButton is pressed.</p>
<p><div><p><img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript"><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"> </p></div></p></div><div class="tab-pane fade" id="pextraMenu2"><li><i>Object<i> : <span class='text-info'>HASH</span><p><p>Same values as for mainMenu.</p>
 </p></li></div><div class="tab-pane fade" id="pextraMenu5"></div><div class="tab-pane fade" id="pextraMenu6"><div><p><strong>Property Access:</strong></p><ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.extraMenu</code></li></ul></li></ul></div></div></div>  </div><a name='pmainButton'></a><div class=' method  js ruby' id='pmainButton'><h3><strong  >mainButton</strong><span style='font-size:.7em;font-weight:normal;'> : <span class='text-info'>HASH</span>  </span></h3><ul class="nav nav-tabs" style="padding-left:8px"><li class='active'><a href="#pmainButton1" data-toggle="tab">Description</a></li><li ><a href="#pmainButton6" data-toggle="tab">Access</a></li></ul><div class='tab-content' style='padding-left:8px' id='tc-mainButton'><div class="tab-pane fade active in" id="pmainButton1"><p>Defined behavior of the Right menu button for Windows Mobile applications. This takes the same HASH as a menu item {label: &lsquo;Right Button&rsquo;, action: &lsquo;javascript: alert(&ldquo;You pressed the right button&rdquo;);&rsquo;}. If your menu is using menu items via mainMenu, then be sure to not set an action for the mainButton. Setting an action for the mainButton will cause the mainMenu setting to be ignored.</p>
<p><div><p><img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript"><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"> </p></div></p></div><div class="tab-pane fade" id="pmainButton2"></div><div class="tab-pane fade" id="pmainButton5"></div><div class="tab-pane fade" id="pmainButton6"><div><p><strong>Property Access:</strong></p><ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.mainButton</code></li></ul></li></ul></div></div></div>  </div><a name='pmainMenu'></a><div class=' method  js ruby' id='pmainMenu'><h3><strong  >mainMenu</strong><span style='font-size:.7em;font-weight:normal;'> : <span class='text-info'>ARRAY</span>  </span></h3><ul class="nav nav-tabs" style="padding-left:8px"><li class='active'><a href="#pmainMenu1" data-toggle="tab">Description</a></li><li ><a href="#pmainMenu2" data-toggle="tab">Params</a></li><li ><a href="#pmainMenu6" data-toggle="tab">Access</a></li></ul><div class='tab-content' style='padding-left:8px' id='tc-mainMenu'><div class="tab-pane fade active in" id="pmainMenu1"><p>The Right menu items in Windows Mobile applications. This defines the list of menu choices when the mainButton is pressed.</p>
<p><div><p><img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript"><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"> </p></div></p></div><div class="tab-pane fade" id="pmainMenu2"><li><i>Object<i> : <span class='text-info'>HASH</span><p> </p></li><ul><li>label : <span class='text-info'>STRING</span><p><p>Visible label.</p>
 </p></li><li>action : <span class='text-info'>STRING</span><p><p>URL to page which will be loaded into tab. It may be path to Ruby controller action; i.e. &lsquo;/app/Account&rsquo; would load the Account index action. For ruby callback use &lsquo;callback:/app/Account&rsquo; Or JavaScript method to call: &lsquo;javascript: methodOnTab();&rsquo;. Or path to html page to load.</p>
 </p></li><li>disabled : <span class='text-info'>BOOLEAN</span><span class='label '> Default: false</span><p><p>Menu item will be displayed as disabled.</p>
 Platforms:WM </p></li></ul></div><div class="tab-pane fade" id="pmainMenu5"></div><div class="tab-pane fade" id="pmainMenu6"><div><p><strong>Property Access:</strong></p><ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.mainMenu</code></li></ul></li></ul></div></div></div>  </div>
<a name='Examples'></a>
<h2><i class='icon-edit'></i>Examples</h2>

<a name='e0'></a><div class=' example' id='e0'><div class="accordion-group"><div class="accordion-heading"><span class="accordion-toggle"   href="#cExample0"><strong>Customize the extra menu</strong></div><div id="cExample0" class="accordion-body">  <div class="accordion-inner">
<ul class='nav nav-tabs' id='exI0-S0Tab'><li class='active'><a href='#exI0-S0JS' data-toggle='tab'>JavaScript</a></li><li ><a href='#exI0-S0RUBY' data-toggle='tab'>Ruby</a></li></ul><div class='tab-content'><div class='tab-pane active' id='exI0-S0JS'><pre class='CodeRay'><code>:::javascript

                  
Rho.NativeMenubar.extraButton = {
    label: "Extra"
};

Rho.NativeMenubar.extraMenu = [
  {
      label: "Show alert 1",
      action: javascript:show_alert_1();,
  },
  {
      label: "Show alert 2",
      action: javascript:show_alert_2();,
  },
  {
      label: "Win the lottery",
      disabled: true
  }
];
                  
                 </code></pre></div><div class='tab-pane' id='exI0-S0RUBY'><pre class='CodeRay'><code>:::ruby

                  
Rho::NativeMenubar.extraButton = {
  :label =&gt; "Extra"
}

Rho::NativeMenubar.extraMenu = [
  {
    :label =&gt; "Show alert 1",
    :action =&gt; url_for(:action =&gt; :show_alert_1)
  },
  {
    :label =&gt; "Show alert 2",
    :action =&gt; url_for(:action =&gt; :show_alert_2)
  },
  {
    :label =&gt; "Win the lottery",
    :disabled =&gt; true
  }
]
                  
                 </code></pre></div></div>  </div></div></div></div><a name='e1'></a><div class=' example' id='e1'><div class="accordion-group"><div class="accordion-heading"><span class="accordion-toggle"   href="#cExample1"><strong>Clear the main menu</strong></div><div id="cExample1" class="accordion-body">  <div class="accordion-inner">
<ul class='nav nav-tabs' id='exI1-S0Tab'><li class='active'><a href='#exI1-S0JS' data-toggle='tab'>JavaScript</a></li><li ><a href='#exI1-S0RUBY' data-toggle='tab'>Ruby</a></li></ul><div class='tab-content'><div class='tab-pane active' id='exI1-S0JS'><pre class='CodeRay'><code>:::javascript

                  
function remove_menuitems() {
    Rho.NativeMenubar.mainMenu = [];
}
                  
                 </code></pre></div><div class='tab-pane' id='exI1-S0RUBY'><pre class='CodeRay'><code>:::ruby

                  
def remove_menuitems
  Rho::NativeMenubar.mainMenu = []
end
                  
                 </code></pre></div></div>  </div></div></div></div></div>