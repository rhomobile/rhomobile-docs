# Building a RhoMobile Web App Container

If you have an existing web application and wish to enable hardware features or other RhoMobile APIs, then you will need to create a RhoMobile application and point it to your website. This will allow you to deliver a true native application client experience for your web app as well as enable hardware features that you can't get with standard browsers running on the device.

Here are the steps that you need to follow

## 1) Install RhoMobile Suite
In order to create your own RhoMobile web app container, you must first install RhoMobile Suite. This will give you the abiltity to create the application and complete the rest of the steps.

[Follow the Rhomobile Suite Installation Instruction](rhomobile-install) and then return to this section to continue to the next step.

## 2) Install the Target Platform's SDK
RhoMobile applications rely on having the target platform SDKs installed on your laptop so that the native runtime container can be built. For example, if you want to build a Android web app container, you will need to have the Android development environment installed and linked to RhoMobile Suite.

[Follow the instructions for setting up target platforms SDKs](nativesdksetup) and then return to this section to continue to the next step.

## 3) Create a RhoMobile Application
[Follow the instructions for creating a project](creating_a_project#creating-a-project-with-rhostudio) to create a simple skeleton for a RhoMobile project. You can optionally remove the `public` folder as this contains default JavaScript and CSS files that you will not be using since all of your application files will be running from your web server.

## 4) Setting the Starting Page
By default this application is configured to start with loclly availble files. You need to change the application so that it starts from your web application instead. Edit the `rhoconfig.txt` file and change the `start_path` parameter to point to the url for your web server.

For example, if my web application was at http://www.mydomain.com/mywebapp then my `start_path` parameter in `rhoconfig.txt` would look like:

    :::yaml
    # startup page for your application
    start_path = 'http://www.mydomain.com/mywebapp'

When this application is launched on the device, it will attempt to connect to this URL.

## 5) Enabling RhoMobile APIs
By default not all RhoMobile APIs are available to your application. APIs and capabilities are included by defining `extensions` in the `build.yml` file.

### Default APIs 
By default the following APIs are included when building any application:
[Application](../api/Application), [Database](../api/Database), [RhoFile](../api/File), [Log](../api/Log), [NativeMenubar](../api/NativeMenubar), [NativeTabbar](../api/NativeTabbar), [NativeToolbar](../api/NativeToolbar), [Navbar](..api/Navbar), [Network](../api/Network), [Notification](../api/Notification), [Orm](../api/Orm), [OrmModel](..api/OrmModel), [System](../api/system), [Webview](../api/webview) 

These APIs are noted on their individual API reference pages under the extension: `coreapi`. You do not need to specify including this as it will automatically be included

### Other APIs
The following APIs are not included by default and can be included by specifying the proper `extension` in the `build.yml`:

* `extensions: ["barcode"]' - [Barcode](../api/barcode)
* `extensions: ["cardreader"]' - [CardReader](../api/cardreader)
* `extensions: ["hardwarekeys"]' - [KeyCapture](../api/keycapture)
* `extensions: ["indicators"]' - [Battery](../api/battery), [KeyState](../api/keystate), [SignalIndicators](../api/signalindicators)
* [MediaPlayer](../api/mediaplayer): `extensions: ["mediaplayer"]`
* [ScreenOrientation](../api/screenorientation): `extensions: ["screenorientation"]`
* [Sensor](../api/sensor): `extensions: ["sensor"]`

### RhoConnect Capabilities
If you would like your application to include [RhoConnect](../rhoconnect/introduction) capabilities then you will need to include the proper settings in the `build.yml` file:

* [RhoConnectClient](../api/RhoConnectClient): `extensions: ["rhoconnect-client"]`
* [Push](../api/Push): `extensions: ["rhoconnect-push", "rhoconnect-client"]` as well as `capabilities: ["push"]` needs to be added as a seperate line in the `build.yml` file


## 6) Setting Application Name and Branding
If you would like to give you application the true native experience, you should change the default behavior for the application name, icons used, and splash screen

[Follow the steps in this guide](app_icon_splash) and then return here to continue to the next step.

## 7) Building the Application
Now that you have configured your application behavior, it is time to build the RhoMobile web app container. Depending on the target platform being used will determine the specific steps that you need to follow. Overall, the goal is to produce an installation package that can run on the target native platform (i.e. .cab for Windows Mobile, .apk for Android, etc)

Follow the steps for the target platform and return here to contuinue

* [Build for iOS](build_ios)
* [Build for Android](build_android)
* [Build for Windows Mobile](build_wm)
* [Build for Windows Phone 8](build_wp8)
* [Build for Windows](build_win)

## 8) Enabling JavaScript on your Web App
Now that you have a RhoMobile Web App container pointed to your web server, you need to configure your web application on your server to enable the RhoMobile JavaScript APIs. In order to do this, you must:

a) **Generate the `rhoapi-modules.js` file**

In a command prompt from the RhoMobile project folder [you created](#3-create-a-rhomobile-application), execute the following command:
    :::ruby
    # optionally change 'all' below to an individual platform 
    # if your devices are all running on the same platform
    # may be: win32, wm, android, iphone, wp8
    rake update_rho_modules_js[all]


b) **Copy this file onto your server**

Typically this will be in the same location you have other JavaScript files.


c) **Link to the file**

From your web application HTML files link to the `rhoapi-modules.js` file you copied to your web server

For example if you placed `rhoapi-modules.js` in `[webserver app root]\js\` then in your html files you would link to the `rhoapi-modules.js` using:

    :::javascript
    <script src="js/rhoapi-modules.js" type="text/javascript"></script>

d) **JS ORM**

If you are going to be using the JS ORM API, you'll also need to include this line in any files that will be using it:

    :::html
    <script type="text/javascript" charset="utf-8" src="/public/api/rhoapi-modules-ORM.js"></script>