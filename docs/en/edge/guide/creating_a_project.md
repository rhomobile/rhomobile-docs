# Creating a RhoMobile Project
A RhoMobile project can be created either from within RhoStudio or from the command line. Under the hood, RhoStudio invokes the command-line tool anyway, so the approaches are equivalent; both apply the Rhodes open-source framework for building cross-platform apps. 

This tutorial assumes that the RhoMobile Suite and its related components are already installed on your development machine. If that's not the case, please refer to [RhoMobile Suite installation instructions](rhomobile-install) before beginning this tutorial. 

## Creating a new project
###  With RhoStudio
To create your first Rhodes project using RhoStudio:<br>

- **Open RhoStudio** using the appropriate launch script for your development host. <br>
- **Select File > New > Project**. The New Project window will open. <br>
- **Select 'RhoMobile application'** from wizard list. <br>
- **Click Next**.<br>

![img](http://rhodocs.s3.amazonaws.com/rhostudio-tutorial/new-project-4.0.png)

- On the next screen, **enter a name for your new project**. In the example below, we use "storemanager." 
- **Notice that 'Create application in default workspace' is checked**.
- To save the app in different location, uncheck and Browse to the new location.
- **Click "Finish" when done**.

![img](http://rhodocs.s3.amazonaws.com/rhostudio-tutorial/rhodes-application-wizard-4.0.png)

### From the command line
If you prefer to use the command line or a development environment other than RhoStudio, the `Rhodes` framework can be invoked manually using the commands and parameters below:

	:::term
	Usage: rhodes generator_name [options] [args]

	Generate rhodes application

	Available generators
		api                              Generate API sources from XML API file
		api_test                         Generate megatest XML for API generator
		app                              Generates a new rhodes application.
		extension                        Adds native extension to Rhodes based application.
		model                            Generates a new model for a rhodes application.
		spec                             Adds spec framework to rhodes application.

	General options:
		-p, --pretend                    Run, but do not make any changes.
		-f, --force                      Overwrite files that already exist.
		-s, --skip                       Skip files that already exist.
		-d, --delete                     Delete files that have previously been generated with this generator.
		--no-color                       Don't colorize the output
		-h, --help                       Show this message
		--debug                          Do not catch errors
		--norhoconnect                   Don't include rhoconnect-client in application


For example, to create an application called 'storemanager,' do the following:

- Open a terminal window
- Switch to the directory in which the app is to be saved
- Execute the command:

<br>
	:::term
	$ rhodes app storemanager


## Project structure
The generated application has the following structure:

![img](http://s3.amazonaws.com/rhodocs/rhostudio-tutorial/project-structure-4.0.png)

Here is an overview of what each file and folder contains.

### /app (folder)
`/app` <br>
is a root-level folder that contains all the Ruby code for your application and its views. In a newly-created application, there are two other folders inside:

`/app/helpers` <br>
contains view helpers, which are used to extract common functionality into reusable functions. Rhodes generates `application_helper.rb` and `browser_helper.rb` automatically; you can add your own as needed.

`/app/Settings`<br>
is the default controller that's invoked when the user taps the "Settings" icon in your application. It shows the status of the data sync process, allows sync-server login/logout, and permits maintenance tasks such as clearing the database.

Other files in the `/app` folder:

`application.rb`<br>
 **is the entry point of your application**. Any startup initialization code should be placed here.

`index.erb`<br>
 **is the first page that will load when the application starts** (unless changed in `build.yml`).

`layout.erb`<br>
**contains elements present in all or most pages**. Because normally all the pages of an applications have a similar structure and layout, it is recommended to extract common elements into a single file to make maintenance easier. Rhodes acknowledges this best practice and provides you with a default template so that your pages (views) do not need to contain duplicated HTML code. Instead, each view will only contain the code specific to that view, which will be merged with the layout when the page is rendered.

`loading*.png`<br>
 - these are splashscreen images for several device orientations and platforms. You will swap these files with your own at some point before deployment

* models / controllers - when you [add a model to your application](local_database), each model will be created in its own folder within `app`. For example, a model called `Product` will produce a `/app/Product` folder.

`build.yml`<br>
file controls compile-time settings such as the name of the application, which extensions to include, which version of the Rhodes SDK to use for compiling, etc. 

`rhoconfig.txt`<br>
Runtime settings of the application are configured here, such as which page to load when the application starts, the URL of the synchronization server, how much logging output to keep, etc.

`Rakefile`<br>
A standard Ruby rakefile, designed to find the appropriate Rhodes SDK and compile your application with it.

### app

### framework
This folder does not exist within your application, but RhoStudio shows it for reference. This is a link to the implementation of the Rhodes framework itself, you should never modify any files in this folder unless you are [contributing to Rhodes](../rhodes/contributing)

### icon
The icon for your application in different formats, as required for each platform (iOS, Android, Windows Mobile, etc).

### public
Any file linked from a view (or that must be reachable by the embedded web browser for any reason) belongs here. Rhodes organizes the files it generates in several sub-directories:

* `css` - stylesheets
* `images` - image files for toolbars, lists, ok and back buttons, etc.
* `jqmobile` - [JQuery Mobile](http://jquerymobile.com), a JavaScript library that helps you build touch-optimized HTML applications for mobile devices
* `jquery` - [JQuery](http://jquery.com), a JavaScript library to manipulate HTML with an easy to use, cross browser syntax
* `js` - general JavaScript files. Your application-specific JavaScript code should be stored in this folder

You can create any other folders and organize your files following any structure you prefer, but it is recommended to stay as close as possible to the default, as this will make things easier when working with a team or asking for help.

## Running your application
### Running from RhoStudio
> Note: If you have yet to apply your license to your instance of Rhodes / RhoElements, you will be prompted when attempting to build to enter your login credentials to rhomobile.com before you can continue. Refer to our [licensing guide](licensing) to learn how to apply your license.

To start your application for the first time, right click your project, then click Run As -> Run Configurations...

![img](http://s3.amazonaws.com/rhodocs/rhostudio-tutorial/running-application-context-menu-4.0.png)

Select "RhoMobile Application" and click the "New" button, then click "Run"

![img](http://s3.amazonaws.com/rhodocs/rhostudio-tutorial/run-configurations-4.0.png)

After a brief compilation period, the application will start in RhoSimulator.

### Running from the command line
> Note: If you have yet to apply your license to your instance of Rhodes / RhoElements, you will be prompted when attempting to build to enter your login credentials to rhomobile.com before you can continue. Refer to our [licensing guide](licensing) to learn how to apply your license.

To start a Rhodes application from the command line, switch to the folder that contains the application and run

	:::term
	rake run:<platform to be simulated>:rhosimulator

where `<platform to be simulated>` can be one of

* `android`
* `bb`
* `iphone`
* `win32` for desktop Windows
* `wm` for Windows Mobile 6
* `wp8` for Windows Phone 8

> Note: Windows Mobile and Windows CE apps that use the webkit will not be able to run in the RhoSimulator because of the limitations of the memory in the simulator.

The application will start inside RhoSimulator with a different look depending on the selected platform

![img](http://s3.amazonaws.com/rhodocs/rhostudio-tutorial/run-rhosimulator-iphone-4.0.png)

![img](http://s3.amazonaws.com/rhodocs/rhostudio-tutorial/rhosimulator-web-inspector-4.0.png)

## Related reading
Now that your first application is ready to run, there are some other topics you should become familiar with:

* [Adding models](local_database)
* [Application configuration](runtime_config)
* Device capabilities like [Barcode](../api/barcode) or [Native UI Components](native_ui_elements)
* Using RhoSimulator in [Javascript applications](../guide/debugging_js) and [Ruby Applications](../guide/debugging_ruby)