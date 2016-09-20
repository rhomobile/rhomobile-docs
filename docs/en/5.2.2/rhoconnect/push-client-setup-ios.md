Setting Up RhoConnect Push-Based Synchronization with Apple Push Notification Service
===

This chapter contains the steps you need to set up your iOS Rhodes client and RhoConnect server for push messaging. After you perform the steps in this chapter, you will finish by performing the [client setup that is needed for all platforms](push-client-setup).

## Setting up RhoConnect Server Application for Push to iOS Clients

To set up your RhoConnect application for pushing to an iOS client, you will need to update `settings/settings.yml` to include the following:

	:::yaml
	:development:
	  :redis: localhost:6379
	  :iphonecertfile: settings/apple_push_cert.pem
	  :iphonepassphrase: #=> must be empty or a string, not a number (i.e. "" or "some-secure-passphrase-here")
	  :iphoneserver: gateway.sandbox.push.apple.com
	  :iphoneport: 2195
	  :syncserver: http://localhost:9292/application/
	  :licensefile: settings/license.key

This is for running your application in development mode; for production, you will need all of the iphone settings, and you change the `:iphoneserver:` to:

	:::yaml
  	:iphoneserver: gateway.push.apple.com

## Enabling Rhodes Client for RhoConnect Server Push

Enable push in your rhodes application in build.yml.

	:::yaml
	capabilities:
	  - push

## Setting up the Rhodes iOS (APNS) Client for Push

iOS PUSH support uses the Apple Push Notification Service (APNS) introduced in iOS SDK 3.0.  In order to use the service, you will need to obtain a push-enabled provisioning profile and a server-side push certificate used for encrypting RhoConnect->APNS traffic.

In case of iOS, regardless of the operation, the user will be presented with the option to activate the application if it is not running.

**NOTE: For testing push, you will need to build and deploy your application to a physical iPhone (or iPad) device. Apple does not support testing push on simulators.**

### Setup Push Certificate
The first step to setting up your environment is to create an APNS push certificate. To create the SSL certificate, follow the "Creating the SSL Certificate and Keys" section on the
[developer site](https://developer.apple.com/library/ios/#documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/Chapters/ProvisioningDevelopment.html#//apple_ref/doc/uid/TP40008194-CH104-SW1).

Once you have the certificate, you will need to export it to a .pem format using [these instructions](https://developer.apple.com/library/ios/#documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/Chapters/ProvisioningDevelopment.html#//apple_ref/doc/uid/TP40008194-CH104-SW6). Make sure to name the output file 'apple_push_cert.pem' file from these instructions, since this is what we configured in our RhoConnect application.

Once you have this file, copy it to your RhoConnect application directory under the settings folder:

	:::term
	$ cd myrhoconnectapp
	$ cp /path/to/apple_push_cert.pem settings/apple_push_cert.pem

Now your RhoConnect application is ready to send APNS messages.

### Setup Provisioning Profile
Next, you can setup your Apple Push Provisioning Profile using Apple's [developer site instructions](https://developer.apple.com/library/ios/#documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/Chapters/ProvisioningDevelopment.html#//apple_ref/doc/uid/TP40008194-CH104-SW6). Once you have the profile installed in XCode and on your test device, you are ready to test push.

### Setup iOS Device
Setting up the device is the same process as [building any normal Rhodes application](build#building-a-rhodes-application-for-iphoneipad). When you start the application, make sure to also open the console window (cmd-shift-R). When the application starts, you should see some output in the console that shows the device token (towards the top):

	2010-08-19 10:14:22.627 rhorunner[1486:307] Device token is <10fd92ab fa8ee481 55d9af6e 73290863 22b323fd 0d18fdbd 19e92d03 c0fef7c8>

This confirms that your application is running with push enabled. Once you login to the RhoConnect application and sync, you will see the device registered on the RhoConnect console under the user id you used to login. Now you are ready to [test push from your RhoConnect application](push-server-setup#testing-push-in-the-rhoconnect-web-console).

### Alert Audio File Setup for iOS
In case of iOS, audio files for the push alert should be placed in the `/public/alerts` folder and build script will copy them into root of the application main bundle (iOS wouldn't play file from any other place).

## Finishing Client Setup

Once you have completed the above steps for setting up push on iOS client and RhoConnect server, you must still [perform the client setup that is needed for all platforms](push-client-setup).