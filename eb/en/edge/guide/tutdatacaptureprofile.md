<!-- Launchpad Link id: tutdatacaptureprofile
    usage <a data-link="id">blah blah</a>
    replace id
-->
<div class="tableofcontents"> </div>
## Developing an EMDK for Android Application Part 1

[a local link same folder](../guide/profilebarcode)
[a local link other folder](../api/Adapter)
[a remote link](http://www.google.com)
[another remote link](https://www.google.com)

This guide will walk you through creating an EMDK For Android application that will use <a data-link="profilebarcode">Data Capture Profiles</a> to get barcode data into your application using the <a data-link="profilekeystroke">KeyStroke output</a> feature of <a data-link="usingwizard">EMDK Profiles</a>. 

###Prerequisites###

* Java Development Kit (JDK)
* Android Developer Tools (ADT)
* Motorola EMDK for Android 

For more information about setting up the EMDK please see the EMDK Overview.

##    Using EMDK Wizard and EMDK for Android Profile APIs##

### Creating The Project
1.  Create new Android Application project.  
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image019.jpg)
2.  Assign names for the application and package. 
3.  Set the minimum required SDK to "API 16: Android 4.1 (Jelly Bean)".  
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image021.jpg)
4.  Click "Next".  
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image023.jpg)  
5.  Click "Next".  
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image025.jpg)  
6.  Click "Next".  
7.  Select "Empty Activity" Click "Next".  

    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image100.jpg)  

    >Note:  
    >If "Empty Activity" is not available make sure you are using "Android SDK Tools 22.6.3" and "Android SDK Platform Tools 19.0.2"

7.  Click "Next".  

    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image102.jpg)  
8.  Click "Finish".

    >Note:  
    >Currently there is nothing under "\assets" folder.  
    
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image031.jpg)  

### Enabling the EMDK
9.  Select the project.  
10. Select "File -> Properties" or right click on the project and select "Properties".  
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image033.jpg)   
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image035.jpg)   
11.    Click "Android" from the left pane.  
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image037.jpg) 
12. Select "Motorola Solutions EMDK v2.0" from the list of Project Build Targets.  
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image039.jpg)  

    >Note:  
    >If "Motorola Solutions EMDK v2.0" is not on the list of Build Tagets, please confirm you have installed Android API 16 SDK Platform.

13. Click "Apply" and "OK".  
    >Note:  
    >The EMDK library will be added to the project.  
    
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image041.jpg) 

    >Note:
    >If you are using Java 1.7 as the compiler, you may see this error
    
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image098.jpg) 

    > To correct this, you will need to change the compiler to use 1.6
    
    > * Click on the Java Compiler
    > * Click Enable project specific settings
    > * Select 1.6 for Compiler compliance level
    
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image101.jpg) 

### Adding a DataCapture Profile
1. Select "EMDKSample" project from Package Explorer.    
2. Click "EMDK" menu and select "Profile Manager".  
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image043.jpg)  
3. The EMDK Profile Manager Window will appear.  
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image045.jpg)  
4. Click "Create" and assign a name for the profile (Ex: DataCaptureProfile).  
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image047.jpg)  
5. Click "Create". The Profile Editor window will appear.  
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image049.jpg)  
6. Select any feature from the list and click "Right Arrow" (Ex: "ActivitySelection" has been selected. By using this feature Activities can be associated with the application. Then the data capture feature will be enabled automatically when the specified activity is in foreground).  
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image051.jpg)  
7. Click on the selected feature. The parameter list will be populated.  
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image053.jpg)  
8. Click "ActivitySelection" under parameters.  
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image055.jpg)  
9. Specify the applications package name and click "Apply".  
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image057.jpg)  
10. Specify an Activity inside the application and click "Apply".  
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image059.jpg)  
11. Click "OK".  
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image061.jpg)  
12. Select any data capture feature and click Right Arrow (Ex: "Barcode" has been selected).  
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image063.jpg)  
13. Click on the "Barcode" feature. The parameter list will be populated.  
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image065.jpg)  
14.    Enable the feature and change some parameters.  
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image067.jpg)  
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image069.jpg)  
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image071.jpg)  
15.    Click "Apply". 
16.    Select the Keystroke feature and click "Right Arrow" (Ex: "Keystroke" has been selected).  
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image073.jpg)  
17. Enable the feature and change some parameters.  
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image075.jpg)  
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image077.jpg)  
18. Click "Apply" and "Finish".  
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image079.jpg)  
19.    Click "Close".  

    >Note:  
    >Now the "EMDKConfig.xml" is created under "\assets" folder. This file will contain a definition of all of your profiles that you create. 
    
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image081.jpg)  
20. You can inspect the EMDKConfig.xml to see it is reflecting the changes made to the parameters via EMDK Profile Manager GUI earlier.  However, it is advised that this file not be manually updated and only be controlled via the Profile Manager.

    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image083.jpg)   
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image085.jpg)   

### Enabling Android Permissions
1. Modify the Application's Manifest.xml to use the EMDK library and to set permission for the EMDK.  
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image087.jpg)

    You must first enable permissions for 'com.symbol.emdk.permission.EMDK':  
    <pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="xml" _jivemacro_uid="_1398870592774641">
    <p>&lt;uses-permission android:name="com.symbol.emdk.permission.EMDK"/&gt;</p>
    </pre>

    Then you must enable the library:  
    <pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="xml" _jivemacro_uid="_1398870592774641">
    <p>&lt;uses-library android:name="com.symbol.emdk" /&gt;</p>
    </pre>

    When done, your manifest.xml should look like:

    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image089.jpg)  

###Adding Some Code    
1. Now we will start to add some code. 

    First you must add references to the libraries:  
    <pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
    <p>import com.symbol.emdk.*;</p>
    <p>import com.symbol.emdk.EMDKManager.EMDKListener;</p>
    </pre>
    
    Then you must extend the activity to implement EMDKListener. Use Eclipse’s Content Assist to implement the unimplemented functions of `onOpened` and `onClosed`.    
    <pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
    <p>public class MainActivity extends Activity implements EMDKListener {</p>
    <p></p>
    <p>    .. .. .. .. .. .. ...</p>
    <p></p>
    <p>    @Override</p>
    <p>    public void onClosed() {</p>
    <p>           // TODO Auto-generated method stub</p>
    <p>    }</p>
    <p></p>
    <p>    @Override</p>
    <p>    public void onOpened(EMDKManager emdkManager) {</p>
    <p>           // TODO Auto-generated method stub</p>
    <p>    }</p>
    <p></p>
    <p>}</p>
    </pre>

    We will now create some global variables to hold the profile name as well as instance objects of EMDKManager and ProfileManager that we will use throughout the code:  
    <pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
    <p>//Assign the profile name used in EMDKConfig.xml</p>
    <p>private String profileName = "DataCaptureProfile";</p>
    <p></p>
    <p>//Declare a variable to store ProfileManager object</p>
    <p>private ProfileManager mProfileManager = null;</p>
    <p></p>
    <p>//Declare a variable to store EMDKManager object</p>
    <p>private EMDKManager emdkManager = null;</p>
    </pre>

    In the onCreate method, we call getEMDKManager so that the EMDK can be initialized and checked to see if it is ready. 
    <pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
    <p>//The EMDKManager object will be created and returned in the callback.</p>
    <p>EMDKResults results = EMDKManager.getEMDKManager(getApplicationContext(), this);</p>
	<p></p>
	<p>//Check the return status of getEMDKManager</p>
    <p>if(results.statusCode == STATUS_CODE.FAILURE)</p>
    <p>{</p>
    <p>		//Failed to create EMDKManager object</p>    	
    <p>}</p>
    </pre>
 
    So far your code should look like:
     
     ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image091.jpg) 

2. Now we need to use the `onOpened` method to get a reference to the EMDKManager. The EMDKListener interface will trigger this event when the EMDK is ready to be used. This must be implemented in order to get a reference to the EMDKManager APIs. This event will pass the EMDKManager instance and we assign it to the global variable `emdkManager` that we created in the previous steps. We then use that instance object to get an instance of ProfileManager and assign it to the global variable `mProfileManager`. This is how we will interface with the APIs in the rest of the code:  
        <pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
        <p>this.emdkManager = emdkManager;</p>
        <p></P>
        <p>//Get the ProfileManager object to process the profiles</p>
        <p>mProfileManager = (ProfileManager) emdkManager.getInstance(EMDKManager.FEATURE_TYPE.PROFILE);</p>
        </pre>
    
    Now that we have a reference to ProfleManager, we use it to install and activate the profile we built earlier using the `processProfile` method. We could have also performed this action at a different time, say when someone pressed a button, but we chose to do it as soon as the EMDK was ready:  
        <pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" _jivemacro_uid="_1398870592774641">
        <p>if(mProfileManager != null)</p>
        <p>{</p>
        <p>		String[] modifyData = new String[1];</p>
        <p></p>
        <p>		//Call processPrfoile with profile name and SET flag to create the profile. The modifyData can be null.</p>
        <p>		EMDKResults results = mProfileManager.processProfile(profileName, ProfileManager.PROFILE_FLAG.SET, modifyData);</p>
		<p></p>
		<p>		if(results.statusCode == STATUS_CODE.FAILURE)</p>
	    <p>		{</p>
	    <p>			//Failed to set profile</p>
	    <p>		}</p>
        <p>}</p>
        </pre>

    Your onOpened method should now look like this:
    
    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image095.jpg)  
    
3. Now let's override the "onDestroy" method so we can release the EMDKManager resources:  
    <pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="java" 
      _jivemacro_uid="_1398870592774641">
      <p>@Override</p>
      <p>protected void onDestroy() {</p>
      <p>    // TODO Auto-generated method stub</p>
      <p>    super.onDestroy();</p>
      <p>    //Clean up the objects created by EMDK manager</p>
      <p>    emdkManager.release();</p>
      <p>}</p>
     </pre>

    Your onDestroy method should now look like this:  

    ![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image093.jpg)  

4. Remove the default "TextView", inside "res/layout/activity_main.xml".

5. Add an EditText Field in the UI called "editTextBarcode", inside "res/layout/activity_main.xml".
    
    <pre class="jive_text_macro jive_macro_code" jivemacro="code" ___default_attr="xml" 
      _jivemacro_uid="_1398870592774641">
      <p> &lt;EditText</p>
        <p>    android:id="@+id/editTextBarcode"</p>
        <p>    android:layout_width="wrap_content"</p>
        <p>    android:layout_height="wrap_content"</p>
		<p>    android:layout_marginTop="200dp"</p>
    	<p>    android:layout_marginLeft="50dp"</p>
        <p>    android:ems="10" &gt;</p>
     </pre>

6. Connect Motorola Solutions Android device (having the latest EMDK runtime) to the USB port.
    >Note:   
    >Make sure the device is in USB debug.
7. Run the application.  
	![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image103.png)  
8. Press the trigger button and scan a barcode.
9. The scanned data will be populated in the Edit Text field added to the UI.  
	![img](https://launchpad-images.s3-us-west-1.amazonaws.com/emdk/setup/image104.png)  

##Important Programming Tips##

1. It is required to do the following changes in the application's AndroidManifest.xml:  
  
    >Note:
    >* Include the permission for EMDK:  
    >  <uses-permission android:name="com.symbol.emdk.permission.EMDK"/>
    >* Use the EMDK library:  
    >  <uses-library android:name="com.symbol.emdk"/>
  
2. When using the "Barcode" feature in EMDK Wizard, the specified value for "Scanner" is not supported on the device, it will be considered as "Auto" during runtime (Ex: BT_LASER1, BT_IMAGER1 and BT_CAMERA1).
3. Installing the EMDK for Android application without deploying the EMDK runtime on the Motorola Solutions Android  device will fail because of missing shared library on the device. 
4. Use the DataWedge v1.7.12 or higher version to test the ProfileManager.processProfile() for DataWedge profiles.

## What's Next
Now that you have learned the basics of an EMDK for Android application, the <a data-link="tutdatacaptureprofilePt2">next tutorial</a> will show you how to use the <a data-link="profileintent">Intent Output</a> feature of EMDK Profiles to handle Data Capture output programatically.

## Download the Source
The project source to this tutorial can be found attached to the end of this document.