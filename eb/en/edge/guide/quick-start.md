# Quick Start
This guide will provide an easy to use overview of how to get started using the Motorola Enterprise Browser (MEB). We will go through [installation](#guide-quick-start?installation), [licensing](#guide-quick-start?licensing), [your first app](#guide-quick-start?your-first-meb-app), and setting [your app's start page](#guide-quick-start?your-apps-start-page).

## Installation
To install the MEB on your device, there are two requirements:

1. Your device must be a Motorola Solutions device.
2. Your device's OS must be either Windows Mobile, Windows CE, or Android.

Once you have verified that your device meets the above requirements, you'll need to make sure your device is connected to your computer in a way that the Enterprise Browser Installer can interface with it.

### Android
To connect your Motorola Android device to your Windows computer, you'll need two things:

1. [USB Drivers for your device.](#guide-quick-start?usb-drivers) - Drivers to allow your device to interface with your computer.
2. [Android ADT bundle with platform-tools (adb).](#guide-quick-start?android-adt-bundle) - Tools to let other programs on your computer interface with your device.

<a name="usb-drivers"></a>
#### USB Drivers
To install the drivers for that device. Usually this is done by simply plugging the device into the machine. Most of the time, the device driver will install automatically and you'll be good to go. If not, you'll need to download the drivers for that device. To get the drivers for your device, you'll need to find the device page on [motorolasolutions.com](http://www.motorolasolutions.com/). The best way to do this is enter your device's model number into the search bar at the top of the landing page. Once you have found your device, you should see a tab to download software. For instance, the drivers for the TC55 are [here](http://goo.gl/mjrqMM).

The page you want should look something like this:

![img](images/quick_start/quick-start-device-drivers-download.png)

<a name="android-adt-bundle"></a>
#### Android ADT Bundle
To get the ADT bundle, which includes the Android SDK, you can go [here](http://developer.android.com/sdk/index.html). You'll specify your build of Windows (32-bit or 64-bit) and agree to the terms and download the bundle. This will come as an archive and you'll need to extract it somewhere where you'll remember it as you'll need to refer to it later.

Once you have extracted all the files in the ADT bundle, you'll need to add the platform-tools path to your path environment variable so that Windows can access it without referring to the entire path each time you use it. To do this, open your environment variables settings: right-click "Computer" -> Properties -> "Advanced System Settings" -> "Environment Variables" button. The window should look similar to this.

![img](images/quick_start/quick-start-environment-variables-window.png)

In the lower part of the window, find the "Path" System variable, click on it, and click the "Edit" button. Now you'll need to add a semi-colon (;) and the path to your android "platform-tools" folder to this string.

For example:
if your platform-tools directory path is `C:\android\sdk\platform-tools`, you would add `;C:\android\sdk\platform-tools` to the end of the Path System variable.

Now you should be able to access the adb command from any directory using your command-prompt. To make sure that your device is setup and will interface with the EB Installer, connect your device via USB, ensure that USB debugging is enabled, open a command prompt (cmd.exe) and run the command:

	:::term
	$ adb devices

Which, if your device is setup correctly, you should see something like this:

![img](images/quick_start/quick-start-adb-devices-output.png)

Now that you have your android device connected to your computer through adb, you are ready to deploy the MEB onto your device using the Enterprise Browser Installer.

### Windows Mobile / Windows CE
To connect your Motorola WinMo/WinCE device to your computer, all you need to do is connect the device. Upon connecting your device, the drivers and mobile Device Center application should be installed, allowing you to connect to your device. Once the software installs, be sure to reboot your computer and your device to make sure there are no complications.

NOTE: Connecting your device to a USB 3.0 port will result in the device not being recognized by your computer. Be sure to connect the device to a USB 2.0 port.

With your device connected and recognized by the OS and the Mobile Device Center application, you should see something like this.

![img](images/quick_start/quick-start-mobile-device-center-connected.png)

Now that your device is connected and recognized by your computer, you are ready to deploy the MEB onto your device using the Enterprise Browser Installer.

### Enterprise Browser Installer
The Enterprise Browser Installer is an application that you will us in order to get the MEB onto your device. To acquire the installer, you'll need to download it [here]() and install it as you would any other Windows application. Once it is installed, launch the Enterprise Browser Installer and you should see something like this.

![img](images/quick_start/quick-start-eb-installer-platform-select.png)

Now, simply choose an installation of the MEB to deploy to your device and click the "Deploy" button.

For Android, you'll see a message asking you to make sure that your device is recognized by the `adb devices` command then, you should see something like this.

![img](images/quick_start/quick-start-deploying-android.png)

For Windows Mobile and Windows CE, you'll get a message asking if you would like to install to the default application installation directory, then you should see something like this.

![img](images/quick_start/quick-start-deploying-winmo.png)

NOTE: Once the Enterprise Browser is deployed to your device, it is recommended that you restart the device to properly generate any file / folder structures necessary for proper MEB operations.

## Licensing
TBD - Sunil to get licensing info for MEB

### Applying Your License

## Your App's Start Page
### Types of MEB Apps
The MEB will usually be used in one of three different but, related, scenarios:

1. Hosted Web App - You already have a web app hosted somewhere and you want the MEB to render it on your mobile device.
2. Local Web App - You have all your assets stored on your mobile device and want MEB to render these pages for use on your mobile device.
3. Hybrid local / hosted App - You have a web app hosted somewhere but some of the assets that your web app uses are stored locally on your device. You want the MEB to render these pages for use on your mobile device.

With any of these three scenarios, you will need to be able to edit the config.xml file that comes with the MEB. The config.xml resides on the device in a directory which is dependent on your device's OS:

* **Android** - /Android/data/com.motorolasolutions.enterprisebrowser/Config.xml
* **Windows Mobile / Windows CE** - \Program Files\Enterprise Browser\Config\Config.xml

NOTE: It is worth noting that, with most Windows Mobile / CE devices, you will have to copy the config.xml file to a location that is not on your device in order to modify it. Once your modifications are done, copy it back to your device and overwrite the old one.

### Setting Your App's Start Page
Whether your app is hosted, local, or both, you'll need to edit the line in the config.xml file that controls the start path of the MEB. in the config.xml you'll find the startPage value and this is what you'll need to change in order for your app to start where you want it to. For example, if I wanted my app to start at yahoo.com for some reason I would edit the startPage to look like this:

	:::xml
	<General>
		<Name value="Menu"/>
		<StartPage value="http://www.yahoo.com" name="Yahoo"/>
		<UseRegularExpressions value="1"/>
	</General>

If I were starting my app from a local page I would need to prepend the file path with file://. For instance:

	:::xml
	<General>
		<Name value="Menu"/>
		<StartPage value="file:///index.html" name="Menu"/>
		<UseRegularExpressions value="1"/>
	</General>

This address will cause the MEB to start my app at the index.html file located in my device's root directory.

NOTE: Notice that there are three forward-slashes in that address; the first two are for the file: protocol and the third specifies the root directory of the device.

## Your First MEB App
So let's create a very basic index page that we can launch from our MEB app.

### Create Your Start Page
Create a new file called index.html and use the contents below.

	:::html
	<body>
		<h1>My First MEB App</h1>

		<p>This is my first app and all it does right now is point to Google's homepage.</p>

		<a href="http://www.google.com">Click here to go to Google's homepage</a>
	</body>


Place this newly created file in your device's root directory.

### Set Your Start Page
Now change the startPage in your config.xml to:

	:::xml
	<StartPage value="file:///index.html" name="Menu"/>

### Start Your MEB App
<table>
	<tr>
		<td>Now start your MEB app and you should see something like this:</td>
		<td>
			<p>
			And when you click on the link (assuming you have an active<br>
			internet connection), you'll be navigated to Google's homepage.
			</p>
		</td>
	</tr>
	<tr>
		<td><img src="images/quick_start/quick-start-first-app-index.png"></td>
		<td><img src="images/quick_start/quick-start-first-app-google.png"></td>
	</tr>
</table>