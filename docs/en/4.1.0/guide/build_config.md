# Build time configuration
Build time settings are dictated by a file in your app directory called `build.yml`. By default, this file has the most commonly used settings and some defaults that will work fine for most platforms. However, you may need to modify it at certain points. For example, if you need to build for an iOS device, you'll need to change the iphone: sdk: section to use an `iphoneos` SDK instead of an `iphonesimulator` SDK. This doc will provide guidelines and examples of how to modify this file without jeopardizing your app.

## Default build.yml Settings
When you create your app, a default version of the build.yml file will be generated and it will look like this:

	:::yaml
	#sdk: "/Users/michaeltoews/.rvm/gems/ruby-2.1.0/gems/rhodes-4.1.0"
	sdkversion: 4.1.0
	name: build_yml_4.2
	version: 1.0
	vendor: rhomobile
	build: debug
	applog: rholog.txt
	iphone:
		configuration: Release
		sdk: iphonesimulator7.0
		provisionprofile:
		codesignidentity: iPhone Developer
		entitlements: ""
		BundleIdentifier: com.rhomobile.buildyml4.2
		BundleURLScheme: buildyml4.2
	wp8:
		productid: '1d03b940-8ef3-0132-ec6b-7831c1c374dc'
	android:
		manifest_template: 'AndroidManifest.erb'
		version: 2.3.3

	wm:
		#sdk: "MC3000c50b (ARMV4I)"
		#sdk: "Windows Mobile 6.5.3 Professional DTK (ARMV4I)"

	extensions: ["rhoconnect-client"]

### Settings Details
<table class="table table-striped table-bordered table-condensed">
	<tr>
		<th>Group\\Setting</th>
		<th>Description</th>
		<th width="12%">Possible Values</th>
		<th>Example</th>
	</tr>
	<tr>
		<td class="clsEvenRow">sdk</td>
		<td class="clsEvenRow">Path to your rhodes gem. This is commented out by default to let rhodes determine the latest gem and use that. If you have multiple rhodes gems and you wish to use one that is not the latest one, specify that here.</td>
		<td class="clsEvenRow">String</td>
		<td class="clsEvenRow">"/path/to/rhodes_gem"</td>
	</tr>
	<tr>
		<td>sdkversion</td>
		<td>The version of your Rhodes gem.</td>
		<td>Rhodes Version</td>
		<td>5.0.25</td>
	</tr>
	<tr>
		<td class="clsEvenRow">name</td>
		<td class="clsEvenRow">The name of your app.</td>
		<td class="clsEvenRow">String</td>
		<td class="clsEvenRow">My RhoMobile App</td>
	</tr>
	<tr>
		<td>version</td>
		<td>The version of your app.</td>
		<td>App Version</td>
		<td>1.0.5</td>
	</tr>
	<tr>
		<td class="clsEvenRow">vendor</td>
		<td class="clsEvenRow">The name that will be set as the vendor of your app. Usually this will be your Company's name.</td>
		<td class="clsEvenRow">String</td>
		<td class="clsEvenRow">RhoApp Builders, Inc.</td>
	</tr>
	<tr>
		<td>build</td>
		<td>Build configuration of this version of your app.</td>
		<td>Debug<br>development<br>release</td>
		<td>development</td>
	</tr>
	<tr>
		<td class="clsEvenRow">applog</td>
		<td class="clsEvenRow">Name of app log file on the device.</td>
		<td class="clsEvenRow">Log file name</td>
		<td class="clsEvenRow">/path/to/log_file.txt</td>
	</tr>
	<tr>
		<td>iphone\\configuration</td>
		<td>Build configuration to pass to XCode.</td>
		<td>Debug<br>Distribution<br>Release</td>
		<td>Distribution</td>
	</tr>
	<tr>
		<td class="clsEvenRow">iphone\\sdk</td>
		<td class="clsEvenRow">The version of the sdk used to build. Typically, iphonesimulatorX.X or iphoneosX.X.</td>
		<td class="clsEvenRow">iPhone SDK Version</td>
		<td class="clsEvenRow">iphoneos8.0</td>
	</tr>
	<tr>
		<td>iphone\\provisionprofile</td>
		<td>The UUID of your provisioning profile to use when signing.</td>
		<td>UUID</td>
		<td>xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx</td>
	</tr>
	<tr>
		<td class="clsEvenRow">iphone\\codesignidentity</td>
		<td class="clsEvenRow">The name of the code signing identity to use when signing for device.</td>
		<td class="clsEvenRow">Code Sign Identity, String</td>
		<td class="clsEvenRow">rhoAppDevIdentity</td>
	</tr>
	<tr>
		<td>iphone\\entitlements</td>
		<td>Property list file for entitlements for your build. Typically, Entitlements.plist.</td>
		<td>.plist file</td>
		<td>myAppEntitlements.plist</td>
	</tr>
	<tr>
		<td class="clsEvenRow">iphone\\BundleIdentifier</td>
		<td class="clsEvenRow">Bundle identifier – used in provisioning profile.</td>
		<td class="clsEvenRow">String</td>
		<td class="clsEvenRow">com.rhoappbuildersinc.myrhodesapp</td>
	</tr>
	<tr>
		<td>iphone\\BundleURLScheme</td>
		<td>Bundle URL scheme of your app (used for opening your application from another application by using custom URL scheme).</td>
		<td>String</td>
		<td>My Rhodes App</td>
	</tr>
	<tr>
		<td class="clsEvenRow">wp8\\productid</td>
		<td class="clsEvenRow">A productid GUID to application build.yml.</td>
		<td class="clsEvenRow">GUID</td>
		<td class="clsEvenRow">'17d460b0-701f-0131-ea62-482a14303cd5'</td>
	</tr>
	<tr>
		<td>android\\Manifest Template</td>
		<td>It is possible to specify manifest erb template file at build.yml.</td>
		<td>Manifest Template File</td>
		<td>manifest_template: 'AndroidManifest.erb</td>
	</tr>
	<tr>
		<td class="clsEvenRow">android\\version</td>
		<td class="clsEvenRow">The version of Android for which you will be building.</td>
		<td class="clsEvenRow">Android version</td>
		<td class="clsEvenRow">2.3.3</td>
	</tr>
	<tr>
		<td>extensions</td>
		<td>Comma-separated list of extensions your app will be using.</td>
		<td>Comma-separated list</td>
		<td>["rhoconnect-client"]</td>
	</tr>
</table>

## Other Build-time Settings
The following are some non-default settings that you may add to the build.yml in certain circumstances.
<table class="table table-striped table-bordered table-condensed">
	<tr>
		<th>Group\\Setting</th>
		<th>Description</th>
		<th width="12%">Possible Values</th>
		<th>Example</th>
	</tr>
	<tr>
		<td class="clsEvenRow">App Type</td>
		<td class="clsEvenRow">If you are building an app for Windows Mobile or Windows CE you must specify the app_type as "rhoelements" in your build.yml file. By default, this value does not exist in the build.yml and is only necessary to specify a RhoElements licensed app.</td>
		<td class="clsEvenRow">"rhoelements"</td>
		<td class="clsEvenRow">app_type: "rhoelements"</td>
	</tr>
	<tr>
		<td>Android Title</td>
		<td>If you want your app to hide the default android title bar, you need to set <code>android_title</code> to '0' in your build.yml file.</td>
		<td>0 - Hidden</br>1 - Visible</td>
		<td>android_title: 0</td>
	</tr>
	<tr>
		<td class="clsEvenRow">JS API Bridge</td>
		<td class="clsEvenRow">This option is typically only used for debugging purposes. If your AJAX-based app is not working properly, you can set this to true. If your application code resides on a remote server (as opposed to running locally), the Rhomobile Javascript APIs will not be available when this settings = <code>true</code>.</td>
		<td class="clsEvenRow">true - Enabled</br>false - Disabled</td>
		<td class="clsEvenRow">ajax_api_bridge: true</td>
	</tr>
	<tr>
		<td>JavaScript and CSS Obfuscation</td>
		<td>To enable JavaScript and/or CSS code obfuscation of the files in the <code>public</code> folder of your app, just add the following lines to the build.yml:
			<br/>
				<code>obfuscate:<br/>
				&nbsp;&nbsp;js: yes<br/>
				&nbsp;&nbsp;css: yes<br/>
				&nbsp;&nbsp;exclude_dirs: ["jqmobile", "jqtouch", "jquery"]</code>
				NOTE: The <code>jqmobile</code>, <code>jqtouch</code>, and <code>jquery</code> folders <b>must</b> be excluded when obfuscation is enabled, because the obfuscated versions of these libraries are there already.</td>
		<td>If JavaScript or CSS code obfuscation is not required, then just omit <code>js</code> or <code>css</code> line accordingly.</td>
		<td>
			obfuscate:<br/>
			&nbsp;&nbsp;js: yes<br/>
			&nbsp;&nbsp;css: yes</td>
	</tr>
	<tr>
		<td class="clsEvenRow">Building for Intel-Based Processors on Android</td>
		<td class="clsEvenRow">By default, the build process will build only for ARM-based processors but, Rhodes can be configured to build for Intel-based processors instead. To build for such a device, you must set a flag in your build.yml file. You can also elect to build for both arm AND Intel-based processor by specifying <code>abis: [arm, x86]</code>.</td>
		<td class="clsEvenRow">x86 - Build for Intel Processors<br/>arm - Build for arm-based processors</td>
		<td class="clsEvenRow">android:<br/>&nbsp;&nbsp;abis: [x86]</td>
	</tr>
	<tr>
		<td>Production iOS</td>
		<td>To build iOS for production, there are a few settings that need to be added to your build.yml file in order to allow Rhodes correctly configure the build. You'll need to add the <code>mobileprovision</code> file, the <code>certificate_file</code>, and the <code>certificate_password</code> in a production sub-heading in the iphone section of the build.yml as shown below.
			<code><br/>
				iphone:<br/>
				...<br/>
				&nbsp;&nbsp;production:<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;mobileprovision_file: "./production/PROVISION.mobileprovision"<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;certificate_file: "./production/CERTS.p12"<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;certificate_password: "PASSWORD"
			</code>
		</td>
		<td>you'll need to add your custom information into the appropriate fields here.</td>
		<td>mobileprovision_file: "./production/PROVISION.mobileprovision"<br/>certificate_file: "./production/CERTS.p12"<br/>certificate_password: "PASSWORD"</td>
	</tr>
</table>

## Capabilities
There are two ways of modifying your app's capabilities:

* Direct Edit - Just open the file and edit it.
* RhoStudio Modification - The RhoStudio IDE provides a GUI for modifying the capabilities using check-boxes.

### Direct edit
You can easily change specific settings in your build.yml file by simply opening it in you favorite text editor and modifying the text.

To enable specific device capabilities, edit your application's build.yml as follows:

		:::yaml
		capabilities:
			- camera
			- gps
		android:
			capabilities:
				- network_state

Rhodes support common plus platform-specific capabilities. They are merged into a single list at build time.

** NOTE: Right now only Android recognizes these platform specific configuration options. However, we are planning to enable these options across all platforms. **

List of supported capabilities:

* audio: allow using of audio hardware (record audio, modify audio settings)
* camera: allow use of hardware camera
* gps: allow use of geo location service
* network_state: allow read device network state (connected/disconnected)
* phone: allow make calls/read phone state
* pim: allow read/modify personal information and contacts
* push: allow to use PUSH on device
* record_audio: allow recording audio ('audio' implies it)
* vibrate: allow to use hardware vibration mechanism
* bluetooth: allow to use bluetooth hardware
* calendar: allow access to default device calendar
* sdcard: allow writing to SD card on Android devices

#### Windows Mobile Specific Settings
		:::yaml
		wm:
			rhoelements:
				config: "/Config/Config.xml"

* config : path to the custom [Config.xml](runtime_config#configxml) file to use. This path is relative to the Rhomobile Project.

#### Android Specific Settings
The capabilities listed above are directly related to the Android device capabilities that your app will require and that the user will be asked to give permission to when installing the app. You can add capabilities to your Android app by adding a capabilities section to your build.yml in the android heading as such:

		:::yaml
		android:
			capabilities:
					- hardware_acceleration
			mapping: yes
			extensions:
					- gmaps

* hardware_acceleration: enables the hardware_acceleration capability for Android applications
* mapping: enables the use of mapping apps.
* gmaps extension: enables the use of Google maps for mapping. In RhoStudio, you can double-click on your application's build.yml and edit from the text editor; otherwise, you can edit build.yml directly.

### RhoStudio Modification
You can also edit the capabilities that your app will have access to through RhoStudio. To do this, double click your build.yml in your app's project in the project explorer pane in RhoStudio.

<img src="https://s3.amazonaws.com/rhodocs/guide/build_config/open-build-yml-4.1.png">

Once you have done this, you should see the following screen wherein you can modify your build.yml settings, mainly, the capabilities.

<img src="https://s3.amazonaws.com/rhodocs/guide/build_config/build-yml-edit-window-4.1.png">

Click the add button next to the capabilities field to bring up this window and add capabilities by clicking the corresponding check-box.

<img src="https://s3.amazonaws.com/rhodocs/guide/build_config/select-capabilities-rhostudio-none-selected-4.1.png"><img src="https://s3.amazonaws.com/rhodocs/guide/build_config/select-capabilities-rhostudio-camera-and-bt-4.1.png">

You'll notice that as you add capabilities to your app, the build.yml text file will change to reflect these added capabilities.

<img src="https://s3.amazonaws.com/rhodocs/guide/build_config/added-capabilities-in-build-yml-4.1.png">

## RhoGallery Security Token

To restrict access to the application you may have it built with a security token. Specify the security token in the build.yml and build the app. Apps built with a security token can be started in normal mode only if you provide this token as a parameter.
If you do not specify the correct security token in the start params, the app will close on start by default. If you want do something instead of exit (for example show special message or run application in limited mode etc.) you can define another start_path for your application in "rhoconfig.txt":

		:::term
		invalid_security_token_start_path = '/app/InvalidSecurityTokenStartPage'

Specify security token in build.yml:

		:::yml
		security_token: 123

Run application with special parameter:

		:::ruby
		System::run_app( 'app_name', "security_token=123" )