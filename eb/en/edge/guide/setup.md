<!-- Launchpad Link id: setup
	usage <a data-link="id">blah blah</a>
	replace id
-->
<div class="tableofcontents"> </div>
## Overview

The EMDK for Android provides the interface to Motorola value adds such as scanning and magstripe for developing Enterprise applications on Motorola Android devices.
This document is a guide to start working with Android Developer Tools (ADT)/Eclipse IDE environment for "Motorola EMDK for Android" development. 

##Configuring Development Computer

### Installing Java Development Kit (JDK)
1.	Go to [http://www.oracle.com/technetwork/java/javase/downloads/index.html](http://www.oracle.com/technetwork/java/javase/downloads/index.html).
2.	Download and install JDK v7u45 or newer. 

### Installing Android Developer Tools (ADT)
1.	Go to [http://developer.android.com/sdk/index.html](http://developer.android.com/sdk/index.html "http://developer.android.com/sdk/index.html").
2.	Click "Download the SDK" button.
3.	Accept the License Agreement and Select the PC's architecture (32-bit or 64-bit).
4.	Click "Download the SDK ADT Bundle for Windows" button.
5.	Extract the downloaded ADT Bundle (ex. adt-bundle-windows-x86-20140321.zip) to any desired location.

	>NOTE:  
	>EMDK for Android requires ADT v22.3.0-887826 or higher version.

### Configuring the Android Developer Tools (ADT) for EMDK
The EMDK requires Android API's 16 and 19 to be Installed.

To check which API's you have installed:

1. In Eclipse go to "Window" -> "Android SDK Manager"
2. Check that the status of "Android 1.1.2 (API 16)" and "Android  4.4.2 (API 19)" SDK Platforms status is "Installed". 
3. If either SDK platform is not installed check the SDK check mark, click "Install Packages", and follow the on screen instructions. When the install is complete restart Eclipse. 


### Installing EMDK for Android
1.	Go to [https://portal.motorolasolutions.com/Support/US-EN](https://portal.motorolasolutions.com/Support/US-EN "https://portal.motorolasolutions.com/Support/US-EN").
2.	Search "Motorola EMDK for Android" using the Search Support.
3.	Download and install Motorola EMDK for Android v2.0 or higher version.
4. 	During installation, it will ask to specify the preferred Android development environment.
This can be either the Android Developer Tools (ADT) Bundle or the existing Eclipse IDE and the Android SDK (installed separately).  
	* The Android Developer Tools (ADT) Bundle. This includes Android SDK components and a version of the Eclipse IDE with built-in ADT.  
		>NOTE:  
		>Make sure to specify the extracted ADT Bundle folder as the ADT Root Folder (i.e. the parent folder which "eclipse" and "sdk" sub folders reside. See below).
	    >
		>![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image001.png)  
	* During installation, it will ask the approval for Motorola Android USB driver installation. If you have installed them already, skip this step.  
	* The existing Eclipse IDE and Android SDK (installed separately).  
		>NOTE:  
		>Make sure to specify the parent folder where "eclipse.exe" resides as the Eclipse Root Folder. See below.
	    >
		>![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image003.jpg)
		>
		>Make sure to specify the parent folder where "platform-tools" folder resides as the Android SDK Root Folder. See below.
	    >
		>![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image005.jpg)

5.	During installation, it will ask the approval for Motorola Android USB driver installation too. 
	     
	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image007.png)

	>NOTE:
	>
	>* If you have installed it already, click "No". Then it will switch back to the EMDK for Android installation.
	>
	>* If you have not installed, click "Yes". Then it will start the Motorola Android USB driver installation automatically. Once completed, make sure to select "I want to manually reboot later" and click "Finish". Then it will switch back to the EMDK for Android installation.

## Configuring Device

###	Installing EMDK for Android Device Runtime using Deployment utility

1.	Connect the Motorola Android device to the PC.
2.	Launch the Start menu program shortcut "Device Runtime Deployment". This will open the command prompt window.
3.	Click any key to continue.
4.	This process will deploy the device runtime and reboot automatically to finish the OS update.

## Verifying EMDK for Android Development Environment

###	Verifying the EMDK Wizard plug-in integration into the ADT/Eclipse IDE  
1.	Run "eclipse.exe" available under "<adt-bundle>\eclipse" (ex. \adt-bundle-windows-x86-20140321\eclipse\eclipse.exe) or "<eclipse-root>" (ex. \eclipse-standard-kepler-SR2-win32\eclipse\eclipse.exe).
2.	The menu bar should contain a new menu called "EMDK" (see below)

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image009.jpg)

### Verifying the SDK add-on integration into the ADT/Eclipse IDE
1.	Select any existing Android application project.
2.	Go to "File" -> "Properties"

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image011.jpg)
3.	Select "Android" from left pane.

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image015.jpg)
4.	Check the availability of "Motorola Solutions EMDK v2.0" in the list of Project Build Targets.

	![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image017.jpg)

### Verifying EMDK for Android Runtime Environment

To check whether the EMDK runtime is installed on the device or not, check for the existence of "/system/framework/com.symbol.emdk.jar" on the device.


![img](https://s3-us-west-1.amazonaws.com/launchpad-images/emdk/setup/image097.jpg)

