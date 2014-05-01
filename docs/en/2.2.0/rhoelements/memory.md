
#Memory Module

<b>
The Memory Module is used to to retrieve the current available memory or notification of memory dropping below a user defined value.
</b>

##Syntax

<table class="re-table"><tr><th class="tableHeading">memory (Module) &lt;META&gt; Syntax
</th></tr><tr><td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="Memory" content="[method / parameter]"&gt;</p></td></tr><tr><td class="clsSyntaxCells clsEvenRow"><p>&lt;META HTTP-Equiv="Memory" content="memoryEvent:url('[jsFunction | url]')"&gt;</p></td></tr></table>
<table class="re-table"><tr><th class="tableHeading">Memory JavaScript Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the JavaScript Object <b>'memory'</b> will exist on the current page and can be used to interact directly with the memory.
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Invoke memory methods via JavaScript use the following syntax: memory.method();
<P />e.g. <b>memory</b>.getMemoryStats();
</td></tr><tr><td class="clsSyntaxCells clsOddRow">
To Set memory parameters via JavaScript use the following syntax: memory.parameter = 'value'; remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>memory</b>.lowMemThreshold = 'value';
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">						
To Set memory return events via JavaScript use the following syntax: memory.event = JavaScript Function;
<P />e.g. <b>memory</b>.memoryEvent = 'doFunction(%json)';
<P />
For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents">Retrieval Events</a> page.

</td></tr><tr><td class="clsSyntaxCells clsOddRow">							
To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: memory.setEMML("[Your EMML Tags]");
<P />
e.g. <b>memory</b>.setEMML("lowMemThreshold:<i>value</i>;memoryEvent:url('JavaScript:doFunction(%json)');getMemoryStats");							
</td></tr></table>

<table class="re-table"><tr><th class="tableHeading">Memory Ruby Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the Ruby Object <b>'Memory'</b> will exist on the current page and can be used to interact directly with the Memory. All Methods, Parameters and Events are the same as JavaScript, however, notice <b>'Memory'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b></td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Invoke Memory methods via Ruby use the following syntax: Memory.method()
<P />e.g. <b>Memory</b>.getMemoryStats</td></tr><tr><td class="clsSyntaxCells clsOddRow">
To Set Memory parameters via Ruby use the following syntax: Memory.parameter = 'value' remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>Memory</b>.lowMemThreshold = 'value'
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">						
To Set Memory return events via Ruby use the following syntax: Memory.event = url_for(:action =&gt; :event_callback) 
<P />e.g. <b>Memory</b>.memoryEvent = url_for(:action =&gt; :memory_event_callback)
<P />
For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents#params-object">Retrieval Events</a> page.
<p>To access the event parameters in a Ruby callback function, you reference the @params object within the callback function. This object is simply a ruby hash {"parameter1 name" =&gt; "parameter1 value", "parameter2 name" =&gt; "parameter2 value", ...}</p></td></tr><tr><td class="clsSyntaxCells clsOddRow" /></tr></table>


	

##Methods


Items listed in this section indicate methods or, in some cases, indicate parameters which will be retrieved.

<table class="re-table"><col width="10%" /><col width="68%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>getMemoryStats</b></td><td class="clsSyntaxCells clsOddRow">This returns the current status of the device such as total memory and available memory via memoryEvent</td><td class="clsSyntaxCells clsOddRow">N/A</td></tr></table>


##Parameters


Items listed in this section indicate parameters, or attributes which can be set.
<table class="re-table"><col width="20%" /><col width="20%" /><col width="38%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Possible Values</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>lowMemThreshold:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Values in KB</td><td class="clsSyntaxCells clsOddRow">The minimum amount of available memory, specified in KB. </td><td class="clsSyntaxCells clsOddRow">10% of the total memory</td></tr></table>
<table class="re-table"><col width="78%" /><col width="8%" /><col width="1%" /><col width="5%" /><col width="1%" /><col width="5%" /><col width="2%" /></table>	

##Events


Values are returned to the caller in RhoElements via Events.  Most modules contain events and those returned from this module are given below along with the event parameters.  Events can cause a navigation to a new URL or a JavaScript function on the page to be invoked.  Each event will in most cases have a number of parameters associated with it which will either be strings or JavaScript arrays.  Event parameters can be accessed either directly or via JSON objects.

<br />
###memoryEvent
The memoryEvent event is triggered when the available Memory drops below the set value.
<table class="re-table"><col width="3%" /><col width="20%" /><col width="77%" /><tr><th class="tableHeading">ID</th><th class="tableHeading">Name</th><th class="tableHeading">Description</th></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">1</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>totalMemory</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">The total memory in the device, specified in KB</td></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">2</td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>availMemory</b></td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">The available memory in the device, specified in KB</td></tr></table>






##Requirements

<table class="re-table"><tr><th class="tableHeading">RhoElements Version</th><td class="clsSyntaxCell clsEvenRow">2.1 or above
</td></tr><tr><th class="tableHeading">Supported Devices</th><td class="clsSyntaxCell clsOddRow">All supported devices except Enterprise Tablet.</td></tr><tr><th class="tableHeading">Minimum Requirements</th><td class="clsSyntaxCell clsOddRow">None.</td></tr><tr><th class="tableHeading">Persistence</th><td class="clsSyntaxCell clsEvenRow">Non Persistent - Changes to this module will not persist when navigating to a new page.</td></tr></table>


##HTML/JavaScript Examples

The following example sets the lowMemThreshold to 1500 KB:

	<META HTTP-EQUIV="Memory" CONTENT="lowMemThreshold:1500; memoryEvent:url('JavaScript:notification('%s');');">
	
The following example sets the memory threshold value to 10% of the total memory in the device:

	<HTML>
		<HEAD>
		<TITLE>memory Notification</TITLE>
		<META HTTP-EQUIV="memory" content="memoryEvent:url('javascript:getMemory(%json);')">			
		</HEAD>	
		<SCRIPT type="text/javascript">
		function getMemory(jsonObject)
		{
			alert("Total Memory: " + jsonObject.totalMemory + "KB, Avail Memory: " + jsonObject.availMemory + "KB");		
			memory.lowMemThreshold  = jsonObject.totalMemory / 10;
			memory.memoryEvent = "onLowMemory(%json);";		
		}	
		function onLowMemory(jsonObject)
		{
			alert("The device is running low on memory, only " + jsonObject.availMemory + "KB is left on the device");			
		}	
		</SCRIPT>
		<BR><BR><INPUT type="button" value="GetMemory" onclick="memory.getMemoryStats();">
	</HTML>
	


