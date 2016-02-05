# SAP ITS Mobile Usage Guide for Enterprise Browser
##Getting Started

### Setting Start Page
To point Enterprise Browser to start with SAP ITS Mobile application, [startPage](../guide/configreference?General) parameter of the `Config.xml` must be set to the URL of SAP ITS Mobile application. 

### Enabling JavaScript APIs
In order to use Enterprise Browser APIs, one must ensure to include the [respective JS files](../guide/apioverview) within the html file generated from the ABAP code in SAP Server. These files are included as part of the installation, and can be copied to your ABAP Server.

Enterprise Browser requires JS files for the Enterprise Browser API to function:

* **ebapi-modules.js** required by Enterprise Browser API in WM/CE & Android platform. In case only specific Enterprise Browser features are to be utilized in the application than it is recommended to use module specific js files for improved performance.

  > For Example: `eb.battery.js` for Enterprise Browser Battery API

* **elements.js** file is required to be included to support backward compatibility for Pocket Browser and Rhoelements v2.x Shared Runtime based applications running on Enterprise Browser. This is required only for Android platform.

The below table elaborates the Enterprise Browser specific js file information.
<table>
<tr>
<th>Platform</th>
<th>WM/CE</th>
<th>Android</th>
</tr>
<tr>
<td>Enterprise Browser API (Through EB Namespace)</td>
<td>ebapi-modules.js</td>
<td>ebapi-modules.js</td>
</tr>
<tr>
<td>JavaScript Object (Backward Compatibility API)</td>
<td>NA</td>
<td>elements.js</td>
</tr>
<tr>
<td>Meta Tags (Backward Compatibility API)</td>
<td>NA</td>
<td>elements.js</td>
</tr>
<tr>
<td>ActiveXObject (Backward Compatibility API)</td>
<td>NA</td>
<td>elements.js</td>
</tr>
</table>

> Note: In order to run legacy Pocket Browser/RE v2 based App in Enterprise Browser, the following additional settings are required in the `Config.xml` file.

* Activate Regular Expressions
  * Configuration/Applications/Application/General/UseRegularExpressions value="1"

* Enable ActiveX
  * Configuration/Applications/Application/NPAPI/Preloads/PreloadLegacyActiveX value="1"

##Handling KeyEvents

This section describes recommendations on how to handle key events via Keycapture/common API or JavaScript Onkeydown APIs in Enterprise Browser.

It is recommended to use Enterprise Browser KeyCapture API’s to capture hardware keys instead of standard JavaScript onkeyup / onkeydown / onkeypress events in SAP environment due to known limitations in WM device using IE rendering engine with HTML onkeyup / onkeydown / onkeypress events.

In order to use JavaScript onkeyup / onkeydown / onkeypress events,

1. Use webkit engine to capture the hardware keys as HTML onkeyup / onkeydown / onkeypress events.
2. Use KeyCapture module for capturing the hardware key. Possible ways are mentioned below:
  * Use KeyCapture module for capturing hardware key via `DefaultMetaTags`. This is useful when user doesn't have the option to modify the existing application but require additional functionality to be available in the app as DefaultMetaTags get applied only to those devices where it is being configured.

              :::xml
              <DefaultMetaTags>
                <MetaTag VALUE="KeyCapture~KeyValue:All;Dispatch:True;KeyEvent:url('javascript:fireKeyEvent(%json);');" />
              </DefaultMetaTags>

  * Invoke KeyCapture functionality directly in the web page.

Alternate usage recommendations when key is not being captured using JavaScript onkeyup / onkeydown / onkeypress Event Attribute.

As most of the JavaScript based key handling for SAP ITS Mobile applications is inside the `mobile.js` file which is hard to extract and modify from a SAP server and given the known limitation/issue with JavaScript onkeydown event on Windows Mobile IE Engine following method can be used to overcome that problem.

1. Configure KeyCapture functionality in config.xml as mentioned below:

        :::xml
        <DefaultMetaTags>
          <MetaTag VALUE="KeyCapture~KeyValue:All;Dispatch:True;KeyEvent:url('javascript:fireKeyEvent(%json);');" /> 
        </DefaultMetaTags>

2. Add JavaScript method as described in the [DOM Injection guide](../guide-DOMinjection). The same method `fireKeyEvent` has been configured in config.xml under `DefaultMetaTags` attribute.

        :::javascript
        //Add the fireKeyEvent in the HTML page for handling in WM device with IE Engine
        function fireKeyEvent(event)
        {
          var getData = processKeyEvent(event);
        }

KeyEvents handling can be achieved via alternate mechanisms given below:

1. Capturing keys via JavaScript Object using PocketBrowser KeyCapture Module (Backward Compatibility Support):

        :::javascript
        keyCapture.keyValue = 'All'; //Here keyCapture is 2.2 KeyCapture JavaScript Object.

2. Capturing key via Meta Tags using PocketBrowser KeyCapture Module (Backward Compatibility Support):

        :::xml
        <META HTTP-Equiv="KeyCapture" Content="KeyValue:All; Dispatch:True; KeyEvent:url('javascript:MyCallBack(%json);')">

3. Capturing key via ActiveXObject using PocketBrowser KeyCapture Module (Backward Compatibility Support):

        :::javascript
        var mygeneric = new ActiveXObject("PocketBrowser.Generic");
        var temp = "KeyValue:All;Dispatch:True;KeyEvent:url('javascript:MyCallBack('%s');')";
        mygeneric.InvokeMETAFunction("KeyCapture", temp);

4. Capturing key via Enterprise Browser KeyCapture API:

        :::javascript
        EB.KeyCapture.captureKey(true,"ALL", MyCallBack);

5. Capturing key via JavaScript onkeydown Event Attribute:

        :::html
        <html>
          <head>

          <script>
          function jsKeyEvent(event)
          {
            alert(event.keyCode);
          }

          </script>

          </head>

          <body onkeydown="jsKeyEvent(event);"></body>

        </html>

The different scenarios in which the above way of handling key event is Supported/Not Supported is captured in the below table.

<table>
<tr>
<th>SCENARIO</th>
<th>EB using Webkit Engine on WM Device</th>
<th>EB using IE Engine on WM Device</th> 
<th>EB using Webkit Engine on CE Device</th>
<th>EB using IE Engine on CE Device</th>
<th>EB Android Stock Browser</th>
</tr>  
<tr>
<td>Capturing key via Enterprise Browser KeyCapture API (Through EB Namespace)</td>
<td>YES</td>
<td>NO</td>
<td>YES</td>
<td>NO</td>
<td>YES</td>
</tr>
<tr>
<td>Capturing key via JavaScript Object using PocketBrowser KeyCapture Module (Backward Compatibility)</td>
<td>YES</td>
<td>NO</td>
<td>YES</td>
<td>NO</td>
<td>YES</td>
</tr>
<tr>
<td>Capturing key via ActiveXObject using PocketBrowser KeyCapture Module (Backward Compatibility API)</td>
<td>YES</td>
<td>YES</td>
<td>YES</td>
<td>YES</td>
<td>YES</td>
</tr>
<tr>
<td>Capturing key via HTML onkeyup/onkeydown Event Attribute</td>
<td>YES</td>
<td>NO</td>
<td>YES</td>
<td>YES</td>
<td>YES</td>
</tr>
</table>

##Function Keys

Function Keys are meant for performing some per-configured tasks on the device. We can capture Function Keys in Enterprise Browser Application just like any other keys which we capture as mentioned in previous section.

However in some devices, some function keys are predefined by OS to perform the default OS behavior (e.g. F6/F7 controls the volume on some devices). In such cases, the respective function keys cannot be captured from Enterprise Browser Application. In order to capture the function keys in our application, we must ensure to follow the Enterprise Browser 1.2 configuration guidelines i.e. `Interaction between FunctionKeysCapturable and EnableFunctionKey configuration settings` explained under [Remarks section of Config Reference](../guide/configreference?Remarks).

###Android Function Keys
A new feature has been introduced i.e. `isWindowKey` tag which can be configured via config.xml. The `isWindowsKey` tag has been introduced to mimic Windows Mobile key codes for the device's hardware keys.

When enabled the application will get the Windows Mobile function key code value for F1 to F12 keys instead of what Android would send normally. This can be useful to support both types of devices with one code-base. If it is set as 0 or not present, then the application will get the Android function key code value.

This feature is only applicable for Android platform which consists of hardware keys. This feature will be supported from Enterprise Browser 1.2 and above when used with either PocketBrowser or RhoElements 2.x KeyCapture API.

##UI rendering
UI rendering is handled differently with each rendering engine used. It depends on the following:

1. How the web page has been designed?
2. The style which is used during designing of web page is being supported by browser engine or not?

Ex: For SAP environment, the rendering behavior is different when using different rendering engines.

Most of the styles are not supported by default IE rendering engine and so the look and feel of the rendered page in WM/CE device using IE rendered engine is different than using Webkit engine. Therefore user should be aware of the change in the rendered behavior across different browser engine. When working on different browsers with multiple rendering engine types, `Responsive Web Design` practices need to be followed.

To ease the usage of Applications running on Enterprise Browser, users can now configure Hardware Function Keys to perform ZoomIn and ZoomOut operations without having to make changes to the application.

> Note: The function keys used for Zoom IN or Zoom OUT operation will not be accessible via the Key Capture API (current and previous versions). Configuration for Zoom IN & Zoom OUT feature is supported in WM/CE platform.

## Basic/digest authentication 

### Using Webkit Engine
It is recommended to configure SAP credentials through the [Authentication tag](../guide/configreference?Authentication)config.xml.

    :::xml
    <Authentication>
      <Username VALUE="user1"/>
      <Password VALUE="user1"/>
    </Authentication>

> Note: In WM device using webkit engine, once the credential detail is entered incorrectly, then it always navigate to login failed page without asking for re-authentication.

### Using IE engine
It is mandatory to turn off the license confirmation screen in config.xml to avoid 
Log-on fail:

    :::xml
    <ShowLicenseConfirmation value="0"/> 

> Note: On Login failed page, it is recommended to have Quit, Back and Reload button to avoid having to reboot the device.

##Performance Optimization

* If the Application requires usage of Scanner across multiple SAP pages then it is recommended to enable the scanner once in first page or via DefaultMetaTags and disable the scanner only when quitting the Enterprise Browser application.

* Setting DisableScannerDuringNavigation to 0 in the config.xml also leads to improved navigation performance as by default Scanner get disabled upon every page navigation which is a process and time consuming operation.

* Avoid preloading unwanted capabilities in the config.xml which are not required in SAP Environment to increase the performance. These need to be set to 0 in the config.xml if not required by the application.

        :::xml
        <PreloadLegacyODAX value="1"/>
        <PreloadLegacyNoSIP value="1"/>
        <PreloadLegacyAirBeam value="1"/>
        <PreloadLegacyAPD value="1"/>

* It is recommended to disable Hourglass in the config.xml to improve the performance during page navigation:

        :::xml
        <HourglassEnabled value="0"/>

* It is recommended to disable ScreenOrientation in the config.xml to avoid screen orientation issue during scanning:

        :::xml
        <ScreenOrientation value="0"/>

* It is recommended to use Module Specific JS files for API access through EB namespace. See the [Optimization Guide](../guide/optimization) for more details.

<!--

##DataWedge Usage and Compatibility

###DataWedge Interaction with Enterprise Browser
In order to use the scanner with Enterprise Browser App you will need to either disable DataWedge or create a DataWedge profile for your app.

###Disabling DataWedge

1. Start the DataWedge app
2. Click the menu button > `Settings` and un-tick `DataWedge enabled`.

###Enterprise Browser Datawedge Profile
1. Install your Enterprise Browser App,
2. Start the DataWedge app
3. Click the menu button > `New Profile` and enter a name,
4. Click on the link to the new profile in the profile list,
5. Click on `Associated apps` in the `Applications` section,
6. Click the menu button > `New app/activity`,
7. Select the package name for your app,
8. Select `*`,
9. Click the `Back` capacitive button,
10. Make sure the `Profile enabled` checkbox is ticked.
11. Uncheck all three `Enabled` checkboxes under the sections of: `Barcode input`, `Keystroke output` and `Intent output`.

Ensure to turn off the scanner functionality from DataWedge application when Enterprise Browser Scanner or Barcode API’s is used from web page directly.

Enterprise Browser application consists of Scanner API which provides backward compatibility for PocketBrowser & RhoElements application. Enterprise Browser application also provides Barcode API which is new way of invoking scanner functionality.

###Barcode Scanning Options

####Enteprise Browser Barcode API
This is a new and recommended API to use barcode scanning capability in Enterprise Browser.

* API: Barcode

Example: 

    :::javascript
    EB.Barcode.enable();

####META Tags
This API provides backward compatibility for PocketBrowser & RhoElements application.

* API: Scanner

Example: 

    :::html
    <META HTTP-Equiv="scanner" Content="enabled">

####ActiveXObject
This API provides backward compatibility for PocketBrowser & RhoElements application.

* API: Scanner

Example: 

    :::javascript
    var scannerObj = new ActiveXObject("PocketBrowser.Generic"); 
    scannerObj.InvokeMETAFunction('Scanner', 'enabled');

####Javascript Object (backwards compatibility)
This API provides backward compatibility for PocketBrowser & RhoElements application.

* API: Scanner

Example: 

    :::javascript
    scanner.enable();

However it is still possible to fetch the barcode data in Enterprise Browser application even if the application doesn’t want to use the Enterprise Browser Scanner or Barcode API’s. The application just needs to enable the scanner via DataWedge application and the application will be able to get the barcode data in Enterprise Browser by having DataWedge send keystrokes. The resulting data will then be entered into any input field.

-->

##Handling Badlink and Navigation
You application may want to handle if a user encounters a link that no longer exists so that they are not stuck and can gracefully return back to the application. You can write their own badlink html page and then configure [this option](../guide/configreference?General) in the config.xml. This page should consider either a link to return to the home page of the application or utilize the Quit, Back & Reload buttons that are provided with Enterprise Browser.

On the badlink page, on clicking `Reload` button, should redirect to SAP authentication page.

##Migration from PB
Please ensure to set `PreloadLegacyActiveX` value to 1 in config.xml. This provides backwards compatibility with code written in PocketBrowser that used the ActiveXObject.

Please ensure to set `UseRegularExpressions` value to 1 in config.xml. In order to be backwardly compatible with PocketBrowser syntax for controlling device capabilities the Enterprise Browser uses a Regular Expression engine to apply a series of transformations to each meta tag or JavaScript call being processed, as defined in RegEx.xml.

`elements.js` is required for accessing the backward compatibility API’s on Android Platform.

Please refer to [migration guide](../guide/migration) for further details. 

##Usage of DefaultMetatags
If the application includes multiple html pages that perform the same action, you can choose to make use of the `DefaultMetaTags` feature in the config.xml file.  A series of MetaTags can be included once to interact with APIs

The following example will use the `Signal` api to display the network signal icon on the application. This way it will be available in all html pages but can be controlled in one location (config.xml):

    :::xml
    <DefaultMetaTags>
      <MetaTag value="Signal~left:10;top:200;color:#663300;"/>
    </DefaultMetaTags>
