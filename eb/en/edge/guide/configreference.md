# Config.XML Reference
Runtime configuration of the Motorola Enterprise Browser is managed through an XML file called Config.xml. This file is *mandatory* for proper MEB execution: not every setting has a default and if the configuration file cannot be found, the MEB will *not* start. An example configuration file is provided as part of the installation and contains sensible defaults, this page explains the meanings of each of the settings and their possible values. The example `Config.xml` file is bundled your installation or the MEB on your device.

### Configuration File Location
The location of the configuration file loaded by the MEB is dependent on a number of factors:

* When running on the Enterprise Tablet the configuration file is read from `/Android/data/com.motorolasolutions.enterprisebrowser/Config.xml`.
* When running on all other devices the MEB will attempt to launch the configuration file `Config.xml` located in the folder `Config` off the installation root.
* You can change which configuration file is loaded using the /C: configuration option

For persistent installations, on cold boot the `Config.xml` file is copied from `\Application\Enterprise Browser\Config\Config.xml` to `\Program Files\Enterprise Browser\Config\Config.xml`; bear this in mind if you want your configuration to persist across cold boot. <!-- This behavior may be modified by changing `\Application\RhoElements.cpy`. --> <!-- Need to verify this -->

## Config.xml File Format
The following is an example of a typical configuration file:

	:::xml
	<?xml version="1.0"?>
	<!-- Motorola Enterprise Browser Configuration file -->
	<Configuration>
		<DebugButtons>
			<DebugButtonsEnabled value="0"/>
		</DebugButtons>

		<Logger>
			<LogProtocol value="FILE"/>
			<LogPort value="80"/>
			<LogURI value="file://%INSTALLDIR%/log.txt"/>
			<LogError value="1"/>
			<LogWarning value="0"/>
			<LogInfo value="0"/>
			<LogUser value="1"/>
			<LogMemory value="0"/>
			<LogMemPeriod value="5000"/>
			<LogMaxSize value="10"/>
		</Logger>

		<FileLocations>
			<RegEXFile value="file://%INSTALLDIR%/RegEx.xml"/>
		</FileLocations>

		<Screen>
			<FullScreen value="1"/>
		</Screen>

		<WebServer>
			<Enabled VALUE="0"/>
			<Port VALUE="8080"/>
			<WebFolder VALUE="\www"/>
			<Public VALUE="0"/>
		</WebServer>

		<DeviceKeys>
			<EnableFunctionKey_F1 value="0"/>
			<EnableFunctionKey_F2 value="0"/>
			<EnableFunctionKey_F3 value="0"/>
		</DeviceKeys>

		<Navigation>
			<NavTimeout value="45000"/>
		</Navigation>

		<Geolocation>
			<GeolocationEnabled value="1"/>
		</Geolocation>

		<Applications>
			<Application>
				<General>
					<Name value="Menu"/>
					<StartPage value="file://%INSTALLDIR%/menu.html" name="Menu"/>
				</General>

				<HTTP_Proxy value=""/>
				<HTTPS_Proxy value=""/>

				<WebDB>
					<WebStorageDBPath value="file://%INSTALLDIR%"/>
					<WebSQLDBQuota value="5000000"/>
					<WebSQLDBPath value="file://%INSTALLDIR%"/>
				</WebDB>

				<ApplicationCache>
					<ApplicationCachePath value="file://%INSTALLDIR%"/>
					<ApplicationCacheQuota value="5000000"/>
				</ApplicationCache>

				<NPAPI>
					<Preloads>
						<PreloadLegacyGeneric value="1"/>
						<PreloadLegacyODAX value="1"/>
						<PreloadLegacyNoSIP value="1"/>
						<PreloadLegacyAirBeam value="1"/>
						<PreloadLegacyAPD value="1"/>
						<PreloadJSObjects value="1"/>
					</Preloads>
				</NPAPI>

				<HTMLStyles>
					<TextSelectionEnabled value="0"/>
					<FontFamily value="Droid Sans Fallback"/>
				</HTMLStyles>

				<GUI>
					<SignalRefresh value="5000"/>
					<HourglassEnabled value="1"/>
					<HourglassLeft value=""/>
					<HourglassTop value=""/>
				</GUI>

				<Navigation>
					<BadLinkURI value="file://%INSTALLDIR%/badlink.html"/>
					<UserAgent value="Mozilla/5.0 (%p) AppleWebKit/%w (KHTML, like Gecko) MotorolaWebKit/%e Safari/%w"/>
					<NetworkCookieDatabase value="file://%INSTALLDIR%/cookies.db"/>
					<ViewportEnabled value="1"/>
					<Cache value="5MB"/>
				</Navigation>
			</Application>
		</Applications>
	</Configuration>

## Configuration settings and values
The following settings effects applications that are using Motorola Webkit. However the settings `CAFile` and `CAPath` in this file will be used for 4.0 native applications using the stock browser

## DebugButtons
### DebugButtonsEnabled
* **Configuration Identifier:** DEBUGBUTTONSENABLED
* **Description:** When enabled, a set of controls useful for development and debugging purposes will be present in the interface.
* **Possible Values:** 0 - Disabled, 1 - Enabled

## Logger
### LogProtocol
* **Configuration Identifier:** LOGPROTOCOL
* **Description:** Sets the protocol over which the logging data will be sent.
* **Possible Values:** "File" or "HTTP"

### LogPort
* **Configuration Identifier:** LOGPORT
* **Description:** The port over which the logging data will be sent (ignored for File protocol).
* **Possible Values:** Any valid HTTP port.

### LogURI
* **Configuration Identifier:** LOGURI
* **Description:** The URL or File name & path to which logged data should be sent.
* **Possible Values:** Any valid URL or fully qualified file name.

### LogError
* **Configuration Identifier:** LOGERROR
* **Description:** Enables or Disables the logging of ERROR messages generated by the MEB.
* **Possible Values:** 0 - Disabled, 1 - Enabled

### LogWarning
* **Configuration Identifier:** LOGWARNING
* **Description:** Enables or Disables the logging of WARNING messages generated by the MEB.
* **Possible Values:** 0 - Disabled, 1 - Enabled

### LogInfo
* **Configuration Identifier:** LOGINFO
* **Description:** Enables or Disables the logging of INFORMATION messages generated by the MEB.
* **Possible Values:** 0 - Disabled, 1 - Enabled

### LogUser
* **Configuration Identifier:** LOGUSER
* **Description:** Enables or Disables the logging of messages from the user application. Data can be logged using the [Log API]().
* **Possible Values:** 0 - Disabled, 1 - Enabled

### LogMemory
* **Configuration Identifier:** LOGMEMORY
* **Description:** Enables or Disables the logging of memory usage in the system. Not applicable to the Enterprise Tablet.
* **Possible Values:** 0 - Disabled, 1 - Enabled

### LogMemPeriod
* **Configuration Identifier:** LOGMEMPERIOD
* **Description:** Specifies the time interval at which memory logs will be generated periodically. Not applicable to the Enterprise Tablet.
* **Possible Values:** Time in milliseconds

### LogMaxSize
* **Configuration Identifier:** LOGMAXSIZE
* **Description:** The maximum size the log file should be allowed to reach, once the maximum size is reached no more logs will be saved.
* **Possible Values:** File size in kilobytes

## FileLocations
### RegExFile
* **Configuration Identifier:** REGEXFILE
* **Description:** In order to enable backward compatibility with pages written in EMML 1.0 regular expressions are used to convert to EMML1.1 meta tags. This setting defines the location of the XML file which contains the conversions to be used. This setting is only applicable to Windows
* **Possible Values:** Fully qualified path to file defining the regular expressions.

## Screen
### FullScreen
* **Configuration Identifier:** FULLSCREEN
* **Description:** Sets the MEB to fullscreen mode, locking out the OS to the user unless specifically minimized using the [Application API](). Some Windows Mobile devices feature a customized Motorola user interface; in this case access is provided to the status bar at the top of the screen.
* **Possible Values:** 0 - Disabled, 1 - Enabled

### PageZoom
* **Configuration Identifier:** PAGEZOOM
* **Description:** Sets the zoom factor of the page, default zoom is 1.0.
	* On Android, negative values and 0.0 are not supported.
	* In Windows, zoom value less than 1.0 is defaulted to 1.0 because below 1.0 zoom value, the page is not easily readable.

* **Possible Values:** Zoom factor of the page.

## WebServer
### Enabled
* **Configuration Identifier:** WEBSENABLED
* **Description:** Enables or Disables an internal web server to run locally on the device. If running multiple applications with internal web servers consideration should be made over whether a single server should be used or multiple servers running on different ports.
* **Possible Values:** 0 - Disabled, 1 - Enabled

### Port
* **Configuration Identifier:** WEBSPORT
* **Description:** Specifies the IP port the Web Server is running on. By default it's set to 8080.
* **Possible Values:** Valid Port Number

### WebFolder
* **Configuration Identifier:** WEBSFOLDER
* **Description:** Specifies a folder on the device where the web application is stored, Index.html is the default page if no other page is requested.
* **Possible Values:** Fully qualified path to folder containing web application.

### Public
* **Configuration Identifier:** WEBSPUBLIC
* **Description:** Enables or Disables access to the local WebServer from an external device, it is recommended that the setting is only used for debugging purposes. **Enabling this feature in a production deployment is a potential security risk. Make sure to check this value before deployment.**
* **Possible Values:** 0 - Disabled, 1 - Enabled

## DeviceKeys
### FunctionKeysCapturable
> Note: This parameter is specific to Windows Mobile and Windows CE

* **Configuration Identifier:** FUNCTIONKEYSCAPTURABLE
* **Description:** When disabled (default) this parameter will allow enabled function keys to have their default Windows system behavior (e.g. F6/F7 controls the volume on some devices whilst F3/F4 represent the Red / Green phone keys). When enabled, function keys will be capturable by the [Key Capture module](). The interaction between FunctionKeysCapturable and EnableFunctionKey_X is shown [here](#_fnbehavior). This setting is not specific to the current application and will be applied globally on the device.
* **Possible Values:** 0 - F keys not capturable, 1 - F keys capturable

### EnableFunctionKey_X
* **Configuration Identifier:** ENABLEFUNCTIONKEY_FX
* **Description:** By default all function keys are disabled (e.g. F1, F2) but this setting is used to specify which function keys should be enabled. For each key you wish to enable define a EnableFunctionKey_X tag but replace 'X' with the key being enabled, so for example to enable F1 specify EnableFunctionKey_F1. In order to use this configuration setting you must preload the KeyCapture module.
	* On the Enterprise tablet, this tag can be used to enable the 'P' keys. For compatibility with other devices the 'P' keys are referred to as 'F' keys in the config file, therefore in order to enable P2 key on the enterprise tablet, the tag EnableFunctionKey_F2 should be set to 1.
	* For Windows Mobile / CE this setting is not specific to the current application and will be applied globally on the device, **only being unset when a device warm boot is performed**.
	* On an MC40, F1 is mapped to the Volume Down button, F2 to the Volume up button and F3 to the Search button. The interaction between FunctionKeysCapturable and EnableFunctionKey_X is shown at [the end of this document](#_fnbehavior).

> Note: The maximum function key you can enable is F24.

* **Possible Values:** 0 - Disabled, 1 - Enabled

### EnableApplicationKey_X
> Note: This parameter is specific to Windows Mobile and Windows CE

* **Configuration Identifier:** Not Configurable
* **Description:** Some devices have keys to access specific applications on the device, e.g. Calendar, Outlook etc, all of which are disabled by default. This setting is used to specify which application keys should be enabled, numbered A1 to A16. For each key you wish to enable define a EnableApplicationKey_X tag but replace 'X' with the key being enabled, e.g. EnableApplicationKey_A1. Note that the mapping of keys to applications is device specific so A1 may have two functions on two different devices. In order to use this configuration setting you must preload the KeyCapture module.

> Note: This setting is not specific to the current application and will be applied globally on the device. **Once set, this will persist across multiple MEB executions and can only be unset by performing a device warm boot**.

* **Possible Values:** 0 - Disabled, 1 - Enabled

### EnableCtrlKey_X
* **Configuration Identifier:** Not Configurable
* **Description:** CE Only - By default all CTRL+Key combinations are disabled (e.g. CTRL+C to copy text; CTRL+V to paste text). This setting is used to specify which CTRL+Key combinations should be enabled. For each combination you wish to enable define a EnableCtrlKey_X tag but replace 'X' with the key being enabled, so for example to enable text copying specify EnableCtrlKey_C as enabled or to enable text pasting specify EnableCtrlKey_V as enabled.
* **Possible Values:** 0 - Disabled, 1 - Enabled

### EnableVolumeSlider
* **Configuration Identifier:** ENABLEVOLUMESLIDER
* **Description:** Specific to the MC2100 - Allows or prevents the key combination Orange+F1 from bringing up a slider to adjust the volume. This setting is not application specific and will be applied globally on the device.
* **Possible Values:** 0 - Disabled, 1 - Enabled

### EnableBacklightSlider
* **Configuration Identifier:** ENABLEBACKLIGHTSLIDER
* **Description:** Specific to the MC2100 - Allows or prevents the key combination Orange+F2 from bringing up a slider to adjust the back-light. This setting is not application specific and will be applied globally on the device.
* **Possible Values:** 0 - Disabled, 1 - Enabled

## Navigation
### NavTimeout
* **Configuration Identifier:** NAVTIMEOUT
* **Description:** Number of milliseconds before the browser times out and navigates to the page specified in the badlink setting. If it is determined that the destination is unreachable regardless of wait time, the 'badlink' page may be loaded before NAVTIMEOUT. This is the time taken to establish communication with the server, not the time taken to fully load the page.

> Note: The navigation timeout will not be invoked when navigating to the start page, best practice is to store your first page locally to avoid connectivity issues at start up, you can then redirect to an on-line page if desired.

* **Possible Values:** Timeout in Milliseconds, maximum value is 45000

## Geolocation
### GeolocationEnabled
* **Configuration Identifier:** Not Configurable
* **Description:** Enables / disables HTML5 Geoocation. When enabled on a device supporting geolocation and under GPS/network coverage, the geolocation data is returned to the defined JavaScript callback. When disabled the defined JavaScript error callback is called notifying that the permission to use geolocation is disabled.
* **Possible Values:** 0 - Disabled, 1 - Enabled

## Applications / Application / General
### Name
* **Configuration Identifier:** Not Configurable
* **Description:** The name of the application.
* **Possible Values:** ASCII text

### UseRegularExpressions
* **Configuration Identifier:** USEREGULAREXPRESSIONS
* **Description:** In order to be backwardly compatible with PocketBrowser syntax for controlling device capabilities the Enterprise Browser uses a Regular Expression engine to apply a series of transformations to each meta tag or JavaScript call being processed, as defined in RegEx.xml. If you are developing applications without the need to be backwardly compatible with PocketBrowser syntax, you can disable regular expressions, this can result in an improvement in application performance, depending on how the application is structured. This setting is only applicable to Windows Mobile / CE devices.
* **Possible Values:** 0 - Do Not Use Regular Expressions, 1 - Use Regular Expressions

### StartPage
* **Configuration Identifier:** STARTPAGE
* **Description:** Defines the start page of the MEB application, the first page to be displayed when the MEB is launched. This should be a local file to avoid connectivity issues on start up.
* **Possible Values:** Fully qualified path to start page.

> Note: The start page path string is case-sensitive.

## Applications / Application / HTTP_Proxy
### HTTP_Proxy
* **Configuration Identifier:** HTTPPROXY
* **Description:** Specifies the HTTP Proxy settings to use in the format URL:port. Note that this setting only applies to the Motorola WebKit engine, proxy settings for the Internet Explorer engine are picked up from the Windows connection manager. Leave this field blank to not use a proxy.
* **Possible Values:** URL:PortNo

## Applications / Application / HTTPS_Proxy
### HTTPS_Proxy
* **Configuration Identifier:** N/A
* **Description:** Specifies the HTTPS Proxy settings to use in the format URL:port. Note that this setting only applies to the Motorola WebKit engine, proxy settings for the Internet Explorer engine are picked up from the Windows connection manager. Leave this field blank to not use a proxy. 
	* Not supported on Windows Mobile/Windows CE, use HTTP_Proxy instead.

* **Possible Values:** URL:PortNo

## Applications / Application / No_Proxy
### No_Proxy
* **Configuration Identifier:** NOPROXY
* **Description:** Sets the sites that should be accessed directly. This should be a comma-separated list of host names, domain names (starting with a dot), IP addresses, or CIDR format IP network addresses eg. myhost, .mydomain.com, 192.168.1.1,192.168.0.0/24. Note this configuration setting is usable with the Motorola Webkit browser only.
* **Possible Values:** Comma separated list of direct access addresses.

## Applications / Application / WebDB
### WebStorageDBPath
* **Configuration Identifier:** WEBSTORAGEDBPATH
* **Description:** Path to an existing directory to store Web Storage databases.
* **Possible Values:** Fully qualified local path.

> Note: The local path string is case-sensitive.

### WebSQLDBQuota
* **Configuration Identifier:** WEBSQLDBQUOTA
* **Description:** Web SQL database maximum quota per database.
* **Possible Values:** Size in bytes

### WebSQLDBPath
* **Configuration Identifier:** WEBSQLDBPATH
* **Description:** Path to an existing directory to store Web SQL databases.
* **Possible Values:** Fully qualified local path.

> Note: The local path string is case-sensitive.

## Applications / Application / ApplicationCache
### ApplicationCacheQuota
* **Configuration Identifier:** APPLICATIONCACHEQUOTA
* **Description:** Application Cache data maximum quota per application.
* **Possible Values:** Size in bytes

### ApplicationCachePath
* **Configuration Identifier:** APPLICATIONCACHEPATH
* **Description:** Path to an existing directory to store Application Cache data.
* **Possible Values:** Fully qualified local path.

> Note: The local path string is case-sensitive.

## Applications / Application / NPAPI / Preloads
### NPAPIDirectory
* **Configuration Identifier:** NPAPIDIRECTORY
* **Description:** Not applicable to the Enterprise Tablet - Path to an existing directory where the NPAPI plug-ins are stored.
* **Possible Values:** Fully qualified local path.

> Note: The local path string is case-sensitive.

### PreloadLegacyActiveX
> Note: This setting is supported on Windows Mobile / CE with the Motorola Webkit only.

* **Configuration Identifier:** PRELOADLEGACYACTIVEX
* **Description:** Whether or not to preload the ActiveX object in WebKit. You'll need to use this if you want backwards compatibility with code written in PocketBrowser that used the ActiveXObject.
* **Possible Values:** 0 - Do Not Preload, 1 - Preload

### PreloadLegacyGeneric
* **Configuration Identifier:** PRELOADLEGACYGENERIC
* **Description:** Whether or not to preload the NPAPI plug-in to mimic the Generic ActiveX object in WebKit. On the Enterprise Tablet this plug-in is automatically loaded when the JSObjects plug-in is pre-loaded.
* **Possible Values:** 0 - Do Not Preload, 1 - Preload

### PreloadLegacyODAX
* **Configuration Identifier:** PRELOADLEGACYODAX
* **Description:** Not applicable to the Enterprise Tablet - Whether or not to preload the NPAPI plug-in to mimic the ODAX ActiveX object in WebKit.
* **Possible Values:** 0 - Do Not Preload, 1 - Preload

### PreloadLegacyNoSIP
* **Configuration Identifier:** PRELOADLEGACYNOSIP
* **Description:** Whether or not to preload the NPAPI plug-in to mimic the NoSIP ActiveX object in WebKit.
* **Possible Values:** 0 - Do Not Preload, 1 - Preload

### PreloadLegacyAirBeam
* **Configuration Identifier:** PRELOADLEGACYAIRBEAM
* **Description:** Not applicable to the Enterprise Tablet - Whether or not to preload the NPAPI plug-in to mimic the AirBeam ActiveX object in WebKit.
* **Possible Values:** 0 - Do Not Preload, 1 - Preload

### PreloadLegacyAPD
* **Configuration Identifier:** PRELOADLEGACYAPD
* **Description:** Whether or not to preload the NPAPI plug-in to mimic the APD ActiveX object in WebKit.
* **Possible Values:** 0 - Do Not Preload, 1 - Preload

### PreloadJSObjects
* **Configuration Identifier:** PRELOADLEGACYJSOBJECTS
* **Description:** Whether or not to preload the NPAPI plug-in to provide native JavaScript objects for each of the modules.
* **Possible Values:** 0 - Do Not Preload, 1 - Preload

### Preload
> Note: Preloads are not applicable to the enterprise tablet, as plug-ins are integral to the MEB on this platform.

* **Configuration Identifier:** PRELOAD
* **Description:** By default plug-ins will be loaded into memory when needed, e.g. when `Barcode.enable()` is called, the `Barcode` plug-in DLL will be loaded into memory. This loading operation takes takes a certain amount of time when it is performed for the first time; to prevent the user from noticing any lag when using their application, modules can be loaded in the background when the MEB starts. Specify a pre-load tag for each module you wish to load at MEB startup; note that multiple modules may be defined in the same DLL but you still need to list all modules to preload here to see maximum benefit.
	* On low memory devices, it is recommended to preload all your required modules to avoid your program running out of memory during execution.
* **Possible Values:** Module name

## Applications / Application / HTMLStyles
### CaretWidth
* **Configuration Identifier:** CARETWIDTH
* **Description:** This setting is a number which specifies the width of the text-box / text area caret, in pixels. The default value if you don't specify anything is '1'.  Prior to this release the width was fixed at '1' and you could not change it. This setting only applies to the Webkit on Windows Mobile or Windows CE.
* **Possible Values:** Integer values for caret width in pixels.

### FontFamily
* **Configuration Identifier:** FONTFAMILY
* **Description:** Specifies the default font to use when rendering text in web pages.  The specified font should be a TrueType font present on the device.
	* On Windows, the default font has been set to 'Tahoma' as this is present on all Motorola WM / CE devices. Note that Tahoma has no italic or oblique variants.
	* On the Enterprise Tablet the default is 'Droid Sans Fallback'. 

> Note: The specified font must be stored in `\Windows` for Windows WM / CE devices, or `/system/fonts` for Enterprise Tablet.

* **Possible Values:** Font Family name

### FontDirectory
* **Configuration Identifier:** FONTDIRECTORY
* **Description:** Specifies the font directory where true type fonts can be found.  On Windows the default font directory is `\Windows` on all Motorola WM / CE devices.  Not applicable to the Enterprise Tablet.
* **Possible Values:** '\Windows'

### UseNativeFonts
> Note: This config item is not currently available on the latest BSPs for MC92, VC70 or WT41N0.

* **Configuration Identifier:** USENATIVEFONTS
* **Description:** When set to 0 (default) the FreeType library is used. When set to 1 the native font engine on the device is used to render fonts and the 'FontFamily' setting will have no effect. By default, on localized devices from, the native font engine will be used as the FreeType library can not render localized characters (e.g. Italian accented characters, Korean characters, Chinese characters etc). Some early BSPs of CE7 do not support the native font render unfortunately. The log file will show the font engine in use on launch if there is doubt. This setting is specific to Windows Mobile / Windows CE. 
* **Possible Values:** 0 - Use FontFamily Setting, 1 - Use FreeType font library

## Applications / Application / GUI
### SignalRefresh
* **Configuration Identifier:** SIGNALREFRESH
* **Description:** Specifies the refresh rate of the signal display, see the [Signal API]() for more information.
* **Possible Values:** Refresh rate in milliseconds.

### BatteryRefresh
> Note: Not applicable to the Enterprise Tablet. [See remark](#_batteryRefresh).

* **Configuration Identifier:** BATTERYREFRESH
* **Description:** Specifies the refresh rate of the battery display, see the [Battery API]() for more information. 
* **Possible Values:** Refresh rate in milliseconds.

### HourglassEnabled
* **Configuration Identifier:** HOURGLASSENABLED
* **Description:** By default an [Hourglass]() will be displayed whilst navigating between pages. This setting can be used to disable that behavior.
* **Possible Values:** 0 - Disabled, 1 - Enabled

### HourglassLeft
* **Configuration Identifier:** HOURGLASSLEFT
* **Description:** By default an [Hourglass]() will be displayed whilst navigating between pages. This setting can be used to adjust its horizontal position. If not specified the hourglass will appear at the center of the screen.
* **Possible Values:** A number of pixels to offset the hourglass horizontally from the center.

### HourglassTop
* **Configuration Identifier:** HOURGLASSTOP
* **Description:** By default an [Hourglass]() will be displayed whilst navigating between pages, this setting can be used to adjust its vertical position. If not specified the hourglass will appear in the center of the screen.
* **Possible Values:** A number of pixels to offset the hourglass vertically from the center.

## Applications / Application / Navigation
### BadLinkURI
* **Configuration Identifier:** BADLINKURI
* **Description:** The browser will automatically append the querystring value "badlink" containing the url of the page which could not be reached and "stop=true" if the page was loaded because the user pressed the stop button. The page specified in the badlink setting should be an off-line file using the `file://` protocol, this way the browser can always access the file. Navigation to the specified badlink uri will be performed when one of the following situations occurs:

	* There is an error attempting to navigate to the page, e.g. the device has no network connection.
	* The timeout occurs when navigating to the page.  You can adjust the value of the timeout using the NavTimeout setting.
	* The user presses the stop button.

* **Possible Values:** File name and path stored locally on the device.

> Note: The local path string is case-sensitive.

### UserAgent
* **Configuration Identifier:** USERAGENT
* **Description:** When visiting a web server the WebKit browser will report its User-Agent header as the specified value. Use the UserAgent setting to spoof your device to the server, e.g. to view content designed for the desktop on your mobile screen. Use the following substitution variables:

	* %p - platform name ("Windows CE " + version number)
	* %w - WebKit version number
	* %e - MotorolaWebKit version number.

* **Possible Values:** String

### ViewportEnabled
* **Configuration Identifier:** VIEWPORTENABLED
* **Description:** Whether to enable or disable viewport meta tag processing (default is enabled).
* **Possible Values:** 0 - Disabled, 1 - Enabled

### ViewportWidth
* **Configuration Identifier:** VIEWPORTWIDTH
* **Description:** Default viewport width to use for pages that do not have a viewport meta tag (uses 1:1 scaling if not specified).
* **Possible Values:** Width of the viewport in pixels

### CaFile
* **Configuration Identifier:** CAFILE
* **Description:** A file of CA certificates in PEM format. See [openssl](http://www.openssl.org/docs/ssl/SSL_CTX_load_verify_locations.html) for information on this. This setting is supported on Windows Mobile / CE and Android.
* **Possible Values:** Local File name on the device.

### CaPath
* **Configuration Identifier:** CAPATH
* **Description:** A directory containing CA certificates in PEM format (one certificate per file). The OpenSSL `c_rehash` utility must be used to generate appropriately named links to the certificate files. See [openssl](http://www.openssl.org/docs/ssl/SSL_CTX_load_verify_locations.html) for more information. This setting is supported on Windows Mobile / CE and Android.
* **Possible Values:** Local File path on the device.

### VerifyPeerCertificate
* **Configuration Identifier:** VERIFYPEERCERTIFICATE
* **Description:** Verify the server certificate against the internal certificates. It is strongly recommended not to set this to 0 in deployment situations, but it can be useful during development. A value of 0 is equivalent to automatically clicking 'OK' on a web browser's dialog querying an untrusted certificate.
* **Possible Values:** Boolean

### NetworkCookieDatabase
* **Configuration Identifier:** NETWORKCOOKIEDATABASE
* **Description:** If you want your cookies to persist across device boots then specify a file name here for the database used to hold the cookies. If the specified file does not already exist then one will be created. The cookies will be loaded in from this file and saved back to it when the MEB exits, unless the file is read only in which case it will not be overwritten. If not specified cookies will not persist.
* **Possible Values:** Fully qualified local path.

> Note: The local path string is case-sensitive.

### Cache
* **Configuration Identifier:** NAVIGATIONCACHE
* **Description:** The browser cache size, in integer multiples of MBs. eg. 5MB.
* **Possible Values:** Integer MB values.


<!-- Missing in default Config.xml -->
<!-- 
    <tr>
    <td class="clsEvenRow">ScreenOrientation\\AutoRotate</td>
    <td class="clsEvenRow">AUTOROTATE</td>
    <td class="clsEvenRow">When disabled the orientation of the screen will not change as the device is rotated and vice versa.  This is a screen rotation lock.</td></td></td>
    <td class="clsEvenRow">0 - Disabled<BR>1 - Enabled</td>
    </tr>

    <tr>
    <td>UserData</td>
    <td>N/A</td>
    <td>Used to persist data when using Read/WriteUserSetting.</td></td></td>
    <td>Any valid user setting.</td>
    </tr>

    <tr>
    <td class="clsEvenRow">Scrolling\\ScrollTechnique</td>
    <td class="clsEvenRow">SCROLLTECHNIQUE</td>
    <td class="clsEvenRow">Specifies the technique used to scroll the viewport:<br/><b>FingerScroll</b> - You can scroll around the page using finger swiping.<br/><b>Scrollbars</b> - When the size of the page is too large to fit into the viewport, scrollbars will be presented which can be used to scroll the page (Not available on Android)<br/><b>None</b> - No scrollbars will be displayed and the page will not respond to finger swipes.<br/><b>NOTE:</b> FingerScroll may interfere with drawing on a Canvas element</td>
    <td class="clsEvenRow">See description</td>
    </tr>

    <tr>
    <td>Authentication\\Username</td>
    <td>AUTHUSER_GLOBAL</td>
    <td>Specifies the username to be provided automatically when RhoElements is instructed to navigate to any page which requires basic or digest HTTP authentication.<P/>If this setting is absent from the configuration file a popup dialog will be displayed prompting the user to enter their own credentials.  Leaving the value blank will provide a username of "".  RhoElements will only permit the user to enter incorrect credentials twice before presenting the HTTP 401 Unauthorized page, the application should be designed to handle this scenario.</td>
    <td>ASCII text</td>
    </tr>

    <tr>
    <td class="clsEvenRow">Authentication\\Password</td>
    <td class="clsEvenRow">AUTHPASS_GLOBAL</td>
    <td class="clsEvenRow">Specifies the password to be provided automatically when RhoElements is instructed to navigate to any page which requires basic or digest HTTP authentication.<P/>If this setting is absent from the configuration file a popup dialog will be displayed prompting the user to enter their own credentials.  Leaving the value blank will provide a password of "".  RhoElements will only permit the user to enter incorrect credentials twice before presenting the HTTP 401 Unauthorized page, the application should be designed to handle this scenario.</td>
    <td class="clsEvenRow">ASCII text</td>
    </tr>

    <tr>
    <td>SIP\\ResizeOnSIP</td>
    <td>RESIZEONSIP</td>
    <td>When enabled the browser window will resize to accommodate the SIP (Soft Input Panel, the on-screen virtual keyboard) when displayed.  If the SIP has been moved to the top half of the screen the browser window will reduce in size from the top.  In order to use this configuration setting you must preload the SIP module.  (Windows Mobile Only.  This option is not compatible with CE or Finger Scrolling, the SIP will always appear at the bottom of the screen)</td>
    <td>0 - Disabled<BR>1 - Enabled</td>
    </tr>

    <tr>
    <td class="clsEvenRow">SIP\\EnableSIP</td>
    <td class="clsEvenRow">Not Configurable</td>
    <td class="clsEvenRow">Disables or Enables the SIP (Soft Input Panel, the on-screen virtual keyboard).  (Android Only, on Windows the Left & Top parameters of the SIP module can be used to position the SIP off the screen.)</td>
    <td class="clsEvenRow">0 - Disabled<BR>1 - Enabled</td>
    </tr>

    <tr>
    <td>System\\LowBatteryScan</td>
    <td>LOWBATTERYSCAN</td>
    <td>Windows Mobile and CE only.  Set to 0 to disable scanning when the battery is low or set to 1 to enable it.  Once disabled the scanner can be enabled again by calling <code>Barcode.enable</code>.</td>
    <td>0 - Disabled<BR>1 - Enabled</td>
    </tr>

    <tr>
    <td class="clsEvenRow">Scanner\\DisableScannerDuringNavigation</td>
    <td class="clsEvenRow">DISABLESCANNERDURINGNAV</td>
    <td class="clsEvenRow">By default if you have enabled the Scanner on a page, through either meta tags, JavaScript or Ruby and navigate to a new page the Scanner will automatically disable.  To override this behavior you can set this option to '0' and once enabled the Scanner will remain so in the foreground application until you disable it.  This setting is only applicable to RhoMobile Suite version 2.2 and above.</td>
    <td class="clsEvenRow">0 - The Scanner will remain enabled during page navigation<BR>1 - The Scanner will disable during a page navigation</td>
    </tr>

    <tr>
    <td>Sound\\DecodeVolume</td>
    <td>DECODEVOLUME</td>
    <td>The volume of the device beeper when a barcode is scanned</td>
    <td>0 to 5 with 5 being the loudest</td>
    </tr>

    <tr>
    <td class="clsEvenRow">Sound\\DecodeFrequency</td>
    <td class="clsEvenRow">DECODEFREQUENCY</td>
    <td class="clsEvenRow">The frequency of the device beeper when a barcode is successfully decoded.  This should be within the range of the beeper</td>
    <td class="clsEvenRow">0 to 0xFFFF</td>
    </tr>

    <tr>
    <td>Sound\\InvalidDecodeFrequency</td>
    <td>INVALIDDECODEFREQUENCY</td>
    <td>The frequency of the device beeper when a barcode is scanned but not successfully decoded.  This should be within the range of the beeper. Not applicable to the Enterprise Tablet.</td>
    <td>0 to 0xFFFF</td>
    </tr>

    <tr>
    <td class="clsEvenRow">Sound\\DecodeDuration</td>
    <td class="clsEvenRow">DECODEDURATION</td>
    <td class="clsEvenRow">The duration of the device beeper when a barcode is scanned</td>
    <td class="clsEvenRow">Milliseconds</td>
    </tr>

    <tr>
    <td>Sound\\ScanDecodeWav</td>
    <td>SCANDECODEWAV</td>
    <td>Wave file to be played when the scanner successfully decodes a barcode.  This setting overrides the scanner beeper.</td>
    <td>File name and path stored locally on the device.<a href="#_caseSensitivity">&dagger;</a></td>
    </tr>

    <tr>
    <td class="clsEvenRow">Sound\\ScanInvalidWav</td>
    <td class="clsEvenRow">SCANINVALIDWAV</td>
    <td class="clsEvenRow">Wave file to be played when a barcode is scanned but not successfully decoded.  This setting overrides the scanner beeper. Not applicable to the Enterprise Tablet.</td>
    <td class="clsEvenRow">File name and path stored locally on the device.</td>
    </tr>

    <tr>
    <td>Sound\\ImagerCaptureWav</td>
    <td>IMAGERCAPTUREWAV</td>
    <td>Wave file to be played when the Imager captures an image</td>
    <td>File name and path stored locally on the device.</td>
    </tr>

    <tr>
    <td>DefaultMetaTags\\MetaTag</td>
    <td>DEFAULTMETATAG</td>
    <td>All RhoElements Meta Tags can be set by default in the configuration, meaning if a common tag is required by the application it need not be present on every HTML page. Set a default tag in by specifying the tag's module, followed by a tilda character and then the properties of the module you wish to set, specified in EMML 1.1.  If the meta tag is present in both the configuration and a loaded page then the page will take priority. Logically only persistent tags can be set in the configuration, a tag's persistence being stated in the 'additional information' section in the help file.</td>
    <td>[Module]~[Contents expressed in EMML1.1]</td>
    </tr>



    <tr>
    <td>TabInstance\\NewTabPhysicalMemLimit</td>
    <td>NEWTABPHYSICALMEMLIMIT</td>
    <td>This setting controls whether a new Tab will be created using the <a href="../api/NativeTabbar#mcreate">NativeTabbar.create API</a> when a physical memory usage percentage is hit. Ex: if it is set to 80 - then the tab instance will not be created if the physical memory usage on the device is>=80%. If the tab is unable to be created due to this limit being reached the <a href="../api/NativeTabbar#mcreate">NativeTabbar.create API</a> callback will contain a <code>tabEvent</code> = <code>onTabNewError</code>.</td>
    <td>0-100 (100=no limit)</td>
    </tr>

    <tr>
    <td class="clsEvenRow">TabInstance\\NewTabVirtualMemLimit</td>
    <td class="clsEvenRow">NEWTABVIRTUALMEMLIMIT</td>
    <td class="clsEvenRow">This setting controls whether a new Tab will be created using the <a href="../api/NativeTabbar#mcreate">NativeTabbar.create API</a> when a virtual memory usage percentage is hit. Ex: if it is set to 80 - then the tab instance will not be created if the physical memory usage on the device is>=80%.If the tab is unable to be created due to this limit being reached the <a href="../api/NativeTabbar#mcreate">NativeTabbar.create API</a> callback will contain a <code>tabEvent</code> = <code>onTabNewError</code></td>
    <td class="clsEvenRow">0-100 (100=no limit)</td>
    </tr>
 -->

## Substitution Variables
The following substitution variables are available in the configuration file
<table class="re-table">
<tr>
<th>Substitution Variable</th>
<th>Expanded Value</th>
</tr>
<tr>
<td>%INSTALLDIR%</td>
<td>The directory into which the Enterprise Browser has been installed.</td>
</tr>
</table>

## Remarks
###<a name="_caseSensitivity"></a>Case Sensitivity
The operating systems of some devices have case sensitive file systems. Therefore it is good practice to always keep URL values in the Config.xml file case identical to the names of the actual files.
###<a name="_batteryRefresh"></a>Battery Polling on the Enterprise Tablet
On the Enterprise Tablet the battery notification is asynchronous. For this reason, BatteryRefresh is not supported on the Enterprise Tablet. The effect of this is that a batteryEvent is fired only when the battery level changes. This has been done to save battery power compared to polling.
###<a name="_fnbehavior"></a>Interaction between FunctionKeysCapturable and EnableFunctionKey configuration settings
On Windows Mobile and Windows CE devices full control is given to the developer over how their application handles function keys.  Because of the limitations of the operating system <b>any settings applied will persist until the device is next warm booted</b>.  Which function keys have default operating system behavior will vary from device to device, e.g. on the MC75a F3 and F4 represent the red and green phone keys and on many devices the volume keys are also mapped as Function keys.  Not all function keys will have default operating system behavior.

<b><i>Unblocking function keys may expose the underlying operating system, particularly the red and green phone keys will give access to the start menu and programs.</i></b>

The table below shows the behavior of the MEB when Function Keys are pressed given the possible configuration settings:

<table border=1 width="100%" class="re-table">
  <tr>
    <th></th>
    <th>Function Keys Capturable = TRUE</th>
    <th>Function Keys Capturable = FALSE</th>
  </tr>
  
  <tr>
    <th>Enable Function Key = TRUE</th>     
    <td valign="top">
      <ul>
        <li>All Function Keys <b>can</b> be captured by the <a href="../rhoelements/keycapture">Key Capture Module</a>
        <li>Function Key will <b>not</b> have its default Operating system behavior
      </ul>
    </td>
    <td valign="top">
      <ul>
        <li>Function Keys with default OS behavior <b>can not</b> be captured by the <a href="../rhoelements/keycapture">Key Capture Module</a>
        <li>Function Keys without default OS behavior <b>can</b> be captured by the <a href="../rhoelements/keycapture">Key Capture Module</a>
        <li>Function Key <b>will</b> have its default Operating system behavior (if any)
      </ul>
    </td>
  </tr>
  
  <tr>
    <th>Enable Function Key = FALSE</th>
    <td valign="top">
      <ul>
        <li>All Function Keys <b>can</b> be captured by the <a href="../rhoelements/keycapture">Key Capture Module</a>
        <li>Function Key will <b>not</b> have its default Operating system behavior
      </ul>
    </td>
    <td valign="top">
      <ul>
        <li>All Function Keys <b>can not</b> be captured by the <a href="../rhoelements/keycapture">Key Capture Module</a>
        <li>Function Key will <b>not</b> have its default Operating system behavior (if any)</li>
      </ul>
    </td>
  </tr>
</table>