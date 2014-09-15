# Installation
## Desktop Installation
To install the EB on your device, there are two requirements:

* Your device must be a **Symbol Device**.
* Your device's OS must be either **Windows Mobile, Windows CE, or Android**.

Installing Enterprise Browser on your desktop will provide you will all you need to get started.

1. Download the Enterprise Browser MSI.
2. Install the MSI.

<img style="width:50%" src="images/getting-started/setup/setup-msi-install.png">

At this point you should now have an item in the start menu structured as follows:

* Enterprise Browser
	* Documentation
	* Enterprise Browser Installer
	* Enterprise Browser Runtimes
	* JavaScript Files

<img style="width:35%" src="images/getting-started/setup/setup-start-menu-items.png">

## Device Deployment
To install the Enterprise Browser runtime onto your device, follow the steps below:

1. Connect your device to you PC via the USB cable and wait for Microsoft ActiveSync/Device Center to connect.
2. From your Start Menu browse to the "Enterprise Browser \ Enterprise Browser Installer" and select it.
3. You will be presented with options to choose which variant of Enterprise Browser they wants to install on the device.
4. Information pertaining to each of these options is available on the screen so you can select the appropriate Runtime.
5. Depending on the device operating system, you will have different steps. See below for your device specific operating system.

Here is what the Installer looks like; options on the left, explanations on the right.

<img style="width:50%" src="images/getting-started/setup/setup-eb-installer-platform-select.png">

> Note: Once the Enterprise Browser is deployed to your device, it is recommended that you restart the device to properly generate any file / folder structures necessary for proper EB operations.

### Android Devices
To connect your Android device to your Windows computer, you'll need two things:

1. USB Drivers for your device. - Drivers to allow your device to interface with your computer.
2. Android ADT bundle with platform-tools (adb). - Tools to let other programs on your computer interface with your device.

#### USB Drivers
To install the drivers for that device. Usually this is done by simply plugging the device into the machine. Most of the time, the device driver will install automatically and you'll be good to go. If not, you'll need to download the drivers for that device. To get the drivers for your device, you'll need to find the device page on [motorolasolutions.com](http://www.motorolasolutions.com/). The best way to do this is enter your device's model number into the search bar at the top of the landing page. Once you have found your device, you should see a tab to download software. For instance, the drivers for the TC55 are [here](http://goo.gl/mjrqMM).

The page you want should look something like this:

![img](images/getting-started/setup/setup-device-drivers-download.png)

#### Android ADT Bundle
To get the ADT bundle, which includes the Android SDK, you can go [here](http://developer.android.com/sdk/index.html). You'll specify your build of Windows (32-bit or 64-bit) and agree to the terms and download the bundle. This will come as an archive and you'll need to extract it somewhere where you'll remember it as you'll need to refer to it later.

Once you have extracted all the files in the ADT bundle, you'll need to add the platform-tools path to your path environment variable so that Windows can access it without referring to the entire path each time you use it. To do this, open your environment variables settings: right-click "Computer" -> Properties -> "Advanced System Settings" -> "Environment Variables" button. The window should look similar to this.

![img](images/getting-started/setup/setup-environment-variables-window.png)

In the lower part of the window, find the "Path" System variable, click on it, and click the "Edit" button. Now you'll need to add a semi-colon (;) and the path to your android "platform-tools" folder to this string.

For example:
if your platform-tools directory path is `C:\android\sdk\platform-tools`, you would add `;C:\android\sdk\platform-tools` to the end of the Path System variable.

Now you should be able to access the adb command from any directory using your command-prompt. To make sure that your device is setup and will interface with the EB Installer, connect your device via USB, ensure that USB debugging is enabled, open a command prompt (cmd.exe) and run the command:

	:::term
	$ adb devices

Which, if your device is setup correctly, you should see something like this:

![img](images/getting-started/setup/setup-adb-devices-output.png)

Now that you have your android device connected to your computer through adb, you are ready to deploy the EB onto your device using the Enterprise Browser Installer.

When you choose to deploy to your android device you'll see a message asking you to make sure that your device is recognized by the `adb devices` command then, you should see something like this.

![img](images/getting-started/setup/setup-deploying-android.png)

After this step. the EB should be deployed on your Android device.

### Windows Mobile/Windows CE Devices
To connect your WinMo/WinCE device to your computer, all you need to do is connect the device. Upon connecting your device, the drivers and mobile Device Center application should be installed, allowing you to connect to your device. Once the software installs, be sure to reboot your computer and your device to make sure there are no complications.

> Note: Connecting your device to a USB 3.0 port may result in the device not being recognized by your computer. Be sure to connect the device to a USB 2.0 port.

With your device connected and recognized by the OS and the Mobile Device Center application, you should see something like this.

![img](images/getting-started/setup/setup-mobile-device-center-connected.png)

Now that your device is connected and recognized by your computer, you are ready to deploy the EB onto your device using the Enterprise Browser Installer.

1. The ActiveSync installer will install the selected Enterprise Browser runtime files to your device. 
2. If you have chosen to install the Persistent Runtime for Windows then you are required to Cold Boot/Clean PS the device after installation.

> Note if you are given a choice of which directory to install to select the default option, regardless of what you select, Enterprise Browser will install into the default location.

![img](images/getting-started/setup/setup-deploying-winmo.png)

Once you have finished the deploying process on your computer, there is another installation process you must complete on your device.

## Manual Deployment
The Enterprise Browser runtime can also be installed manually by the user. Please follow the following steps to carry out manual installation.

1. Download the Enterprise Browser MSI.
2. Install the MSI. 
3. You should see the following Start Menu Entries after MSI installation is complete.
	* Enterprise Browser
		* Documentation
		* Enterprise Browser Installer
		* Enterprise Browser Runtimes
		* JavaScript Files
4. Click on the Enterprise Browser Runtimes Start Menu item. This will open up Windows Explorer and point to a folder where all the Runtimes are available.
5. Choose the appropriate Runtime.
6. Copy and Paste to your connected device.
7. Open the File location on your device where you have copied the Runtime and click to install.
8. If you are installing a Persistent Runtime then you are required to Coldboot/CleanPS the device after installation.

![img](images/getting-started/setup/setup-enterprise-browser-runtimes.png)

Once the installation is completed on your device, you can start Enterprise Browser on your device by clicking the associated icon form the programs group/Apps.

## Launching Enterprise Browser
Launching Enterprise Browser after installing on the device, will launch a default welcome start page that is included with the installation

>Note: On Android, if you do not disconnect the device from your laptop, you will see the application being forced closed. The USB storage option needs to be turned off so that Enterprise Browser can launch properly.

After launching, a default [configuration file](../guide/configreference) will be created. You will need to modify this to make Enterprise Browser [start with your application](../guide/launching).

## Removing Enterprise Browser

### Windows Mobile
Remove Enterprise Browser by removing the application.

### Windows CE
If you installed the persistant version of Enterprise Browser, it will not be removed after a cold boot. To remove it, you will need to manually remove the folder and CPY files that are found in the non-volatile area of memory.

### Android
Use Android Settings applet to remove the Enterprise Browser from the device.
