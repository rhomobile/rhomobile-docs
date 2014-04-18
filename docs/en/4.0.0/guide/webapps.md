# Adding RhoMobile Capabilities To Your Web Application 

You may wish to add RhoMobile API capabilties to your web application if your client devices are running a RhoMobile Application or RhoElements Shared Runtime that is pointing to your web server.

## Client Choices

### Standard Browsers
Standard browsers will not provide the added benefit of native application packaging, deployment and management. It will also not allow you to take advantage of the RhoMobile APIs that provide device, system and framework access to your web application 

### RhoMobile Application
Although RhoMobile applications typically involve packaging up all resources and application logic locally with the RhoMobile application, you can build a [RhoMobile Application](creating_a_project) to start running from your web server start page. Although you have to [install](rhomobile-install) and [setup](nativesdksetup) the development environment and build the application for each mobile operating system, you can truly make this application appear like a native application by changing the [application icon, splash screen](app_icon_splash) as well as customize other [build](build_config) and [runtime options](runtime_config). [Follow the typical steps](creating_a_project) for building a RhoMobile Application and then be sure to [change the start_path](#connecting-with-your-web-application) to point to your web app starting URL.

### RhoElements Shared Runtime
The RhoElements Shared Runtime is basically a preconfigured RhoMobile Application that includes RhoElements APIs. You do not need to build and compile a RhoMobile application using RhoStudio. You simply need to enable your web app by installing a RhoElements runtime application on the device and configuring it to point to your web server.[Read More](rhoelements-runtime)

NOTE: RhoMobile Suite 4.0 provides a RhoElements Shared Runtime for Windows Mobile/CE only. It includes access to all JS API's and default API extensions and capabilities. [See the Using the RhoMobile JS APIs section](#using-rhomobile-js-apis) for more details. The Shared Runtime requires a RhoElements license.

## Connecting with your web application
To load application files to the RhoMobile application from an external Web server - set `start_path` in `rhoconfig.txt` to point to http:// or https:// protocol URI. `rhoconfig.txt` is a runtime configuration file [Read More](runtime_config)
	:::ruby
	start_path='http://heroku.com/myapp/index.html'

## Using RhoMobile JS APIs
The RhoMobile JavaScript API library `rhoapi-modules.js` is needed in order to access RhoMobile 4 JavaScript APIs.  This file is provided as part of the installation of RhoMobile Suite:

* Windows: located in the `[RhoMobile Suite install path]/rhoapi-modules`
* Mac: In the `rhoapi-modules` folder of the RhoMobile Suite DMG package.

Copy this file to your web server and make sure it is referenced in all pages that wish to use the RhoMobile JavaScript APIs.

NOTE: This file is universal for all platforms and includes all of the Rhodes and RhoElements extensions and APIs by default. If you wish to customize the contents of include any additional extensions, then you will need to generate the `rhoapi-modules.js` file by creating a RhoMobile application project.

### Generating rhoapi-modules.js
To generate a universal 'rhoapi-modules.js' you can run a rake command. In order to do this, you will need to have RhoStudio installed. Create a RhoMobile project and then in a command prompt from the project folder, execute the following command:
	:::ruby
	#platform may be: win32, wm, android, iphone, wp8
	rake update_rho_modules_js[all]

	
The `rhoapi-modules.js` file will be located in the projects `\public\api` folder. Copy this file to your webserver application and reference it appropriately.

NOTE: The `rhoapi-modules.js` file is customized to the `extensions` and `capabilities` section of your `build.yml`. If you do not included the proper settings, the rhoapi-modules.js library may not contain all of the capabilities you are looking for.

### Windows Mobile/CE Devices
To use the `rhoapi-modules.js` library for Windows Mobile/CE devices with your webserver you can also choose to [install the Shared Runtime](rhoelements-runtime#installing-the-rhoelements-runtime) and then copy the `rhoapi-modules.js` from the devices `Program Files\RhoElements\rho\public` folder. This file will be valid for Windows Mobile/CE devices only and will contain both Rhodes and RhoElements APIs.

