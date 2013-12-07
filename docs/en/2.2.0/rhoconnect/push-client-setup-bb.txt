Setting Up for RhoConnect Push on BlackBerry
===

This chapter contains the steps you need to set up your Blackberry Rhodes client and RhoConnect server for push messaging. After you perform the steps in this chapter, you will finish by performing the [client setup that is needed for all platforms](push-client-setup).

## Setting up RhoConnect Server Application for Push to Blackberry Clients

To set up your RhoConnect application for pushing to a BlackBerry client, you will need to update `settings/settings.yml` to include the following:

	:::yaml
	:development:
	  :redis: localhost:6379
	  :mdsserver: 192.168.1.110
	  :mdsserverport: 8080
	  :syncserver: http://localhost:9292/application/
	  :licensefile: settings/license.key

Replace `:mdsserver:` and `:mdsserverport:` with the hostname/IP and port of your machine (default port is 8080).

## Enabling Rhodes Client for RhoConnect Server Push

Enable push in your rhodes application in build.yml.

	:::yaml
	capabilities:
	  - push

## Setting up the Rhodes Blackberry Client for Push

Notifications to BlackBerry are sent using PAP 2.0 message through a BES/MDS server.

On the simulator, this is done via the MDS simulator tool (which you've probably already seen in the form of a console window every time you do 'rake run:bb'). On the device, this is done through the BES/MDS server that the phone is configured to use.  

These instructions assume you are familiar with BES/MDS concepts (for more information please see [here](http://na.blackberry.com/eng/services/business/server/full/)).

In case of Blackberry, if the application is in the background, an alert operation will bring the application upfront; other operations will not. 

### Setup MDS Simulator

<i>Make sure you close the BlackBerry simulator and MDS simulator before continuing for your changes to take effect!</i>

To enable the push port in your MDS simulator, edit the following file:

	C:\Program Files\Research In Motion\BlackBerry JDE <VERSION YOU ARE BUILDING>\MDS\config\rimpublic.property

Uncomment the last line of the file, which should be 'push.application.reliable.ports=100':

	push.application.reliable.ports=100

### Setup BlackBerry Simulator

To listen for incoming messages on BlackBerry, the Rhodes application will start when the device powers on, and will run a listener thread in the background. You will use the "push_port" option in the [rhoconfig.txt](../rhodes/configuration#run-time-configuration) to specify the listening port for incoming push messages. If "push_port" is not specified, default will be 100 as shown in the previous section.

For testing push on the BlackBerry simulator, you should preform the following 'kickstart' process. When the simulator starts, open the web browser on the simulator and navigate to any web page (i.e. http://m.google.com/). Now your simulator is ready to receive push messages.

### Setup BlackBerry Device

To test push on a BlackBerry device, you will need to use a device that is configured with a BES server. Then, [build your Rhodes application for the device](../rhodes/build#build-for-blackberry).

### BlackBerry 5.0 Push service

Rhodes 2.2 and higher supports the [Blackberry Push Service](http://na.blackberry.com/eng/developers/javaappdev/pushapi.jsp).

Define in [rhoconfig.txt](../rhodes/configuration#run-time-configuration) which push to use (if empty or missed, only MDS push is supported).	

	push_options = 'mds;push_service'

The following parameters are from [PushApplicationDescriptor](http://www.blackberry.com/developers/docs/5.0.0api/net/rim/blackberry/api/push/PushApplicationDescriptor.html). Set them in [rhoconfig.txt](../rhodes/configuration#run-time-configuration):

	push_service_url  = 'https://pushapi.eval.blackberry.com/'
	push_service_port = 20558
	push_service_appname = 'RhoTest'
	push_service_type = 'BPAS'

### Alert Audio File Setup for Blackberry

In case of Blackberry Rhodes client, if the audio file is in the public folder, the file name will be `/apps/public/alerts/test-file.mp3`.

## Finishing Client Setup

Once you have completed the above steps for setting up push on Blackberry client and RhoConnect server, you must still [perform the client setup that is needed for all platforms](push-client-setup).