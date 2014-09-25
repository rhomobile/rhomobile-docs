# Build for Windows Phone 8

## Setup
Follow the instructions for [setting up the development environment](nativesdksetup#setup-for-windows-phone-8) for building Windows Phone 8 applications.

### Building Remotely
Alternatively, you can create the device builds remotely with RhoMobile hosted builds. Refer to our [remote build guide](../../hosted/guide/remote-build-guide) for more info.

## Application changes
    
* Add a productid GUID to application build.yml . For example:

        wp:
          productid: 632621d0-5ecb-012e-2c97-482a1411c191
NOTE: When you use the `rhodes app` command to generate an application, a productid is generated automatically

## Build and run using Rhodes gem

* Install Rhodes gem

* Run application simulator:

        $rake run:wp8

NOTE: You may use your computer keyboard with Windows Phone 8 emulator. By default it is disabled, but you can enable it pressing **PgUp** key. While it is enabled a device rotation simulation is not supported. To rotate device you need to disable keyboard support pressing **PgDown** key.  Look [MSDN page](http://msdn.microsoft.com/en-us/library/ff754352(v=vs.92).aspx) for much more details on this topic.

* Run application device:

        $rake run:wp8:device

* See log in application folder : rholog.txt

NOTE: When running on device you may need to disconnect USB cable from device to see log

* After Application code modifications, run rake commands. DO NOT close simulator!

## Build from sources
* Checkout rhodes source code from github 

## Build from IDE
### Rhodes
* Open `rhodes\platform\wp8\rhodes.sln` in VS 2013 or VS Express 2013 for Windows Phone.
* Select Debug or Release configuration, Windows Phone 8 Emulator target and build solution.
* Run emulator by pressing Start Debugging or Start Without Debugging
* After Application code modifications , build Rhodes solution and Start Debugging. DO NOT close emulator!
* See log in VS output console (Debug mode only)

## Building the application for the Windows Phone Store

### Setting your application name, icon and loading screen

You will need to provide a name and icon for the application that the user will see on the device. You can also customize the loading screen that is shown while your application is launching. Refer to the [Application Icon and Splash Screen](app_icon_splash) guide for detailed information.

### Turn off developer options

Update your application's configuration files to make sure developer / debug / profile options are turned off.

The below values can be used as a guide for `rhoconfig.txt`, skip any setting which is not already present.

    MinSeverity  = 3
    LogToOutput = 0
    net_trace = 0
    log_skip_post = 0
    
The below values can be used as a guide for `build.yml`, skip any setting which is not already present.

    profiler: 0 

### Creating your application package 

Once your `build.yml` is set up, you can run:

    :::term
    $ rake device:wp8:production
    
The compiled application .xap file will be located in `<your project folder>\bin\target\wp8`

### Deploying application to Windows Phone 8 device

To deploy application .xap file to WP8 device:

1. Windows Phone 8 device should be [registered for development](http://msdn.microsoft.com/en-us/library/windowsphone/develop/ff769508.aspx).
2. Connect WP8 device to your development Windows 8.x PC via USB
3. On the PC go to Start screen and search for `Application Deployment`
4. Run Application Deployment tool, specify Target=Device, select your XAP file and click Deploy.

## Publishing on Windows Phone Store

### Getting a Windows Phone Dev Center account

To publish your app on Windows Phone Store you need a [Dev Center account](http://dev.windowsphone.com/en-us/join).

### Uploading and Publishing your application

Publishing your application on Windows Phone Store is a simple two step process:

* First [create your app info](http://msdn.microsoft.com/library/windowsphone/help/jj206733%28v=vs.105%29.aspx). This includes information like pricing, application category (business, entertainment, etc.)

* Next [upload and describe your XAP](http://msdn.microsoft.com/en-us/library/windowsphone/help/jj206723%28v=vs.105%29.aspx). This includes details like the application description, icon and screenshots etc.

Refer to the [official docs](http://msdn.microsoft.com/en-us/library/windowsphone/help/jj206736%28v=vs.105%29.aspx) for all details about publishing to the Windows Phone Store.
