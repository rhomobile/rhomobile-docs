
#Push Module

<b>
The Push Module is used to receive data over an HTTP connection.
</b>

##Syntax

<table class="re-table"><tr><th class="tableHeading">push (Module) &lt;META&gt; Syntax
</th></tr><tr><td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="Push" content="[Parameter]"&gt;</p></td></tr><tr><td class="clsSyntaxCells clsEvenRow"><p>&lt;META HTTP-Equiv="Push" content="[Parameter:Attribute]"&gt;</p></td></tr><tr><td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="Push" contents="detected:url('[jsFunction | url]')"&gt;</p></td></tr></table>
<table class="re-table"><tr><th class="tableHeading">Push JavaScript Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the JavaScript Object <b>'push'</b> will exist on the current page and can be used to interact directly with the push.
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Invoke push methods via JavaScript use the following syntax: push.method();
<P />e.g. <b>push</b>.start();
</td></tr><tr><td class="clsSyntaxCells clsOddRow">
To Set push parameters via JavaScript use the following syntax: push.parameter = 'value'; remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>push</b>.port = 'value';
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">						
To Set push return events via JavaScript use the following syntax: push.event = JavaScript Function;
<P />e.g. <b>push</b>.detected = 'doFunction(%json)';
<P />
For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents">Retrieval Events</a> page.

</td></tr><tr><td class="clsSyntaxCells clsOddRow">							
To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: push.setEMML("[Your EMML Tags]");
<P />
e.g. <b>push</b>.setEMML("port:<i>value</i>;detected:url('JavaScript:doFunction(%json)');start");							
</td></tr></table>

<table class="re-table"><tr><th class="tableHeading">Push Ruby Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the Ruby Object <b>'Push'</b> will exist on the current page and can be used to interact directly with the Push. All Methods, Parameters and Events are the same as JavaScript, however, notice <b>'Push'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b></td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Invoke Push methods via Ruby use the following syntax: Push.method()
<P />e.g. <b>Push</b>.start</td></tr><tr><td class="clsSyntaxCells clsOddRow">
To Set Push parameters via Ruby use the following syntax: Push.parameter = 'value' remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>Push</b>.port = 'value'
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">						
To Set Push return events via Ruby use the following syntax: Push.event = url_for(:action =&gt; :event_callback) 
<P />e.g. <b>Push</b>.detected = url_for(:action =&gt; :push_event_callback)
<P />
For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents#params-object">Retrieval Events</a> page.
<p>To access the event parameters in a Ruby callback function, you reference the @params object within the callback function. This object is simply a ruby hash {"parameter1 name" =&gt; "parameter1 value", "parameter2 name" =&gt; "parameter2 value", ...}</p></td></tr><tr><td class="clsSyntaxCells clsOddRow" /></tr></table>


	

##Methods


Items listed in this section indicate methods or, in some cases, indicate parameters which will be retrieved.

<table class="re-table"><col width="10%" /><col width="68%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>start</b></td><td class="clsSyntaxCells clsOddRow">Starts the server. Must be after the &lt;port&gt; tag.</td><td class="clsSyntaxCells clsOddRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>stop</b></td><td class="clsSyntaxCells clsEvenRow">Stops the server.</td><td class="clsSyntaxCells clsEvenRow">
N/A
</td></tr></table>


##Parameters


Items listed in this section indicate parameters, or attributes which can be set.
<table class="re-table"><col width="20%" /><col width="20%" /><col width="38%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Possible Values</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>port:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">0 - 65535 in Windows and 1025 - 65535 in Android</td><td class="clsSyntaxCells clsOddRow">Port number to listen on.</td><td class="clsSyntaxCells clsOddRow">8081</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>passKey:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Any string</td><td class="clsSyntaxCells clsEvenRow">If specified then the client must include passkey=value in the passed parameters. Case sensitive.</td><td class="clsSyntaxCells clsEvenRow">Empty (no passkey required)</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>response:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Filename</td><td class="clsSyntaxCells clsOddRow">Name of the HTML file to return to the client after a successful request.</td><td class="clsSyntaxCells clsOddRow">Empty (a short default HTML response is sent)</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>path:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Virtual path</td><td class="clsSyntaxCells clsEvenRow">The client must include this in the HTTP request (after the address and before the parameters).  The forward slash '/' should be used as the directory delimiter.</td><td class="clsSyntaxCells clsEvenRow">Empty (any path is accepted)</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>unattended:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">enabled or disabled</td><td class="clsSyntaxCells clsOddRow">Enables or disables unattended mode - see Remarks for details.</td><td class="clsSyntaxCells clsOddRow">disabled</td></tr></table>
<table class="re-table"><col width="78%" /><col width="8%" /><col width="1%" /><col width="5%" /><col width="1%" /><col width="5%" /><col width="2%" /></table>	

##Events


Values are returned to the caller in RhoElements via Events.  Most modules contain events and those returned from this module are given below along with the event parameters.  Events can cause a navigation to a new URL or a JavaScript function on the page to be invoked.  Each event will in most cases have a number of parameters associated with it which will either be strings or JavaScript arrays.  Event parameters can be accessed either directly or via JSON objects.

<br />
###detected

<table class="re-table"><col width="3%" /><col width="20%" /><col width="77%" /><tr><th class="tableHeading">ID</th><th class="tableHeading">Name</th><th class="tableHeading">Description</th></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">1</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>Whatever is defined as 'name' in each name=value pair in the HTTP request.</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">One value is returned for each name=value pair in the HTTP request, you access this in JSON using the names you provided in the request.  An example is provided in the examples section below.</td></tr></table>





##Remarks


###HTTP request format
The push server accepts both GET and POST requests. For GET requests the parameters and values are specified in the URL, while for POST requests the request body should hold the parameters and values in url encoded form. The virtual path in the URL must be as specified by the &lt;path&gt; tag, or can be anything if the tag isn't present. The parameters must include 'passkey' with the correct value if the &lt;passkey&gt; tag is present.


###Accessing Returned values via %s / %[number]
When a valid request is received the specified destination URL is called with one '%s' per parameter/value pair in the request. Only the values are returned; the parameter names are discarded. The 'passkey' parameter and value are ignored if present. Parameter names are only applicable if you are accessing your return values via JSON.


###Allowed characters
Only alphanumeric characters and the characters $-_.!*'(), are allowed in a URL (see RFC 1738). Any other characters will cause undefined behaviour. Ensure that the passkey uses only valid characters.


###Unattended mode
Normally when a device enters suspend mode, either because it has been idle for a certain time or because the power key was pressed, all the device subsystems are switched off, including the wireless network. When unattended mode is enabled however the device keeps enough subsystems powered that applications continue to run, and it can still respond to Push requests. Note that unattended mode uses significantly more battery power.


###Windows Mobile / CE Backwards compatibility
In version 2.2 of RhoElements for WM / CE the default push port was changed from '80' to '8081' to match RhoElements for Android. Applications developed for RhoElements 2.1 and previous which rely on the default port number being 80 should add the default meta tag &lt;MetaTag VALUE="Push~port:80"&gt; to their configuration.




##Requirements

<table class="re-table"><tr><th class="tableHeading">RhoElements Version</th><td class="clsSyntaxCell clsEvenRow">1.0.0 or above
</td></tr><tr><th class="tableHeading">Supported Devices</th><td class="clsSyntaxCell clsOddRow">All supported devices</td></tr><tr><th class="tableHeading">Minimum Requirements</th><td class="clsSyntaxCell clsOddRow">None.</td></tr><tr><th class="tableHeading">Persistence</th><td class="clsSyntaxCell clsEvenRow">Persistent - Changes to this module will persist when navigating to a new page.</td></tr></table>


##HTML/JavaScript Examples

The code below configures the server to listen on port 8081, to accept only requests to the virtual path \push and to require a passkey of 'secret'. Assuming the device has IP address 1.2.3.4 then browsing to the following URL will cause the JavaScript function onPush() to be called with the parameters 'hello' and 'world': http://1.2.3.4:8081/push?name1=hello&amp;name2=world&amp;passkey=secret. The browser will receive the contents of the file \ok.html as response.

	<META HTTP-Equiv="Push" Content="Port:8081">
	<META HTTP-Equiv="Push" Content="Passkey:secret">
	<META HTTP-Equiv="Push" Content="Path:/push">
	<META HTTP-Equiv="Push" Content="Response:/ok.html">
	<META HTTP-Equiv="Push-detected" Content="url('JavaScript:onPush('%s','%s');')">
	<META HTTP-Equiv="Push" Content="Start">
	      
The following code shows a very simple push server which just responds by executing a JavaScript function, but does show how to process the push request in JSON. Similarly to the previous example the following URL has been browsed to: http://1.2.3.4:8081/push?name1=hello&amp;myname=world

	<HEAD>
	<META HTTP-Equiv="Push" Content="Port:1234">
	<META HTTP-Equiv="Push-detected" Content="url('JavaScript:pushDetectJSON(%json);')">
	<META HTTP-Equiv="Push" Content="Start">
	<TITLE>Push Tests</TITLE>
	  <script type="text/javascript">
	  function pushDetectJSON(jsonObject)
	  {
	    //  The following will show an Alert box with 'hello - world'
	    alert('Push Via JSON: ' + jsonObject.name1 + ' - ' + jsonObject.myname);
	  }
	  </script>
	</HEAD>
	
To enable unattended mode:

	<META HTTP-Equiv="push" Content="unattended:enable">
	      


