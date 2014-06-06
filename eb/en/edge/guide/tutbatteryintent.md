<!-- Launchpad Link id: tutbatteryintent
	usage <a data-link="id">blah blah</a>
	replace id
-->
<div class="tableofcontents"> </div>
## Overview
On Motorola Solutions Android devices like the MC40, extra battery information can be retrieved using the standard [Android Battery Intent](http://developer.android.com/training/monitoring-device-state/battery-monitoring.html). Setting up to receive this information is the same as with consumer Android devices. However, the data that is returned to your application includes some extra information like:

* Backup Battery Voltage
* Battery Manufacture Date
* Battery Serial Number
* Part Number for Battery
* Unique ID for Battery
* Rated Capacity of the Battery
* Charge Cycle count of the Battery 

## Enabling the Receiver 
<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641"><code>
<p>mIntent_Receiver = new Intent_Receiver();</p>
<p>mIntentFilter = new IntentFilter();</p>
<p>mIntentFilter.addAction(Intent.ACTION_BATTERY_CHANGED);</p>
<p>registerReceiver(mIntent_Receiver,mIntentFilter); </p>
</code></pre>

## Processing The Data
In the below code we are getting the Motorola Solutions specific battery information provided by the <a data-link="refbatteryintent">Battery Intent</a> extras. Notice that some values are strings and other values are integers.

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

## Downloading the Sample
Download the source for this project in the <a data-link="samplebatteryintent">associated sample.</a>