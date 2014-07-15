# Remote Build Guide
This tutorial shows you how to build a simple product inventory application that allows users to create, retrieve and edit local data without requiring a connection to the Internet.

## Support Matrix
The following is a table showing the versions of Rhodes that are supported for which platforms concerning cloud builds. Note that the end of life date is simply an estimate and will not necessarily be exact to the day.

<table class="table table-condensed table-striped">
	<thead>
		<tr>
			<th style="width:10%;text-align:left;border-right:thin solid #cccccc">Rhodes Version</th>
			<th style="width:20%;text-align:center;border-right:thin solid #cccccc">Estimated End of Life</th>
			<th colspan="6 "style="text-align:center">Platforms</th>
		</tr>

		<tr>
			<th style="width:20%;text-align:center;" colspan="2"></th>
			<th style="text-align:center"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile"></th>
			<th style="text-align:center"><img src="/img/windows.jpg"       style="height: 20px;padding-top: 8px" rel="tooltip" title="Win 32 Desktop" style="height: 30px"></th>
			<th style="text-align:center"><img src="/img/wince.png"         style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows CE" style="height: 30px"></th>
			<th style="text-align:center"><img src="/img/wp8.png"           style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Phone 8, Windows Embedded 8"></th>
			<th style="text-align:center"><img src="/img/android.png"       style="height: 20px;padding-top: 8px" rel="tooltip" title="Android"></th>
			<th style="text-align:center"><img src="/img/ios.png"           style="height: 20px;padding-top: 8px" rel="tooltip" title="iOS"></th>
		</tr>
	</thead>

	<tbody>
		<tr>
			<td><a href="/en/2.2.0/rhodes/introduction">3.4.2.1</a></td>
			<td style="width:20%;text-align:center;">June 31, 2014</th>
			<td style="text-align:center"><span class="icon-shopping-cart icon-primary" rel="tooltip" title="Requires License"></span></td>
			<td style="text-align:center"><span class="icon-check icon-primary"></span></td>
			<td style="text-align:center"><span class="icon-remove icon-warning"></span></td>
			<td style="text-align:center"><span class="icon-remove icon-warning"></span></td>
			<td style="text-align:center"><span class="icon-remove icon-warning"></span></td>
			<td style="text-align:center"><span class="icon-remove icon-warning"></span></td>
		</tr>

		<tr>
			<td><a href="/en/2.2.0/rhodes/introduction">3.5.1.14</a></td>
			<td style="width:20%;text-align:center;">July 7, 2014</th>
			<td style="text-align:center"><span class="icon-shopping-cart icon-primary" rel="tooltip" title="Requires License"></span></td>
			<td style="text-align:center"><span class="icon-check icon-primary"></span></td>
			<td style="text-align:center"><span class="icon-remove icon-warning"></span></td>
			<td style="text-align:center"><span class="icon-remove icon-warning"></span></td>
			<td style="text-align:center"><span class="icon-check icon-primary"></span></td>
			<td style="text-align:center"><span class="icon-check icon-primary"></span></td>
		</tr>

		<tr>
			<td><a href="/en/4.0.0/guide/welcome">4.0.9</a></td>
			<td style="width:20%;text-align:center;">Q1 - Q2 2015</th>
			<td style="text-align:center"><span class="icon-shopping-cart icon-primary" rel="tooltip" title="Requires License"></span></td>
			<td style="text-align:center"><span class="icon-check icon-primary"></span></td>
			<td style="text-align:center"><span class="icon-remove icon-warning"></span></td>
			<td style="text-align:center"><span class="icon-remove icon-warning"></span></td>
			<td style="text-align:center"><span class="icon-check icon-primary"></span></td>
			<td style="text-align:center"><span class="icon-check icon-primary"></span></td>
		</tr>

		<tr>
			<td><a href="/en/4.1.0/guide/welcome">4.1.6</a></td>
			<td style="width:20%;text-align:center;">Q3 - Q4, 2015</th>
			<td style="text-align:center"><span class="icon-shopping-cart icon-primary" rel="tooltip" title="Requires License"></span></td>
			<td style="text-align:center"><span class="icon-check icon-primary"></span></td>
			<td style="text-align:center"><span class="icon-remove icon-warning"></span></td>
			<td style="text-align:center"><span class="icon-remove icon-warning"></span></td>
			<td style="text-align:center"><span class="icon-check icon-primary"></span></td>
			<td style="text-align:center"><span class="icon-check icon-primary"></span></td>
		</tr>

		<tr>
			<td><a href="/en/4.1.0/guide/welcome">5.0.x</a></td>
			<td style="width:20%;text-align:center;">Q1 - Q2, 2016</th>
			<td style="text-align:center"><span class="icon-shopping-cart icon-primary" rel="tooltip" title="Requires License"></span></td>
			<td style="text-align:center"><span class="icon-check icon-primary"></span></td>
			<td style="text-align:center"><span class="icon-check icon-primary"></span></td>
			<td style="text-align:center"><span class="icon-remove icon-warning"></span></td>
			<td style="text-align:center"><span class="icon-check icon-primary"></span></td>
			<td style="text-align:center"><span class="icon-check icon-primary"></span></td>
		</tr>
	</tbody>
</table>

NOTE: Dates for estimated End of Life are subject to change as release dates of next versions change.

## Setup
Before building remotely, you'll need to sign up for a [subscription plan](http://www.rhomobile.com/pricing.html) of either silver or gold; only paid subscription plans allow the use of the remote build feature. Refer to the [licensing](../../edge/guide/licensing) doc for assistance on signing up and applying your remote build token.

## Generating an App
Using RhoMobile's product suite, apps can be built using either the command line interface, or with our eclipse based IDE, RhoStudio. All steps will be shown using both methods.

### App structure
RhoMobile makes the entire app creation process extremely quick by auto-generating common files for you so that you can get into coding your specific app as soon as possible. During either of these processes you'll see the framework create all the necessary files.

#### Generate Using CLI
To generate the app's structure using the command line, simply run the following command:

	:::term
	$ rhodes app <appanme>

#### Generate in RhoStudio
To generate the app's structure using RhoStudio, follow these steps:

1. Select new app creation File > New > Project.
2. Select RhoMobile Application and click Next.
3. Type in a name for your app, choose whether or not to make a RhoElements app, and click Finish.

At this point, you can actually build the app for the platform of your choice and you'll have a fully functioning, bare-bones app. It currently does nothing but you have created the structure of a running app in just about a minute, with no coding necessary on your part. but how do we get this app to build in the cloud?

## Remotely Building Your App
Once you've set up your account and generated an app it's time to build that app for a device. To build locally using RhoStudio or the command line interface follow our guide on [running your app locally](../../edge/guide/creating_a_project). To build your app remotely, start by logging into your [rhomobile.com account](rhomobile.com/login) and add an app to your account that has the same name as the app that you just created in RhoStudio or with the CLI. The name of the remote project does not need to be the same but it aids in reducing confusion. If you experience trouble during any of the steps below, please see our [troubleshooting](#troubleshooting) section below.

Once you have created the remote end of the app you will see a screen like this:

<img src="https://s3.amazonaws.com/rhodocs/cloud/remote-build-guide/app_details.png">

On this screen you can either build your app remotely from inside your browser or you can copy the git URL to build from RhoStudio or the command line. For the purposes of this guide, let's copy the git URL by clicking the copy icon next to the Git URL field. Once you have done that, you'll need to associate your local project with yout remote project.

Open you command line utility (terminal on Mac and cmd on Windows), navigate to your projects root folder and run the following commands:

	:::term
	$ git init
	$ git remote add origin <Your Git URL>
	$ touch README.md
	$ git add .
	$ git commit -m 'Initial commit'
	$ git push -u origin master

Let's walk through these commands to understand what's going on.

* `git init` 														 - This initializes your local project's directory as a git repository.
* `git remote add origin <Your Git URL>` - This will associate the remote git repo that you specify using your Git URL to the local repo.
* `touch README.md` 										 - This creates a README markdown file. You can use this file to describe to others what your app is all about. This step is optional.
* `git add .` 													 - This stages all the files in your project to be committed and pushed to the remote repo. Note, the `add .` command should not be used frequently, it is used here as an initial startup process. Usually you'll want to add files individually as to not commit files mistakenly.
* `git commit -m 'Initial commit'`			 - This will finalize the addition of the files you have just added and will make note that this is the initial commit of this repo.
* `git push -u origin master`						 - This will upload the files you have committed to the remote repo. The `-u` option is used to set the upstream endpoint so that in the future, all you need to use is `git push` to upload to origin/master. In this case, "origin" is the name of our remote endpoint and "master" is the name of the branch we are pushing code up to. If you wanted to push to a different branch you would use `git push -u origin <your_branch>`.

That's all there is to it! You can now build your app remotely on rhomobile.com.

## Troubleshooting
Here are a few issues that may come up while you are attempting to build remotely:

#### Q: I'm getting the error 'Missing or invalid 'android' section in rhobuild.yml' when I attempt to build my app.
A: This is an issue that comes up when you have not configured your settings correctly in your rhobuild.yml file. To fix this in RhoStudio, open the RhoMobile > Android section in the preferences and fill in the correct information for the Android SDK and NDK. The same thing goes for incorrect information for Windows Mobile builds, only that you will need to fill out the Windows Mobile section instead of the android section. See our [RhoBuild.yml section of the build config doc](../../edge/guide/build_config#rhobuildyml-configuration) for more information.

#### Q: I'm getting the error 'Current project folder ... is not versioned by git' when trying to build remotely.
A: This error is caused by not having setup your app's remote endpoint yet. Follow the instructions [here](#remotely-building-your-app) to get setup.

#### Q: I'm getting the error Current project folder ... has git origin <remote GitHub repo> It is not supported by cloud build system.
A: This happens when you are trying to build remotely to a GitHub repo instead of a remote repo on rhomobile.com. You must change the remote repo that is associated with your local project folder to one that exists on rhomobile.com.

#### Q: I'm getting the error "error: src refspec <branch> does not match any. error: failed to push some refs to '<Git URL>'"
A: You'll get this error if you forget to add and commit your changes before your initial push. Follow the instructions [here](#remotely-building-your-app) closely to remedy this.