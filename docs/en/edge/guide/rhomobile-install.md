# Install RhoMobile Suite
The RhoMobile installer places the Rhodes open-source development framework and the RhoStudio (Eclipse) IDE on the development host system. Also included are Zebra's RhoConnect and RhoElements components. These optional modules can be used to create apps that connect and sync with one or more back-end systems and/or that support Zebra's enterprise-grade devices. 

RhoMobile also depends on Java, Ruby, Git and other tools. Depending on the development host platform, these components are either installed automatically with the main suite or must be installed manually using the platform-specific processes below. **Please read and follow all instructions carefully for a trouble-free installation!**

## Windows (for 32- and 64-bit systems)
### STEP 1: Run the RhoMobile Suite Installer
[Download the RhoMobile Suite Installer for Windows](http://rhomobile.com/download/) and launch it. This will install Rhodes, RhoStudio, RhoConnect and RhoElements, we well as [Ruby](http://www.ruby-lang.org/en/) and [Redis](http://redis.io/) open source tools. 

Additional installers will automatically launch for [Git](https://github.com/) and [Node.js](https://nodejs.org/). Follow prompts and read and accept their respective open-source license agreements as appropriate. 

**NOTE: During installation, certain virus detectors might warn about a "Suspicious.MLApp" security risk in the "rubyw.exe" file. This known false-positive can be safely ignored.<br>**

### STEP 1a: For Windows 8.1 Only
Since Windows 8.x lacks a Start Menu, a few extra steps are needed to make the RhoMobile launchers visible.

After running the RhoMobile installer in Windows 8.x, do the following:

* Go to the "Start Screen" of Windows 8 (aka "Metro") and right-click at the bottom of the screen until the App Bar appears (on Win8.1, the button should appear without right-clicking).

* Click the "All Apps" button to show all apps. Locate the "RhoMobile Suite" group (see image, below). Once installation is completed, you can run the desired RhoMobile launcher from there, or...

* Right-click the desired launcher and select "Pin to Taskbar." This will make it easy to access from the Desktop in the future. Repeat this action for other launchers and for links to Documentation and Developer Community, if desired.

<img src="http://rhomobile-suite.s3.amazonaws.com/install/RhoMobile_on_Win8.png" alt="RhoStudio on Win_8" />

NOTE: By default, the Windows 8 Desktop allows 32-bit applications only. For running the 64-bit version of RhoStudio, see "Notes for 64-bit Windows Systems, below. Additional Windows settings also might be necessary. 

### STEP 2: Install the Java Development Kit
RhoStudio requires the Java Development kit, which is different than the Java that might already be present for browsers. Unless you're sure you already have the JDK, visit [Oracle's Java Developer Kit download page](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html) and select, download and install the version that's appropriate for your system.

## Notes for 64-bit Windows Systems
The 32- and 64-bit versions of RhoMobile are functionally equivalent, and there's no disadvantage to using the 32-bit RhoMobile suite on development hosts with 64-bit Windows. However, if you'd prefer to run the 64-bit version of RhoMobile on your 64-bit Windows machine, you'll need to manually download and install the 64-bit version of the Java development kit. 

*NOTE: The Java Development Kit is different than Java versions that might already be on your system for browsers.*

####To get the 64-bit JDK: 

* Visit visit [Oracle's Java Developer Kit download page](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html) and select, download and install the 64-bit Java version for Windows.
* To confirm the the JDK path, launch RhoStudio and go to Window>>Preferences>>RhoMobile. The "Java bin path" should be: **<tt>C:\Program Files\Java\jdk&lt;version number&gt;\bin</tt>**

### STEP 3: Launching RhoStudio

The RhoMobile installer for Windows places the following items in the Windows Start menu or Start Screen (Windows 8.x):

* Launchers for RhoStudio 32- and 64-bit editions
* A link to the Readme file
* Links to the [RhoMobile Developer Community](http://developer.motorolasolutions.com) and [RhoMobile Documentation](/home) sites
* A link to the RhoConnect Push Service files
* An uninstaller for RhoMobile Suite

NOTE: To run RhoStudio, you MUST USE THE RHOSTUDIO LAUNCHERS. Before building your first project, you'll be prompted to create a free account at http://rms.rhomobile.com. Just enter a valid email address and password. 

### Ruby
The RhoMobile Suite installer for Windows contains Ruby 1.9.3-p194. This version of Ruby is used for executing rake commands on the development host computer and for running RhoConnect applications.

Native applications built with RhoStudio use Ruby 1.9.2-p290 on the target device.


## Mac OS X

### *NOTE*

> The Mac OS X installation relies on Apple's XCode development environment and the corresponding Command Line Tools. If XCode is not already installed, please visit [Apple's developer download site](http://developer.Apple.com/downloads) and download and install the version appropriate for your system before proceeding. 

###The Mac OS X installation steps:<br>
#####`-->> This process requires administrator access and write permissions in all areas. <<-- `
`-->> Steps MUST be performed in the following order <<-- `<br>
#####0. Download and install XCode and corresponding Command Line Tools<br>
#####1a. Download RhoMobile Suite (.dmg) from [RhoMobile.com](http://rhomobile.com/download)<br>
#####1b. Copy RhoStudio to the development system's Applications folder `DO NOT LAUNCH!`<br>
#####2. Download and install the Java 6 SDK from Java.com (see link, below)<br>
#####3. Use Terminal to install Ruby Version Manager (RVM)<br>
#####4. Use RVM to install Ruby 1.9.3 (even if you have a newer version)<br>
#####5. Run the "install gems" Terminal script from the RhoMobile Suite .dmg
**OPTIONAL STEPS:** 
#####6. Run the "Install RhoConnect-push" Terminal script<br>
#####7. Set up native SDKs for specific target devices (Android, iOS)
<br>

#### Detailed instructions for Mac OS X Installations:

###STEP 1: Download and Copy RhoMobile Suite 
`-->> Steps MUST be performed in the following order <<-- `<br>

a. [**Download RhoMobile Suite**](http://rhomobile.com/download) disc image (a .dmg file) and double-click it. A window similar to the following will open: <br>

![img](http://rhodocs-images.s3.amazonaws.com/guide/RhoMobile_Installer_disc_image.png)

<br>
b. **Drag the RhoStudio icon to the Applications folder alias** (in the direction of the arrow). This will copy the suite's main executables and some other useful files to the Applications folder of the development Mac. DO NOT ATTEMPT TO LAUNCH RHOSTUDIO AT THIS TIME.

>Keep the RhoMobile Suite Installer .dmg handy; we'll refer to it again in STEP 5. 

### STEP 2: Install the Java Development Kit 
RhoStudio relies on desktop Java, which Apple stopped including with Mac OS X as of version 10.7 (Lion). RhoMobile supports JDK 6.0 and higher. Regardless of what you currently have, we recommend that you [**download the latest JDK** from Java.com](http://www.java.com/en/download/). This is different than the version of Java that might already be on your system for browsers. 

**Download and open the JDK .dmg, double-click the package within it and follow prompts to install the latest JDK.** 

### STEP 3: Install Ruby Version Manager (RVM) 
This step installs a tool called Ruby Version Manager (RVM) that we'll use to install Ruby 1.9.3. RhoStudio requires Ruby v1.9.3 and is not compatible with any other version, incuding the newer version (2.0) that comes with Mac OS X Mavericks and Yosemite. Fortunately, RVM makes it easy to switch between Ruby versions if need be.

**NOTE: Do not use `sudo` to install RVM; it can cause problems with file permissions when running bundle commands from within RhoStudio.<br>**

**To install RVM, open a Terminal* window and enter (or copy and paste) the following command at the `$` prompt:**

`\curl -sSL https://get.rvm.io | bash -s stable`<br>

This command securely downloads the latest stable version of RVM from the "get.RVM" web site. <br>

**Follow prompts and enter information as needed.** 

*Terminal is included with Mac OS X and is in the Applications folder. <br>
To launch Terminal directly:<br>
**Hit CMD-SPACE >> Type 'Term' >> Hit ENTER.** 

### STEP 4: Install Ruby 1.9.3
Now that you have RVM, you can use it to install Ruby 1.9.3 and some other useful stuff. Remember, RhoMobile requires Ruby 1.9.3 and will not work with other versions. This step will not effect existing Ruby version(s) on your Mac, but Ruby 1.9.3 will become the default. 

**Open a _NEW_ Terminal window and install Ruby 1.9.3 with the following command:** 

`rvm install 1.9.3`

**You also might be prompted to install [homebrew](http://brew.sh/).** If so, just hit ENTER to install it in the default `/user/local` directory. Respond to additional prompts as needed. This step may take a few minutes. 

**Once complete, verify that Ruby 1.9.3 is the default by entering this command:**

`ruby -v`

The result should be something similar to this:
`ruby 1.9.3p551 (2014-11-13 revision 48407) [x86_64-darwin14.0.0]`


### STEP 5: Install Ruby Gems

>Almost done! 

The final (required) step is to install Ruby gems. Gems are platform- and processor-specific Ruby apps and libraries that deliver much of the key functionality of the RhoMobile platform. Gems are copied from the installation disk image (.dmg) to your hard drive using a Terminal script included with the installer image.

**Double-click "Install gems" from the RhoMobile Suite Installer .dmg (below) introduced earlier.<br>**
A Terminal window will open.<br>

![img](http://rhodocs-images.s3.amazonaws.com/guide/RhoMobile_Installer_Install_gems.png)

**When prompted, select N to avoid using `sudo` to install gems.** This process might take a while; it copies several groups of gems.  

>**If you're given a choice similar to the one below, select option 1.** 

>![img](http://rhodocs-images.s3.amazonaws.com/guide/which_ruby.png)

**NOTE: If additional gems are needed in the future, do not use `sudo` to install them; it can cause problems with file permissions when running bundle commands from within RhoStudio.<br>**

**NOTE: In the unlikely event that you've mounted more than one disc image containing gems, it's important to unmount all except the current RhoMobile Suite version. Failure to do so might result in an improper installation.**<br>

>That's it! You've completed all the required steps to use your Mac and RhoMobile to develop cross-platform applications from a single code base!<br><br> 
**Before you close the installer image, you might want to copy the files labeled "Launchpad" and "RhoMobile Docs" (scroll down in the .dmg window if you can't see them).** These files contain links to the [RhoMobile developer community](https://developer.motorolasolutions.com/welcome) and [RhoMobile documentation](http://docs.rhomobile.com/) sites. 

>**NOTE: TO LAUNCH RHOMOBILE:** You MUST use one of the RhoMobile Launchers.** (Before building your first project, you'll be prompted to create a free account at [rms.rhomobile.com](http://rms./rhomobile.com). Just enter a valid email address and password). 

>![img](http://rhodocs-images.s3.amazonaws.com/guide/RhoMobile_launchers.png)<br><br>
> FYI: The 32- and 64-bit versions of RhoMobile are functionally equivalent. 


## TROUBLESHOOTING

>###PROBLEM (Win)
>"Failed to create the Java Virtual Machine"<br>

>**POSSIBLE CAUSE**<br>
>Insufficient memory

>**SOLUTION**<br>
>Reduce the size of the JVM heap:<br> 

>1) Use a text editor to open the file:<br><br>
`<RhoMobileSuiteDir>\rhostudio\win32.win32.x86_64\RhoStudio.ini`<br><br>
>2) Search for `-Xmx1024m`<br><br>
>3) Change it to `-Xmx512m`<br>

>This will halve the memory used by the Java Virtual Machine<br>

>###PROBLEM (Win)

>"Failed to load the JNI shared library..."<br>
>**POSSIBLE CAUSE**<br>
>Incompatibility between the RhoStudio launcher and the JDK version installed. 

>**POSSIBLE SOLUTIONS**<br>
>- Make sure the JDK and RhoStudio launcher match x86 vs. x64)  
>- Reinstall the JDK

>###PROBLEM (Win)
>RhoStudio fails to start and displays no message<br>
>**POSSIBLE CAUSE**<br>
>Attempting to launch 64-bit RhoStudio without 64-bit Java 

>**SOLUTION**<br>
Install 64-bit Java (see above)<br> 

>###PROBLEM (Win)
>RhoConnect applications don't work properly<br>

>**POSSIBLE CAUSE**<br>
>Spaces exist in the Workspace path

>**SOLUTION**<br>
>Go to **Window>>Preferences>>Startup and Shutdown>>Workspaces** and select a Workspace path that contains no spaces.<br>

>###PROBLEM (Mac OS X)

>"ERROR: Cannot Find Rhodes..."<br>

><FILE: cannot-find_rhodes.png> 

>**POSSIBLE CAUSE**<br>
>Failed to use one of the RhoStudio launcher scripts  

>**SOLUTION**<br>
>Launch with the "RhoStudio 32-bits" or "RhoStudio 64-bits script<br> 
>![img](http://rhodocs-images.s3.amazonaws.com/guide/RhoMobile_launchers.png)<br><br>
> FYI: The 32- and 64-bit versions of RhoMobile are functionally equivalent. 


### >>>-------> `THE REMAINDER OF DOC IS THIS UNDER CONSTRUCTION`

>###PROBLEM (Win)

>PROBLEM (Mac)<br>
>**problem description**

>**POSSIBLE CAUSE**<br>
>cause description   

>**SOLUTION**<br>
>solution description<br> 

<FILE: rhomobile-suite_RhoConnect_push.png> 



###STEP 6: Setting up RhoConnect (Optional)
RhoConnect is an optional add-on to the RhoMobile Suite that permits development of data-driven apps that can operate with or without a data connection. RhoConnect delivers synchronization and simple integration with enterprise back-end systems in the cloud, on premises or any combination of the two. 


**To install RhoConnect, launch "Install RhoConnect-push" from the RhoMobile SUite installer disc image. 

<FILE: rhomobile-suite_RhoConnect_push.png> 


It relies on Node.js. Node.js is installed along with the installation of the RhoMobile Suite, but you can also install it manually if you do not want to go through the entire installation process.

Go to the [Node.js website](http://nodejs.org/#), and download and install Node.js. Or you can enter the following command after you install Homebrew.

    :::term
    $ brew install node


Run "Install gems". A terminal window will open. Select suitable Ruby version and 'N' to use 'sudo' prefix for gem installation. Wait for the gems install process to complete.

Run "Install rhoconnect-push". A terminal window will open. Select whether to use 'sudo' prefix for installation. Wait for the rhoconnect-push install process to complete.

###STEP 7: Setting up Native SDKs (Optional)
If you plan to build native apps that target devices running Android, iOS or Windows Mobile, 



###Setting the JDK Path

If you have trouble with Java,

Go to RhoStudio>>Preferences>>RhoMobile and confirm or set the Java bin path as <tt>/System/Library/Java/JavaVirtualMachines/jdk&lt;version number&gt;.jdk/Contents/Home/bin</tt>.




Drag RhoStudio to the Applications folder.

> Note: RhoStudio has two launchers: RhoStudio 32-bit and RhoStudio 64-bit. Use the launcher suitable for your system.

### Understanding the Installer Contents
In addition to RhoStudio, the RhoMobile Suite Installer for Macintosh also contains:

* A folder containing a RhoElements application.
* A folder containing sample applications.
* A folder containing the RhoConnect Push Service files. You use these when you [set up the RhoConnect Push Service on your mobile device](../rhoconnect/push-client-setup-rps) to broker push messages between your RhoConnect server and your device.
* A folder containing the RhoElements Runtime files.
* A link to the [Developer Community](http://developer.motorolasolutions.com).
* A link to the RhoMobile documentation website.

### Git
The RhoMobile Suite installer for Macintosh does not install Git. Although you can develop without Git, it is a very useful tool, and is needed for RhoHub. You can install [Git on Mac](http://code.google.com/p/git-osx-installer/downloads/list?can=3).

Note: Installing RhoStudio as a plugin for Eclipse is currently disabled. RhoSimulator, which comes with RhoStudio for Mac and Windows, does not work with Linux.

## Next Step: Setup Native SDKs
If you are planning on building your RhoMobile application locally on your development machine you will need the SDKs for the platform you want to build your app on. These instructions are found [here](nativesdksetup).