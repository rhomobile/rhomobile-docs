# AddressBar Module
<!-- Properties Dropdown -->
<div class="btn-group">
	<a href="#Properties" class="btn"><i class="icon-list"></i> Properties<sup>&nbsp;4</sup></a>
	<button href="#" class="btn dropdown-toggle" data-toggle="dropdown"><span class="caret"></span>&nbsp;</button>
	<ul class="dropdown-menu" style="max-height: 500px;overflow: auto;">
		<li class="disabled"><a tabindex="-1" href="#"><b><i>Class Properties</i></b></a>
			<li><a href="#pVisibility" data-target="cPropertyVisibility" class="autouncollapse">visibility</a></li>
			<li><a href="#pLeft" data-target="cPropertyLeft" class="autouncollapse">left</a></li>
			<li><a href="#pTop" data-target="cPropertyTop" class="autouncollapse">top</a></li>
			<li><a href="#pWidth" data-target="cPropertyWidth" class="autouncollapse">width</a></li>
		</li>
	</ul>
</div>

<!-- Examples Dropdown -->
<div class="btn-group">
	<a href="#Examples" class="btn"><i class="icon-edit"></i> Examples<sup>&nbsp;1</sup></a>
	<button href="#" class="btn dropdown-toggle" data-toggle="dropdown"><span class="caret"></span>&nbsp;</button>
	<ul class="dropdown-menu" style="max-height: 500px;overflow: auto;">
		<li><a href="#eOne" data-target="eExampleOne" class="autouncollapse">AddressBar Example</a></li>
		</li>
	</ul>
</div>

<!-- Remarks Dropdown -->
<div class="btn-group">
	<a href="#Remarks" class="btn"><i class="icon-warning-sign"></i> Remarks<sup>&nbsp;5</sup></a>
	<button href="#" class="btn dropdown-toggle" data-toggle="dropdown"><span class="caret"></span>&nbsp;</button>
	<ul class="dropdown-menu" style="max-height: 500px;overflow: auto;">
		<li><a href="#rOne" data-target="rRemarkOne" class="autouncollapse">Default Positions</a></li>
		<li><a href="#rTwo" data-target="rRemarkTwo" class="autouncollapse">Switching to Other Applications</a></li>
		<li><a href="#rThree" data-target="rRemarkThree" class="autouncollapse">Screen Orientation</a></li>
		<li><a href="#rFour" data-target="rRemarkFour" class="autouncollapse">Named Anchors</a></li>
		<li><a href="#rFive" data-target="rRemarkFive" class="autouncollapse">Use in Production</a></li>
	</ul>
</div>

<div id="apibody" style="overflow:auto;padding-right: 5px;">

	<p>The AddressBar Module is used to set the parameters of the address bar. The address bar should only be used for debugging Hybrid applications and is not designed to be used as a replacement for a web browser address bar. Press the 'Go' button or enter key to navigate to the typed URI.</p>

	<h2>Enabling the API</h2>
	In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

	* elements.js 

	> Note - this file either needs to be on the device in a relative folder from where your HTML page is, or it must be copied to your web server appropriately.

	<h3>API Usage</h3>
	This API does not use the `EB` namespace. It is simply referenced using the API name:

<pre class='CodeRay'>
	<code>:::javascript
addressBar.left = 0;
	</code>
</pre>

	<p>NOTE: If you are building a Windows Mobile or Windows CE app with this API, you must set your app_type as &ldquo;rhoelements&rdquo; in your build.yml as shown <a href="../guide/build_config#other-build-time-settings">here</a>.</p>

	<h2>JavaScript Usage</h2>

	<p>Be sure to review the <a href="/guide/api_js">JavaScript API Usage</a> guide for important information about using this API in JavaScript.</p>

	<!-- Properties Definitions -->
	<a name='Properties'></a>
	<h2><i class='icon-list'></i>Properties</h2>

	<a name='pVisibility'></a>
	<div class=' method  js ruby' id='pVisibility'>
		<h3><strong>visibility</strong><span style='font-size:.7em;font-weight:normal;'> : <span class='text-info'>STRING</span>  </span></h3>
		<ul class="nav nav-tabs" style="padding-left:8px">
			<li class='active'><a href="#pVisibility1" data-toggle="tab">Description</a></li>
			<li><a href="#pVisibility2" data-toggle="tab">Parameters</a></li>
			<li><a href="#pVisibility6" data-toggle="tab">Access</a></li>
		</ul>
		<div class='tab-content' style='padding-left:8px' id='tc-Visibility'>
			<div class="tab-pane fade active in" id="pVisibility1">
				<p>Sets the visibility to either show or hide the address bar.</p><p>
				<div>
					<p>
						<img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript">
						<img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby">
						<img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded">
					</p>
				</div>
			</p>
		</div>
		<div class="tab-pane fade" id="pVisibility2">
			<p><strong>Default:</strong> "hidden"</p>
		</div>
		<div class="tab-pane fade" id="pVisibility5"></div>
		<div class="tab-pane fade" id="pVisibility6"><div>
			<p>
				<strong>Visibility Access:</strong>
			</p>
			<ul>
				<li>
					<i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class:
					<ul>
						<li><code>addressBar.visibility = "visible";</code></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	</div>
	</div>

	<a name='pLeft'></a>
	<div class=' method  js ruby ios' id='pLeft'>
		<h3><strong>Left</strong><span style='font-size:.7em;font-weight:normal;'> : <span class='text-info'>INTEGER</span>  </span></h3>
		<ul class="nav nav-tabs" style="padding-left:8px">
			<li class='active'>
				<a href="#pLeft1" data-toggle="tab">Description</a>
			</li>
			<li><a href="#pLeft2" data-toggle="tab">Parameters</a></li>
			<li><a href="#pLeft6" data-toggle="tab">Access</a></li>
		</ul>
		<div class='tab-content' style='padding-left:8px' id='tc-Left'>
			<div class="tab-pane fade active in" id="pLeft1">
				<p>Sets the X position of the address bar.</p><p>
				<div>
					<p>
						<img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript">
						<img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby">
						<img src="/img/ios.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="iphone, ipod touch, ipad">
						<img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded">
					</p>
				</div>
			</p>
		</div>
		<div class="tab-pane fade" id="pLeft2">
			<p><strong>Default:</strong> 0</p>
		</div>
		<div class="tab-pane fade" id="pLeft5"></div>
		<div class="tab-pane fade" id="pLeft6"><div>
			<p>
				<strong>Left Access:</strong>
			</p>
			<ul>
				<li>
					<i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class:
					<ul>
						<li><code>addressBar.left = 100;</code></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	</div>
	</div>

	<a name='pTop'></a>
	<div class=' method  js ruby ios' id='pTop'>
		<h3><strong>top</strong><span style='font-size:.7em;font-weight:normal;'> : <span class='text-info'>INTEGER</span></span></h3>
		<ul class="nav nav-tabs" style="padding-left:8px">
			<li class='active'>
				<a href="#pTop1" data-toggle="tab">Description</a>
			</li>
			<li><a href="#pTop2" data-toggle="tab">Parameters</a></li>
			<li><a href="#pTop6" data-toggle="tab">Access</a></li>
		</ul>
		<div class='tab-content' style='padding-left:8px' id='tc-Top'>
			<div class="tab-pane fade active in" id="pTop1">
				<p>Sets the Y position of the address bar.</p><p>
				<div>
					<p>
						<img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript">
						<img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby">
						<img src="/img/ios.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="iphone, ipod touch, ipad">
						<img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded">
					</p>
				</div>
			</p>
		</div>
		<div class="tab-pane fade" id="pTop2">
			<p><strong>Default:</strong> 0</p>
		</div>
		<div class="tab-pane fade" id="pTop5"></div>
		<div class="tab-pane fade" id="pTop6"><div>
			<p>
				<strong>Top Access:</strong>
			</p>
			<ul>
				<li>
					<i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class:
					<ul>
						<li><code>addressBar.top = 100;</code></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	</div>
	</div>

	<a name='pWidth'></a>
	<div class=' method  js ruby ios' id='pWidth'>
		<h3><strong>width</strong><span style='font-size:.7em;font-weight:normal;'> : <span class='text-info'>INTEGER</span>  </span></h3>
		<ul class="nav nav-tabs" style="padding-left:8px">
			<li class='active'>
				<a href="#pWidth1" data-toggle="tab">Description</a>
			</li>
			<li><a href="#pWidth2" data-toggle="tab">Parameters</a></li>
			<li><a href="#pWidth6" data-toggle="tab">Access</a></li>
		</ul>
		<div class='tab-content' style='padding-left:8px' id='tc-Width'>
			<div class="tab-pane fade active in" id="pWidth1">
				<p>Sets the width of the address bar.</p><p>
				<div>
					<p>
						<img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript">
						<img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby">
						<img src="/img/ios.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="iphone, ipod touch, ipad">
						<img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded">
					</p>
				</div>
			</p>
		</div>
		<div class="tab-pane fade" id="pWidth2">
			<p><strong>Default:</strong> Most of the screen width</p>
		</div>
		<div class="tab-pane fade" id="pWidth5"></div>
		<div class="tab-pane fade" id="pWidth6"><div>
			<p>
				<strong>Width Access:</strong>
			</p>
			<ul>
				<li>
					<i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class:
					<ul>
						<li><code>addressBar.width = Rho.System.screenWidth;</code></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	</div>
	</div>

<!-- Examples -->
<!-- ExampleOne -->
<a name='Examples'></a>
<h2><i class='icon-edit'></i>Examples</h2>
<a name='eOne'></a>
<div class=' example' id='eOne'>
	<div class="accordion-group">
		<div class="accordion-heading">
			<span class="accordion-toggle" href="#cExampleOne">
				<strong>Manipulating the Address Bar</strong>
			</div>
			<div id="cExampleOne" class="accordion-body">
				<div class="accordion-inner">
					<p>In this example, you'll see how to manipulate the addressBar using JavaScript. This example assumes that your rhoapi-modules.js file is in the same folder as the html invoking it.</p>
					<ul class='nav nav-tabs' id='exI0-S0Tab'>
						<li class='active'><a href='#exI0-S0JS' data-toggle='tab'>JavaScript</a></li>
						<!-- <li><a href='#exI0-S0RUBY' data-toggle='tab'>Ruby</a></li> -->
					</ul>
					<div class='tab-content'>
						<div class='tab-pane active' id='exI0-S0JS'>
							<pre class='CodeRay'>
								<code>:::javascript
function onLoad(){
	visible = 0;
	screenWidth = EB.System.screenWidth;
}

function toggleAddressBar(){
	if(visible){
		addressBar.visibility = "hidden";
		visible = 0;
	}
	else{
		addressBar.visibility = "visible";
		// Reset addressBar to (0, 0)
		addressBar.left = 0;
		addressBar.top = 0;
		visible = 1;
	}
}

function moveAddressBar(direction, distance){
	switch(direction){
		case "left":
			addressBar.left = distance;
			break;
		case "top":
			addressBar.top = distance;
			break;
		default:
			alert("Invalid direction!!");
	}
}

function addressBarWidth(percent){
	width = screenWidth*(percent/100);
	addressBar.width = width;
}
								</code>
							</pre>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Remarks -->
	<!-- RemarkOne -->
	<a name='Remarks'></a>
	<h2><i class='icon-warning-sign'></i>Remarks</h2>
	<a name='rOne'></a>
	<div class=' remarks' id='rOne'>
		<div class="accordion-group">
			<div class="accordion-heading">
				<span class="accordion-toggle"  href="#cRemarkOne">
					<strong>Default Positions</strong>
				</div>
				<div id="cRemarkOne" class="accordion-body">
					<div class="accordion-inner">
						<p>By default this control will be placed a the top of the screen. On Windows Mobile if the ‘FullScreen’ configuration setting is disabled the control will need to be moved, otherwise it will appear beneath the task bar.</p>
					</div>
				</div>
			</div>
		</div>

	<!-- Remark Two -->
	<a name='rTwo'></a>
	<div class=' remarks' id='rTwo'>
		<div class="accordion-group">
			<div class="accordion-heading">
				<span class="accordion-toggle"  href="#cRemark1">
					<strong>Switching to Other Applications</strong>
				</div>
				<div id="cRemark1" class="accordion-body">
					<div class="accordion-inner">
						<p>All controls are designed to be shown on top of Enteprise Browser. If you require to switch to an application other than Enterprise Browser, you should minimize Enterprise Browser to ensure the buttons do not remain shown. (Not applicable to Android)</p>
					</div>
				</div>
			</div>
		</div>

	<!-- Remark Three -->
	<a name='rThree'></a>
	<div class=' remarks' id='rThree'>
		<div class="accordion-group">
			<div class="accordion-heading">
				<span class="accordion-toggle"  href="#cRemark1">
					<strong>Screen Orientation</strong>
				</div>
				<div id="cRemark1" class="accordion-body">
					<div class="accordion-inner">
						<p>When the screen orientation changes, either using the ScreenOrientation API or by rotating a device with hardware support, the command areas will automatically move and resize to fit the new layout. However the buttons themselves are not moved and in some cases this may result in them being off the screen or not in the expected position. If so they must be moved manually by detecting the ScreenOrientationEvent.</p>
					</div>
				</div>
			</div>
		</div>

	<!-- Remark Four -->
	<a name='rFour'></a>
	<div class=' remarks' id='rFour'>
		<div class="accordion-group">
			<div class="accordion-heading">
				<span class="accordion-toggle"  href="#cRemark1">
					<strong>Named Anchors</strong>
				</div>
				<div id="cRemark1" class="accordion-body">
					<div class="accordion-inner">
						<p>The address bar is not compatible with named anchors (page bookmarks) eg. &lt;a name="bookmark"/&gt;&lt;/p&gt;
					</div>
				</div>
			</div>
		</div>

	<!-- Remark Five -->
	<a name='rFive'></a>
	<div class=' remarks' id='rFive'>
		<div class="accordion-group">
			<div class="accordion-heading">
				<span class="accordion-toggle"  href="#cRemark1">
					<strong>Use in Production</strong>
				</div>
				<div id="cRemark1" class="accordion-body">
					<div class="accordion-inner">
						<p>This API is designed for debugging your application only and should not be used in production</p>
					</div>
				</div>
			</div>
		</div>

</div>