# Developing Without RhoStudio
Although installing RhoMobile Suite provides everything you need to build RhoMobile applications through the included RhoStudio IDE, you may wish to use your own IDE to build your RhoMobile applications. This guide describes how to setup your environment as well as how to use the Rhomobile command line options.

## What are Gems?
A RubyGem is a software package, commonly called a “gem”. Gems contain a packaged Ruby application or library. The RubyGems software itself allows you to easily download, install, and manipulate gems on your system. There are three gems included with RhoMobile Suite: `rhodes`, `rhoelements` and `rhoconnect-client`.

For more information on Ruby Gems, visit [Rubygems.org](http://guides.rubygems.org/what-is-a-gem/)

## Installing Rho Gems

Before installing the needed Rho Gems, you must:

* [Install Ruby for your operating system](rhomobile-install) (RhoMobile Suite currently includes version 1.93)

Then, run this command to install the Rho Gems.

	:::term
	$ [sudo] gem install rhodes
	$ [sudo] gem install --local path_to_gem/rhoelements_gem_name.gem
	$ [sudo] gem install --local path_to_gem/rhoconnect-client_gem_name.gem

> Note: Installing RhoMobile Suite will install these gems automatically. You can have multiple versions of these gems installed on your system. By default when building your application the most recent version # is used. Please consult the guide on building for a specific version of RhoMobile.

* The `rhodes` gem is distrubuted to publically availableRuby repositories. The command above will install the latest version available. If you are testing a beta release, you can also use the local syntax for installing a local copy of the gem file

* The `rhoelements` gem is only needed if your application will be taking advantage of mobile APIs and features that are targeted towards enterprise devices. You will also need this gem if you wish to have a Webkit enabled application running on Windows Mobile/CE.

* The `rhoconnect-client` was previosly included in the `rhodes` gem prior to version 4.0. If your application plans on using the RhoConnect client for data synchronization, you will need to install this gem.

## Linking SDKs

You will need the SDKs for the platform you want to build your app on. These instructions are found [here](nativesdksetup).

After you install the gem and your desired SDKs, you need to run:

	:::term
	$ rhodes-setup

This will prompt you for where you installed the SDKs for the various platforms.  The installation script will display its best guess as to where the SDK is. You can then enter a new location, or leave it blank to use the suggestion. If you are not building for a specific platform (for example, you can't build for the iPhone on Windows), you can leave that SDK location blank.

## Generating A Rhodes Application
The first step is to generate the application and base files.  First we will generate an application called StoreManager with the following command:

	:::term
	$ rhodes app storemanager http://localhost:9292/application

This will generate an application directory called "storemanager" with several files.  Note also that the third argument above is the URL to the RhoConnect server data source (required if you want to do synchronized data as we describe in the next section).  Specifically it will set the rhoconfig.txt file to have the following option:

	:::txt
	syncserver = 'http://localhost:9292/application'

If you do not need synchronized offline data, you can leave the third argument out.


The default home screen of the app is defined in the storemanager/app/index.erb file.  You can edit the HTML there to create what your app displays.  You can link to other HTML files and ERB files from there with standard HTML techniques.

## Generating Models
You can also use the command line to add models and controllers. When the model is generated, Rhodes will also create files for a standard UI for displaying and editing the model. This follows the standard model-view-controller paradigm.Get more details on [project structure](creating_a_project#project-structure).

Let's generate a model called "product" and give it some attributes.

	:::term
	$ cd storemanager
	$ rhodes model product brand,name,price,quantity,sku
	Generating with model generator:
		[ADDED]  app/Product/index.erb
		[ADDED]  app/Product/edit.erb
		[ADDED]  app/Product/new.erb
		[ADDED]  app/Product/show.erb
		[ADDED]  app/Product/product_controller.rb
		[ADDED]  app/Product/product.rb
		[ADDED]  app/test/product_spec.rb

> Note: Models created through the command-line-interface will use the [property bag data schema](rhom_ruby#property_bag) by default. To use Fixed Schema instead, have a look at the [fixed schema section](rhom_ruby#fixed_schema) of our [Rhom in Ruby guide](rhom_ruby).

## Building and Running
You build and run for individual platforms using command line options

Running on iphone simulator

	:::term
	rake run:iphone

Running for iOS on RhoSimulator

	:::term
	rake build:iphone:rhosimulator

Running on WM device

	:::term
	rake run:wm:device

> Note: Starting in version 4.1 of RhoElements, no .cab file will be generated within the project when running rake run:wm:device

## Command Line Options
If your IDE or Text-Editor provides a means to launch an external executable, you can integrate RhoMobile development tasks by using command line options. You execute these by the appropriate rake tasks, such as "rake run:android" to run it on the Android emulator. To see all possible rake tasks do the following from your `application project folder`:

	:::term
	$ rake -T

	rake build:android:eclipsebundle         # Build RhoBundle for Eclipse project
	rake build:android:extensions            # Building native extensions
	rake build:android:rhobundle             # Build RhoBundle for android
	rake build:wp8:rhobundle_noext           # Build WP8 rhobundle
	rake build:wp:rhobundle                  # Build WP7 rhobundle
	rake clean:android                       # Clean Android
	rake clean:iphone                        # Clean iphone
	rake clean:win32                         # Clean win32
	rake clean:wince                         # Clean windows ce
	rake clean:wm                            # Clean wm
	rake clean:wp                            # Clean wp
	rake clean:wp8                           # Clean wp
	rake device:android:debug                # Build debug self signed for device
	rake device:android:production           # Build production signed for device
	rake device:iphone:production            # Builds and signs iphone for production
	rake device:symbian:production           # Build production for device
	rake device:win32:production             # Build installer for Windows
	rake device:wince:production             # Build production for device or emulator
	rake device:winxpe:production            # Build installer for Windows XP Embedded
	rake device:wm:production[exclude_dirs]  # Build production for device or emulator
	rake device:wp8:production               # Build production for device
	rake device:wp:production                # Build production for device or emulator
	rake emulator:wp8:production             # Build production for device
	rake run:android                         # build and launch emulator
	rake run:android:device                  # build and install on device
	rake run:android:rhosimulator            # Run application on RhoSimulator
	rake run:iphone                          # Builds everything, launches iphone simulator
	rake run:iphone:rhosimulator             # Run application on RhoSimulator
	rake run:webrickrhologserver[app_path]   # start rholog(webrick) server
	rake run:win32                           # Run win32
	rake run:win32:rhosimulator              # Run application on RhoSimulator
	rake run:wince:device                    # Build and run on the Windows CE device
	rake run:wince:device:cab                # Build, install .cab and run on the Windows CE device
	rake run:wince:rhosimulator              # Run application on RhoSimulator
	rake run:wm                              # Build and run on WM6 emulator
	rake run:wm:cab                          # Build, install .cab and run on WM6 emulator
	rake run:wm:device                       # Build and run on the Windows Mobile device
	rake run:wm:device:cab                   # Build, install .cab and run on the Windows Mobile device
	rake run:wm:rhosimulator                 # Run application on RhoSimulator
	rake run:wp                              # Build, install .xap and run on WP7 emulator
	rake run:wp8                             # Build, install .xap and run on WP8 emulator
	rake run:wp8:device                      # Build, install .xap and run on WP8 device
	rake run:wp8:rhosimulator                # Run application on RhoSimulator
	rake run:wp:device                       # Build, install .xap and run on WP7 device
	rake run:wp:rhosimulator                 # Run application on RhoSimulator
	rake uninstall:android                   # uninstall from emulator
	rake uninstall:android:device            # uninstall from device

> Note: Windows Mobile and Windows CE apps that use the webkit will not be able to run in the RhoSimulator because of the limitations of the memory in the simulator.