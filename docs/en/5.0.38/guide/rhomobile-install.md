# Install RhoMobile Suite
The RhoMobile Suite installer installs Rho products, such as Rhodes, RhoConnect, RhoElements, and RhoStudio.

## Windows 32-bit
### Ruby
RhoMobile Suite installer for Windows contains Ruby 1.9.3-p194. This Ruby is used for rake commands on the developer computer and to run RhoConnect applications.

RhoMobile Native applications use Ruby 1.9.2-p290. This Ruby is used on devices.

### Java Development Kit
Ensure that Java Development Kit is installed. The Sun JDK for Windows is available [here](http://java.sun.com/javase/downloads/index.jsp).

### Download and Install
Download and run the latest [Motorola RhoMobile Suite Installer](http://rhomobile.com/download/) for Windows. This installs the [Ruby stack](http://www.ruby-lang.org/en/), [Redis](http://redis.io/), Rhodes, RhoElements, RhoConnect and RhoConnect-Client packages.

**NOTE: If you use Symantec Antivirus it can warn about "Suspicious.MLApp" security risk in rubyw.exe file during installation. It is known false positive in Symantec antivirus.<br>Ignore this warning.**

**NOTE: Use Motorola RhoStudio 32-bit launcher to run RhoStudio.**

### Setting the JDK Path
Go to RhoStudio Preferences (Windows -> Preferences), select RhoMobile section and set the Java bin path. Set this path to JDK, such as <tt>C:\Program Files\Java\jdk&lt;version number&gt;\bin</tt> .

### Understanding the Windows Installation
Once you install Motorola RhoMobile Suite on Windows, you will see Motorola RhoMobile Suite on the Windows Start menu with the following options:

* A link to the [developer community](http://developer.motorolasolutions.com).
* A link to the [RhoMobile documentation](/home).
* A launcher for RhoStudio.
* A link to the readme file.
* A link to the RhoConnect Push Service files. You use these when you [set up the RhoConnect Push Service on your mobile device](../rhoconnect/push-client-setup-rps) to broker push messages between your RhoConnect server and your device.
* An uninstaller for RhoMobile Suite.

### Troubleshooting
RhoStudio doesn't start with message "Failed to create the Java Virtual Machine":

  Reduce JVM heap size. Likely your computer has not enough memory.<br>
  Open <tt>&lt;RhoMobileSuiteDir&gt;\rhostudio\win32.win32.x86_64\RhoStudio.ini</tt> file in editor.<br>
  Find "<tt>-Xmx1024m</tt>" line and change it to "<tt>-Xmx512m</tt>".<br>

## Windows 64-bit
### Ruby
RhoMobile Suite installer for Windows contains Ruby 1.9.3-p194. This Ruby used for rake commands on developer computer and to run RhoConnect applications.

RhoMobile Native applications use Ruby 1.9.2-p290. This Ruby used on devices.

### Java Development Kit
Ensure that Java Development Kit is installed. The Sun JDK for Windows is available [here](http://java.sun.com/javase/downloads/index.jsp). Install Windows x64 JDK or x86 JDK or both.

### Download and Install
Download and run the latest [Motorola RhoMobile Suite Installer](http://rhomobile.com/download/) for Windows. This installs the [Ruby stack](http://www.ruby-lang.org/en/), [Redis](http://redis.io/), Rhodes, RhoElements, RhoConnect and RhoConnect-Client packages.

**NOTE: If you use Symantec Antivirus it can warn about "Suspicious.MLApp" security risk in rubyw.exe file during installation. It is known false positive in Symantec antivirus.<br>Ignore this warning.**

### Setting the JDK Path
Go to RhoStudio Preferences (Windows -> Preferences), select RhoMobile section, and set the Java bin path. Set this path to the x86 JDK, such as <tt>C:\Program Files (x86)\Java\jdk&lt;version number&gt;\bin</tt> .

> Note: Use Motorola RhoStudio 64-bit to run RhoStudio with x64 JDK.<br/>Use Motorola RhoStudio 32-bit to run RhoStudio with x86 JDK.

### Understanding the Windows Installation
Once you install Motorola RhoMobile Suite on Windows, you will see Motorola RhoMobile Suite on the Windows Start menu with the following options:

* A link to the [developer community](http://developer.motorolasolutions.com).
* A link to the [RhoMobile documentation](/home).
* A launcher for RhoStudio.
* A link to the readme file.
* A link to the RhoElements Runtime files.
* A link to the RhoConnect Push Service files. You use these when you [set up the RhoConnect Push Service on your mobile device](../rhoconnect/push-client-setup-rps) to broker push messages between your RhoConnect server and your device.
* An uninstaller for RhoMobile Suite.

### Troubleshooting
* RhoStudio doesn't start, and a message appears: "Failed to create the Java Virtual Machine":

	Reduce JVM heap size. Likely your computer has not enough memory.<br>
	Open <tt>&lt;RhoMobileSuiteDir&gt;\rhostudio\win32.win32.x86_64\RhoStudio.ini</tt> file in editor.<br>
	Find "<tt>-Xmx1024m</tt>" line and change it to "<tt>-Xmx512m</tt>".<br>

* RhoStudio doesn't start, and a message appears: "Failed to load the JNI shared library...":

	Check compatibility between RhoStudio launcher and JDK version:<br>
	32-bit launcher is compatible with x86 JDK.<br>
	64-bit launcher is compatible with x64 JDK.

* Removing Spaces from the Workspace Path for RhoConnect Applications

	When you start RhoStudio, you set the location of the workspace directory. Set this path to a workspace directory that does not contain space symbols: if the path has spaces, a RhoConnect application created with RhoStudio will not work properly.

## Mac OS
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