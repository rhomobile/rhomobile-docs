# Live Update
## Overview
Live Update is a **new feature in [RhoMobile Suite 5.1](http://rhomobile.com)** that instantly displays changes to many parts of a RhoMobile app on-device without the need to manually recompile and redeploy. This enables on-the-fly programming and debugging on multiple mobile devices at the same time. It supports Android, iOS, the Apple iOS simulator, and Windows Mobile/CE in any combination. 

Live Update works by monitoring files in the **/apps** and **/public** folders of your RhoMobile app and builds a complete or partial update bundle that can either deploy immediately or on command. Once notified of an update, the target device(s) download the bundle from the development host (on which Live Update embeds a web server), apply it and refresh the Webview to display the changes. Live Update works through RhoStudio or from the command line.

This guide provides an overview of the Live Update setup process from within RhoStudio's Project Explorer and text editor. **Once it's familiar, this process should require just a few minutes to complete**. Some of the steps also can be performed from the command line and/or using your favorite text editor.

##Live Update Modes
Live Update has four modes of operation: 

* **<u>Partial Update</u>** packages the portions of a project that have changed and notifies devices that a download is available. This on-command feature works only from the command line and must be initialized before each debugging session. Use this mode when you want to make multiple changes and see them applied on command instead of each time a file is saved.

* **<u>Full Update</u>** packages all files in a project regardless of whether they've been changed and notifies devices. This on-command feature works only from the command line and does not require initialization.

* **<u>Auto Update</u>** monintors all files in a project and automatically packages the app and notifies devices every time changes are saved. This mode is invoked by pressing the 'Enable Live Update' button in the Live Update Settings page in RhoStudio or using the CLI command below. It can be monitored and stopped from the Progress tab or using the CLI command below.

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
###Quick Setup:
Here's a quick overview of the steps required to enable Live Update on a new or existing RhoElements app. When setting it up for the first time, we recommend using the detailed instructions that follow. Once it's familiar, this process should require just a few minutes to complete using these quick-setup steps. 

1. Confirm that `build.yml` contains the line **'build: debug'**<br> 
2. **Add '- development' to extensions:** line in `build.yml`<br> 
3. Establish that **all devices are on same Wi-Fi subnet** as dev host<br> 
4. **Build, deploy and launch** app(s) to device(s)*<br> 
5. In Project Explorer, R-click and **view 'Live Update Settings'**<br> 
6. In upper section of Settings, **double-click subnet** to discover device(s)<br>
7. In Project Explorer, **R-click project and select 'Refresh'**. The file `dev-config.yml` will appear in project<br>
8. **Open `dev-config.yml` with text editor and add 'refresh: 1'** (not indented) after device section(s) to enable Live Update for all<br>
9. In Live Update Settings, **press "Enable Live Update" button**

**Following this process, an update will occur each time a file is saved, placed in or removed from the /app or /public folders**. If you're having trouble, refer to the detailed instructions or troubleshooting section below.<br>

NOTE: The first Live Update in a session could take several minutes to appear; subsequent updates generally occur after a few seconds.

######(*) A USB cable is required for initial application deployment; RhoStudio does not support deployment over Wi-Fi. 

##1- Modify the build.yml
This section contains detailed instructions for configuring Live Update on a development host. It follows the same general sequence as the Quick Setup above. 

Live Update works only on apps built with the RhoElements option box checked (as below). To confirm that your app is compatible, check for the line **app_type: "rhoelements"** in its `build.yml` file (as in the image that follows, below). 

![RhoElements Checkbox](http://rhodocs.s3.amazonaws.com/guide/LiveUpdate/01_RhoElements_checkbox.png)
<br>

###How to modify the Build.yml:
** *After* ** your app is <u>created</u> but ** *before* ** it's <u>built and deployed</u> to the device: 

* **Locate your project** in Project Explorer and expand its file tree
* **Right-click** the `build.yml` file and select **"Open With > Text Editor"**
* Confirm that `build.yml` **contains the line 'build: debug'** (quotes will be inserted automatically when it's built)
* **Locate the 'extensions:' line and add '- development' on a new indented line**
* **Save your changes** but ** *do not build yet* **

![Build.yml extensions](http://rhodocs.s3.amazonaws.com/guide/LiveUpdate/02_Build.yml_extensions.png)

##2- Establish Single Wi-Fi Subnet

**Skip this step if your Wi-Fi network consists of a single subnet (most common).**

Live Update requires that subscriber device(s) be on the same Wi-Fi subnet as the development host. That means that the first three figures of a device's IP address match those of every other device as well as those of the development host, and that the fourth figure does not. Setting this up it might require help from your IT department. 

To try it yourself: 

* **Open your devices' Wi-Fi control panel(s)** and verify that they're on the same subnet. 
* **Make a note** of the IP address(es)   
* **Change the IP address of the development host to match device(s)** 

![Mac OS X Wi-Fi prefs panel](http://rhodocs.s3.amazonaws.com/guide/LiveUpdate/04_Mac_Wi-Fi_prefs.png)

The screenshot above shows the **Network Preferences panel of Mac OS X** after entering the Wi-Fi section, clicking the Advanced… button and selecting the TCP/IP tab. In the case, the machine's subnet is "10.186.6" and it's using DHCP. Click on the drop-down (indicated by the arrow) and **select "Use DHCP with manual address**" to allow a user-assigned IP address that's in the same subnet as the target device(s).

NOTE: CAUTION: Manually editing IP addresses can lead to address conflicts and interruptions in service. We recommend consulting with IT before making changes.

##3- Build, Deploy and Run the App

* From the **Run Menu**, select **> Run Configurations**
* Above the **left pane** click the **New Configuration button** (see image below)
* **Enter a name** for your build configuration
* From the drop-downs, **select the relevant project, platform, simulator and build type**
* Check the 'Clean before build' box (only necessary for first-time builds or after the `build.yml` has beed edited)
* **Click the Run button** to build, deploy and run your app on the selected device 

NOTE: A USB cable is required for initial application deployment; RhoStudio does not support deployment over Wi-Fi. 

![Build.yml settings](http://rhodocs.s3.amazonaws.com/guide/LiveUpdate/03_new_Build_config.png)

NOTE: CAUTION: When bringing up the Run Configurations screen, RhoStudio opens the most recenly used build config, which could cause you to mistakenly re-build the last app you were working on. A good practice is to name your build config after the app it builds, and always to confirm the selected build config before clicking 'Run.'

When first launched, an app that has been properly modified for Live Update will display a message similar to the one below. The name of the example app is "Bloopy." 

<img src="http://rhodocs.s3.amazonaws.com/guide/LiveUpdate/05_DeviceSubscribed.png" width="380" height="600" border="10" />
#####Successful deployment of a Live Update-enabled app.

<br>
##4- Discover Devices, Begin Live Update Service 
This step establishes Wi-Fi communications between the development host and the device(s) that you want to receive Live Updates. After discovery, the dev host knows which devices to 'notify' of updates and the devices become 'subscribers' to an embedded web server page on the dev host for downloading update bundles. 

With the modified app(s) running on the device(s): 

1. In Project Explorer, R-click your project's **'Live Update Settings'** file
2. Select **Open With > Live Update Setting**
3. In Subnets section, **double-click the subnet** that contains the device(s) to be discovered
4. A list of devices ** *that are running your Live Update-enabled app* **will appear in the Found Devices section
5. **Click the "Enable Live Update" button**, which is above the Subnets section
6. In the Project Explorer pane, **R-click project and select 'Refresh'**. The file `dev-config.yml` will appear in the project. 
7. **Open `dev-config.yml` with the text editor and add 'refresh: 1'** (not indented) after the device section(s) to enable Live Update for all devices<br>


![dev-config.yml mods](http://rhodocs.s3.amazonaws.com/guide/LiveUpdate/06_dev-config.yml.png)
<br>

**Congratulations!** Your dev host and target device(s) are now ready to use Live Update. To test it, make an obvious change to any file in the app's **/app or /public folder** and save it. 

After a moment, your device(s) should display the change along with a  message like the one below. In this case, the app name was changed from Bloopy to "WorkerBee." 

<img src="http://rhodocs.s3.amazonaws.com/guide/LiveUpdate/09_AppUpdated.png" width="380" height="600" border="10" />
#####Successful deployment of an update bundle. 
<br>

NOTE: The first Live Update in a session could take several minutes to appear; subsequent updates generally occur after a few seconds.

##Notes about device and app behavior 

* Live Update works with multiple devices simultaneously, as long as they're among the discovered devices and have a Live Update-enabled app running.

* A device that goes to sleep between Live Updates might become unresponsive or display errors on subsequent updates. First try killing and re-starting its app(s). If that fails, uninstall and redeploy the app(s). 

* An iPhone that is in sleep mode or has the Live Update app minimized will not be discovered.

* To test apps for iOS, you must [manually install your app from iTunes](/guide/build_ios). 

* Changes to `.rb` files might require the app(s) to be killed and restarted.


##Troubleshooting
Here are some common problems and known issues of Live Update. If Live Update is not working for you, double-check the following first:

* Does your `build.yml` file include the development extension?
* Are your device(s) on the same Wi-Fi subnet as the dev host?
* Does the `dev-config.yml` file contain 'refresh:1 on a not-indented line?
* If CLI commands are not responding, have you set the directory to that of your project?
* Is "Live Update is running" displayed in the Progress tab?

###About Build.yml and Live Update

* When a project is first created (but not yet built), the 'build' line in the `build.yml` file looks like this:


      build: debug

* After the first build, it looks like this: 

    
      build: "debug"

<br>

* Changing "debug" to "release" declares a production build and removes the Live Update capability.

* Before (and after) your first build, your 'extensions' line should look like the **correct** one below. If it doesn't, you might have forgotton to check "Use RhoElements" box when creating your project.<br>

**CORRECT**:
    :::xml

    ...
    extensions: 
    - rhoconnect-client
    - development

**INCORRECT**:
    :::xml

    ...
    extensions: ["rhoconnect-client"]

###PROBLEM

>"ERROR when downloading or unpack[ing]"<br>

> <img src="http://rhodocs.s3.amazonaws.com/guide/LiveUpdate/10_Live_Update_fail_download_error.png" width="380" height="600" border="10" />

>**POSSIBLE CAUSE**<br>
>Network connectivity issue

>**SOLUTION**<br>
>Check that the device is on the same Wi-Fi subnet as the dev host; kill and re-launch the app; rebuild and redeploy the app.<br> 

###PROBLEM
>"Your application files too old"

> <img src="http://rhodocs.s3.amazonaws.com/guide/LiveUpdate/11_Live_Update_fail_FileTooOld.png" width="380" height="600" border="10" />

>**POSSIBLE CAUSE**<br>
>Mutiple files are out of sync between the dev host and the deployed app.

>**SOLUTION**<br>
>When using auto update mode, do not attempt to make changes to a file without first saving previous changes and seeing them updated on the device. This problem can sometimes be solved by "Refreshing" the app (R-clicking on the project name and selecting "Refresh") and applying an update with the full bundle. Otherwise, rebuild and redeploy the app. 

###PROBLEM
>"Error when update Bundle ... replace bundle ... unable to rename folder"<br>

> <img src="http://rhodocs.s3.amazonaws.com/guide/LiveUpdate/12_Live_Update_fail_unableToRename.png" width="380" height="600" border="10" />
 
>**POSSIBLE CAUSE**<br>
>This is a known issue in Live Update. 

>**Solution**<br>
> On the device, go to **Settings > Apps > (your app) ** and press the '**Clear data' and 'Clear cache**' buttons.  Then apply a **full update** or redeploy the app. 
<br>

##Live Update from the CLI

**1- Open a Terminal window and make your project the current directory**.  

**2- Discover devices on the current Wi-Fi subnet**:

<ABBR></ABBR>


    rake dev:network:discovery


  
If more than one subnet is present, you must specify which subnet to scan: 


    rake dev:network:discovery["192.168.1.*"]

If you don't know whether more than one subnet is available, display a list... 


    rake dev:network:list


...and then use the ':discovery["IP ADDRESS"]' command above to specify which subnet to scan for subscribers. 

**3- Select subscribers using the following commands**: 


For Android:
        

    rake run:android:device

For iOS:

          

    rake run:ios:device
   
   For Windows Mobile:

          

    rake run:wm:device

**4- To start the Webserver, open a new Terminal window, navigate to your project directory and enter**: 

        :::term

    rake dev:webserver:start

To Stop the Webserver  
   
        :::term

    rake dev:webserver:stop


**5- Select one of four Live Update modes of operation**:

* **<u>Partial Update</u>** packages the portions of a project that have changed and notifies devices that a download is available. This on-command feature works only from the command line and **must be initialized** before each debugging session. Use this mode when you want to make multiple changes and see them applied on command instead of each time a file is saved.
          rake dev:update:initialize
          rake dev:update:partial


* **<u>Full Update</u>** packages all files in a project regardless of whether they've been changed and notifies devices. This on-command feature works only from the command line and does not require initialization.

          rake dev:update:full 

* **<u>Auto Update</u>** monintors all files in a project and automatically packages the app and notifies devices every time changes are saved. This mode is invoked by pressing the 'Enable Live Update' button in the Live Update Settings page in RhoStudio or by using the CLI command below. It can be monitored or stopped from RhoStudio's Progress tab, by pressing CTRL-C in webserver window, or by using the CLI commands below.
          rake dev:update:auto
          rake rev:update:auto:stop

* **<u>Build and Notify</u>** mode is intended for use when integrating Live Update with an external build system and is a CLI-only feature. 
          rake dev:update:build_and_notify 

**Live Update receives change info from** two files stored in the project's root level:

* `upgrade_package_add_files.txt` lists the project's new or modified files
* `upgrade_package_remove_files.txt` lists files removed from the project

###Using Live Update with apps built on disparate platforms

It possible to build an application on one host platform and use it with Live Update on another. For example: an iOS application built on Mac OS X can be copied to
a Windows development host for use with Live Update. 

To do this, enter the following command on the second dev host before your first Partial Update:

      :::term

    rake dev:update:full

This will detect the connections and pathways for the new host computer and update your code accordingly.

###Switching between Live Update apps
If you're taking a break from working on one app that uses Live Update and starting work on another, follow these steps to make Live Update work smoothly:  

1. **Halt Live Update in the first app** by either pressing the square red stop button in RhoStudio's Progress tab, by executing the **rake dev:update:auto:stop** Terminal command from the project folder or by **pressing CTRL-C from the webserver window**
2. **Launch the second Live Update-enabled app** on the device(s) on which to test
3. Open the second app project in RhoStudio and **open its Live Update Settings window** 
4. **Discover the device** running the second Live Update-enabled app 
5. **Press "Enable Live Update" button** to start the Live Update service  
6. **Double-check the `dev-config.yml` file** for the correct app in its 'application:' line
