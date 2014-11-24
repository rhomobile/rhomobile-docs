# API Name

<!-- Methods Dropdown -->
<div class="btn-group">
	<a href="#Methods" class="btn"><i class="icon-cog"></i> Methods<sup>&nbsp;2</sub></a>
	<a class="btn dropdown-toggle" data-toggle="dropdown" data-target="#" href="#Methods" ><span class="caret"></span>&nbsp;</a>
	<ul class="dropdown-menu" style="max-height: 500px;overflow: auto;">
		<li class="disabled">
			<a tabindex="-1" href="#">
				<b><i>Methods - Class</i></b>
			</a>
			<li><a href="#mMethodOne" data-target="cMethodMethodOne" class="autouncollapse">MethodOne</a></li>
			<li><a href="#MethodTwo" data-target="cMethodMethodTwo" class="autouncollapse">MethodTwo</a></li>
		</li>
	</ul>
</div>

<!-- Properties Dropdown -->
<div class="btn-group">
	<a href="#Properties" class="btn"><i class="icon-list"></i> Properties<sup>&nbsp;2</sup></a>
	<button href="#" class="btn dropdown-toggle" data-toggle="dropdown"><span class="caret"></span>&nbsp;</button>
	<ul class="dropdown-menu" style="max-height: 500px;overflow: auto;">
		<li class="disabled"><a tabindex="-1" href="#"><b><i>Class Properties</i></b></a>
			<li>
				<a href="#pPropertyOne" data-target="cPropertyPropertyOne" class="autouncollapse">PropertyOne</a>
			</li>
			<li><a href="#pPropertyTwo" data-target="cPropertyPropertyTwo" class="autouncollapse">PropertyTwo</a></li>
		</li>
	</ul>
</div>

<!-- Examples Dropdown -->
<div class="btn-group">
	<a href="#Examples" class="btn"><i class="icon-edit"></i> Examples<sup>&nbsp;2</sup></a>
	<button href="#" class="btn dropdown-toggle" data-toggle="dropdown"><span class="caret"></span>&nbsp;</button>
	<ul class="dropdown-menu" style="max-height: 500px;overflow: auto;">
		<li><a href="#eOne" data-target="eExampleOne" class="autouncollapse">ExampleOne</a></li>
		<li><a href="#eTwo" data-target="eExampleTwo" class="autouncollapse">ExampleTwo</a>
		</li>
	</ul>
</div>

<!-- Remarks Dropdown -->
<div class="btn-group">
	<a href="#Remarks" class="btn"><i class="icon-warning-sign"></i> Remarks<sup>&nbsp;2</sup></a>
	<button href="#" class="btn dropdown-toggle" data-toggle="dropdown"><span class="caret"></span>&nbsp;</button>
	<ul class="dropdown-menu" style="max-height: 500px;overflow: auto;">
		<li><a href="#rOne" data-target="rRemarkOne" class="autouncollapse">RemarkOne</a></li>
		<li><a href="#rTwo" data-target="rRemarkTwo" class="autouncollapse">RemarkTwo</a></li>
	</ul>
</div>

<!-- Licensing Button -->
<div class="btn-group">
	<a href="#License" class="btn"><i class="icon-shopping-cart"></i> Licensing</a>
</div>

<!-- Filter Button -->
<div class="btn-group pull-right">
	<button class="btn dropdown-toggle" id="apiFilterBtn" data-toggle="dropdown" href="#" title="Filter Properties and Methods">
		<i class="icon-filter"></i>Show
	</button>
	<select id="apiFilter" class="dropdown-menu apiFilter">
		<option value="all">All</option>
		<option value="js">JavaScript</option>
		<option value="ruby">Ruby</option>
		<option value="android">Android</option>
		<option value="ios">iOS</option>
		<option value="wm">Windows Mobile</option>
		<option value="wp8">Windows Phone 8</option>
		<option value="w32">Windows Desktop</option>
		<option value="msi">MSI Only</option>
	</select>
</div>
<div id="apibody" style="overflow:auto;padding-right: 5px;">

<p>API Description</p>

<h2>Enabling the API</h2>
<p>In order to use this API you must include the following extension in your <code>build.yml</code>.</p>

<!-- Change -->
<pre>
	<code>:::yml
extensions: ["extension"]
	</code>
</pre>

<!-- Change -->
<p>The <code>extension</code> extension is also included automatically if you specify the following in your <code>build.yml</code></p>

<pre>
	<code>:::yml
app_type: "rhoelements"
	</code>
</pre>

<p>NOTE: If you are building a Windows Mobile or Windows CE app with this API, you must set your app_type as &ldquo;rhoelements&rdquo; in your build.yml as shown <a href="../guide/build_config#other-build-time-settings">here</a>.</p>

<h2>JavaScript Usage</h2>

<p>Be sure to review the <a href="/guide/api_js">JavaScript API Usage</a> guide for important information about using this API in JavaScript.</p>

<h2>Ruby Usage</h2>

<p>Be sure to review the <a href="/guide/api_ruby">Ruby API Usage</a> guide for important information about using this API in Ruby.</p>


<!-- Method Definitions -->
<!-- MethodOne -->
<a name='Methods'></a>
<h2><i class='icon-cog'></i>Methods</h2>
<div class="accordion" id="accordion"><a name ='mMethodOne'/>
	<div class=' method  js ruby msi' id='mMethodOne'>
		<h3><strong  >MethodOne</strong><span style='font-size:.7em;font-weight:normal;'>(<span class='text-info'>CallBackHandler</span> callback)</span></h3>
		<ul class="nav nav-tabs" style="padding-left:8px">
			<li class='active'><a href="#mMethodOne1" data-toggle="tab">Description</a></li>
			<li><a href="#mMethodOne2" data-toggle="tab">Parameters</a></li>
			<li><a href="#mMethodOne3" data-toggle="tab">Callback</a></li>
			<li><a href="#mMethodOne4" data-toggle="tab">Return</a></li>
			<li><a href="#mMethodOne6" data-toggle="tab">Access</a></li>
		</ul>
		<div class='tab-content' style='padding-left:8px' id='tc-methodOne'>
			<div class="tab-pane fade active in" id="mMethodOne1">
				<p>MethodOne description.</p>
				<p>
					<div>
						<p>
							<img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript">
							<img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby">
							<img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded">
							<img src="/img/motowebkit.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Motorola Devices Only">(Currently only supported on the MC18 device)
						</p>
					</div>
				</p>
			</div>
			<div class="tab-pane fade" id="mMethodOne2">
				<div><p><strong>Parameters</strong></p>
					<ul>
						<li>callback : <span class='text-info'>CallBackHandler</span><span class='label label-info'>Optional</span>
						</li>
					</ul>
				</div>
			</div>
			<div class="tab-pane fade" id="mMethodOne3"><div>
				<p><strong>Async Callback Returning Parameters: <span class='text-info'>RETURN PARAMETER TYPE</span></strong></p>
				<ul>
					<ul>
						<li>ParameterOne : 
							<span class='text-info'>PARAMETER TYPE</span>
							<p><p>ParameterOne description</p></p>
						</li>
						<li>ParameterTwo : 
							<span class='text-info'>PARAMETER TYPE</span>
							<p><p>ParameterTwo description</p></p>
						</li>
					</ul>
				</ul>
			</div>
		</div>
		<div class="tab-pane fade" id="mMethodOne4"><div>
			<p><strong>Synchronous Return:</strong></p>
			<ul>
				<li>HASH : this method also supports async callbacks - check the Callback tab for callback return parameters.
					<ul>
						<li>ReturnOne : 
							<span class='text-info'>PARAMETER TYPE</span>
							<p><p>Return One description</p></p>
						</li>
						<li>ReturnTwo : 
							<span class='text-info'>PARAMETER TYPE</span>
							<p><p>ReturnTwo description</p></p>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
<div class="tab-pane fade" id="mMethodOne6">
	<div>
		<p><strong>Method Access:</strong></p>
		<ul>
			<li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object.
				<ul>
					<li>JavaScript: <code>JS implementation(<span class='text-info'>CallBackHandler</span> callback)</code></li>
					<li>Ruby: <code>Ruby implementation(<span class='text-info'>CallBackHandler</span> callback)</code></li>
				</ul>
			</li>
		</ul>
	</div>
</div>
</div>
</div>

<!-- MethodTwo -->
<a name ='mMethodTwo'/>
<div class=' method  js ruby android ios' id='mMethodTwo'>
	<h3><strong>MethodTwo</strong>
		<span style='font-size:.7em;font-weight:normal;'>
			(<span class="text-info">TYPE</span> ParamName, <span class='text-info'>CallBackHandler</span> callback)
		</span>
	</h3>
	<ul class="nav nav-tabs" style="padding-left:8px">
		<li class='active'><a href="#mMethodTwo1" data-toggle="tab">Description</a></li>
		<li><a href="#mMethodTwo2" data-toggle="tab">Parameters</a></li>
		<li><a href="#mMethodTwo3" data-toggle="tab">Callback</a></li>
		<li><a href="#mMethodTwo4" data-toggle="tab">Return</a></li>
		<li><a href="#mMethodTwo6" data-toggle="tab">Access</a></li>
	</ul>
	<div class='tab-content' style='padding-left:8px' id='tc-MethodTwo'>
		<div class="tab-pane fade active in" id="mMethodTwo1">
			<p>MethodTwo description.</p>
			<p>
				<div>
					<p>
						<img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript">
						<img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby">
						<img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android">
						<img src="/img/ios.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="iphone, ipod touch, ipad">
						<img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded">
					</p>
				</div>
			</p>
		</div>
		<div class="tab-pane fade" id="mMethodTwo2"><div>
			<p><strong>Parameters</strong></p>
			<ul>
				<li>ParameterOne : 
					<span class='text-info'>HASH</span><p><p>The properties associated with accessing the battery status.</p></p></li>
				<li>ParameterTwo : 
					<span class='text-info'>CallBackHandler</span>
					<span class='label label-info'>Optional</span>
				</li>
			</ul>
		</div>
	</div>
	<div class="tab-pane fade" id="mMethodTwo3"><div>
		<p><strong>Async Callback Returning Parameters: <span class='text-info'>RETURN PARAMETER TYPE</span></strong></p>
		<ul>
			<ul>
				<li>ReturnOne : <span class='text-info'>PARAMETER TYPE</span><p><p>ReturnOne description</p></p></li>
				<li>ReturnTwo : <span class='text-info'>PARAMETER TYPE</span><p><p>ReturnTeo description</p></p></li>
			</ul>
		</ul>
	</div>
</div>
<div class="tab-pane fade" id="mMethodTwo4"><div>
	<p><strong>Synchronous Return:</strong></p>
	<ul>
		<li>HASH : this method also supports async callbacks - check the Callback tab for callback return parameters.<ul>
			<li>ReturnOne : <span class='text-info'>PARAMETER TYPE</span>
				<p><p>ReturnOne description</p></p></li>
			<li>ReturnTwo : <span class='text-info'>PARAMETER TYPE</span>
				<p><p>ReturnTwo description</p></li>
		</li>
	</ul>
</li>
</ul>
</div>
</div>
<div class="tab-pane fade" id="mMethodTwo6"><div>
	<p><strong>Method Access:</strong></p>
	<ul>
		<li>
			<i class="icon-book"></i>Class Method: This method can only be accessed via the API class object.
			<ul>
				<li>JavaScript: <code>JS Implementation(<span class="text-info">PARAMETER TYPE</span> paramName, <span class='text-info'>CallBackHandler</span> callback)</code></li>
				<li>Ruby: <code>Ruby Implementation(<span class="text-info">PARAMETER TYPE</span> paramName, <span class='text-info'>CallBackHandler</span> callback)</code></li>
				</ul>
			</li>
		</ul>
	</div>
</div>
</div>
</div>

<!-- Properties Definitions -->
<a name='Properties'></a>
<h2><i class='icon-list'></i>Properties</h2>

<a name='pPropertyOne'></a>
<div class=' method  js ruby' id='pPropertyOne'>
	<h3><strong>PropertyOne</strong><span style='font-size:.7em;font-weight:normal;'> : <span class='text-info'>PROPERTY TYPE</span>  </span></h3>
	<ul class="nav nav-tabs" style="padding-left:8px">
		<li class='active'><a href="#pPropertyOne1" data-toggle="tab">Description</a></li>
		<li><a href="#pPropertyOne6" data-toggle="tab">Access</a></li>
	</ul>
	<div class='tab-content' style='padding-left:8px' id='tc-PropertyOne'>
		<div class="tab-pane fade active in" id="pPropertyOne1">
			<p>PropertyOne description</p><p>
			<div>
				<p>
					<img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript">
					<img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby">
					<img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded">
				</p>
			</div>
		</p>
	</div>
	<div class="tab-pane fade" id="pPropertyOne2"></div>
	<div class="tab-pane fade" id="pPropertyOne5"></div>
	<div class="tab-pane fade" id="pPropertyOne6"><div>
		<p>
			<strong>Property Access:</strong>
		</p>
		<ul>
			<li>
				<i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: 
				<ul>
					<li><code>PropertyOne access example</code></li>
				</ul>
			</li>
		</ul>
	</div>
</div>
</div>
</div>

<a name='pPropertyTwo'></a>
<div class=' method  js ruby ios' id='pPropertyTwo'>
	<h3><strong>PropertyTwo</strong><span style='font-size:.7em;font-weight:normal;'> : <span class='text-info'>PROPERTY TYPE</span>  </span></h3>
	<ul class="nav nav-tabs" style="padding-left:8px">
		<li class='active'>
			<a href="#pPropertyTwo1" data-toggle="tab">Description</a>
		</li>
		<li><a href="#pPropertyTwo2" data-toggle="tab">Params</a></li>
		<li><a href="#pPropertyTwo6" data-toggle="tab">Access</a></li>
	</ul>
	<div class='tab-content' style='padding-left:8px' id='tc-PropertyTwo'>
		<div class="tab-pane fade active in" id="pPropertyTwo1">
			<p>PropertyTwo description</p><p>
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
	<div class="tab-pane fade" id="pPropertyTwo2">
		<p><strong>Default:</strong> default value</p>
	</div>
	<div class="tab-pane fade" id="pPropertyTwo5"></div>
	<div class="tab-pane fade" id="pPropertyTwo6"><div>
		<p>
			<strong>Property Access:</strong>
		</p>
		<ul>
			<li>
				<i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: 
				<ul>
					<li><code>PropertyTwo access example</code></li>
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
				<strong>ExampleOne Title</strong>
			</div>
			<div id="cExampleOne" class="accordion-body">
				<div class="accordion-inner">
					<p>ExampleOne description</p>
					<ul class='nav nav-tabs' id='exI0-S0Tab'>
						<li class='active'><a href='#exI0-S0JS' data-toggle='tab'>JavaScript</a></li>
						<li><a href='#exI0-S0RUBY' data-toggle='tab'>Ruby</a></li>
					</ul>
					<div class='tab-content'>
						<div class='tab-pane active' id='exI0-S0JS'>
							<pre class='CodeRay'>
								<code>:::javascript
JS Example Code
								</code>
							</pre>
						</div>
						<div class='tab-pane' id='exI0-S0RUBY'>
							<pre class='CodeRay'>
								<code>:::ruby
Ruby Example Code
								</code>
							</pre>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- ExampleTwo -->
<a name='eTwo'></a>
<div class=' example' id='eTwo'>
	<div class="accordion-group">
		<div class="accordion-heading">
			<span class="accordion-toggle" href="#cExample1">
				<strong>ExampleTwo Title</strong>
			</div>
			<div id="cExample1" class="accordion-body">
				<div class="accordion-inner">
					<p>ExampleTwo description</p>
					<ul class='nav nav-tabs' id='exI1-S0Tab'>
						<li class='active'><a href='#exI1-S0JS' data-toggle='tab'>JavaScript</a></li>
						<li><a href='#exI1-S0RUBY' data-toggle='tab'>Ruby</a></li>
					</ul>
					<div class='tab-content'>
						<div class='tab-pane active' id='exI1-S0JS'>
							<pre class='CodeRay'>
								<code>:::javascript
JS Example Code
								</code>
							</pre>
						</div>
					<div class='tab-pane' id='exI1-S0RUBY'>
				<pre class='CodeRay'>
			<code>:::ruby
Ruby Example Code
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
				<strong>RemarkOne Title</strong>
			</div>
			<div id="cRemarkOne" class="accordion-body">
				<div class="accordion-inner">
					<p>RemarkOne description</p>
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
				<strong>RemarkTwo Title</strong>
			</div>
			<div id="cRemark1" class="accordion-body">
				<div class="accordion-inner">
					<p>RemarkTwo description</p>
				</div>
			</div>
		</div>
	</div>

<!-- Licensing -->
<a name='License'></a>
<h2><i class='icon-shopping-cart'></i>Licensing</h2>
<div class="accordion" id="accordion">
	You can fully use all features of this API during evaluation, development or testing without obtaining a license. A message will be displayed on application startup and will also display a nag screen periodically. Before deploying an application to a production environment, you must obtain a license key. <a href='/guide/licensing'>Read more about licensing</a>.
</div>
</div>