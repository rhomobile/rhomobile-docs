# Debugging JavaScript
## Debugging with RhoSimulator
### What is RhoSimulator?
RhoSimulator is a device simulation environment for RhoMobile apps that's part of the standard [RhoMobile Suite installation](rhomobile-install). It also can run from a command line. It lets you run, view, test and debug the visible portions of your RhoMobile applications initially in software, before then testing them on hardware or hardware emulation. 

RhoSimulator builds and runs your apps more quickly than do other environments, and is therefore useful for rapid test-and-debug cycles. Under RhoSimulator, most app changes can be made live by pressing the ‘Refresh’ button. There's no need to rebuild the app or restart RhoSimulator to accomodate app changes except to the `AppApplication` class or after the addition or change of a model.

RhoSimulator uses the QT Webkit to render the UI portion of your app and approximate its appearance on Android, iOS and Windows Mobile platforms. However, pages might appear differently on the actual hardware due to variations in platform rendering engines. Also, RhoSimulator is NOT an *emulator*, and therefore excludes camera, barcode scanner and other hardware features that might be present in an emulator for your specific hardware platform. After initial debugging with RhoSimulator, we recommend further testing on your platform's hardware or emulator to ensure that your app behaves as desired.
 
NOTE: RhoMobile apps for Android use the stock Webview control (Webkit or Blink, depending on Android version). Apps for iOS use the stock Safari Webkit, and for Windows Mobile and CE use Zebra's custom-developed Webkit. 


### RhoSimulator can:
* Simulate Android, iOS and Windows Mobile
* Debug Ruby and JavaScript code
* Live-edit HTML and CSS
* Diagnose network activity and AJAX calls
* Run on Mac OS X and Windows development hosts
* Simulate iOS on a Windows development host
* Simulate Windows Mobile on Mac OS X development host 

### RhoSimulator cannot:
* Simulate camera, barcode reader or certain other hardware
* Run on a Linux development host
* Perfectly emulate the target hardware platform
* Render accurately for all Webkits and target platforms

## Requirements

This guide relates to the use of RhoSimulator through RhoStudio, an Eclipse-based IDE for Mac OS X and Windows. We recommend installing the [RhoMobile Suite](rhomobile-install) on your development machine, which includes RhoStudio and RhoSimulator and is fully integrated with its use. RhoSimulator also can be invoked from the command line or integrated with an IDE that you're already using. 

## 1- Launch Your App in RhoSimulator

### Using RhoSimulator from RhoStudio

After you've created at least one RhoMobile project, open RhoStudio and the project you'd like to debug. Then: 

* From the **Run Menu**, select **>> Run Configurations**
* In the **left pane** of the **Run Configurations window** you'll see **RhoMobile Application**:
    * **Double-click** it to create a **new Launch Configuration**<br>
    **OR**<br>
    * **Single-click its arrow** to **edit an existing Launch Configuration** (shown)<br>

* With the desired Launch Configuration selected, **choose the Platform and Simulator type**
* **Click Run** to deploy and run your app in RhoSimulator

![Run Configurations](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/run-configuration.png)

In the example, a Run Configuration is shown for the iPhone platform and RhoSimulator. The resulting RhoSimulator screen will look similar to the one below. 

![Device Window](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/device-window.png)

## 2- Examine Code With Web Inspector

RhoSimulator presents two windows: One displays your application's UI, and the other exposes its code in a multi-tabbed window. The first is referred to as the Device Window (similar to the one above), and the second is Web Inspector (below), a powerful debugging aid that allows you to inspect and edit the HTML and CSS of your web interface and immediately see the effects of your changes.

![Web Inspector](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/web-inspector-window.png)

### Examining the DOM

In the context of modern web programming, the "DOM" refers to your HTML code as it will appear when running. For example, while an HTML5 app might define certain variables, those variables contain no values until the app is actually running. So you might think of the DOM as HTML5 that's alive.

You can **examine the DOM in the Elements tab** of Web Inspector. This tab shows the DOM tree structure of the HTML page that's currently displayed in the Device Window. You can select and examine the code or individual elements in the DOM tree by using one of the following methods:

### Using the Element Picker

Click on the 'Magnifying glass' icon in the bottom toolbar:

![Magnifying glass icon](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/html-element-picker.png)

Then, move to the Device Window and click on the HTML element you want to inspect:

![Selecting an element](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/selecting-html-element.png)

The selected element will then be highlighted in the Inspector Window, with its applied CSS styles shown in the right-hand pane and its heirarchy shown along the bottom: 

![Selected element](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/selected-html-element.png)

### Using the Search Elements box

You also can find particular attributes in the DOM using Search Elements. **Click inside the Search Elements box in the upper-right corner and enter text**, content or the tag name of an element or attribute you'd like to find. All items matching the search will be highlighted: 

![Search elements](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/search-elements.png)

### Expanding/collapsing the DOM tree

You also can **navigate directly to the required HTML element by expanding/collapsing the DOM tree** using the disclosure arrows to the left of all tags with children:

![DOM tree arrows](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/dom-tree-arrows.png)

## 3- Live-Editing HTML and CSS

The Web Inspector permits live editing of HTML and CSS code and immediately renders your changes in the Device Window. This provides a quick way to preview HTML and CSS changes without having to go back to the IDE to edit, save and refresh. However, **these changes exist only within the simulator**. To make your changes permanent, you'll need to update your code files once you're satisfied with the changes. 

NOTE: Changes in RhoSimulator are temporary and apply only to the code running inside the simulator. To make changes permanent, you must update your HTML/CSS files separately.

The following changes can be made live:

### Editing an element attribute

1. **Double-click the element attribute** name or value
2. **Edit** the text
3. Press **ENTER to apply** the change or **ESC to cancel**

In the example below, a CSS class attribute is edited:

![Edit attribute](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/live-edit-attribute.png)

### Editing element inner text

1. **Double-click the text *inside* the element**
2. **Edit** the text
3. Press **ENTER to apply** the change or **ESC to cancel**

In the example below, the *Login* button's text was changed to *Sign in*:

![Edit innertext](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/live-edit-innertext.png)

### Editing an element tag

1. **Double-click the element's tag name**
2. **Edit** the tag
3. Press **ENTER to apply** the change or **ESC to cancel**

![Edit tag](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/live-edit-tag.png)

### Deleting an element

1. **Single-click the element**
2. **Press Delete** key

### Editing a style declaration

1. Inside a CSS rule, **double-click the property or value** part of the declaration
2. **Edit** the property or value
3. Press **ENTER to apply** the change or **ESC to cancel**

In the example below, the *text-align* style was changed to *right*:

![Edit declaration](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/live-edit-declaration.png)

### Disabling a style declaration

1. Inside a CSS rule, **locate the appropriate checkbox to the right of the declaration**
2. **Add a check to temporarily enable**; remove a check to temporarily disable

In the example, the *text-align* style *left* is temporarily disabled: 

![Disable declaration](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/live-disable-declaration.png)

### Adding a style declaration

1. **Double-click the opening or closing braces** of a CSS rule
2. **Type in the property name** followed by a colon and the value
3. Press **ENTER to apply** the change or **ESC to cancel**

In the example, a new *border-style* is added: 

![New declaration](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/live-new-declaration.png)

### Creating a new style rule

1. **Click the small "Gear" icon** to the right of the *Styles* heading
2. **Select "New Style Rule"**
3. **Edit the selector as required** and press Enter (or ESC to cancel)
4. **Type in the property name** followed by a colon and the value
5. Press **ENTER to apply** the change or **ESC to cancel**

![New rule](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/live-new-rule.png)

### Editing a style selector

1. Under the Styles heading, **Double-click the style rule's selector**
2. **Edit** the text
3. Press **ENTER to apply** the change or **ESC to cancel**

![Edit selector](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/live-edit-selector.png)

### Other Web Inspector Tabs

<img src="http://rhodocs.s3.amazonaws.com/weinre/weinre-tabs.png"/>

There are a few other Web Inspector tabs that might be useful for debugging your app. 

#### Resources Tab
The **Resources tab** allows you to see the resources being used by the current Webview page. Reources can include outside assets being called into your app such as **images, JavaScript, stylesheets and cookies**. Inspecting the resources can be useful if you want to make sure a particular resource has been loaded. This tab also can provide insight into other HTML5 features such as WebSQL and localStorage, if present. 

![Resources Tab](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/resources.png)

NOTE: WebSQL and localStorage are HTML5-specific features that are used by certain WebKit-based browsers. They are not related to the Rhom database provided by RhoMobile. 

#### Network Tab
The Network tab **measures and displays the time required for HTTP requests** made by an application. Clicking on any of the resources in the left-hand pane will visually represent the delay as its headers and content are loaded and AJAX and other calls are made to remote servers. Data displayed when hovering over "Latency" and "Timeline" columns can be used to help optimize load-time performance.

![Network Tab](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/network.png)

#### Timeline Tab
The Timeline tool **measures and displays the rendering time of each element of the user interface**, presenting a visual display similar to that of the Network tab. The Timeline tab is useful for finding bottlenecks in front-end UI or DOM performance. 

More information about Timeline can be found starting at 25:10 of Zebra's [Front-End UI Optimization Webinar](https://developer.motorolasolutions.com/docs/DOC-1661). This one-hour video contains useful information about detecting reflows and other common problems that can bring mobile apps to a crawl.

##4- Debugging JavaScript Code

####Scripts Tab
The Web Inspector's **Scripts tab** allows you to set breakpoints and inspect variables in your JavaScript code.

### Setting breakpoints, inspecting variables

1. From the dropdown near the top of the Scripts tab, **select the JavaScript source file** you want to debug.
2. To set a breakpoint at a code line, **click its line number**. A breakpoint flag will appear.
3. Next time you run, the app will pause at breakpoints (or after pressing the Pause button).   
4. When paused, **inspect the values of JavaScript variables** under the "Scope Variables" header, at right.

![Breakpoints](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/javascript-breakpoints.png)

**NOTES:**<br> 

* **Local variables are displayed under** the **"Scope Variables"** heading.
* If you **switch to a different stack frame under the "Call Stack" heading**, the local variables displayed will match the currently selected stack frame.
* **Use "Watch Expressions" to evaluate an expression every time** the code is paused. These can include variables or any valid JavaScript expression.
* To **remove a breakpoint, click on its line-number** flag. 
* **Breakpoints also are presented in a list view** under the "Breakpoints" heading at right.
* **Use the checkboxes in list view to toggle Breakpoints** on and off.

####Console Tab

The **Console tab allows JavaScript execution and debugging** and displays log messages generated by your code and by the system it's running on. 

### Using the Console

Viewing the Console tab provides the greatest exposure for displaying large numbers of log messages:

![Console](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/console.png)

You also can **toggle a Console pane** while in other tabs **by using the Show Console button** at the bottom-left corner of other tabs:

![Embedded Console](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/console-embedded.png)

#### Logging

The Console logs errors and warnings from the system and logs messages generated by your application code. Messages can be filtered by type whether using the Console tab or viewing the Console through a pane: 

![Filtering messages](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/filtering-console-messages.png)

###Generating log messages

Log messages are not visible by the end-user, but can be extremely useful for debugging. Log messages are generated from JavaScript using the console.log() method:

Sample JavaScript code:

    :::javascript
    console.log("Hello, world");


#### Interactive JavaScript

In adddition to displaying log messages, the Console provides a fully interactive JavaScript execution environment that lets you **evaluate valid JavaScript expressions, examine variables or object properties and invoke methods on objects**. 

![Interactive JavaScript](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/interactive-javascript.png)




## On-Device Debugging With Weinre

Weinre is a must-have developer tool for testing or debugging your JavaScript RhoMobile application. Although a lot of testing and analysis can be done using [RhoSimulator](debugging_with_rhosimulator), you can't test hardware features such as [Barcode](../api/barcode) in RhoSiumulator and applications often will look or behave differently when running on a device. Weinre allows you to do all of this. Think of it as a remote Web Inspector. It also allows you to get familiar with the RhoMobile APIs right from the Weinre JavaScript Console tab much more rapidly than trying to fumble around with reading through logs. 

For those who would rather see it in action, this guide is modeled after a [webinar](https://www.youtube.com/watch?v=aSTXEEAfJ6M) that shows most of what we are going to cover here. We will also be using the [Barcode Example](https://github.com/rhomobile/rho-samples/tree/master/BareBones/BarcodeExample) app for all of the examples in this guide. You may download it and follow along but the app is by no means necessary. You can use Weinre with any application or simply if you would just like to play around with the RhoMobile APIs to try out some code.

### Installing Weinre

NOTE: You must have admin/sudo privileges to install weinre and your device must be on the same WiFi network as your laptop.

Weinre is a Node.js application and comes delivered via a Node Package installed with the `npm` command. Since Node.js is installed along with the Rhomobile suite, installing Weinre is as simple as running the command:

    :::term
    $ npm -g install weinre

NOTE: Mac users you may have to include the 'sudo' command

More details around the installation process and configuration of Weinre can be found on [Weinre's installation site](http://people.apache.org/~pmuellr/weinre/docs/latest/Installing.html). If you did not install RhoMobile Suite, you can still use Weinre, but you will have to install Node.JS separately.

### Starting Weinre
Open a command prompt and start Weinre with your local machine's local IP address using the `--boundhost` option. If you just launch `weinre` on it's own it will be bound to the `localhost` which will be unaccessible from your device's application.

    :::term
    $ weinre --boundhost <your local IP address>

Weinre will print out the address and port that you will use in order to continue.

For example, here is my output from the above command

    :::term
    2013-10-31T00:24:07.549Z weinre: starting server at http://192.168.1.128:8080

Verify that Weinre is running correctly by navigating your browser to the address Weinre gives you. You should see a page like this.

<img src="http://rhodocs.s3.amazonaws.com/weinre/weinre-web-console.png"/>

### Enabling Weinre In Your App

Notice the section in the web console labeled "Target Script". This is a string that you must copy into your app in order for Weinre to be able to interact with your app. This string is `<script src="http://<your local ip address>:<your port>/target/target-script-min.js#anonymous"></script>`. I'm going to put this line into my barcode_enumerate.html file so that when I load that file in my app, it will connect to Weinre and start capturing info. Remember when editing HTML in RhoStudio, the default double click action is to open the browser representation in the editor, so to edit the HTML itself, make sure to right-click the file and select open with "Text Editor" as shown below. After editing this file, you would rebuild and relaunch the application so that the changes take effect. 

<img src="http://rhodocs.s3.amazonaws.com/weinre/weinre-edit-barcode-enumerate.png"/>

Here is what the line looks like in my HTML:

<img src="http://rhodocs.s3.amazonaws.com/weinre/weinre-target-script-example.png"/>

Now that we have those steps out of the way, it's time to start up Weinre's `debug client user interface` by clicking the link in the  `Access Points` section of the page we just loaded in our browser.

<img src="http://rhodocs.s3.amazonaws.com/weinre/weinre-link-to-debug-ui.png"/>

### Debug Client UI

You may notice that there are many options at the top of the debug UI that very closely resemble the tools available in the Chrome Web Inspector. This is not by accident, these tools serve the same purpose as they would in the Chrome Web Inspector but these are for inspection on the device. 

Here you see both the Weinre debug UI connected to my device (when the device is connected, the Targets and Clients fields are populated with green text describing the device connection.) and my device's screen. I am screen-casting my Android device's screen to my monitor with the help of an app called [Droid@Screen](http://droid-at-screen.ribomation.com/) which uses USB and adb in order to stream screen shots to your computer. It's got some lag but is very useful.

<img src="http://rhodocs.s3.amazonaws.com/weinre/weinre-debug-and-device.png"/>

Now you can inspect your app just as you would any other HTML page if you were using the Chrome web inspector. Select the Elements tool at the top of the page and select an element to inspect. You will also see the element highlighted on your device showing you that two-way communication is established.

<img src="http://rhodocs.s3.amazonaws.com/weinre/weinre-two-way-communication-inspection.png"/>

You can use the Elements tool to change things on the app's view on the fly just by changing the code in the inspector itself. For instance, in the below images I am simply changing the text on the button from "Enumerate" to "Changed!".

<div class="row-fluid">
  <div>
    <div class="span6" style="text-align:center">
        <p><b>Button text "Enumerate"</b></p>
        <img src="http://rhodocs.s3.amazonaws.com/weinre/weinre-button-element-before-change.png"/>
    </div>
    <div class="span6" style="text-align:center">
        <p><b>Button text "Changed!"</b></p>
        <img src="http://rhodocs.s3.amazonaws.com/weinre/weinre-button-element-after-change.png"/>
    </div>
  </div>
</div>

You can change pretty much any part of the view such as CSS styling and even which APIs and methods are called, but I chose to do a simple one for brevity's sake.

### Console and Issuing API Calls

One of the most helpful features of Weinre is the console. You can use this console as the classic console to see what is happening on the device while in operation. However, with this console we can do more than just look at what's happening on the device, we can also issue commands to the device to see how the device will react. This is especially helpful since all of the hardware APIs in RhoMobile will only work on actual hardware, which means they cannot be tested in the RhoSimulator.

In this example, I am showing just a few commands that can be run from the console to verify that the JS APIs are operating properly. Here I use the JS API to check the platform I am running on, use the camera to scan a barcode, and then issue a command to the ScreenOrientation API which returns an error.

<img src="http://rhodocs.s3.amazonaws.com/weinre/weinre-barcode-take-and-failed-extension.png"/>

As you can see, I have verified using API calls that my JS APIs are functioning properly. My device is a Zebra Technologies ET1 which is in fact an Android device, so we know that the System API is working. The item's barcode that I scanned reads exactly what was returned here by the Barcode.take() method, so I know that the Barcode module is working properly.

Notice that when the barcode callback handler function is executed we are doing a `console.log(e)` where `e` is the callback return object. We can then simply inspect the object right in the console and see that it contains a `barcode` property and a `status` property. Exactly what is described in the [Barcode.take()](../api/barcode#mtake) method description. Using other means like looking in [Rholog.txt](logging) for information like this may be very time consuming and tedious to add code to output to the log, retrieve it from the device, etc.

### Extension Inclusion

Now notice the error I received from the last API call: `TypeError: cannot call method 'normal' of undefined.` This error means that it cannot find the [ScreenOrientation](../api/screenorientation) module. This is because ScreenOrientation is not included by default in RhoMobile apps. To add this module in, all we have to do is list it in the app's build.yml in the extensions section as shown below and then rebuild the app.

<img src="http://rhodocs.s3.amazonaws.com/weinre/weinre-adding-extension.png"/>

<div class="row-fluid">
    <div class="span6">
        <p>
            Once the app is rebuilt, it should connect to Weinre as soon as it is activated as we did not remove the target script line from the HTML. Back in the console, now that the module is included you should notice that the module name will auto-complete since the framework is now aware of this module. And since this module is now available, the API call I made before will not return an error but will return what it is supposed to: VOID, which in the console is represented by a null return. It also change the orientation of the screen.
        </p>
        <p>
            To tell whether or not you'll have to add the extension into your build.yml please see the <a href="http://docs.rhomobile.com/guide/apisummary">API Summary Page</a> in our docs. Click on the API you wish to use and the corresponding module page will describe what needs to be done to use the API in question.
        </p>
    </div>
    <div class="span6" style="text-align:center">
        <p><b>Auto-Completing Code</b></p>
        <img src="http://rhodocs.s3.amazonaws.com/weinre/weinre-auto-complete.png"/>
        <p><b>Extension Working properly</b></p>
        <img src="http://rhodocs.s3.amazonaws.com/weinre/weinre-extension-included-return-value.png"/>
    </div>
</div>





## On-Device Debugging With Chrome

Once you're satisfied with the way your app looks and behaves in simulation, it's usually a good idea to do some testing on an actual device. If you're building an Android app and have a device with Android KitKat 4.4 or higher, [Google Remote Debugging](https://developer.chrome.com/devtools/docs/remote-debugging) is an effective and easy way to test, debug and fine-tune your app while it's running on the device. 

Google Remote Debugging works with native Android apps that use WebView--such as those built with RhoMobile--as well as purely browser-based apps. It employs live screencasting from the remote unit to the development host, and through port forwarding and virtual host mapping, permits the device to access a development server, if necessary. 

###Requirements
Google Remote Debugging requires a Mac OS X or Windows development machine with Chrome 32 or later installed plus a USB cable and available USB port. The target device must be running Android 4.4 (KitKat) or later and be enabled for USB debugging. The app to be tested must be configured for WebView debugging.

###1. Enable Device Debugging
The target device must have USB debugging enabled. This feature is found in **Settings >> Developer Options** panel, which is hidden by default. 

![Developer Options](http://rhodocs.s3.amazonaws.com/guide/debugging_js/Android_developerOptions.png)

Here's how to **unhide Developer options**, if neccessary: 

1. Go to **Settings >> About Phone**
2. **Go to the "Build Number" box** (by scrolling all the way to the bottom)
3. **Tap the Build Number box seven times** 
4. Then, go back to Settings and **tap Developer Options** 
5. **Enable USB Debugging** by checking its box

###2. Discover Device (in Desktop Chrome)
If you haven't already done so, **connect your device to an available USB port on the development host** and **enable device detection in Chrome**: 

![Developer Options](http://rhodocs.s3.amazonaws.com/guide/debugging_js/Chrome_detect_USB.png)

1. Open a browser window and **enter "chrome://inspect"** in the address bar. You should see a screen similar the one above.

2. **Check the "Discover USB Devices" checkbox**. Your mobile device should appear along with an alert on the device. 

3. **Tap OK on the device** to complete the connection

4. Linux- and Mac-based developers can skip to the next step. **Developers on Windows must install a USB driver** to make a USB-attached Android device visible. Visit [Google's USB Driver page](http://developer.android.com/tools/extras/oem-usb.html) for instructions and links to OEM drivers for your brand of hardware. 

5. The final step is to **configure WebView for debugging**, which must be done from within the app. Fortunately, RhoMobile developers can skip this step too because the WebView components used by the RhoMobile Suite are automatically configured for debugging when deployed to devices with debug mode enabled.

6. At this point you should be ready tp begin debugging. Once your app is deployed and running on the device, the chrome://inspect page should look something like the one shown below, with your device and a link to its debug-enabled WebViews. **To begin debugging, click an inspect link.** 




## Remote Debugging with a Browser's Web Inspector

NOTE: This JS debugging feature is currently supported only on Windows development environments.
Using a feature introduced in RhoElements 4.1, you can use your standard browser's web inspector feature to debug your app's JavaScript. This is helpful if you're already used to debugging your JS in a specific browser's web inspection utility. So far, this feature works in only [Google Chrome](https://www.google.com/intl/en/chrome/browser/).

### Using the Remote Debugger
Before you can use this remote web inspector, you must first open the app you want to use in RhoSimulator. In this example, we'll run an app called [Barcode Example](https://github.com/rhomobile/rho-samples/tree/master/BareBones/BarcodeExample). As you can see from the data platform attribute, this is running as a Win32 app.

![Opening pp in RhoSim](https://s3.amazonaws.com/rhodocs/guide/debugging_js/opening_app_in_rhosim.png)

Once your app is open in RhoSimulator, simply navigate your browser to [http://localhost:9090/webkit/inspector/inspector.html?page=2](http://localhost:9090/webkit/inspector/inspector.html?page=2). You can also navigate to [http://localhost:9090](http://localhost:9090) and click the link that references your start page (for example http://127.0.0.1:49964/app/index.erb if your app starts at /app/index.erb). 

Once here you should see a web inspection tool very similar to our RhoSimulator's web inspector (which is very similar to that of Google Chrome's inspector) which should look like this:

![Remote Inspector Landing Page](https://s3.amazonaws.com/rhodocs/guide/debugging_js/remote_inspector_landing_page.png)

### Altering App Attributes
As with most web inspectors you can change attributes in the inspector...

![Changed inspector Text](https://s3.amazonaws.com/rhodocs/guide/debugging_js/changed_inspector_text.png)

...and have them appear immediately in the app.

![Changed APP Text](https://s3.amazonaws.com/rhodocs/guide/debugging_js/changed_app_text.png)

### Further Research
As you can probably guess by now, debugging using this method is very similar to debugging using your web browser's built in web inspector because that is exactly what you are doing. Any further tutorials concerning debugging in this fashion should be looked into via tutorials for the given web inspection utility of your respective web browser.

* [Google Chrome Dev Tools Tutorial](https://developers.google.com/chrome-developer-tools/)

## Running RhoSimulator from the command line

ToRhoSimulator can be executed from the command line and thereby integrated with your favorite IDE. To run RhoSimulator from the command line, use one of the following platform-specific commands from within the folder containing the app to be simulated:
    
* Android

      rake run:android:rhosimulator

* iOS

      rake run:iphone:rhosimulator

* Windows Phone 8

      rake run:wp8:rhosimulator 

* Windows Mobile

      rake run:wm:rhosimulator

* Windows (desktop)

      rake run:win32:rhosimulator


