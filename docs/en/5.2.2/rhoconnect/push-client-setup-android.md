Setting Up RhoConnect Push-Based Synchronization with Google Cloud Messaging
===

This chapter contains the steps you need to set up your Android Rhodes client and RhoConnect server for push messaging. After you perform the steps in this chapter, you will finish by performing the [client setup that is needed for all platforms](push-client-setup).

**NOTE: If you are setting up RhoConnect Push Service on an Android client, you do not perform the steps in this chapter. Perform the steps in [RhoConnect Push Service setup](push-client-setup-rps) instead.**

## Setting up Android Google Cloud Messaging

To set up your Android Rhodes client application and RhoConnect server application for RhoConnect Push, you need to set up Android Google Cloud Messaging (GCM).

To do so, perform the following sections from the [GCM Getting Started](http://developer.android.com/google/gcm/gs.html) guide.

1. Creating a Google API project. (This gets a Google API project number which you will set in your Android client application.)
2. Enabling the GCM Service.
3. Obtaining an API Key. (You will set this key in your RhoConnect application.)

You can optionally stop in these Getting Started instructions once you complete the Obtaining an API Key section.

You may read common [GCM docs](http://developer.android.com/guide/google/gcm/index.html) at the Google developer site.

## Setting up RhoConnect Server Application for GCM Push

To set up your RhoConnect application for Android Google Cloud Messaging (GCM), you must have first set up Android Google Cloud Messaging. Then you can find your GCM API key in your [Google apis dashboard](https://code.google.com/apis/console).

Update `settings/settings.yml` to include your GCM API key:

	:::yaml
	:development:
	  :redis: localhost:6379
	  :syncserver: http://localhost:9292/application/
	  :licensefile: settings/license.key
	  :gcm_api_key: your_gcm_api_key_here

## Enabling the Rhodes Android Client for Push

Enable push in your Rhodes client application in build.yml.

	:::yaml
	capabilities:
	  - push

## Setting up the Rhodes Android (GCM) Client

Here are some guidelines for developing and testing an Android application that uses the Android Google Cloud Messaging feature.

* To develop and test your GCM applications, you need to run and debug the applications on an Android 2.2 system image that includes the necessary underlying Google services.
* To develop and debug on an actual device, you need a device running an Android 2.2 system image that includes the Market application.
* To develop and test on the Android Emulator, you need to download the Android 2.2 version of the Google APIs Add-On into your SDK using the Android SDK and AVD Manager. Specifically, you need to download the component named "Google APIs by Google Inc, Android API 8". Then, you need to set up an AVD that uses that system image.
* Android GCM system uses an existing connection for Google services. This requires users to set up their Google account on their mobile devices (and on emulator!).

### Setting up the Google API project ID in Your Client Application

To set up your Rhodes client application for Android Google Cloud Messaging (GCM), you must have first set up Android Google Cloud Messaging, where you noted the Google API project number.

Register the Google API project number for your client application. Modify your application's build.yml to specify the Google API project number used to send PUSH messages:

	:::yaml
	android:
	  push:
	    sender: <Google API project number>

### Setting up Status Bar Notifications for PUSH Messages

On the Android client, it is possible to set up status bar notifications for PUSH messages. In this case, push notification can be shown on the Android status bar after ruby callback. The user can activate application by touching this notification.
There are two modes available for push notifications:
 - <i>always</i> - push notification is shown always
 - <i>background</i> - push notification is shown only if application put into the background (not started)
If no push notification mode is specified in build.yml then no notifications are shown at all.

	:::yaml
	android:
	  push:
	    notifications: background

## Finishing Client Setup

Once you have completed the above steps for setting up push on Android client and RhoConnect server, you must still [perform the client setup that is needed for all platforms](push-client-setup).
