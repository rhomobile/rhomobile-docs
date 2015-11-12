# Build for Windows

## Introduction
This guide documents the use of Microsoft Visual Studio 2012 or 2008 to build RhoMobile apps for Windows desktop, including Windows XP and XP Embedded (XPE). Visual Studio is required to build apps that target Windows desktop and XPE, and along with the RhoMobile Suite should be installed prior to starting this guide. If RhoMobile is already installed, please also make sure that it's configured according to the [native SDK setup instructions](nativesdksetup#setup-for-windows-desktop) for building Windows apps.

Building apps for Windows also relies on the Qt cross-platform application framework. As of RMS 5.3, the following Qt versions are supported: 

* **Qt 5.5.0.0** (new in RMS 5.3)
* Qt 5.1.1.0 

NOTE: Qt 5.1.1.0 exhibits inconsistent behavior when a finger or stylus is used for input.

###Prerequisites

* [Microsoft Visual Studio](https://www.visualstudio.com/en-us/visual-studio-homepage-vs.aspx) 2012 or 2008
* [RhoMobile Suite 5.3](http://rhomobile.com/download/) (RMS 5.2 if only targeting Windows XP or XPE)
* RhoMobile [configured for native development](nativesdksetup#setup-for-windows-desktop)

## Setup
###Step 1- Download and install Qt

_**About Windows XP target support**: Qt 5.1.1.0 is the only Qt version supported for making RhoMobile apps with Visual Studio 2008 or 2012 that target Windows XP and XPE. Zebra has built Qt binaries from source to make them compatible with Windows XP and to support zlib, SSL, .png, .jpg, FreeType fonts, etc. These freely distributable binaries are linked against OpenSSL and implement the HTTPS protocol. If additional or different binaries are required for your app, please refer to Qt's documentation for [Configure Options](http://doc.qt.io/qt-5/configure-options.html) and [Building from Source](http://doc.qt.io/qt-5/windows-building.html)._

1. **Create the directory `C:\Qt\Qt5-ssl`** on the development host.
2. **Download the appropriate version of Qt**: 
    * **To target Windows XP/XPE with Visual Studio 2008**, [download Zebra's Qt 5.1.1.0 VS2008 binaries](http://rhomobile-suite.s3.amazonaws.com/Qt/Qt5-vs2008.7z).
    * **To target Windows XP/XPE with Visual Studio 2012**, [download Zebra's Qt 5.1.1.0 VS2012 binaries](http://rhomobile-suite.s3.amazonaws.com/Qt/Qt5-rhoxp.7z).
    * **To target modern Windows versions with Visual Studio 2012**, [download Qt's 5.5.0.0 binaries](http://download.qt.io/official_releases/qt/5.5/5.5.0/qt-opensource-windows-x86-msvc2012-5.5.0.exe). _Note: In this scenario, Zebra OpenSSL libraries implement the HTTPS protocol, and are included automatically when performing a production build (using the rake command below)_.
3. **Extract (or install Qt's binaries) to the directory** created in Step 1.1.

###Step 2- Add the QTDIR System Variable

&#49;. On the Windows Desktop, **right-click 'Computer' and select -> Properties**.

&#50;. **Select 'Advanced System Settings'** in the System Properties window.

&#51;. **In the 'Advanced' tab, click the 'Environment Variables' button** to bring up a window similar to the one below:

<img style="height:400px" src="../../..//images/SystemVariable.jpg"/>


&#52;. **Click the <u>lower</u> 'New...' button** to create a new System Variable. (If a variable called 'QTDIR' already exists, double-click to edit it).

&#53;. **Enter 'QTDIR' in the Variable name field**. 

&#54;. **Enter `C:\Qt\Qt5-ssl` in the Variable value field**. 

&#55;. **Click 'OK' to close the dialog** and OK again to close and save the setting. 

&#56;. **Restart the system** for changes to take effect. 

###Step 3- Select a Visual Studio version
**Skip to step 4 if only one version of Visual Studio is installed in the development host**. 

If more than one version of Visual Studio is installed, the system by default will build the application using the most recent supported version (2012 or 2008). To explicitly specify the version of Visual Studio to use, add an `msvc` parameter to the `win32` section of your `build.yml`:

    :::yaml
    win32:
      msvc: 2012

* Specify either `2012` or `2008`

####The development host is now ready to build. 

## Build from the command line

To build and run the application, execute the following command:

    :::term
    $ rake run:win32

To clean all temporary and binary files, execute the following command:

    :::term
    $ rake clean:win32

To build an installer bundle:

    :::term
    $ rake device:win32:production 

After the build process is finished you will find an installer bundle named:<br> 
 `<application-name>-setup.exe`<br>
 in the folder: <br>
 `<application-root>/bin/target/win32` 

## Build for Windows XP Embedded
The system requirements for building a RhoMobile app to target Windows XP Embedded are the same as those for Windows XP. The commands in this section can be executed after the development host has been configured starting with [Step 1 in the Setup section](#setup) above. 

###Prerequisites

* [RhoMobile Suite 5.2](http://rhomobile.com/download/) or higher [configured for native development](nativesdksetup#setup-for-windows-desktop)
* [Microsoft Visual Studio](https://www.visualstudio.com/en-us/visual-studio-homepage-vs.aspx) 2012 or 2008
* **Qt 5.1.1.0** for the version of Visual Studio being used

Clean out temporary and binary files by executing the following command:

        :::term
        $ rake clean:winxpe

Build an installer bundle:

        :::term
        $ rake device:winxpe:production 

After the build process is finished you will find an installer bundle named:<br> 
 `<application-name>-setup.exe`<br>
 in the folder: <br>
 `<application-root>/bin/target/win32` 

##Optimize the runtime (optional)
The size of a Win32 app installer can be optimized by excluding the Qt DLLs and/or Visual C runtime DLLs. Simply add one or both of the boolean parameters `deployqt` and `deploymsvc` to the `win32` section of your `build.yml` and exclude them by setting their values to 0, as below:


    :::yaml
    win32:
      deployqt: 0
      deploymsvc: 0

**Important**: Excluded Qt DLLs and/or VC runtime DLLs must still be installed on every PC that will be running your app. It is therefore recommended to use the Zebra build of the Qt binaries and thereby enable Zebra's RhoRuntimeQt installers (see next section), which automatically install all required Qt and Visual Studio Redistributable DLLs. 

Alternatively, Qt5 DLLs can be placed in a folder, the path to which must be added to the `PATH` environment variable, and the `QTDIR` system variable removed.

##RhoRuntime Qt Installers

RhoRuntime Qt Installers can optimize target memory footprint by installing a single  instance of Qt and Microsoft runtime libraries for access by multiple applications. This also can help reduce the size of the application itself.

* **[RhoRuntime for QT 5.1.1.0 Visual Studio 2008](http://rhomobile-suite.s3.amazonaws.com/Qt/RhoRuntimeQt5-VS2008Setup.exe)**
* **[RhoRuntime for QT 5.1.1.0 Visual Studio 2012](http://rhomobile-suite.s3.amazonaws.com/Qt/RhoRuntimeQt5-setup.exe)**
* **[RhoRuntime for QT 5.5.0.0 Visual Studio 2012](http://rhomobile-suite.s3.amazonaws.com/Qt/RhoRuntimeQt5.5.0.0_VS2012-Setup.exe)** (not compatible with Windows XP/XPE)

>>>>UNDER CONSTRUCTION

>>>>UNDER CONSTRUCTION

>>>>UNDER CONSTRUCTION

>>>>UNDER CONSTRUCTION

>>>>UNDER CONSTRUCTION

Install the RhoruntimeQt Installer for Visual Studio 2008 from here.
http://rhomobile-suite.s3.amazonaws.com/Qt/RhoRuntimeQt5-VS2008Setup.exe


This will install all necessary QT binaries in C:\RhoruntimeQt52008 
This folder location must be added to the Windows PATH environment and QT_PLUGIN_PATH also set.

Install Microsoft Visual C++ 2008 SP1 redistributable
http://www.microsoft.com/en-sg/download/confirmation.aspx?id=5582

Install the above application setup.

## Create an app installer (optional)

The Nullsoft Scriptable Install System (NSIS) is an open source platform for creating installation files for Windows apps. Follow these instructions to make an installer for your app: 

* Download and install the [NSIS installer tool](http://nsis.sourceforge.net/Download).

* Add path to the NSIS complier in your `rhobuild.yml` file, which is in the `\rhodes` folder:

On 32-bit platform:

    env:
      paths:
        nsis: C:/Program Files/NSIS/makensis.exe

On 64-bit platform:

    env:
      paths:
        nsis: C:/Program Files (x86)/NSIS/makensis.exe

### Readme, license and Icon
* To provide an Application License place the license in a file called `LICENSE.txt` in the root of application folder. This will be displayed on separate page during installation and allows the installer to accept the license.
* To provide a Readme file, place the readme text in a file called README.html in the root of application folder. It will be displayed by the installer when the installation concludes. 
* An Application Icon should be used for the Installer and the application executable (.exe)

## Logging

The application log 'Rholog.txt' is placed in `<Application folder>\rho`

##Switching Qt versions
RhoMobile applications can be built only with Visual Studio 2008 or Visual Studio 2012, and only with Qt 5.1.1.0 or Qt 5.5.0.0. If after following the steps above a different version of Qt is desired, follow these steps to make the switch:

1. Go to the Qt website and download and install the desired Qt version for Visual Studio 2008 or Visual Studio 2012.
2. Verify the Qt installation path. It should be something like: C:\Qt\<QtVersion>\<VSVersion>
3. Close RhoStudio and all command-prompt windows. 
4. Update or create a system variable called 'QTDIR' with the directory verified in Step 2. 
5. Update the `msvc` parameter in the `Build.yml` to reflect the desired Visual Studio version, if necessary.
6. Be sure the `deployqt` and `deploymsvc` parameters in the `build.yml` both contain a value of 0. 
7. Start building the application.
8. Prepare a target system for testing the newly built application (**which must not be the development host**):
    9. On the test target, install the Microsoft Visual C++ Runtime for 2008 or 2012 to coincide with the version being used for the build.
    10. Install the same Qt version on the target system as installed in Step 1, above.
    11. Add the installed Qt directory from Step 2 to the 'PATH' environment variable (use a semicolon to append to the end of the path).
    12. When the build finishes, copy the contents of `<application-root>/bin/target/win32/tmp` from the development host to the `C:\<application-root>` of the target. This is the newly built application. 
    13. Close any command-prompt windows that might be open on the target.
    14. Double click application on the target: C:\<application-root>\<Application>.exe.
15. Observe, test and explore the application with the new version of Qt.


