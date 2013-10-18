Testing Push in the RhoConnect Web Console
===

The [RhoConnect Web Console](web-console) includes a utility for testing push to make sure everything is wired up correctly.

First, make sure you've logged in and performed a sync on the device/simulator you are going to test.

Next, once you've logged into the web console, navigate to the user's page you used to login in the Rhodes application. For example, if you logged in as user 't', the url would be:

	http://localhost:9292/console/user?user_id=t

You should see a registered device for this user, for example: "c92e36874bc74f39a8fbd7c1a86f9e0e".  Click on the link for this device and you will see the device attributes:

  device_type: APPLE
	device_pin:	10fd92abfa8ee48155d9af6e7329086322b323fd0d18fdbd19e92d03c0fef7c8
	device_port: 100
	user_id: t
	app_id:	application

**NOTE: If you don't see all of these attributes, then something is incorrect in your Rhodes application settings. Please verify you followed the [Rhodes application push setup](push-client-setup).**

Now that the device is registered, go back to the user page and click 'Ping User'.

Here you can specify an alert message, sources array to sync, badge value (iOS only), sound file to play, and duration to vibrate.

Enter in some values or try the defaults, you should see a push message on the device when you click "Ping!".

By default, the sources list will be a comma-separated list of your RhoConnect application's sources. This sources list will be sent in the push message to trigger a sync. You can specify one or more sources, or 'all' to trigger a sync of all sources.

