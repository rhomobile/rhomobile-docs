# Optimization
This doc is meant to assist with techniques that can optimize your Enterprise Browser app to improve performance.

## Regular Expressions
The Enterprise Browser supports EMML v1.0 (PocketBrowser v2.x) through the use of a regular expressions engine. EMML 1.0 syntax is translated to EMML1.1 (which is internally processed)based on an XML file. After installation this file can be located:

* Windows: \Program Files\EnterpriseBrowser\Config\RegEx.xml.
* Android: /mnt/sdcard/Android/data/com.symbol.enterprisebrowser/RegEx.xml

If your application was written using PocketBrowser v2.x syntax then you will need to ensure that the Regular Expressions engine is running. The Regular Expressions engine can be activated from within the configuration file by setting this flag to 1 as below:

	:::xml
	<General>
		<UseRegularExpressions value='1'/>
	</General>

However, if your application is written in EMML 1.1, REv2 or REv4 syntax, then switching off Regular Expression will save some a lot of machine cycles. Ensure that the Regular Expressions engine is deactivated as below:

	:::xml
	<General>
		<UseRegularExpressions value='0'/>
	</General>

## Logging
The logging options by default are set to capture only errors and warnings. If during development the LogInfo parameter was enabled, it may be prudent to deactivate it as the log engine writes to the file system, which is processor intensive.

## Engine Selection
On Windows Mobile/CE it is possible to select from two different rendering engines; IE control or Webkit. Selecting the IE engine will save on program space as well as RAM usage, but there are caveats.

* No support for CSS 3 and non standard support for CSS 2
* No support for Enterprise Browser primary syntax. The application will need to be written in EMML1.0/1.1

> Note: This is only recommended when running legacy PocketBrowser applications.

## Barcode Scanner
> Note: If you are running a single page app (SPA)then skip this section. 

If you use the barcode scanner in a multi page application, and it is required on more than one page, time can be saved on page load by not disabling it during navigation. By default the barcode scanner is disabled during navigation. If your application requires that the barcode remain enabled, change the value below to “0” in Config.xml as below:

	:::xml
	<Scanner>
		<DisableScannerDuringNavigation value="0"/>
	</Scanner>

> Note: Disabling the scanner during navigation will delay a page load.

## Separated JS API files
When using an API, consider only including the module that is required. See Enabling the API below. Using this method will, in most cases, improve the page load speed in multi page apps as well as consuming less storage space on the device.

### Enabling the API
There are two methods of enabling a JavaScript API:

* Include all ebapi modules or
* Include only the API modules you need

For either of these methods, you'll need to include files from the `/EnterpriseBrowser/JavaScript Files/EnterpriseBrowser` directory on the computer that you installed the Enterprise Browser.

#### Include all JS API modules
To include all JS APIs, you must copy the ebapi-modules.js file to a location accessible by your app's files and include the JavaScript file in your app. For instance, to include the modules file in your index.html, with the file in the same directory as your index.html, you would add the following line to the section of your index.html:

	:::html
	<script type="text/javascript" charset="utf-8" src="ebapi-modules.js"></script>

> Note: The pathing for this file is relative to the current page.

This will define the EB class within the page. Any page you need to use the modules will need to have the .js file included in this fashion.

#### Include only the modules you need
To include single APIs, you must first include the ebapi.js in your HTML as well as the API file you want to use. For instance, to use the AudioCapture API, I would add the following code to my HTML file(s), assuming the API files have been copied to the same directory as the HTML.

	:::html
	<script type="text/javascript" charset="utf-8" src="ebapi.js"></script>
	<script type="text/javascript" charset="utf-8" src="eb.audiocapture.js"></script>

>Note: The ebapi.js file is necessary for all single API inclusions.