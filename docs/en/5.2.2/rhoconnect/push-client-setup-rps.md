# Setting Up for RhoConnect Push Service on Client Application
The RhoConnect Push Service is a stand-alone process that brokers push messages between a RhoConnect server and Android or Windows Mobile/CE devices that have registered with the service. This guide covers setting up the RhoConnect server for the RhoConnect Push Service and the registered client. Once these steps are completed, you must then perform the [push client setup](push-client-setup) process that's required for all platforms.

> **IMPORTANT: Do not continue** if you plan to set up RhoConnect Push for Android devices using Google Cloud Messaging. For those instructions, please refer to [RhoConnect Push for Android setup](push-client-setup-android).

## Setting up RhoConnect Push Service on the Server
RhoConnect v3.3 introduces the RhoConnect Push Service (RPS), which supports efficient messaging for both Android and Windows Mobile/CE. On Android, this service can be used instead of Google Cloud Messaging.

The typical flow of a message using RPS:

	Device      RPS       	 RhoConnect        Backend App
	+           +            +                 +
	|           |            |                 |
	|           |            | POST            |
	|           | POST       |/rc/v1/users/ping|
	|           |/instanceId |<----------------+
	|           |<-----------+                 |
	|<----------+            |                 |
	|{"content"}|            |                 |
	|           |            |                 |
	+           +            +                 +

### Download and Install Node.js
On Mac development hosts, go to the [Node.js website](http://nodejs.org/#) and download and install Node.js (The Windows version of the RhoMobile Suite comes with it). 

### Starting the Push Service
RhoConnect Push Service is a separate process that will run on your machine and broker push messages between your RhoConnect server and registered devices.

Assuming you've installed the latest [RhoMobile Suite](../guide/rhomobile-install), start redis by runing the following command:

	:::term
	$ rhoconnect redis-start

Now start RhoConnect push by running the following command:

	:::term
	$ rhoconnect-push
	RhoConnect push server started...

You can also start the server with more verbose logging (see next section for more details):

	:::term
	$ rhoconnect-push -d 3

Next, make sure you have the following option in your RhoConnect application's `settings/settings.yml` file in the `:development:`, `:production:` and `:test:` sections:

	:::yaml
	:push_server: http://someappname@localhost:8675/

Where you edit `someappname` to be a shared secret name between your RhoConnect application and your mobile application.

> Note: This shared secret name ensures that only your RhoConnect application can send push messages to the RPS instance you started up in the previous step.  Use this shared secret name in your [mobile app's 'rhoconnect_push_appname' setting](push-client-setup-rps#configuring-rhoconfigtxt).

Now set up [push notifications](push-client-setup#configuring-a-rhodes-application-to-receive-push-with-rhoconnect-push-service) in your Android or Windows Mobile RhoElements application, then start up your RhoConnect application.

### Configuring RhoConnect Push
You can control basic settings for RhoConnect push using command line arguments.

	:::term
	$ rhoconnect-push --help

	Usage: rhoconnect-push [options]

	Available options:
	  -c, --config FILE           Path to configuration (config.json) file
	  -d, --debug LEVEL           Specify server debug level: 0 (errors) - 3 (everything)
	  -e, --rcPort PORT           Specify RhoConnect instance port
	  -h, --help                  Print this help message
	  -i, --rcHost HOST           Host for the RhoConnect instance
	  -k, --keyFile FILE          Path to private SSL keyfile (https only)
	  -p, --port                  Run the server on this port (defaults to 8675)
	  -r, --redis REDIS           Redis connection string (i.e. redis://localhost:6379)
	  -s, --httpSecure            Specify whether server uses HTTPS (or HTTP) 
	  -R, --rcSecure			  Specify whether Rhoconnect server uses HTTPS (or HTTP)
	  -t, --timeout TIMEOUT       Time (in ms) before timeout is sent to client
	  -T, --registrationTimeout   Expiration limit for client registration tokens
	  -v, --version               Display server version

### Configuring and Running with config.json Advanced Options
You can also configure more advanced settings in RhoConnect push by creating a config.json file.

	:::json
	{
		"httpSecure": "n",
		"rcSecure": "n",
		"devAuthHost": "localhost",
		"devAuthUrl": "/rc/v1/app/rps_login",
		"devAuthPort": "9292",
		"userAuthHost": "localhost",
		"userAuthUrl": "/rc/v1/app/rps_login",
		"userAuthPort": "9292",
		"appAuthHost": "localhost",
		"appAuthUrl": "/rc/v1/system/rps_login",
		"appAuthPort": "9292",
		"ansResponseTimeout": "300000",
		"ansServerPort": "8675",
		"registrationTimeout": "2592000",
		"clearDataBase": "n",
		"socketPoolSize": 1,
		"debugLevel": "3"
	}

To start the server using a config.json file, run the following command.

	:::term
	$ rhoconnect-push -c /path/to/config.json

The JSON file has the following parameters.

* `httpSecure` - Specify whether to secure the push server (y=HTTPS; n=HTTP).
* `rcSecure` - Specify whether to secure the Rhoconnect server (y=HTTPS; n=HTTP). 
* `devAuthHost` - RhoConnect instance used to handle device credentials.
* `devAuthUrl` - Path used on the RhoConnect instance to handle device credentials.
* `devAuthPort` - Port used on the RhoConnect instance to handle device credentials.
* `userAuthHost` - RhoConnect instance used to handle user credentials.
* `userAuthUrl` - Path used on the RhoConnect instance to handle user credentials.
* `userAuthPort` - Port used on the RhoConnect instance to handle user credentials.
* `appAuthHost` - RhoConnect instance used to handle application credentials.
* `appAuthUrl` - Path used on the RhoConnect instance to handle application credentials.
* `appAuthPort` - Port used on the RhoConnect instance to handle application credentials.
* `ansResponseTimeout` -  Time (in ms) that the push server will allow a message request from the client to go without a response. Upon expiration of this time, a 204 response will be issued and the request will be considered satisfied. If this parameter is set to 0, then this time limit will not be in effect - there is no limit to how long a client request will go without a response.
* `ansServerPort` - Push server listening port
* `registrationTimeout` - Expiration limit for registration tokens (in seconds), the client-side application is automatically unregistered if there is no activity related to its token for the registrationTimeout period. Activity related to its token consists of either attempted fetches of messages on its behalf by the push client or messages sent to the push server by RhoConnect.
* `clearDataBase` - Clear the redis database containing tokens, instanceIds, etc. at the start of the push server (y/n).
* `socketPoolSize` - The maximum number of sockets the push server will use when connecting to each of the authorization servers. This essentially caps the number of http requests to each authorization server that the push server can have outstanding at any given time.
* `debugLevel` -  Print additional information to console to aid in debugging:
  * 0 - print only error & warning info
  * 1 - print error & warning info and message for each invoked ANS operation
  * 2 - reserved for future use
  * 3 - print everything

## Installing the rhoconnect-push-service Runtime Apps on the Mobile Device
To use the RhoConnect Push Service in your client application, you must install the rhoconnect-push-service runtime app(s) on your mobile device.

On a Mac, the rhoconnect-push-service runtime apps for Android and for Windows Mobile are located in the Zebra RhoMobile Suite installation package, in a folder called rhoconnect-push-service.

On Windows, the rhoconnect-push-service runtime apps for Android and for Windows Mobile are located in the Zebra RhoMobile Suite installation, in a directory called rhoconnect-push-service.

### Installing Runtime Apps on Android Device
If you are using an Android device, install `rhoconnect_push_service.apk` to your device.

#### Using ADB
One way to install the .apk is to connect your Android to your computer with a USB cable and use `adb install`. You can verify that your device is connected by executing:

	$ adb devices

If connected, you'll see the device name listed. If your computer doesn't see the device, try killing the adb process first:

	$ adb kill-server

Then navigate to the directory containing the runtime file and run `adb install`.

	$ adb install <filename>.apk

#### Other Installation Methods
You also can use AppGallery or an MDM system to deploy the .apk file to the device, or connect via USB and simply copy it, assuming that the device file system is exposed. These methods would be completed by browsing to the .apk file and executing it. Package contents will install where appropriate.

### Installing Runtime Apps for Windows Mobile/CE Devices
On Windows Mobile/CE devices, install the following runtime apps on your device. If you already have the [.NET Compact Framework](http://msdn.microsoft.com/en-us/library/bb788171\(v=vs.90\).aspx) on your device, make sure it is v3.5 or higher.

* `rhoconnect-push-service.CAB`
* `NETCFv35.Messages.EN.wm.cab`
* `NETCFv35.Messages.EN.cab`

**NOTE: On Windows CE 7.0, you may see the following warning: "The program is not compatible with the current operating system and, therefore, may not run on this device."  You can safely ignore this warning and click the "Yes" button.**

Connect your device to your Windows computer. You can use a USB cable, Bluetooth or any other method. Start Windows Mobile Device Center (ActiveSync on Windows XP).

Manually copy the .cab files to the device. For example, you can use the device File Explorer to display the .cab files that are on the device. Click on each .cab file and the installation process will be started; after it is finished, you should see the app icon on your device in Programs. You should then create a shortcut in the Startup folder so that this applications runs when the device starts. Or if you are using other methods for ensuring certain applications are always running. If this application is not running, it will not receive RhoConnect Push notifications.


### Installing Runtime Apps for Windows XP Embedded
Windows XPE installation requires that you have the following items installed on your XPE device.

* .NET 3.5 Compact Framework
* .NET 4 Compact Framework

NOTE: These are both required because the push service for XPE needs parts of both 3.5 and 4 to function properly.

Next install [Microsoft Messaging Queue (MSMQ)](https://msdn.microsoft.com/en-us/library/aa967729\(v=vs.110\).aspx) on your build machine.

Connect your device to your Windows computer. You can use a USB cable, Bluetooth or any other method. Start Mobile Device Center (ActiveSync on Windows XP) and copy the `rhoconnect-push-service.exe` file to the device. For example, you can use your computer's file explorer to place the .exe file on your device. Once the file is on your device, navigate to the file and click on the .exe file to start the installation process. After it is finished, you should see the app icon on your device in the programs list.

NOTE: The RhoConnect push service on Windows XP Embedded is a separate program on your device and will not be uninstalled when uninstalling other apps or programs.

## Setting up the Rhodes Client for RhoConnect Push Service
To set up your Rhodes client application for RhoConnect Push Service, you configure `rhoconfig.txt` and `build.yml`.

### Configuring rhoconfig.txt
In your client application `rhoconfig.txt` file, set the following options to configure your RhoConnect Push Service:

    syncserver = 'http://<hostname>:<port>'
    Push.rhoconnect.pushServer = 'http://<hostname>:<port>'
    Push.rhoconnect.pushAppName = 'someappname'

Next, your RhoConnect application should be running on a network that is accessible to your device. For example, you might have your RhoConnect application running on a LAN with IP 192.168.1.10, PORT 9292. Then make sure your device is connected to the same LAN.

Below is an example of setting `rhoconfig.txt` for the RhoConnect Push Service. The URLs used for the RhoConnect Push Service (Push.rhoconnect.pushServer) and the RhoConnect server are running on the same host.

    syncserver = 'http://192.168.1.10:9292'
    Push.rhoconnect.pushServer = 'http://192.168.1.10:8675'
    Push.rhoconnect.pushAppName = 'someappname'

### Configuring build.yml
When you configure your application `build.yml` file for RhoConnect Push Service, do not add `push` under `capabilities`. Instead, add rhoconnect-push to extensions, as below:

	extensions: ["rhoconnect-push"]

## Finishing Client Setup
Once the above steps for setting up the RhoConnect Push Service on Android or Windows Mobile/CE client and RhoConnect server are completed, you must then perform the [push client setup](push-client-setup) process that's required for all platforms.