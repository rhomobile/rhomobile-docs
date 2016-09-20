# Build for Windows Mobile
## Setup
Follow the instructions for [setting up the development environment](nativesdksetup#setup-for-windows-mobile) for building Windows Mobile applications.

> Note: When Building for Windows Mobile or Windows CE, it is necessary that you set `app_type: "rhoelements"` in your app's build.yml file as shown [here](build_config#buildyml-file).

## Add Paths to Cab Wizard and Visual Studio
In RhoStudio Windows -> Preferences, right-click on Rhomobile->Windows Mobile to show the rhobuild.yml preferences. Check that the Cab wizard path (which is contained in your Windows Mobile 6 SDK program installation) is correct.

<img src="http://rhodocs.s3.amazonaws.com/build-rhodes-app/preferences-windows-mobile-4.0.png"/>

Also check that the vcbuild path is shown in the rhobuild.yml file. The rhobuild.yml file is located in the RhoMobile folder (example location: `C:/RhoStudio/ruby/lib/ruby/gems/1.8/gems/rhodes-3.1.1`).

    :::yaml
    env:
      paths:
        vcbuild: C:/Program Files/Microsoft Visual Studio 9.0/VC/vcpackages/vcbuild.exe
        cabwiz: C:/Program Files/Windows Mobile 6 SDK/Tools/CabWiz

On 64-bit installations:

    :::yaml
    env:
      paths:
        vcbuild: C:/Program Files (x86)/Microsoft Visual Studio 9.0/VC/vcpackages/vcbuild.exe
        cabwiz: C:/Program Files (x86)/Windows Mobile 6 SDK/Tools/CabWiz

## Setup target SDK and emulator
By default 'Windows Mobile 6 Professional SDK (ARMV4I)' SDK and "Windows Mobile 6 Professional Emulator" are used. To change edit build.yml:

    :::yaml
    wm:
      sdk: <target_sdk>
      emulator: <target_emulator>

* 'target_sdk' may be:

  "MC3000c50b (ARMV4I)" - for Zebra CE devices. Install MC3000c50b PSDK from [Symbol support site](http://support.symbol.com)

  "Windows Mobile 6.5.3 Professional DTK (ARMV4I)" for latest Windows Mobile SDK.

* 'target_emulator' may be: "Windows Mobile 6.5.3 Professional VGA Emulator" for VGA emulator , or any other installed Windows Mobile emulator

## Building and Running Your Windows Mobile Application with RhoStudio
To start the build process, create a Run Configuration: select your project in the Project Explorer, and either:

* select Run->Run Configurations... from the main menu,
* or right-click on your project, and select Run As->Run Configurations from the pop-up menu.

<img src="http://rhodocs.s3.amazonaws.com/build-rhodes-app/run-configurations-menu-wm-4.0.png"/>

The Run Configurations window appears.

> Note: In the RhoStudio Run Configurations window, when you choose the Windows Mobile platform and any of the platform types (such as 6.0, 6.5.3, CE5.0), this platform setting overrides the SDK settings for Windows Mobile in the application build.yml file. This override does NOT affect RhoMobile Production Build, or using rake (without RhoStudio) to build and run a Windows Mobile app; these options use the Windows Mobile SDK settings in the build.yml file.

### Running on the Windows Mobile Simulator in RhoStudio
To run on the Windows Mobile simulator, select Windows Mobile in Platform and Simulator in Simulator type. Then click the Run button.

<img src="http://rhodocs.s3.amazonaws.com/build-rhodes-app/run-configurations-wm-4.0.png"/>

### Running on a Windows Mobile Device in RhoStudio
To run on a Windows Mobile device, connect your device to your computer with a USB cable.

In the Run Configurations window, select Windows Mobile in Platform, and Device in Simulator type.

## Build and Run from the Command Line
On computers without RhoStudio, you can build and run from the command line.

Navigate to your RhoMobile application directory. To build and run application on emulator, run:

    :::term
    $ rake run:wm

To build cab-file, install it, and run application on emulator, run:

    :::term
    $ rake run:wm:cab

Before you install the application on your Windows Mobile device, first connect your device via USB cable. Then check that your device is connected with ActiveSync on Windows XP or with Windows Mobile Device Center on Windows Vista or above.

Navigate to your RhoMobile application directory. To build and run application on device, run:

    :::term
    $ rake run:wm:device

> Note: Starting in version 4.1 of RhoElements, no .cab file is generated within the project when running rake run:wm:device

To build cab-file, install it, and run application on device, run:

    :::term
    $ rake run:wm:device:cab

After the build process completes, the device will ask you to install the app. Disconnect the USB cable from the device before you install.

## Build application cab-file for the device

    :::term
    $ rake device:wm:production

If you want the application to be signed automatically during the build process, please add the 'wmsign' key with full path to your code signing certificate to the 'build' section of rhobuild.yml file:

    :::yaml
    wmsign: <disk:/path/MySign.pfx>

You can find more information about Windows Mobile code signing at:
[http://msdn.microsoft.com/en-us/windowsmobile/dd569132.aspx](http://msdn.microsoft.com/en-us/windowsmobile/dd569132.aspx)

## Deploy application on device
First, connect your device to your computer. You can use USB-cable, bluetooth or any other method. To use computer internet, start ActiveSync or Windows Mobile Device Center.

You can use rake tasks to deploy the application. See the previous section, 'Build application from the command line.' The device should be connected via USB-cable.

Manually copy the .cab file to the device. For example, you can use the device File Explorer to display the .cab file that is on the computer. Click on that .cab file and the installation process will be started; after it is finished, you should see the app icon on your device in Programs.

### Allow DMA Connections
On Windows XP, open ActiveSync and open the File menu; on Windows Vista and above, open Windows Mobile Device Center and click Mobile Device Settings.

Select Connection Settings, then select the checkbox "Allow connections to one of the following."

Select "DMA" from the list box. DMA Connection is required to work with the Windows Mobile emulator.

### Debugging on Windows Mobile devices connected to PC
On Windows Vista and Windows 7 the Windows Mobile Device Center (WMDC) may start automatically upon connection of the WM device.
If it is not happening, then you're lucky and most probably you wouldn't need to do anything to be able to run and debug Rhodes application on the device
while it is connected to PC.

The problem is that WMDC locks the file system of the mobile device and prevents Rhodes application from running
(because the application usually writes data to files located within the application folder).
So if WMDC is starting when you connect the device to PC, you need to shutdown WMDC completely to be able to run Rhodes application
on Windows Mobile device.

To shutdown WMDC open the Task Manager, find wmdc.exe (Windows Device Mobile Center) and
WmdHost.exe (Windows Mobile Device Center Sync Host) processes and end them.

Then disconnect the device and connect it again to PC -- WMDC should not appear this time.
Now you may run and debug Rhodes applications on Windows Mobile devices connected to PC from both RhoStudio and command line.

## Build from Visual Studio IDE
Checkout the Rhodes source code from GitHub (you have this source code already if you installed RhoStudio).

Open `<source-code-root>\platform\wm\rhodes.sln` in Visual Studio (example location for <source-code-root>: `C:/RhoStudio/ruby/lib/ruby/gems/1.8/gems/rhodes-3.1.1`).

In Visual Studio, select Windows Mobile 6 Professional and build Release configuration.

Edit the file `rhobuild.yml` in the RhoMobile folder:

* Check that the path to Cabwiz is defined, for example, `C:/Program Files/Windows Mobile 6 SDK/Tools/CabWiz`.
* Define the path to your application folder.

Run

    :::term
    $ rake build:wm:devrhobundle

Make sure you cradle your emulator (menu Tools/Device Emulator Manager/Select Running Emulator/Actions/Cradle)

Copy `rhodes.exe` and `rhobundle` (located at `<source-code-root>\platform\wm\bin\win32\rhodes\Debug\rho`) created at the previous step to the device: `My Computer\Mobile Device` and folder in Program Files on that device (for example, `\Program Files\rhodes`). You can first delete the contents of `\Program Files\rhodes\rho` folder on your device if you want to ensure there are no old files left over.

If you changed your application, then recompile your application code by running the following command again, and copying `rhobundle` and `rhodes.exe` again:

    :::term
    $ rake build:wm:devrhobundle

If you changed your application and built it using rake tasks, then to compile your application:

    :::term
    $ rake device:wm

Copy `<your_app_directory>\bin\target\rhodes.cab` content to `\My Documents\` on your device or the emulator, execute that .cab to install the app, and then run the installed app to see the changes.

## Logging
To read the log file from the emulator or your device:

* Connect to the device or emulator using ActiveSync or Windows Mobile Device Center.
* Press explore on ActiveSync window, File Management on Windows Mobile Device Center.
* Navigate to `My Device\Program Files\<your_app_name>\rho\rholog.txt`

## Remarks
### Cab File Will Not Install
You may encounter an issue wherein your .cab file will fail to install on Windows CE devices and presents the error message:
> The file "<cab_file_name>" is not a valid Windows Embedded Compact Setup file.

If you receive this dialog you'll need to check the number of files located in your .cab file. The installation will fail if the number of files compressed in the .cab is more than 998 files. This is due to a limitation of .cab files on Windows CE as documented by Microsoft [here](http://support.microsoft.com/kb/839561).
