<!-- Launchpad Link id: refnativeandroid
	usage <a data-link="id">blah blah</a>
	replace id
-->
<div class="tableofcontents"> </div>
## Overview
Motorola Solutions offers Android products that are built on Android Open Source Platform (AOSP). Two variants are now being offered on the TC55 and planned for certain future products.

### “Standard Configuration” 
This version of the operating system incorporates Google Mobile Services. All standard Google API's are available to use in your application. Please consult [http://developer.android.com](http://developer.android.com) for details of using these APIs. Your application also has access to the <a data-link="refemdk">EMDK For Android APIs</a> as well.

### “Professional Configuration” 
This version of the operating system does not incorporate Google Mobile Services. Standard Google APIs that doe not rely on the availability of GMS services will work on our devices. Please consult [http://developer.android.com](http://developer.android.com) for details of using these APIs. Your application also has access to the <a data-link="refemdk">EMDK For Android APIs</a> as well.

## About GMS
Google offers a variety of applications and services collectively known as Google Mobile Services (GMS). There are also optional Android API extensions that allow applications to interface with said services. GMS is independent of Android and under a separate license from Google. GMS runs as an add-on above AOSP (Android Open Source Platform)

### GMS Applications and Services

* Google Maps
* Google Play Services
* Google Cloud Messaging
* Google Analytics
* Google+
* Google Mail - Gmail
* Google Cloud Platform
* Google Wallet Instant Buy
* Google Play In-App Billing
* Google Mobile Ads
* Google Drive
* Google Cast

### Challenges with GMS
Careful considering should be made when deciding if your application requires the use of GMS.

* Security 
	* Google Mobile Services requires devices to be identified with a specific GoogleID. 
	* Any enterprise data (Gmail, Maps, Cloud etc) will be pushed through Google’s servers.
	* Gmail content is read by Google servers to improve relevance of advertisements.
* Privacy
	* Google revamped their privacy policy in early 2012 allowing for richer user profiling across all services, for targeted advertising.
	* Usage acceptance allows Google to track a device’s every move.
	* Google may collect IP Addresses, location, nearby Wi-Fi info, local storage and device setting details.  
* Configuration
	* Extra manual steps may be required to be performed when the device boots up for the first time. 

### GMS Alternatives
Depending on the feature your application requires, you my want to consider alternative choices before declaring that your application requires GMS. 

* Mapping
	* Consider cloud based mapping solutions like MapQuest or OpenStreetMap.
	* Consider alternative device resident solutions like ALK CoPilot, Sygic and Tele Atlas to name a few.
* Push Messaging
	* Consider cross-platform solutions like RhoConnect.
	* Consider other cloud based messaging providers like Parse, Amazon SNS, Pushwoosh and others.
* Play Store
	* Consider MDM solutions for application distribution.
	* Consider cross-platform solutions like RhoGallery.
