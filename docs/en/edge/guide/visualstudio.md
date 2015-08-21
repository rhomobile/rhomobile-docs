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

Once the app is generated, a folder structure like the one below will appear in your workspace in a folder with the name you gave your app. 

![Anatomy of a Rho app](https://github.com/rhomobile/rhomobile-docs/blob/master/public/images/rhoelementstutorial/Anatomy_of_a_Rho_application.png?raw=true =350x)

## Adding a productid GUID

The process above generates all the files and folders to define the structure of your new application. This structure is the same as when [creating an app using RhoStudio](creating_a_project). However, ro run your new Windows Phone app you'll have to add a 'productid GUID' to its `build.yml` file. As seen above, the [build.yml](build_config) is located in the app's root directory. 

Using Visual Studio or any text editor**, append the `build.yml` file as follows**: 


        wp:
          productid: 632621d0-5ecb-012e-2c97-482a1411c191


## Generating data models
RhoMobile includes Rhom, a database object mapper (ORM) that provides a powerful high level interface to an on-device SQLite database. Rhom works hand in hand with the RhoConnectClient to enable two-way synchronization between your application and a RhoConnect server.

To create a data model: 

1. In Visual Studio, **right-click the project name**
2. Select **Add New Item**
3. In the Add New Item dialog, **select RhoMobile Model**
4. **Click Add**
5. In the Add New RhoMobile Model dialog, **enter a model name and a list of attributes (separated by commas)**
6. **Click Finish**

This will automatically generate a folder and the corresponding files for handling CRUD operations for the model. For a better understanding of data models, please refer to the [RhoMobile Data Handling Guide](local_database#what-is-a-model).

## Adding a Windows Phone 8 UI
Since RhoMobile apps employ HTML, CSS and JavaScript to define the user interface and application behavior, a Windows Phone 8 app can be designed with a WP-native UI (a.k.a. 'Metro' by using one of these Metro-like frameworks:

* [Bootmetro](http://aozora.github.io/bootmetro/)
* [Metro UI CSS](http://metroui.org.ua/)
* [Metro CSS](http://code52.org/metro.css/)
* [Metro-Bootstrap](http://talkslab.github.com/metro-bootstrap/)
* [jqMetro](http://jqmetro.codeplex.com/)

Follow the instructions that accompany the framework you've chosen to replace the default.

## Launching your new app

NOTE: Building RhoMobile apps requires an account on Rhomobile.com and that the user be logged in. This must be done via RhoMobile.com or RhoStudio before your build is attempted; no dialog or log-in prompt will appear within Visual Studio. 

Now that you're now ready to build and launch your app, you must select from following build configuration options:

* **RhoSimulator** builds and launches the app in RhoSimulator, a Webkit-enabled window that displays your app along with a Web Inspector tool to help facilitate debugging

* **Device** deploys the app to your Windows Phone 8 device connected to the development machine for on-device debugging using Visual Studio or web inspector tools 

* **Emulator** launches the app in the Windows Phone 8 emulator provided by Microsoft

NOTE: RhoSimulator is recommended while initially building your app's UI and establishing its basic behavior; it is the fastest method for testing and debugging web apps. 

##Starting RhoSimulator...
###...from within Visual Studio
To launch your new application in the RhoSimulator:

1. From the Visual Studio toolbar, **select RhoSimulator in the dropdown**
2. **Click Start**

###...from the command line:
To run your the app in RhoSimulator from the command line, execute the following command:  

	:::term
        $ rake run:wp8

###Keyboard for Windows Phone 8 Emulator
The host computer's keyboard can be used with the Windows Phone 8 emulator, but is disabled by default. To enable it, press the **PgUp** key or the **PAUSE/BREAK** key. While the host keyboard is enabled, device rotation simulation is disabled. To rotate the device in the emulator, you must first disable the keyboard by pressing the **PgDown** key. MSDN has more information about [host keyboard use with the WP8 emulator](http://msdn.microsoft.com/en-us/library/ff754352). 

### Run application device using command line:

        $rake run:wp8:device

* See log in application folder : rholog.txt

NOTE: When running on device you may need to disconnect USB cable from device to see log

## Plug-in feature roadmap
The following features are on the Visual Studio Plug-in roadmap:

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
