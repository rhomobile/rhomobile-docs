# RhoHub Gallery and RhoGallery Tutorial

Now you need to add apps to your gallery. Click the Add a new App button.

<img src="http://rhodocs.s3.amazonaws.com/rhohub-rhogallery/add-new-app-button.jpg"/>

## Step 1: Manage Your App

In the Add new app pop-up window, enter the name you want for your app. You can add an optional description and an optional icon to your app (the icon defaults to a Rhodes logo). Click Next.

<img src="http://rhodocs.s3.amazonaws.com/rhohub-rhogallery/add-new-app-step1.jpg"/>

## Step 2: Device Target

Select the Device type (Android, iOS, Blackberry, Windows Mobile), enter the following:

 * A version number for your app. This number is displayed on the app in RhoGallery on the mobile device.
 * The app ID. For example, for an Android app named fieldservice, you might use com.rhomobile.fieldservice. Enter the app ID in the format for your platform, and unique for your app.
 * A security token. You enter this if you are adding a Rhodes app and you used a security_token setting in your build.yml; the app will only launch if that security token is entered.
 * OS version: the OS version. Only enter this for Blackberry.

<img src="http://rhodocs.s3.amazonaws.com/rhohub-rhogallery/add-new-app-step2.jpg"/>

## Step 3: Select the Build Type

In Step 3: Select Builds, select the type of build. (The pop-up window title changes to Upload Build Sources.)

### RhoHub Build

For RhoHub Build, select a RhoHub build for a Rhodes application in your RhoHub account. Click Next.

<img src="http://rhodocs.s3.amazonaws.com/rhohub-rhogallery/add-new-app-step3-RhoHub.jpg"/>

### Local Build

For Local Build, click the Select Files button, then navigate to and select the files for your application on your local computer to be uploaded to your RhoHub gallery. 

 * Windows Mobile: .cab file.
 * BlackBerry: .jad file and all .cod files.
 * Android: Signed .apk file. 
 * iPhone: .plist file and .ipa file.

This application does not have to be Rhodes-built: it can be any app that you have created on your computer. However, the app type must match the Device type that you selected in Step 2: Device Target.

For an iPhone app on a local build, you need to create a .plist file that you will upload to your RhoHub gallery. Use this sample [iPhone plist](https://gist.github.com/826832) as a template.

This .plist file has its base URL set to example.com. That is required for RhoHub local builds.

Edit this .plist file to point to your iOS application (.ipa) file: edit this line, replacing MyApp.ipa with the name of your .ipa file.

	:::term
	<string>http://example.com/MyApp.ipa</string>

Edit the .plist so its image URLs point to your image files: edit lines like this, replacing the image names with the names of your image files.

	:::term
	<string>http://example.com/icon512.png</string>

Edit the .plist file so that its bundle-identifier matches the app ID that you entered in step 2, and its bundle-version matches the version number that you entered in step 2. Look for this section in the .plist file and replace com.acme.rhodesapp and 1.0 with your app ID and version number.

	:::term
	<key>bundle-identifier</key>
	<string>com.acme.rhodesapp</string>
	<key>bundle-version</key>
	<string>1.0</string>

After you have selected the .plist file and the .ipa file, click Next.

### Remote Build

For Remote Build, enter the link to the application file.

 * Windows Mobile, .cab file.
 * BlackBerry, .jad file.
 * Android, .apk file.
 * iPhone: .plist file. 

This example shows a link to an Android build on toshl.com, a third party expense tracking application.

<img src="http://rhodocs.s3.amazonaws.com/rhohub-rhogallery/add-new-app-step3-remote.jpg"/>

Click Next.

## Step 4: Review

In Review, click Finish.

<img src="http://rhodocs.s3.amazonaws.com/rhohub-rhogallery/add-new-app-review.jpg"/>

You now have an app in your RhoHub gallery. Here is an example of a gallery with a RhoHub app and a remote app.

<img src="http://rhodocs.s3.amazonaws.com/rhohub-rhogallery/rhohub-gallery-apps.jpg"/>