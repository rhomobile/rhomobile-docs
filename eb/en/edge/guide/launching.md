# Starting Your Application
## Overview
In order for Enterprise Browser to work with your application, it needs to be configured into what we refer to as *Runtime configuration*. This is managed through an XML file called **Config.xml**. This file is mandatory for proper Enterprise Browser execution: not every setting has a default and if the configuration file cannot be found, Enterprise Browser *will not start*. 

An example configuration file is provided as part of the installation and contains sensible defaults. Please refer to [Configuration Settings](../guide/configreference) page for more details on the meanings and utilization of each of the settings and their possible values.

### Config.XML Location
The location of the configuration file loaded by Enterprise Browser is dependent on a number of factors:

* When running on the Enterprise Tablet the configuration file is read from /Android/data/com.symbol.EnterpriseBrowser/Config.xml.
* When running on all other devices Enterprise Browser will attempt to launch the configuration file Config.xml located in the folder `Config` off the installation root.
* You can change which configuration file is loaded using the /C: configuration option. See the shortcuts section for more detail.

For persistant installations, on cold boot the Config.xml file is copied from \Application\EnterpriseBrowser\Config\Config.xml to \Program Files\EnterpriseBrowser\Config\Config.xml; bear this in mind if you want your configuration to persist across cold boot. This behavior may be modified by changing \Application\EnterpriseBrowser.cpy. 

## Starting Your Application
To set Enterprise Browser to Start With your Application, you find the `startPage` parameter in the Config.xml file and change it to the location of your HTML application. This application can reside locally on the device or it can reside remotely on a web server.

> Note: Different steps need to be taken for each scenario in order to make use of Enterprise Browser APIs. Be sure to read the [API Overview guide](../guide/apioverview) for more details.

As an example of using a local file called `HelloScan.html`. The following steps would be taken:

1. Copy the file HelloScan.html to the root folder of your device using ActiveSync. 
2. Find the file "\Program Files\EnterpriseBrowser\config\config.xml" and copy it to your PC. 
3. Edit config.xml in your text editor. 
4. Find the `Application` entry in the xml file and change it's `startPage` parameter to "file://\helloscan.html". 
5. Start Enterprise Browser using the icon in the programs group. 

> Note: If you are using a localized variant of the operating system, you may need to edit the default config.xml shipped with Enterprise Browser to account for the localized folder names on the system, e.g. The Italian build of the OS uses \Programmi\ rather than \Program Files.