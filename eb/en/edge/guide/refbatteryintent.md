<!-- Launchpad Link id: refbatteryintent
	usage <a data-link="id">blah blah</a>
	replace id
-->
<div class="tableofcontents"> </div>
## Overview
The purpose of this document is to describe the functionality of the Battery Intent API Interface. Its intended audience are Android developers. 
 
## Requirements
Knowledge of Android programming and familiarity with the Android intent mechanism are assumed. 
 
* Android Versions:	
	* 2.3.4 and later.
* Devices:	
	* Motorola Solutions Android devices, such as the ET1 rev D, MC40 rev A.
 
 
## Features
On Motorola Solutions Android devices like the MC40, extra battery information can be retrieved using the standard [Android Battery Intent](http://developer.android.com/training/monitoring-device-state/battery-monitoring.html). Setting up to receive this information is the same as with consumer Android devices. However, the data that is returned to your application includes some extra information like:

* Backup Battery Voltage
* Battery Manufacture Date
* Battery Serial Number
* Part Number for Battery
* Unique ID for Battery
* Rated Capacity of the Battery
* Charge Cycle count of the Battery
 
## Programming Interface
 
#### FUNCTION PROTOTYPE
<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641"><code>
<p>mIntent_Receiver = new Intent_Receiver();</p>
<p>mIntentFilter = new IntentFilter();</p>
<p>mIntentFilter.addAction(Intent.ACTION_BATTERY_CHANGED);</p>
<p>registerReceiver(mIntent_Receiver,mIntentFilter); </p>
</code></pre>

#### PARAMETERS

Please reference the Android Batter Manager [API](http://developer.android.com/reference/android/os/BatteryManager.html). 

#### RETURN VALUES

In addition to the battery information Android returns by default, which can be found [here](http://developer.android.com/reference/android/os/BatteryManager.html), Motorola Solutions Android devices return the following additional parameters: 

* **bkvoltage** - Backup Battery Voltage
* **mfd**  - Battery Manufacture Date
* **serialnumber** - Battery Serial Number
* **partnumber** - Part Number for Battery
* **uniqueid** - Unique ID for Battery
* **ratedcapacity** - Rated Capacity of the Battery
* **cycle** - Charge Cycle count of the Battery

#### EXAMPLE
<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641"><code>
<p>public void onReceive(Context context, Intent intent) {
	 <p>if (BATTERY_STATE_CHANGED_INTENT.equals(intent.getAction())) {
		<p>int bkvoltage = intent.getExtras().getInt("bkvoltage");</p>
		<p>String mfd = intent.getExtras().getString("mfd");</p>
		<p>String serialnumber = intent.getExtras().getString("serialnumber");</p>
		<p>String partnumber = intent.getExtras().getString("partnumber");</p>
		<p>String uniqueid = intent.getExtras().getString("uniqueid");</p>
		<p>int ratedcapacity = intent.getExtras().getInt("ratedcapacity");</p>
		<p>int cycle = intent.getExtras().getInt("cycle");</p>
	<p>}</p>
<p>}</p>
</code></pre>
