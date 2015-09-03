# Developer Environments

RhoStudio is a complete integrated development environment (IDE) that includes a code editor, debugger, simulator and tools for building platform-specific runtimes. The RhoMobile Suite centers around the Rhodes open-source framework for building cross-platform apps. 

Rhodes-based projects can be created in several ways: From within RhoStudio (an Eclipse-based environment included with the [RhoMobile Suite installation](rhomobile-install)), from within Visual Studio or another IDE of your choosing, from a command line, or in the cloud. Under the hood, RhoStudio invokes the Rhodes command-line tools anyway, so those approaches are equivalent. 

## Developing with RhoStudio
RhoStudio includes everything needed to build *hybrid* apps for Android, iOS and Windows Mobile/CE from start to finish. To build *native* applications locally for one or more specific mobile platforms, the developer also must [install native SDK(s)](nativesdksetup) on the development host for each mobile platform to be targeted. Once these have been set up and linked to RhoStudio, the build process takes place completely within RhoStudio.

>NOTE: For Android builds, please install an Android SDK with API level 22 or lower. RhoMobile 5.2.2 will build successfully with Android versions up to and including Android 5.1 (Android L). For more information, please visit the [Android API documentation](http://developer.android.com/guide/topics/manifest/uses-sdk-element.html#ApiLevels). 


Since it's based on the extensible Eclipse framework, the RhoStudio IDE permits developers to customize and enhance its functionality by adding their own Eclipse plug-ins. The web contains plenty of documentation for building Eclipse Plug-ins. The Eclipse Foundation's [Creating a Plug-in Project](http://help.eclipse.org/juno/index.jsp?topic=%2Forg.eclipse.rse.doc.isv%2Fguide%2Ftutorial%2FpdeProject.html) is a good a place to start. 

## Developing with Visual Studio
A [Visual Studio plug-in](visualstudio) is available that allows developers to build RhoMobile applications that target devices running Windows Phone 8. The plug-in permits Visual Studio developers to generate the application structure, construct data models, edit all code, and build, deploy and run the apps. 

## Using Other IDEs and Editors
RhoMobile applications use HTML and CSS code for the user interface layer, and JavaScript and/or Ruby for adding functionality and accessing device hardware. Any text editor or IDE can be used to create and maintain a RhoMobile app's code files. As applicable, some of those same tools also can be used to execute RhoMobile's command line options to build, deploy and run apps or conduct application scaffolding activities.

For more information about accessing RhoMobile's command line options with alternative toolsets, please refer to the guide on [Developing Without RhoStudio](nonrhostudio). 

## Building in the cloud
[RhoMobile Remote Build](../../hosted/guide/remote-build-guide) (formerly known as RhoHub) provides a cloud-based method of building and packaging apps from code generated on a local development host. This can be useful if, for example, you'd like to build an app that runs natively on an Apple iPad or iPhone but your organization doesn't have any Macs. Remote Build provides a hosted environment for all supported native SDKs, including Android, iOS and Windows Mobile, and removes the need to install and maintain those SDKs on your orginization's local development hosts. 

Remote Build is accessed with a single click from within RhoStudio, a single command at the commamnd line or directly at [rhomobile.com](http://www.rhomobile.com). The hosted tool is integrated with GitHub, and works easily with third-party code editors; simply push code changes to your organization's GitHub repository and let Remote Build do the rest.

To learn more about how to set up and use Zebra's hosted built tools, and about its several limitations, please visit the [RhoMobile Remote Build Guide](../../hosted/guide/remote-build-guide).