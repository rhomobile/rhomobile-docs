# Live Update
---

## Overview
---
Live Update is a **new feature** in [RhoMobile Suite 5.1](http://docs.rhomobile.com/en/edge) that enables users to program and debug on the fly, allowing any changes made to instantly display on discovered mobile devices.

Live Update watches for changes in the source code of your application. Each time an application file gets changed, the Live Update builds an update bundle and notifies discovered mobile device about it. The application on the discovered mobile device downloads the update package from the server, applies it, and then refreshes the web view to show the latest changes. Extended access to Live Update API is available from the command line.

This guide is designed to provide an overview of the steps necessary to quickly and easily enable and use Live Update in a RhoMobile application. 

##Requirements
---
Live Update is supported on the following platforms and devices:
* Mac OS
* Windows OS
* iOS
* Android
* Windows Mobile

Note: Live Update is not supported by Android emulators and applications with the “development” extension cannot be built on Rhohub.com.

## Enabling Live Update
---
NOTE: This feature is available only during development time and is removed automatically in a production build

###1. Make Sure You Have Version 5.1 or Greater of RhoStudio
Live Update will not work properly and will not display the **Live update setting** file if you do not have the proper version of RhoStudio.

###2. Add Necessary Extensions
**To enable Live Update in your application, you must include the following extension in your build.yml:**

    :::ruby

    extensions: ["development"]


###3. Connecting your computer and mobile devices to the same network
Any device with an application that uses Live Update must be connected to the same Wi-Fi and subnet as your computer. If your computer and mobile device are connected to the same Wi-Fi, but not the same subnet, you can go into network preferences and then into advanced options and manually configure your IP address to have the same subnet as your mobile device. If you are unsure what to make the IP address, giving your computer an address that is one or two numbers away from you mobile device's IP should provide the same subnet. If this still does not work, someone else is most likely using that IP address and you should try a different IP.

###4. Discovering Your Mobile Devices 
Note: Step 4 can be done from both the command line and the RhoStudio IDE

**From the RhoStudio IDE**

  1. Build and run your project. When the mobile application is launched correctly, it will show an alert with your IP address and a few controls.
  <img src="http://i.imgur.com/xSXh8yT.png" width="380" height="600" border="10" />
	
  2. open the **Live update setting** file inside of your **Project explorer**. This will display all of the found subnets. 
  Note: An iPhone that is in sleep mode or has the Live Update app minimized will not be discovered.

  3. Double click on the subnet that you are using and RhoStudio will search that subnet for your device. If your device is found, it will appear in the list of found devices.
	
  4. Once the device is found, you should see a **dev-config.yml** file inside of your project explorer. This contains a list of all found devices. If you do not see this file and your device was found, try right clicking your current project and hitting refresh.
	
  5. Go into dev-config.yml and add the following line after the list of devices:

          :::term

		  refresh:1

  This will allow your web view to refresh when needed and to instantly reflect any changes made.

  NOTE: Make sure this line is not indented, or dev-config.yml will assume that this is a characteristic of the particular device above.

**From the command line**

  1. Build and run your project

  For iPhones:

        :::term

      rake run:iphone

  For Android:

        :::term

      rake run:android

  For Windows Mobile:

        :::term

      rake run:wm:device

When the mobile application is launched correctly, it will show an alert with your IP address and a few controls.
	
  2. Run the command below to find all possible subnets to use:

    :::term
  	rake dev:network:discovery
  
  Alternatively, you can use this command to search for a specific subnet:

    :::term

  	rake dev:network:discovery[“192.168.1.*”]

  You can list out all discovered subnets with the command:

    :::term

  	rake dev:network:list

  If several subnets are available, you must tell the script which subnet you wish to use.

  Note: an iPhone that is in sleep mode or has the Live Update app minimized will not be discovered.
	
  3. Once the subnet of the device is found, you should see a **dev-config.yml** file inside of your project folder. This contains a list of all found devices.
	
  4. Go into dev-config.yml and add the following line after the list of devices:

		refresh:1

  This will allow your web view to refresh when needed and to instantly reflect any changes made

<img src="http://i.imgur.com/A1ZdUep.png" width="680" height="600" border="10"/>

  NOTE: Make sure this line is not indented or dev-config.yml will assume that this is a characteristic of the particular device above.

###5. Updating Your App
Live Update can be used to update the following types of files at run time:

* HTML 
* CSS
* Javascript
* .rb
* .erb

To edit these files at run time, make the desired changes to your files and then save. The changes should now show on your mobile device when and Update Method is running.

Live Update can run on, and send updates to, multiple devices at once as long as they are all in the list of **found devices** and all have the RhoMobile application running.

 If you wish to unsubscribe a particular device from receiving updates, simply go into **dev-config.yml** and change **enabled: 1** to **enabled: 0**

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

Simply go to the **Live Update Settings** tab which can be found under **Project Explorer**

Now click **Enable live update** and Auto Update should be up and running.

Note: You can tell if Live Update is running by checking the Progress tab.

<img src="http://i.imgur.com/ST22AcD.png" width="680" height="600" border="10"/>

**Using From the Command Line**

You can enable Auto Update by typing the following command into your command line:
  
    :::term

	rake dev:update:auto

Note: You will be notified when Auto Update is running by a message in your command line.

<img src="http://i.imgur.com/AFJDNPn.png" width="600" height="520" border="10"/>

###Partial Update
The partial update method is useful when you want multiple changes to be shown at once rather than displaying them one by one. Partial Update allows you to deploy changes made to all discovered devices, but only when you specify it to do so.

**If this is your first time using this feature in an application, you are going to want to run the command:**

    :::term

	rake dev:update:initialize

Make any changes you like to your program and when your are ready to deploy them to your discovered mobile devices, type the following command into your command line:

    :::term

	rake dev:update:partial

NOTE: The Partial Update bundle only includes changed files. If you did not change any files, discovered mobile devices will not receive any notifications.

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

upgrade_package_remove_files.txt - it contains list of removed files.

###Using Live Update with applications that were built on different platforms

It possible to build an application on a host platform and use Live Update on another platform.
For example: you can build an application on a Mac OS for an iPhone, copy the app source code to a
Windows platform, and then start the Live Update process on a Windows machine. 

If you are going to do this, you must run the following command in your command line before your first Partial Update:

      :::term

    rake dev:update:full

This will detect the proper connections and pathways for the new host computer and update your code accordingly.

##Troubleshooting
--
If Live Update is not working for you, you may want to double check the following:

* Make sure your build.yml includes the **development** extension
* Connect your devices to the same subnet, and not just the same Wi-Fi.
* Check that your dev-config.yml file has the property **refresh:1** and that it is not indented.
* If making changes gives your mobile device a notification that says **Error when update Bundle**, check inside of dev-config.yml and make sure that the **application** setting under your device is using the current application you are developing for. If it is not, then you can type in the correct application name to fix it. 
* If the Update Methods aren't working, make sure you are in the directory where all your project files are located.