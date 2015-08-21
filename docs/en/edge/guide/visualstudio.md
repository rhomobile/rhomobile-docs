#Visual Studio Plug-in

The RhoMobile Visual Studio Plug-in allows you to build Rhodes-based applications that target Windows Phone 8. The current version allows you to:

* Generate an application structure
* Generate data models
* Edit application code
* Build apps for Windows Phone 8
* Deploy and run the apps

## Prerequisites

* Visual Studio 2012 Professional
* Windows Phone 8 SDK
* RhoMobile Suite 4.0 or higher
* Silver or Gold RhoMobile subscription
* A copy of the plug-in (see below)

## Installing
1. Visit the [RhoMobile vsplugin page](https://github.com/rhomobile/vsplugin/tree/master/Installer) on GitHub and click on the VSIX file to begin the download 
2. Locate and **double-click the downloaded file** in Windows Explorer
3. When prompted, **select only the editions of Visual Studio in which the extension will be used**
4. **Click OK** to begin installation
5. When finished, **close and re-open any open Visual Studio windows**

NOTE: During installion (and removal) of the extension, a User Account Control prompt might appear in Windows. This is expected behavior; the current version of the extension installs for all users.

## Generating an application

1. In Visual Studio 2012, **select File > New Project**
2. **Select RhoMobile** then **RhoMobile Windows Phone 8 Project**
3. **Name the project, click OK**
4. When prompted, **select a Rhodes or RhoElements framework** (If you're not sure which to select, read about [the differences between Rhodes and RhoElements](welcome#rhomobile))
5. **Click Finish**

![Anatomy of a Rho app](https://github.com/rhomobile/rhomobile-docs/blob/master/public/images/rhoelementstutorial/Anatomy_of_a_Rho_application.png?raw=true =350x)

## Adding a productid GUID

The process above generates all the files and folders to define the structure of your new application. This structure is the same as when [creating an app using RhoStudio](creating_a_project). However, your new Windows Phone app requires that a 'productid GUID' be added to its `build.yml` file. The [build.yml](build_config) is located in the app's root directory. 

**Append the `build.yml` file as follows** using Visual Studio or any text editor: 


        wp:
          productid: 632621d0-5ecb-012e-2c97-482a1411c191


## Generating data models

1. In Visual Studio, **right-click the project name**
2. Select **Add New Item**
3. In the Add New Item dialog, **select RhoMobile Model**
4. **Click Add**
5. In the Add New RhoMobile Model dialog, **enter a model name and a list of attributes (separated by commas)**
6. **Click Finish**

This will automatically generate a folder and the corresponding files for handling CRUD operations for the model. For a better understanding of data models, please refer to the [RhoMobile Data Handling Guide](local_database#what-is-a-model).

## Dropping in a Windows Phone 8 UI
Since RhoMobile apps employ HTML, CSS and JavaScript to define the user interface and application behavior, a Windows Phone 8 app can be designed with a WP-native UI (a.k.a. 'Metro' by using one of these Metro-like frameworks:

* [Bootmetro](http://aozora.github.io/bootmetro/)
* [Metro UI CSS](http://metroui.org.ua/)
* [Metro CSS](http://code52.org/metro.css/)
* [Metro-Bootstrap](http://talkslab.github.com/metro-bootstrap/)
* [jqMetro](http://jqmetro.codeplex.com/)

Follow the instructions that accompany the chosen framework to replace the default.

## Launching your new app
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

NOTE: There is no dialog or log-in prompt for RhoMobile.com displayed within the IDE. To create an account you will need to do so via RhoMobile.com, to log in you will have to do so through the command line or in RhoStudio.


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
