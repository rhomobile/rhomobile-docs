# Adding Applications
<div class="row-fluid">
	<div class="span6">
		<p>Now you need to add apps to your gallery. Click the New App button.</p>
	</div>
	<div class="span6">
		<img src="https://s3.amazonaws.com/rhodocs/cloud/tutorial/rhogallery-tutorial/rhogallery-new-app.png"/>
	</div>
</div>

## Step 1: Name, Description, and Icon
<div class="row-fluid">
	<div class="span6">
		<img src="https://s3.amazonaws.com/rhodocs/cloud/tutorial/rhogallery-tutorial/rhogallery-new-app-details.png"/>
	</div>
	<div class="span6">
		<p>In the Add new app pop-up, enter the name you want for your app. Optionally you can add a description and an icon to your app. When you are done editing the details, click "Save and Add Build" only once as it takes time for the build to be added.</p>
	</div>
</div>

## Step 2: App Package Details
<div class="row-fluid">
	<div class="span6">
		<p>Choose a platform for which to add a build. To expand the platform sections, click the "gears" in the upper-right hand corner of the platform logo tile.</p>
	</div>
	<div class="span6">
		<img src="https://s3.amazonaws.com/rhodocs/cloud/tutorial/rhogallery-tutorial/rhogallery-add-app-build.png"/>
	</div>
</div>

---

<div class="row-fluid">
	<div class="span6">
		<img src="https://s3.amazonaws.com/rhodocs/cloud/tutorial/rhogallery-tutorial/rhogallery-add-app-build-details.png"/>
	</div>
	<div class="span6">
		<p>Here you'll need to fill in the information necessary to add the build to your gallery:</p>
		<p>Version and Bundle are required but are up to you. For Bundle, we recommend a <code>com.rhomobile.&lt;appname&gt;</code> naming scheme.</p>
	</div>
</div>

## Step 3: Select the Build Type
Build source has three options:

* **"RhoHub Build"**     - One of your builds of a rhomobile.com remote build (formerly known as RhoHub).
* **"Local Files"**      - App package files local to your computer. The details screen will tell you which files are necessary.
* **"Remote Build URL"** - The URL to a GitHub repo or any remote repository containing your app package files.

### RhoHub Build
<div class="row-fluid">
	<div class="span6">
		<p>For RhoHub Build, select a rhomobile.com remote build for a Rhodes application in your RhoMobile account account.</p>
	</div>
	<div class="span6">
		<img src="https://s3.amazonaws.com/rhodocs/cloud/tutorial/rhogallery-tutorial/rhogallery-add-app-build-details-rhohub-build.png"/>
	</div>
</div>

### Local Build
For Local Build, click the Select Files button, then navigate to and select the files for your application on your local computer to be uploaded to your RhoHub gallery. 

 * **Windows Mobile/Windows CE**: .cab file.
 * **Windows Phone 8**: .xap file.
 * **Windows Desktop**: .exe file.
 * **Android**: Signed .apk file. 
 * **iPhone**: .plist file, .ipa file. Optionally iPad icon, 2x icon, small icon, small iPad icon, 2x iPad icon.

This application does not have to be Rhodes-built; it can be any app that you have created on your computer however, the app type must match the platform you selected.

For an iPhone app on a local build, you need to create a .plist file that you will upload to your RhoHub gallery. Use this sample [iPhone plist](https://gist.github.com/826832) as a template.

This .plist file has its base URL set to example.com. That is required for RhoHub local builds.

Edit this .plist file to point to your iOS application (.ipa) file: edit this line, replacing MyApp.ipa with the name of your .ipa file.

	:::xml
	<string>http://example.com/MyApp.ipa</string>

Edit the .plist so its image URLs point to your image files: edit lines like this, replacing the image names with the names of your image files.

	:::xml
	<string>http://example.com/icon512.png</string>

Edit the .plist file so that its bundle-identifier matches the app ID that you entered in step 2, and its bundle-version matches the version number that you entered in step 2. Look for this section in the .plist file and replace com.acme.rhodesapp and 1.0 with your app ID and version number.

	:::xml
	<key>bundle-identifier</key>
	<string>com.acme.rhodesapp</string>
	<key>bundle-version</key>
	<string>1.0</string>

After you have selected the .plist file and the .ipa file, click Next.

### Remote Build

For Remote Build, enter the link to the application file. No need for the other files.

 * **Windows Mobile/Windows CE**: .cab file.
 * **Windows Phone 8**: .xap file.
 * **Windows Desktop**: .exe file.
 * **Android**: .apk file. 
 * **iPhone**: .plist file

## Step 4: Save
<div class='row-fluid'>
	<div class='span6'>
		<p>Once you have finished specifying the details of your app's build to add to the gallery, click "Save Changes" and you now have an app in your RhoHub gallery.</p>
	</div>
	<div class='span6'>
		<img src="https://s3.amazonaws.com/rhodocs/cloud/tutorial/rhogallery-tutorial/rhogallery-gallery-with-app.png">
	</div>
</div>