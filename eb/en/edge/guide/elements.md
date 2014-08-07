#RhoElements 2.x and Pocketbrowser Migration Guide

Enterprise Browser supports Pocketbrowser and RhoElements 2.x applications in most cases with out making any changes to your application.

## Config.xml
You will need to replace the version of the Config.xml with the version of Config.xml that comes with Enterprise Browser. Be sure to make the necessary changes to this file to point to your application and customize any other options that you had in PocketBrowser and RhoElements. Consult the [Configuration Reference](../guide/configreference) for more information.

## Meta Tags
In Pocketbrowser and RhoElements, you could easily access functionality through the use of meta-tags. For  example:

	:::html
	<META HTTP-Equiv="scanner" Content="Enable">
	<META HTTP-Equiv="scanner" Content="AutoEnter:Enabled">
	<META HTTP-Equiv="scanner" Content="Start"> 

Enterprise Browser supports the use of these Meta Tags without any changes to your code on Windows Mobile/CE and Android

## JavaScript Usage
In RhoElements 2.x and PocketBrowser there was the ability to access functionality through the use of Javascript like:

	:::javascript
	// scanner is a Rholements 2.x API
	scanner.start();

	// generic is a JS object in PocketBrowser and RhoElements
	generic.InvokeMETAFunction('SignatureCapture', 'Visibility:Visible');

To use RhoElements or PocketBrowser JavaScript objects within Enterprise Browser, you must include the `elements.js` file within your HTML code. This file is located in the Enterprise Browser installation folder:

TBD Insert ScreenShot

	:::html
	<html>
		<head>
			<script type="text/javascript" charset="utf-8" src="elements.js"></script>
 