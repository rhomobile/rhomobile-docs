<!-- Launchpad Link id: refdatacaptureintent
	usage <a data-link="id">blah blah</a>
	replace id
-->
<div class="tableofcontents"> </div>
## Overview
The purpose of this document is to describe the functionality of the Data Capture API. Its intended audience are Android developers. The Data Capture API is an application programming interface which provides a number of specific commands that another application can use to control certain aspects of data capture on Motorola Solutions Android devices.
 
## Requirements
Knowledge of Android programming and familiarity with the Android intent mechanism are assumed. Also assumed is some familiarity with DataWedge and that you have read the DataWedge section in the Integrator Guide for your device.
 
* Android Versions:	
	* 2.3.4 and later
* Devices:	
	* ET1 rev D, MC40 rev A, TC55, etc.
 
 
## Features
The following is a list of the high-level API functions…

* Start/stop/toggle the soft scan trigger.
* Disable/enable the scanner plug-in in the currently active profile.
* Provide a list of available scanners.
* Make an un-associated user created profile the default profile.
* Reset the default profile back to Profile0.
* Switch the current profile to a user created profile that is un-associated.
 
## DataWedge Profiles
The DataCapture APIs use the DataWedge profiles for collecting and formatting data.  For example, each user application can have a profile which outputs scanned data in the required format when that application comes to the foreground. DataWedge can be configured to process the same set of captured data differently based on the requirements of each application.  Refer to the DataWedge section in your devices Integrator Guide for more information on DataWedge profiles.
 
## Programming Interface
An application will access the Data Capture API by broadcasting an intent. It will use the primary pieces of information in a intent, action and data, to specify the API function to perform.
 
### SoftScanTrigger
#### DESCRIPTION
The SoftScanTrigger API command can be used to start, stop or toggle the soft scan trigger.
 
 
#### FUNCTION PROTOTYPE
<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641"> 
<p>Intent i = new Intent();</p>
<p>i.setAction(ACTION);</p>
<p>i.putExtra(EXTRA_DATA, "&lt;parameter&gt;");</p>
</pre>

#### PARAMETERS

* ACTION: String "com.motorolasolutions.emdk.datawedge.api.ACTION_SOFTSCANTRIGGER"
* EXTRA_DATA: String "com.motorolasolutions.emdk.datawedge.api.EXTRA_PARAMETER"
* <parameter>:	The parameter as a string, either of the following…
	* "START_SCANNING" - to start scanning
	* "STOP_SCANNING" - to stop scanning
	* "TOGGLE_SCANNING" - to toggle between start scanning and stop scanning

#### RETURN VALUES

* None.
* Error and debug messages will be logged to the Android logging system which then can be viewed and filtered by the logcat command. You can use logcat from an ADB shell to view the log messages, e.g.
* $ adb logcat -s DWAPI
* Error messages will be logged for invalid actions and parameters

#### EXAMPLE
<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641"> 
<p>// define action and data strings</p>
<p>String softScanTrigger = "com.motorolasolutions.emdk.datawedge.api.ACTION_SOFTSCANTRIGGER";</p>
<p>String extraData = "com.motorolasolutions.emdk.datawedge.api.EXTRA_PARAMETER";</p>
<p> </p>
<p>// create the intent</p>
<p>Intent I = new Intent();</p>
<p>// set the action to perform</p>
<p>i.setAction(softScanTrigger);</p>
<p>// add additional info</p>
<p>i.putExtra(extraData, "START_SCANNING");</p>
<p>// send the intent to DataWedgecontext.this.sendBroadcast(i); </p>
</pre>

#### COMMENTS
The received API commands are not queued; API commands are processed immediately. Commands received while the current API command is still being processed may be ignored. For example, attempting to send the soft scan trigger start command immediately after sending the scanner enable command will result in the soft scan trigger command being ignored because the scanner enable will not have had time to complete. In this case, the soft scan trigger command should be delayed sufficiently for the scanner enable to complete; one example of how this could be done is given below.

<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641"> 
<p>int triggerDelay = 250; // delay in milliseconds</p>
<p></p>
<p>Handler handler = new Handler();</p>
<p>handler.postDelayed(new Runnable() {        </p>
<p>      public void run() </p>
<p>      {                </p>
<p>          // for clarity, assume the following method contains the code in the example above                </p>
<p>          startSoftScan();        </p>
<p>      }</p>
<p>}, triggerDelay); </p>
</pre>

### ScannerInputPlugin
#### DESCRIPTION
The ScannerInputPlugin API command can be used to enable/disable the scanner plug-in in the currently active profile. Disabling the scanner plug-in effectively disables scanning in that profile (associated or un-associated).
 
#### FUNCTION PROTOTYPE
<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641"> 
<p>Intent i = new Intent();</p>
<p>i.setAction(ACTION);</p>
<p>i.putExtra(EXTRA_DATA, "&lt;parameter&gt;");</p>
</pre>

#### PARAMETERS

* ACTION: String "com.motorolasolutions.emdk.datawedge.api.ACTION_SCANNERINPUTPLUGIN"
* EXTRA_DATA: String "com.motorolasolutions.emdk.datawedge.api.EXTRA_PARAMETER"
* <parameter>:	The parameter as a string, either of the following…
	* "ENABLE_PLUGIN" - enables the plug-in
	* "DISABLE_PLUGIN" - disables the plug-in

#### RETURN VALUES

* None.
* Error and debug messages will be logged to the Android logging system which then can be viewed and filtered by the logcat command. You can use logcat from an ADB shell to view the log messages, e.g.
	* $ adb logcat -s DWAPI
* Error messages will be logged for invalid actions and parameters

#### EXAMPLE
<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641"> 
<p>// define action and data strings </p>
<p>String scannerInputPlugin = "com.motorolasolutions.emdk.datawedge.api.ACTION_SCANNERINPUTPLUGIN";</p>
<p>String extraData = "com.motorolasolutions.emdk.datawedge.api.EXTRA_PARAMETER";</p>
<p> </p>
<p>public void onResume() {        </p>
<p>    // create the intent        </p>
<p>    Intent I = new Intent();        </p>
<p>    // set the action to perform        </p>
<p>    i.setAction(scannerInputPlugin);        </p>
<p>    // add additional info        </p>
<p>    i.putExtra(extraData, "DISABLE_PLUGIN");        </p>
<p>    // send the intent to DataWedge        </p>
<p>    context.this.sendBroadcast(i);</p>
<p>}</p>
</pre>

#### COMMENTS
This Data Capture API intent will allow you to enable/disable the scanner plug-in for the current profile. For example, let’s say that activity A launches and uses the Data Capture API intent to switch to profileA in which the scanner plug-in is enabled, then at some point it uses the Data Capture API to disable the scanner plug-in. Activity B is launched. In DataWedge, profileB is associated with activity B. DataWedge switches to profileB. When activity A comes back to the foreground, in the onResume method, activity A will need to use the Data Capture API intent to switch back to profileA, then use the Data Capture API intent again to disable the scanner plug-in, to return back to the state it was in.

>Note
>The above assumes that profileA is not associated to any applications/activities, therefore when focus switches back to activity A, DataWedge will not automatically switch to profileA therefore activity A must switch back to profileA in its onResume method.
>Because DataWedge will automatically switch profile when your activity is paused, it is recommended that this API function be called from the onResume method of your activity.

### enumerateScanners
#### DESCRIPTION
The enumerateScanners API command can be used to get a list of scanners available on the device.

#### FUNCTION PROTOTYPE
<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641"> 
<p>Intent i = new Intent();</p>
<p>i.setAction(ACTION);</p>
</pre>

#### PARAMETERS

* ACTION:	String "com.motorolasolutions.emdk.datawedge.api.ACTION_ENUMERATESCANNERS"

#### RETURN VALUES
* The enumerated list of scanners will be returned via a broadcast intent. The broadcast intent action is "com.motorolasolutions.emdk.datawedge.api.ACTION_ENUMERATEDSCANNERLIST" and the list of scanners is returned as a string array (see the example below).
* Error and debug messages will be logged to the Android logging system which then can be viewed and filtered by the logcat command. You can use logcat from an ADB shell to view the log messages, e.g.
	* $ adb logcat -s DWAPI
* Error messages will be logged for invalid actions and parameters

#### EXAMPLE
<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641"> 
<p> // first send the intent to enumerate the available scanners on the device</p>
<p> // define action string</p>
<p> String enumerateScanners = "com.motorolasolutions.emdk.datawedge.api.ACTION_ENUMERATESCANNERS";</p>
<p> // create the intent</p>
<p> Intent I = new Intent();</p>
<p> // set the action to perform</p>
<p> i.setAction(enumerateScanners);</p>
<p> // send the intent to DataWedge</p>
<p> context.this.sendBroadcast(i);// now we need to be able to receive the enumerate list of available scanners</p>
<p> String enumeratedList = "com.motorolasolutions.emdk.datawedge.api.ACTION_ENUMERATEDSCANNERLIST";</p>
<p> String KEY_ENUMERATEDSCANNERLIST = "DataWedgeAPI_KEY_ENUMERATEDSCANNERLIST";</p>
<p> // Create a filter for the broadcast intentIntentFilter filter = new IntentFilter();</p>
<p> filter.addAction(enumeratedList);registerReceiver(myBroadcastReceiver, filter);// now we need a broadcast receiver</p>
<p> private BroadcastReceiver myBroadcastReceiver = new BroadcastReceiver() {        </p>
<p>      @Override        Public void onReceive(Context context, Intent intent) {                </p>
<p>          String action = intent.getAction();                </p>
<p>          if (action.equals(enumeratedList)) {                        </p>
<p>                Bundle b = intent.getExtras();                        </p>
<p>                String[] scanner_list = b.getStringArray(KEY_ENUMERATEDSCANNERLIST);                </p>
<p>          }        </p>
<p>      }</p>
<p> };</p>
</pre>

#### COMMENTS
The scanner and its parameters are set based on the currently active profile.

### setDefaultProfile
#### DESCRIPTION
The setDefaultProfile API function can be used to set the specified profile as the default profile.

#### DEFAULT PROFILE RECAP
Profile0 is the generic profile used when there are no user created profiles associated with an application. Profile0 can be edited but cannot be associated with an application. That is, DataWedge allows manipulation of plug-in settings for Profile0 but it does not allow assignment of a foreground application.

This configuration allows DataWedge to send output data to any foreground application other than applications associated with user-defined profiles when Profile0 is enabled.

Profile0 can be disabled to allow DataWedge to only send output data to those applications which are associated in user-defined profiles. For example, create a profile associating a specific application, disable Profile0 and then scan. DataWedge only sends data to the application specified in the user-created profile. This adds additional security to DataWedge enabling the sending of data only to specified applications.

#### USAGE SCENARIO
Let’s say a launcher application has a list of apps that a user can launch and that none of the listed apps has an associated DataWedge profile. Once the user has selected an app, the launcher needs to set the appropriate DataWedge profile for the selected app. This could be done by using setDefaultProfile to set the default profile to the required profile. Then when the user selected app is launched, DataWedge auto profile switching will switch to the default profile (which is now the required profile for that app).

If, for some reason, the launched app has an associated DataWedge profile then that will override the set default profile.

When control is returned to the launcher application, resetDefaultProfile can be used to reset the default profile.

#### FUNCTION PROTOTYPE
<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641"> 
<p>Intent i = new Intent();</p>
<p>i.setAction(ACTION);</p>
<p>i.putExtra(EXTRA_DATA, "&lt;profile name&gt;");</p>
</pre>

#### PARAMETERS

* ACTION:	String "com.motorolasolutions.emdk.datawedge.api.ACTION_SETDEFAULTPROFILE"
* EXTRA_DATA:	String "com.motorolasolutions.emdk.datawedge.api.EXTRA_PROFILENAME"
* <profile name>:	The profile name to set as the default profile as a string (case-sensitive).

#### RETURN VALUES

* None.
* Error and debug messages will be logged to the Android logging system which then can be viewed and filtered by the logcat command. You can use logcat from an ADB shell to view the log messages, e.g.
	* $ adb logcat -s DWAPI
* Error messages will be logged for invalid actions, parameters and failures (e.g. profile not found or associated to an application).

#### EXAMPLE
<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641"> 
<p>// define action and data strings</p>
<p>String setDefaultProfile = "com.motorolasolutions.emdk.datawedge.api.ACTION_SETDEFAULTPROFILE";</p>
<p>String extraData = "com.motorolasolutions.emdk.datawedge.api.EXTRA_PROFILENAME";</p>
<p> </p>
<p>public void onResume() {        </p>
<p>    // create the intent        </p>
<p>    Intent I = new Intent();        </p>
<p>    // set the action to perform        </p>
<p>    i.setAction(setDefaultProfile);        </p>
<p>    // add additional info        </p>
<p>    i.putExtra(extraData, "myProfile");        </p>
<p>    // send the intent to DataWedge        </p>
<p>    context.this.sendBroadcast(i);</p>
<p>}</p>
</pre>

#### COMMENTS

* The API command will have no effect if the specified profile does not exist or if the specified profile is already associated to an application.
* Because DataWedge will automatically switch profile when your activity is paused, it is recommended that this API function be called from the onResume method of your activity.
* It is recommended this profile be created to cater to all applications/activities that would otherwise default to using Profile0. This will ensure that these applications/activities continue to work with a consistent configuration.

To explain by example, let’s say that initially Profile0 is the default profile using the camera as the barcode scanner. Using the Browser application and scanning a barcode with the camera, DataWedge enters the data into the Browser. Now you launch an application that changes the default profile to a profile using the blockbuster as the barcode scanner. When you go back to the Browser application, since it is using the default profile, scanning will now be via the blockbuster not the camera as previously. To ensure that the Browser continues to use the camera as the barcode scanner a profile should be created and associated to the Browser that specifies the camera as the barcode scanner.

### resetDefaultProfile
#### DESCRIPTION
The resetDefaultProfile API function can be used to reset the default profile back to Profile0.

#### FUNCTION PROTOTYPE
<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641"> 
<p>Intent i = new Intent();</p>
<p>i.setAction(ACTION);</p>
<p>i.putExtra(EXTRA_DATA, "&lt;profile name&gt;");</p>
</pre>

#### PARAMETERS

* ACTION:	String "com.motorolasolutions.emdk.datawedge.api.ACTION_RESETDEFAULTPROFILE"
* EXTRA_DATA:	String "com.motorolasolutions.emdk.datawedge.api.EXTRA_PROFILENAME"
* <profile name>:	The profile name to set as the default profile as a string (case-sensitive).

#### RETURN VALUES

* None.
* Error and debug messages will be logged to the Android logging system which then can be viewed and filtered by the logcat command. You can use logcat from an ADB shell to view the log messages, e.g.
	* $ adb logcat -s DWAPI
* Error messages will be logged for invalid actions, parameters and failures (e.g. profile not found or associated to an application).

#### EXAMPLE
<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641"> 
<p>// define action string</p>
<p>String resetDefaultProfile = "com.motorolasolutions.emdk.datawedge.api.ACTION_RESETDEFAULTPROFILE";</p>
<p> </p>
<p>public void onResume() {        </p>
<p>    // create the intent        </p>
<p>    Intent I = new Intent();        </p>
<p>    // set the action to perform        </p>
<p>    i.setAction(resetDefaultProfile);        </p>
<p>    context.this.sendBroadcast(i);</p>
<p>}</p>
</pre>

#### COMMENTS

* None.

### switchToProfile

#### DESCRIPTION
The switchToProfile API action can be used to switch to the specified profile.

#### PROFILES RECAP
DataWedge is based on profiles and plug-ins. A profile contains information on how DataWedge should behave with different applications.

Profile information consists of:

* Associated application
* Input plug-in configurations
* Output plug-in configurations
* Process plug-in configurations


DataWedge includes a default profile, Profile0, that is created automatically the first time DataWedge runs.Using profiles, each application can have a specific DataWedge configuration. For example, each user application can have a profile which outputs scanned data in the required format when that application comes to the foreground. DataWedge can be configured to process the same set of captured data differently based on the requirements of each application.

>Note
>A single profile may be associated with one or many activities/apps, however, given an acitivty, only one profile may be associated to it.

####USAGE SCENARIO
Let’s say an application has two activities. ActivityA only requires EAN13 barcodes to be scanned. ActivityB only requires MSR card data. ProfileB is configured to only scan EAN13 barcodes and is left unassociated. ProfileM is configured to only accept MSR input and is left unassociated. When ActivityA launches it uses switchToProfile to activate ProfileB. Similarily, when ActivityB launches it uses switchToProfile to activate ProfileM.

If another activity/app comes to the foreground, DataWedge auto profile switching will set the DataWedge profile accordingly either to the default profile or to an associated profile.

When ActivityA (or ActivityB) comes back to the foreground it will use switchToProfile to reset the profile back to ProfileB (or ProfileM).

#### FUNCTION PROTOTYPE
<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641"> 
<p>Intent i = new Intent();</p>
<p>i.setAction(ACTION);</p>
<p>i.putExtra(EXTRA_DATA, "&lt;profile name&gt;");</p>
</pre>

#### PARAMETERS

* ACTION:	String "com.motorolasolutions.emdk.datawedge.api.ACTION_SWITCHTOPROFILE"
* EXTRA_DATA:	String "com.motorolasolutions.emdk.datawedge.api.EXTRA_PROFILENAME"
* <profile name>:	The profile name to switch to as a string (case-sensitive).

#### RETURN VALUES

* None.
* Error and debug messages will be logged to the Android logging system which then can be viewed and filtered by the logcat command. You can use logcat from an ADB shell to view the log messages, e.g.
	* $ adb logcat -s DWAPI
* Error messages will be logged for invalid actions, parameters and failures (e.g. profile not found or associated to an application).

#### EXAMPLE
<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641"> 
<p>// define action and data strings</p>
<p>String switchToProfile = "com.motorolasolutions.emdk.datawedge.api.ACTION_SWITCHTOPROFILE";</p>
<p>String extraData = "com.motorolasolutions.emdk.datawedge.api.EXTRA_PROFILENAME";</p>
<p> </p>
<p>public void onResume() {        </p>
<p>    super.onResume();        </p>
<p>    // create the intent        </p>
<p>    Intent I = new Intent();        </p>
<p>    // set the action to perform        </p>
<p>    i.setAction(switchToProfile);        </p>
<p>    // add additional info        </p>
<p>    i.putExtra(extraData, "myProfile");        </p>
<p>    // send the intent to DataWedge        </p>
<p>    context.this.sendBroadcast(i);</p>
<p>}</p>
</pre>

#### COMMENTS
* This API function will have no effect if the specified profile does not exist or if the specified profile is associated to an application.
* DataWedge has a one-to-one relationship between profiles and activities, i.e. only one profile can be associated to any given activity. When a profile is initially created, it is not associated to any application. Until this profile is associated to an activity it will never be activated. In this way it is possible to create multiple profiles that are un-associated.
* This API function allows you to switch to one such unassociated profile.

For example, let’s say that ProfileA is one such un-associated profile and ProfileB is associated with activity B. Now, activity A is launched and uses this Data Capture API intent to switch to profileA. ProfileA will be active whilst activity A is in foreground. When another activity, say activity B, comes to the foreground DataWedge will automatically switch profile (to profileB which is associated to activity B for example). Then when activity A comes back to the foreground again, the app will need to use this Data Capture API intent to switch back to profileA. This would be done in the onResume method of activity A.
 
> Note: Because DataWedge will automatically switch profile when your activity is paused, it is recommended that this API function be called from the onResume method of your activity.

> Note: After switching to a profile, this un-associated profile does not get assigned to the application/activity and is available to be used in the future with a different app/activity.

> Note: DataWedge automatic profile switching

For backward compatibility, DataWedge’s automatic profile switching is not affected by the above API commands, and this also why the above API commands only work with unassociated profiles and apps.

DataWedge auto profile switching works as follows:

* Every second:
	1. Set newProfileId to the associated profile id of the current foreground activity
	2. If no associated profile found then set newProfileId to the associated profile id of the current foreground app
	3. If no associated profile found then set newProfileId to the current default profile (note: this may not be Profile0)
	4. Check the newProfileId against the currentProfileId
	5. If they are different then…
		* deactivate current profile
		* activate new profile (newProfileId)
		* set currentProfileId = newProfileId