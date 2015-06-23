# Live Update
## Overview
Live Update is a **new feature in [RhoMobile Suite 5.1](http://rhomobile.com)** that instantly displays changes to many parts of a RhoMobile app on-device without the need to manually recompile and redeploy. This enables on-the-fly programming and debugging on multiple mobile devices at the same time. It supports Android, iOS (and Apple's iOS simulator) and Windows Mobile/CE in any combination. 

Live Update works by monitoring files in the **/apps** and **/public** folders of your RhoMobile app. watches for changes in the source code of your app and builds a complete or partial update bundle (based on your preference) and can either deploy it immediately or on command. Once notified of an update, the target devices download the bundle from the development host (on which Live Update embeds a web server), apply it and refresh the web view to display the latest changes. Live Update works equally well through RhoStudio or from the command line.

This guide provides an overview of the Live Update setup process. 

##Requirements
**Live Update apps must be built with [RhoMobile Suite 5.1](http://rhomobile.com)**. 

**Live Update is supported on**:<br>

* Mac OS X<br>
* Windows (currently in beta)<br>
* Android<br>
* iOS<br>
* Apple iOS simulator<br>
* Windows Mobile/CE<br>

**Live Update is *not* supported on**:<br>

* Android emulators<br>
* RhoSimulator<br>
* Apps built on RhoMobile.com (formerly Rhohub)<br>
* Deployed apps lacking the “development” extension<br>
* Apps with [build: "release"] in their `build.yml` file<br>

**Live Update acts on changes to**:<br>

* HTML<br>
* CSS<br>
* JavaScript<br>
* Ruby<br>
* Embedded Ruby<br>
* Images<br>
* Other files in /app and /public folders<br>

## Enable Live Update
###1. Make Sure You Have Version 5.1 or Greater of RhoStudio
Live Update will not work properly and will not display the **Live update setting** file if you do not have the proper version of RhoStudio.

###2. Add Necessary Extensions
**To enable Live Update in your application, you must include the following extension in your `build.yml`**

    :::ruby

    extensions: ["development"]


###3. Connecting your computer and mobile devices to the same network
Any device with an application that uses Live Update must be connected to the same Wi-Fi and subnet as your computer. If your computer and mobile device are connected to the same Wi-Fi, but not the same subnet, you can go into network preferences and then into advanced options and manually configure your IP address to have the same subnet as your mobile device. If you are unsure what to make the IP address, giving your computer an address that is one or two numbers away from you mobile device's IP should provide the same subnet. If this still does not work, someone else is most likely using that IP address and you should try a different IP.

###4. Discovering Your Mobile Devices 
> Note: Step 4 can be done from both the command line and the RhoStudio IDE

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
