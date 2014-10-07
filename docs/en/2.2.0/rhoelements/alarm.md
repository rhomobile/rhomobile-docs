# Alarm Module
**The Alarm Module is used to set an alarm and register an action to perform when that alarm fires.**

## Syntax

<table class="re-table">
	<tr>
		<th class="tableHeading">alarm (Module) &lt;META&gt; Syntax</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="Alarm" content="[method / parameter]"&gt;</p>
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><p>&lt;META HTTP-Equiv="Alarm" content="AlarmTriggered:url('[jsFunction | url]')"&gt;</p>
		</td>
	</tr>
</table>

<table class="re-table">
	<tr>
		<th class="tableHeading">Alarm JavaScript Object Syntax:</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			By default the JavaScript Object <b>'alarm'</b> will exist on the current page and can be used to interact directly with the alarm.
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow">
			To Invoke alarm methods via JavaScript use the following syntax: alarm.method();
			<br/><br/>
			e.g. <b>alarm</b>.clear();
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			To Set alarm parameters via JavaScript use the following syntax: alarm.parameter = 'value'; remembering to enclose your value in quotes where appropriate.
			<br/><br/>
			e.g. <b>alarm</b>.interval = 'value';
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow">
			To Set alarm return events via JavaScript use the following syntax: alarm.event = JavaScript Function;
			<br/><br/>
			e.g. <b>alarm</b>.alarmTriggered = 'doFunction(%json)';
			<br/><br/>
			For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents">Retrieval Events</a> page.
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: alarm.setEMML("[Your EMML Tags]");
			<br/><br/>
			e.g. <b>alarm</b>.setEMML("interval:<i>value</i>;alarmTriggered:url('JavaScript:doFunction(%json)');clear");
		</td>
	</tr>
</table>

<table class="re-table">
	<tr>
		<th class="tableHeading">Alarm Ruby Object Syntax:</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			By default the Ruby Object <b>'Alarm'</b> will exist on the current page and can be used to interact directly with the Alarm. All Methods, Parameters and Events are the same as JavaScript, however, notice <b>'Alarm'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b>
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow">
			To Invoke Alarm methods via Ruby use the following syntax: Alarm.method()
			<br/><br/>
			e.g. <b>Alarm</b>.clear
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			To Set Alarm parameters via Ruby use the following syntax: Alarm.parameter = 'value' remembering to enclose your value in quotes where appropriate.
			<br/><br/>
			e.g. <b>Alarm</b>.interval = 'value'
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow">
			To Set Alarm return events via Ruby use the following syntax: Alarm.event = url_for(:action =&gt; :event_callback)
			<br/><br/>
			e.g. <b>Alarm</b>.alarmTriggered = url_for(:action =&gt; :alarm_event_callback)
			<br/><br/>
			For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents#params-object">Retrieval Events</a> page.
			<br/><br/>
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
		<td class="clsSyntaxCells clsOddRow"><b>clear</b></td>
		<td class="clsSyntaxCells clsOddRow">Clears the currently set alarm</td>
		<td class="clsSyntaxCells clsOddRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>set</b></td>
		<td class="clsSyntaxCells clsEvenRow">
			Sets the alarm. The alarm will fire after the specified interval or at the specified time (see the parameters section).  You can only have one active alarm at a time.
		</td>
		<td class="clsSyntaxCells clsEvenRow">N/A</td>
	</tr>
</table>

## Parameters
Items listed in this section indicate parameters, or attributes which can be set.

<table class="re-table"><col width="20%"/><col width="20%"/><col width="38%"/><col width="22%"/>
	<tr>
		<th class="tableHeading">Name</th>
		<th class="tableHeading">Possible Values</th>
		<th class="tableHeading">Description</th>
		<th class="tableHeading">Default Value</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>interval:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">Alarm Interval in the format HH-MM-SS</td>
		<td class="clsSyntaxCells clsOddRow">
			Sets a time after which the Alarm will fire. The delay cannot be set to less that 30 seconds, if a value of less than 30 seconds is supplied, the delay will be defaulted to 30 seconds.
		</td>
		<td class="clsSyntaxCells clsOddRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>repeat:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">'true' or 'false'</td>
		<td class="clsSyntaxCells clsEvenRow">
			Provided the alarm has been set using the Interval parameter the alarm will be reset once fired.  If the alarm is set using the 'Time' parameter then this value is ignored.
		</td>
		<td class="clsSyntaxCells clsEvenRow">False</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>time:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">Time in the format "YYYY-MM-DDtHH-MM-SStzd" (e.g. "2009-11-19t11-56-00+01-00"), See Remarks</td>
		<td class="clsSyntaxCells clsOddRow">Sets the alarm to trigger at the specified time.</td>
		<td class="clsSyntaxCells clsOddRow">N/A</td>
	</tr>
</table>

## Events
Values are returned to the caller in RhoElements via Events. Most modules contain events and those returned from this module are given below along with the event parameters. Events can cause a navigation to a new URL or a JavaScript function on the page to be invoked. Each event will in most cases have a number of parameters associated with it which will either be strings or JavaScript arrays. Event parameters can be accessed either directly or via JSON objects.

### alarmTriggered
The alarm triggered event will be fired when either the alarm time reaches that specified in the 'Time' parameter or the period specified in 'Interval' expires. There are no parameters associated with the AlarmTriggered event.

## Remarks
### Validity of registered action on Alarm Triggered
Uniquely for a RhoElements event the registered action for the AlarmTriggered event does not get cleared when you navigate away from the current page. If using a JavaScript function, you must ensure the script is still valid when the alarm fires or alternatively you can clear the alarm.

### Minimum Time Interval
The Alarm is not designed to be triggered for intervals less than 30 seconds, if you require a shorter delay then consider using the JavaScript function 'SetTimeout'.

### Explanation of Time Format
You must specify the time in GMT and then the device's timezone offset from that. E.g. a time expressed as 2012-07-27t08-30-00-05-00 breaks down as follows:

	:::term
	//  Assuming a device with timezone offset -5 hours
	//  This alarm will fire at 8:30am (local time) on 27th July 2012

	Year: 2012
	Month: July
	Day: 27th
	Time: 13:30 exactly (GMT)
	Timezone: -5 (Eastern Time, 8:30am local time)

## Requirements

<table class="re-table">
	<tr>
		<th class="tableHeading">RhoElements Version</th>
		<td class="clsSyntaxCell clsEvenRow">1.0.0 or above</td>
	</tr>
	<tr>
		<th class="tableHeading">Supported Devices</th>
		<td class="clsSyntaxCell clsOddRow">All supported devices except kiosk devices.</td>
	</tr>
	<tr>
		<th class="tableHeading">Minimum Requirements</th>
		<td class="clsSyntaxCell clsOddRow">None.</td>
	</tr>
	<tr>
		<th class="tableHeading">Persistence</th>
		<td class="clsSyntaxCell clsEvenRow">Persistent - Changes to this module will persist when navigating to a new page.</td>
	</tr>
</table>

## HTML/JavaScript Examples
The following example sets the alarm to display an alert box at a repeated interval of 1 hour:

	:::html
	<META HTTP-Equiv="Alarm-Set" Content="Interval:01-00-00; Repeat:True; AlarmTriggered:url('javascript:alert('Alarm Fired');')">

The following example sets the alarm to display an alert box at 8am GMT on 27th July 2012:

	:::html
	<META HTTP-Equiv="Alarm-Set" Content="Time:2012-07-27t08-00-00+00-00; AlarmTriggered:url('javascript:alert('London Olympics Start Today');')">