# RhoMobile 4.x Migration guide

## Overview
Enterprise Browser supports applications that were using RhoElements 4.x Shared Runtime or HTML based Hybrid RhoMobile applications on Windows Mobile/CE and Android using HTML and JavaScript. It does not support any Ruby API's or usage from RhoMobile applications. 

## JavaScript Usage
In RhoElements 4.x, access to the features were made available through JavaScript objects under the `Rho.` namespace:

	:::javascript
	// Scan with default options
	Rho.Barcode.take({}, scan_received);

To use the `Rho.` namespace, you must replace the `rhoapi-modules.js` file that came with RhoMobile Suite 4.x with the file `rhoapi-modules.js` that came with Enterprise Browser found in the Enterprise Browser installation folder

<!-- > TBD Insert Screen Shot	 -->
##Intents Android Limitation
On Android Broadcast Intents are set up at build time. To listen to broadcasts from other applications, an entry must be included in the Manifest file for the application to receive them. Since Enterprise Browser is a fixed APK, Broadcast listening will not be possible. 

