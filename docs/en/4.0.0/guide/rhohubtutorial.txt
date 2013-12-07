RhoHub Tutorial
================

## Introduction

The RhoMobile framework allows you to quickly create and build applications for multiple smartphone operating systems. RhoHub makes building RhoMobile applications even easier, reducing the overhead of getting started and as well as streamlining ongoing development efforts. 

This tutorial shows you how to build a simple product inventory application that allows users to create, retrieve and edit local data without requiring a connection to the Internet.

## Setup

Before using your RhoHub account, you should [install RhoMobile SUite](rhomobile-install). This will install RhoMobile, RhoConnect, RhoStudio, and Git on Windows.

You need to install Git on [Mac](http://code.google.com/p/git-osx-installer/downloads/list?can=3) or [Linux](http://git-scm.com/download).

If you decide not to use RhoStudio, but instead [use your own IDE or text editor](nonrhostudio), you need to install Git on [Mac](http://code.google.com/p/git-osx-installer/downloads/list?can=3), [Windows](http://code.google.com/p/msysgit/), or [Linux](http://git-scm.com/download).

Refer to the [Git resources](#git-resources) for more information on git, such as references and tutorials.

### Create your RhoHub Account

[Create a RhoHub account](https://app.rhohub.com) or if you already have an account, [login](https://app.rhohub.com/login). After signing up, you will receive an email containing a link directing you to `http://app.rhohub.com/your-user-name`.  

Add your SSH public key in the RhoHub "SSH Keys" section of your RhoHub profile. 

NOTE: For help with generating and adding a public key for your operating system, click on the `More Info` button in the upper right corner of your RhoHub Profile page, SSH Keys tab.

* From your home page on RhoHub (`http://app.rhohub.com/your-user-name`), click on your user name, then click Profile in the popup menu to open your Profile.

<img src="http://rhodocs.s3.amazonaws.com/rhohub-tutorial/rhohub-profilemenu-arrow.png">

* On your Profile page, click the `SSH Keys` tab in the left column.

<img src="http://rhodocs.s3.amazonaws.com/rhohub-tutorial/rhohub-ssl.png">

* Click the `Public Key` button. The public key form appears on the page.

<img src="http://rhodocs.s3.amazonaws.com/rhohub-tutorial/rhohub-ssl-publickey.png">

* Copy the contents of your public key and paste it into the "Public Key" field of the form. Type a title for your public key into the form. Then click the Save button.

### Create a RhoMobile App on RhoHub

In RhoHub, you can create a RhoMobile app for your mobile device and a RhoConnect app for your RhoConnect server. You can store these apps in your local git repsoitory. We'll focus first on the RhoMobile application: creating it in RhoHub and local setup for development.

To create your new RhoMobile app, go to [rhohub.com](http://rhohub.com). Log into your account if needed and click Dashboard in the top bar.

<img src="http://rhodocs.s3.amazonaws.com/rhohub-tutorial/rhohub-dashboard.png">

Click the "Create App" button. The "Create a new app" window appears. Click the "Rhodes" button. Give your app a name. Then click the "Create App" button.

<img src="http://rhodocs.s3.amazonaws.com/rhohub-tutorial/rhohub-create-app.png">

Your new RhoMobile app appears in the App info tab.

<img src="http://rhodocs.s3.amazonaws.com/rhohub-tutorial/rhohub-new-rhodes-app.png">

If you click the More Info button to the right of your RhoMobile app name, help text appears with commands that help you install your app to your mobile device once you have built it.

If you click on the small pencil icon to the right of your RhoMobile app name, you can edit the name.

### Setup Local GIT Development for the RhoMobile App

The GIT Url shows the command you use to add your RhoMobile app to your local git repository, such as `git@git.rhohub.com:your-rhohub-account/your-rhoMobile-app.git`. 

Actually, the app in RhoHub is empty: no code. You need to generate the code for that app on your local git repositiory, and then push the app code to your RhoHub account.

Use the following command in your local account to generate the code for your RhoMobile app. 

	:::term
	$ rhodes app your-local-rhomobile-app

If you are new to git, you will need to set up your credentials:

	:::term
	$ git config --global user.name 'John Doe'
	$ git config --global user.email johndoe@example.com

Now you can add the code in your local git repository to RHoHub.

	:::init
	$ cd your-local-rhomobile-app/
	$ git init
	$ git add .
	$ git commit -m "initial commit"
	$ git remote add origin git@git.rhohub.com:your-rhohub-account/your-rhomobile-app.git
	$ git push -u origin master

These commands initialize your local directory containing your Rhodes app code, add that directory to your next Git commit, create your initial commit, add your RhoHub git URL as an alias to your local directory, then push your local code to RhoHub.

For more details on git, see the [git documentation](http://git-scm.com/documentation).

With RhoHub you can pick just one platform SDK for local development and then use the hosted build capability to build and test the other platforms.  This saves significant setup time for developers and creates an efficient workflow.  Since the Android SDK supports Mac, Windows and Linux, we will use it for this tutorial.

## Creating a Simple Application

Next we'll modify the Rhodes application on the local git repository to track store inventory on the device.  We'll create a "product" model object and the UI to create, modify, display and delete data.  Initially we'll focus on building an application that runs completely on the device without server connectivity.

### Verify Setup

To verify that you have installed rhodes, in a terminal type:
	
	:::term
  	$ gem list rhodes

You should see a version of rhodes that is the same or higher than the version that was selected when you built your Rhodes app. For example:
  	
	*** LOCAL GEMS ***
  
	rhodes (3.0.2)

Go to your Rhodes app directory.

	:::term
  	$ cd your-local-rhodes-app

Set up your app to refer to your local Rhodes SDK with the following command:
  
	:::term
	$ set-rhodes-sdk

### Create Product UI

Use the "rhodes" command to generate a model for your RHodes app (in this case we create a 'product' model with five attributes including name, brand, price, quantity and sku):

	:::term
  	$ rhodes model product name,brand,price,quantity,sku

Rhodes provides this app generator tool that quickly generates a controller and views for the identified model.  It can be used to create an entire application with standard screens or "views". You can then modify the views to create exactly the user experience that you want.  

By default, your application will contain views that allow your users to interact with the object, and each attribute you add to your object will be available as field or strings in your UI.   The rhodes app generator also generates your controller file, containing code that supports default actions of listing, creating, displaying, updating and deleting your object will be created for the object as well.  

**NOTE: Each model you create must contain at least one attribute.  Attributes should be named using alphanumeric strings.**

You should see the following output from the rhodes command:

  	Generating with model generator:
	   [ADDED]  app/Product/index.erb
	   [ADDED]  app/Product/edit.erb
	   [ADDED]  app/Product/new.erb
	   [ADDED]  app/Product/show.erb
	   [ADDED]  app/Product/index.bb.erb
	   [ADDED]  app/Product/edit.bb.erb
	   [ADDED]  app/Product/new.bb.erb
	   [ADDED]  app/Product/show.bb.erb
	   [ADDED]  app/Product/product_controller.rb
	   [ADDED]  app/Product/product.rb
	   [ADDED]  app/test/product_spec.rb

The "rhodes model" command generates model, view and controller files.  The view files are ERB (Embedded Ruby) files.  If you are unfamiliar with ERB, see this [cheat sheet](http://cheat.errtheblog.com/s/erb/) or [full reference docs](http://ruby-doc.org/stdlib/libdoc/erb/rdoc/classes/ERB.html).

For this example we only use one object.  You can create additional objects for your app by calling rhodes again to create additional models with corresponding UI.

#### Set the Start Page
By default, a new Rhodes application displays the content in app/index.erb on launch.  In more complex applications, you can edit that file to contain links to different pages in your application. However, since this application only has a single object, we will use the products index as the start page.

Edit "rhoconfig.txt" at the root level of the source directory and define the path to your start page:
	
	start_path = '/app/Product'

**NOTE: Paths are case-sensitive.**

### Saving Local Code Changes to RhoHub

As you modify your code in your local git repository, you can push those modifications to your RhoHub repositroy.

Before you can push your local changes to RhoHub, you must commit the changes you have made with `git commit`. You can perform this command several times before you perform the `git push` that pushes your local changes to RhoHub.

	:::term
	$ git add .
	$ git commit -m "commited all my local changes"

The `git add .` adds all of the files that have been modified or added. The `-m` option in `git commit` specifies the commit message which follows.

When you are ready to add your committed changes to your Rhodes app on your RhoHub account, you need only push them, since you have already set up your local git repository and used the `git push -u origin master` command to simply your future `git push` commands. 

	:::term
	$ git push

### Run the Application

To run the application, Rhodes provides comprehensive scripts which build for a specific device, run the device emulator and then install the build on the emulator.  Using the native SDKs this is a time consuming multi-step process, with Rhodes it can be executed with a single command (although it can still take up to a few minutes to execute, depending on your desktop hardware and mobile platform).

Choose one of the following commands (wm = Windows Mobile, win32 = Windows desktop, bb = Blackberry, iphone or android):

	:::term
  	$ rake run:android
  	$ rake run:iphone
  	$ rake run:bb
  	$ rake run:wm:cab
  	$ rake run:win32

You can use "rake -T" to print a complete list of all of the automated build command with descriptions of what each does.

* Windows is required to test builds and install to a device for BlackBerry, Windows Mobile, and WIndows desktop. Running the simulators in Windows virtual machines such as VMware or Parallels works fine. 
* Mac OS X 10.5+ is required for testing iPhone applications.
* For instructions on installing the mobile SDKs to build for all of the smartphone platforms, see [Build Rhodes Application](nativesdksetup).

Since Android simulators are available for all major operating systems, we'll build our app for Android in this tutorial.

### Using the Inventory application

Your Inventory application features several auto-generated pages corresponding to the actions in your Product object's controller.rb file ("index", "show", "new", "edit", "create", etc). The page we are using as our start page uses the index action and the "/product/index" view file, so the first thing a user will see when launching the application is the list of products they have added.

But our list is empty!  We need to add records to the before they can be displayed in the list! 

To create a new product record, click the "new" button on the index page.  You will see the following page:

<img src="http://img.skitch.com/20100920-n1tb66e43rxm8sqgh1au7xty1k.png"/>

The soft keyboard comes up automatically. You can use the arrow keys to move between text fields.  When the button has focus, the soft keyboard will automatically hide.

When you click "New", the controller creates an instance of the Product object, then renders the page using new.erb.  You can see the method for the "new" action in your applications source code at Product/controller.rb line 24.  

New products you create will be displayed in a list on the index page.  The following screenshots show data entered for the Acme Hovercraft. When you click create, the controller.rb action "create" is called, creating the instance of the object and returning you to the main product page.  The main product index will now show one item in the list.  By default, only the first attribute you created for your object will be displayed to represent the product  -  in this case, Hovercraft has been added to the inventory.

<img src="http://img.skitch.com/20100920-n1fcmdnekn21swgxsqdckx7qe6.png"/>

To view full details of the item's attributes, click the link for that item.  If you click on the "Hovercraft" item, you will see a page that displays all of the attributes for the hovercraft:

<img src="http://img.skitch.com/20100920-rifcp756eeu3icji6ema4rtgda.png"/>

To edit a product, click "Edit" in the top-right.  The application will display a page similar to the "new" page which allows you edit or delete the record.

## Build and Test on Multiple Platforms

Once you have your application working well locally in the simulator for a specific platform, you will want to test across all of the platforms that you plan to support. Using RhoHub, you can build for Android, BlackBerry, Windows Mobile, Windows 7, and iPhone.

Push to RhoHub if you have made changes to your local git repository.

	:::term
	$ git add .
	$ git commit -m "commited all my local changes"
	$ git push

From your RhoHub account page, you will see each of your apps listed. To create a build for your app:

1. Click on your Rhodes app to open it.
2. From your App Info page, select the Target Device and its Platform Version.
3. Click the "Build" button.

<img src="http://rhodocs.s3.amazonaws.com/rhohub-tutorial/rhohub-rhodes-build-arrows.png"/>

### Download

Once the build is finished, you will see "completed" under Status, and a download button:

<img src="http://rhodocs.s3.amazonaws.com/rhohub-tutorial/rhohub-download-arrow.png"/>

Click on the download button to download a zipped file; in the case on Android, the zipped file contains an .apk file. The .apk file is an Android executable. All you need to do is to put the .apk on an http server, browse to it from a device, and you will be prompted to install the application.

## Customizing Views

By default, the index page displays items using the item's first attribute, the name of each product. But what if we have multiple products with the same name from the different manufacturers? We won't be able to distinguish between them from the index alone.  

So that our users won't have to view each record to find out which product is which, let's add the brand attribute to the index page, allowing us to distinguish different products.  To modify the display of our application's index page, we can simply edit the index.erb file.

In your local git repository, open app/Products/index.erb and find the following line (around line 20):

	:::html
	<span class="title"><%= product.name %></span>
	<span class="disclosure_indicator"></span>

Add the product's name to the list item as follows:  

	:::html
	<span class="title">
	  <%= "#{product.brand} #{product.name}" %>
	</span>
	<span class="disclosure_indicator"></span>

Save the file.
On the command line, type:

	:::term
	$ rake run:android

Now you should see the brand and name in the list item.  

**NOTE: You will need to re-enter your test data.**

<img src="http://img.skitch.com/20100920-n5efc3r1jwwcqb7x7639ykuxw3.png"/>

Push your latest changes to RhoHub.

	:::term
	$ git add .
	$ git commit -m "commited all my local changes"
	$ git push

## Creating a RhoConnect App

In RhoHub, you create a RhoConnect app for your RhoConnect server in the same way you create a Rhodes app.

If you are not in your RhoHub account already, go to [rhohub.com](http://rhohub.com). Log into your account if needed and click Dashboard in the top bar.

<img src="http://rhodocs.s3.amazonaws.com/rhohub-tutorial/rhohub-dashboard.png">

Click the "Create App" button. The "Create a new app" window appears. Click the RhoConnect button. Give your app a name. Then click the "Create App" button.

<img src="http://rhodocs.s3.amazonaws.com/rhohub-tutorial/rhohub-create-app-rhoc.png">

Your new RhoConnect app appears in the App info tab.

### Setup Local GIT Development for the RhoConnect App

The GIT Url shows the command you use to add your Rhodes app to your local git repository, such as `git@git.rhohub.com:your-rhohub-account/your-rhoconnect-app.git`. 

As with creating a Rhodes app, the RhoConnect app that you just created in RhoHub is empty: no code. You need to generate the code for that app on your local git repositiory, and then push the app code to your RhoHub account.

Use the following command in your local account to generate the code for your RhoConnect app. 

	:::term
	$ rhodes app your-local-rhoconnect-app

Now you can add the code in your local git repository to RHoHub.

	:::init
	$ cd your-local-rhoconnect-app/
	$ git init
	$ git add .
	$ git commit -m "initial commit"
	$ git remote add origin git@git.rhohub.com:your-rhohub-account/your-rhoconnect-app.git
	$ git push -u origin master

These commands initialize your local directory containing your RhoConnect app code, add that directory to your next Git commit, create your initial commit, add your RhoHub git URL as an alias to your local directory, then push your local code to RhoHub.

Your Rhodes app is pre-configured to use the RhoConnect server. You will need to create a source adapter in your RhoConnect app to connect to whatever backend you want to sync to. See the [RhoConnect tutorial](../rhoconnect/tutorial) for details on how to code that, but you don't need to run the server locally. Then add and commit your edited code (this will include new files you cereated), then push the code to RhoHub.

	:::term
	$ git add .
	$ git commit -m "commited all my local changes"
	$ git push

Then follow the steps below to deploy the server on RhoHub.

### Deploy your RhoConnect app

To deploy your RhoConnect app, open your RhoConnect app, then click the "Deploy" button. 

<img src="http://rhodocs.s3.amazonaws.com/rhohub-tutorial/rhohub-new-rhoconnect-app-barrow.png"/>

The first time you deploy, it will take a few minutes as the server environment is bootstrapped.  Once it is done you will see a deploy url which you can click on to see your [RhoConnect web console](../rhoconnect/web-console).  This url will be static for this RhoConnect app, even if you rename the app.

<img src="http://rhodocs.s3.amazonaws.com/rhohub-tutorial/rhohub-deploy-url-arrow.png"/>

### Login

Now you can launch your Rhodes app and click login -> sync.  In the web console, you should see a new device registered under the username you used to login.

You can view more information about RhoHub's deploy feature by clicking on the "More Info" icon in the RhoHub RhoConnect app.

### Manage Collaborators

Open the "Collaborators" tab for your app to add/edit the app's team.

<img src="http://rhodocs.s3.amazonaws.com/rhohub-tutorial/rhohub-collab.png">

There are two types of collaborators in RhoHub:

1. Owners: Have full read/write access to the app, control of builds and deploys, the ability to rename apps and rename/delete the app, and add/edit the collaborators.
2. Members: Have full read/write access to the app, control of builds and deploys, and can view other collaborators.

To add a collaborator to your app, click the Collaborators tab. Enter the RhoHub user name of the collaborator. Select the type of collaborator. Then click the Add Collaborator button.

Frequently Asked Questions
---

* How do I add gems to my RhoConnect application?

RhoConnect applications are deployed to [Heroku](http://heroku.com), therefore adding new gems is managed by the [.gems file](http://docs.heroku.com/gems).  For example, to add the [rdiscount](http://github.com/rtomayko/rdiscount/) gem to your RhoConnect application, your .gems file would look like:

  	rhoconnect #=> added automatically by RhoHub
  	rdiscount --version 1.6.5

* Where are my RhoHub 1.0 files? 

The latest version of RhoHub uses a new, app-based architecture that organizes your Rhodes and RhoConnect applications.  For this reason, we archived RhoHub 1.0 account files so that you can import them into RhoHub 2.0's app structure if you wish.  If you had a RhoHub 1.0 account, you will notice an "Archived Account Files" link in the upper right when you login.  Here you can access all of your RhoHub 1.0 app files and device builds.

## Useful commands

Show android commands including creating/deleting/updating virtual devices, apps, adb, sdk 
  	
	:::term
	$ android --help 

Show all targets and virtual devices
  
	:::term
	$ android list

## Git Resources

* [http://gitref.org/](http://gitref.org/) - Useful guide and introduction to git
* [http://progit.org/](http://progit.org/) - Open source book on git
* [http://git-scm.com/](http://git-scm.com/) - Git homepage
* [http://try.github.com/](http://try.github.com/) - Try git
* [http://learn.github.com/p/intro.html](http://learn.github.com/p/intro.html) - Learn github

