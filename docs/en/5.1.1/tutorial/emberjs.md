# EmberJS Tutorial

In this tutorial we will be walking through using Ember.JS with your RhoMobile Application. EmberJS is one of many JavaScript MVC based frameworks that allow you to build very responsive mobile applications. Along with the [EmberJS website](http://emberjs.com/guides/), there are many resources out on the Internet that cover EmberJS in great detail. This tutorial will cover some of the very basics of the framework to get you started using it with RhoMobile. We will be a very simple application to perform CRUD operations on a model representing our Products model.

As you work through the tutorial you will:

* Create a basic Hello Ember JS App 
* Create a Single Page App using Ember JS to include CRUD views for a Data Model
* Integrate Rhom with Ember JS through an adapter to persist the data

##Working with the Tutorial
The tutorial relies on the use of Git versioning system for source code management. You don't need to know anything about Git to follow the tutorial. But you will need to make sure your environment is setup with Git (this is included by default when you install RhomMobile Suite). 

You'll need Git, which you can get from the [Git site]().

Clone the rhotut-emberjs repository located at Github by running the following command:

	git clone https://github.com/rhomobile/rhotut-emberjs.git

This command creates the rhotut-emberjs directory in your current directory.

Change your current directory to rhotut-emberjs:

	cd rhotut-emberjs

The tutorial instructions, from now on, assume you are running all commands from the `rhotut-emberjs` directory.

You can choose to use RhoStudio for editing the files or your own text editor of choice. In the beginning of the tutorial we will just be using a browser and then will be using RhoStudio to build our RhoMobile application. For a browser it is recommended that you use Google Chrome as well as install the Ember JS Chrome add on that we will explain later.