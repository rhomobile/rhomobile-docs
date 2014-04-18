
#Timer Module

<b>
The Timer Module is used to set a timer and register an action to perform when that timer expires. Once the timer is started the interval time can not be changed without stopping the timer and restarting it.
</b>

##Syntax

<table class="re-table"><tr><th class="tableHeading">timer (Module) &lt;META&gt; Syntax
</th></tr><tr><td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="Timer" content="[method / parameter]"&gt;</p></td></tr><tr><td class="clsSyntaxCells clsEvenRow"><p>&lt;META HTTP-Equiv="Timer" content="Timeout:url('[jsFunction | url]')"&gt;</p></td></tr></table>
<table class="re-table"><tr><th class="tableHeading">Timer JavaScript Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the JavaScript Object <b>'timer'</b> will exist on the current page and can be used to interact directly with the timer.
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Invoke timer methods via JavaScript use the following syntax: timer.method();
<P />e.g. <b>timer</b>.start();
</td></tr><tr><td class="clsSyntaxCells clsOddRow">
To Set timer parameters via JavaScript use the following syntax: timer.parameter = 'value'; remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>timer</b>.interval = 'value';
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">						
To Set timer return events via JavaScript use the following syntax: timer.event = JavaScript Function;
<P />e.g. <b>timer</b>.timeout = 'doFunction(%json)';
<P />
For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents">Retrieval Events</a> page.

</td></tr><tr><td class="clsSyntaxCells clsOddRow">							
To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: timer.setEMML("[Your EMML Tags]");
<P />
e.g. <b>timer</b>.setEMML("interval:<i>value</i>;timeout:url('JavaScript:doFunction(%json)');start");							
</td></tr></table>

<table class="re-table"><tr><th class="tableHeading">Timer Ruby Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the Ruby Object <b>'Timer'</b> will exist on the current page and can be used to interact directly with the Timer. All Methods, Parameters and Events are the same as JavaScript, however, notice <b>'Timer'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b></td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Invoke Timer methods via Ruby use the following syntax: Timer.method()
<P />e.g. <b>Timer</b>.start</td></tr><tr><td class="clsSyntaxCells clsOddRow">
To Set Timer parameters via Ruby use the following syntax: Timer.parameter = 'value' remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>Timer</b>.interval = 'value'
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">						
To Set Timer return events via Ruby use the following syntax: Timer.event = url_for(:action =&gt; :event_callback) 
<P />e.g. <b>Timer</b>.timeout = url_for(:action =&gt; :timer_event_callback)
<P />
For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents#params-object">Retrieval Events</a> page.
<p>To access the event parameters in a Ruby callback function, you reference the @params object within the callback function. This object is simply a ruby hash {"parameter1 name" =&gt; "parameter1 value", "parameter2 name" =&gt; "parameter2 value", ...}</p></td></tr><tr><td class="clsSyntaxCells clsOddRow" /></tr></table>


	

##Methods


Items listed in this section indicate methods or, in some cases, indicate parameters which will be retrieved.

<table class="re-table"><col width="10%" /><col width="68%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>start</b></td><td class="clsSyntaxCells clsOddRow">Starts the timer.  The timer will expire after an interval as specified in the 'Interval' parameter</td><td class="clsSyntaxCells clsOddRow">Not Started</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>stop</b></td><td class="clsSyntaxCells clsEvenRow">Stops the timer if there is currently one running</td><td class="clsSyntaxCells clsEvenRow">Not Started</td></tr></table>


##Parameters


Items listed in this section indicate parameters, or attributes which can be set.
<table class="re-table"><col width="20%" /><col width="20%" /><col width="38%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Possible Values</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>interval:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Values greater than or equal to 500 milliseconds</td><td class="clsSyntaxCells clsOddRow">The duration the timer should run for, specified in milliseconds.  This must be specified before the timer is started.</td><td class="clsSyntaxCells clsOddRow">1000 milliseconds (1 second)</td></tr></table>
<table class="re-table"><col width="78%" /><col width="8%" /><col width="1%" /><col width="5%" /><col width="1%" /><col width="5%" /><col width="2%" /></table>	

##Events


Values are returned to the caller in RhoElements via Events.  Most modules contain events and those returned from this module are given below along with the event parameters.  Events can cause a navigation to a new URL or a JavaScript function on the page to be invoked.  Each event will in most cases have a number of parameters associated with it which will either be strings or JavaScript arrays.  Event parameters can be accessed either directly or via JSON objects.

<br />
###timeout
The Timeout event is triggered when the timer expires and returns the current time.
<table class="re-table"><col width="3%" /><col width="20%" /><col width="77%" /><tr><th class="tableHeading">ID</th><th class="tableHeading">Name</th><th class="tableHeading">Description</th></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">1</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>time</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">The current time from the device clock.  Format is DD/MM/YY HH:MM:SS</td></tr></table>






##Requirements

<table class="re-table"><tr><th class="tableHeading">RhoElements Version</th><td class="clsSyntaxCell clsEvenRow">1.0.0 or above
</td></tr><tr><th class="tableHeading">Supported Devices</th><td class="clsSyntaxCell clsOddRow">All supported devices.</td></tr><tr><th class="tableHeading">Minimum Requirements</th><td class="clsSyntaxCell clsOddRow">None.</td></tr><tr><th class="tableHeading">Persistence</th><td class="clsSyntaxCell clsEvenRow">Partially Persistent - Changes to this module will persist when navigating to a new page with the exception of timeout event.</td></tr></table>


##HTML/JavaScript Examples

The following example sets the timerinterval to 5 seconds:

	<META HTTP-EQUIV="Timer" CONTENT="Interval:5000; Timeout:url('JavaScript:doTimer('%s');'); Start">
	
The following example shows a JavaScript alert at 10 second intervals:

	<HTML>
	  <HEAD>
	    <META HTTP-EQUIV="Timer" CONTENT="Interval:10000; Timeout:url('JavaScript:doTimer('%s');'); Start">
	  </HEAD>
	  <SCRIPT LANGUAGE="javascript">
	    function doTimer(time)
	    {
	      divTimer.innerHTML = 'Time: ' + time;
	    }
	  </SCRIPT>
	  <BODY><DIV ID="divTimer"></DIV></BODY>
	</HTML>
	


