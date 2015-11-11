# Build for Windows

## Introduction
This guide documents the use of Microsoft Visual Studio 2012 or 2008 to build RhoMobile apps for Windows desktop. That tool, as well as the RhoMobile Suite should be installed prior to starting this guide. Further, RhoMobile should be configured according to the [native SDK setup instructions](nativesdksetup#setup-for-windows-desktop) for building Windows applications.

RhoMobile Suite uses the Qt cross-platform application framework for building apps for Windows desktop. As of RMS 5.3, the following Qt versions are supported: 

* **Qt 5.5.0.0** (new in RMS 5.3)
* Qt 5.1.1.0 

NOTE: Qt 5.1.1.0 exhibits inconsistent behavior when a finger or stylus is used for input.

###Prerequisites

* [Microsoft Visual Studio](https://www.visualstudio.com/en-us/visual-studio-homepage-vs.aspx) 2012 or 2008
* [RhoMobile Suite 5.3](http://rhomobile.com/download/)
* RMS 5.3 [configured for native development](nativesdksetup#setup-for-windows-desktop)

## Setup
###Step 1- Download and install Qt

_**About Windows XP target support**: Qt 5.1.1.0 is the only Qt version supported for making RhoMobile apps with Visual Studio 2008 or 2012 that target Windows XP. Zebra has built Qt binaries from source to make them compatible with Windows XP and to support zlib, SSL, .png, .jpg, FreeType fonts, etc. These binaries are linked against OpenSSL and implement the HTTPS protocol. If additional or different binaries are required for your app, please refer to Qt's documentation for [Configuring Options](http://doc.qt.io/qt-5/configure-options.html) and for [Building from Source](http://doc.qt.io/qt-5/windows-building.html)._

1. **Create the directory `C:\Qt\Qt5-ssl`** on the development host.
2. **Download the appropriate version of Qt**: 
    * **To target Windows XP with Visual Studio 2008**, [download Zebra's Qt 5.1.1.0 VS2008 binaries](http://rhomobile-suite.s3.amazonaws.com/Qt/Qt5-vs2008.7z).
    * **To target Windows XP with Visual Studio 2012**, [download Zebra's Qt 5.1.1.0 VS2012 binaries](http://rhomobile-suite.s3.amazonaws.com/Qt/Qt5-rhoxp.7z).
    * **To target modern Windows versions with Visual Studio 2012**, [download Qt's 5.5.0.0 binaries](http://download.qt.io/official_releases/qt/5.5/5.5.0/qt-opensource-windows-x86-msvc2012-5.5.0.exe). _Note: In this scenario, Zebra OpenSSL libraries implement the HTTPS protocol, and are included automatically when performing a production build (using the rake command below)_.
3. **Extract (or install, for Qt's binaries) to the new directory**.

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

**At this point, the development host is ready to build**. 

###Step 4- Configure optimization, if desired
The size of a Win32 app installer can be optimized by excluding the Qt DLLs and/or Visual C runtime DLLs. Simply add one or both of the boolean parameters `deployqt` and `deploymsvc` to the `win32` section of your `build.yml` and exclude them as below:


    :::yaml
    win32:
      deployqt: 0
      deploymsvc: 0

The excluded Qt DLLs and/or VC runtime DLLs must still be installed separately on every PC that will be running your app. It is therefore recommended to use the Zebra build of the Qt binaries and thereby enable Zebra's RhoRuntimeQt installers, which automatically install all required Qt and Visual Studio Redistributable DLLs (see next section). 

Alternatively, Qt5 DLLs can be placed in a folder, the path to which must be added to the `PATH` environment variable (in which case the `QTDIR` system variable ahould be removed).

##RhoRuntime Qt Installers

RhoRuntime Qt Installers can optimize target memory footprint by installing a single  instance of Qt and Microsoft runtime libraries for access by multiple applications. This also can help reduce the size of the applications themselves.

* **[RhoRuntime for QT 5.1.1.0 Visual Studio 2008](http://rhomobile-suite.s3.amazonaws.com/Qt/RhoRuntimeQt5-VS2008Setup.exe)**
* **[RhoRuntime for QT 5.1.1.0 Visual Studio 2012](http://rhomobile-suite.s3.amazonaws.com/Qt/RhoRuntimeQt5-setup.exe)**
* **[RhoRuntime for QT 5.5.0.0 Visual Studio 2012](http://rhomobile-suite.s3.amazonaws.com/Qt/RhoRuntimeQt5.5.0.0_VS2012-Setup.exe)**

## Build application from the command line

To build and run the application issue command:

    :::term
    $ rake run:win32

To clean all temporary and binary files execute command:

    :::term
    $ rake clean:win32

## Create application installer for Windows

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

To build installer bundle use command:

    :::term
    $ rake device:win32:production 

There is separate rake command for Windows XP Embedded platform. To build installer bundle use command:

    :::term
    $ rake device:winxpe:production 

After the build process is finished you will find an installer bundle named:<br> 
 `<application-name>-setup.exe`<br>
 in the folder: <br>
 `<application-root>/bin/target/win32` 

## Logging

Rholog.txt is placed in `<Application folder>\rho`


