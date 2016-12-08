Setting Up for RhoConnect Push on Client Application
===

This chapter contains the final steps for setting up your Rhodes application for RhoConnect Push. You also need to perform the setup on client and server for your mobile device platform (if you have not done so already).

 * [Setup for RhoConnect Push Service on client and server](push-client-setup-rps).
 * [Setup for RhoConnect Push on client and server for Rhodes Android Client](push-client-setup-android).
 * [Setup for RhoConnect Push on client and server for Rhodes iOS Client](push-client-setup-ios).

## Configuring a Rhodes Application for RhoConnect Push

If you want your device to vibrate when it receives a push message, enable vibration in your Rhodes/RhoElements application in build.yml.

	:::yaml
	capabilities:
	  - vibrate #=> if you want to enable vibrate in your push messages

Set up your application [rhoconfig.txt](../guide/runtime_config) syncserver to point to your RhoConnect server:

	syncserver = 'http://<rhoconnect_server_url>'

## Registering a Push Callback in the Rhodes Application

To handle a push message from a Rhodes application, you must register push callback with the Rho::Push `startNotifications` method.

    :::ruby
    class AppApplication < Rho::RhoApplication
      def initialize
        super
        Rho::Push.startNotifications '/app/Settings/push_callback'
      end
    end

Push callback is set up in the form of a local application URL and called when application receives server initiated push messages.

The callback push message parameters are presented in the form of a hash. This hash contains parameters and values for the operations to perform. The operations are to show an alert, vibrate the device, play a sound, and perform a sync for a list of sources.

To have your Rhodes app automatically perform the operations listed in the push message, you can write the callback as follows.

    :::ruby
    def push_callback
      # Variable @params is a hash of operations to perform
      # Show 'alert' popup window
      Rho::Notification.showPopup({'message' => @params['alert'], 'buttons' =>['OK']})
    end

To get push messages from RhoConnect server, the user must be logged into the RhoConnect server.

In application.rb:

  	:::ruby
    if SyncEngine::logged_in > 0
      Rho::Push.startNotifications '/app/Settings/push_callback'
    end

## Understanding the Rhodes Push Message Payload

From Rhodes 2.0.4 on, the callback push message parameters are in the form of a hash. This hash contains parameters and values for the operation to perform. If the parameter for that operation is not listed, the operation is not performed.

The hash payload may include the parameters of alert, do_sync, sound, and vibrate which perform operations that the client performs when it receives the PUSH message. Here is an example of a push message body with the parameter names and values. It will have a popup alert message of "some message", play a sound of alert.mp3, will vibrate the device, and will sync the product and customer sources.

    :::text
    alert=some message here&sound=alert.mp3&vibrate=2000&do_sync=product,customer

To sync all the sources with do_sync, the source name list would be specified as 'all' in the ping call, instead of 'product,customer' as in this example.

The Rhodes push payload allows more than one operation in a single message.

There are no required operations. There are default operations - if operation is not specified, no default operation will be performed.

Payload may include following operations which client will perform when it receives the PUSH message:

do_sync - do sync on spec specified sync source; use "all" to sync all sources
	:::ruby
	# one or more sources, or "all" can be specified
	do_sync = "Product,Customer"

alert - bring app upfront and show specified message
	:::ruby
	alert = "Some message"

vibrate - vibrate for the specified number of milliseconds, up to 25500; if 0 or no duration is specified, it will vibrate for 2500 millisecond.

To enable vibrate in your rhodes application in build.yml:

	capabilities:
	 - vibrate

Example of vibrate call:

	vibrate = 2000 #=> duration in milliseconds

sound - play specified file if media type supported by the phone. iPhone will ignore media-type parameter.
	:::ruby
	sound = "hello.mp3"

The sound file should be included to the application bundle in `/public/alerts` folder.

Media type should be either specified explicitly or may be recognized from file extension. Known file extensions are: .mp3 - audio/mpeg; .wav - audio/x-wav.

## Handling Push Notifications from a non-RhoConnect Application

Rhodes applications can also handle PUSH notifications that didn't come from a RhoConnect application.

In this example, we will get the device ID so we can register the device with some push server:
	:::ruby
    Rho::Push.getDeviceId url_for(:action => 'registration_callback')

Application can set push callback to process any commands from server:
	:::ruby
    Rho::Push.startNotifications '/app/Settings/push_callback'

Callback parameters:

* since Rhodes 2.0.4 : contain push message parameters as hash
* rhodes  < 2.0.4 : message - contain server push message body
