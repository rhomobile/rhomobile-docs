# Push notifications

## Push notifications and when to use them

Traditional client/server applications work based on a request/response cycle: The client sends a request to the server and the server sends back a response (the client is said to *pull* information from the server). But there was once no way for the server to send (push) information to the client outside of a regular request cycle.

Push notifications solved this problem. They're a way for the server to initiate a connection and send information to a client whenever there's an event of interest. This mechanism allows for updates to be delivered in near real-time instead of having to wait for the next synchronization.

Depending on how they are implemented and delivered, there are two types of push notifications:

* Native push notifications (Android, iOS), provided by the mobile operating system and third party infrastructure (Google / Apple)
* RhoConnect Push Service, built into RhoConnect Server and deployed in your choice of cloud and/or traditional server provider.

**NOTE: This difference is particularly important on Android because Android's native notifications require accessing Google services (in particular, Google Cloud Messaging, or GCM) which are linked to the Google Play Store. Enterprise devices might not include access to the Play Store, so if you are deploying your application to the Enterprise Tablet or other professional-grade Android devices, be aware that Google Cloud Messaging may not be available and you will need to use RhoConnect Push Service instead.**

In order to choose one or the other, you need to think about:

* The devices your application will be deployed to, whether they can support platform-specific notifications or not (whether they include the Google Play Store). Be aware that RhoConnect Push Service is not available on iOS.
* Data protection / compliance with regulatory limitations in specific industries. For example, a law firm could be legally required to never send any of its data to a third party like Google or Apple. In cases like this, RhoConnect Push Service offers a way to keep all parts of the infrastructure under your control, with everything running on your own servers.

>**Having trouble building an Android app with RhoElements 4.0.0 and Push capability?**<br>
>Since being moved to Google Play services, GCM is no longer supported as a standalone jar file. If you're having trouble building an Android app with RhoElements 4.0.0 and Push capability, try these steps:<br><br>
>1. [Download the GCM r03 sip file](http://dl-ssl.google.com/android/repository/gcm_r03.zip) from Google's repository.<br> 
>2. Copy it to sdk/extras and extract it.<br>
>3. Rename the folder to 'gcm'<br>
>

## Setting up an app for native push notifications

**NOTE: You only need to complete *one* of the setup sections, either "native" (this section) or ["RhoConnect Push Service"](#setting-up-your-app-for-rhoconnect-push-service-notifications) depending on which delivery backend you want to use. If you are not sure, check [what push notifications are and when to use them](#what-push-notifications-are-and-when-to-use-them). Once you have completed one of these, proceed to [Integrating push notifications in a RhoMobile app](#integrating-push-notifications-in-a-rhomobile-app). **


### Native iOS notifications


Native iOS notifications use Apple's Push Notification Service (APNS) for delivery.

**NOTE: You need an Apple iOS Developer account and a real device in order to use native push notifications in iOS. Testing on the iOS Simulator is not possible due to Apple's restrictions.**

The following checklist contains the steps required to enable native push in iOS:

* Sign up for an iOS Developer account if you do not have one already
* Create an APNS certificate in Apple's Developer Portal
* Install the APNS certificate in RhoConnect
* Update a provisioning profile in Developer Portal, download it and install it in your iOS device

See [Setting Up RhoConnect Push on iOS](../rhoconnect/push-client-setup-ios) for detailed information on how to complete these operations.

Once completed, proceed to [Integrating push notifications in a RhoMobile app](#integrating-push-notifications-in-a-rhomobile-app)

### Native Android notifications

Native Android notifications use Google Cloud Messaging (GCM) for delivery. The following checklist must be completed in order to integrate your RhoConnect server with GCM:

* Create a Google API Project
* Enable the GCM Service
* Obtain an API key. Preferably, you will get at least one key for development and another for production, and limit the accepted IP addresses of the production key to those of your server(s)
* Add the API key(s) to `settings/settings.yml` in RhoConnect as `:gcm_api_key`
* Add the Google API Project number as the sender to `build.yml` in your RhoMobile app
* Optionally, if you want notifications to be visible to the user, configure `build.yml` to always display notifications or to do so only if the application is not running when the notification is received

See [Setting Up RhoConnect Push on Android](../rhoconnect/push-client-setup-android) for the details on how to complete these steps.

Once completed, proceed to [Integrating push notifications in a RhoMobile app](#integrating-push-notifications-in-a-rhomobile-app)

## Setting up your app for RhoConnect Push Service notifications

**NOTE: You only need to complete *one* of the setup sections, either this section ("RhoConnect Push Service") or ["Setting up your app for native push notifications"](#setting-up-your-app-for-native-push-notifications), depending on which delivery backend you want to use. If you are not sure, check [what push notifications are and when to use them](#what-push-notifications-are-and-when-to-use-them). Once you have completed one of these, continue with [Integrating push notifications in a RhoMobile app](#integrating-push-notifications-in-a-rhomobile-app). **

If you cannot use platform-specific notifications for whatever reason, RhoConnect Push Service still allows you to use push notifications in your app. See [Setting Up RhoConnect Push Service](../rhoconnect/push-client-setup-rps) for more information on how to set up this solution. Be aware that RhoConnect Push Service is not available on iOS.

## Integrating push notifications in a RhoMobile app

Once the server-side infrastructure is ready, reacting to push notifications in RhoMobile is really easy: just use the [Push API](../api/push) to register a callback that will be invoked when a notification is received.

Each notification can contain one or more commands to be performed:

* data source synchronization
* text alert
* sound alert
* vibration

When your code receives a notification, inspect the `params` hash and process the different commands, such as in the following example:

Ruby:

	:::ruby
	def setup_push
		Rho::Push.startNotifications(url_for(:action => :push_callback))
	end

	def push_callback

		# If the notification contains a message, it will be in the alert parameter
		if @params['alert']
		  Rho::Notification.showPopup("Push notification received with message: #{@params['alert']}")
		end

		sources_to_sync = @params['do_sync'] # comma-separated list of data sources we must sync, or "all"
		if sources_to_sync
		  if sources_to_sync=="all" # if the notification tells us to sync all sources, we will do just that
		    Rho::RhoConnectClient.doSync()
		  else # otherwise, we will sync only those sources mentioned in the notification
		    sources_to_sync.split(",").each do |source|
		      Rho::RhoConnectClient.doSyncSource(source)
		    end
		  end
		end
	end

JavaScript:

	:::javascript
	function setup_push_manual() {
		Rho.Push.startNotifications(push_callback);
	}

	function push_callback(params) {
	    // If the notification contains a message, it will be in the alert parameter
	    if (params.alert) {
	      Rho.Notification.showPopup("Push notification received with message: "+params.alert);
	    }

	    var sources_to_sync = params.do_sync; // comma-separated list of data sources we must sync, or "all"

	    if (sources_to_sync) {
	      if (sources_to_sync=="all") { // if the notification tells us to sync all sources, we will do just that
	        Rho.RhoConnectClient.doSync();
	      } else { // otherwise, we will sync only those sources mentioned in the notification
	        var sources = sources_to_sync.split(",");
	        for (var i=0; i<sources.length; i++) {
	          Rho.RhoConnectClient.doSyncSource(sources[i]);
	        }
	      }
	    }
	}

## Testing push notifications

Once both your RhoConnect server and RhoMobile application are set up to work with push notifications, you can easily [test them from the RhoConnect Web Console](../rhoconnect/push-testing) or from the command line:

	:::code
	curl -X POST -H "X-RhoConnect-API-TOKEN: my-rhoconnect-token" --data "user_id=user1&message=Hello+user&sources[]=all&vibrate=2000" http://localhost:9292/rc/v1/users/ping

where

* `my-rhoconnect-token` is a placeholder from the RhoConnect API token found in `settings/settings.yml` (and which you must change, before deployment in production, to a secret value)
* `user1` is the name of a user that has logged in successfully to the RhoConnect server
* `message` is an optional text string that will be shown to the user when the notification is received
* `all` means that, on receipt of this notification, the RhoMobile application should synchronize all its data sources. See below for an example of more fine-grained notifications
* `localhost:9292` is the location of your RhoConnect server

Requesting synchronization of only one particular model (`Product`):

	:::code
	curl -X POST -H "X-RhoConnect-API-TOKEN: my-rhoconnect-token" --data "user_id=user1&message=Hello+user&sources[]=Product&vibrate=2000" http://localhost:9292/rc/v1/users/ping

Requesting synchronization of two models (`Product` and `Customer`):

	:::code
	curl -X POST -H "X-RhoConnect-API-TOKEN: my-rhoconnect-token" --data "user_id=user1&message=Hello+user&sources[]=Product&sources[]=Customer&vibrate=2000" http://localhost:9292/rc/v1/users/ping

When you are satisfied that your notifications are working, see [Setting up Push on a Backend Application](../rhoconnect/push-backend-setup) for examples of how to send notifications from Ruby, Java, .NET, RhoConnect source adapters and Resque jobs

## Limitations and best practices

* While push notifications normally arrive in a very short amount of time (usually less than a few seconds), delivery is done on a "best effort" basis and there is no guarantee that any notification will be received within a particular timeframe or at all. Additionally, a device might not have a network connection available at a particular time. In that case, notifications may be queued, but they will eventually expire if they cannot be delivered for too long. Limits are platform-dependant.

* Push notifications are not intended to be a data-delivery channel, that is, you should push the minimum possible amount of data and, if the application requires more information, it should request it from the server. In particular, do not expect to embed large strings in the `message` field. Some platforms have a hard limit on the size of a notification, and it varies by platform. Keep your payload as small as possible; for example, Apple limits the size of a notification to 256 bytes, of which some are used internally by RhoMobile. Treat notifications as "triggers" and initiate transfers from your application or use the built-in facilities to request synchronization of data sources.

* Push notifications are not a good approach for commands that need to run at known, predictable intervals. If you want to synchronize data periodically with a RhoConnect server, use the built-in `poll_interval` parameter in RhoConnect or set up scheduling in your RhoMobile application.

* As mentioned above, enterprise-grade Android devices may not include the libraries required to use native notifications. On those devices, use [RhoConnect Push Service](../rhoconnect/push-client-setup-rps) instead.

## Related reading

* [Push API](../api/push)
* [RhoConnect Rest API](../rhoconnect/rest-api)
* [Apple's guide to Push Notifications in iOS](https://developer.apple.com/library/ios/#documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/Introduction.html)
* [Google Cloud Messaging (GCM) getting started guide](http://developer.android.com/google/gcm/gs.html)