# Enterprise Browser 1.3

## Welcome to the Enterprise Browser

Enterprise Browser is a powerful, next-generation industrial browser enabling developers to build feature-rich web applications that integrate seamlessly with the features in Zebra Technologies mobile computers and peripherals. The EB base installation includes everything needed to quickly make devices for barcode scanning, signature capture, printing and more. Enterprise Browser applications leverage standard web technologies (HTML5, CSS3 and JavaScript) to run and integrate with virtually any Zebra Technologies device running Android, Microsoft&copy; Windows Mobile and Windows&copy; CE. 

With support for the legacy application programming interfaces (APIs) used in PocketBrowser and the RhoElements Shared Runtime, Enterprise Browser is the ideal path forward for developers looking to migrate legacy applications to newer devices or to create applications with today's highly graphical and intuitive user interfaces. Enterprise Browser features will speed up your application development time, reduce costs and make the transition to next-generation devices and operating systems fast, easy and affordable--especially in high-volume mobile environments.

## What's New in v1.3

###Zebra Device Support
  * **MC40** Android KitKat
  * **TC55** Android KitKat
  * **TC70 (GA2)** Android KitKat
  * **TC75** Android KitKat

[See all supported devices](?Mobile)

###New APIs
  * [Camera API](../api/camera)
  * [Intent API](../api/Intent)
  * [Timer API](../api/Timer)
  * [SIP API](../api/Sip)

###New Features
* **[DOM Injection](../guide/DOMinjection)** provides ability to include/inject JavaScript, Meta Tags and CSS into the DOM of an Enterprise Browser application, allowing application behavior to be changed at runtime without modifying the source code.

* **[Android Intent Broadcast Receiver Support](../guide/configreference?Intent)** enables Enterprise Browser applications to register as a receiver and listen for broadcast messages.

* **[Configuration Editor Tool](../guide/ConfigEditor)** is a desktop utility that simplifies configuration of Enterprise Browser runtime settings. 

* **[Custom Shortcut Creation Tool](../guide/ShortcutCreator)** simplifies the creation of shortcuts for different Enterprise Browser applications from the desktop.  

* **[Custom Splash Screen Support](../guide/configreference?SplashScreenPath)** provides the option of displaying a custom screen when the app starts up.

* **[Password On Exit](../guide/configreference?ExitPasswordEnabled)** can be used to prevent an end-user from exiting an Enterprise Browser application without a password.  

* **[On-Device Configuration](../guide/OndeviceConfig)** enables on-demand editing of key Enterprise Browser configuration settings in real time, without connecting the device to the desktop.

* **[Installer for Mac OS](../guide/setup)** provides access to Enterprise Browser device executables, JavaScript include files, help docs and other resources for Mac OS developers and users.

* **[USB Printing Support in Printer API](../api/printingzebra)** provides support for direct output to Zebra printers via USB cable.  

* **New WiFi and Battery Indicators for High Resolution Zebra Android Devices** provide new icons that are easier to read on high-resolution screens. 

* **New UI graphics for Control/Debug buttons**.  

* **[On-Device Debugging](../guide/debuggingjs)** provides a view into a running application for advanced debugging and optimization.

###New Tags for Android and WM/CE
*These configuration tags apply to both platforms unless otherwise noted*. 

**Splash Screen Configuration**

* **[&lt;SplashScreenPath&gt;](../guide/configreference?SplashScreenPath)** specifies the fully qualified path of an image to be displayed when the app starts up. 
* **[&lt;SplashScreenDuration&gt;](../guide/configreference?SplashScreenDuration)** specifies the length of time (in milliseconds) to display the splash screen image **(Android only)**.

**Shortcut Creation Configuration**

* **[&lt;ShortcutCreationEnabled&gt;](../guide/configreference?ShortcutCreationEnabled)** controls the automatic creation of shortcuts on the device. 

**DOM Injection Configuration**

* **[&lt;CustomDOMElements&gt;](../guide/configreference?CustomDOMElements)** specifies the path of a device-resident file containing data for injected DOM elements.

**Settings Screen Configuration**

* **&lt;[SettingsButtonEnabled&gt;](../guide/configreference?SettingsPageProtectionEnabled)** places a button at the bottom-right corner of all screens that invokes the Settings page.
* **[&lt;SettingsPageProtectionEnabled&gt;](../guide/configreference?SettingsPageProtectionEnabled)** prompts for a password before allowing access to the Settings page.
* **[&lt;SettingsPagePassword&gt;](../guide/configreference?SettingsPagePassword)** contains the password for accessing the Settings page when password function is enabled using the &lt;SettingsPageProtectionEnabled&gt; tag. 

**Password On Exit Prompt**

* **[&lt;ExitPasswordEnabled&gt;](../guide/configreference?ExitPasswordEnabled)** prompts for a password when quitting an Enterprise Browser application.
* **[&lt;ExitPasswordValue&gt;](../guide/configreference?ExitPasswordValue)** contains the password for quitting Enterprise Browser when function is enabled using the &lt;ExitPasswordEnabled&gt; tag. 

**Intent Configuration Option** (Android only)

* **[&lt;EnableReceiver&gt;](../guide/configreference?EnableReceiver)** enables a mechanism through which the application can be called upon by other apps to perform Actions. 
* **[&lt;IntentAction&gt;](../guide/configreference?IntentAction)** specifies the Action for which the receiver is to be registered. 
* **[&lt;IntentCategory&gt;](../guide/configreference?IntentCategory)** specifies the Category under which the receiver is to be registered.

Intent is supported on Android only. For more information, please refer to the [Android Developer Forum](http://developer.android.com/reference/android/content/Intent.html). 

###New Tags for Android
*These configuration tags were previously supported only on WM/CE*. 

* **[&lt;ZoomInKey&gt;](../guide/configreference?ZoomInKey) [&lt;ZoomOutKey&gt;](../guide/configreference?ZoomOutKey)** enable Enterprise Browser apps to use hardware function keys to perform ZoomIn and ZoomOut operations without changing the application. Formerly WM/CE-only. Configurable on-device.

* **[&lt;HTTP_Proxy&gt;](../guide/configreference?HTTP_Proxy) [&lt;HTTPS_Proxy&gt;](../guide/configreference?HTTPS_Proxy)** enable the specification of a URL and port number for an HTTP/S proxy connection. Configurable on-device.

* **[&lt;Username&gt;](../guide/configreference?Username) [&lt;Password&gt;](../guide/configreference?Password)** enable credentials to be entered automatically when navigating to a login page. Configurable on-device.  

* **[&lt;LogMemory&gt;](../guide/configreference?LogMemory) [&lt;LogMemPeriod&gt;](../guide/configreference?LogMemPeriod)** control memory used by logging and the time intervals between entries.

* **[&lt;ResizeOnSIP&gt;](../guide/configreference?ResizeOnSIP)** controls automatic window resizing when the soft input panel is displayed.

* **[&lt;LowBatteryScan&gt;](../guide/configreference?LowBatteryScan)** controls whether the scanner can be used when battery charge level is low. 

* **[&lt;DisableScannerDuringNavigation&gt;](../guide/configreference?DisableScannerDuringNavigation)** controls whether the scanner will be disabled when navigating away from a scanning page on which it was used.

* **[&lt;FunctionKeysCapturable&gt;](../guide/configreference?FunctionKeysCapturable)** works with the Key Capture API to enable function keys to be capturable globally on the device.

* **[&lt;EnableFunctionKey_X&gt;](../guide/configreference?EnableFunctionKey_X)** specifies which Function keys (numbered F1 through F24) should be enabled.

* **[&lt;EnableApplicationKey_X&gt;](../guide/configreference?EnableApplicationKey_X)** specifies which Application keys (numbered A1 through A16) should be enabled.

* **[&lt;FontFamily&gt;](../guide/configreference?FontFamily)** specifies the default font to use when rendering text in web pages. 

##Key EB Features

###Enterprise Browser: An application development toolkit for mobile cross-platform enterprise apps
* Supports all enterprise devices: mobile computers, tablets, kiosks, wearables and vehicle-mounted devices
* Supports multiple operating systems: Android&copy;, Windows&copy; Embedded Handheld, Windows&copy; CE and Windows&copy; Mobile

###Build apps using HTML5, CSS and JavaScript
* Use web skills to create great-looking applications
* Based on open source and standard technologies, not proprietary toolkits
* Access to the world's largest developer community

###Common APIs across all enterprise devices
* Single code base; does not require different APIs for different OSs to create a true write-once, run-anywhere apps with a consistent UI
* Easily access native device hardware with JavaScript APIs

###Backward compatible with PocketBrowser
* Enterprise Browser is compatible with legacy PocketBrowser APIs, enabling a clear path forward for legacy applications
* EMML (Meta Tag) support extended to Android

###Backward compatible with RhoElements
* Enterprise Browser is compatible with legacy RhoElements JavaScript APIs, enabling a clear path forward for "RhoElements Shared Runtime" users

###Unparalleled access to device capabilities
* Access all device features, including bar code scanning, signature capture, printing, RFID and much more

###Thin client architecture
* Simplifies device deployment and management by enabling instant application updates on devices; ensures version consistency

###Offers operating system "lock out"
* Hides access to distractions, such as web-browsing and games; simplifies user interface and eliminates risk of unauthorized changes to device settings
* Password-protect settings screen and prevent any app from exiting

###Full-screen display
* Maximizes available display space for a richer, more effective user interface; hides command bar and Start menu

###Extensive logging capability
* Flexibility to easily capture logging information, reducing management and support effort

##Benefits

###Reduce application and development costs
Eliminates the need to develop, manage and maintain multiple versions of an application to support different types of devices and operating systems;  provides highly cost effective support for a mixed-OS environment.

###Protect the business from OS market uncertainty
Devices and platforms can continue to churn without impacting your business. These OS-agnostic applications work on Symbol, Motorola and Zebra Technologies platforms of yesterday (MPA2), today and tomorrow.

###Reduce end-user training costs
Enterprise Browser app development is incredibly intuitive for developers skilled in HTML5, CSS and JavaScript.

###Utilize every feature on every device - and attached peripheral
Easily design rich applications that take advantage of all the available features on a device and its attached peripherals - from scanning bar codes to capturing RFID tags and processing payment cards.

###Create consumer-style apps - for business
Without OS constraints to impact app design, a graphical user interface can be created that is every bit as engaging, intuitive and interactive as today's consumer applications. Provides complete control of application behavior on different devices. With automatic screen resizing, apps can look, feel and behave identically on all devices, or display new features or expand the presentation of existing features to take advantage of larger screens.

###Faster time to market
A simplified application development approach allows for shorter time to market than ever before.

## Supported Devices

###Mobile
<table cellspacing="0" cellpadding="0" class="table table-striped">
 <tbody><tr>
  <th class="clsSyntaxHeadings"></th>
  <th class="clsSyntaxHeadings"><nobr>Device family</nobr></th>
  <th class="clsSyntaxHeadings">Device</th>
  <th class="clsSyntaxHeadings">Operating System(s)</th>
  <th class="clsSyntaxHeadings">Supported Web Views</th>
 </tr>
 <tr>
  <td class="clsSyntaxCells clsOddRow"><img id="es400Pic" src="images/es400.jpeg" height="75"></td>
  <td class="clsSyntaxCells clsOddRow"><b>ES400</b></td>
  <td class="clsSyntaxCells clsOddRow">ES400</td>
  <td class="clsSyntaxCells clsOddRow">Windows Embedded Handheld 6.5</td>
  <td class="clsSyntaxCells clsOddRow">Internet Explorer, Webkit</td>
 </tr>
 <tr>
  <td class="clsSyntaxCells clsOddRow"><img id="et1Pic" src="images/et1.jpeg" height="75"></td>
  <td class="clsSyntaxCells clsOddRow"><b>ET1</b></td>
  <td class="clsSyntaxCells clsOddRow">ET1 (Enterprise Tablet), ET1 WAN</td>
  <td class="clsSyntaxCells clsOddRow">Android 4.1 (Jelly Bean)</td>
  <td class="clsSyntaxCells clsOddRow">Android Stock Webkit</td>
 </tr>
 <tr>
  <td class="clsSyntaxCells clsOddRow"><img id="mc18Pic" src="images/mc18.jpeg" height="75"></td>
  <td class="clsSyntaxCells clsOddRow"><b>MC18</b></td>
  <td class="clsSyntaxCells clsOddRow">MC18</td>
  <td class="clsSyntaxCells clsOddRow">Windows CE 7.0, Android 4.4 (KitKat)</td>
  <td class="clsSyntaxCells clsOddRow">Internet Explorer, Webkit</td>
 </tr>
 <tr>
  <td class="clsSyntaxCells clsOddRow"><img id="mc3000Pic" src="images/mc3090.jpeg" height="75"></td>
  <td class="clsSyntaxCells clsOddRow"><b>MC3090</b></td>
  <td class="clsSyntaxCells clsOddRow">MC3000, MC3090</td>
  <td class="clsSyntaxCells clsOddRow">Windows CE 5.0<br>Windows Mobile 6.1</td>
  <td class="clsSyntaxCells clsOddRow">Internet Explorer</td>
 </tr>
 <tr>
  <td class="clsSyntaxCells clsOddRow"><img id="mc3100Pic" src="images/mc3100.jpeg" height="75"></td>
  <td class="clsSyntaxCells clsOddRow"><b>MC3100</b></td>
  <td class="clsSyntaxCells clsOddRow"><nobr>MC3100R, MC3100S, MC3190G, </nobr>MC3190R, MC3190S, MC3190Z</td>
  <td class="clsSyntaxCells clsOddRow">Windows CE 6.0 Professional<br>Windows Embedded Handheld 6.5</td>
  <td class="clsSyntaxCells clsOddRow">Internet Explorer, Webkit</td>
 </tr>
 <tr>
  <td class="clsSyntaxCells clsOddRow"><img id="mc32Pic" src="images/mc3200.jpeg" height="75"></td>
  <td class="clsSyntaxCells clsOddRow"><b>MC32N0</b></td>
  <td class="clsSyntaxCells clsOddRow">MC32N0</td>
  <td class="clsSyntaxCells clsOddRow">Android 4.1 (Jelly Bean)<br>Windows CE 7.0</td>
  <td class="clsSyntaxCells clsOddRow">Internet Explorer, Webkit, Android Stock</td>
 </tr>
 <tr>
  <td class="clsSyntaxCells clsOddRow"><img id="mc40Pic" src="images/mc40.jpeg" height="75"></td>
  <td class="clsSyntaxCells clsOddRow"><b>MC40</b></td>
  <td class="clsSyntaxCells clsOddRow"><nobr>MC40</nobr></td>
  <td class="clsSyntaxCells clsOddRow">Android 4.4 (KitKat)</td>
  <td class="clsSyntaxCells clsOddRow">Android Stock Webkit</td>
 
 </tr><tr>
  <td class="clsSyntaxCells clsOddRow"><img id="mc45Pic" src="images/mc45.jpeg" height="75"></td>
  <td class="clsSyntaxCells clsOddRow"><b>MC45</b></td>
  <td class="clsSyntaxCells clsOddRow">MC45</td>
  <td class="clsSyntaxCells clsOddRow">Windows Embedded Handheld 6.5</td>
  <td class="clsSyntaxCells clsOddRow">Internet Explorer, Webkit</td>
 </tr>
 <tr>
  <td class="clsSyntaxCells clsOddRow"><img id="mc55Pic" src="images/mc55.jpeg" height="75"></td>
  <td class="clsSyntaxCells clsOddRow"><b>MC55</b></td>
  <td class="clsSyntaxCells clsOddRow">MC5574, MC5590</td>
  <td class="clsSyntaxCells clsOddRow">Windows Embedded Handheld 6.5</td>
  <td class="clsSyntaxCells clsOddRow">Internet Explorer, Webkit</td>
 </tr>
 <tr>
  <td class="clsSyntaxCells clsOddRow"><img id="mc55a0Pic" src="images/mc55.jpeg" height="75"></td>
  <td class="clsSyntaxCells clsOddRow"><b>MC55A0</b></td>
  <td class="clsSyntaxCells clsOddRow">MC55A0</td>
  <td class="clsSyntaxCells clsOddRow">Windows Embedded Handheld 6.5</td>
  <td class="clsSyntaxCells clsOddRow">Internet Explorer, Webkit</td>
 </tr>
 <tr>
  <td class="clsSyntaxCells clsOddRow"><img id="mc55n0Pic" src="images/mc55.jpeg" height="75"></td>
  <td class="clsSyntaxCells clsOddRow"><b>MC55N0</b></td>
  <td class="clsSyntaxCells clsOddRow">MC55N0</td>
  <td class="clsSyntaxCells clsOddRow">Windows Embedded Handheld 6.5</td>
  <td class="clsSyntaxCells clsOddRow">Internet Explorer, Webkit</td>
 </tr>
 <tr>
  <td class="clsSyntaxCells clsOddRow"><img id="mc65Pic" src="images/mc65.jpeg" height="75"></td>
  <td class="clsSyntaxCells clsOddRow"><b>MC65</b></td>
  <td class="clsSyntaxCells clsOddRow">MC659B</td>
  <td class="clsSyntaxCells clsOddRow">Windows Embedded Handheld 6.5</td>
  <td class="clsSyntaxCells clsOddRow">Internet Explorer, Webkit</td>
 </tr>
 <tr>
  <td class="clsSyntaxCells clsOddRow"><img id="mc67Pic" src="images/mc67.jpeg" height="75"></td>
  <td class="clsSyntaxCells clsOddRow"><b>MC67</b></td>
  <td class="clsSyntaxCells clsOddRow">MC67</td>
  <td class="clsSyntaxCells clsOddRow">Windows Embedded Handheld 6.5<br>Android 4.1 (Jelly Bean)</td>
  <td class="clsSyntaxCells clsOddRow">Internet Explorer, Webkit, Android Stock</td>
 </tr>
 <tr>
  <td class="clsSyntaxCells clsOddRow"><img id="mc70Pic" src="images/mc70.jpeg" height="75"></td>
  <td class="clsSyntaxCells clsOddRow"><b>MC70</b></td>
  <td class="clsSyntaxCells clsOddRow">MC7004, MC7090, MC7094, MC7095</td>
  <td class="clsSyntaxCells clsOddRow">Windows Mobile 6.1</td>
  <td class="clsSyntaxCells clsOddRow">Internet Explorer</td>
 </tr>
 <tr>
  <td class="clsSyntaxCells clsOddRow"><img id="mc75Pic" src="images/mc75.jpeg" height="75"></td>
  <td class="clsSyntaxCells clsOddRow"><b>MC75</b></td>
  <td class="clsSyntaxCells clsOddRow">MC7506, MC7508, MC7596, MC7598</td>
  <td class="clsSyntaxCells clsOddRow">Windows Embedded Handheld 6.5</td>
  <td class="clsSyntaxCells clsOddRow">Internet Explorer</td>
 </tr>
 <tr>
  <td class="clsSyntaxCells clsOddRow"><img id="mc75aPic" src="images/mc75a.jpeg" height="75"></td>
  <td class="clsSyntaxCells clsOddRow"><b>MC75a</b></td>
  <td class="clsSyntaxCells clsOddRow">MC75A0, MC75A6, MC75A8</td>
  <td class="clsSyntaxCells clsOddRow">Windows Embedded Handheld 6.5</td>
  <td class="clsSyntaxCells clsOddRow">Internet Explorer, Webkit</td>
 </tr>
 <tr>
  <td class="clsSyntaxCells clsOddRow"><img id="mc9000Pic" src="images/mc9000.jpeg" height="75"></td>
  <td class="clsSyntaxCells clsOddRow"><b>MC9000</b></td>
  <td class="clsSyntaxCells clsOddRow"><nobr>MC9090, MC9097, MC9094</nobr></td>
  <td class="clsSyntaxCells clsOddRow">Windows CE 5.0<br>Windows Mobile 6.1</td>
  <td class="clsSyntaxCells clsOddRow">Internet Explorer</td>
 </tr>
 <tr>
  <td class="clsSyntaxCells clsOddRow"><img id="mc9190Pic" src="images/mc9100.jpeg" height="75"></td>
  <td class="clsSyntaxCells clsOddRow"><b>MC9100</b></td>
  <td class="clsSyntaxCells clsOddRow">MC9190-G, MC9190Z</td>
  <td class="clsSyntaxCells clsOddRow">Windows CE 6.0 Professional<br>Windows Embedded Handheld 6.5</td>
  <td class="clsSyntaxCells clsOddRow">Internet Explorer, Webkit</td>
 </tr>
 <tr>
  <td class="clsSyntaxCells clsOddRow"><img id="mc92Pic" src="images/mc9100.jpeg" height="75"></td>
  <td class="clsSyntaxCells clsOddRow"><b>MC9200</b></td>
  <td class="clsSyntaxCells clsOddRow">MC92N0</td>
  <td class="clsSyntaxCells clsOddRow">Windows CE 7.0<br>Windows Embedded Handheld 6.5</td>
  <td class="clsSyntaxCells clsOddRow">Internet Explorer, Webkit</td>
 </tr>
 <tr>
  <td class="clsSyntaxCells clsOddRow"><img id="mc95Pic" src="images/mc9500.gif" height="75"></td>
  <td class="clsSyntaxCells clsOddRow"><b>MC9500</b></td>
  <td class="clsSyntaxCells clsOddRow"><nobr>MC9590, MC9596, MC9598, MC959B (WM6.1)</nobr></td>
  <td class="clsSyntaxCells clsOddRow">Windows Mobile 6.1, Windows Embedded Handheld 6.5</td>
  <td class="clsSyntaxCells clsOddRow">Internet Explorer, Webkit</td>
 </tr>
 <tr>
  <td class="clsSyntaxCells clsOddRow"><img id="tc55Pic" src="images/tc55.jpeg" height="75"></td>
  <td class="clsSyntaxCells clsOddRow"><b>TC55</b></td>
  <td class="clsSyntaxCells clsOddRow"><nobr>TC55</nobr></td>
  <td class="clsSyntaxCells clsOddRow">Android 4.4 (KitKat)</td>
  <td class="clsSyntaxCells clsOddRow">Android Stock Webkit</td>
 </tr>
 <tr>
  <td class="clsSyntaxCells clsOddRow"><img id="tc70Pic" src="images/tc70.jpeg" height="75"></td>
  <td class="clsSyntaxCells clsOddRow"><b>TC70</b></td>
  <td class="clsSyntaxCells clsOddRow"><nobr>TC70 (GA1, GA2)</nobr></td>
  <td class="clsSyntaxCells clsOddRow">Android 4.4 (KitKat)</td>
  <td class="clsSyntaxCells clsOddRow">Android Stock</td>
 </tr>
 <tr>
  <td class="clsSyntaxCells clsOddRow"><img id="tc75Pic" src="images/tc75.png" height="75"></td>
  <td class="clsSyntaxCells clsOddRow"><b>TC75</b></td>
  <td class="clsSyntaxCells clsOddRow"><nobr>TC75</nobr></td>
  <td class="clsSyntaxCells clsOddRow">Android 4.4 (KitKat)</td>
  <td class="clsSyntaxCells clsOddRow">Android Stock</td>
 </tr>
 <tr>
  <td class="clsSyntaxCells clsOddRow"><img id="tc70Pic" src="images/workaboutpro.png" ></td>
  <td class="clsSyntaxCells clsOddRow"><b>Workabout</b></td>
  <td class="clsSyntaxCells clsOddRow"><nobr>Workabout Pro 4</nobr></td>
  <td class="clsSyntaxCells clsOddRow">CE 6.0</td>
  <td class="clsSyntaxCells clsOddRow">Internet Explorer, Webkit</td>
 </tr>
</tbody></table>

###Vehicle
<table cellspacing="0" cellpadding="0" class="table table-striped">
 <tbody><tr>
  <th class="clsSyntaxHeadings"></th>
  <th class="clsSyntaxHeadings"><nobr>Device family</nobr></th>
  <th class="clsSyntaxHeadings">Device</th>
  <th class="clsSyntaxHeadings">Operating System(s)</th>
  <th class="clsSyntaxHeadings">Supported Web Views</th>
 </tr>
 <tr>
  <td class="clsSyntaxCells clsOddRow"><img id="vc5090Pic" src="images/vc5090.jpeg" height="75"></td>
  <td class="clsSyntaxCells clsOddRow"><b>VC5090</b></td>
  <td class="clsSyntaxCells clsOddRow">VC5090</td>
  <td class="clsSyntaxCells clsOddRow">Windows CE 5.0</td>
  <td class="clsSyntaxCells clsOddRow">Internet Explorer</td>
 </tr>
 <tr>
  <td class="clsSyntaxCells clsOddRow"><img id="vc6090Pic" src="images/vc6000.jpeg" height="75"></td>
  <td class="clsSyntaxCells clsOddRow"><b>VC6000</b></td>
  <td class="clsSyntaxCells clsOddRow">VC6000, VC6096</td>
  <td class="clsSyntaxCells clsOddRow">Windows Embedded Handheld 6.5</td>
  <td class="clsSyntaxCells clsOddRow">Internet Explorer</td>
 </tr>
 <tr>
  <td class="clsSyntaxCells clsOddRow"><img id="vc70Pic" src="images/vc70.jpeg" height="75"></td>
  <td class="clsSyntaxCells clsOddRow"><b>VC70</b></td>
  <td class="clsSyntaxCells clsOddRow">VC70</td>
  <td class="clsSyntaxCells clsOddRow">Windows CE 7.0</td>
  <td class="clsSyntaxCells clsOddRow">Internet Explorer, Webkit</td>
 </tr>
</tbody></table>

###Micro-Kiosk
<table cellspacing="0" cellpadding="0" class="table table-striped">
 <tbody><tr>
  <th class="clsSyntaxHeadings"></th>
  <th class="clsSyntaxHeadings"><nobr>Device family</nobr></th>
  <th class="clsSyntaxHeadings">Device</th>
  <th class="clsSyntaxHeadings">Operating System(s)</th>
  <th class="clsSyntaxHeadings">Supported Web Views</th>
 </tr>
 <tr>
  <td class="clsSyntaxCells clsOddRow"><img id="mk3000Pic" src="images/mk3000.jpeg" height="75"></td>
  <td class="clsSyntaxCells clsOddRow"><b>MK3000</b></td>
  <td class="clsSyntaxCells clsOddRow">MK3000, MK3090</td>
  <td class="clsSyntaxCells clsOddRow">Windows CE 5.0</td>
  <td class="clsSyntaxCells clsOddRow">Internet Explorer</td>
 </tr>
 <tr>
  <td class="clsSyntaxCells clsOddRow"><img id="mk3100Pic" src="images/mk3100.jpeg" height="75"></td>
  <td class="clsSyntaxCells clsOddRow"><b>MK3100</b></td>
  <td class="clsSyntaxCells clsOddRow">MK3100, MK3190</td>
  <td class="clsSyntaxCells clsOddRow">Windows CE 7.0</td>
  <td class="clsSyntaxCells clsOddRow">Internet Explorer, Webkit</td>
 </tr>
 <tr>
  <td class="clsSyntaxCells clsOddRow"><img id="mk4000Pic" src="images/mk4000.jpeg" height="75"></td>
  <td class="clsSyntaxCells clsOddRow"><b>MK4000</b></td>
  <td class="clsSyntaxCells clsOddRow">MK4000, MK4090</td>
  <td class="clsSyntaxCells clsOddRow">Windows CE 5.0</td>
  <td class="clsSyntaxCells clsOddRow">Internet Explorer</td>
 </tr>
</tbody></table>

###Wearable
<table cellspacing="0" cellpadding="0" class="table table-striped">
 <tbody><tr>
  <th class="clsSyntaxHeadings"></th>
  <th class="clsSyntaxHeadings"><nobr>Device family</nobr></th>
  <th class="clsSyntaxHeadings">Device</th>
  <th class="clsSyntaxHeadings">Operating System(s)</th>
  <th class="clsSyntaxHeadings">Supported Web Views</th>
 </tr>
 <tr>
  <td class="clsSyntaxCells clsOddRow"><img id="wt4000Pic" src="images/wt4090.jpeg" height="75"></td>
  <td class="clsSyntaxCells clsOddRow"><b>WT4090</b></td>
  <td class="clsSyntaxCells clsOddRow">WT4070, WT4090</td>
  <td class="clsSyntaxCells clsOddRow">Windows CE 5.0</td>
  <td class="clsSyntaxCells clsOddRow">Internet Explorer</td>
 </tr>
 <tr>
  <td class="clsSyntaxCells clsOddRow"><img id="wt41n0Pic" src="images/wt41N0.jpeg" height="75"></td>
  <td class="clsSyntaxCells clsOddRow"><b>WT41N0</b></td>
  <td class="clsSyntaxCells clsOddRow">WT41N0</td>
  <td class="clsSyntaxCells clsOddRow">Windows CE 7.0</td>
  <td class="clsSyntaxCells clsOddRow">Internet Explorer, Webkit</td>
 </tr>
</tbody></table>
