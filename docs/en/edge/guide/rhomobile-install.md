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

To get the 64-bit JDK: 

* Visit visit [Oracle's Java Developer Kit download page](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html) and select, download and install the 64-bit Java version for Mac OS X or Windows as appropriate for your system.
* To confirm the the JDK path, launch RhoStudio and go to Window>>Preferences>>RhoMobile. The "Java bin path" should be: **<tt>C:\Program Files\Java\jdk&lt;version number&gt;\bin</tt>**

#### Setting the JDK Path
Go to RhoStudio Preferences (Windows -> Preferences), select RhoMobile section and set the Java bin path. Set this path to JDK, such as <tt>C:\Program Files\Java\jdk&lt;version number&gt;\bin</tt> .

### STEP 3: Launching RhoStudio

The RhoMobile installer for Windows places the following items in the Windows Start menu or Start Screen (Windows 8.x):

* Launchers for RhoStudio 32- and 64-bit editions
* A link to the Readme file
* Links to the [RhoMobile Developer Community](http://developer.motorolasolutions.com) and [RhoMobile Documentation](/home) sites
* A link to the RhoConnect Push Service files
* An uninstaller for RhoMobile Suite

NOTE: You MUST USE RHOSTUDIO LAUNCHERS to run RhoStudio.

### Troubleshooting
**PROBLEM**<br>
RhoStudio fails to start and displays "Failed to create the Java Virtual Machine":

**POSSIBLE CAUSE**<br>
Your computer has insufficient memory.

**SOLUTION**<br>
Reduce the size of the JVM heap:<br> 

* Use a text editor to open the file: <tt>&lt;RhoMobileSuiteDir&gt;\rhostudio\win32.win32.x86_64\RhoStudio.ini</tt><br>
* Search for "<tt>-Xmx1024m</tt>"<br>
* Change it to "<tt>-Xmx512m</tt>"<br>

This will halve the memory used by the Java Virtual Machine. 
________________
**PROBLEM**<br>
RhoStudio fails to start and displays "Failed to load the JNI shared library...":

**POSSIBLE CAUSE**<br>
Incompatibility between the RhoStudiop launcher and the JDK version installed. 

**SOLUTION**<br>
- Make sure the JDK and RhoStudio launcher match in terms of x86 vs. x64.  
- Try reinstalling the JDK version.
________________
**PROBLEM**<br>
RhoStudio fails to start and displays no message. 

**POSSIBLE CAUSE**<br>
You're launching 64-bit RhoStudio without 64-bit Java installed. 

**SOLUTION**<br>
Follow instructions for installing 64-bit Java, above.<br> 

________________
**PROBLEM**<br>
RhoConnect applications don't work properly. 

**POSSIBLE CAUSE**<br>
Spaces exist in the Workspace path.

**SOLUTION**<br>
The Workspace is a local or network directory into which RhoStudio stores all project files. The existence of spaces in the Workspace path can cause applications to behave unpredictably. To correct this, go to **Window>>Preferences>>Startup and Shutdown>>Workspaces** and select a Workspace path that contains no spaces.

### Ruby
The RhoMobile Suite installer for Windows contains Ruby 1.9.3-p194. This version of Ruby is used for executing rake commands on the development host computer and for running RhoConnect applications.

Native applications built with RhoStudio use Ruby 1.9.2-p290 on the target device.


## Mac OS X
### Java Development Kit
RhoStudio requires Java Development Kit. For Mac OS 10.6 and earlier, the JDK is already installed. For Mac OS 10.7 and 10.8, Java is not automatically installed. Download the Java for Mac Installer from [Apple support](http://www.java.com/en/download/index.jsp) and install Java 6 or higher.

### Setup for Ruby
If you do not have Ruby Version Manager and Ruby 1.9.3 installed, you must install them.

On Macintosh, Ruby is already installed, but this version is outdated and isn’t compatible with RhoStudio. Install [Ruby Version Manager](https://rvm.io/) (RVM) into your home directory.

> Note: Do not use `sudo` when you install RVM: that can cause problems with file permissions when you run bundle commands within RhoStudio.

Install Ruby 1.9.3 with the following RVM command.

	:::term
	$ rvm install 1.9.3

### Setup for RhoConnect
On Macintosh, you need the following setup before redis is installed.

 * The `/usr/local` directory exists and is recursively writable by the current user.
 * The `/usr/local/etc/` directory exists and is recursively writable by the current user.

### Setup for Xcode, Command Line Tools, and homebrew

If you do not have the latest Xcode and command line tools, you need to install them. Install the latest [Xcode](https://developer.apple.com/xcode/).

Then install the command line tools: go to Xcode –> Preferences –> Downloads tab and install the "Command Line Tools."

Then install [Homebrew](https://github.com/Homebrew/homebrew) into `/usr/local`.

### Setup for RhoConnect Push

To use RhoConnect Push, you need to install Node.js. Node.js is installed along with the installation of the RhoMobile Suite, but you can also install it manually if you do not want to go through the entire installation process.

Go to the [Node.js website](http://nodejs.org/#), and download and install Node.js. Or you can enter the following command after you install Homebrew.

    :::term
    $ brew install node

### Download and Install
Download the latest [Motorola RhoMobile Suite Installer](http://rhomobile.com/download/) for Macintosh.

Click on the Motorola RhoMobile Suite Installer for Mac download file to open it. You will get a window similar to this:<br>
  <img src="http://rhodocs.s3.amazonaws.com/rhodes-devel/rhomobile-suite-mac-install-4.0.png" alt="RhoStudioInstaller Mac" />

> Note: Do not use `sudo` when you install the gems: that can cause problems with file permissions when you run bundle commands within RhoStudio.

Run "Install gems". A terminal window will open. Select suitable Ruby version and 'N' to use 'sudo' prefix for gem installation. Wait for the gems install process to complete.

Run "Install rhoconnect-push". A terminal window will open. Select whether to use 'sudo' prefix for installation. Wait for the rhoconnect-push install process to complete.

Drag Motorola RhoStudio to the Applications folder.

> Note: RhoStudio has two launchers: RhoStudio 32-bit and RhoStudio 64-bit. Use the launcher suitable for your system.

### Understanding the Installer Contents
In addition to RhoStudio, the Motorola RhoMobile Suite Installer for Macintosh also contains:

* A folder containing a RhoElements application.
* A folder containing sample applications.
* A folder containing the RhoConnect Push Service files. You use these when you [set up the RhoConnect Push Service on your mobile device](../rhoconnect/push-client-setup-rps) to broker push messages between your RhoConnect server and your device.
* A folder containing the RhoElements Runtime files.
* A link to the [Developer Community](http://developer.motorolasolutions.com).
* A link to the RhoMobile documentation website.

### Git
The RhoMobile Suite installer for Macintosh does not install Git. Although you can develop without Git, it is a very useful tool, and is needed for RhoHub. You can install [Git on Mac](http://code.google.com/p/git-osx-installer/downloads/list?can=3).

## Eclipse plugin, RhoSimulator
> Note: Installing RhoStudio as a plugin for Eclipse is currently disabled.

RhoSimulator, which comes with RhoStudio for Mac and Windows, does not work with Linux.

## Next Step: Setup Native SDKs
If you are planning on building your RhoMobile application locally on your development machine you will need the SDKs for the platform you want to build your app on. These instructions are found [here](nativesdksetup).