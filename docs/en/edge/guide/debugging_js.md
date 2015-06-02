# Debugging JavaScript
## Debugging with RhoSimulator
### What is RhoSimulator?
RhoSimulator is a device simulation environment for RhoMobile apps that's part of the standard [RhoMobile Suite installation](http://docs.rhomobile.com/en/5.0.38/guide/rhomobile-install). It also can run from a command line. It lets you run, view, test and debug your RhoMobile applications in software first, before testing on hardware or hardware emulation. 

RhoSimulator builds and runs your apps more quickly than do other environments, and is therefore useful for rapid test-and-debug cycles. Under RhoSimulator, most app changes can be made live by pressing the ‘Refresh’ button. There's no need to rebuild the app or restart RhoSimulator to accomodate app changes except to the `AppApplication` class or after the addition or change of a model.

RhoSimulator uses the QT Webkit to render the UI portion of your app and approximate its appearance on Android, iOS and Windows Mobile platforms. However, pages might appear differently on the actual hardware due to variations in platform rendering engines. Also, RhoSimulator is NOT an *emulator*, and therefore excludes camera, barcode scanner and other hardware features that might be present in an emulator for your specific hardware platform. After initial debugging with RhoSimulator, we recommend further testing on your platform's hardware or emulator to ensure that your app behaves as desired.
 
NOTE: RhoMobile apps for Android use the stock Webview control (Webkit or Blink, depending on Android version). Apps for iOS use the stock Safari Webkit, and for Windows Mobile and CE use Zebra's custom-developed Webkit. 


### RhoSimulator can:
* Debug Ruby code
* Debug JavaScript code
* Live-edit HTML and CSS
* Diagnose network activity and AJAX calls
* Run on Mac OS X and Windows development hosts
* Simulate iOS on a Windows development host
* Simulate Windows Mobile on Mac OS X development host 

### RhoSimulator cannot:
* Simulate camera, barcode reader or certain other hardware
* Run on a Linux development host
* Perfectly emulate the target hardware platform
* Render accurately for all Webkits 



## Requirements

* You may want to [install RhoStudio](rhomobile-install) and use it as your IDE; although recommended, this step is optional, you can still use RhoSimulator from the command line.

## Running your application in RhoSimulator

### Running RhoSimulator from RhoStudio

Ensure that your application is configured properly and successfully runs in [RhoSimulator from the command line](#running-rhosimulator-from-command-line)

* In RhoStudio, select your RhoMobile project from the Project Explorer.
* Select 'Run' -> 'Run Configurations' from the main menu. The Run Configurations window appears.
* Find 'RhoMobile Application' section on the left and add new (or modify existing) configuration.
* Select the required platform.
* Select RhoSimulator for the Simulator type.
* Click 'Run' to start the RhoSimulator.

The below screenshot shows run configuration for RhoSimulator for the iPhone platform

![Run Configurations](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/run-configuration.png)

The below screenshot shows the RhoSimulator mimicking an iPhone

![Device Window](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/device-window.png)

The below screenshot shows the Web Inspector provided by the RhoSimulator

![Web Inspector](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/web-inspector-window.png)

## Using the Web Inspector

RhoSimulator has two windows, one is where your application runs and the other is the Web Inspector, a powerful debugging aid that allows you to inspect the web interface for your application and try out certain changes live on your HTML and CSS.

### Examining the DOM

In the 'Elements' tab of Web Inspector you can examine the DOM tree structure of the HTML page that is currently visible. 

You can select and examine individual elements in the DOM tree by using one of the following methods:

#### Using the element picker

Click on the 'Magnifying glass' icon in the bottom toolbar

![Magnifying glass icon](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/html-element-picker.png)

In the device window, click on the HTML element you want to inspect

![Selecting an element](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/selecting-html-element.png)

In the inspector window, the selected element is highlighted

![Selected element](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/selected-html-element.png)

#### Using the search box

In the 'Elements' tab search box, you can enter text to match any of the attributes, content or even tag name of the element. All the matching elements will be highlighted.

![Search elements](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/search-elements.png)

#### Expanding/collapsing the DOM tree

You can also navigate directly to the required HTML element by expanding/collapsing the tree using the disclosure arrows to the left of all tags with children

![DOM tree arrows](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/dom-tree-arrows.png)

### Live editing HTML and CSS

The Web Inspector lets you modify your page and styles live. This provides a quick way to try out HTML and CSS changes to see how they look without having to go back to RhoStudio (or other IDE), providing you with very fast feedback and avoiding the tedious edit-save-refresh cycle.

NOTE: These changes are only temporarily applied to the page inside RhoSimulator. To make them permanent you must actually update your HTML/CSS files.

The following changes can be made live:

#### Editing element attributes

* Double click the element's attribute name or value
* Edit the text
* Press enter to apply the change or escape to cancel

For example, edit the CSS class attribute.

![Edit attribute](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/live-edit-attribute.png)

#### Editing element inner text

* Double click the text inside the element
* Edit the text
* Press enter to apply the change or escape to cancel

For example, the 'Login' button name is changed to 'Sign in'.

![Edit innertext](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/live-edit-innertext.png)

#### Edit element tag

* Double click the element's tag name
* Edit the tag
* Press enter to apply the change or escape to cancel

![Edit tag](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/live-edit-tag.png)

#### Delete element

* Click the element
* Press Delete key

#### Edit a style declaration

* Inside a CSS rule, double click the property or value part of the declaration
* Edit the property or value
* Press enter to apply the change or escape to cancel

For example, change 'text-align' to 'right'

![Edit declaration](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/live-edit-declaration.png)

#### Temporarily disable a style declaration

* Inside a CSS rule, click the checkbox to the right of the declaration to temporarily disable or click again to reenable it

For example, disable 'text-align'

![Disable declaration](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/live-disable-declaration.png)

#### Add a style declaration

* Double click the opening or closing braces of a CSS rule
* Type in the property name followed by a colon and the value
* Press enter to apply the change or escape to cancel

For example, add a new 'border-style'

![New declaration](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/live-new-declaration.png)

#### Create new style rule

* Click the small 'Gear' icon to the right of the 'Styles' heading
* Select 'New Style Rule'
* Edit the selector as required and press enter or escape to cancel
* Type in the property name followed by a colon and the value
* Press enter to apply the change or escape to cancel

![New rule](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/live-new-rule.png)

#### Edit style selector

* Double click the style rule's selector
* Edit the text
* Press enter to apply the change or escape to cancel

![Edit selector](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/live-edit-selector.png)

### Checking resources used by a page

The 'Resources' tab allows you to see the resources being loaded and used by the current page. 

This includes assets like:

* JavaScript
* Stylesheets
* Images

as well as cookies, if your application uses them

![Resources Tab](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/resources.png)

### Diagnosing network activity and AJAX calls

The 'Network' tab allows you to see the HTTP requests your application makes and how long they take to fetch. 

* Click on any of the names on the left to view the headers and content for the request.
* Use the data from the 'Latency' and 'Timeline' columns to optimize the time taken for your application screens to load (move your mouse over each row in the graph to get numerical values).

![Network Tab](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/network.png)


### Debugging JavaScript code

The 'Scripts' tab allows you to set breakpoints and inspect variables in your JavaScript code.

#### Setting breakpoints

* Select the required script source file from the dropdown
* Goto the line where you want to set breakpoint
* Click on left margin where the line number is displayed, a flag will appear over the line number to indicate that a breakpoint has been set
* To remove the breakpoint, click on the flag that appears over the line number
* Breakpoints are also displayed as a list on the right side of the inspector, under the heading 'Breakpoints'
* Toggle the checkbox in the list view to temporarily disable and reenable the breakpoint

![Breakpoints](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/javascript-breakpoints.png)

#### Inspecting variables

When the application is paused at a breakpoint or by pressing the 'Pause' button, you can inspect the values of JavaScript variables.

* Local variables are automatically displayed under the 'Scope Variables' heading
* If you switch to a different stack frame under the 'Call Stack' heading, the local variables displayed will match the currently selected stack frame
* You can use 'Watch Expressions' to add an expression that needs to be evaluated every time the code is paused. This can simply be a variable or it can be any valid JavaScript expression.


### The console

The 'Console' tab allows you to view log messages and also to execute and debug your JavaScript.

![Console](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/console.png)

The console can also be accessed as part of any of the other tabs by using the 'Show console' button at the bottom left corner of the other tabs.

![Embedded Console](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/console-embedded.png)

#### Logging

The Console logs messages from the system and also from your application code.

![Filtering messages](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/filtering-console-messages.png)

##### Generating log messages from your application

To generate log messages from your application (JavaScript) code, call the console.log() method

    :::javascript
    console.log("Hello, world");

This output is not visible by the end user, and is very useful for debugging.

#### Interactive JavaScript

The console allows fully interactive JavaScript usage. 

You can:

* Evaluate any valid JavaScript expression
* Examine variables or object properties
* Invoke methods on objects

![Interactive JavaScript](http://rhodocs-images.s3.amazonaws.com/guide/debugging_with_rhosimulator/interactive-javascript.png)

### Running RhoSimulator from command line

Run one of the following commands inside the application folder, depending on the platform you want to simulate:
    
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

## On-Device Debugging With Weinre

Weinre is a must have developer tool for testing or debugging your JavaScript RhoMobile application. Although a lot of testing and analysis can be done using [RhoSimulator](debugging_with_rhosimulator), sometimes the application behaves differently on a device and you can't test hardware features like [Barcode](../api/barcode) in RhoSiumulator. Weinre allows you to do all of this. Think of it as a remote Web Inspector. It also allows you to get familiar with the RhoMobile APIs right from the Weinre JavaScript Console tab much more rapidly then trying to fumble around with reading through logs. 

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

### Other Tabs in Debugger UI

<img src="http://rhodocs.s3.amazonaws.com/weinre/weinre-tabs.png"/>

There are a few other tabs that we have seen in the debugger UI that I should briefly mention. 

#### Network Tab
This tab is great for inspecting what files the application is obtaining from the 'server'. Remember that when building a RhoMobile application, the 'server' is normally running on the device as well. However it is still important to inspect this as unnecessary processing of JavaScript or CSS files may be giving your application a lag that you may not have noticed while running the app in RhoSimulator. There are many resources on the internet that describe using this tab in detail either in the context of Weinre or Chrome Dev Tools. Be sure to be aware of how to use this useful resource when optimizing your application.

#### TimeLine Tab
This tab is great for inspecting front-end UI or DOM performance. Each action in your user interface will be displayed and you can inspect for bottle necks in rendering, or other areas. Again there are many resources on the web that discuss this feature. We also did a full [webinar](https://developer.motorolasolutions.com/docs/DOC-1661) on the topic for detecting Reflows and the usual CSS suspects for performance hits on devices. Be sure to get familiar with these concepts and include them in your routine for application optimization.

#### Resources Tab
The resources tab provides information about the various resources associated with a page. This is useful if you want to make sure a resource (e.g. an external script or stylesheet) has been loaded or for checking out the cookies. You can also look at some HTML5 features like localStorage or WebSQL. 

NOTE: localStorage and WebSQL are not related to the Rhom database that RhoMobile provides. These are HTML5 specific features that are provided with WebKit based browsers.

## On-Device Debugging With Chrome



## Remote Debugging with a Browser's Web Inspector

NOTE: This JS debugging feature is currently only supported on Windows development environments.
Using a feature introduced in RhoElements 4.1, you can use your standard browser web inspector to debug your app's JavaScript. This is helpful if you are used to debugging your JS in a specific browser's web inspection utility. So far, this feature works in [Google Chrome](https://www.google.com/intl/en/chrome/browser/).

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
