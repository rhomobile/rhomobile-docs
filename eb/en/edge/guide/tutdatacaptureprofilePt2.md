<!-- Launchpad Link id: tutdatacaptureprofile
    usage <a data-link="id">blah blah</a>
    replace id
-->
<div class="tableofcontents"> </div>
## Developing an EMDK for Android Application Part 2

This tutorial will walk you through adding <a data-link="profileintent">Intent Output</a> support to the EMDK For Android application you made using <a data-link="tutdatacaptureprofile">"Developing an EMDK for Android Application Part 1"</a>. This tutorial will assume your project is at the state of the end of that tutorial and build on top of it. You can follow the tutorial in the previous step of download the source from the previous step and start from there.

###Prerequisites###

* Java Development Kit (JDK)
* Android Developer Tools (ADT)
* Motorola EMDK for Android 
* Completion of <a data-link="tutdatacaptureprofile">"Developing an EMDK for Android Application Part 1"</a>

For more information about setting up the EMDK please see the EMDK Overview.

##Using EMDK Wizard and EMDK for Android Profile Intents##

### Adding Intents to the DataCapture Profile###
1. Select "EMDKSample" project from Package Explorer.    
2. Click "EMDK" menu and select "Profile Manager".  
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image043.jpg)  
3. The EMDK Profile Manager Window will appear.  
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image105.jpg)  
4. select "DataCaptureProfile" and click "Edit".
5. Select "Intent" from the list of "Available Features" and add it to "Selected Features".
	![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image106.jpg)  
6. Select "Intent" from the list of "Selected Features". 
7. Now we will configure the "Intent" settings.  
	* Switch "Intent Output Enable" to Enable". 
	* For "Intent Output Action" enter "com.symbol.emdksample.RECVR".
	* For "Intent Output Category" enter "android.intent.category.DEFAULT".
	* Switch "Intent Output Delivery" to "Send via startActivity".  
	* Switch "Basic data formatting Enable" to Enable". 
	* Switch "Basic data formatting Send Data" to Enable". 	

	Your Intent configuration should now look like this:  
	![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image107.jpg)  

7. Click "Apply" and "Finish".  
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image079.jpg)  
8. Click "Close".  
    >Note:  
    >Now the "EMDKConfig.xml" under "\assets" folder will be updated with your changes.

###Adding the Intent Filter###
1. Open your application's "Manifest.xml" file.  
	![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image087.jpg)
2. Make the following changes to your application's"Manifest.xml" file.  

	Add the following parameter to your activity settings to enable "singleTask" mode.
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="xml" _jivemacro_uid="_1398870592774641">
    <p>android:launchMode="singleTask"</p>
    </pre>
	
	Add the following lines to receive EMDK Intents in your application: 
    <pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="xml" _jivemacro_uid="_1398870592774641">
    <p>&lt;intent-filter&gt;</p>
    <p>		&lt;action android:name="com.symbol.emdksample.RECVR"/&gt;</p>
    <p>		&lt;category android:name="android.intent.category.DEFAULT"/&gt;</p>
    <p>&lt;/intent-filter&gt;</p>
    </pre>

    When done, your manifest.xml should look like this:

    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image108.jpg)  

	>Note:  
	>
	>* The intent action name should match the value of "Intent Output Action" in the EMDK Profile Manager. 
	>* The intent category name should match the value of "Intent Output Category" in the EMDK Profile Manager.

###Adding the Intent code###
1. Add the following imports to your program.
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
	<p>import android.content.Intent;</p>
	<p>import android.widget.TextView;</p>
    </pre>

	![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image109.jpg) 
2. Add the following function to your program for processing intents. 
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
    <p>//This function is responsible for getting the data from the intent</p>
    <p>private void handleDecodeData(Intent i)</p>
    <p>{</p>
    <p></p>
    <p>}</p>
    </pre>
     
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image110.jpg) 
3. Add the following code to your "onCreate" function check for a possible intent; 
    <pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
    <p>//In case we have been launched by the DataWedge intent plug-in</p>
    <p>Intent i = getIntent();</p>
    <p>handleDecodeData(i);</p>
    </pre>
     
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image112.jpg)  
4. Overide "onNewIntent" to handle incoming intents. 

	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
    <p>//We need to handle any incoming intents, so let override the onNewIntent method</p>
    <p>@Override</p>
    <p>public void onNewIntent(Intent i) {</p>
    <p>		handleDecodeData(i);</p>
   	<p>}</p>
    </pre>
     
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image111.jpg)
5. Add a TextView in the UI called "textViewBarcode", inside "res/layout/activity_main.xml".
    
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="xml" 
    _jivemacro_uid="_1398870592774641">
 	<p>&lt;TextView</p>
    <p>		android:id="@+id/textViewBarcode"</p>
    <p> 	android:layout_width="wrap_content"</p>
    <p> 	android:layout_height="wrap_content"</p>
    <p> 	android:layout_alignParentTop="true"</p>
    <p> 	android:layout_centerHorizontal="true"</p>
    <p> 	android:layout_marginTop="50dp"</p>
    <p> 	android:text="@+string/hello_world"</p>
    <p> 	android:textAppearance="?android:attr/textAppearanceMedium" /&gt;</p>
	</pre>

	![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image113.jpg)  
6. Add a global variable for the TextView. 
 
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
    <p>//Declare a variable to store the textViewBarcode</p>
    <p>private TextView textViewBarcode = null;</p>
    </pre>
	
	![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image114.jpg)    
7. Add the following code to your onCreate function to get a handle on the TextView.
 
	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
    <p>//Get the textViewBarcode</p>
    <p>textViewBarcode = (TextView) findViewById(R.id.textViewBarcode);</p>
    </pre>

	![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image115.jpg)   
8. Add the following code to your "handleDecodeData" function to confirm the intent was meant for us. 

	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
    <p>//Check the intent action is for us</p>
    <p>if (i.getAction().contentEquals("com.symbol.emdksample.RECVR") ) {</p>
    <p></p>
    <p>}</p>
    </pre>
    
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image116.jpg)   
    
9. Add the following code to your "handleDecodeData" function to check if the intent contains Barcode data.  

	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
    <p>//Get the source of the data</p>
    <p>String source = i.getStringExtra("com.motorolasolutions.emdk.datawedge.source");</p>
    <p></p>
    <p>//Check if the data has come from the Barcode scanner</p>
    <p>if(source.equalsIgnoreCase("scanner"))</p>
    <p>{</p>
	<p></p>
    <p>}</p>
    </pre>

	![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image117.jpg)   
10. Add the following code to your "handleDecodeData" function to retrieve Barcode data.  

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

	![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image118.jpg)

11. Add the following code to your "handleDecodeData" function to populate the TextView with the revived Barcode data.

	<pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
	<p>//Display the data to the text view</p>
    <p>textViewBarcode.setText("Data = " + data);</p>
    </pre>

	![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image119.jpg) 
12. Connect Motorola Solutions Android device (having the latest EMDK runtime) to the USB port.
    
    >Note:   
    >Make sure the device is in USB debug.

13. Run the application.  
	![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image120.png) 
14. Press the trigger button and scan a Barcode.
15. The scanned data will be populated in the Edit Text field Through the previous Keystroke Intent and will appear on the Text View using the new Datawedge Intent.   
	![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image121.png) 


## What's Next
The <a data-link="tutdatacaptureprofilePt3">next tutorial</a> will show you how to use multiple Data Capture Profiles that are handled by multiple activities.

## Download the Source
The project source to this tutorial can be found attached to the end of this document.