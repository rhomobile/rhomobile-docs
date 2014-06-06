<!-- Launchpad Link id: tutdatacaptureprofile
    usage <a data-link="id">blah blah</a>
    replace id
-->
<div class="tableofcontents"> </div>
## Developing an EMDK for Android Application Part 3

This guide will walk you through adding MSR support and multiple profiles to the Android application you made using <a data-link="tutdatacaptureprofilept2">"Developing an EMDK for Android Application Part 2"</a>. This tutorial will add some more complexity by adding a second screen as well as adding a second Data Capture Profile.

###Prerequisites###

* Java Development Kit (JDK)
* Android Developer Tools (ADT)
* Motorola EMDK for Android 
* Completion of <a data-link="tutdatacaptureprofile">"Developing an EMDK for Android Application Part 1"</a>
* Completion of <a data-link="tutdatacaptureprofilePt2">"Developing an EMDK for Android Application Part 2"</a>
 
For more information about setting up the EMDK please see the EMDK <a data-link="setup">Setup</a>.

##Using EMDK Wizard and EMDK for Android MSR data capture.##

###Adding MSR Activity###
Let's start by defining a second activity for the application. This activity will be used to to activate a Data Capture profile that listens for MSR data.

1. Select "EMDKSample" from "Package Explorer" in Eclipse.  
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image122.jpg)  
2. Right Click and select "New" -> "Other".  
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image123.jpg)  
3. Select "Android" -> "Android Activity" and click "Next".  
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image124.jpg)  
4. Select "Empty Activity" and click "Next".  
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image125.jpg)  
5. Change "Activity name" to "MSRActivity" and click "Finish".  
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image126.jpg)  

###Adding MSR Completed Activity###
Next let's create a third activity that will listen for the MSR data and display the data to the user.

1. Select "EMDKSample" from "Package Explorer" in Eclipse.  
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image122.jpg)  
2. Right Click and select "New" -> "Other".  
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image123.jpg)  
3. Select "Android" -> "Android Activity" and click "Next".  
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image124.jpg)  
4. Select "Empty Activity" and click "Next".  
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image125.jpg)  
5. Change "Activity name" to "MSRCompletedActivity" and click "Finish".  
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image127.jpg)  

###Updating Main Activity###
Now we will update "MainActivity", adding a button to launch our "MSRActivity".

1. Select "activity_main.xml" from "Package Explorer" in Eclipse.  
	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image128.jpg)  
2. Add the following Button to "activity_main.xml". This Button will be used for opening "MSRActivity".  
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="xml" 
    _jivemacro_uid="_1398870592774641">
 	<p>&lt;Button</p>
    <p>	android:id="@+id/buttonMSR"</p>
    <p>	android:layout_width="wrap_content"</p>
    <p>	android:layout_height="wrap_content"</p>
    <p>	android:layout_alignParentBottom="true"</p>
    <p>	android:layout_marginBottom="50dp"</p>
    <p>	android:layout_marginLeft="50dp"</p>
    <p>	android:text="MSR" /&gt;</p>
	</pre>

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image129.jpg)  
3. Select "MainActivity.java" from "Package Explorer" in Eclipse. 

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image130.jpg) 
4. Add the following Imports to "MainActivity.java".  
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
	<p>import android.widget.Button;</p>
	<p>import android.view.View;</p>
	<p>import android.view.View.OnClickListener;</p>
    </pre>

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image131.jpg)  
5. Declare a variable inside "MainActivity" to store "buttonMSR". 
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
	<p>//Declare a variable to store the buttonMSR</p>
	<p>private Button buttonMSR = null;</p>
    </pre>

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image132.jpg)  
6. Inside "onCreate" get a reference to "buttonMSR".
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
	<p>//Declare a variable to store the buttonMSR</p>
	<p>private Button buttonMSR = null;</p>
    </pre>

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image133.jpg)  
7. Inside "onCreate" add an "OnClickListener" for "buttonMSR".  
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
	<p>/Add an OnClickListener for buttonMSR</p>
	<p>buttonMSR.setOnClickListener(buttonMSROnClick);</p>
    </pre>

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image134.jpg)  

8. Add a new "OnClickListener" inside "MainActivity". 
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
	<p>//OnClickListener for buttonMSR</p>
    <p>private OnClickListener buttonMSROnClick = new OnClickListener() {</p>
    <p>	public void onClick(View v) {</p>
    <p></p>
    <p>	}</p>
    <p>};</p>
    </pre>

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image135.jpg)  
9. Add the following code to "onClick" to launch "MSRActivity". 
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
	<p>//Launch MSRActivity</p>
    <p>Intent myIntent = new Intent(MainActivity.this, MSRActivity.class);</p>
    <p>startActivity(myIntent);</p>
    </pre>

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image136.jpg) 

###Creating MSR UI###
Next we will create the UI for "MSRActivity". 

1. Select "activity_msr.xml" from "Package Explorer" in Eclipse.  
	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image137.jpg) 
2. Remove the default "TextView". 
3. Add the following TextView. 
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="xml" 
    _jivemacro_uid="_1398870592774641">
 	<p>&lt;TextView</p>
    <p>	android:id="@+id/textViewInfo"</p>
    <p>	android:layout_width="wrap_content"</p>
    <p>	android:layout_height="wrap_content"</p>
    <p>	android:layout_alignParentTop="true"</p>
    <p>	android:layout_centerHorizontal="true"</p>
    <p>	android:layout_marginTop="50dp"</p>
    <p>	android:text="Please swipe a card to continue."</p>
    <p>	android:textAppearance="?android:attr/textAppearanceLarge" /&gt;</p>
	</pre>

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image138.jpg) 

###Creating our MSR Profile###
Next we will create a Data Capture profile that will activate the MSR on "MSRActivity" and send the data via a startActivity Intent to "MSRCompletedActivity".  

1. Select "EMDKSample" project from Package Explorer.    
2. Click "EMDK" menu and select "Profile Manager".  
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image043.jpg)  
3. The EMDK Profile Manager Window will appear.  
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image139.jpg)  
4. click "Create".  
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image140.jpg)  
5. Enter the Profile Name "DataCaptureProfileMSR" and click "Create".  
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image141.jpg)  
6. select "ActivitySelection" from the list of "Available Features" and add it to "Selected Features" using the arrow.  
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image142.jpg)  
7. Select "Activity Selection".  
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image143.jpg)  
8. Enter "com.symbol.emdksample" as the application name and click apply.  
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image144.jpg)  
9. Enter "MSRActivity" as the activity name and click apply.  
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image145.jpg)  	
10. Click Okay.  
11. select "MSR" from the list of "Available Features" and add it to "Selected Features" using the arrow. 
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image146.jpg)  	
12. Change "MSR Input Enable" to "Enable".  
	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image147.jpg) 
13. select "Intent" from the list of "Available Features" and add it to "Selected Features" using the arrow. 
	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image148.jpg) 
14. Now we will configure the "Intent" settings.  
	* Switch "Intent Output Enable" to Enable". 
	* For "Intent Output Action" enter "com.symbol.emdksample.RECVRMSR".
	* For "Intent Output Category" enter "android.intent.category.DEFAULT".
	* Switch "Intent Output Delivery" to "Send via startActivity".  
	* Switch "Basic data formatting Enable" to Enable". 
	* Switch "Basic data formatting Send Data" to Enable". 	

	Your Intent configuration should now look like this:  
	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image149.jpg)  

15. Click "Apply" and "Finish".  
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image150.jpg)  
16. Click "Close".  
    >Note:  
    >Now the "EMDKConfig.xml" file under the "\assets" folder will be updated with your changes.

###Adding the MSR Intent Filter###
Now will add an Intent filter to our Manifest file to allow "MSRCompletedActivity" to listen for our new Data Capture Intent. 

1. Open your application's "Manifest.xml" file.  
	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image151.jpg)
2. Add the following configuration to the activity "com.symbol.emdksample.MSRCompletedActivity" to revive our MSR intent.  
	 
    <pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="xml" _jivemacro_uid="_1398870592774641">
    <p>&lt;intent-filter&gt;</p>
    <p>		&lt;action android:name="com.symbol.emdksample.RECVRMSR"/&gt;</p>
    <p>		&lt;category android:name="android.intent.category.DEFAULT"/&gt;</p>
    <p>&lt;/intent-filter&gt;</p>
    </pre>

    When done, your manifest.xml should look like this:

    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image152.jpg)  

	>Note:  
	>
	>* The intent action name should match the value of "Intent Output Action" in the EMDK Profile Manager. 
	>* The intent category name should match the value of "Intent Output Category" in the EMDK Profile Manager.

###Registering the MSR EMDK profile###
Next we will register our new Data Capture profile from "MainActivity".

1. Select "MainActivity.java" from "Package Explorer" in Eclipse. 

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image153.jpg) 
2. Inside "MainActivity" add the following code to hold the name of our MSR profile.  
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
	<p>//Assign the profile name used in EMDKConfig.xml  for MSR handling</p>
    <p>private String profileNameMSR = "DataCaptureProfileMSR";</p>
    </pre>
	
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image154.jpg)  
3. Inside "onOpened" add the following code to register the MSR EMDK profile. 
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
	<p>//Call processPrfoile for profile MSR</p>
	<p>results = mProfileManager.processProfile(profileNameMSR, ProfileManager.PROFILE_FLAG.SET, modifyData);</p>
	<p></p>
	<p>if(results.statusCode == STATUS_CODE.FAILURE)</p>
	<p>{</p>
	<p>	//Failed to set profile MSR</p>
	<p>}</p>
	</pre>

    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image155.jpg)  

###Creating MSR Completed UI###
Now we will create the UI for "MSRCompletedActivity". This UI will allow us to display the MSR data to the user.

1. Select "activity_msr.xml" from "Package Explorer" in Eclipse.  
	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image156.jpg) 
2. Remove the default "TextView". 
3. Add the following TextView. 
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="xml" 
    _jivemacro_uid="_1398870592774641">
 	<p>&lt;TextView</p>
    <p>	android:id="@+id/textViewMSRData"</p>
    <p>	android:layout_width="wrap_content"</p>
    <p>	android:layout_height="wrap_content"</p>
    <p>	android:layout_alignParentTop="true"</p>
    <p>	android:layout_centerHorizontal="true"</p>
    <p>	android:layout_marginTop="50dp"</p>
    <p>	android:text="Data = "</p>
    <p>	android:textAppearance="?android:attr/textAppearanceMedium" /&gt;</p>
	</pre>

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image157.jpg) 

###Handling MSR Intents###
Next will will add the code to "MSRCompletedActivity" for capturing the startActivity Intent and displaying the result data to the user. 

1. Select "MSRCompletedActivity.java" from "Package Explorer" in Eclipse. 

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image158.jpg) 
2. Add the following imports.  
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
	<p>import android.content.Intent;</p>
	<p>import android.widget.TextView;</p>
    </pre>

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image159.jpg)  
3. Add the following function for processing intents.  
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
    <p>//This function is responsible for getting the data from the intent</p>
    <p>private void handleDecodeData(Intent i)</p>
    <p>{</p>
    <p></p>
    <p>}</p>
    </pre>
     
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image160.jpg)  
4. Add the following code to your "onCreate" function to check for a possible intent;  
    <pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
    <p>//In case we have been launched by the DataWedge intent plug-in</p>
    <p>Intent i = getIntent();</p>
    <p>handleDecodeData(i);</p>
    </pre>
     
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image161.jpg)  
5. Overide "onNewIntent" to handle incoming intents.  
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
    <p>//We need to handle any incoming intents, so let override the onNewIntent method</p>
    <p>@Override</p>
    <p>public void onNewIntent(Intent i) {</p>
    <p>	handleDecodeData(i);</p>
   	<p>}</p>
    </pre>
     
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image162.jpg)  
6. Add a global variable for the TextView. 
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
    <p>//Declare a variable to store the textViewMSRData</p>
    <p>private TextView textViewMSRData = null;</p>
    </pre>
	
	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image163.jpg)  
7. Add the following code to your onCreate function to get a handle on the TextView.
 
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
    <p>//Get the textViewBarcode</p>
	<p>textViewMSRData = (TextView) findViewById(R.id.textViewMSRData);</p>
    </pre>

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image164.jpg)   
8. Add the following code to your "handleDecodeData" function to confirm the intent was meant for us. 
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
    <p>//Check the intent action is for us</p>
    <p>if (i.getAction().contentEquals("com.symbol.emdksample.RECVRMSR"))</p>
	<p>{</p>
    <p></p>
    <p>}</p>
    </pre>
    
    ![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image165.jpg)   
9. Add the following code to your "handleDecodeData" function to check if the intent contains MSR data.  
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
  	<p>//Get the source of the data</p>
    <p>String source = i.getStringExtra("com.motorolasolutions.emdk.datawedge.source");</p>
    <p></p> 	
    <p>//Check if the data has come from the msr</p>
    <p>if(source.equalsIgnoreCase("msr"))</p>
    <p>{</p>
    <p></p>
    <p>}</p>
    </pre>

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image166.jpg)  
10. Add the following code to your "handleDecodeData" function to retrieve MSR data.  
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
	<p>//Get the data from the intent</p>
    <p>String data = i.getStringExtra("com.motorolasolutions.emdk.datawedge.data_string");</p>
    <p></p>
    <p>//Check that we have received data</p>
    <p>if(data != null && data.length() > 0)</p>
    <p>{</p>
    <p></p>
    <p>}</p>
    </pre>

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image167.jpg)
11. Add the following code to your "handleDecodeData" function to populate the TextView with the revived MSR data.
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
	<p>//Display the data to textViewMSRData</p>
    <p>textViewMSRData.setText("Data = " + data);</p>
    </pre>

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image168.jpg) 

###Running the Application###
Lastly we will run and test our application. 

1. Connect Motorola Solutions Android device (having the latest EMDK runtime) to the USB port.

    >Note:   
    >Make sure the device is in USB debug.

2. Run the application.  

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image169.png) 
3. Press the trigger button and scan a Barcode. 
4. Like before the scanned data will be populated in the Edit Text field Through the previous Keystroke Intent and will appear on the Text View using the previous Datawedge Intent.   

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image170.png) 
5. Press the button "MSR".  

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image171.png)
6. Swipe a cad through the MSR.  

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image172.png)
7. Press return to go back to the MSR where you can swipe another card, or hit return again to go back to the main screen. 

## What's Next
The <a data-link="tutdatacaptureprofilePt4">next tutorial</a> will show you how to use the Intent Output as a Broadcast instead of starting an activity.

## Download the Source
The project source to this tutorial can be found attached to the end of this document.