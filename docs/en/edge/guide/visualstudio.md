#Visual Studio Plugin

The RhoMobile Visual Studio Plugin allows you to build applications that are targeted for Windows Phone 8. The current version allows you to:

* Generate an application structure
* Generate data models
* Code editing
* Build for Windows Phone 8
* Launch and Run

## Prerequisites

* Visual Studio 2012 Professional
* Windows Phone 8 SDK
* RhoMobile Suite 4.0+

## Installing
1. Download the extension's [VSIX file](https://github.com/rhomobile/vsplugin/tree/master/Installer) and double-click it in Windows Explorer
2. Given the choice of which editions of Visual Studio the extension should be installed for, leave checkmarks next to only those editions where you plan to use the extension and click OK
3. When the installation finishes, make sure to restart any open instances of Visual Studio

NOTE: The current version of the extension installs for all users so you might get a User Account Control prompt in Windows upon both installation and removal of the extension. This is expected behavior.

## Generating an application

1. From the Visual Studio 2012 `File Menu` select `New Project`
2. Select `RhoMobile` then `RhoMobile Windows Phone 8 Project`
3. Give your project a name then click `Ok`
4. When prompted either choose `Rhodes` or `RhoElements` frameworks. [Check here](welcome#rhomobile) for more details on the differences.
5. Click `Finish`

This generates a set of files and folders to define an application structure. This structure is the same as what is [generated from RhoStudio](creating_a_project)

## Generating data models

1. Right Click on the project name
2. Choose `Add` \ `New Item`
3. In the `Add New Item` dialog, choose `RhoMobile Model`
4. Click `Add`
5. In the `Add new RhoMobile Model` dial enter the `Model Name` an then a list of `Model Attributes` separated by a comma
6. Click Finish

This automatically generates a folder and a corresponding set files that provide CRUD operations for that model. [Read more details](models) about data models. 

## Application changes
    
* Add to application build.yml productid GUID. For example:

        wp:
          productid: 632621d0-5ecb-012e-2c97-482a1411c191

## Windows Phone 8 User Interface
Recall that RhoMobile applications utilize web languages like CSS, JavaScript and HTMl to define it's interface and application behavior. Therefore, if you are looking to provide a native Windows Phone 8 (aka Metro) user interface, you may want to consider using one of the the Metro-like frameworks:

* [Bootmetro](http://aozora.github.io/bootmetro/)
* [Metro UI CSS](http://metroui.org.ua/)
* [Metro CSS](http://code52.org/metro.css/)
* [Metro-Bootstrap](http://talkslab.github.com/metro-bootstrap/)
* [jqMetro](http://jqmetro.codeplex.com/)

[Follow the instructions]() for replacing the default application generation with your own framework. 

## Launch and Run
You are now ready to build and launch your application by selecting a build configuration option:

* RhoSimulator - The same RhoSimulator that is used on other platforms, provides a Webkit enabled view as well as a Web Inspector to help with debugging

* Device - You must have a Windows Phone 8 device connected to your machine and have it setup properly so Visual Studio recognizes it

* Emulator - Windows Phone 8 emulator provided by Microsoft.

NOTE: It is recommended to use RhoSimulator while initially building out your user interface and application behavior. This will give you the most rapid method for testing/debugging that is targeted at web apps.

You can now launch your application inside of RhoSimulator for testing by:

1. From the toolbar make sure `RhoSimulator` is selected in the dropdown
2. Click `Start`

RhoSimulator launches. [Read more details]() about how to use RhoSimulator

### Run application simulator using command line:

        $rake run:wp8

NOTE: You may use your computer keyboard with Windows Phone 8 emulator. By default it is disabled, but you can enable it pressing **PgUp** key. While it is enabled a device rotation simulation is not supported. To rotate device you need to disable keyboard support pressing **PgDown** key.  Look [MSDN page](http://msdn.microsoft.com/en-us/library/ff754352(v=vs.92).aspx) for much more details on this topic.

### Run application device using command line:

        $rake run:wp8:device

* See log in application folder : rholog.txt

NOTE: When running on device you may need to disconnect USB cable from device to see log


## Future plugin features
We will be adding this features to the plug-in soon. Check back for updates:

* JavaScript debugging
* Building for Windows Mobile/CE
* Intellisense for RhoMobile APIs
* RhoConnect Projects
* Ruby Debugging
* Building for Android
* Remote build integration with RhoHub

Related Resources

* [Windows Phone 8 Dev Center](http://dev.windowsphone.com/en-us)
* [Metro User Interface Implementation and Resources](http://www.queness.com/post/13493/metro-user-interface-implementation-and-resources)
