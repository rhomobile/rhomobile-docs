## Enterprise Browser's Feature Demo Application

### Overview  
The Feature Demo Application showcases some of the key capabilities available for Zebra Devices running an Enterprise Application via the Enterprise Browser.

### Showcased Enterprise Browser Capabilites  
  * Barcode Scanning
  * Using Image Capture in an Application
  * Battery Usage and Signal Indicators
  * Capturing key presses
  * Changing and capturing Screen orientations
  * Signature Capturing
  * Timer API
  * Enabling, Disabling, and Orienting Hourglass (screen loading icon)

### Showcased HTLM5 capabilities  
  * WebSQL
  * WebStorage

## Installation  

### Setting up Local Web Server in Enterprise Browser  
The Feature Demo Application for Enterprise Browser uses `AJAX` to pull in demo files, so the Application must be run from a WebServer. To enable the Local Web Server in Enterprise Browser, do the following:

1. Go into `Config.xml` and add the following `XML` snippet right under `<Configuration>`:

		:::XML

		<WebServer>
			<Enabled value="1" />
			<Port value="8082" />
			<WebFolder value="/fd/" />
			<Public value="1" />
		</WebServer>   

  Android Devices - Config.xml can be found at the path: `<root of device>/Android/data/com.symbol.enterprisebrowser/Config.xml`  

  WM/CE Devices - Config.xml can be found at the path: `<root of device>\Program Files\EnterpriseBrowser\Config\Config.xml`  

2. In `Config.xml` change the start page value to:  
		
		:::HTML

	    <StarterPage value="http://127.0.0.1:8082/feature-demo.html" name="Menu"/>

3. Create a folder called `fd` (case sensitive) in the root of your device's SDCard, or if it doesn't have an SDCard, create the folder in the internal memory partition.  

4. When you originally installed Enterprise Browser to your desktop, a folder should have been created called `EnterpriseBrowser`. Inside of that folder there should be a folder called `Feature-Demo`. Take the contents of that folder and copy it over to your newly created fd folder.  

	<img style="padding-left:40px;" src="http://i.imgur.com/Gk1rhab.png" width="600" height="480" border="10">

5. Start The Enterprise Browser Application on your Device  

## Using Features

If you have done all of the above steps correctly, you should see the screen below displaying all of the Feature-Demo capabilities  

  <img style="padding-left:40px;" src="http://i.imgur.com/N63KwJq.png" width="380" height="600" border="10"> 

To use a specific feature, click on the Hamburger Menu icon in the top left and select that feature. To quickly exit the Feature Demo App, use the `X` in the top right corner. 

### Barcode Scanning  
The Barcode section of the Feature Demo application shows how to use the most common [Barcode APIs](https://developer.motorolasolutions.com/docs/DOC-2510):

* Enumerate – Will scan the device for all capable barcode interfaces like 2D imager, Laser, and Camera. Tapping this button will show a list of available scan engines. Tapping select on an item will then make the Enable and Disable buttons active for that scanner  
* Enable – Tapping this button will enable the dedicated scanner button on the device. Then when you press the hardware scan trigger and point it at a barcode, the decode information will be presented  
* Disable – Tapping this button will disable the active barcode scanner  
* Start – Tapping this button will activate the scanner in what is called a ‘soft trigger’ mode. It will remain active until either a barcode is decoded or a timeout occurs. This button will only be active after tapping the Enable button  
* Stop – Tapping this button will disable the soft trigger mode.  

 **To Test the Scanner**

1. Go to the Barcode section of the application  

2. Click **Enumerate** to be presented with a list of available scanners  

3. Select a scanner to use  

4. After selecting a scanner, click **Enable**. This will allow you to start and stop the chosen scanner on your device.  

5. Press start and try scanning the image below  

	<img style="padding-left:0px;" src="http://www.barcodesinc.com/generator/image.php?code=EB.Barcode%20Test&style=197&type=C128B&width=200&height=50&xres=1&font=3" width="380" height="100" border="10">  

  When done correctly, the Barcode Scanner should return the following  

	<img style="padding-left:0px;" src="http://i.imgur.com/vHrV660.png" width="380" height="600" border="10">  

### Battery  
The Battery section of the Feature Demo application shows how to use the most common [Battery APIs](https://developer.motorolasolutions.com/docs/DOC-2511):  

* Show Icon – Tapping this button will show a battery icon in the upper left hand corner. You can control more aspects of how it is presented and the location by changing parameters within the code  
* Hide Icon – Tapping this button will hide the battery icon  
* Start – Tapping this button will begin to monitor for battery status events. For example, when not being charged, it will show the battery level  
* Stop – Tapping this button will stop monitoring for battery status events

### Camera  
The Camera section of the Feature Demo application shows how to use the most common [Imager APIs](https://developer.motorolasolutions.com/docs/DOC-2673):  

* Show Camera – Tapping this button will activate the camera and allow you to take a picture. It will show the status information from the performing the action

### Hourglass  
The Hourglass section of the Feature Demo application shows how to use the most common [Hourglass APIs](https://developer.motorolasolutions.com/docs/DOC-2519):  

* Show – Tapping this button will show a loading indicator in the position denoted in the `Left` and `Top` coordinates field. If nothing is entered, it will show the loading indicator in the center of the screen  
* Hide – Tapping this button will hide the loading indicator  
* Left – Controls the left coordinates of the screen display used to position the loading indicator  
* Stop – Controls the top coordinatre of the screen display used to position the loading indicator

### Key Capture  
The Key Capture section of the Feature Demo application shows how to use the most common [Key Capture APIs](https://developer.motorolasolutions.com/docs/DOC-2520):  

* Capture Trigger – Tapping this button will show when the hardware scanner button is pressed along with the keycode that represents the button  
* Capture Keys – Tapping this button will show the corresponding keycode for any key pressed (hardware or software)  

### Screen  
The Screen section of the Feature Demo application shows how to use the most common [Screen Orientation APIs](https://developer.motorolasolutions.com/docs/DOC-2553):  

* Left – Will force the device to rotate to a left handed orientation  
* Right – Will force the device to rotate to a right handed orientation  
* Upside Down – Will force the device to rotate to an upside down orientation  
* Normal – Will force the device to rotate to a normal orientation  
* Auto Rotate – Tapping this will toggle if auto rotation is enabled or disabled  

### Signal  
The Signal section of the Feature Demo application shows how to use the most common [Signal Indicators APIs](https://developer.motorolasolutions.com/docs/DOC-2554):  

* Show Icon – Tapping this button will show a wifi icon in the upper left hand corner. You can control more aspects of how it is presented and the location by changing parameters within the code  
* Hide Icon – Tapping this button will hide the wifi icon  
* Start – Tapping this button will begin to monitor for wifi status events. For example when not being charged, it will show the wifi level  
* Stop – Tapping this button will stop monitoring for wifi status events  
* Status – This section will be populated with the data that comes from the signal event upon a change in status. It will only be displayed when the `Start` button has been tapped  

> Note: Monitoring for Signal events may interfere with other UI elements of the feature demo application when it attempts to display the updated information. It is advised to disable the monitoring of signal events by tapping `Stop` when wanting to view other features  

### Signature Capture  
The Signature Capture  section of the Feature Demo application shows how to use the most common [Signature APIs](https://developer.motorolasolutions.com/docs/DOC-2555):  

* Show – Tapping this button will display a full screen signature capture widget. It will use the Color and Width properties that can be changed  

When returning from this widget the status of the event will be diplayed as well as the image of the signature if the user pressed ok during capture

Background Color: This is a hex value string that represents the color of the background of the signature capture area. For example, changing it to `#FF0000` will result in a red background  
Pen Color: This is a hex value string that represents the color of the pen stroke of the signature capture area. For example, changing it to #FF0000 will result in a red pen color  
Pen Width: This is an integer value that represents how thick the pen should be in `pixels`  

### Timer  
The Timer section of the Feature Demo application shows how to use the most common Timer APIs:  

* Duration – This is how often an event will be fired while the timer is active. The amount is in milliseconds  
* Start – Tapping this button will start a timer to be fired at the duration interval  
* Stop – Tapping this button will stop the timer  
* Status – Will show when timer events have been started or stopped   

### WebSQL  
The WebSQL section of the Feature Demo application demonstrates basic functionality of the HTML5 WebSQL standard  

* Input – Enter a string to be stored  
* Output – Displays the data retrieved when tapping the `Fetch` button  
* Store – Tapping this button will store the value in the `Input` field into WebSQL  
* Fetch – Tapping this button will retrieve the value from WebSQL  

### WebStorage  
The Web Storage section of the Feature Demo application demonstrates the basic functionality of the HTML5 LocalStorage and SessionStorage APIs.  This allows you to store basic Name/Value pairs of data  

* LocalStorage Input – Enter a string to be stored using LocalStorage. This will stay resident after the application is closed.  
* LocalStorage Output – Displays the LocalStorage data retrieved when tapping the `Local Fetch` button  
* SessionStorage Input – Enter a string to be stored using SessionStorage. This will not persist through the closing of the application 
* SessionStorage Output – Displays the SessionStorage data retrieved when tapping the `Local Fetch` button  
* Local Store – Tapping this button will store the value in the `LocalStorage Input` field into LocalStorage  
* Local Fetch – Tapping this button will retrieve the value from LocalStorage  
* Session Store – Tapping this button will store the value in the `SessionStorage Input` field into SessionStorage  
* Session Fetch – Tapping this button will retrieve the value from SessionStorage  

### Inspecting the Code  
When you unzip the contents of the Feature Demo download, you will see the following folders and files:  

  <img style="padding-left:20px;" src="http://i.imgur.com/rnm2E0R.png" border="10">
  

* apis – folder that contain individual `.html` files that are associated with each feature  
* featurename.html – each file has all associated Javascript that is used to demonstrated the use of the API  
* img – folder that contains icons and images used in the demo  
* ebapi-modules.js – Enterprise Browser core JavaScript api library  
* elements.js – Enterprise Browser JavaScript library used by some of the APIs  
* rhoapi-modules.js – Enterprise Browser JavaScript library used by some of the APIs  
* feature-demo.html – main application page that controls behavior of the Feature Demo application  
* style.css – CSS file used for look and feel of the Feature Demo application  

To learn from the Feature Demo application, it is best to look at the individual HTML files located in the 'apis' folder. In the files you will see a `SCRIPT` block that contains the associated JavaScript for performing the particular action  

## Troubleshooting  
If you are still having trouble getting The Feature Demo to work, try the following:  

* Make sure your device has the latest release BSP available on the [Support Portal](https://www.zebra.com/enterprisesupport).

* Check your device's [Integrator Guide](https://www.zebra.com/enterprisesupport) for proper DataWedge configuration

* If your device won't display the Feature Demo Application screen, make sure that your Config.xml has the right path to your starter page  

* Make sure that the wifi on your device is enabled and connected