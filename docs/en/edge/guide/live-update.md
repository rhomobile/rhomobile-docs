# Live Update
## Overview
Live Update is a **new feature in [RhoMobile Suite 5.1](http://rhomobile.com)** that instantly displays changes to many parts of a RhoMobile app on-device without the need to manually recompile and redeploy. This enables on-the-fly programming and debugging on multiple mobile devices at the same time. It supports Android, iOS, the Apple iOS simulator, and Windows Mobile/CE in any combination. 

Live Update works by monitoring files in the **/apps** and **/public** folders of your RhoMobile app and builds a complete or partial update bundle that can either deploy immediately or on command. Once notified of an update, the target device(s) download the bundle from the development host (on which Live Update embeds a web server), apply it and refresh the Webview to display the changes. Live Update works through RhoStudio or from the command line.

This guide provides an overview of the Live Update setup process from within RhoStudio's Project Explorer and text editor. Some of the steps also can be performed from the command line and/or using your favorite text editor.

##Live Update Modes
Live Update has four modes of operation: 

* **<u>Partial Update</u>** packages the portions of a project that have changed and notifies devices that a download is available. This on-command feature works only from the command line and must be initialized with '**rake dev:update:initialize**' before each debugging session. 

* **<u>Full Update</u>** packages all files in a project regardless of whether they've been changed and notifies devices. This on-command feature works only from the command line and does not require initialization.

* **<u>Auto Update</u>** monintors all files in a project and automatically packages the app and notifies devices every time changes are saved. This mode is invoked from the Live Update Settings page in RhoStudio and can be monitored from the Progress tab. Auto mode also can be started from the command line. 

* **<u>Build and Notify</u>** mode is intended for use when integrating Live Update with an external build system. This CLI-only feature is invoked with the '**rake dev:update:build_and_notify**' command. 

**Live Update receives change info from** two files stored in the project's root level:

* `upgrade_package_add_files.txt` lists the project's new or modified files
* `upgrade_package_remove_files.txt` lists files removed from the project


##Requirements
**Live Update works only on 'RhoElements' apps built with [RhoMobile Suite 5.1](http://rhomobile.com)** or higher. 

###Live Update is supported on:

* Mac OS X development hosts<br>
* Windows development hosts (currently in beta)<br>
* Android<br>
* iOS<br>
* Apple iOS simulator<br>
* Windows Mobile/CE<br>
* **Apps created with the RhoElements option box checked**

###Live Update is *not* supported on:

* RhoSimulator<br>
* Android emulators<br>
* Apps built on RhoMobile.com (formerly Rhohub)<br>
* Deployed apps lacking the “development” extension<br>
* Apps with [build: "release"] in their `build.yml` file<br>
* Apps built without the RhoElements option box checked

###Live Update acts on changes to:

* HTML<br>
* CSS<br>
* JavaScript<br>
* Ruby<br>
* Embedded Ruby<br>
* Images<br>
* Other files in **/app** and **/public** folders (only)<br>

## Enable Live Update
###Quick Steps:
Here's a quick overview of the steps required to enable Live Update on a new or existing RhoElements app. Detailed instructions follow. 

1. Confirm that `build.yml` contains the line **'build: debug'**<br> 
2. **Add '- development' to extensions:** line in `build.yml`<br> 
3. Establish that **all devices are on same Wi-Fi subnet** as dev host<br> 
4. **Build, deploy and launch** app(s) to device(s)*<br> 
5. In Project Explorer, R-click project name and **view 'Live Update Settings'**<br> 
6. In upper section of Settings, **double-click subnet** to discover device(s)<br>
7. In Project Explorer, **R-click project and select 'Refresh'**. The file `dev-config.yml` will appear in project<br>
8. **Open `dev-config.yml` with text editor and add 'refresh: 1'** (not indented) after device section(s) to enable Live Update for all<br>
9. In Live Update Settings, **press "Enable Live Update" button**

**An update will occur each time a file is saved, placed in or removed from the /app or /public folders**. If you're having trouble, refer to the detailed instructions or troubleshooting section.<br>

NOTE: The first Live Update in a session could take several minutes to appear; subsequent updates are generally faster.

######(*) A USB cable is required for initial application deployment; RhoStudio does not support deployment over Wi-Fi. 

##1- Modify the build.yml
Live Update works only with apps built with the RhoElements option box checked (see below). To confirm that your app is compatible, check for the line **app_type: "rhoelements"** in its `build.yml` file. 

>> IMAGE: 01_RhoElements_checkbox

After your app is built but **before it's deployed to the device**: 

* **Locate your project** in Project Explorer and expand its file tree
* **Right-click** the `build.yml` file and select **"Open With > Text Editor"**
* Confirm that `build.yml` **contains the line 'build: debug'** 
* **Locate the 'extensions:' line and add '- development' on a new indented line**

>>IMAGE: 02_Build.yml_extensions


##2- Establish a single Wi-Fi subnet

**Skip this step if your Wi-Fi network consists of a single subnet.**

After you build, deploy and launch your modified app, you'll need to discover your target device(s), which must be on the same Wi-Fi subnet as your development host. If they're not, change the IP address of the development host so that the first three figures of the IP address match those of the devices, and the fourth does not. This might require a call to your IT department. 

>> 04_Mac_Wi-Fi_prefs

The screenshot above shows the Network Preferences panel of Mac OS X after entering the Wi-Fi section, clicking the Advanced… button and selecting the TCP/IP tab. In the case, the machine's subnet is "10.186.6" and it's using DHCP. Clicking on the drop-down indicated by the arrow will permit "Using DHCP with manual address," which allows a user-assigned IP subnet to match that of the device(s).




##3- Build and Deploy the App

* From the **Run Menu**, select **>> Run Configurations**
* Above the **left pane** click the **New Configuration button** (see image below)
* **Enter a name** for your build configuration
* From the drop-downs, **select the relevant project, platform, simulator and build type**
* Check the 'Clean before build' box (only necessary for first-time builds or after the `build.yml` has beed edited)
* **Click the Run button** to build, deploy and run your app on the selected device 

>>IMAGE: 03_new_Build_config

NOTE: TIP: When you build an app for the first time, RhoStudio defaults to the prior app's build config, which could cause you to mistakenly re-build the last app you were working on. A good practice is to name your build config after the app it builds, and always confirm the selectedbuild config before clicking 'Run.'  
NOTE: A USB cable is required for initial application deployment; RhoStudio does not support deployment over Wi-Fi. 


##4- Discover Mobile Devices 


> Note: Step 4 also can be done from the command line; just make your project folder the default directory. 

The first time you send a Live Update to a device, it will take a minute or two. The next ones will be faster. 

**From the RhoStudio IDE**

1. Build and run your project. When the mobile application is launched correctly, it will show an alert with your IP address and a few controls.
  
    <img src="http://i.imgur.com/xSXh8yT.png" width="380" height="600" border="10" />

2. Open the Live update setting file inside of your Project explorer. This will display all of the found subnets. 
> Note: An iPhone that is in sleep mode or has the Live Update app minimized will not be discovered.

3. Double click on the subnet that you are using and RhoStudio will search that subnet for your device. If your device is found, it will appear in the list of found devices.
	
4. Once the device is found, you should see a `dev-config.yml` file inside of your project explorer. This contains a list of all found devices. If you do not see this file and your device was found, try right clicking your current project and hitting refresh.
	
5. Go into dev-config.yml and add the following line after the list of devices:

          :::term

		  refresh:1

  This will allow your web view to refresh when needed and to instantly reflect any changes made.

  > Note: Make sure this line is not indented, or dev-config.yml will assume that this is a characteristic of the particular device above.

**From the command line**

  1. Build and run your project

   For iOS Simulator:

        :::term

      rake run:iphone

  > Note: Running for iOS Simulator allows you to take advantage of Live Update just as well as running for an iOS Device, but an iOS device requires that you [manually install your application package from iTunes](http://docs.rhomobile.com/en/5.1.1/guide/build_ios)

   For Android:

        :::term

      rake run:android:device

   For Windows Mobile:

        :::term

      rake run:wm:device

  When the mobile application is launched correctly, it will show an alert with your IP address and a few controls.  
  <br>
  2. Run the command below to find all possible subnets to use:

    :::term
  	rake dev:network:discovery
  
  Alternatively, you can use this command to search for a specific subnet:

    :::term

  	rake dev:network:discovery["192.168.1.*"]

  You can list out all discovered subnets with the command:

    :::term

  	rake dev:network:list

  If several subnets are available, you must tell the script which subnet you wish to use.

  An iPhone that is in sleep mode or has the Live Update app minimized will not be discovered.  
  <br>
  3. Once the subnet of the device is found, you should see a dev-config.yml file inside of your project folder. This contains a list of all found devices.
  <br>
  <br>
  4. Go into dev-config.yml and add the following line after the list of devices:

		 refresh:1

  This will allow your web view to refresh when needed and to instantly reflect any changes made

<img src="http://i.imgur.com/A1ZdUep.png" width="680" height="600" border="10"/>

  > Note: Make sure this line is not indented or dev-config.yml will assume that this is a characteristic of the particular device above.

###5. Updating Your App
Live Update can be used to update the following types of files at run time:

* HTML 
* CSS
* Javascript
* .rb
* .erb
* image files

> Note: If you change a `.rb` file and apply the changes to a mobile application that uses Live Update, you will need to restart that application to view the changes.

These files most be in either your app folder or your public folder for Live Update to immediately notice the changes.

To edit these files at run time, make the desired changes to your files and then save. The changes should now show on your mobile device when and Update Method is running.

Live Update can run on, and send updates to, multiple devices at once as long as they are all in the list of found devices and all have the RhoMobile application running.

 If you wish to unsubscribe a particular device from receiving updates, simply go into dev-config.yml and change `enabled: 1` to `enabled: 0`

**After all of this is done, you are all set up and ready to start using Live Update and all of the features it provides**

NOTE: The first Live Update in a session could take several minutes to appear; subsequent updates are generally faster.

##Update Methods
---

**Options for Running Update Methods**

If you want to run the main update method, Auto Update, you can easily do this within RhoStudio with the click of a button.

If you would like more options, the command line offers an extended list of update methods that includes Auto Update, Partial Update, and Full Update. 

When running these commands from the command line, make sure your current directory is the project folder that you are working on or the commands will not work.


###Auto Update
This feature allows the automatic detection and display of changes. Any changes saved while Auto Update is running will immediately notify and be displayed on discovered mobile devices. You should use this feature when you want instant feedback on your changes and don't want to tell RhoStudio when to show changes. 

**Using From RhoStudio**

Simply go to the Live Update Settings tab which can be found under Project Explorer

Now click **Enable live update** and Auto Update should be up and running.

> Note: You can tell if Live Update is running by checking the Progress tab.

<img src="http://i.imgur.com/ST22AcD.png" width="680" height="600" border="10"/>

To end Live Update, go under the progress tab and find the line that says "live update is running". Click on the red square that is to the right and the process will end.

**Using From the Command Line**

You can enable Auto Update by typing the following command into your command line:
  
    :::term

	rake dev:update:auto

> Note: You will be notified when Auto Update is running by a message in your command line.

<img src="http://i.imgur.com/AFJDNPn.png" width="600" height="520" border="10"/>

To end Live Update, open a new window in your terminal and enter

    :::term  

    rake dev:update:auto:stop

You can alternatively go to the command line window that Live update is running in. Once you are there, go to your keyboard, hold down the `control` button, and then press `c`.


###Partial Update
The partial update method is useful when you want multiple changes to be shown at once rather than displaying them one by one. Partial Update allows you to deploy changes made to all discovered devices, but only when you specify it to do so.

**If this is your first time using this feature in an application, you are going to want to run the command:**

    :::term

	rake dev:update:initialize

Make any changes you like to your program and when your are ready to deploy them to your discovered mobile devices, type the following command into your command line:

    :::term

	rake dev:update:partial

> Note: The Partial Update bundle only includes changed files. If you did not change any files, discovered mobile devices will not receive any notifications.

###Full Update
The Full Update method is similar to Partial Update in that you specify when you want an update to be deployed to mobile devices. Unlike Partial Update, Full Update builds an update bundle with all the application's files, not just the changed files. This means it will notify all discovered devices whether or not changes are made.

You can use the Full Update feature by going into your command line and typing

    :::term

	rake dev:update:full

###Using Live Update with other building systems

Live Update provides a special command for building updates with external systems. Enter the following command in your command line if you wish to use Live Update with any external building systems:

      :::term

    rake dev:update:build_and_notify

When this command is run, a Partial Update bundle is built using the information from two files:

upgrade_package_add_files.txt - it contains list of changed or added files

upgrade_package_remove_files.txt - it contains list of removed files

The information added these files comes from inside of your current project folder, inside of `app/*` or `public/*`

###Using Live Update with applications that were built on different platforms

It possible to build an application on a host platform and use Live Update on another platform.
For example: you can build an application on a Mac OS for an iPhone, copy the app source code to a
Windows platform, and then start the Live Update process on a Windows machine. 

If you are going to do this, you must run the following command in your command line before your first Partial Update:

      :::term

    rake dev:update:full

This will detect the proper connections and pathways for the new host computer and update your code accordingly.

###Transitioning between apps that use Live Update
If you are going to take a break from working on one app that uses Live Update and plan on switching to another app that has Live Update, there are a few steps that you should take to ensure that Live Update will work smoothly in the other mobile application. 

1. Correctly Halt Live Update in the Original Application

**From RhoStudio**  
If you started Live Update from RhoStudio, then you are also going to end Live Update from RhoStudio. To do this, go under the progress tab and find the line that says "live update is running". Click on the red square that is to the right and the Live Update process will end.

  <img src="http://i.imgur.com/wmZObD0.png" width="600" height="520" border="10" />

**From the Command Line**  
If you started Live Update from the command line, you are going to end Live Update there as well. To do this, go to the command line window that Live update is running in. Once you are there, go to your keyboard, hold down the `control` button, and then press `c`. This will end the Live Update process.
&nbsp; <br> <br>
2. Start Live Update in New Application

   a. Rediscover Device in the New Application's Live Update Setting 

  Rediscover your mobile device the same way you discovered it originally, but make sure you are doing so in the new project's Live Update setting and not the original project's Live Update setting. 
  &nbsp; <br> <br>
   b. Check Dev-Config.yml to make sure the application property displays the correct application for the discovered device. 

  If the Dev-config.yml in your new project is displaying the right application, you have successfully switched between applications and are ready to start using Live update again.

##Serving HTTP requests  
Subscribed devices are passed bundles from a server via HTTP requests, which means it is necessary to launch a web server before you use any Live Update Methods. Live Update uses **Webrick** as a web server and checks to see if a webserver is running when ever you run a command that contains `dev:update`. If a server is not already running on Webrick, any of the dev:update commands will start a web server for you in a new command line window.

If you wish to, instead, start and stop the webserver manually, you can do so with the following:

**To Start Webserver**  
In a NEW command line window, enter

        :::term

    rake dev:webserver:start

**To Stop Webserver**  
In a NEW command line window, enter
   
        :::term

    rake dev:webserver:stop

> Note: Both your mobile application and The Live update server send messages using http based protocol. This is why the start of any update process launches an http server in a new command line window.

##Troubleshooting
---
If Live Update is not working for you, you may want to double check the following:

* Make sure your build.yml includes the development extension
* Connect your devices to the same subnet, and not just the same Wi-Fi.
* Check that your dev-config.yml file has the property `refresh:1` and that it is not indented.
* If the Update Methods aren't working, make sure you are in the directory where all your project files are located.

####About the Build.yml


* When a project is first created (but not yet built), the 'build' line in the `build.yml` file looks like this:<br>
sza

     :::xml
     build: debug
• After the first build, it looks like this: 


      :::xml
      build: "debug"

• Changing "debug" to "release" declares it a production build and removes the Live Update capability.

• Before your first build, your 'extensions' line should look like the one below. If it doesn't, you might have forgotton to check "Use RhoElements" box (seen above) when creating your project. 

**CORRECT**:
    :::xml

    extensions: 
    - rhoconnect-client
    - development

**INCORRECT**:
    :::xml

    extensions: ["rhoconnect-client"]
