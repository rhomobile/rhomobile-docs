# RhoElements Shared Runtime

If you have an existing application that is running from a web server, it is very easy to extend this application and provide RhoElements functionality. Beyond the standard HTML5 features that may be utilized, RhoElements provides a very easy way for you to add device capabilities to your web application through JavaScript. Let's say for example you have a form on one of your pages and you want to enable bar code scanning for ease of data entry. This can be accomplished by adding a few lines of JavaScript to your pages. You do not need to build and compile a RhoElements application using RhoStudio. You simply need to enable your web app by installing a RhoElements runtime application on the device and configuring it to point to your web server.

**NOTE: RhoMobile Suite 4.0 provides a RhoElements Shared Runtime for Windows Mobile/CE only. It includes access to all JS API's and default API extensions and capabilities. The Shared Runtime requires a RhoElements license.**




To enable your web app for RhoElements, perform these steps.

1. Install the RhoElements Runtime
2. Write your web app (HTML, CSS, and JavaScript). [See the Using JavaScript APIs From Your Web App section](#using-javascript-apis-from-your-web-app)
3. Install your web app on your mobile device or configure it to point to your web server.

## Installing the RhoElements Runtime

After you [install Zebra RhoMobile Suite](rhomobile-install), you will have access to a set of executables -- the RhoElements runtimes -- for Windows Mobile and Windows CE. You will need to install the RhoElements Runtime on each device that will be used for your application.

* On Windows, you can find the RhoElements Runtimes in the Start Menu, under Zebra RhoMobile Suite.
* On Macintosh, they are located in the Zebra RhoMobile Suite Installer for Mac, in the RhoElements2 Shared Runtime folder.

On Windows Mobile/CE devices, install the RhoElements Runtime.cab to \Program Files\RhoElements using ActiveSync or Windows Mobile Device Center. 

Once installed, you will have access to the RhoElements config.xml file. 

NOTE: When installing a newer version of the runtime on Windows the existing config.xml will be overwritten with the default one. You should redeploy your customized config.xml along with an upgrade of the runtime. On Android, the config.xml is not overwritten on upgrades of the runtime.

## Using JavaScript APIs From Your Web App
When you are running your web pages from a web server, the RhoElements Shared Runtime is essentially acting as a browser. In order to use the RhoMobile API's you will need to copy the `rhoapi-modules.js` from the devices `Program Files\RhoElements\rho\apps\public\api` folder to your web server and link it appropriately in your web server's web pages. Typically you will copy this file to your web applications `js` folder where you may be including other JavaScript libraries that are being used. This file will be valid for Windows Mobile/CE devices only and will contain both Rhodes and RhoElements APIs.

NOTE: In prior versions of RhoElements, you did not have to copy a JavaScript file to your web application and the RhoElements JavaScript objects were available within the container. The current method of including a JavaScript file within your web server is a more standardized way of utilizing Jvascript libraries

## Using JavaScript APIs From Local Pages
You could choose to use the Shared Runtime with locally available HTML files. In this case you will need to make sure you properly reference the file `rhoapi-modules.js` in relation to where your HTML files are running from.

For example if you placed your html files in `Program Files\RhoElements\rho\apps\public\` then in your html files you would link to the `rhoapi-modules.js` using:

    :::javascript
    <script src="api/rhoapi-modules.js" type="text/javascript"></script>

NOTE: You do not need to place your HTML files in the `Program Files\RhoElements\rho\apps\public` folder. Just be sure to copy the `rhoapi-modules.js` to the folder you are using and reference it appropriately.


## Setting RhoElements to Start With Your Application

This section assumes you have created your web pages to run locally on the device or remotely on a web server;

1. Find the file "\Program Files\RhoElements\config\Config.xml" on your Zebra Windows Mobile/CE device and copy it to your PC.
2. Open config.xml in your PC's text editor.
3. Find the "Application" entry in the config.xml file and change its startPage parameter to the location of your HTML pages either locally ex: "file://\helloscan.html" or on your web server: "http://mydomain.com/mystartpage.index.html"
4. Copy the config.xml file on your PC back to your mobile device.
5. Start RhoElements using the icon in the Programs Group.

**NOTE: If you are using a localized variant of the operating system, you may need to edit the default config.xml and plugin.xml shipped with RhoElements to account for the localized folder names on the system, e.g. The Italian build of the OS uses \Programmi\ rather than \Program Files\.**

## Creating Shortcuts for Your Web App

You can create a shortcut file to have the RhoElements Runtime launch with your web app.

### Creating Shortcuts on Windows Mobile/CE

You can setup Windows Mobile shortcut files to launch the RhoElements runtime with different startup options that will override the default settings. You set these parameters in a shortcut (.lnk) file for Windows Mobile/CE; you must create this shortcut file. You can use a text editor such as Notepad on Windows CE, or use the File menu in Platform Builder (New Project or File, Text File type). Edit the file for command line parameters and save it to \Windows\Start Menu (Windows Mobile) and \Windows\Programs (Windows CE). This will put the shortcut at the top level in your Start Menu.

The RhoElements runtime installation path on Windows CE/Mobile devices is `\Program Files\RhoElements` and the path to the executable is `\Program Files\RhoElements\RhoElements.exe`.

The shortcut file supports the following command line parameters.

`/C:` specifies the location of the configuration file for the RhoElements application. This will override all default configuration settings. If the full file name contains spaces, surround URL with single or double quotes, e.g.:

        /C:file://\application\config.xml
        /C:'file://\Program Files\application\Config.xml'
        /C:"file://\Program Files\My Application\config.xml"
        
`/S:` specifies the start page of the RhoElements application. Other configuration parameters will be used from the default config.xml file. If the full file name contains spaces, surround URL with single or double quotes, e.g.:

        /S:file://\HTML\index.html
        /S:'file://\RE App\index.html'
        /S:"file://\Program Files\MyApp\index.html"
        /S:http://www.motorola.com

If neither the `/S` nor `/C` parameters are specified in the shortcut file, then the default values for the location of the configuration file and the start page of the RhoElements application will be used. 

NOTE: Urls that contain query string parameters (?name=value) can not be used within a shortcut on Windows Mobile / CE. This is a limitation on Windows Mobile/CE for creating shortcuts.

The format in the .lnk file is:

	<line-length>#<runtime-exe> <command-line-parameter> <app-folder>

For example, this code in the .lnk file will change the startup page to be a local HTML file.

	70#"\Program Files\Rhoelements\rhoelements.exe" /S:file://\helloscan.html


## Running Multiple Web Apps

If you have multiple web apps that you would like to point RhoElements Runtime to, you can create multiple shortcuts as described above. For example, one startup file could be:

	68#\Program Files\Rhoelements\rhoelements.exe /S:file://\helloscan.html

And another could be:

	66#\Program Files\Rhoelements\rhoelements.exe /S:file://\helloscan.html

NOTE: The last application will launch using the same runtime container. Only one application will be running at a time. When launching the second application the runtime simply changes the starting URL.
	

## Understanding RhoElements Configuration Parameters

It is recommended that you get familiar with the [Configuration Parameters](runtime_config#configxml) in the configuration file config.xml, both for developing/debugging as well as deployment. 

The location of the configuration file is in the folder `Config` off the installation root.

If you wish to keep all default parameters and just change the starting url, then it is recommended that you simply create a shortcut as described below. 

If you wish to modify other parameters in the config.xml, you should replace the config.xml file after the RhoElements Runtime is installed. Locate the config.xml file, copy it to your desktop for modification, and then you can use this file along with your distribution of the RhoElements Runtime. This file will need to be overwritten after the installation of the runtime.

## Customizing the RhoElements Runtime

The RhoElements Runtime is a prebuilt Rhodes application that launches in full screen mode and loads the configuration parameters as described above. If you would like to modify the behavior of the RhoElements runtime, such as [change the startup screen or icon](app_icon_splash), then load the Rhodes project from which you can build a RhoElements Runtime into RhoStudio.

**NOTE: The RhoElements Runtime is only available for Windows Mobile/CE devices.**

### Building A Customized RhoElements Runtime for Windows Mobile/CE

On the command line on your Windows PC, navigate to this folder:

	<RhoMobile Suite Install Folder>\Rhoelements2

To build, run this command.

        rake device:wm:production

The resulting `cab` file can be found at `<RhoMobile Suite Install Folder>\RhoElements2\bin\target\<platform_id>\RhoElements2.cab`.

### Deploying The Customized Runtime 

To install your customized Runtime application on your specific device, go to the build instructions for your platform and use the instructions to deploy an application on your device.

NOTE: The runtime application <b>must</b> be installed to the primary disk partition on the Windows CE/Mobile device, i.e. it has to be installed to `\Program Files\RhoElements2` only.
On Windows Mobile, the `Device` option must be selected when the installer asks for the location to install.
On Windows CE, the default path (`\Program Files\RhoElements`) must be selected.

## Logging a RhoElements WebApp Application

The RhoElements Shared Runtime log file is configured in the configuration file [Config.xml](runtime_config#configxml).

The location of the log file is defined by the following rules (in the order of priority):

1. If the `Value` attribute of `Configuration` > `Logger` > `LogProtocol` tag in the configuration file equals "FILE" or "HTTP", then the path to the log file is taken from the `Configuration` > `Logger` > `LogURI` tag.

    - Windows Mobile/CE: In case of "FILE" protocol, the file name part of `value` attribute of `LogURI` tag is ignored and `rholog.txt` is used as a file name.
    - In case of "HTTP" protocol, log messages are sent to the host and the port specified with the `value` attribute of `LogURI` and `LogPort` tags via POST HTTP-requests.

2. If the start page parameter is a local file, then this file folder is used to store the log file.
The file name part of the start page parameter is ignored and `rholog.txt` is used as the file name.
This rule is not applied to Android.

3. Otherwise the log file has the name `rholog.txt` and is placed at this location:
 * Windows Mobile/CE: `rho` folder of the Runtime installation folder.

## Optimizing The Runtime

RhoElements will be installed to the device with all default functionality enabled out of the box, including the barcode scanner.  This section describes how you can customise the RhoElements runtime to only load the functionality your application requires and specify when you want to load it.

Consider an application which opens the [Card Reader](../api/cardreader) on the first page:
    <META HTTP-Equiv="CardReader" Content="Open" />

There are two circumstances to consider:

1) The Card Reader module is Preloaded in Config.xml See [Configuration Settings](runtime_config#configuration-settings-and-values) for details of how to preload modules
In this case RhoElements opens the card reader more or less immediately with no noticeable delay to the user.

2) The Card Reader module was not Preloaded
In this case the Card Reader module (contained in the plugin PB_CardReader_PLG.dll) is loaded into memory and initialised, this in turn will initialise the hardware which could cause a noticeable delay depending on the device in use and the exact hardware.

The benefits of preloading plugins are obvious.  The benefits of not preloading plugins are that RhoElements will run with a smaller memory footprint until the additional functionality is required and the start up time will be reduced.

###Plugin.xml
Plugin.xml contains a mapping between the plugin DLL names, the modules contained within each plugin and any alias' assigned to the modules.  Plugin.xml <b>does not</b> specify which plugins to load, modules will only be loaded when they are needed or when they are preloaded.  It is recommended you do not edit this file, doing so may cause RhoElements to be unable to locate plugins on the device, rendering the modules within the missing plugins non-functional.    

###Necessary Modules
In order for RhoElements to function correctly it is necessary to preload some modules, this section details what those modules are and why they are necessary.  By default after a standard installation the Config.xml copied to the device will preload the necessary modules.

####Hourglass
When you navigate between pages you would expect to be shown an illustration of a rotating cursor.  If the [Hourglass](../../2.2.0/rhoelements/hourglass) module is not preloaded this cursor will not be shown.  

Note that the hourglass will be shown during page transitions if it is loaded by another means, e.g. calling:
    <META HTTP-Equiv="Hourglass" Content="Visibility:Visible" />

NOTE: Hourglass and SIP modules are located in the same Plugin (PB_DeviceApplication_PLG.dll)

####Key Capture
The following [Configuration Settings](runtime_config#configuration-settings-and-values) require the Key Capture module to be preloaded in order to take effect:
<ul>
<LI>EnableFunctionKey_FX</LI>
<LI>EnableApplicationKey_AX</LI>
<LI>EnableCtrlKey_X</LI>
</ul>

####SIP
The following [Configuration Settings](runtime_config#configuration-settings-and-values) require the SIP module to be preloaded in order to take effect:
<ul>
<LI>ResizeOnSIP</LI>
</ul>

NOTE: Hourglass and SIP modules are located in the same Plugin (PB_DeviceApplication_PLG.dll)

####Special Case - License Screen

The licensing screen utilizes the Scanner module to ease the input of licensing barcodes.  Developers should be aware that using unlicensed devices can cause the scanner to be loaded, increasing the memory footprint of RhoElements.  Licensed versions of RhoElements will just show a start up splash screen and will <b>not</b> load the scanner unnecessarily.

###Recommended Modules
It is recommended that the JavaScript objects are preloaded if they are being used in a RhoElements application. This is accomplished by changing the NPAPI section of the Config.xml
    <NPAPI>
        <NPAPIDirectory VALUE="file://\Program Files\RhoElements\NPAPI\"/>
        <Preloads>
            <PreloadLegacyGeneric VALUE="0"/>
            <PreloadLegacyODAX    VALUE="0"/>
            <PreloadLegacyNoSIP   VALUE="0"/>
            <PreloadLegacyAirBeam VALUE="0"/>
            <PreloadLegacyAPD     VALUE="0"/>
            <PreloadJSObjects     VALUE="1"/>
        </Preloads>
    </NPAPI>
NOTE: Some JavaScript libraries may incorrectly think that RhoElements supports traditional ActiveX. By only loading the JS objects described above may resolve this issue.     

###Plugin Dependencies
Some plugins depend on other plugins to function properly, this section details the relationships between plugins and how the absence of one will affect the other.  If the required plugin is not preloaded RhoElements will load it at runtime; to produce the best user experience it is recommended to preload all required plugins.  If the required plugin can not be loaded (e.g. the DLL is missing from the device or Plugin.xml) the dependant plugin will function with reduced capabilities.

####File Transfer
The [File Transfer Plugin](../../2.2.0/rhoelements/filetransfer) (PB_FileTransfer_PLG.dll) is critical to the proper working of multiple plugins. 

[Signature Capture](../../2.2.0/rhoelements/SignatureCapture) (PB_Signature_PLG.dll) requires File Transfer to transmit the signature bitmap file to a remote server via its 'Capture' method, without File Transfer the file will not be transferred and the signature bitmap will remain stored in the root of the device (by default).

The buttons and command areas (PB_Controls_PLG.dll) require File Transfer if you specify a remote image for the 'ImageUp' or 'ImageDown' parameters.  If the file transfer plugin can not be loaded the default image will be shown on the button / command area.  The following modules are affected in PB_Controls_PLG: [Back Button](../../2.2.0/rhoelements/backbutton), [Forward Button](../../2.2.0/rhoelements/forwardbutton), [Go Button](../../2.2.0/rhoelements/gobutton), [Home Button](../../2.2.0/rhoelements/HomeButton), [Minimize Button](../../2.2.0/rhoelements/minimizebutton), [Quit Button](../../2.2.0/rhoelements/quitbutton), [Reload Button](../../2.2.0/rhoelements/reloadbutton), [SIP Button](../../2.2.0/rhoelements/sipbutton), [Stop Button](../../2.2.0/rhoelements/stopbutton), [Bottom Command Area](../../2.2.0/rhoelements/bottomcommandarea), [Top Command Area](../../2.2.0/rhoelements/topcommandarea)

The [Imager](../../2.2.0/rhoelements/imager) Plugin (PB_ImageCapture_PLG.dll) requires File Transfer if you transmit the captured image to a remote server via the 'Capture' method.  Without File Transfer the file will not be transferred and the image will be stored by default in the root of the device, overwritten by each subsequent capture.


