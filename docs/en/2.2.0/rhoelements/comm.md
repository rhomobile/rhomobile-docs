# Comm Module
**The Comm Module is used to control the functionality of the devices communication (serial) port; the way RhoElements interacts with that port and the data it provides.**

## Syntax

<table class="re-table">
	<tr>
		<th class="tableHeading">comm (Module) &lt;META&gt; Syntax
</th></tr><tr><td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="Comm" content="[parameter]"&gt;</p></td></tr><tr><td class="clsSyntaxCells clsEvenRow"><p>&lt;META HTTP-Equiv="Comm" content="CommEvent:url('[jsFunction | url]')"&gt;</p></td></tr></table>
<table class="re-table"><tr><th class="tableHeading">Comm JavaScript Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the JavaScript Object <b>'comm'</b> will exist on the current page and can be used to interact directly with the comm.
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Invoke comm methods via JavaScript use the following syntax: comm.method();
<P />e.g. <b>comm</b>.open();
</td></tr><tr><td class="clsSyntaxCells clsOddRow">
To Set comm parameters via JavaScript use the following syntax: comm.parameter = 'value'; remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>comm</b>.baudRate = 'value';
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">						
To Set comm return events via JavaScript use the following syntax: comm.event = JavaScript Function;
<P />e.g. <b>comm</b>.commEvent = 'doFunction(%json)';
<P />
For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents">Retrieval Events</a> page.

</td></tr><tr><td class="clsSyntaxCells clsOddRow">							
To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: comm.setEMML("[Your EMML Tags]");
<P />
e.g. <b>comm</b>.setEMML("baudRate:<i>value</i>;commEvent:url('JavaScript:doFunction(%json)');open");							
</td></tr></table>

<table class="re-table"><tr><th class="tableHeading">Comm Ruby Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the Ruby Object <b>'Comm'</b> will exist on the current page and can be used to interact directly with the Comm. All Methods, Parameters and Events are the same as JavaScript, however, notice <b>'Comm'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b></td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Invoke Comm methods via Ruby use the following syntax: Comm.method()
<P />e.g. <b>Comm</b>.open</td></tr><tr><td class="clsSyntaxCells clsOddRow">
To Set Comm parameters via Ruby use the following syntax: Comm.parameter = 'value' remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>Comm</b>.baudRate = 'value'
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">						
To Set Comm return events via Ruby use the following syntax: Comm.event = url_for(:action =&gt; :event_callback) 
<P />e.g. <b>Comm</b>.commEvent = url_for(:action =&gt; :comm_event_callback)
<P />
For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents#params-object">Retrieval Events</a> page.
<p>To access the event parameters in a Ruby callback function, you reference the @params object within the callback function. This object is simply a ruby hash {"parameter1 name" =&gt; "parameter1 value", "parameter2 name" =&gt; "parameter2 value", ...}</p></td></tr><tr><td class="clsSyntaxCells clsOddRow" /></tr></table>


	

##Methods


Items listed in this section indicate methods or, in some cases, indicate parameters which will be retrieved.

<table class="re-table"><col width="10%" /><col width="68%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>open</b></td><td class="clsSyntaxCells clsOddRow">Opens the COM port using applied settings.
				</td><td class="clsSyntaxCells clsOddRow">Closed</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>close</b></td><td class="clsSyntaxCells clsEvenRow">Closes the currently open COM port, if any.</td><td class="clsSyntaxCells clsEvenRow">Closed</td></tr></table>


##Parameters


Items listed in this section indicate parameters, or attributes which can be set.
<table class="re-table"><col width="20%" /><col width="20%" /><col width="38%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Possible Values</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>baudRate:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">110, 300, 600, 1200, 2400, 4800, 9600, 14400, 19200, 38400, 56000, 57600, 115200, 128000, 256000</td><td class="clsSyntaxCells clsOddRow">Sets the baud rate of the serial port. (not all values are supported on all devices)</td><td class="clsSyntaxCells clsOddRow">9600</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>dataBits:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Integers between 5 and 9 inclusive.</td><td class="clsSyntaxCells clsEvenRow">Sets the number of data bits per word on the device serial port (not all values are supported on all devices).</td><td class="clsSyntaxCells clsEvenRow">8</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>stopBits:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">'1', '1.5', '2'.</td><td class="clsSyntaxCells clsOddRow">Sets the number of stop bits per word on the device serial port (not all values are supported on all devices).</td><td class="clsSyntaxCells clsOddRow">1</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>parity:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">'Even', 'Odd', 'Mark', 'Space', 'No Parity'</td><td class="clsSyntaxCells clsEvenRow">Sets the parity check type for the device serial port. (not all values are supported on all devices)</td><td class="clsSyntaxCells clsEvenRow">'No Parity'</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>handshake:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">'HW' - Hardware Handshake, 'SW' - Software Handshake, 'None' - No handshake</td><td class="clsSyntaxCells clsOddRow">Sets the handshaking for the device serial port. (not all values are supported on all devices)</td><td class="clsSyntaxCells clsOddRow">'None'</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>port:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">The device comm port, in the format COMn</td><td class="clsSyntaxCells clsEvenRow">Sets the device serial port. (only certain port designations are valid on any given device)</td><td class="clsSyntaxCells clsEvenRow">'COM1'</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>chars:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Positive number.</td><td class="clsSyntaxCells clsOddRow">Data will be received by RhoElements after the specified number of characters have been received over the COM port.  RhoElements will receive the data in either a CommEvent or as keystrokes.  'Chars', 'EndChar' and 'Time' are mutually exclusive, see remarks.</td><td class="clsSyntaxCells clsOddRow">'EndChar:CRLF'</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>endChar:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Character code expressed as a decimal or 'CRLF' to specify Carriage return + Line Feed</td><td class="clsSyntaxCells clsEvenRow">Data will be received by RhoElements after the specified character (or Carriage return + Line Feed) has been received over the COM port.  RhoElements will receive the data, minus the final CRLF, in either a CommEvent or as keystrokes.  'Chars', 'EndChar' and 'Time' are mutually exclusive, see remarks.</td><td class="clsSyntaxCells clsEvenRow">'EndChar:CRLF'</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>time:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Milliseconds</td><td class="clsSyntaxCells clsOddRow">Data will be received by RhoElements after the specified period of COM port inactivity has elapsed.  RhoElements will receive the data in either a CommEvent or as keystrokes.  'Chars', 'EndChar' and 'Time' are mutually exclusive, see remarks.</td><td class="clsSyntaxCells clsOddRow">'EndChar:CRLF'</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>writeBytes:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">A string of bytes, each byte represented as '%hh' where 'h' is a hexidecimal digit.  A delimiter is optional and may be any character</td><td class="clsSyntaxCells clsEvenRow">Value is converted to an array of bytes and written to the COM port.</td><td class="clsSyntaxCells clsEvenRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>writeString:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">String</td><td class="clsSyntaxCells clsOddRow">Writes the specified string to the COM port.</td><td class="clsSyntaxCells clsOddRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>writeFile:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Filename and Path</td><td class="clsSyntaxCells clsEvenRow">The specified file is opened and its contents is written to the COM port.</td><td class="clsSyntaxCells clsEvenRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>autoEnter:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Enabled or Disabled</td><td class="clsSyntaxCells clsOddRow">Provided no CommEvent is defined and the received data is being received as keystrokes each block received will have a CR (Carriage Return) character appended to it.</td><td class="clsSyntaxCells clsOddRow">Disabled</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>autoTab:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Enabled or Disabled</td><td class="clsSyntaxCells clsEvenRow">Provided no CommEvent is defined and the received data is being received as keystrokes each block received will have a tab character appended to it.</td><td class="clsSyntaxCells clsEvenRow">Disabled</td></tr></table>
<table class="re-table"><col width="78%" /><col width="8%" /><col width="1%" /><col width="5%" /><col width="1%" /><col width="5%" /><col width="2%" /></table>	

##Events


Values are returned to the caller in RhoElements via Events.  Most modules contain events and those returned from this module are given below along with the event parameters.  Events can cause a navigation to a new URL or a JavaScript function on the page to be invoked.  Each event will in most cases have a number of parameters associated with it which will either be strings or JavaScript arrays.  Event parameters can be accessed either directly or via JSON objects.

<br />
###commEvent
This event is used to read data from the COM port and is triggered in response to a port event. Port events can be one of 'Chars', 'EndChar' or 'Time' as described in the Parameters section. If no CommEvent is defined the associated data is output as keystrokes.
<table class="re-table"><col width="3%" /><col width="20%" /><col width="77%" /><tr><th class="tableHeading">ID</th><th class="tableHeading">Name</th><th class="tableHeading">Description</th></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">1</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>data</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">The data that has been accumulated from the open communications port since the last time data was returned.</td></tr></table>





##Remarks


###General
If any of the parameters (e.g. BaudRate) are set whilst the COM port is open they will not take effect until the port is closed and reopened again. The parameters 'Chars', 'EndChar' and 'Time' are mutually exclusive and the last one set will take priority when the COM port is next opened.


###AutoEnter and AccelerateKey
The AccelerateKey Meta tag controls the behaviour of Accelerate keys on Windows CE, if the Enter key is configured to be non functional then AutoEnter will also appear to not function either




##Requirements

<table class="re-table"><tr><th class="tableHeading">RhoElements Version</th><td class="clsSyntaxCell clsEvenRow">1.0.0 or above
</td></tr><tr><th class="tableHeading">Supported Devices</th><td class="clsSyntaxCell clsOddRow">All supported devices that have a COM port</td></tr><tr><th class="tableHeading">Minimum Requirements</th><td class="clsSyntaxCell clsOddRow">COM Interface.</td></tr><tr><th class="tableHeading">Persistence</th><td class="clsSyntaxCell clsEvenRow">This tag is mostly page persistent, however when navigating to a new page the port will be closed and the CommEvent cleared.  You will need to re-register the CommEvent and open the port again on the new page to continue serial port communication.
			</td></tr></table>


##HTML/JavaScript Examples

The following example opens up the COM1 port using META tags, and instructs the Comm module to call the 'ProcessData' JavaScript function after 250 ms of port inactivity, passing the received data to the function. The port will be closed when RhoElements navigates to a new page.

	<HTML>
	   <HEAD>
	   <!-- Setup the port -->
	   <META HTTP-Equiv="Comm" Content="Port:COM1">
	   <META HTTP-Equiv="Comm" Content="BaudRate:9600">
	   <META HTTP-Equiv="Comm" Content="DataBits:8">
	   <META HTTP-Equiv="Comm" Content="StopBits:1">
	   <META HTTP-Equiv="Comm" Content="Parity:'No Parity'">
	   <META HTTP-Equiv="Comm" Content="HandShake:None">
	   <META HTTP-Equiv="Comm" Content="Time:250">
	   <META HTTP-Equiv="Comm" Content="CommEvent:url('JavaScript:ProcessData('%s');')">
	   <META HTTP-Equiv="Comm" Content="Open">
	
	   <!-- Function called when data received from the port -->
	   <SCRIPT TYPE="text/javascript">
	      function ProcessData(data)
	      {
	         alert(data);
	      }
	   </SCRIPT>
	   </HEAD>
	
	   <BODY>
	   <!-- Your page goes here -->
	   </BODY>
	</HTML>
	   
					
The following example sets up the communications port and opens it using JavaScript and the generic ActiveX object. This example sets the event trigger to be the receipt of the '#' character (char code = 35). The default port parameters are used. JavaScript routines for writing to the port and closing it are also included.

	<HTML>
	   <HEAD>
	   <!-- Script that will get called on page load -->
	   <SCRIPT TYPE="text/javascript">
	
	   var objGeneric;
	
	   function DisplayData(data)
	   {
	      alert("Received the following data on the Comm port: " + data);
	   }
	
	   function CommSetup()
	   {
	      comm.endChar = 35;
	      comm.commEvent = url('JavaScript:DisplayData('%s');');
	      comm.open();
	   }
	
	   function CommWrite()
	   {
	      //  Write a string to the COM port
	      comm.writeString = 'StringToWrite';
	      //  Write bytes to the COM port
	      comm.writeBytes = '%62 %79 %74 %65 %20 %6d %65 %0a';
	      //  Write a file to the COM port
	      comm.writeFile = '\\File Path\\FileToWrite.txt';
	   }
	   
	   function CommClose()
	   {
	      comm.close();
	   }
	   </SCRIPT>
	   </HEAD>
	
	   <BODY onload="CommSetup()">
	   <!-- Your page goes here -->
	   </BODY>
	</HTML>
					


