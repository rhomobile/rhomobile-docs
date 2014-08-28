#RhoElements 2.x Migration Guide

##Overview
Enterprise Browser supports RhoElements 2.x applications in most cases without making any changes to your application.


## Config.xml
You will need to replace the version of the Config.xml with the version of Config.xml that comes with Enterprise Browser. Be sure to make the necessary changes to this file to point to your application and customize any other options that you had in PocketBrowser and RhoElements. Consult the [Configuration Reference](../guide/configreference) for more information.

1. Set the [StartPage](../guide/configreference?StartPage).

		:::xml
		<Configuration>
		    <Applications>
		        <Application>
		            <General>
		                <Name value="Menu"/>
		                <StartPage value="file://%INSTALLDIR%/menu.html" name="Menu"/>
		            </General>
2. Move any offline files to the device.
>If you have any BadLink pages or offline resources (on the device), copy them over now.


## Meta Tags
In Pocketbrowser and RhoElements, you could easily access functionality through the use of meta-tags. For  example:

	:::html
	<META HTTP-Equiv="scanner" Content="Enable">
	<META HTTP-Equiv="scanner" Content="AutoEnter:Enabled">
	<META HTTP-Equiv="scanner" Content="Start"> 

Enterprise Browser supports the use of these Meta Tags without any changes to your code on Windows Mobile/CE and Android

## Android
Since you have chosen Android to run a RhoElements 2.x shared runtime application, you should expect some differences with regard to rendering as the Shared Runtime makes use of Motorola Webkit, and Enterprise Browser uses the Android stock webkit.

### JavaScript APIs
In RhoElements 2.x there was the ability to access functionality through the use of Javascript like:

	:::javascript
	// scanner is a Rholements 2.x API
	scanner.start();

	// generic is a JS object in PocketBrowser and RhoElements
	generic.InvokeMETAFunction('SignatureCapture', 'Visibility:Visible');

To use RhoElements JavaScript objects within Enterprise Browser on Android, you must include the `elements.js` file within your HTML code. This file is located in the Enterprise Browser installation folder:

<!-- TBD Insert ScreenShot -->

	:::html
	<html>
		<head>
			<script type="text/javascript" charset="utf-8" src="elements.js"></script>
 
## Usage Notes
* Generic methods RasConnect & RasDisconnect are not supported.
* NOSIP not supported. The NOSIP control was a solution for placing a text box onto the page that did not trigger the Soft Input Panel. This predates the APIs that now allow us to hide the SIP or place it off screen. There is no support for NOSIP on Enterprise Browser.
* [FitToScreenEnabled](../guide/configreference?FitToScreenEnabled) not supported. This is a function for Windows Mobile only.
* EMML profiles do not work.
* Check the device for hardware compatibility, especially the [barcode scanning](http://docs.rhomobile.com/en/2.2.0/rhoelements/scanner) options. 
