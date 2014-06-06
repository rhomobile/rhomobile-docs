 <!-- Launchpad Link id: tutdatacaptureprofile
    usage <a data-link="id">blah blah</a>
    replace id
-->
<div class="tableofcontents"> </div>
## Developing an EMDK for Android Application Part 4

This guide will walk you through adding broadcast intent support to the Android application you made using  <a data-link="tutdatacaptureprofilept3">"Developing an EMDK for Android Application Part 3"</a>.

###Prerequisites###

* Java Development Kit (JDK)
* Android Developer Tools (ADT)
* Motorola EMDK for Android 
* Completion of <a data-link="tutdatacaptureprofile">"Developing an EMDK for Android Application Part 1"</a>
* Completion of <a data-link="tutdatacaptureprofilePt2">"Developing an EMDK for Android Application Part 2"</a>
* Completion of <a data-link="tutdatacaptureprofilePt3">"Developing an EMDK for Android Application Part 3"</a>
 
For more information about setting up the EMDK please see the EMDK <a data-link="setup">Setup</a>.

##Using EMDK Wizard and EMDK for Android Broadcast Intents.##

###Adding Broadcast Intent Activity###
First we will add a new activity that will be used for listening and displaying Barcode data to the user. 

1. Select "EMDKSample" from "Package Explorer" in Eclipse.  
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image122.jpg)  
2. Right Click and select "New" -> "Other".  
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image123.jpg)  
3. Select "Android" -> "Android Activity" and click "Next".  
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image124.jpg)  
4. Select "Empty Activity" and click "Next".  
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image125.jpg)  
5. Change "Activity name" to "BroadcastIntentActivity" and click "Finish".  
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image169.jpg)  

###Updating Main Activity###
Next we will update "MainActivity", adding a button to launch our "BroadcastIntentActivity".

1. Select "activity_main.xml" from "Package Explorer" in Eclipse.  
	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image170.jpg)  
2. Add the following Button to "activity_main.xml". This Button will be used for opening "BroadcastIntentActivity".  
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="xml" 
    _jivemacro_uid="_1398870592774641">
 	<p>&lt;Button<p>	
    <p>	android:id="@+id/buttonBroadcastIntent"</p>
    <p>	android:layout_width="wrap_content"</p>
    <p>	android:layout_height="wrap_content"</p>
    <p>	android:layout_alignParentBottom="true"</p>
    <p>	android:layout_marginBottom="50dp"</p>
    <p>	android:layout_marginLeft="120dp"</p>
    <p>	android:text="Broadcast Intent" " /&gt;</p>
	</pre>

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image171.jpg)  
3. Select "MainActivity.java" from "Package Explorer" in Eclipse. 

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image172.jpg) 
4. Declare a variable inside "MainActivity" to store "buttonBroadcastIntent". 
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
	<p>//Declare a variable to store the buttonBroadcastIntent</p>
    <p>private Button buttonBroadcastIntent = null;</p>
    </pre>

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image173.jpg)  
5. Inside "onCreate" get a reference to "buttonBroadcastIntent".
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
	<p>//Get the buttonBroadcastIntent</p>
    <p>buttonBroadcastIntent = (Button) findViewById(R.id.buttonBroadcastIntent);</p>
    </pre>

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image174.jpg)  
6. Inside "onCreate" add an "OnClickListener" for "buttonMSR".  
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
	<p>//Add an OnClickListener for buttonBroadcastIntent</p>
    <p>buttonBroadcastIntent.setOnClickListener(buttonBroadcastIntentOnClick);</p>
    </pre>

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image175.jpg)  
7. Add a new "OnClickListener" inside "MainActivity".  
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
	<p>//OnClickListener for buttonBroadcastIntent</p>
    <p>private OnClickListener buttonBroadcastIntentOnClick = new OnClickListener() {</p>
    <p>	public void onClick(View v) {</p>
    <p></p>
    <p>	}</p>
    <p>};</p>
    </pre>

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image176.jpg)  
8. Add the following code to "onClick" to launch "BroadcastIntentActivity". 
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
	<p>//Launch BroadcastIntentActivity</p>
    <p>Intent myIntent = new Intent(MainActivity.this, BroadcastIntentActivity.class);</p>
    <p>startActivity(myIntent);</p>
    </pre>

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image177.jpg) 

###Creating Broadcast Intent UI###
Then we will create the UI for displaying Barcode data to the user. 

1. Select "activity_msr.xml" from "Package Explorer" in Eclipse.  

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image178.jpg) 
2. Remove the default "TextView". 
3. Add the following TextView. 
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="xml" 
    _jivemacro_uid="_1398870592774641">
 	<p>&lt;TextView</p>
    <p>	android:id="@+id/textViewData"
    <p>	android:layout_width="wrap_content"
    <p>	android:layout_height="wrap_content"
    <p>	android:layout_alignParentTop="true"
    <p>	android:layout_centerHorizontal="true"
    <p>	android:layout_marginTop="50dp"
    <p>	android:text="Please Scan a Barcode."
    <p>	android:textAppearance="?android:attr/textAppearanceMedium" /&gt;</p>
	</pre>

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image179.jpg) 

###Creating our Broadcast Intent Profile###
Next will will create a Data Capture profile that will be active on "BroadcastIntentActivity" and send Barcode data using a Broadcast Intent. 

1. Select "EMDKSample" project from Package Explorer.    
2. Click "EMDK" menu and select "Profile Manager".  
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image043.jpg)  
3. The EMDK Profile Manager Window will appear.  
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image180.jpg)  
4. click "Create".  
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image181.jpg)  
5. Enter the Profile Name "DataCaptureProfileBroadcastIntent" and click "Create".  
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image182.jpg)  
6. select "ActivitySelection" from the list of "Available Features" and add it to "Selected Features" using the arrow.  
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image142.jpg)  
7. Select "Activity Selection".  
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image143.jpg)  
8. Enter "com.symbol.emdksample" as the application name and click apply.  
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image144.jpg)  
9. Enter "BroadcastIntentActivity" as the activity name and click apply.  
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image183.jpg)  	
10. Click Okay.  
11. select "Barcode" from the list of "Available Features" and add it to "Selected Features" using the arrow. 
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image184.jpg)  	
12. Change "Barcode Scanner Input Enable" to "Enable".  
	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image185.jpg)  
13. select "Intent" from the list of "Available Features" and add it to "Selected Features" using the arrow. 
	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image186.jpg) 
14. Now we will configure the "Intent" settings.  
	* Switch "Intent Output Enable" to Enable". 
	* For "Intent Output Action" enter "com.symbol.emdksample.RECVRBI".
	* Switch "Intent Output Delivery" to "Broadcast Intent".  
	* Switch "Basic data formatting Enable" to Enable". 
	* Switch "Basic data formatting Send Data" to Enable". 	

	Your Intent configuration should now look like this:  
	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image187.jpg)  

15. Click "Apply" and "Finish".  
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image188.jpg)  
16. Click "Close".  
    >Note:  
    >Now the "EMDKConfig.xml" file under the "\assets" folder will be updated with your changes.

###Registering for the Broadcast Intent profile###
Now will register our new Data Capture profile in "MainActivity".

1. Select "MainActivity.java" from "Package Explorer" in Eclipse. 

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image189.jpg) 
2. Inside "MainActivity" add the following code to hold the name of our Broadcast Intent profile.  
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
	<p>//Assign the profile name used in EMDKConfig.xml  for Broadcast Intent handling</p>
    <p>private String profileNameBroadcastIntent = "DataCaptureProfileBroadcastIntent";</p>
    </pre>
	
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image190.jpg)  
3. Inside "onOpened" add the following code to register the Broadcast Intent EMDK profile. 
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
	//Call processPrfoile for profile Broadcast Intent.
	<p>results = mProfileManager.processProfile(profileNameBroadcastIntent, ProfileManager.PROFILE_FLAG.SET, modifyData);</p>
	<p></p>
	<p>if(results.statusCode == STATUS_CODE.FAILURE)</p>
	<p>{</p>
	<p>	//Failed to set profile</p>
	<p>}</p>
	</pre>

    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image191.jpg)  

###Handling Broadcast Intents###
Newt we will add the code to listen for our Broadcast Intent and display the Barcode data to the user in side "BroadcastIntentActivity". 

1. Select "BroadcastIntentActivity.java" from "Package Explorer" in Eclipse. 

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image192.jpg)  
2. Add the following imports.  
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
	import android.content.BroadcastReceiver;</p>
	<p>import android.content.Context;</p>
	<p>import android.content.Intent;</p>
	<p>import android.content.IntentFilter;</p>
	<p>import android.widget.TextView;</p>
    </pre>

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image193.jpg)  
3. Add a global variable for the TextView. 
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
    <p>//Declare a variable to store the textViewData</p>
    <p>private TextView textViewData = null;</p>
    </pre>
	
	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image194.jpg)
4. Add the following code to your onCreate function to get a handle on the TextView.
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
    <p>//Get the textViewData</p>
	<p>textViewData = (TextView) findViewById(R.id.textViewData);</p>
    </pre>

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image195.jpg)  
5. Add a global variable to BroadcastIntentActivity to hold our Broadcast Receiver.
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
	<p>//Declare a variable to store our Broadcast Receiver.</p>
	<p>private BroadcastReceiver EMDKReceiver;</p>
    </pre>
     
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image196.jpg)  
6. Override "onResume".  
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
	<p>@Override
    <p>protected void onResume() {</p>
	<p>	// TODO Auto-generated method stub</p>
    <p>	super.onResume();</p>
	<p>}</p>
    </pre>

    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image197.jpg)  
7. Override "onPause".  
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
	<p>@Override
    <p>protected void onPause() {</p>
    <p>	// TODO Auto-generated method stub</p>
    <p>	super.onPause();</p>
	<p>}</p>
    </pre>

    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image198.jpg)   
8. Add the following code to "onResume" to create an Intent filter.  
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
	<p>//Create an Intent Filter</p>
    <p>IntentFilter intentFilter = new IntentFilter("com.symbol.emdksample.RECVRBI");</p>
    </pre>

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image199.jpg) 
9. Add the following code to "onResume" to create a Broadcast Receiver.  
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
	<p>//Create a our Broadcast Receiver.</p>
    <p>EMDKReceiver = new BroadcastReceiver() {</p>
	<p></p>
    <p>};</p>
    </pre>

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image200.jpg)   
10. Override "onReceive" inside the Broadcast Receiver.  
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
	<p>@Override</p>
    <p>public void onReceive(Context context, Intent intent) {</p>
    <p></p>
    <p>}</p>
    </pre>

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image201.jpg)  
11. Add the following code to "onReceive" to check if the data is coming from the Barcode scanner.  
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
	<p>//Get the source of the data</p>
    <p>String source = intent.getStringExtra("com.motorolasolutions.emdk.datawedge.source");</p>
    <p></p>
    <p>//Check if the data has come from the barcode scanner</p>
    <p>if(source.equalsIgnoreCase("scanner")){</p>
    <p></p>
    <p>}</p>
    </pre>

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image202.jpg)  
12. Add the following code to get the data from the intent.  
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
	<p>//Get the data from the intent</p>
    <p>String data = intent.getStringExtra("com.motorolasolutions.emdk.datawedge.data_string");</p>
    <p></p>
    <p>//Check that we have received data</p>
    <p>if(data != null && data.length() > 0){</p>
    <p></p>
    <p>}</p>
	</pre>

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image203.jpg)  
13. Add the following code to display the data to the TextView.  
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
	<p>//Display the data to the text view</p>
    <p>textViewData.setText("Data = " + data);</p>
	</pre>

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image204.jpg)  
14. Add the following code to "onResume" to register our receiver.  
 	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
	<p>//Register our receiver.</p>
    <p>this.registerReceiver(EMDKReceiver, intentFilter);</p>
	</pre>

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image205.jpg)  
15. Add the following code to "onPause" to unregister our receiver.  
 	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
	<p>//Register our receiver.</p>
    <p>this.registerReceiver(EMDKReceiver, intentFilter);</p>
	</pre>

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image206.jpg)  
###Running the Application###
Lastly we will run and test our application. 

1. Connect Motorola Solutions Android device (having the latest EMDK runtime) to the USB port.

    >Note:   
    >Make sure the device is in USB debug.

2. Run the application.  

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image207.png)  
3. Press the trigger button and scan a Barcode.  

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image208.png)  
4. Like before the scanned data will be populated in the Edit Text field Through the previous Keystroke Intent and will appear on the TextView using the previous Datawedge Intent.   
5. Press the button "Broadcast Intent".  

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image209.png)  
6. Scan a Barcode.  

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image210.png)  
8. The TextView will be populated by the Broadcast Intent.
7. Press the back button to rerun to the main screen.  

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image208.png)  
9. Press the button "MSR", like before the MSR screen will come up.  

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image171.png)
10. Swipe a cad through the MSR.  

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image172.png)
11. Press return to go back to the MSR where you can swipe another card, or hit return again to go back to the main screen. 

## Download the Source
The project source to this tutorial can be found attached to the end of this document.