
#SystemTime Module

<b>
The SystemTime Module is used to set the device clock, set the timezone, or synchronize it with a network SNTP server.
</b>

##Syntax

<table class="re-table"><tr><th class="tableHeading">systemTime (Module) &lt;META&gt; Syntax
</th></tr><tr><td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="SystemTime" content="[parameter]"&gt;</p></td></tr></table>
<table class="re-table"><tr><th class="tableHeading">SystemTime JavaScript Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the JavaScript Object <b>'systemTime'</b> will exist on the current page and can be used to interact directly with the systemTime.
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Set systemTime parameters via JavaScript use the following syntax: systemtime.parameter = 'value'; remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>systemTime</b>.setLocal = 'value';
</td></tr><tr><td class="clsSyntaxCells clsOddRow">							
To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: systemtime.setEMML("[Your EMML Tags]");
<P />
e.g. <b>systemTime</b>.setEMML("setLocal:<i>value</i>");							
</td></tr></table>

<table class="re-table"><tr><th class="tableHeading">SystemTime Ruby Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the Ruby Object <b>'SystemTime'</b> will exist on the current page and can be used to interact directly with the SystemTime. All Methods, Parameters and Events are the same as JavaScript, however, notice <b>'SystemTime'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b></td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Set SystemTime parameters via Ruby use the following syntax: SystemTime.parameter = 'value' remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>SystemTime</b>.setLocal = 'value'
</td></tr><tr><td class="clsSyntaxCells clsOddRow" /></tr></table>




##Parameters


Items listed in this section indicate parameters, or attributes which can be set.
<table class="re-table"><col width="20%" /><col width="20%" /><col width="38%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Possible Values</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>setLocal:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Local Time String i.e. "2011-12-25T09-57-00+01-00" or "2011-12-25T09-57-00"</td><td class="clsSyntaxCells clsOddRow">Local Time String in the format &lt;YYYY&gt;-&lt;MM&gt;-&lt;DD&gt;T&lt;HH&gt;-&lt;MM&gt;-&lt;SS&gt;&lt;+/-&gt;&lt;HH offset from UTC&gt;-&lt;MM offset from UTC&gt;. The offset from UTC is optional</td><td class="clsSyntaxCells clsOddRow">N/A</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>setUtc:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">UTC Time String i.e. "2011-12-25T09-57-00+01-00" or "2011-12-25T09-57-00"</td><td class="clsSyntaxCells clsEvenRow">UTC Time String in the format &lt;YYYY&gt;-&lt;MM&gt;-&lt;DD&gt;T&lt;HH&gt;-&lt;MM&gt;-&lt;SS&gt;&lt;+/-&gt;&lt;HH offset from UTC&gt;-&lt;MM offset from UTC&gt;. The offset from UTC is optional</td><td class="clsSyntaxCells clsEvenRow">N/A</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>SntpServerIP:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Valid IP Address</td><td class="clsSyntaxCells clsOddRow">The IP address of the SNTP time server</td><td class="clsSyntaxCells clsOddRow">N/A</td></tr></table>
<table class="re-table"><col width="78%" /><col width="8%" /><col width="1%" /><col width="5%" /><col width="1%" /><col width="5%" /><col width="2%" /></table>




##Remarks


###Latency
Once the SntpServerIP tag is parsed RhoElements will request the time from the SNTP server immediately, however the clock will not be updated until a response is received. Network latency and connectivity issues can all affect the speed and success with which this tag is actioned.


###Proxy Settings
Windows Mobile 5.0 or above will not allow you to obtain SNTP time when requesting via a proxy server, it is recommended the proxy is bypassed for this to work.


###Time Zone
The Time Zone location string (Windows CE) is not supported. The timezone offset from GMT will be correctly set, but the geographical location will not be set.




##Requirements

<table class="re-table"><tr><th class="tableHeading">RhoElements Version</th><td class="clsSyntaxCell clsEvenRow">2.1 or above
</td></tr><tr><th class="tableHeading">Supported Devices</th><td class="clsSyntaxCell clsOddRow">All supported devices except: Enterprise Tablet.</td></tr><tr><th class="tableHeading">Minimum Requirements</th><td class="clsSyntaxCell clsOddRow">None.</td></tr><tr><th class="tableHeading">Persistence</th><td class="clsSyntaxCell clsEvenRow">Persistent - Changes to this module will persist when navigating to a new page.</td></tr></table>


##HTML/JavaScript Examples

The following example sets the device time to 9:57am on 25th December 2011 Local Time without changing the timezone:

	<META HTTP-Equiv="SystemTime" Content="setLocal:2011-12-25T09-57-00">
	
The following example sets the device time to 9:57am on 25th December 2011 UTC, and the timezone to UTC+1. Local Time on the device will therefore be 1 hour ahead of the UTC time given, so the local time displayed will be 10:57am:

	<META HTTP-Equiv="SystemTime" Content="setUtc:2011-12-25T09-57-00+01-00">
	
The following example sets the UTC device time from a network time server:

	<META HTTP-Equiv="SystemTime" Content="SntpServerIP:132.163.4.102">
	

