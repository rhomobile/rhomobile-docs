# Developer Environments

RhoStudio is a complete integrated development environment (IDE) that includes a code editor, debugger, simulator and tools for building platform-specific runtimes. The RhoMobile Suite centers around the Rhodes open-source framework for building cross-platform apps. 

Projects can be created from within RhoStudio (an Eclipse-based environment included with the [RhoMobile Suite installation](rhomobile-install)), an IDE of your choosing, from a command line or in the cloud. Under the hood, RhoStudio invokes Rhodes command-line tools anyway, so those approaches are equivalent. 

## Developing with RhoStudio
RhoStudio includes everything needed to build hybrid apps for Android, iOS and Windows Mobile/CE from start to finish. Since it's based on the extensible Eclipse framework, RhoStudio permits developers to customize and enhance its functionality by adding their own plug-ins. However, to build native applications for one or more specific mobile platforms, the developer must also [install native SDK(s)](nativesdksetup) on the development host for each platform to be targeted. Once these have been set up and linked to RhoStudio, the build process takes place completely within RhoStudio.

## Developing with Visual Studio
A [Visual Studio plugin](visualstudio) is available to allow developers to build RhoMobile applications that are targeted for Windows Phone 8 devices. 

about how to use and setup the RhoMobile Visual Studio plugin.

## Developing with Another IDE/Editor
Writing code for your RhoMobile application involves writing JavaScript, HTML, CSS or Ruby. You can use your tool of choice for editing your code whether it is your favorite text editor or an IDE that supports these languages. 

When using text editors or other IDE's, you can use RhoMobile's command line options to run build, deploy and app scaffolding activities.

[Read more](nonrhostudio) about how to use a text editor with RhoMobile's command line options

## Build environments in the cloud with RhoMobile Remote Build
RhoMobile remote build, formerly known as RhoHub, provides all of the supported platform specific build environments so that you can code locally but leverage a hosted environment for the build and packaging process. When using Remote Build you can either use RhoStudio's integrated features or your own text editor. RhoStudio provides one click access and integration to build remotely so that you can code locally but not worry about the hassle of setting up and maintaining local native platform SDKs. You can also use your own local text editor or IDE to write or edit your code and upload thanks to the remote build's GitHub integration.

[Read more](../../hosted/guide/remote-build-guide) about how to use and setup RhoMobile Remote Build.