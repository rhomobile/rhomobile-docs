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

_**Regarding Windows XP target support**: Qt 5.1.1.0 is the only Qt version supported for making RhoMobile apps with Visual Studio 2008 or 2012 that target Windows XP. Zebra has built Qt binaries from source to make them compatible with Windows XP and to support zlib, SSL, .png, .jpg, FreeType fonts, etc. If additional or different binaries are required for your app, please refer to Qt's documentation for [Configuring Options](http://doc.qt.io/qt-5/configure-options.html) and for [Building from Source](http://doc.qt.io/qt-5/windows-building.html)._

**Download the approproate version of Qt** based on your Visual Studio version and the target operating system: 

* **Qt 5.1.1.0 for Visual Studio 2008**<br>
To use Visual Studio 2008, [download Zebra's Qt 5.1.1.0 VS2008 binaries](http://rhomobile-suite.s3.amazonaws.com/Qt/Qt5-vs2008.7z), which are compiled from Qt source and linked against OpenSSL. These binaries can be used to make apps for Windows XP. 

* **Qt 5.1.1.0 for Visual Studio 2012**<br> 
To use Visual Studio 2012, [download Zebra's Qt 5.1.1.0 VS2012 binaries](http://rhomobile-suite.s3.amazonaws.com/Qt/Qt5-rhoxp.7z), which are compiled from Qt source and linked against OpenSSL. These binaries can be used to make apps for Windows XP. 

* **QT 5.5.0.0 for Visual Studio 2012**<br>
To use Qt 5.5.0.0 on Visual Studio 2012, [download the Qt 5.5.0.0 binaries](http://download.qt.io/official_releases/qt/5.5/5.5.0/qt-opensource-windows-x86-msvc2012-5.5.0.exe). Zebra has created OpenSSL libraries that implement the HTTPS protocol; they're included automatically when performing a production build (using the rake command below).

**Install the downloaded version of Qt and note the installation path**. 

###Add Qt binaries to the path

Open Control Panel » System » Advanced system settings » Environment Variables and then:

Create new (or update existing) system variable QTDIR = C:\Qt\Qt5-ssl (this will be the installation folder for the compiled Qt libraries)

Either close all command prompts and Visual Studio instances, or reboot the computer so the new settings take effect.

If you are using Qt 5.1.1.0 for Visual Studio 2008 then QTDIR should point to extracted content from here
http://rhomobile-suite.s3.amazonaws.com/Qt/Qt5-vs2008.7z

If you are using Qt 5.1.1.0 for Visual Studio 2012then QTDIR should point to extracted content from here
http://rhomobile-suite.s3.amazonaws.com/Qt/Qt5-rhoxp.7z

If you are using Qt 5.5.0.0 for Visual Studio 2012 then QTDIR should point to extracted content from here
http://download.qt.io/official_releases/qt/5.5/5.5.0/qt-opensource-windows-x86-msvc2012-5.5.0.exe


By default, the application is built with the most recent supported version of Visual Studio installed in the system (either 2012 or 2008). To explicitly specify the version of Visual Studio to use, add an `msvc` parameter to the `win32` section of your `build.yml`:

    :::yaml
    win32:
      msvc: 2012

* Specify either `2012` or `2008`

The size of a Win32 app installer can be optimized by excluding the Qt DLLs and/or Visual C runtime DLLs. Simply add one or both of the boolean parameters `deployqt` and `deploymsvc` to the `win32` section of your `build.yml` and exclude them as below:


    :::yaml
    win32:
      deployqt: 0
      deploymsvc: 0

The excluded Qt DLLs and/or VC runtime DLLs must still be installed separately on every PC that will be running your app. It is therefore recommended to use the Zebra build of the Qt binaries and thereby enable Zebra's RhoRuntimeQt installers, which automatically install all required Qt and Visual Studio Redistributable DLLs. For further details, please refer to [set up the build envorinment for Qt libraries](#setup-qt-build-environment) later in this document. 

Alternatively, Qt5 DLLs can be placed in a folder, the path to which must be added to the `PATH` environment variable (make sure there is no `QTDIR` environment variable defined).

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

<a name="build-for-windows-https"></a>
## How to enable HTTPS protocol

<a name="setup-qt-build-environment"></a>
### Setup the build environment for Qt libraries

* If Python 2.6 or 2.7 is not installed on your system, download and install [Python 2.7](http://www.python.org/ftp/python/2.7.6/python-2.7.6.msi) (16 Mb)
* If Perl 5 is not installed on your system, download and install [Perl 5.16](http://downloads.activestate.com/ActivePerl/releases/5.16.3.1603/ActivePerl-5.16.3.1603-MSWin32-x86-296746.msi)
* Make sure that Perl, Ruby and Python are present at the beginning of the `PATH` variable, e.g. `C:\Perl\bin;C:\Ruby\bin;C:\Python;...`
* Download the [Qt 5.1.1 source](http://download.qt-project.org/official_releases/qt/5.1/5.1.1/single/qt-everywhere-opensource-src-5.1.1.zip) (280 MB) and extract the archive, e.g. into `C:\Qt\Qt5-src` (rename `qt-everywhere-opensource-src-5.1.1` to `Qt5-src`)
* Download the [ICU 52.1 source](http://download.icu-project.org/files/icu4c/52.1/icu4c-52_1-src.zip) (24 MB) and extract the archive, e.g. into `C:\Qt\icu`

### Visual Studio 2012

First of all you may [download our build of the Qt binaries](http://rhomobile-suite.s3.amazonaws.com/Qt/Qt5-rhoxp.7z) that we use in our development process and in production builds of RhoSimulator. Exctract downloaded archive to `C:\Qt` (`Qt5-rhoxp` folder will be created) and set `QTDIR` system variable to `C:\Qt\Qt5-rhoxp`.

NOTE: You may use our precompiled binaries of Qt libraries for development and testing, but your production builds may require your own build of Qt libraries (you need to consult with Qt and OpenSSL license agreements to begin with).

So, if your application needs HTTPS or Windows XP compatibility, then you need to build the Qt libraries for Visual Studio 2012 as described below:

* Follow the instructions for [setting up the build environment for Qt libraries](#setup-qt-build-environment).
* Open Control Panel » System » Advanced system settings » Environment Variables and then:
    * Create new (or update existing) system variable `QTDIR` = `C:\Qt\Qt5-ssl` (this will be the installation folder for the compiled Qt libraries)
    * Either close all command prompts and Visual Studio instances, or reboot the computer so the new settings take effect.
* Open `C:\Qt\icu\source\allinone\allinone.sln` solution in Visual Studio 2012 and:
    * Agree to update all projects to VS2012 toolset
    * Select projects from `cal` down to `makeconv`, select Project -> Properties from top menu, select Configuration = "All Configurations", Platform = "Win32", go to Configuration Properties -> General, set "Visual Studio 2012 - Windows XP (v110_xp)" in Platform Toolset field, and click Apply
    * Select projects from `pkgdata` down to `uconv`, repeat the previous step, and close the Properties window
    * Select configuration `Release` with platform `Win32` in the toolbar and build the solution, close Visual Studio 2012 after build is finished

* Patch Qt source code to make it Windows XP compatible:
    * Open `C:\Qt\Qt5-src\qtbase\qmake\Makefile.win32` file in text editor and add `-D_USING_V110_SDK71_` option to `CFLAGS_BARE` variable (e.g. at line 44 after `-DUNICODE`)
    * Open `C:\Qt\Qt5-src\qtbase\mkspecs\win32-msvc2012\qmake.conf` and:
        * Add `-D_USING_V110_SDK71_` option to `QMAKE_CFLAGS` variable (line 24)
        * Change `QMAKE_LFLAGS_CONSOLE` variable (at line 72) to `/SUBSYSTEM:CONSOLE,5.01`
        * Change `QMAKE_LFLAGS_WINDOWS` variable (at line 73) to `/SUBSYSTEM:WINDOWS,5.01`

* Create `C:\Qt\Qt5-build` folder and in that folder create new `build.bat` file with the following content (change the paths according to your system setup and folders you have extracted the archives into):

      call "%VS110COMNTOOLS%..\..\VC\vcvarsall.bat" x86
      set CL=/MP /D_USING_V110_SDK71_ %CL%
      set PATH=%ProgramFiles(x86)%\Microsoft SDKs\Windows\v7.1A\Bin;%PATH%
      set PATH=%PATH%;C:\Qt\icu\bin;C:\Qt\Qt5-src\gnuwin32\bin
      set INCLUDE=%ProgramFiles(x86)%\Microsoft SDKs\Windows\v7.1A\Include;%INCLUDE%
      set INCLUDE=%INCLUDE%;C:\Qt\icu\include
      set LIB=%ProgramFiles(x86)%\Microsoft SDKs\Windows\v7.1A\Lib;%LIB%
      set LIB=%LIB%;C:\Qt\icu\lib
      mkdir qtbase\include\QtZlib
      copy C:\Qt\Qt5-src\qtbase\include\QtZlib\*.h qtbase\include\QtZlib
      mkdir qtbase\src\3rdparty\zlib
      copy C:\Qt\Qt5-src\qtbase\src\3rdparty\zlib\*.h qtbase\src\3rdparty\zlib
      call ..\Qt5-src\configure.bat -opensource -confirm-license ^
       -prefix C:/Qt/Qt5-ssl -debug-and-release -platform win32-msvc2012 -mp ^
       -icu -shared -c++11 -make libs -nomake tests -nomake examples -angle ^
       -qt-zlib -qt-libpng -qt-libjpeg -qt-freetype -openssl-linked ^
       -I <path-to-rhodes>/lib/extensions/openssl.so/ext/win32/include ^
       -L <path-to-rhodes>/lib/extensions/openssl.so/ext/win32/lib
      nmake
      nmake install
      nmake clean
      copy C:\Qt\icu\bin\icudt52.dll C:\Qt\Qt5-ssl\bin\
      copy C:\Qt\icu\bin\icuin52.dll C:\Qt\Qt5-ssl\bin\
      copy C:\Qt\icu\bin\icuuc52.dll C:\Qt\Qt5-ssl\bin\
      copy "%VS110COMNTOOLS%..\..\VC\bin\D3Dcompiler_46.dll" C:\Qt\Qt5-ssl\bin\

* Open Visual Studio 2012 Command Prompt. This is accomplished using `VS2012 x86 Native Tools Command Prompt` in Apps view of Windows 8 OS. To build Qt libraries run in Visual Studio 2012 Command Prompt:

      > C:
      > cd \Qt\Qt5-build
      > build.bat

  Be aware that it will take a while to build the Qt libraries from sources (maybe few hours or even a day).
* After the build process is completed exit Visual Studio 2012 Command Prompt

Now when you build your application the usual way, the HTTPS protocol support will be enabled automatically.

<a name="build-qt5-for-vs2008"></a>
### Visual Studio 2008

It's recommended to build Windows desktop applications with Visual Studio 2012. However if you can't use VS2012, then you need to use a custom build of the Qt libraries for Visual Studio 2008 (since there are no official binaries of Qt 5.1.1 libraries for VS2008).

First of all you may [download our build of the Qt binaries](http://rhomobile-suite.s3.amazonaws.com/Qt/Qt5-vs2008.7z) that we use in our development and testing process. Exctract downloaded archive to `C:\Qt` (`Qt5-vs2008` folder will be created) and set `QTDIR` system variable to `C:\Qt\Qt5-vs2008`.

NOTE: You may use our precompiled binaries of Qt libraries for development and testing, but your production builds may require your own build of Qt libraries (you need to consult with Qt and OpenSSL license agreements to begin with).

To build your own binaries of the Qt libraries for Visual Studio 2008:

* Follow the instructions for [setting up the build environment for Qt libraries](#setup-qt-build-environment).
* Install [Microsoft Windows Platform 7.1 SDK](http://www.microsoft.com/en-us/download/details.aspx?id=8279)
* Install [DirectX SDK](http://www.microsoft.com/en-us/download/details.aspx?id=6812)
* Install [Cygwin](http://cygwin.com/install.html), e.g. to `C:\Cygwin` (you will need it to compile ICU 52.1 libraries). Make sure you have installed `make`, `bash`, and `dos2unix`.
* Open Control Panel » System » Advanced system settings » Environment Variables and then:
    * Create new (or update existing) system variable `QTDIR` = `C:\Qt\Qt5-vs2008` (this will be the installation folder for the compiled Qt libraries)
    * Either close all command prompts and Visual Studio instances, or reboot the computer so the new settings take effect.
* Open Visual Studio 2008 Command Prompt. This is accomplished using Start » All Programs » Microsoft Visual Studio 2008 » Visual Studio Tools » Visual Studio 2008 Command Prompt. To build ICU 52.1 libraries run in Visual Studio 2008 Command Prompt:

      > set PATH=C:\Cygwin\bin;%ProgramFiles%\Microsoft SDKs\Windows\v7.1\Bin;%PATH%
      > set INCLUDE=%ProgramFiles%\Microsoft SDKs\Windows\v7.1\Include;%INCLUDE%
      > set LIB=%ProgramFiles%\Microsoft SDKs\Windows\v7.1\Lib;%LIB%
      > call "%VS90COMNTOOLS%..\..\VC\vcvarsall.bat" x86
      > cd \Qt\icu\source
      > dos2unix *
      > dos2unix -f configure
      > bash ./runConfigureICU Cygwin/MSVC --prefix=/cygdrive/c/Qt/Qt5-icu
      > make
      > make check
      > make install

  * After the build process is completed exit Visual Studio 2008 Command Prompt. The ICU 52.1 libraries are now installed to `C:\Qt\Qt5-icu`, so you may safely delete `C:\Qt\icu` folder.
* Create `C:\Qt\Qt5-build` folder and in that folder create new `build.bat` file with the following content (change the paths according to your system setup and folders you have extracted the archives into):

      call "%VS90COMNTOOLS%..\..\VC\vcvarsall.bat" x86
      set CL=/MP %CL%
      set PATH=%ProgramFiles%\Microsoft SDKs\Windows\v7.1\Bin;%PATH%
      set PATH=%PATH%;C:\Qt\Qt5-icu\bin;C:\Qt\Qt5-src\gnuwin32\bin
      set INCLUDE=%ProgramFiles%\Microsoft SDKs\Windows\v7.1\Include;%INCLUDE%
      set INCLUDE=%INCLUDE%;C:\Qt\Qt5-icu\include
      set LIB=%ProgramFiles%\Microsoft SDKs\Windows\v7.1\Lib;%LIB%
      set LIB=%LIB%;C:\Qt\Qt5-icu\lib
      mkdir qtbase\include\QtZlib
      copy C:\Qt\Qt5-src\qtbase\include\QtZlib\*.h qtbase\include\QtZlib
      mkdir qtbase\src\3rdparty\zlib
      copy C:\Qt\Qt5-src\qtbase\src\3rdparty\zlib\*.h qtbase\src\3rdparty\zlib
      call ..\Qt5-src\configure.bat -opensource -confirm-license ^
       -prefix C:/Qt/Qt5-vs2008 -debug-and-release -platform win32-msvc2008 -mp ^
       -icu -shared -c++11 -make libs -nomake tests -nomake examples -angle ^
       -qt-zlib -qt-libpng -qt-libjpeg -qt-freetype -openssl-linked ^
       -I <path-to-rhodes>/lib/extensions/openssl.so/ext/win32/include ^
       -L <path-to-rhodes>/lib/extensions/openssl.so/ext/win32/msvc2008/lib
      nmake
      nmake install
      nmake clean
      copy C:\Qt\Qt5-icu\bin\icudt52.dll C:\Qt\Qt5-vs2008\bin\
      copy C:\Qt\Qt5-icu\bin\icuin52.dll C:\Qt\Qt5-vs2008\bin\
      copy C:\Qt\Qt5-icu\bin\icuuc52.dll C:\Qt\Qt5-vs2008\bin\

* Open Visual Studio 2008 Command Prompt again. This is accomplished using Start » All Programs » Microsoft Visual Studio 2008 » Visual Studio Tools » Visual Studio 2008 Command Prompt. To build Qt library run in Visual Studio 2008 Command Prompt:

      > C:
      > cd \Qt\Qt5-build
      > build.bat

  Be aware that it will take a while to build the Qt libraries from sources (maybe few hours or even a day).
* After the build process is completed exit Visual Studio 2008 Command Prompt

Now when you build your application the usual way, the HTTPS protocol support will be enabled automatically.


