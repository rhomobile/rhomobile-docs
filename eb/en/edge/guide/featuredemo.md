# Enterprise Browser Feature Demo  

##Overview
This is the Feature Demo for Enterprise Browser. It uses AJAX to pull in the demo files so must be run from a web server (local to the device or remote). The instructions below show how to use the local built-in web server. This demonstration will not work if using the 'file://' prefix.

##Download
Download the application project from the following [link](https://s3.amazonaws.com/enterprise-browser/FeatureDemo.zip). Unzip the contents of the file. You will need to copy thie contents as described below.

##Installation

>Note: When you install Enterprise Browser device runtime for the first time, you will see the exact location of the `Config.xml` file by tapping the `Config.xml` tab of the introduction screen.

###Android
1. Add this section to the Config.xml (under the `Configuration` tag):

		:::xml
		<WebServer>
			<Enabled value="1" />
			<Port value="8082" />
			<WebFolder value="/fd/" />
			<Public value="1" />
		</WebServer>

2. Change the start page value to:

		:::xml
		<StartPage value="http://127.0.0.1:8082/feature-demo.html" name="Menu"/>
  
3. Copy the contents of download to a new folder called "fd" (case sensitive) on the root of the devices SDCard, or if it doesn't have an SDCard then copy it to the root of the internal memory partition.
4. Re-Start Enterprise Browser

###Windows
1.  Add this section to the Config.xml (under the `Configuration` tag):

		:::xml
		<WebServer>
			<Enabled value="1" />
			<Port value="8082" />
			<WebFolder value="\fd\" />
			<Public value="1" />
		</WebServer>

2. Change the start page value to:

		:::xml
		<StartPage value="http://127.0.0.1:8082/feature-demo.html" name="Menu"/>
  
3. Copy the contents of the download to a new folder called "fd" on the root of the device.
4. Start Enterprise Browser

##Using the Feature Demo App

###Overview
Some of the common API's available to Enterprise Browser applications are demonstrated. This list shown does not represent all capabilities. You should consult the API reference included with the help documentation for all options and capabilities.

* Menu - A menu in the upper left hand corner allows you to easily jump to a particular feature
* Exiting - The `X` in the upper right hand corner of the application will exit the application.

### Barcode
The Barcode section of the Feature Demo application shows how to use the most frequent [Barcode APIs](../api/barcode) for working with capturing barcodes in your application:

* Enumerate - Will scan the device for all capable barcode interfaces like 2D imager, Laser and Camera. Tapping this button will show a list of available scan enginers. Tapping select on an item will then make the `Enable` and `Disable` buttons active for that scanner
* Enable - Tapping this button will enable the dedicated scanner button on the device. Then when you press the hardware scan trigger and point it at a barcode, the decode information will be presented
* Disable - Tapping this button will disable the active barcode scanner.
* Start - Tapping this button will activate the scanner in what is called a 'soft trigger' mode. It will remain active until either a barcode is decoded or a timeout occurs. This button will only be active after tapping the `Enable` button
* Stop - Tapping this button will disable the `soft trigger` mode.

### Battery
The Battery section of the Feature Demo application shows how to use the most frequent [Battery APIs](../api/battery):

* Show Icon - Tapping this button will show a battery icon in the upper left hand corner. You can control more aspects of how it is presented and the location by changing parameters within the code.
* Hide Icon - Tapping this button will hide the battery icon.
* Start - Tapping this button will begin to monitor for battery status events. For example when not being charged, it will show the battery level
* Stop - Tapping this button will stop monitoring for battery status events

### Camera
The Camera section of the Feature Demo application shows how to use the most frequent [Imager APIs](../api/Imager):

* Show Camera - Tapping this button will activate the camera and allow you to take a picture. It will show the status information from performing the action

### Hourglass
The Hourglass section of the Feature Demo application shows how to use the most frequent [Hourglass APIs](../api/Hourglass):

* Show - Tapping this button will show a loading indicator in the position denoted in the `Left` and `Top` coordinates field. if nothing is entered, it will show the loading indicator in the center of the screen.
* Hide - Tapping this button will hide the loading indicator.
* Left - Controls the left coordinates of the screen display to use to position the loading indicator.
* Stop - Controls the top coordinatre of the screen display to use to position the loading indicator.

### Keycapture
The Key Capture section of the Feature Demo application shows how to use the most frequent [Keycapture APIs](../api/keycapture):

* Capture Trigger - Tapping this button will show when the hardware scanner button is pressed along with the keycode that represents the button
* Capture Keys - Tapping this button will show the corresponding keycode for any key pressed (hardware or software)

### Screen
The Screen section of the Feature Demo application shows how to use the most frequent [Screenorientation APIs](../api/screenorientation):

* Left - Will force the device to rotate to a left handed orientation.
* Right - Will force the device to rotate to a right handed orientation.
* Upside Down - Will force the device to rotate to an upside down orientation.
* Normal - Will force the device to rotate to a normal orientation.
* Auto Rotate - Tapping this will toggle if auto rotation is enabled or disabled.

### Signal
The Signal section of the Feature Demo application shows how to use the most frequent [Signalindicators APIs](../api/signalindicators):

* Show Icon - Tapping this button will show a wifi icon in the upper left hand corner. You can control more aspects of how it is presented and the location by changing parameters within the code.
* Hide Icon - Tapping this button will hide the wifi icon.
* Start - Tapping this button will begin to monitor for wifi status events. For example when not being charged, it will show the wifi level
* Stop - Tapping this button will stop monitoring for wifi status events.
* Status - This section will be populated with the data that comes from the signal event upon a change in status. It will only be displayed when the `Start` button has been tapped.

>Note: When monitoring for Signal events, it may interfere with other UI elements of the feature demo application when it attempts to display the updated information. It is advised to disable the monitoring of signal events by tapping `Stop` when wanting to view other features.

### Signature Capture 
The Signature Capture  section of the Feature Demo application shows how to use the most frequent [Signature APIs](../api/signature):

* Show - Tapping this button will display a full screen signature capture widget.It will use the Color and Width properties that can be changed. When returning from this widget the status of the event will be diplayed as well as the image of the signature if the user pressed ok during capture.
* Background Color: This is a hex value string that represents the color of the background of the signature capture area. For example changing it to #FF0000 will result in a red background.
* Pen Color: This is a hex value string that represents the color of the pen stroke of the signature capture area. For example changing it to #FF0000 will result in a red pen color.
* Pen Width: This is an integer value that represents how thick the pen should be in `pixels`

### Timer
The Timer section of the Feature Demo application shows how to use the most frequent Timer APIs:

* Duration - This is how often to fire an event when the timer is active. The amount is in milliseconds.
* Start - Tapping this button will start a timer to be fired at the duration amount. 
* Stop - Tapping this button will stop the timer.
* Status - Will show when timer events have been started, stopped or fored.

### WebSQL
The WebSQL section of the Feature Demo application demonstrates basic functionality of the HTML5 WebSQL standard.

* Input - Enter a string to be stored
* Output - Displays the data retrieved when tapping the `Fetch` button
* Store - Tapping this button will store the value in the `Input` field into WebSQL
* Fetch - Tapping this button will retrieve the value from WebSQL

### Web Storage
The Web Storage section of the Feature Demo application demonstrates the basic functionality of the HTML5 LocalStorage and SessionStorage APIs. This allows you to store basic Name/Value pairs of data

* LocalStorage Input - Enter a string to be stored using LocalStorage. This will stay resident after the application is closed.
* LocalStorage Output - Displays the LocalStorage data retrieved when tapping the `Local Fetch` button
* SessionStorage Input - Enter a string to be stored using SessionStorage. This will not stay resident after the application is closed.
* SessionStorage Output - Displays the SessionStorage data retrieved when tapping the `Local Fetch` button
* Local Store - Tapping this button will store the value in the `LocalStorage Input` field into LocalStorage.
* Local Fetch - Tapping this button will retrieve the value from LocalStorage
* Session Store - Tapping this button will store the value in the `SessionStorage Input` field into SessionStorage.
* Session Fetch - Tapping this button will retrieve the value from SessionStorage


## Inspecting the Code
When you unzip the contents of the Feature Demo download, you will see the following folders and files:

* apis - folder that contain individual `.html` files that are associated with each feature
	* **featurename**.html - each file has all associated Javascript that is used to demonstrated the use of the API
* img - folder that contains icons and images used in the demo.
* ebapi-modules.js - Enterprise Browser core JavaScript api library.
* elements.js - Enterprise Browser JavaScript library used by some of the APIs.
* rhoapi-modules.js - Enterprise Browser JavaScript library used by some of the APIs.
* feature-demo.html - main application page that controls behavior of the Feature Demo application
* style.css - CSS file used for look and feel of the Feature Demo application

To learn from the Feature Demo application, it is best to look at the individual HTML files located in the `apis` folder. In the file you will see a `SCRIPT` block that contains the associated JavaScript to perform the particular action.