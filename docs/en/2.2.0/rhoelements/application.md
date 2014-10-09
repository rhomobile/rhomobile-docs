# Application Module
**The Application Module is to adjust the running state of RhoElements applications.**

## Syntax

<table class="re-table">
	<tr>
		<th class="tableHeading">application (Module) &lt;META&gt; Syntax</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="Application" content="[method]"&gt;</p></td>
	</tr>
</table>

<table class="re-table">
	<tr>
		<th class="tableHeading">Application JavaScript Object Syntax:</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			By default the JavaScript Object <b>'application'</b> will exist on the current page and can be used to interact directly with the application.
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow">
			To Invoke application methods via JavaScript use the following syntax: application.method();
			<br/><br/>
			e.g. <b>application</b>.quit();
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			To Set application return events via JavaScript use the following syntax: application.event = JavaScript Function;
			<br/><br/>
			e.g. <b>application</b>.applicationEvent = 'doFunction(%json)';
			<br/><br/>
			For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents">Retrieval Events</a> page.
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow">
			To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: application.setEMML("[Your EMML Tags]");
			<br/><br/>
			e.g. <b>application</b>.setEMML("applicationEvent:url('JavaScript:doFunction(%json)');quit");
		</td>
	</tr>
</table>

<table class="re-table">
	<tr>
		<th class="tableHeading">Application Ruby Object Syntax:</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			By default the Ruby Object <b>'Application'</b> will exist on the current page and can be used to interact directly with the Application. All Methods, Parameters and Events are the same as JavaScript, however, notice <b>'Application'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b>
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow">
			To Invoke Application methods via Ruby use the following syntax: Application.method()
			<br/><br/>
			e.g. <b>Application</b>.quit
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			To Set Application return events via Ruby use the following syntax: Application.event = url_for(:action =&gt; :event_callback) 
			<br/><br/>
			e.g. <b>Application</b>.applicationEvent = url_for(:action =&gt; :application_event_callback)
			<br/><br/>
			For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents#params-object">Retrieval Events</a> page.<br/>
			To access the event parameters in a Ruby callback function, you reference the @params object within the callback function. This object is simply a ruby hash {"parameter1 name" =&gt; "parameter1 value", "parameter2 name" =&gt; "parameter2 value", ...}
		</td>
	</tr>
</table>

## Methods
Items listed in this section indicate methods or, in some cases, indicate parameters which will be retrieved.

<table class="re-table"><col width="10%"/><col width="68%"/><col width="22%"/>
	<tr>
		<th class="tableHeading">Name</th>
		<th class="tableHeading">Description</th>
		<th class="tableHeading">Default Value</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>quit</b></td>
		<td class="clsSyntaxCells clsOddRow">Quits RhoElements. Quitting the application while license screen is shown will be slightly delayed.</td>
		<td class="clsSyntaxCells clsOddRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>minimize</b></td>
		<td class="clsSyntaxCells clsEvenRow">Minimizes RhoElements</td>
		<td class="clsSyntaxCells clsEvenRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>restore</b></td>
		<td class="clsSyntaxCells clsOddRow">Restores RhoElements to full screen</td>
		<td class="clsSyntaxCells clsOddRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>getVersion</b></td>
		<td class="clsSyntaxCells clsEvenRow">Returns the version of all installed components via a 'VersionEvent'</td>
		<td class="clsSyntaxCells clsEvenRow">N/A</td>
	</tr>
</table>

## Events
Values are returned to the caller in RhoElements via Events. Most modules contain events and those returned from this module are given below along with the event parameters. Events can cause a navigation to a new URL or a JavaScript function on the page to be invoked. Each event will in most cases have a number of parameters associated with it which will either be strings or JavaScript arrays. Event parameters can be accessed either directly or via JSON objects.

### applicationEvent
The ApplicationEvent is triggered when a RhoElements application is minimized or restored.

<table class="re-table"><col width="3%"/><col width="20%"/><col width="77%"/>
	<tr>
		<th class="tableHeading">ID</th>
		<th class="tableHeading">Name</th>
		<th class="tableHeading">Description</th>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">1</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>applicationState</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">"Minimized" or "Restored"</td>
	</tr>
</table>

### versionEvent
The version of RhoElements installed on the device.

<table class="re-table"><col width="3%"/><col width="20%"/><col width="77%"/>
	<tr>
		<th class="tableHeading">ID</th>
		<th class="tableHeading">Name</th>
		<th class="tableHeading">Description</th>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">1</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>productVersion</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">
			A string defining the released version running on the device, this will be in the form v.w.x.y.  E.g. 1.0.0.0.
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">2</td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>hotFixes</b></td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">
			A JavaScript array of strings containing the hot fixes applied.  There may have been multiple hot fixes applied, e.g. ['1','3'].
		</td>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">3</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>componentVersions (module, version)</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">
			A 2 dimensional array of strings which defined a mapping between each of the installed plugins' name and their version. See remarks for more details.
		</td>
	</tr>
</table>

## Remarks
### ComponentVersions Array Format
The ComponentVersions parameter in the VersionEvent is defined as a 2D array:

	:::term
	(
		(						//  Array for Component 1
			module,		//  The name of the module (string).
			version,	//  The version of the module (string) in the form v.w.x.y.z.
		)
		(						//  Array for Component 2
			module,
			version,
		)
	)

## Requirements

<table class="re-table">
	<tr>
		<th class="tableHeading">RhoElements Version</th>
		<td class="clsSyntaxCell clsEvenRow">1.0.0 or above</td>
	</tr>
	<tr>
		<th class="tableHeading">Supported Devices</th>
		<td class="clsSyntaxCell clsOddRow">All supported devices except: Enterprise Tablet - does not support "Restore" method.</td>
	</tr>
	<tr>
		<th class="tableHeading">Minimum Requirements</th>
		<td class="clsSyntaxCell clsOddRow">None.</td>
	</tr>
	<tr>
		<th class="tableHeading">Persistence</th>
		<td class="clsSyntaxCell clsEvenRow">Immediate - These methods are actioned immediately.</td>
	</tr>
</table>

## HTML/JavaScript Examples
The following example causes RhoElements to exit when the page is loaded

	:::html
	<META HTTP-Equiv="Application" Content="Quit">
	
The following example minimizes RhoElements when the enter key is pressed and reports its state in a message box

	:::html
	<META HTTP-EQUIV="OnKey0x0d" content="javascript:doTest();">
	<META HTTP-EQUIV="Application" content="ApplicationEvent:url('JavaScript:receivedEvent('%s');')">

	<SCRIPT>
		function doTest(){
			application.minimize();
		}
		function doEvent(currentState){
			alert('RhoElements has been ' + currentState);
		}
	</SCRIPT>

The following example

	:::html
	<META HTTP-EQUIV="Application" content="VersionEvent:url('javascript:fnVerJSON(%json);')">

	<SCRIPT>
		function fnVerJSON(jsonObject){
			var theOutput = "<B>Product Version:</b> " + jsonObject.productVersion + "<P>";
			theOutput = theOutput + "<b>Hot Fixes:</b><P>";

			for (var i=0; i<jsonObject.hotFixes.length; i = i + 1){
				theOutput = theOutput + "  Hot Fix: " + jsonObject.hotFixes[i] + "<BR>";
			}

			theOutput = theOutput + "<P>";
			theOutput = theOutput + "<b>Installed Components:</b><P>";
			
			for (var j=0; j<jsonObject.componentVersions.length; j = j + 1){
				theOutput = theOutput + "  Module: " + jsonObject.componentVersions[j].module + ', Version: ' + jsonObject.componentVersions[j].version + "<BR>";
			}
			outputDiv.innerHTML = theOutput;
		}
	</SCRIPT>
	<div id="outputDiv">Version Goes Here</div>
	<P>
		<INPUT align="center" type="button" value="Retrieve Version" onclick="application.getVersion()"><br>