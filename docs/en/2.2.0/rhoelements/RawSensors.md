
#RawSensors Module

<b>
The RawSensors Module is used to retrieve the raw data values of the specified sensors.
</b>

##Syntax

<table class="re-table"><tr><th class="tableHeading">RawSensors (Module) &lt;META&gt; Syntax
</th></tr><tr><td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="RawSensors" content="[method / parameter]"&gt;</p></td></tr><tr><td class="clsSyntaxCells clsEvenRow"><p>&lt;META HTTP-Equiv="RawSensors" content="sensorEvent:url('[jsFunction | url]')"&gt;</p></td></tr></table>
<table class="re-table"><tr><th class="tableHeading">RawSensors JavaScript Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the JavaScript Object <b>'RawSensors'</b> will exist on the current page and can be used to interact directly with the RawSensors.
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Invoke RawSensors methods via JavaScript use the following syntax: rawsensors.method();
<P />e.g. <b>RawSensors</b>.getSensorData();
</td></tr><tr><td class="clsSyntaxCells clsOddRow">
To Set RawSensors parameters via JavaScript use the following syntax: rawsensors.parameter = 'value'; remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>RawSensors</b>.accelerometer = 'value';
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">						
To Set RawSensors return events via JavaScript use the following syntax: rawsensors.event = JavaScript Function;
<P />e.g. <b>RawSensors</b>.sensorEvent = 'doFunction(%json)';
<P />
For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents">Retrieval Events</a> page.

</td></tr><tr><td class="clsSyntaxCells clsOddRow">							
To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: rawsensors.setEMML("[Your EMML Tags]");
<P />
e.g. <b>RawSensors</b>.setEMML("accelerometer:<i>value</i>;sensorEvent:url('JavaScript:doFunction(%json)');getSensorData");							
</td></tr></table>

<table class="re-table"><tr><th class="tableHeading">RawSensors Ruby Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the Ruby Object <b>'RawSensors'</b> will exist on the current page and can be used to interact directly with the RawSensors. All Methods, Parameters and Events are the same as JavaScript, however, notice <b>'RawSensors'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b></td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Invoke RawSensors methods via Ruby use the following syntax: RawSensors.method()
<P />e.g. <b>RawSensors</b>.getSensorData</td></tr><tr><td class="clsSyntaxCells clsOddRow">
To Set RawSensors parameters via Ruby use the following syntax: RawSensors.parameter = 'value' remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>RawSensors</b>.accelerometer = 'value'
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">						
To Set RawSensors return events via Ruby use the following syntax: RawSensors.event = url_for(:action =&gt; :event_callback) 
<P />e.g. <b>RawSensors</b>.sensorEvent = url_for(:action =&gt; :rawsensors_event_callback)
<P />
For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents#params-object">Retrieval Events</a> page.
<p>To access the event parameters in a Ruby callback function, you reference the @params object within the callback function. This object is simply a ruby hash {"parameter1 name" =&gt; "parameter1 value", "parameter2 name" =&gt; "parameter2 value", ...}</p></td></tr><tr><td class="clsSyntaxCells clsOddRow" /></tr></table>


	

##Methods


Items listed in this section indicate methods or, in some cases, indicate parameters which will be retrieved.

<table class="re-table"><col width="10%" /><col width="68%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>getSensorData</b></td><td class="clsSyntaxCells clsOddRow">This immediately returns the raw data of the specified sensors via the sensorEvent</td><td class="clsSyntaxCells clsOddRow">N/A</td></tr></table>


##Parameters


Items listed in this section indicate parameters, or attributes which can be set.
<table class="re-table"><col width="20%" /><col width="20%" /><col width="38%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Possible Values</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>accelerometer:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Enabled, Disabled</td><td class="clsSyntaxCells clsOddRow">This enables/disables the accelerometer sensor data retrieval.</td><td class="clsSyntaxCells clsOddRow">Disabled</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>deviceOrientation:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Enabled, Disabled</td><td class="clsSyntaxCells clsEvenRow">This enables/disables the device orientation sensor data retrieval.</td><td class="clsSyntaxCells clsEvenRow">Disabled</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>tiltangle:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Enabled, Disabled</td><td class="clsSyntaxCells clsOddRow">This enables/disables the tiltangle sensor data retrieval.</td><td class="clsSyntaxCells clsOddRow">Disabled</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>motion:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Enabled, Disabled</td><td class="clsSyntaxCells clsEvenRow">This enables/disables the motion sensor data retrieval.</td><td class="clsSyntaxCells clsEvenRow">Disabled</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>ecompass:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Enabled, Disabled</td><td class="clsSyntaxCells clsOddRow">This enables/disables the ecompass sensor data retrieval.</td><td class="clsSyntaxCells clsOddRow">Disabled</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>magnetometer:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Enabled, Disabled</td><td class="clsSyntaxCells clsEvenRow">This enables/disables the magnetometer sensor data retrieval.</td><td class="clsSyntaxCells clsEvenRow">Disabled</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>gyroscope:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Enabled, Disabled</td><td class="clsSyntaxCells clsOddRow">This enables/disables the gyroscope sensor data retrieval.</td><td class="clsSyntaxCells clsOddRow">Disabled</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>ambientlight:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Enabled, Disabled</td><td class="clsSyntaxCells clsEvenRow">This enables/disables the ambientlight sensor data retrieval.</td><td class="clsSyntaxCells clsEvenRow">Disabled</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>proximity:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Enabled, Disabled</td><td class="clsSyntaxCells clsOddRow">This enables/disables the proximity sensor data retrieval.</td><td class="clsSyntaxCells clsOddRow">Disabled</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>proximitylongrange:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Enabled, Disabled</td><td class="clsSyntaxCells clsEvenRow">This enables/disables the proximitylongrange sensor data retrieval.</td><td class="clsSyntaxCells clsEvenRow">Disabled</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>pressure:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Enabled, Disabled</td><td class="clsSyntaxCells clsOddRow">This enables/disables the pressure sensor data retrieval.</td><td class="clsSyntaxCells clsOddRow">Disabled</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>temperature:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Enabled, Disabled</td><td class="clsSyntaxCells clsEvenRow">This enables/disables the temperature sensor data retrieval.</td><td class="clsSyntaxCells clsEvenRow">Disabled</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>humidity:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Enabled, Disabled</td><td class="clsSyntaxCells clsOddRow">This enables/disables the humidity sensor data retrieval.</td><td class="clsSyntaxCells clsOddRow">Disabled</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>gravity:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Enabled, Disabled</td><td class="clsSyntaxCells clsEvenRow">This enables/disables the gravity sensor data retrieval.</td><td class="clsSyntaxCells clsEvenRow">Disabled</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>linearAcceleration:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Enabled, Disabled</td><td class="clsSyntaxCells clsOddRow">This enables/disables the linear acceleration sensor data retrieval.</td><td class="clsSyntaxCells clsOddRow">Disabled</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>rotation:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Enabled, Disabled</td><td class="clsSyntaxCells clsEvenRow">This enables/disables the rotation sensor data retrieval.</td><td class="clsSyntaxCells clsEvenRow">Disabled</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>orientation:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Enabled, Disabled</td><td class="clsSyntaxCells clsOddRow">This enables/disables the orientation sensor data retrieval.</td><td class="clsSyntaxCells clsOddRow">Disabled</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>all:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Enabled, Disabled</td><td class="clsSyntaxCells clsEvenRow">This enables/disables all the available sensors data retrieval.</td><td class="clsSyntaxCells clsEvenRow">Disabled</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>minimumInterval:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Value in milli seconds</td><td class="clsSyntaxCells clsOddRow">The minimum amount of time gap between two sensor update events, specified in milliseconds. The interval cannot be set to less than 200 milliseconds, if a value of less than 200 milli seconds is specified, the interval will be defaulted to 200 milli seconds.</td><td class="clsSyntaxCells clsOddRow">1000 milliseconds</td></tr></table>
<table class="re-table"><col width="78%" /><col width="8%" /><col width="1%" /><col width="5%" /><col width="1%" /><col width="5%" /><col width="2%" /></table>	

##Events


Values are returned to the caller in RhoElements via Events.  Most modules contain events and those returned from this module are given below along with the event parameters.  Events can cause a navigation to a new URL or a JavaScript function on the page to be invoked.  Each event will in most cases have a number of parameters associated with it which will either be strings or JavaScript arrays.  Event parameters can be accessed either directly or via JSON objects.

<br />
###sensorEvent
The sensorEvent event is triggered when a parameter of the specfiied sensors is changed.
<table class="re-table"><col width="3%" /><col width="20%" /><col width="77%" /><tr><th class="tableHeading">ID</th><th class="tableHeading">Name</th><th class="tableHeading">Description</th></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">1</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>accelerometerX</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">X co-ordinate value of the Accelerometer sensor in SI units (m/s^2)</td></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">2</td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>accelerometerY</b></td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">Y co-ordinate value of the Accelerometer sensor in SI units (m/s^2)</td></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">3</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>accelerometerZ</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">Z co-ordinate value of the Accelerometer sensor in SI units (m/s^2)</td></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">4</td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>deviceOrientation</b></td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">value of the orientation sensor</td></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">5</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>tiltangleX</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">X co-ordinate value of the tiltangle sensor in degrees units</td></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">6</td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>tiltangleY</b></td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">Y co-ordinate value of the tiltangle sensor in degrees units</td></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">7</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>tiltangleZ</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">Z co-ordinate value of the tiltangle sensor in degrees units</td></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">8</td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>motion</b></td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">value of the motion sensor</td></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">9</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>ecompass</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">value of the ecompass sensor</td></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">10</td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>magnetometerX</b></td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">X value of the magnetometer sensor in micro-Tesla (uT) units</td></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">11</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>magnetometerY</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">Y value of the magnetometer sensor in micro-Tesla (uT) units</td></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">12</td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>magnetometerZ</b></td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">Z value of the magnetometer sensor in micro-Tesla (uT) units</td></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">13</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>gyroscopeX</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">X co-ordinate value of the gyroscope sensor in radians/second units</td></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">14</td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>gyroscopeY</b></td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">Y co-ordinate value of the gyroscope sensor in radians/second units</td></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">15</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>gyroscopeZ</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">Z co-ordinate value of the gyroscope sensor in radians/second units</td></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">16</td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>ambientLight</b></td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">value of the ambient Light sensor in SI lux units</td></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">17</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>proximity</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">value of the proximity sensor in centimeters units</td></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">18</td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>proximitylongrange</b></td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">value of the proximitylongrange sensor</td></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">19</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>pressure</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">value of the pressure sensor in hPa (millibar) units</td></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">20</td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>temperature</b></td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">value of the temperature sensor in degree Celsius units</td></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">21</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>humidity</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">value of the humidity sensor in percent units</td></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">22</td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>gravityX</b></td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">X co-ordinate value of the gravity sensor in SI units (m/s^2)</td></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">23</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>gravityY</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">Y co-ordinate value of the gravity sensor in SI units (m/s^2)</td></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">24</td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>gravityZ</b></td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">Z co-ordinate value of the gravity sensor in SI units (m/s^2)</td></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">25</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>linearAccelerationX</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">X co-ordinate value of the linear acceleration sensor in SI units (m/s^2)</td></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">26</td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>linearAccelerationY</b></td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">Y co-ordinate value of the linear acceleration sensor in SI units (m/s^2)</td></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">27</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>linearAccelerationZ</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">Z co-ordinate value of the linear acceleration sensor in SI units (m/s^2)</td></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">28</td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>rotationX</b></td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">X co-ordinate value of the rotation sensor as a combination of an angle and an axis</td></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">29</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>rotationY</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">Y co-ordinate value of the rotation sensor as a combination of an angle and an axis</td></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">30</td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>rotationZ</b></td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">Z co-ordinate value of the rotation sensor as a combination of an angle and an axis</td></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">31</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>orientationX</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">X co-ordinate value of the orientation sensor in degrees units</td></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">32</td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>orientationY</b></td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">Y co-ordinate value of the orientation sensor in degrees units</td></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">33</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>orientationZ</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">Z co-ordinate value of the orientation sensor in degrees units</td></tr></table>





##Remarks


###sensor data format
Since the json object returned by the event contains the data for all of the sensors if a sensor is not enabled or absent then that data is undefined (null) and should not be used.


###minimum interval
As some of the sensor values change rapidly the minimum interval between two updates should be specified as a reasonable value, otherwise there can be a performance impact.


###Cross platform consistency
As this plugin returns the raw sensor values reported by the operating system the values might differ between platforms. Which sensors are supported on which platform are dependant on the hardware available on the device.


###JavaScript and Meta-Tag Support
On iOS devices and non Zebra Technologies Windows Mobile/CE devices, only the Ruby interface is currently available. On all Android and Zebra Technologies devices all language interfaces are supported.




##Requirements

<table class="re-table"><tr><th class="tableHeading">RhoElements Version</th><td class="clsSyntaxCell clsEvenRow">2.1 or above
</td></tr><tr><th class="tableHeading">Supported Devices</th><td class="clsSyntaxCell clsOddRow">All supported devices. On Windows this is only supported in MPA3.0 devices.</td></tr><tr><th class="tableHeading">Minimum Requirements</th><td class="clsSyntaxCell clsOddRow">None.</td></tr><tr><th class="tableHeading">Persistence</th><td class="clsSyntaxCell clsEvenRow">Non Persistent - Changes to this module will not persist when navigating to a new page.</td></tr></table>


##HTML/JavaScript Examples

The following example enables all the sensors and waits for the updates through the sensor event

	<META HTTP-EQUIV="RawSensors" CONTENT="sensorEvent:url('JavaScript:onSensor(%json);');all:enabled; ">
	
	<SCRIPT>
	    function onSensor(jsonObject)
	    {
	        var theOutput = "<BR><BR><B>Accelerometer  </B>";        
	        theOutput = theOutput + "X: " + jsonObject.accelerometerX + ", Y: " + jsonObject.accelerometerY + ", Z: " + jsonObject.accelerometerZ + "<BR>";
	        theOutput = theOutput + "<B>Orientation  </B>";        
	        theOutput = theOutput + "X: " + jsonObject.deviceOrientation  + "<BR>";
	        theOutput = theOutput + "<B>Tilt  </B>";
	        theOutput = theOutput + "X: " + jsonObject.tiltangleX  + ", Y: " + jsonObject.tiltangleY  + ", Z: " + jsonObject.tiltangleZ  + "<BR>";
	        theOutput = theOutput + "<B>Motion  </B>";
	        theOutput = theOutput + "X: " + jsonObject.motion  + "<BR>";
	        theOutput = theOutput + "<B>Ecompass  </B>";
	        theOutput = theOutput + "X: " + jsonObject.ecompass  + "<BR>";
	        theOutput = theOutput + "<B>Magnetometer  </B>";
	        theOutput = theOutput + "X: " + jsonObject.magnetometerX  + ", Y: " + jsonObject.magnetometerY  + ", Z: " + jsonObject.magnetometerZ  + "<BR>";
	        theOutput = theOutput + "<B>Gyroscope  </B>";
	        theOutput = theOutput + "X: " + jsonObject.gyroscopeX  + ", Y: " + jsonObject.gyroscopeY  + ", Z: " + jsonObject.gyroscopeZ  + "<BR>";
	        theOutput = theOutput + "<B>AmbientLight  </B>";
	        theOutput = theOutput + "X: " + jsonObject.ambientLight  + "<BR>";
	        theOutput = theOutput + "<B>Proximity  </B>";
	        theOutput = theOutput + "X: " + jsonObject.proximity  + "<BR>";
	        theOutput = theOutput + "<B>Proximitylongrange  </B>";
	        theOutput = theOutput + "X: " + jsonObject.proximitylongrange  + "<BR>";
	        theOutput = theOutput + "<B>Pressure  </B>";
	        theOutput = theOutput + "X: " + jsonObject.pressure  + "<BR>";
	        theOutput = theOutput + "<B>Temperature  </B>";
	        theOutput = theOutput + "X: " + jsonObject.temperature  + "<BR>";
	        theOutput = theOutput + "<B>Humidity  </B>";
	        theOutput = theOutput + "X: " + jsonObject.humidity  + "<BR>";
	        theOutput = theOutput + "<B>Gravity  </B>";
	        theOutput = theOutput + "X: " + jsonObject.gravityX  + ", Y: " + jsonObject.gravityY  + ", Z: " + jsonObject.gravityZ  + "<BR>";
	        theOutput = theOutput + "<B>Linear Acceleration  </B>";
	        theOutput = theOutput + "X: " + jsonObject.linearAccelerationX  + ", Y: " + jsonObject.linearAccelerationY  + ", Z: " + jsonObject.linearAccelerationZ  + "<BR>";
	        theOutput = theOutput + "<B>Rotation  </B>";
	        theOutput = theOutput + "X: " + jsonObject.rotationX  + ", Y: " + jsonObject.rotationY  + ", Z: " + jsonObject.rotationZ  + "<BR>";
	        theOutput = theOutput + "<B>Orientation  </B>";
	        theOutput = theOutput + "X: " + jsonObject.orientationX  + ", Y: " + jsonObject.orientationY  + ", Z: " + jsonObject.orientationZ  + "<BR>";
	        outputDiv.innerHTML = theOutput;
	    }
	</SCRIPT>
	<div id="outputDiv">Sensor Output Goes Here</div>
	<P>
	  <INPUT align="center" type="button" value="Retrieve Sensor Data" onclick="RawSensors.getSensorData();"><br>
	


