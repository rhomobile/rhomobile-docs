# Battery Module
**The Battery Module is used to set the attributes of the battery indicator and retrieve the status of the battery. For more information about positioning these indicators, please refer to the [indicator layout overview page](IndicatorPositions).**

## Syntax
<table class="re-table">
	<tr>
		<th class="tableHeading">battery (Module) &lt;META&gt; Syntax</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="Battery" content="[parameter]"&gt;</p></td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><p>&lt;META HTTP-Equiv="Battery" content="BatteryEvent:url('[jsFunction | url]')"&gt;</p></td>
	</tr>
</table>

<table class="re-table">
	<tr>
		<th class="tableHeading">Battery JavaScript Object Syntax:</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			By default the JavaScript Object <b>'battery'</b> will exist on the current page and can be used to interact directly with the battery.
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow">
			To Invoke battery methods via JavaScript use the following syntax: battery.method();
			<br/><br/>
			e.g. <b>battery</b>.getSmartBatteryStatus();
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			To Set battery parameters via JavaScript use the following syntax: battery.parameter = 'value'; remembering to enclose your value in quotes where appropriate.
			<br/><br/>
			e.g. <b>battery</b>.visibility = 'value';
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow">
			To Set battery return events via JavaScript use the following syntax: battery.event = JavaScript Function;
			<br/><br/>
			e.g. <b>battery</b>.batteryEvent = 'doFunction(%json)';
			<br/><br/>
			For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents">Retrieval Events</a> page.
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: battery.setEMML("[Your EMML Tags]");
			<br/><br/>
			e.g. <b>battery</b>.setEMML("visibility:<i>value</i>;batteryEvent:url('JavaScript:doFunction(%json)');getSmartBatteryStatus");
		</td>
	</tr>
</table>

<table class="re-table">
	<tr>
		<th class="tableHeading">Battery Ruby Object Syntax:</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			By default the Ruby Object <b>'Battery'</b> will exist on the current page and can be used to interact directly with the Battery. All Methods, Parameters and Events are the same as JavaScript, however, notice <b>'Battery'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b>
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow">
			To Invoke Battery methods via Ruby use the following syntax: Battery.method()
			<br/><br/>
			e.g. <b>Battery</b>.getSmartBatteryStatus
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			To Set Battery parameters via Ruby use the following syntax: Battery.parameter = 'value' remembering to enclose your value in quotes where appropriate.
			<br/><br/>
			e.g. <b>Battery</b>.visibility = 'value'
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow">
			To Set Battery return events via Ruby use the following syntax: Battery.event = url_for(:action =&gt; :event_callback)
			<br/><br/>
			e.g. <b>Battery</b>.batteryEvent = url_for(:action =&gt; :battery_event_callback)
			<br/><br/>
			For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents#params-object">Retrieval Events</a> page. 
			<br/><br/>
			To access the event parameters in a Ruby callback function, you reference the @params object within the callback function. This object is simply a ruby hash {"parameter1 name" =&gt; "parameter1 value", "parameter2 name" =&gt; "parameter2 value", ...}
		</td>
	</tr>
</table>

## Methods
Items listed in this section indicate methods or, in some cases, indicate parameters which will be retrieved.

<table class="re-table"><col width="10%" /><col width="68%" /><col width="22%" />
	<tr>
		<th class="tableHeading">Name</th>
		<th class="tableHeading">Description</th>
		<th class="tableHeading">Default Value</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>getSmartBatteryStatus</b></td>
		<td class="clsSyntaxCells clsOddRow">
			Triggers a SmartBatteryEvent. This returns attributes about the battery such as number of charge cycles and date of manufacture. Please note that the Smart Battery is only supported on Zebra Devices running Windows Embedded Hand-held or CE and is dependent on the available hardware.</td>
		<td class="clsSyntaxCells clsOddRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>getBatteryStatus</b></td>
		<td class="clsSyntaxCells clsEvenRow">Triggers a BatteryEvent. This returns attributes about the battery such as battery life and AC line status etc.</td>
		<td class="clsSyntaxCells clsEvenRow">N/A</td>
	</tr>
</table>

## Parameters
Items listed in this section indicate parameters, or attributes which can be set.

<table class="re-table"><col width="20%" /><col width="20%" /><col width="38%" /><col width="22%" />
	<tr>
		<th class="tableHeading">Name</th>
		<th class="tableHeading">Possible Values</th>
		<th class="tableHeading">Description</th>
		<th class="tableHeading">Default Value</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>visibility:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">visible or hidden</td>
		<td class="clsSyntaxCells clsOddRow">Sets whether or not the battery indicator is shown</td>
		<td class="clsSyntaxCells clsOddRow">Hidden</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>left:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">Pixel value</td>
		<td class="clsSyntaxCells clsEvenRow">
			Sets the horizontal position of the battery indicator in pixels. If it is negative the then indicator will be moved off screen
		</td>
		<td class="clsSyntaxCells clsEvenRow">Top left of screen</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>top:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">Pixel value</td>
		<td class="clsSyntaxCells clsOddRow">
			Sets the vertical position of the battery indicator in pixels. if value is negative then indicator will be moved off screen</td><td class="clsSyntaxCells clsOddRow">Top left of screen.
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>layout:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">Left, Right, Up, Down</td>
		<td class="clsSyntaxCells clsEvenRow">Sets the orientation of the battery icon</td>
		<td class="clsSyntaxCells clsEvenRow">Right</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>color:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">Hex Values (#000000 - #FFFFFF)</td>
		<td class="clsSyntaxCells clsOddRow">RGB value that sets the color of the battery indicator using HTML web colors</td>
		<td class="clsSyntaxCells clsOddRow">#000000</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>sampleInterval:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">Refresh interval</td>
		<td class="clsSyntaxCells clsEvenRow">The battery refresh interval, specified in milliseconds. A value of 0 disables the automatic refresh.</td>
		<td class="clsSyntaxCells clsEvenRow">5000 milliseconds</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>setSystemNotifications:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">Enabled, Disabled</td>
		<td class="clsSyntaxCells clsOddRow">
			Sets the system notifications for battery. If we enable the system Notifications then its recommended to disable the auto refresh by setting the sampleInterval to 0 otherwise the eventSource in the battery status gets overwritten to "Timed Interval". Please note that the system notifications are reported only once by the operating system and hence the low battery conditions are not reported if the device is already in low battery condition.
		</td>
		<td class="clsSyntaxCells clsOddRow">Disabled
		</td>
	</tr>
</table>

## Events
Values are returned to the caller in RhoElements via Events. Most modules contain events and those returned from this module are given below along with the event parameters. Events can cause a navigation to a new URL or a JavaScript function on the page to be invoked. Each event will in most cases have a number of parameters associated with it which will either be strings or JavaScript arrays. Event parameters can be accessed either directly or via JSON objects.

### batteryEvent
The BatteryEvent gives an indication of the remaining battery level. Once registered for you will receive a BatteryEvent at regular intervals, as specified by the BatteryRefresh configuration setting.

<table class="re-table"><col width="3%" /><col width="20%" /><col width="77%" />
	<tr>
		<th class="tableHeading">ID</th>
		<th class="tableHeading">Name</th>
		<th class="tableHeading">Description</th>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">1</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>acLineStatus</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">The AC line status (whether or not on external power).</td>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsEvenRow">2</td>
		<td style="text-align:left;" class="clsSyntaxCells clsEvenRow"><b>batteryLifePercent</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsEvenRow">Displays the remaining battery power as a percentage. For some Zebra Android devices, the API will return a value of 255 at all times while the battery is being charged. The same value also might be displayed for a few seconds initially after reboot while the battery is being discharged. This is in accordance with hardware design specs and should be taken into account when using the API.
		</td>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">3</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>backupBatteryLifePercent</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">Remaining backup battery power as a percentage.</td>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsEvenRow">4</td>
		<td style="text-align:left;" class="clsSyntaxCells clsEvenRow"><b>eventSource</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsEvenRow">
			Reason for event firing ("Timed Interval", "User Request", "Low Battery", "Critical Battery", "AC Connect" and "AC Disconnect"). "Timed Interval" is when the status gets refreshed automatically and "User Request" is when the user manually calls getBatteryStatus method and the remaining are generated through system notifications.
		</td>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">5</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>batteryLifeKnown</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">
			Battery life will not be readable for a period of time after removing from an AC power source. This parameter will state whether the batteryLifePercent is accurate ("true"/"false").
		</td>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsEvenRow">6</td>
		<td style="text-align:left;" class="clsSyntaxCells clsEvenRow"><b>backupBatteryLifeKnown</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsEvenRow">
			Backup battery life will not be readable for a period of time after removing from an AC power source. This parameter will state whether the backupBatteryLifePercent is accurate ("true"/"false").
		</td>
	</tr>
</table>

### smartBatteryEvent
Returns various parameters relating to battery charge and battery hardware. Not all return values may be supported by all batteries. Not supported on the Enterprise Tablet.

<table class="re-table"><col width="3%"/><col width="20%"/><col width="77%"/>
	<tr>
		<th class="tableHeading">ID</th>
		<th class="tableHeading">Name</th>
		<th class="tableHeading">Description</th>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">1</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>serialNumber</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">The serial number of the battery</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">2</td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>partNumber</b></td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">The Zebra part number of the battery, e.g. 21-65587 Rev. A</td>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">3</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>batteryChargeCycles</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">
			The number of times the battery has been charged.  Partial charges are aggregated, therefore each charge cycle count represents one full charge / discharge cycle.  The battery charge cycle count gets updated when the battery charging state changes from charging to not charging.  Cycle count may not accuratley predict the life of a battery.
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">4</td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>ratedCapacity</b></td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">Rated capacity of the battery in mAh</td>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">5</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>manufactureDate</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">Date the battery was manufactured expressed as MM/DD/YYYY.</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">6</td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>stateOfHealth</b></td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">"Healthy", "Unhealthy" or "Unknown"</td>
	</tr>
</table>

## Remarks
### Overlapping
Do not display the Battery indicator overlapping with the Signal indicator.

### Indicator Positions
For an illustrative guide to the meaning of the Layout parameter, see the 'Indicator Positions' section.

### Parameter Deprecation
For users migrating their PocketBrowser apps to RhoElements please note that due to the difference in the battery indicator graphic, the GraphPosition and IconPosition parameters have been deprecated. Please use the Layout parameter instead.

## Requirements

<table class="re-table">
	<tr>
		<th class="tableHeading">RhoElements Version</th>
		<td class="clsSyntaxCell clsOddRow">1.0.0 or above</td>
	</tr>
	<tr>
		<th class="tableHeading">Supported Devices</th>
		<td class="clsSyntaxCell clsEvenRow">
			All supported devices. Enterprise Tablet does not support Smart battery information, getBatteryStatus, sampleInterval, setSystemNotifications and eventSource.
		</td>
	</tr>
	<tr>
		<th class="tableHeading">Minimum Requirements</th>
		<td class="clsSyntaxCell clsOddRow">None.
		</td>
	</tr>
	<tr>
		<th class="tableHeading">Persistence</th>
		<td class="clsSyntaxCell clsEvenRow">
			Partially Persistent - Changes to this module will persist when navigating to a new page with the exception of the view finder: this will be hidden on page navigation.
		</td>
	</tr>
</table>

## HTML/JavaScript Examples
The following example shows the battery indicator, sets the x and y co-ordinates to 50, the color of the indicator to red and positions the indicator at the bottom of the screen growing from right to left:

	:::html
	<META HTTP-Equiv="battery" Content="visibility:visible">
	<META HTTP-Equiv="battery" Content="Left:50">
	<META HTTP-Equiv="battery" Content="Top:50">
	<META HTTP-Equiv="battery" Content="Layout:Left">
	<META HTTP-Equiv="battery" Content="Color:#FF0000">   

Example shown above can also be written as shown below

	:::html
	<META HTTP-Equiv="Battery" Content="Left:50;Top:50;Layout:Left;color:#FF0000;visibility:visible">

Parameters can also be concatenated as shown below

	:::html
	<META HTTP-Equiv="Battery-Left" Content="Left:50">
	<META HTTP-Equiv="Battery-Top" Content="Top:50">
	<META HTTP-Equiv="Battery-Color" Content="Color:#FF0000">

The following example navigates to a new page with parameters upon a battery status change.

	:::html
	<META HTTP-Equiv="Battery" Content="BatteryEvent:url('mypage.asp?Data=%s&Source=%s&Type=%s&Time=%s&Length=%s')">

The following example alerts the user with battery notifications such as low battery warning.

	:::html
	<HTML>
		<HEAD>
		<TITLE>Low Battery Notification</TITLE>
		<META HTTP-EQUIV="battery" content="sampleInterval:0;batteryEvent:url('javascript:lowBattery(%json);')">
		</HEAD>	
		<SCRIPT type="text/javascript">
		function lowBattery(jsonObject)
		{
			alert("Event: " + jsonObject.eventSource + " ,Battery remaining: " + jsonObject.batteryLifePercent + 
			"% ,Backup battery remaining:" + jsonObject.backupBatteryLifePercent + "% ,AC line status: " + jsonObject.acLineStatus);
		}
		</SCRIPT>
		<BR><INPUT type="button" value="EnableNotifications" onclick="battery.setSystemNotifications='Enabled';">
		<BR><INPUT type="button" value="DisableNotifications" onclick="battery.setSystemNotifications='Disabled';">
	</HTML>
