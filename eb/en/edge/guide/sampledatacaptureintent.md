<!-- Launchpad Link id: sampledatacaptureintent
	usage <a data-link="id">blah blah</a>
	replace id
-->
<div class="tableofcontents"> </div>
## Overview
This sample demonstrates how to use the DataWedge Intent output plug-in and the <a data-link="refdatacaptureintent">Data Capture Intent API</a> to receive captured data in your native Android application. 

A <a data-link="tutdatacaptureintent">Tutorial</a> walks through how this sample application was built from scratch. If you would simply like to see the application run on your device, follow the instructions in the next section.

## Downloads 
There are two attachments at the [end of this document](#theend) 

* DataCaptureDemoSource.zip - the source file for this project
* DataCaptureDemoApp.apk.zip- Android application to install on your device

## Using This Sample

1. Download DataCaptureDemoSource.apk to your computer
2. Copy the APK from your computer to a Motorola Solutions Android device like a MC40 (using USD file copy or ADB)
3. From the device, launch the File Manager application and click on the APK file you just copied to install the DWDemoSample application.
4. On the device, Launch DataWedge
5. Create a new profile and give it a name such as "dwdemosample"

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/SampleDataIntent/2.png)
	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/SampleDataIntent/4.png)
6. Edit the profile

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/SampleDataIntent/5.png)
7. Go into Associated apps, tap the menu button, and add a new app/activity

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/SampleDataIntent/7.png)
8. For the application select com.motorolasolutions.emdk.sample.dwdemosample

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/SampleDataIntent/8.png)
9. For the activity select com.motorolasolutions.emdk.sample.dwdemosample.MainActivty

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/SampleDataIntent/9.png)
10. Go back and disable the keystroke output plug-in

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/SampleDataIntent/11.png)
11. Enable the intent output plug-in

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/SampleDataIntent/12.png)
12. For the intent action enter com.motorolasolutions.emdk.sample.dwdemosample.RECVR

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/SampleDataIntent/18.png)
13. For the intent category enter android.intent.category.DEFAULT

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/SampleDataIntent/14.png)
14. Launch the DataWedge Demo Sample application

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/SampleDataIntent/17.png)
15. Press the back button to clear the keyboard
16. Press the scan trigger on the device and scan a printed barcode
17. Notice that the output displays the barcode data preceded with additional info (source, symbology and length) that is handled by the handleDecodeData() Intent receiver method.
	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/SampleDataIntent/20.png)


<a name="theend"></a>



