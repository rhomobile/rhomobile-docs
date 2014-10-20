# Gesture Module
**The Gesture Module is used to define touch screen. Check the [gestures overview page](GesturesOverview) for more detail on different types of gestures.**

## Syntax

<table class="re-table">
	<tr>
		<th class="tableHeading">gesture (Module) &lt;META&gt; Syntax</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="Gesture" content="[method / parameter]"&gt;</p></td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><p>&lt;META HTTP-Equiv="Gesture" contents="Detected:url('[jsFunction | url]')"&gt;</p></td>
	</tr>
</table>

<table class="re-table">
	<tr>
		<th class="tableHeading">Gesture JavaScript Object Syntax:</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			By default the JavaScript Object <b>'gesture'</b> will exist on the current page and can be used to interact directly with the gesture.
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow">
			To Invoke gesture methods via JavaScript use the following syntax: <code>gesture.method();</code>
			<br/><br/>
			e.g. <b>gesture</b>.create();
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			To Set gesture parameters via JavaScript use the following syntax: <code>gesture.parameter = 'value';</code> remembering to enclose your value in quotes where appropriate.
			<br/><br/>
			e.g. <b>gesture</b>.type = 'value';
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow">
			To Set gesture return events via JavaScript use the following syntax: <code>gesture.event = JavaScript Function;</code>
			<br/><br/>
			e.g. <b>gesture</b>.detected = 'doFunction(%json)';
			<br/><br/>
			For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents">Retrieval Events</a> page.
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: <code>gesture.setEMML("[Your EMML Tags]");</code>
			<br/><br/>
			e.g. <b>gesture</b>.setEMML("type:<i>value</i>;detected:url('JavaScript:doFunction(%json)');create");
		</td>
	</tr>
</table>

<table class="re-table">
	<tr>
		<th class="tableHeading">Gesture Ruby Object Syntax:</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			By default the Ruby Object <b>'Gesture'</b> will exist on the current page and can be used to interact directly with the Gesture. All Methods, Parameters and Events are the same as JavaScript, however, notice <b>'Gesture'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b>
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow">
			To Invoke Gesture methods via Ruby use the following syntax: Gesture.method()
			<br/><br/>
			e.g. <b>Gesture</b>.create
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			To Set Gesture parameters via Ruby use the following syntax: <code>Gesture.parameter = 'value'</code> remembering to enclose your value in quotes where appropriate.
			<br/><br/>
			e.g. <b>Gesture</b>.type = 'value'
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow">
			To Set Gesture return events via Ruby use the following syntax: <code>Gesture.event = url_for(:action =&gt; :event_callback)</code>
			<br/><br/>
			e.g. <b>Gesture</b>.detected = url_for(:action =&gt; :gesture_event_callback)
			<br/><br/>
			For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents#params-object">Retrieval Events</a> page.<br/>
			To access the event parameters in a Ruby callback function, you reference the @params object within the callback function. This object is simply a ruby hash {"parameter1 name" =&gt; "parameter1 value", "parameter2 name" =&gt; "parameter2 value", ...}
		</td>
	</tr>
	<tr>
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
		<td class="clsSyntaxCells clsOddRow"><b>create</b></td>
		<td class="clsSyntaxCells clsOddRow">Creates the previously defined gesture. Must be the last tag when creating a gesture.</td>
		<td class="clsSyntaxCells clsOddRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>delete</b></td>
		<td class="clsSyntaxCells clsEvenRow">Deletes the gesture last defined by the ID property. See example.</td>
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
		<td class="clsSyntaxCells clsOddRow"><b>type:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">Linear, Circle, Hold, Tilt and Shake</td>
		<td class="clsSyntaxCells clsOddRow">Specifies the type of gesture being created. Must be the first tag when creating a gesture.</td>
		<td class="clsSyntaxCells clsOddRow">None</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>id:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">Any string</td>
		<td class="clsSyntaxCells clsEvenRow">ID used to identify gesture when detected.</td>
		<td class="clsSyntaxCells clsEvenRow">Depends on gesture type and preset used, if any. See remarks.</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>preset:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">Depends on gesture type. See remarks.</td>
		<td class="clsSyntaxCells clsOddRow">Name of predefined set of parameter values.</td>
		<td class="clsSyntaxCells clsOddRow">Depends on gesture type. See remarks.</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>diagnostics:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">TRUE, FALSE</td>
		<td class="clsSyntaxCells clsEvenRow">
			Enables drawing of diagnostic information to provide guidance showing whether or not the gesture will be detected.  Note that by their very nature Diagnostics are not designed to be seen by the user.
		</td>
		<td class="clsSyntaxCells clsEvenRow">FALSE</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>startX:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">0 to 10000</td>
		<td class="clsSyntaxCells clsOddRow">Linear Gestures: Starting point of gesture.</td>
		<td class="clsSyntaxCells clsOddRow">10% of screen width.</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>startY:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">0 to 10000</td>
		<td class="clsSyntaxCells clsEvenRow">Linear Gestures: Starting point of gesture.</td>
		<td class="clsSyntaxCells clsEvenRow">50% of screen height.</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>endX:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">0 to 10000</td>
		<td class="clsSyntaxCells clsOddRow">Linear Gestures: End point of gesture.</td>
		<td class="clsSyntaxCells clsOddRow">90% of screen width.</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>endY:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">0 to 10000</td>
		<td class="clsSyntaxCells clsEvenRow">Linear Gestures: End point of gesture.</td>
		<td class="clsSyntaxCells clsEvenRow">50% of screen height.</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>skew:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">0 to 90</td>
		<td class="clsSyntaxCells clsOddRow">Linear Gestures: Maximum angle which straight line through mouse track can make to the gesture path.</td>
		<td class="clsSyntaxCells clsOddRow">20</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>deviation:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">0 to 100</td>
		<td class="clsSyntaxCells clsEvenRow">Linear Gestures: Maximum deviation of mouse track from a straight line.</td>
		<td class="clsSyntaxCells clsEvenRow">20</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>regionWidth:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">0 to 10000</td>
		<td class="clsSyntaxCells clsOddRow">
			Linear Gestures: Width of regions into which gesture path is divided. Setting very small (e.g. 1) or large (e.g. equal to the gesture line length) values is allowed but may lead to unexpected results.
		</td>
		<td class="clsSyntaxCells clsOddRow">10% of screen width.</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>centerX:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">-10000 to 10000</td>
		<td class="clsSyntaxCells clsEvenRow">Circle &amp; Hold Gestures: Center of gesture.</td>
		<td class="clsSyntaxCells clsEvenRow">Center of screen.</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>centerY:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">-10000 to 10000</td>
		<td class="clsSyntaxCells clsOddRow">Circle &amp; Hold Gestures: Center of gesture.</td>
		<td class="clsSyntaxCells clsOddRow">Center of screen.</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>radius:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">1 to 10000</td>
		<td class="clsSyntaxCells clsEvenRow">Circle &amp; Hold Gestures: Radius (in pixels) of gesture.</td>
		<td class="clsSyntaxCells clsEvenRow">33% of screen width or height, whichever is smaller.</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>start:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">0 to 10000</td>
		<td class="clsSyntaxCells clsOddRow">Circle Gestures: Starting angle of gesture in degrees. Angles are measured clockwise from 3 o'clock position.</td>
		<td class="clsSyntaxCells clsOddRow">0</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>end:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">0 to 10000</td>
		<td class="clsSyntaxCells clsEvenRow">Circle Gestures: Ending angle of gesture in degrees. Angles are measured clockwise from 3 o'clock position.</td>
		<td class="clsSyntaxCells clsEvenRow">180</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>tolerance:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">0 to 10000</td>
		<td class="clsSyntaxCells clsOddRow">Linear &amp; Circle Gestures: How far (in pixels) the mouse track can vary from the gesture path.</td>
		<td class="clsSyntaxCells clsOddRow"> Linear: 25% of screen height. Circle: 16% of screen width.</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>sensitivity:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">0 to 100</td>
		<td class="clsSyntaxCells clsEvenRow">
			Linear &amp; Circle Gestures: Percentage of gesture path which mouse track must cover. Rounds down if this results in a non-whole number of regions.
		</td>
		<td class="clsSyntaxCells clsEvenRow">50</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>delay:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">&gt;=0</td>
		<td class="clsSyntaxCells clsOddRow">Hold Gestures: Time (in milliseconds) that screen must be touched within gesture before first detected.</td>
		<td class="clsSyntaxCells clsOddRow">1000</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>interval:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">&gt;=0</td>
		<td class="clsSyntaxCells clsEvenRow">
			Hold Gestures: Time (in milliseconds) between subsequent detections while screen continues to be touched. Zero means no further detections.  This parameter is ignored if the detection event is not set to navigate to a new page.
		</td>
		<td class="clsSyntaxCells clsEvenRow">0</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>TargetX:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">-90 to 90</td>
		<td class="clsSyntaxCells clsOddRow">Tilt Gestures: Target orientation of device on X-axis</td>
		<td class="clsSyntaxCells clsOddRow">0</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>TargetY:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">-90 to 90</td>
		<td class="clsSyntaxCells clsEvenRow">Tilt Gestures: Target orientation of device on Y-axis</td>
		<td class="clsSyntaxCells clsEvenRow">0</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>TargetZ:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">-90 to 90</td>
		<td class="clsSyntaxCells clsOddRow">Tilt Gestures: Target orientation of device on Z-axis</td>
		<td class="clsSyntaxCells clsOddRow">90</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>TiltTolerance:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">0 to 90</td>
		<td class="clsSyntaxCells clsEvenRow">Tilt Gestures: How close the device must be to the target orientation.</td>
		<td class="clsSyntaxCells clsEvenRow">10</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>Hysteresis:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">0 to 90</td>
		<td class="clsSyntaxCells clsOddRow">
			Tilt Gestures: How far the device must move away from the target orientation before the gesture can be detected again.
		</td>
		<td class="clsSyntaxCells clsOddRow">10</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>Threshold:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">0 to 1000</td>
		<td class="clsSyntaxCells clsEvenRow">Shake Gestures: How vigorously the device must be shaken. The smaller the value the more vigorous.</td>
		<td class="clsSyntaxCells clsEvenRow">500</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>Quiet:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">&gt;=0</td>
		<td class="clsSyntaxCells clsOddRow">Shake Gestures: Time (in milliseconds) that the device must be still before another shake gesture can be detected.</td>
		<td class="clsSyntaxCells clsOddRow">1000</td>
	</tr>
</table>

## Events
Values are returned to the caller in RhoElements via Events.  Most modules contain events and those returned from this module are given below along with the event parameters.  Events can cause a navigation to a new URL or a JavaScript function on the page to be invoked.  Each event will in most cases have a number of parameters associated with it which will either be strings or JavaScript arrays.  Event parameters can be accessed either directly or via JSON objects.

### detected

<table class="re-table"><col width="3%"/><col width="20%"/><col width="77%"/>
	<tr>
		<th class="tableHeading">ID</th>
		<th class="tableHeading">Name</th>
		<th class="tableHeading">Description</th>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">1</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>id</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">The ID string of the detected gesture.</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">2</td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>count</b></td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">
			The number of times a hold gesture has been detected for a single press of the screen. Returns zero when the screen touch stops. Only applies to hold gestures.
		</td>
	</tr>
</table>

## Remarks
### Gesture Notes
Depending on your device configuration you may find it very difficult to perform a gesture without performing any scrolling, particularly within the Internet Explorer engine. If you find your gestures disappear because you have accidentally scrolled, you must tap the screen to make them return.

### Presets and IDs
The 'preset' tag is used to specify one of the preset values below. When a gesture definition is started using the 'type' tag its parameters are initially set to the preset shown as default. When a preset is specified for a gesture, including when it is first created, its ID is set to [gesture name]-[default preset name]. E.g. a new linear gesture will have the ID 'linear-left-right'. This can be replaced (as can any preset value) by a subsequent parameter tag.


	:::term
	GESTURE          POSSIBLE VALUES                                         DEFAULT
	Linear           left-right, right-left, top-bottom, bottom-top          left-right
	Circle           happy*, sad*                                            happy
	Hold             center                                                  center
	Tilt             face-up   (0, 0, 90), face-down  (0, 0, -90),           face-up
	                 upright   (0, 90, 0), turn-down  (0, -90, 0),
	                 turn-left (90, 0, 0), turn-right (-90, 0, 0)
	Shake            normal                                                  normal

### Meanings of Presets
"Happy" means a 180 degree semi-circle, clockwise from the 3 o'clock position. "Sad" means a 180 degree semi-circle, clockwise from the 9 o'clock position.

### Maximum Gesture Size
There is no formal maximum size for a gesture, for example a circle gesture could require the user to move several times round the circle. However if the user draws such a gesture very slowly it's possible that too many stylus move points could be generated, and the gesture wouldn't be detected. The plugin has been tested with a circle gesture from 0 to 720 degrees and taking approximately 6 seconds to draw without problem.

### Finger Scrolling
Gestures are not compatible with Finger Scrolling

### Common Pitfalls
Do not use alert boxes within the Gesture-Detected Callback, doing so will steal focus from the gesture region.

### Out-of-range Values
Any parameter values out of the allowed range will be limited to the nearest allowed value. E.g. giving a sensitivity greater than 100 will use 100. Numeric parameters given as text will be treated as zero.

### Diagnostics
Note that diagnostics exist only for the purpose of understanding and evaluating the various parameters. They should not be enabled in the release version of the code. They may also not display correctly in every circumstance, e.g. when scrolling, or for certain sets of parameters, e.g. for nearly vertical linear gestures. Diagnostics are not available for Tilt and Shake gestures.

## Requirements

<table class="re-table">
	<tr>
		<th class="tableHeading">RhoElements Version</th>
		<td class="clsSyntaxCell clsEvenRow">1.0.0 or above</td>
	</tr>
	<tr>
		<th class="tableHeading">Supported Devices</th>
		<td class="clsSyntaxCell clsOddRow">All supported devices. On Windows the tilt and shake gestures are supported only on MPA3.0 devices.</td>
	</tr>
	<tr>
		<th class="tableHeading">Minimum Requirements</th>
		<td class="clsSyntaxCell clsOddRow">Linear, Circle and Hold gestures require a touch screen.</td>
	</tr>
	<tr>
		<th class="tableHeading">Persistence</th>
		<td class="clsSyntaxCell clsEvenRow">Transient - any changes made by changing parameters will be lost when navigating to a new page.</td>
	</tr>
</table>

## HTML/JavaScript Examples
Create two gestures: a default left to right gesture with ID 'swipe', and a hold gesture at the top left of the screen which will fire one time after 500 milliseconds with ID 'press'. The JavaScript function onGesture() is called when either gesture is detected.

	:::html
	<META HTTP-Equiv="gesture" Content="type:linear">
	<META HTTP-Equiv="gesture" Content="id:swipe">
	<META HTTP-Equiv="gesture" Content="create">
	<META HTTP-Equiv="gesture" Content="type:hold">
	<META HTTP-Equiv="gesture" Content="center-x:60">
	<META HTTP-Equiv="gesture" Content="center-y:60">
	<META HTTP-Equiv="gesture" Content="radius:60">
	<META HTTP-Equiv="gesture" Content="delay:500">
	<META HTTP-Equiv="gesture" Content="interval:0">
	<META HTTP-Equiv="gesture" Content="id:press">
	<META HTTP-Equiv="gesture" Content="create">
	<META HTTP-Equiv="gesture-detected" Content="url('JavaScript:onGesture('%s','%s');')">

The following example deletes a gesture via a JavaScript function.

	:::js
	function deleteGesture(gestureID)
	{
	  gesture.id = gestureID;
	  gesture.delete();
	}
     
Create 3D gestures: a tilt gesture that is called when the device is placed in upright position and a shake gesture. The JavaScript function onGesture() is called when either gesture is detected.

	:::html
	<META HTTP-Equiv="gesture" Content="type:tilt">
	<META HTTP-Equiv="gesture" Content="id:swipe">
	<META HTTP-Equiv="gesture" Content="create">
	<META HTTP-Equiv="gesture" Content="type:shake">        
	<META HTTP-Equiv="gesture" Content="id:shake">
	<META HTTP-Equiv="gesture" Content="create">
	<META HTTP-Equiv="gesture-detected" Content="url('JavaScript:onGesture(%json);')">

	<script type="text/javascript">	
	function onGesture(jsonObject)
	{
	 var html = "<b>Gesture Detected: </b>" + jsonObject.id + "";	 
	 gestureOut.innerHTML=html;	 
	}      
	</script> 
	<DIV id="gestureOut">Gesture Output will appear here</div> 