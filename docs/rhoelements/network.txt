
#Network Module

<b>
The Network Module is used to determine whether the device is able to connect to a specified server URL or IP address.
</b>

##Syntax

<table class="re-table"><tr><th class="tableHeading">network (Module) &lt;META&gt; Syntax
</th></tr><tr><td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="Network" content="[method / parameter]"&gt;</p></td></tr><tr><td class="clsSyntaxCells clsEvenRow"><p>&lt;META HTTP-Equiv="Network" content="NetworkEvent:url('[jsFunction | url]')"&gt;</p></td></tr></table>
<table class="re-table"><tr><th class="tableHeading">Network JavaScript Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the JavaScript Object <b>'network'</b> will exist on the current page and can be used to interact directly with the network.
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Invoke network methods via JavaScript use the following syntax: network.method();
<P />e.g. <b>network</b>.start();
</td></tr><tr><td class="clsSyntaxCells clsOddRow">
To Set network parameters via JavaScript use the following syntax: network.parameter = 'value'; remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>network</b>.host = 'value';
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">						
To Set network return events via JavaScript use the following syntax: network.event = Javascript Function;
<P />e.g. <b>network</b>.networkEvent = 'doFunction(%json)';
<P />
For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents">Retrieval Events</a> page.

</td></tr><tr><td class="clsSyntaxCells clsOddRow">							
To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: network.setEMML("[Your EMML Tags]");
<P />
e.g. <b>network</b>.setEMML("host:<i>value</i>;networkEvent:url('JavaScript:doFunction(%json)');start");							
</td></tr></table>

<table class="re-table"><tr><th class="tableHeading">Network Ruby Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the Ruby Object <b>'Network'</b> will exist on the current page and can be used to interact directly with the Network. All Methods, Parameters and Events are the same as Javascript, however, notice <b>'Network'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b></td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Invoke Network methods via Ruby use the following syntax: Network.method()
<P />e.g. <b>Network</b>.start</td></tr><tr><td class="clsSyntaxCells clsOddRow">
To Set Network parameters via Ruby use the following syntax: Network.parameter = 'value' remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>Network</b>.host = 'value'
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">						
To Set Network return events via Ruby use the following syntax: Network.event = url_for(:action =&gt; :event_callback) 
<P />e.g. <b>Network</b>.networkEvent = url_for(:action =&gt; :network_event_callback)
<P />
For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents#params-object">Retrieval Events</a> page.
<p>To access the event parameters in a Ruby callback function, you reference the @params object within the callback function. This object is simply a ruby hash {"parameter1 name" =&gt; "parameter1 value", "parameter2 name" =&gt; "parameter2 value", ...}</p></td></tr><tr><td class="clsSyntaxCells clsOddRow" /></tr></table>


	

##Methods


Items listed in this section indicate methods or, in some cases, indicate parameters which will be retrieved.

<table class="re-table"><col width="10%" /><col width="68%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>start</b></td><td class="clsSyntaxCells clsOddRow">Begins polling the specified host on the specified URL to check if there is a network connection available.  The connection status is reported back via the NetworkEvent.</td><td class="clsSyntaxCells clsOddRow">Not Started</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>stop</b></td><td class="clsSyntaxCells clsEvenRow">Stops polling for a network connection</td><td class="clsSyntaxCells clsEvenRow">Not Started</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>disconnectWan</b></td><td class="clsSyntaxCells clsOddRow">Disconnects the current WAN connection.  DisconnectWan will only affect connections established by RhoElements so if you have not previously called connectWan this function will have no effect.</td><td class="clsSyntaxCells clsOddRow">Not Started</td></tr></table>


##Parameters


Items listed in this section indicate parameters, or attributes which can be set.
<table class="re-table"><col width="20%" /><col width="20%" /><col width="38%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Possible Values</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>host:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">URL or IP address</td><td class="clsSyntaxCells clsOddRow">The URL or IP address of the server to attempt to connect to</td><td class="clsSyntaxCells clsOddRow">www.motorola.com</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>port:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Any valid port</td><td class="clsSyntaxCells clsEvenRow">The port on the host on which to connect to</td><td class="clsSyntaxCells clsEvenRow">80</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>networkPollInterval:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Milliseconds</td><td class="clsSyntaxCells clsOddRow">The time, in milliseconds, between each check for a connection.  Note that the actual connection report interval will be the sum of the NetworkPollInterval and the ConnectionTimeout.</td><td class="clsSyntaxCells clsOddRow">5000</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>connectionTimeout:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Milliseconds</td><td class="clsSyntaxCells clsEvenRow">The amount of time the network plugin will attempt to connect to the specified URL before it gives up and assumes 'disconnected'</td><td class="clsSyntaxCells clsEvenRow">1000</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>connectWan:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Connection Destination</td><td class="clsSyntaxCells clsOddRow">Connects RhoElements through a Wide Area Network.  The connection destination must be first configured through the Connection Manager and the destination name provided as the value to this parameter.  If a connection is already established, you must first call disconnectWan before attempting another connection.  A list of available connection destinations is written to the log file when either connectWan, disconnectWan or wanStatusEvent are first specified.  Specify the connection as 'Internet' to use the default internet connection defined on the device.  If the specified destination does not exist no connection attempt will be made and an entry will be made in the log file.</td><td class="clsSyntaxCells clsOddRow">Not Specified</td></tr></table>
<table class="re-table"><col width="78%" /><col width="8%" /><col width="1%" /><col width="5%" /><col width="1%" /><col width="5%" /><col width="2%" /></table>	

##Events


Values are returned to the caller in RhoElements via Events.  Most modules contain events and those returned from this module are given below along with the event parameters.  Events can cause a navigation to a new URL or a Javascript function on the page to be invoked.  Each event will in most cases have a number of parameters associated with it which will either be strings or javascript arrays.  Event parameters can be accessed either directly or via JSON objects.

<br />
###networkEvent
The network events notifies the user when a connection to the specified URL is gained or lost. A connection check is performed every [NetworkPollInterval] milliseconds but the user is only informed of a change of connection
<table class="re-table"><col width="3%" /><col width="20%" /><col width="77%" /><tr><th class="tableHeading">ID</th><th class="tableHeading">Name</th><th class="tableHeading">Description</th></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">1</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>connectionInformation</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">Either "Connected" or "Disconnected"</td></tr></table>
<br />
###wanStatusEvent
The WAN Status Event notifies the user whenever any parameter associated with data connectivity changes. The WAN Status Event is called when it is first declared (for the initial state) and again whenever any of the associated parameters change.
<table class="re-table"><col width="3%" /><col width="20%" /><col width="77%" /><tr><th class="tableHeading">ID</th><th class="tableHeading">Name</th><th class="tableHeading">Description</th></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">1</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>phoneSignalStrength</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">The signal strength of the phone as a percentage of maximum strength.  Returned as a number between 0 and 100.  If there is no phone service this field will be 0.</td></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">2</td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>networkOperator</b></td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">The name of the current network operator associated with the SIM card</td></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">3</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>connectionTypeAvailable</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">The current data connection type available to RhoElements as provided by the Network.  Values can be 'Unavailable', GPRS, 1XRTT, EVDO, EDGE, UMTS, EVDV or HSDPA</td></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">4</td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>connectionTypeConnected</b></td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">The data connection type to which Rhoelements is currently connected.  The values returned are identical to connectionTypeAvailable, with the exception that 'Not Connected' replaces 'Unavailable'.</td></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">5</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>connectionManagerMessage</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">This is the last received status from the Connection Manager.  Do NOT use this parameter to determine if you are able to physically send / receive data to a remote host, it only provides an indication of whether the Connection Manager believes the connection is available.  To determine if you are connected to a remote host use the networkEvent.</td></tr></table>





##Remarks


###Connecting through Proxies
Because the network module is protocol agnostic, it will not communicate through HTTP proxies to reach a specified URL. In order to determine if you are connected when sitting behind a proxy you should configure the network plugin to attempt to connect to your proxy on the appropriate port. A successful connection to the proxy should be taken to assume the device is connected to a network. When configuring your WAN connection bear in mind that the proxy settings defined in the RhoElements configuration file will take precedence.


###Maintaining an 'always on' WAN connection
To instruct RhoElements to connect to a Wide Area Network automatically define a default meta tag with the required connection information, e.g. &lt;DefaultMetaTags&gt;&lt;MetaTag VALUE="Network~ConnectWAN:MyConnection"/&gt;&lt;/DefaultMetaTags&gt;. See the Configuration Settings page for more information.


###NetworkEvent over WAN
When defining a network event which will take place over WAN bear in mind if you specify a very low networkPollInterval your device will frequently have an active data connection. 'NetworkPollInterval's sufficiently low (in the region of 1000) can prevent the device from accepting incoming phone calls.


###Preventing access to the device
Receiving phone calls or texts whilst running RhoElements will cause the start button to be displayed on Windows Embedded Handheld devices, potentially offering users access to the operating system. It is recommended to set the following registry keys to disable Operating System access on Windows Embedded Handheld as required. The registry keys will be applied after a warm boot, omit them entirely to restore the Start and 'X' icons.

<pre>

[HKEY_LOCAL_MACHINE\Software\Microsoft\Shell\BubbleTiles]   Location in Registry
"HardwareStartKeyEnabled"=dword:00000001                    Prevents the Start icon from appearing in the bottom left
"HardwareDoneKeyEnabled"=dword:00000001                     Prevents the 'X' icon from appearing in the bottom right
				</pre>


###Platform differences
On Android connectWan can be treated as a method with no parameters as its only effect is enabling mobile data from the device general settings; any parameter passed to connectWan is ignored. Likewise, disconnectWan disables mobile data from the general settings, therefore executing disconnectWan on Android is not restricted to the scope of a RhoElements application, but may affect the connectivity of any other running application using mobile data.




##Requirements

<table class="re-table"><tr><th class="tableHeading">RhoElements Version</th><td class="clsSyntaxCell clsEvenRow">1.0.0 or above
</td></tr><tr><th class="tableHeading">Supported Devices</th><td class="clsSyntaxCell clsOddRow">All supported devices.  WAN Connectivity is only available on devices which support data connections through the Windows Connection Manager.</td></tr><tr><th class="tableHeading">Minimum Requirements</th><td class="clsSyntaxCell clsOddRow">None.</td></tr><tr><th class="tableHeading">Persistence</th><td class="clsSyntaxCell clsEvenRow">Partially Persistent - Changes to this module will persist when navigating to a new page with the exception of the NetworkEvent and WANStatusEvent which only apply to the current page.</td></tr></table>


##HTML/Javascript Examples

The following example checks for a connection to motorola.com on the default port and notifies the user when connection is gained / lost:

	<meta http-equiv="Network" content="Host:url('http://www.motorola.com')">
	<meta http-equiv="Network" content="networkEvent:url('Javascript:onNetworkEvent(%json);');Start">
	<SCRIPT>
	  function onNetworkEvent(jsonObject)
	  {
		var html = "<b>Network Event Returned:</b> ";
		html += jsonObject.connectionInformation;
		networkOutput.innerHTML=html;
	  }
	</SCRIPT>
	<div id="networkOutput">Connection Information goes Here</div>
	
The following example checks for a connection to a proxy server and notifies the user when connection is gained / lost:

	<BODY onload='onStartChecking()'>
	<SCRIPT>
	  function onNetworkEvent(jsonObject)
	  {
		var html = "<b>Network Event Returned:</b> ";
		html += jsonObject.connectionInformation;
		networkOutput.innerHTML=html;
	  }
	  function onStartChecking()
	  {
		network.networkEvent = onNetworkEvent(%json);
		network.host = 'wwwexampleproxy.com';
		network.port = '1050';
		network.start();
	  }
	</SCRIPT>
	<div id="networkOutput">Connection Information goes Here</div>
	
The following example shows how to establish and monitor a WAN connection

	<HTML><HEAD>
	<META HTTP-Equiv="Network" Content="WANStatusEvent:url('javascript:fnWANStatus(%json);')">
	<meta http-equiv="Network" content="NetworkEvent:url('Javascript:onNetworkEvent(%json);')">
	<meta http-equiv="Network" content="networkPollInterval:5000;connectionTimeout:1500">
	<meta http-equiv="Network" content="Host:url('http://www.motorola.com')">
	  <script type="text/javascript">
	  var count = 0;
	  function onNetworkEvent(jsonObject)
	  {
	    count = count + 1;
	    var html = "<b>Network Event Returned:</b> ";
	    html += jsonObject.connectionInformation + " - " + count;
	    networkOutput.innerHTML=html;
	  }
	  function fnWANStatus(jsonObject)
	  {
	    var html = "Signal Strength: " + jsonObject.phoneSignalStrength + "%";
	    html += "<BR> Operator: " + jsonObject.networkOperator;
	    html += "<BR> Cell Connection Available: " + jsonObject.connectionTypeAvailable;
	    html += "<BR> Cell Connection Connected?: " + jsonObject.connectionTypeConnected;
	    html += "<BR> Connection Manager Message: " + jsonObject.connectionManagerMessage;
	    outputDiv.innerHTML = html;
	  }
	  function fnConnect(destination)
	  {
	    network.connectWan = "" + destination;
	  }
	  function fnDisconnect()
	  {
	    network.disconnectWan();
	  }
	  function fnStartNetworkCheck()
	  {
	    network.start();
	  }
	  function fnStopNetworkCheck()
	  {
	    network.stop();
	    networkOutput.innerHTML = "Not Polling Network";
	  }
	  </script>
	</HEAD>
	<H1>WAN Tests</H1>
	<P><div id="networkOutput">Network Connection Information goes Here</div><br>
	<b><div id="outputDiv">Network Check Started</div></b><P>
	<input type="button" onclick="fnConnect('Internet')" Value="Connect (Default)" />
	<input type="button" onclick="fnConnect('My Connection')" Value="Connect ('My Connection')" />
	<input type="button" onclick="fnDisconnect()" Value="Disconnect" />
	<input type="button" onclick="fnStartNetworkCheck()" Value="Start Network Checking" />
	<input type="button" onclick="fnStopNetworkCheck()" Value="Stop Network Checking" />
	</BODY></HTML>
	


##Ruby Examples

The following example tests the network with the default values. It attaches the network event to a listener and starts polling for an internet connection. If the connection is successful or when the connection times out, the 'networkEventListener' function is called with the appropriate result:

	def connect
		Network.networkEvent = url_for(:action => :networkEventListener)
		Network.start
	end
	
To call the this function from HTML, use the following code: 

	<li onclick="testConnection(); ">Test connection on default port</li>

Where 'testConnection()' is a JavaScript function which looks like: 

	function testConnection() {
         $.get('/app/NetworkModule/connect', { });
         return false;
    }

The 'networkEventListener' looks like the following:

	def networkEventListener
		networkInfo = @params['connectionInformation']
		WebView.execute_js("setFieldValue('"+networkInfo+"'); ")
	end

The following example tests network connection via a proxy. It attaches an event listener for network events, sets up a proxy host and a proxy port and starts polling. It can be called from HTML in a fashion similar to the one described above. Note that the 'networkEventListener' callback function is the same as described above.
  
	def connectToProxy
		Network.networkEvent = url_for(:action => :networkEventListener)
		Network.host = 'exampleproxy.com'
		Network.port = 1050
		Network.start
	end
	
The following example connects to the internet using Wide Area Network (WAN). It attaches a listener for the WAN status event and the network event, sets the polling interval and connection timeout, sets the host address to connect to and sets the connection mechanism for RhoElements. Using 'Internet' in the destination parameter connects RhoElements via the default internet connection. Specifying a destination enables RhoElements to connect via a specific connection. For more information on this, please refer to the Parameters section at the top of this page. 

	def connectWan	
		destination = @params['destination]
		Network.wanStatusEvent = url_for(:action => :wanStatusEventListner)
		Network.networkEvent = url_for(:action => :networkEventListener)
		Network.networkPollInterval = 5000
		Network.connectionTimeout = 1500
		Network.host = 'www.motorola.com'  
		Network.connectWan = destination
	end
	
This function can be called from HTML using any of the following ways: 

	<li onclick="connectToDestination('Internet'); ">Connect WAN (default connection)</li> 
	<li onclick="connectToDestination('myConnection'); ">Connect WAN (specified connection)</li>
	
The 'connectToDestination' is a JavaScript function that looks like: 

	function connectToDestination(destination) {
		$.get('/app/NetworkModule/connectWan', {destination: destination });
		return false;
	}
	
The 'wanStatusEventListener' looks like the following: 

	def wanStatusEventListner
		buf = 'Signal strength: '
		buf += @params['phoneSignalStrength']
		buf += '<BR> Cell Operator: '
		buf += @params['networkOperator']
		buf += '<BR> Cell Connection available: '
		buf += @params['connectionTypeAvailable']
		buf += '<BR> Connection connected? '
		buf += @params['connectionTypeConnected']
		buf += '<BR> Connection Manager message: '
		buf += @params['connectionManagerMessage']  
		WebView.execute_js("setOutput('"+buf+"'); ")
	end
	
The following example disconnects the current WAN connection:

	def disconnect
		Network.disconnectWan
		WebView.execute_js("setFieldValue('Test results go here ...'); ")
	end