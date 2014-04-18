# Build time configuration

## build.yml File

When you generate your app, a default version of the build.yml file will be generated and it will look like this:

	:::yaml
	#sdk: "<Path to Rhodes Gem>"
	sdkversion: <Rhodes Gem Version>
	name: <App Name>
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
	  BundleIdentifier: com.rhomobile.<App Name>
	  BundleURLScheme: <App Name>
	wp:
	  productid: '17d460b0-701f-0131-ea62-482a14303cd5'
	symbian:
	  uid: '0xe4ceb9bc'
	android:
	  version: 2.3.3

	extensions: ["rhoconnect-client"]

### Settings Details

<table class="table table-striped table-bordered table-condensed">
	<tr>
		<th>Group\\Setting</th>
		<th>Description</th>
		<th width="12%">Possible Values</th>
	</tr>
	<tr>
		<td class="clsEvenRow">sdk</td>
		<td class="clsEvenRow">Path to your rhodes gem. This is commented out by default to let rhodes determine the latest gem and use that. If you have multiple rhodes gems and you wish to use one that is not the latest one, specify that here.</td>
		<td class="clsEvenRow">Srting</td>
	</tr>
	<tr>
		<td>sdkversion</td>
		<td>Sets the protocol over which the logging data will be sent.</td>
		<td>SDK Version</td>
	</tr>
	<tr>
		<td class="clsEvenRow">name</td>
		<td class="clsEvenRow">The name of your app.</td>
		<td class="clsEvenRow">String</td>
	</tr>
	<tr>
		<td>version</td>
		<td>The version of your app.</td>
		<td>App Version</td>
	</tr>
	<tr>
		<td class="clsEvenRow">vendor</td>
		<td class="clsEvenRow">The name that will be set as the vendor of your app. Usually this will be your Company's name.</td>
		<td class="clsEvenRow">String</td>
	</tr>
	<tr>
		<td>build</td>
		<td>Build configuration of this version of your app.</td>
		<td>Debug<br>development<br>release</td>
	</tr>
	<tr>
		<td class="clsEvenRow">applog</td>
		<td class="clsEvenRow">Name of app log file on the device.</td>
		<td class="clsEvenRow">Log file name</td>
	</tr>
	<tr>
		<td>iphone\\configuration</td>
		<td>Build configuration to pass to XCode.</td>
		<td>Debug<br>Distribution<br>Release</td>
	</tr>
	<tr>
		<td class="clsEvenRow">iphone\\sdk</td>
		<td class="clsEvenRow">The version of the sdk used to build. Typically iphonesimulatorX.X or iphoneosX.X.</td>
		<td class="clsEvenRow">iPhone SDK Version</td>
	</tr>
	<tr>
		<td>iphone\\provisionprofile</td>
		<td>The UUID of your provisioning profile to use when signing.</td>
		<td>UUID</td>
	</tr>
	<tr>
		<td class="clsEvenRow">iphone\\codesignidentity</td>
		<td class="clsEvenRow">The name of the code signing identity to use when signing for device.</td>
		<td class="clsEvenRow">File size in kilobytes</td>
	</tr>
	<tr>
		<td>iphone\\entitlements</td>
		<td>Property list file for entitlements for your build. Typically is Entitlements.plist.</td>
		<td>.plist file</td>
	</tr>
	<tr>
		<td class="clsEvenRow">iphone\\BundleIdentifier</td>
		<td class="clsEvenRow">Bundle identifier – used in provisioning profile.</td>
		<td class="clsEvenRow">String</td>
	</tr> 
	<tr>
		<td>iphone\\BundleURLScheme</td>
		<td>Bundle URL scheme of your app (used for opening your application from another application by using custom URL scheme).</td>
		<td>String</td>
	</tr>
	<tr>
		<td class="clsEvenRow">wp\\productid</td>
		<td class="clsEvenRow">A productid GUID to application build.yml.</td>
		<td class="clsEvenRow">GUID</td>
	</tr>
	<tr>
		<td>symbian\\uid</td>
		<td>The UID of your Symbian app</td>
		<td>Varying Hex value</td>
	</tr>
	<tr>
		<td class="clsEvenRow">android\\version</td>
		<td class="clsEvenRow">The version of Android for which you will be building.</td>
		<td class="clsEvenRow">Android version</td>
	</tr>
	<tr>
	<td>extensions</td>
	<td>Comma separated list of extensions your app will be using.</td>
	<td></td>
	</tr>
</table>

## Application Permissions and Capabilities

To enable specific device capabilities, edit application's build.yml to add capabilities as below:

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

### Windows Mobile Specific Settings
	:::yaml
	wm:
		rhoelements:
			config: "/Config/Config.xml"

* config : path to the custom [Config.xml](runtime_config#configxml) file to use. This path is relative to the Rhomobile Project.

### Android Specific Settings
	:::yaml
	android:
	  capabilities:
        - hardware_acceleration

* hardware_acceleration: enables the hardware_acceleration capability for Android applications


## RhoGallery Security Token

To restrict access to the application it could be built with a security token. Specify security token in the build.yml and build application. Application built with security token can be started in normal mode only if you provide this token as a parameter.
If you do not specify correct security token in start params, application will close on start by default. If you want do something instead of exit (for example show special message or run application in limited mode etc.) you can define another start_path for your application in "rhoconfig.txt":

	invalid_security_token_start_path = '/app/InvalidSecurityTokenStartPage'

Specify security token in build.yml:

	security_token: 123

Run application with special parameter:
	:::ruby
	System::run_app( 'app_name', "security_token=123" )

## JavaScript and CSS Obfuscation

To enable JavaScript and/or CSS code obfuscation at `public` folder of Rhodes application just add the following lines to the build.yml:

	:::yaml
	obfuscate:
	  js: yes
	  css: yes
	  exclude_dirs: ["jqmobile", "jqtouch", "jquery"]

If JavaScript or CSS code obfuscation is not required, then just omit `js` or `css` line accordingly.

NOTE: The `jqmobile`, `jqtouch`, and `jquery` folders <b>must</b> be excluded when obfuscation is enabled, because the obfuscated versions of these libraries are there already.

