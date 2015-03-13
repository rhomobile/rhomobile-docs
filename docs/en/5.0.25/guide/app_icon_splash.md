# Application Icon and Splash Screen
## Application Name
In the build.yml in your application folder there is an entry "name". This is the display name that the user will see on the device. Example:

	:::yml
	name: My Own App

## Application Icons
Place your image to use as an icon into the folder called `icon` in your application. If you created an app called `testapp` then the folder would be `testapp/icon`.

* Windows Mobile and Windows: You can add an icon in two formats: `icon.png` and  `icon.ico`.
* iOS 4.0: Apple require three icons for application: 57x57, 72x72 and 114x114 pixels. Prepare such files, name them as `icon57.png`, `icon72.png` and `icon114.png` and place into `icon` folder

	testapp/
		build.yml
		Rakefile
		rhoconfig.txt
		app/
		public/
		icon/
			icon.png
			icon.ico

### iOS
* Target->info->General->Name
* Target->info->Build->Product Name (for all configurations)
* rhodes\platform\iphone\icon.png, icon57.png, icon72.png, icon114.png - change to your icons
* check rhodes\platform\iphone\Info.plist it should contain BundleName=${PRODUCT_NAME}

#### Splash Screen Images on Different Devices
Apple has released a lot of devices with varying sizes and you must account for this in building your app by using the following files for their respective devices.

* loading-568h@2x.png - size 640x1136  - for iPhone 5/5S/5C
* loading-667h@2x.png - size 750x1334  - for iPhone 6
* loading-736h@3x.png - size 1242x2208 - for iPhone 6-Plus

In XCode, these files will be converted to the following file names. also just add the files into the XCode project.

* Default-568h@2x.png - size 640x1136  - for iPhone 5/5S/5C
* Default-667h@2x.png - size 750x1334  - for iPhone 6
* Default-736h@3x.png - size 1242x2208 - for iPone 6 Plus

If you choose to manually add the files into your XCode project, you'll need to also edit your info.plist as such:

	:::xml
	<key>UILaunchImages</key>
	<array>
		<dict>
			<key>UILaunchImageMinimumOSVersion</key>
			<string>8.0</string>
			<key>UILaunchImageName</key>
			<string>Default-568h</string>
			<key>UILaunchImageOrientation</key>
			<string>Portrait</string>
			<key>UILaunchImageSize</key>
			<string>{320, 568}</string>
		</dict>
		<dict>
			<key>UILaunchImageMinimumOSVersion</key>
			<string>8.0</string>
			<key>UILaunchImageName</key>
			<string>Default-667h</string>
			<key>UILaunchImageOrientation</key>
			<string>Portrait</string>
			<key>UILaunchImageSize</key>
			<string>{375, 667}</string>
		</dict>
		<dict>
			<key>UILaunchImageMinimumOSVersion</key>
			<string>8.0</string>
			<key>UILaunchImageName</key>
			<string>Default-736h</string>
			<key>UILaunchImageOrientation</key>
			<string>Portrait</string>
			<key>UILaunchImageSize</key>
			<string>{414, 736}</string>
		</dict>
	</array>

### Android
You can change the icon for your Android application by replacing icon.png, which is in your application icon folder, with a new icon.png.

### Windows Mobile
Windows Mobile Shell program caches program icons. This cache is cleared only when the device or the simulator is restarted. If you change the icon of your application, you have to restart the device or simulator: uninstall/install is not enough.


## Loading screen
Rhodes supports the display of a custom "Loading" screen while your application is launching. This screen's source is the file loading.html, located at <application-root>/app/loading.html.

Alternatively, you can replace loading.html with an image named loading.png if you just want a simple image to be displayed.

You can control how image presented by modifying splash_screen options in [rhoconfig.txt](runtime_config#rhoconfigtxt):

* delay - how long splash screen should be displayed (in seconds)
* center,vcenter,hcenter - picture alignment
* zoom,vzoom,hzoom - scaling options

Examples:

Place the splash screen in the center and show it for 5 seconds:
	:::ruby
	splash_screen='delay=5;center'

Center the splash screen horizontally, scale it vertically to file all available space, and show it for 5 seconds:
	:::ruby
	splash_screen='delay=5;hcenter;vzoom'

You can customize you loading image (showed on start of application) for each platform by platform suffix:

* Android `loading.android.png`
* iPhone `loading.iPhone.png`
* WM `loading.wm.png`

If application doesn't have platform specific `loading.png`, then Rhodes will try to load default `loading.png`.

For iPhone you may define a set of loading images. See Apple documentation about these images, [section Application Launch Images in Build-Time Configuration Details](http://developer.apple.com/library/ios/#documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide/BuildTimeConfiguration/BuildTimeConfiguration.html).

If you are building for iPhone using rake commands, place `loading.png` to your applications "app" folder. If you created an app called `testapp` then the folder would be `testapp/app`. Also you can add some additional images for so loading screen look better on different devices:

* loading.png - size 320x480 - size 320x480 – for iPhone/iPod/iPad and other non iOS devices.
* loading@2x.png - size 640x960 – for from iPhone4/iPod4/Iphone4S (retina).
* loading-Portrait.png - size 768x1024 – for iPad in Portrait orientation.
* loading-Portrait@2x.png - size 1536x2048 - for iPad retina in Portrait orientation.
* loading-PortraitUpsideDown.png - size 768x1024 – for iPad in Portrait Upside Down orientation.
* loading-PortraitUpsideDown@2x.png - size 1536x2048 – for iPad retina in Portrait Upside Down orientation.
* loading-Landscape.png - size 1024x768 – for iPad in Landscape orientation.
* loading-Landscape@2x.png - size 2048x1536 – for iPad retina in Landscape orientation.
* loading-LandscapeLeft.png - size 1024x768 – for iPad in Landscape Left orientation.
* loading-LandscapeLeft@2x.png - size 2048x1536 – for iPad retina in Landscape Left orientation.
* loading-LandscapeRight.png - size 1024x768 - size 1024x768 – for iPad in Landscape Right orientation.
* loading-LandscapeRight@2x.png - size 2048x1536 – for iPad retina in Landscape Right orientation.

If you are using xCode to build for iPhone, you should add to your project Default.png image. You can also add some additional images for better work on different devices:

* Default.png - size 320x480 - for iPhone/iPod/iPhone4/iPad
* Default@2x.png - size 640x960 - for iPhone4/iPod4, if not defined then use Default.png
* Default-Portrait.png - size 768x1024 - for iPad in Portrait orientation on start, if not defined then Default@2x.png will be used
* Default-PortraitUpsideDown.png - size 768x1024 - for iPad in Portrait orientation on start, if not defined then Default-Portrait.png will be used
* Default-Landscape.png - size 1024x768 - for iPad in Landscape orientation on start, if not defined then Default@2x.png will be used
* Default-LandscapeLeft.png - size 1024x768 - for iPad in LandscapeLeft orientation on start, if not defined then Default-Landscape.png will be used
* Default-LandscapeRight.png - size 1024x768 - for iPad in LandscapeRight orientation on start, if not defined then Default-Landscape.png will be used

> Note: Use rake command  "rake build:iphone:setup_xcode_project" to setup the XCode project for changes in the current application (include loading images, icons, etc.)