<!-- Launchpad Link id: samplebatteryintent
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
 
## Using This Sample
You may choose to install the Battery Sample Application.apk attached at the [end of the document](#theend) or to run the project from Eclipse:

1. Download the battery sample application zip. 
2. Unzip the battery sample application zip.
3. Start the Android ADT or compatible eclipse environment. 
4. Import the sample application. 
	>How to import:  
 	>1. Go to "File" -> "Import"  
 	>![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/SampleBatteryIntent/FileImport.jpg)   
 	>2. Select "Android" -> "Existing Android Code Into Workspace" -> "Next"   
 	>![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/SampleBatteryIntent/ImportNext.jpg)   
 	>3. Select "Browse" and navigate to your unzipped battery sample application folder.  
 	>![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/SampleBatteryIntent/Browse.jpg)  
 	>4. Select "Finish".  
 	>![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/SampleBatteryIntent/Finish.jpg)  

5. Run the sample application. 
	>How to run the sample application:   
 	>1. Select the sample application folder in "Package Explorer".      
 	>2. Right click and select "Run As" -> "Android Application"  
 	>![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/SampleBatteryIntent/RunAs.jpg)   

6. The battery sample application should look like the following:  
	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/SampleBatteryIntent/BatterySampleApplication.jpg)  

7. The information on the screen will update each time a battery intent is received. To force the intent you may change power state of the device by charging or unplugging it from a power source.


## How This Sample Was Built 
A <a data-link="tutbatteryintent">Tutorial</a> walks through how this sample application was built. 

<a name="theend"></a>
