# Application Runtime Configuration
Runtime configuration settings of RhoElements apps are managed through `Config.xml` and `rhoconfig.txt` files. **`Config.xml` is *required* for RhoElements execution, and your app will not start without it**. The `Config.xml` file determines features of the RhoElements runtime itself, such as the keys that can be intercepted by the application and whether to pre-load modules on startup. An example configuration file is provided as part of the installation and many (though not all) settings contain sensible defaults. The example `Config.xml` file is bundled with the `rhoelements` gem. Location of the file on various device installations is detailed below. 

The `rhoconfig.txt` file controls the app's startup page, the address of the `RhoConnect` synchronization server, if applicable, and some other settings. 

This guide explains the meanings of each of the settings and their possible values. 

###Vulnerability Alert

>**Applies to Windows Mobile and Windows CE apps built with RMS 5.1 or higher**.

>In Oct., 2014, a vulnerability was discovered affecting applications that use SSL3, which is part of the Zebra Webkit (Ekioh 3.1.1). Known as POODLE (Padded Oracle On Downgraded Legacy Encryption), the vulnerability [as described by the U.S. Comuputer Emergency Readiness Team](https://www.us-cert.gov/ncas/alerts/TA14-290A) would allow an attacker to exploit the means by which SSL 3.0 handles block cipher mode padding to decrypt and **extract information from inside an encrypted transaction**.<br><br> To protect against this, **Zebra now ships the Zebra Webkit with SSL3 disabled by default**. <br><br>

>To forego this safeguard and enable SSL3, you must append the `<Navigation>` section of the `Config.xml`: <br>

>In `Config.xml`:
    :::yaml
    <Navigation>
      ...
      <EnableSSL3 value="0"/>
      # value="0" (SSL3 disabled) 
      # value="1" (SSL3 enabled)
      # If not specified, SSL3 is enabled
      ...
    </Navigation>


## rhoconfig.txt
You can use `rhoconfig.txt` to add arbitrary values that are specific to your application and apart from settings recognized by the platform:

Sample yaml code:

    :::yaml
    # application-specific value
    foo = 'bar'

All values will be accessible at runtime via `Rho::RhoConfig`:

Sample Ruby code:
    :::ruby
    foo = Rho::RhoConfig.bar
    start_path = Rho::RhoConfig.start_path

You also can check if a configuration property actually exists before accessing it:

Sample Ruby code:
    :::ruby
      start_path_exists = Rho::RhoConfig.exists?("start_path") # will return true

The `rhoconfig.txt` file generated with each new application contains the following default values along with descriptions of each setting:

Sample yaml code:
    :::yaml
      # startup page for your application
    start_path = '/app'

      # path to the options page (in this case handled by JavaScript)
    options_path = '/app/Settings'

      # location of bundle url (i.e. from rhohub.com); used by desktop win32 simulator
    rhobundle_zip_url = ''

      # optional password to access bundle (usually not required); used by desktop win32 simulator
    rhobundle_zip_pwd = nil

    # Rhodes log properties
    # log level
    # 0-trace, 1-info(app level), 2-warnings, 3-errors
    # for production set to 3
    MinSeverity = 1

    # enable copy log messages to standard output, useful for debugging
    LogToOutput = 1

    # '*' means all categories, otherwise list them : Cat1, Cat2
    LogCategories = *

    # what categories to exclude
    ExcludeLogCategories =

    # max log file size in Bytes, set 0 to unlimited size; when limit is reached, log wraps to beginning of file
    MaxLogFileSize=50000

    # turn on local http server traces, off by default
    #net_trace = 0

    # timeout of network requests in seconds (30 by default)
    #net_timeout = 60

    # where log will be posted by RhoConf.send_log or from the log menu
    # source is also open and up on http://github.com/rhomobile/rhologs, so you can deploy your own logserver
    logserver = 'http://rhologs.heroku.com'

    # log file prefix - contain human-readable text
    logname='rhodes-app'

    # Keep track of the last visited page
    KeepTrackOfLastVisitedPage = 0
    LastVisitedPage = ''

    # sync server url, typically this will look like 'http://<hostname>:<port>/application'
    # for example: 'http://localhost:9292/application'
    syncserver = ''

    # 0 will disable auto sync
    sync_poll_interval=0

    # geo location inactivity timeout (in seconds)
    # geo_location_inactivity_timeout = 30

    # open rhodes app in full screen mode
    # default 1 for Android up to Rhodes 2.2.5.
    # on all other platforms and on Android from Rhodes > 2.2.5 default 0
    full_screen = 0

    # show top menu on Windows desktop in full screen mode (default is 0=don't show top menu)
    # w32_fullscreen_menu = 1

    # disable the Android page loading progress bar
    disable_loading_indication = 1

    # Port of the local (embedded) HTTP server. This parameter is mainly for debug purposes.
    # If not specified, application will use dynamically selected one.
    # WARNING!!! Remove this parameter before put application to production.
    # local_server_port = 8080

    # show status bar on windows mobile. default 1
    # wm_show_statusbar = 1

    # disable screen rotation (enabled by default) - disable possible for ANDROID and iPhone ONLY
    # disable_screen_rotation = 1

    # disable close app when pressing back on home screen on blackberry
    # bb_disable_closebyback = 0

    # load images in background, this improve reaction speed on user actions, 0 by default
    # bb_loadimages_async = 0

    # set to 0 to reset the bulksync_state and trigger a bulk sync the next time rhodes synchronizes
    # bulksync_state = 1

    # hides forward button and animates back button transition
    jqtouch_mode=1

    splash_screen='zoom'

    use_bb_full_browser=6

    esri_map_url_roadmap: type: string

    ESRI server url with roads map tiles.
    iOS       - supported in esri extension.
    Android   - supported with ESRI map type.
    WM       - supported with WM mapview.
    WP8      - mapping is not supported.

    esri_map_url_satellite: type: string
    ESRI server url with satellite map tiles.
      iOS       - supported in esri extension.
      Android   - supported with ESRI map type.
      WM       - supported with WM mapview.
      WP8      - mapping is not supported.

    OSM_map_url_roadmap: type: string
    OSM server url with road map tiles.
      iOS      - not supported as only Google and ESRI maps are supported.
      Android   - supported with OSM map type.
      WM       - supported with WM mapview.
      WP8      - mapping is not supported.

    disable_loading_indication:type - Bool
    If enabled, blocks loading indication in webview
      Supported only on Android.

### Additional parameters that can be used in rhoconfig.txt

    :::yaml
    iswindowskey=1
    # When set to '1' the Android version of the application will generate Windows Mobile
    # keycode values for all keys in place of normal Android keycodes. This can be 
    # useful for supporting both Android and Windows device platforms with a single 
    # codebase. When tag value is '0' (default) or is left unspecified, the standard 
    # keycodes of the platform will be used. Works with the KeyCapture API of RhoElements 
    # 4.x or 2.x. 

    http_proxy_host = 'server'
    http_proxy_port = port
    # Address and port of proxy server. This settings uses Network module.
    # Do not include 'http://' while setting the http_proxy_host 

    Example:
    http_proxy_host = 'wwwxyz123.abc.com'
    http_proxy_port = 6060

    http_proxy_login  = 'user'
    http_proxy_password = 'password'
    # Login and password for access to proxy server. Only basic authentication is supported

    clientSSLCertificate     = 'certificate path'
    clientSSLCertificatePassword = 'password'
    # CLient SSL Configuration. The path to the p12 formatted certificate file and the password used with the client certificate.
    # The path to the p12 formatted certificate file used for client SSL authentication. This setting is used in any Network API calls which setting up secured SSL
    # connections requiring client authentication (get, post, downloadFile, uploadFile). This setting only takes effect if `verifyPeerCertificate` is enabled.
    # Therefore, if `verifyPeerCertificate` is set to fail and remote server requests the client certificate, connection will fail.
    # These two settings are only supported for use on Android devices.
  

    ios_net_curl=0
    #If true, an old libCURL-based Net request will be used. This option can be enabled for regression testing or if custom proxy support is required. Default is TRUE, but to support per-app VPN (i.e. MobileIron) this option should be set to FALSE.

    ios_direct_local_requests=1
    #If true, request to local server will be applied directly, bypassing socket intercommunication, no network requests are involved. If false, a legacy client-server intercommunication will be made for local requests. Default is FALSE, but to support per-app VPN (i.e. MobileIron) this option should be set to TRUE.


## Config.xml

####General notes about Config.xml
* The `Config.xml` file affects only applications that use Zebra's Webkit. 

* It determines features of the RhoElements runtime, including keys that can be intercepted by the application and whether to pre-load modules on startup. 
* The `CaFile` setting applies only to apps built with RMS 4.0 that use the stock browser.

* Full screen mode is currently unavailable for the iOS 7 SDK. For details and other differences, please refer to the [Differences in iOS7](build_ios#differences-building-for-ios7) section in the [Build for iOS](build_ios) doc.


###Location on desktops

####Windows:
`<RhoMobile Suite installation directory>\ruby\lib\ruby\gems\1.9.1\gems\rhoelements-4.0.0\libs\data\Config\Config.xml`

#####Mac OS X:
`~/.rvm/gems/ruby-1.9.3-p392/gems/rhoelements-4.0.0/libs/data/Config/Config.xml`

###Location on a mobile devices

####On the Zebra Enterprise Tablet: 
`/Android/data/com.motorolasolutions.rhoelements/Config.xml`

####All other devices: 
`<installation root>\Config`

####For persistent installations: 
**On cold boot, `Config.xml` is copied from `\Application\RhoElements\Config\Config.xml`<br> to `\Program Files\RhoElements\Config\Config.xml`**. 

* To persist settings after a cold boot, **store desired settings in both locations**. 

* **Modify this behavior by editing** `\Application\RhoElements.cpy`. 

* **Switch between `Config.xml` files using the /C: configuration option**. 

## Config.xml File Format
**Typical Config.xml file**:
    :::xml
      <Configuration>
      <DebugButtons>
        <DebugButtonsEnabled value="0" />
      </DebugButtons>
     <Logger>
        <LogProtocol value="FILE"/>
        <LogPort   value="80"/>
        <LogURI    value="file://\Program Files\RhoElements\Log.txt"/>
        <LogError   value="1"/>
        <LogWarning  value="1"/>
        <LogInfo   value="1"/>
        <LogUser   value="1"/>
       <LogMemory  value="1"/>
        <LogMemPeriod value="5000"/>
        <LogMaxSize  value="10"/>
    </Logger>
    <FileLocations>
      <RegEXFile value="\Program Files\RhoElements\Config\RegEx.xml"/>
      <PluginFile value="\Program Files\RhoElements\Config\Plugin.xml"/>
     </FileLocations>
     <Screen>
      <FullScreen       value="1"/>
      <ShowLicenseConfirmation value="0"/>
      <PageZoom        value="1.0"/>
     </Screen>
    <VoidConnection>
     <TrackConnection value="0"/>
     <HostURL     value="100.159.16.12"/>
     <Message     value="Establishing Connection "/>
     <Timeout     value="30000"/>
     <PollInterval  value="5000"/>
    </VoidConnection>
     <WebServer>
      <Enabled  value="1"/>
      <Port   value="8080"/>
      <WebFolder value="\www"/>
      <Public  value="0"/>
     </WebServer>
     <DeviceKeys>
      <FunctionKeysCapturable  value="0"/>
      <EnableFunctionKey_F1   value="0"/>
      <EnableFunctionKey_F2   value="0"/>
      <EnableFunctionKey_F3   value="0"/>
      <EnableFunctionKey_F4   value="0"/>
      <EnableFunctionKey_F5   value="0"/>
      <EnableFunctionKey_F6   value="0"/>
      <EnableFunctionKey_F7   value="0"/>
      <EnableFunctionKey_F8   value="0"/>
      <EnableFunctionKey_F9   value="0"/>
      <EnableFunctionKey_F10  value="0"/>
      <EnableFunctionKey_F11  value="0"/>
      <EnableFunctionKey_F12  value="0"/>
      <EnableApplicationKey_A1 value="0"/>
      <EnableApplicationKey_A2 value="0"/>
      <EnableApplicationKey_A3 value="0"/>
      <EnableApplicationKey_A4 value="0"/>
      <EnableApplicationKey_A5 value="0"/>
      <EnableApplicationKey_A6 value="0"/>
      <EnableApplicationKey_A7 value="0"/>
      <EnableApplicationKey_A8 value="0"/>
     </DeviceKeys>
     <Navigation>
      <NavTimeout value="45000"/>
     </Navigation>
     <ScreenOrientation>
      <AutoRotate value="0"/>
     </ScreenOrientation>
     <TabInstance>
      <NewTabPhysicalMemLimit value="90"/>
      <NewTabVirtualMemLimit value="80"/>
     </TabInstance>
     <Geolocation>
      <GeolocationEnabled value="0"/>
     </Geolocation>
     <UserData>
     </UserData>
     <Applications>
      <Application>
       <General>
        <Name         value="Menu"/>
        <StartPage       value="file://\Program Files\RhoElements\HTML\Menu.htm" name="Menu"/>
        <UseRegularExpressions value="0"/>
       </General>
       <HTTP_Proxy value="http://myproxy.com:1050"/>
       <No_Proxy  value="myhost, .mydomain.com, 192.168.1.1,192.168.0.0/24"/>
       <WebDB>
        <WebStorageDBPath value="file://\Program Files\RhoElements"/>
        <WebSQLDBQuota  value="5000000"/>
        <WebSQLDBPath   value="file://\Program Files\RhoElements"/>
       </WebDB>
       <ApplicationCache>
        <ApplicationCachePath  value="file://\Program Files\RhoElements"/>
        <ApplicationCacheQuota value="5000000"/>
       </ApplicationCache>
       <NPAPI>
        <NPAPIDirectory     value="file://\Program Files\RhoElements\NPAPI\"/>
        <Preloads>
         <PreloadLegacyActiveX value="0"/>
         <PreloadLegacyGeneric value="1"/>
         <PreloadLegacyODAX  value="1"/>
         <PreloadLegacyNoSIP  value="1"/>
         <PreloadLegacyAirBeam value="1"/>
         <PreloadLegacyAPD   value="1"/>
         <PreloadJSObjects   value="1"/>
        </Preloads>
       </NPAPI>
       <Preloads>
        <Preload value="Scanner"/>
        <Preload value="Hourglass"/>
       </Preloads>
       <Scrolling>
        <ScrollTechnique value="FingerScroll"/>
       </Scrolling>
       <Authentication>
        <Username value="user"/>
        <Password value="pass"/>
       </Authentication>
       <HTMLStyles>
        <CaretWidth      value="1" />
        <FontFamily      value="Tahoma" />
        <FontDirectory     value="file://\Windows" />
        <UseNativeFonts    value="0" />
       </HTMLStyles>
       <SIP>
        <ResizeOnSIP value="0"/>
        <EnableSIP  value="1"/>
       </SIP>
       <System>
        <LowBatteryScan value="0"/>
       </System>
       <Scanner>
        <DisableScannerDuringNavigation value="1"/>
       </Scanner>
       <Sound>
        <DecodeVolume      value="5"/>
        <DecodeFrequency    value="0xBB8"/>
        <InvalidDecodeFrequency value="0x9C4"/>
        <DecodeDuration     value="250"/>
        <ScanDecodeWav     value=""/>
        <ScanInvalidWav     value=""/>
        <ImagerCaptureWav    value=""/>
       </Sound>
       <GUI>
        <SignalRefresh   value="5000"/>
        <BatteryRefresh   value="5000"/>
        <HourglassEnabled  value="1" />
        <HourglassLeft   value="" />
        <HourglassTop    value="" />
       </GUI>
       <Navigation>
        <BadLinkURI          value=""/>
        <UserAgent          value="Mozilla/5.0 (%p) AppleWebKit/%w (KHTML, like Gecko) MotorolaWebKit/%e Mobile Safari/%w"/>
        <ViewportEnabled       value="0"/>
        <ViewportWidth        value="640"/>
        <CaFile            value="%INSTALLDIR%\server.pem"/>
        <VerifyPeerCertificate    value="1"/>
        <ClientSSLCertificate     value=""/>
        <ClientSSLCertificatePassword value=""/>
        <NetworkCookieDatabase    value="file://\Program Files\RhoElements\cookies.db"/>
        <AcceptLanguage        value="en-GB,en-US;q=0.8,en;q=0.6,af;q=0.4"/>
        <Cache            value="5MB"/>
        <Keepalive          value="true"/>
        <DisableTLS          value="0"/>
       </Navigation>
       <DeviceKeys>
        <EnableCtrlKey_C     value="0"/>
        <EnableCtrlKey_V     value="0"/>
        <EnableBacklightSlider  value="0"/>
        <EnableVolumeSlider    value="0"/>
       </DeviceKeys>
       <DefaultMetaTags>
        <MetaTag value="SignatureCapture~left:30;top:130;height:100;bgcolor:#663300;width:200;border:visible;visibility:visible;" />
        <MetaTag value="Signal~left:10;top:200;color:#663300;"/>
       </DefaultMetaTags>
      </Application>
     </Applications>
    </Configuration>

## Configuration settings and values

The following section describes each Config.xml setting and all of its possible values. 

##ApplicationCache
###ApplicationCacheQuota
Application Cache data maximum quota per application.<br>

**Configuration Identifier**: APPLICATIONCACHEQUOTA<br>
**Possible Values**: Size in bytes<br>
**Platforms**: WM/CE Webkit<br>

###ApplicationCachePath
Path to an existing directory to store Application Cache data.<br>

**Configuration Identifier**: APPLICATIONCACHEPATH<br>
**Possible Values**: Fully qualified local path (case sensitive)<br>
**Platforms**: WM/CE Webkit<br>

##Authentication
###Password
Specifies the password to be provided automatically when RhoElements is instructed to navigate to any page which requires basic or digest HTTP authentication. If this setting is absent, a login prompt will be displayed with a password of "". 

NOTE: RhoElements permits the user to enter incorrect credentials twice before presenting the HTTP 401 Unauthorized page. Your application should be designed to handle this scenario.<br>

**Configuration Identifier**: AUTHPASS_GLOBAL<br>
**Possible Values**: ASCII text<br>
**Platforms**: Android, iOS, WM/CE<br>

###Username
Specifies the username to be provided automatically when RhoElements is instructed to navigate to a page that requires basic or digest HTTP authentication. If this setting is absent, a login prompt will be displayed with a username of "". 

NOTE: RhoElements permits the user to enter incorrect credentials twice before presenting the HTTP 401 Unauthorized page. Your application should be designed to handle this scenario.<br>

**Configuration Identifier**: AUTHUSER_GLOBAL<br>
**Possible Values**: ASCII text<br>
**Platforms**: Android, iOS, WM/CE<br>

##DebugButtons
###DebugButtonsEnabled
When enabled, presents a set of controls useful for development and debugging purposes.<br>

**Configuration Identifier**: DEBUGBUTTONSENABLED<br>
**Possible Values**: 0 - Disabled, 1 - Enabled<br>
**Platforms**: Android, iOS, WM/CE<br>

##DefaultMetaTags
###MetaTag
Permits a default meta tag to be specified so that a tag required by the application need not be present on every HTML page. Set a default tag by specifying the tag's module, followed by the tilde character (~) and the properties of the module you wish to set, as specified in [EMML 1.1](../../2.2.0/rhoelements/EMMLOverview#emml-11-the-current-standard). If the meta tag is present in both the configuration and a loaded page, the page will take priority. Only persistent tags can be set logically in the configuration. Tag persistence is covered in the 'additional information' section in the help file.<br>

**Configuration Identifier**: DEFAULTMETATAG<br>
**Possible Values**: [Module]~[Contents expressed in EMML1.1]<br>
**Platforms**: Android, iOS, WM/CE<br>






##DeviceKeys

####About DeviceKeys

* **DeviceKey settings are applied globally on the device**; they're not contained to a single application. 
* **Once set, DeviceKey settings persist until reset by a warm boot**.

[Read more about the interaction between FunctionKeysCapturable and EnableFunctionKey_X](#_fnbehavior). <br>

###EnableApplicationKey_X
* **Requires a preload of the KeyCapture module**.
* **Applies to Windows Mobile and Windows CE only; disabled by default**. 
* **Application-key mapping is device-specific; behavior may vary from one device to another.** 

Specifies which WM/CE Application keys (numbered A1 to A16) should be enabled (all are disabled by default). For each key to be enabled, define a tag using `EnableApplicationKey_X`, replacing the 'X' with the key being enabled. For example, to enable key A5, your tag will include `EnableApplicationKey_A5` as below. See the [sample Config.xml file](#configxml-file-format) for correct branch placement. 

**Configuration Identifier**: Not Configurable<br>
**Possible Values**: 0 - Disabled, 1 - Enabled<br>
**Platforms**: Windows Mobile/CE<br>

**Sample XML code**:
    :::xml
    <DeviceKeys>
      ...
      <EnableApplicationKey_A5 value="1"/>
      ...
    </DeviceKeys>

###EnableBacklightSlider
**Applies to Zebra's [MC2100 mobile computer](https://www.zebra.com/us/en/products/mobile-computers/handheld/mc2100.html) only**.

Controls whether the backlight slider is available using the Orange+F2 key combination on the [MC2100](https://www.zebra.com/us/en/products/mobile-computers/handheld/mc2100.html). This setting is not application specific; it will be applied globally on the device.<br>

**Configuration Identifier**: ENABLEBACKLIGHTSLIDER<br>
**Possible Values**: 0 - Disabled, 1 - Enabled<br>
**Platforms**: Windows CE<br>

###EnableCtrlKey_X
Specifies which control-key combinations (copy, paste, etc.) should be enabled. **All are disabled on Windows CE by default**. 

To enable a control-key combination, define a tag using `EnableCtrlKey_X`, replacing the 'X' with the key being enabled. For example, to enable copying with control-C, your tag will include `EnableCtrlKey_C` as below. See the [sample Config.xml file](#configxml-file-format) for correct branch placement.

**Configuration Identifier**: Not Configurable<br>
**Possible Values**: 0 - Disabled, 1 - Enabled<br>
**Platforms**: Android, iOS, WM/CE<br>

    :::xml
    <DeviceKeys>
    ...
      <EnableCtrlKey_C     value="0"/>
    ...
    </DeviceKeys>


###EnableFunctionKey_X
**Requires a preload of the KeyCapture module**.

This setting is used to specify which Function keys (F1 to F24) should be enabled (all Function keys are disabled by default). For each key to be enabled, define a tag using `EnableFunctionKey_X`, replacing the 'X' with the key number being enabled. For example, to enable F1, your tag will include `EnableFunctionKey_F1` as below. See the [sample Config.xml file](#configxml-file-format) for correct branch placement. 

**Configuration Identifier**: ENABLEFUNCTIONKEY_FX<br>
**Possible Values**: 0 - Disabled, 1 - Enabled<br>
**Platforms**: Android, iOS, WM/CE<br>

**Sample XML code**:

    :::xml
      <DeviceKeys>
        ...
        <EnableFunctionKey_F1 value="1"/>
        ...
      </DeviceKeys>

####Device-specific notes
* **On the Enterprise Tablet, this tag can be used to enable the 'P' keys**. For example, if the sample code above were run on an Enterprise Tablet, it would enable the 'P1' key.
* This setting **on Windows Mobile and Windows CE** is applied globally to the device and can be reset with a warm boot. 
* **On the Zebra MC40**, F1 is mapped to the volume-down button, F2 to the volume-up button and F3 to the search button.

[Read more about the interaction between FunctionKeysCapturable and EnableFunctionKey_X](#_fnbehavior). <br>

###EnableVolumeSlider
**Applies to Zebra's [MC2100 mobile computer](https://www.zebra.com/us/en/products/mobile-computers/handheld/mc2100.html) only**.

Controls whether the speaker volume slider is available using the Orange+F1 key combination on the [MC2100](https://www.zebra.com/us/en/products/mobile-computers/handheld/mc2100.html). **This setting is not application specific; it will be applied globally on the device**.<br>

**Configuration Identifier**: ENABLEVOLUMESLIDER<br>
**Possible Values**: 0 - Disabled, 1 - Enabled<br>
**Platforms**: Windows CE<br>

##FileLocations
###RegExFile
**Applies only to Windows Mobile/CE**.

Defines the location of the XML file that contains the conversions to be used for backward compatibility with EMML 1.0.<br>

**Configuration Identifier**: REGEXFILE<br>
**Possible Values**: Fully qualified path to file defining the regular expressions (case sensitive)<br>
**Platforms**: Windows Mobile/CE<br>

###FunctionKeysCapturable
**Applies to Windows Mobile and Windows CE only; disabled by default**. 

Determines behavior of Function keys on Windows Mobile and Windows CE devices. When enabled, F-keys on WM/CE devices are capturable using the [Key Capture API](/api/keycapture). When disabled, keys revert to the device's default behavior. **This setting is not specific to an application. When enabled, settings are applied globally to the device**. 

**Configuration Identifier**: FUNCTIONKEYSCAPTURABLE<br>
**Possible Values**: 0 - 'F keys' not capturable, 1 - 'F keys' capturable<br>
**Platforms**: Windows Mobile/CE<br>

###PluginFile
Specifies location of the plug-in file (a .DLL on the device), which facilitates mapping between RhoElements modules. **Not applicable to the Enterprise Tablet**.<br>

**Configuration Identifier**: 
PLUGINFILE<br>
**Possible Values**: 
Fully qualified path to file defining the plugins (case sensitive)<br>
**Platforms**: 
Android, iOS, WM/CE<br>

##General
###Name
Stores the name of the application.<br>

**Configuration Identifier**: Not Configurable<br>
**Possible Values**: ASCII text<br>
**Platforms**: Android, iOS, WM/CE<br>

###StartPage
Defines the start page of a RhoElements application, displayed at launch. This should be a local file to avoid connectivity issues on startup.<br>

**Configuration Identifier**: STARTPAGE<br>
**Possible Values**: Fully qualified path to start page (case sensitive)<br>
**Platforms**: Android, iOS, WM/CE<br>

###UseRegularExpressions
**Applies only to apps for Windows Mobile/CE devices built with RhoMobile Suite 2.2 or higher that need backward compatibility with PocketBrowser**.<br>

Regular Expressions are used to maintain backward compatibility with PocketBrowser syntax for controlling device capabilities. If backward compatibility is not required, regular expressions can safely be disabled, possibly improving app performance. 

**Configuration Identifier**: USEREGULAREXPRESSIONS<br>
**Possible Values**: 0 - Do Not Use Regular Expressions, 1 - Use Regular Expressions<br>
**Platforms**: ###FunctionKeysCapturable
**Applies to Windows Mobile and Windows CE only; disabled by default**. 

Determines behavior of Function keys on Windows Mobile and Windows CE devices. When enabled, F-keys on WM/CE devices are capturable using the [Key Capture API](/api/keycapture). When disabled, keys revert to the device's default behavior. **This setting is not specific to an application. When enabled, settings are applied globally to the device**. 

**Configuration Identifier**: FUNCTIONKEYSCAPTURABLE<br>
**Possible Values**: 0 - 'F keys' not capturable, 1 - 'F keys' capturable<br>
**Platforms**: Windows Mobile/CE<br>
<br>

##Geolocation
###GeolocationEnabled
Controls HTML5 Geolocation. When enabled on a device that supports geolocation and is in range of a GPS network, the geolocation data is returned to the defined JavaScript callback. When disabled the defined JavaScript error callback is called, notifying the app that the permission to using Geolocation is disabled.<br>

**Configuration Identifier**: Not Configurable<br>
**Possible Values**: 0 - Disabled, 1 - Enabled<br>
**Platforms**: Android, iOS, WM/CE<br>

##GUI
###BatteryRefresh
Specifies the refresh rate of the battery display. See the [Battery API](/api/battery) for more information. **Not applicable to the Enterprise Tablet**. [More info](#_batteryRefresh).<br>

**Configuration Identifier**: BATTERYREFRESH<br>
**Possible Values**: Refresh rate in milliseconds<br>
**Platforms**: Android, iOS, WM/CE<br>

###HourglassEnabled
Controls whether the [RhoElements Hourglass](/v/2.2/rhoelements/hourglass) icon will be displayed while navigating between pages (enabled by default)

**Configuration Identifier**: HOURGLASSENABLED<br>
**Possible Values**: 0 - Disabled, 1 - Enabled<br>
**Platforms**: Android, iOS, WM/CE<br>

###HourglassLeft
Controls the horizontal position of the [RhoElements Hourglass](/v/2.2/rhoelements/hourglass) icon, which is displayed by default while navigating between pages. If not specified, the hourglass will appear at the center of the screen.<br>

**Configuration Identifier**: HOURGLASSLEFT<br>
**Possible Values**: Horizontal position, in pixels<br>
**Platforms**: Android, iOS, WM/CE<br>

###HourglassTop
Controls the vertical position of the [RhoElements Hourglass](/v/2.2/rhoelements/hourglass) icon, which is displayed by default while navigating between pages. If not specified, the hourglass will appear at the center of the screen.<br>

**Configuration Identifier**: HOURGLASSTOP<br>
**Possible Values**: Vertical position, in pixels<br>
**Platforms**: Android, iOS, WM/CE<br>

###SignalRefresh
Specifies the refresh rate of the signal display. See the [Signal API](/api/signalindicators) for more information.<br>

**Configuration Identifier**: SIGNALREFRESH<br>
**Possible Values**: Refresh rate in milliseconds<br>
**Platforms**: Android, iOS, WM/CE<br>

##HTMLStyles
###CaretWidth
**Applies only to Webkit on Windows Mobile or Windows CE**.

Specifies the width (in pixels) of the textbox / text-area caret. If unspecified, defaults to '1'.<br>

**Configuration Identifier**: CARETWIDTH<br>
**Possible Values**: Integer values from 1 to 5<br>
**Platforms**: Android, iOS, WM/CE<br>

###FontDirectory
Specifies the font directory containing truetype fonts. The default font directory for all Zebra WM/CE devices is `\Windows`. **Not applicable to the Enterprise Tablet**.

**Configuration Identifier**: FONTDIRECTORY<br>
**Possible Values**: \Windows<br>
**Platforms**: Android, iOS, WM/CE<br>

###FontFamily
Specifies the default font when rendering text in web pages. The specified font should be a TrueType font present on the device. On Windows, the default font has been set to 'Tahoma', which is present on all Zebra WM/CE devices. On the Enterprise Tablet the default is font Droid Sans Fallback. 

* Tahoma has no italic or oblique variants
* On WM/CE, specified font must be stored in `\Windows`
* On Enterprise Tablet, specified font must be stored in `/system/fonts`

**Configuration Identifier**: FONTFAMILY<br>
**Possible Values**: Font name<br>
**Platforms**: Android, iOS, WM/CE<br>

###UseNativeFonts
**Applies to Windows Mobile and Windows CE only**. 

Controls which fonts will be used. When set to '0' (default) the FreeType library will be used as on apps built with RMS 2.x. When set to '1' the native font engine on the device is used. **A setting of '1' overrides the 'FontFamily' setting**. 

* On localized devices from 4.1 and higher, the native font engine will be used by default.
* The FreeType library cannot render localized characters such as Asian and some accented European characters. 
* Some early BSPs of CE7 do not support the native font render. 
* The log file displays the font engine in use on launch. 

NOTE: This configuration element is currently unavailable on MC92, VC70 or WT41N0 devices.<br>

**Configuration Identifier**: USENATIVEFONTS<br>
**Possible Values**: 0 - Use FontFamily Setting, 1 - Use FreeType font library<br>
**Platforms**: ###FunctionKeysCapturable
**Applies to Windows Mobile and Windows CE only; disabled by default**. 

Determines behavior of Function keys on Windows Mobile and Windows CE devices. When enabled, F-keys on WM/CE devices are capturable using the [Key Capture API](/api/keycapture). When disabled, keys revert to the device's default behavior. **This setting is not specific to an application. When enabled, settings are applied globally to the device**. 

**Configuration Identifier**: FUNCTIONKEYSCAPTURABLE<br>
**Possible Values**: 0 - 'F keys' not capturable, 1 - 'F keys' capturable<br>
**Platforms**: Windows Mobile/CE<br>
<br>

##HTTP_Proxy
###HTTP_Proxy
**Applies only to the Zebra WebKit engine.**

Specifies the URL and port number for the HTTP Proxy. For Internet Explorer, proxy settings are picked up from the Windows connection manager. Leave this field blank if no proxy is to be used. <br>

**Configuration Identifier**: HTTPPROXY<br>
**Possible Values**: URL:PortNo<br>
**Platforms**: Android, iOS, WM/CE<br>

###HTTPS_Proxy
**Applies only to the Zebra WebKit engine.**

Specifies the HTTPS Proxy settings. For Internet Explorer, proxy settings are picked up from the Windows connection manager. Leave this field blank if no proxy is to be used. <br>

**Configuration Identifier**: N/A<br>
**Possible Values**: URL:PortNo<br>
**Platforms**: Android, iOS, WM/CE<br>

###No_Proxy
**Applies only to the Zebra WebKit engine.**

Used to specify sites to be accessed directly rather than through a proxy. Accepts a comma-separated list of host names, domain names (beginning with a dot), IP addresses, or CIDR-format IP network addresses. Examples: myhost, .mydomain.com, 192.168.1.1 and 192.168.0.0/24.<br>

**Configuration Identifier**: NOPROXY<br>
**Possible Values**: Comma-separated list of direct-access addresses<br>
**Platforms**: Android, iOS, WM/CE<br>

##Logger
###LogError
Controls logging of error messages generated by RhoElements. If set to 1, it enables error-level logging only (can be overridden by LogWarning).<br>

**Configuration Identifier**: LOGERROR<br>
**Possible Values**: 0 - Disabled, 1 - Enabled<br>
**Platforms**: Android, iOS, WM/CE<br>

###LogInfo
Controls the logging of all information messages generated by RhoElements. If set to 1, **enables Info, Warning and Error** logging (Overrides LogWarning and/or LogError settings; can be overridden by LogUser). <br>

**Configuration Identifier**: LOGINFO<br>
**Possible Values**: 0 - Disabled, 1 - Enabled<br>
**Platforms**: Android, iOS, WM/CE<br>

###LogMaxSize
Specifies the maximum allowable size of the log file, after which no more logs will be saved.<br>

**Configuration Identifier**: 
LOGMAXSIZE<br>
**Possible Values**: 
File size in kilobytes<br>
**Platforms**: Android, iOS, WM/CE<br>

###LogMemory
Controls the logging of memory usage in the system. **Not applicable to the Enterprise Tablet.<br>

**Configuration Identifier**: 
LOGMEMORY<br>
**Possible Values**: 
0 - Disabled, 1 - Enabled<br>
**Platforms**: 
Android, iOS, WM/CE<br>

###LogMemPeriod
Specifies the time interval after which memory logs will be generated. **Not applicable to the Enterprise Tablet**.</td>

**Configuration Identifier**: 
LOGMEMPERIOD<br>
**Possible Values**: 
Time in milliseconds<br>
**Platforms**: 
Android, iOS, WM/CE<br>

###LogPort
Sets the port over which logging data will be sent (ignored for file protocol).<br>
**Configuration Identifier**:
LOGPORT<br>
**Possible Values**:
Any valid HTTP port<br>
**Platforms**: 
Android, iOS, WM/CE<br>

###LogProtocol
Sets the protocol over which the logging data will be sent. <br>

**Configuration Identifier**: 
LOGPROTOCOL<br>
**Possible Values**: 
"File" or "HTTP"<br>
**Platforms**:
Android, iOS, WM/CE<br>

###LogURI
Specifies the URL or file name and path to which logged data should be sent.<br>

**Configuration Identifier**:
LOGURI<br>
**Possible Values**:
Any valid URL or fully qualified file name<br>
**Platforms**: 
Android, iOS, WM/CE<br>

###LogUser
Controls logging of User, Info, Warning and Error messages from the user application. **Overrides LogWarning, LogError and/or LogInfo settings**. Data can be logged using the <a href="../api/log">Log API.<br>

**Configuration Identifier**:
LOGUSER<br>
**Possible Values**:
0 - Disabled, 1 - Enabled<br>
**Platforms**: 
Android, iOS, WM/CE<br>

###LogWarning
Controls logging of warning messages generated by RhoElements. If set to 1, **enables warning *and* error messages** (overrides LogError setting; can be overridden by LogInfo).<br>

**Configuration Identifier**: LOGWARNING<br>
**Possible Values**: 0 - Disabled, 1 - Enabled<br>
**Platforms**: Android, iOS, WM/CE<br>

##Navigation
###AcceptLanguage
Specifies the Accept-Language HTTP header that will be sent from the client. For details, see the [RFQ documentation](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html). <br>

**Configuration Identifier**: ACCEPTLANGUAGE<br>
**Possible Values**: Comma-separated lists of languages and quality values. The two lists are separated by a semicolon<br>
**Platforms**: Android, iOS, WM/CE<br>

###BadLinkURI
Specifies the 'badlink' URI file to be displayed when one of the following occurs:<br>

* **An error occurs when attempting to navigate to a page** (i.e. no network connection)
* **A page times out** (timeout interval is set in NavTimeout)
* **The user presses the stop button**

The browser will automatically append the querystring value "badlink" containing the URL of the page that could not be reached and "stop=true" if the page was loaded because the user pressed the stop button. The page specified in the badlink setting should be an offline file using the `file://` protocol so it's accessible by the browser.<br>

**Configuration Identifier**: BADLINKURI<br>
**Possible Values**: Fully qualified local path to badlink URI file (case sensitive)<br>
**Platforms**: Android, iOS, WM/CE<br>

###Cache
The browser cache size, in whole MBs. **Applies to RhoMobile Suite version 2.2 and higher**.<br>

**Configuration Identifier**: NAVIGATIONCACHE<br>
**Possible Values**: Whole MBs, eg. 5M<br>
**Platforms**: Android, iOS, WM/CE<br>

###CaFile
**Applies to Android and Windows Mobile/CE only. Not supported on iOS**. 

Specifies the location of a file of CA certificates in PEM format. [See openSSL](http://www.openssl.org/docs/ssl/SSL_CTX_load_verify_locations.html) for more information.<br>

**Configuration Identifier**: CAFILE<br>
**Possible Values**: Fully qualified local path (case sensitive)<br>
**Platforms**: Android, WM/CE<br>

###ClientSSLCertificate
Specifies location of the '.p12' formatted certificate file used for client SSL authentication. This setting is used in any [Network API](/api/Network) call that sets up a secured SSL connection requiring client authentication, including get, post, downloadFile and uploadFile. This setting takes effect only if `verifyPeerCertificate` is enabled. If `verifyPeerCertificate` is set to fail and remote server requests the client certificate, connection will fail.<br>

**Configuration Identifier**: CLIENTSSLCERTIFICATE<br>
**Possible Values**: Fully qualified local path. (case sensitive)<br>
**Platforms**: Android<br>

###ClientSSLCertificatePassword
Specifies the password used with a client certificate. This setting takes effect only if `verifyPeerCertificate` is enabled. If `verifyPeerCertificate` is set to fail and remote server requests the client certificate, connection will fail.<br>

**Configuration Identifier**: CLIENTSSLCERTIFICATEPASSWORD<br>
**Possible Values**: Password<br>
**Platforms**: Android<br>

###DisableTLS
Controls whether to request SSLv3 connections instead of TLS. By default, all requests will be sent using TLS. If TLS is not supported, then SSLv3 will be used. The protocol used in both directions for the entire session is determined by the first interaction the client has with the server. To eliminate the possibility of using TLS, set DisableTLS to '1' (true).<br>

**Configuration Identifier**: DISABLETLS<br>
**Possible Values**: 0 - TLS Not Disabled, 1 - TLS Disabled<br>
**Platforms**: Android, iOS, WM/CE<br>

###EnableSSL3
When enabled, SSL 3.0 is used. The Zebra Webkit is shipped with SSL3 disabled by default to protect against <a href="https://www.us-cert.gov/ncas/alerts/TA14-290A">the POODLE attack vulnerability</a>.<br>

**Configuration Identifier**: ENABLESSL3<br>
**Possible Values**: 0 - Disabled, 1 - Enabled<br>
**Platforms**: Android, iOS, WM/CE<br>

###Keepalive
Controls whether HTTP connections will be maintained between requests. **Enabled by default** or is unspecified. When disabled, a connection is closed when its request is complete. Applies to release 5.0 and greater.<br>

**Configuration Identifier**: KEEPALIVE<br>
**Possible Values**: 0 - Disabled, 1 - Enabled<br>
**Platforms**: Android, iOS, WM/CE<br>

###NavTimeout
Defines the amount of time (in milliseconds) the application should wait *to establish communication with the relevant server* (as opposed to waiting for a page to fully load) before displaying the 'bad link' message. If the destination is unreachable, the bad link message might be displayed before the timeout is reached. The navigation timeout will not be invoked when navigating to an application's start page. The recommended best practice is to store the first page locally to avoid connectivity issues at startup. The app can then redirect to an online page if desired.<br>

**Configuration Identifier**: NAVTIMEOUT<br>
**Possible Values**: Timeout in Milliseconds (max, value=45000)<br>
**Platforms**: Android, iOS, WM/CE<br>

###NetworkCookieDatabase
Specifies the location of the database to hold persistent cookies, if desired. If the specified file does not exist, one will be created. Persistent cookies will be loaded from this file and saved back to it when RhoElements exits. If the file is read-only, it will not be overwritten. If not specified, cookies will not persist.<br>

**Configuration Identifier**: NETWORKCOOKIEDATABASE<br>
**Possible Values**: Fully qualified local path (case sensitive)<br>
**Platforms**: Android, iOS, WM/CE<br>

###ViewportEnabled
Controls viewport meta tag processing (enabled by default).<br>

**Configuration Identifier**: VIEWPORTENABLED<br>
**Possible Values**: 0 - Disabled, 1 - Enabled<br>
**Platforms**: Android, iOS, WM/CE<br>

###ViewportWidth
Sets the default viewport width for pages that do not have a viewport meta tag. If not specified, uses 1:1 scaling.<br>

**Configuration Identifier**: VIEWPORTWIDTH<br>
**Possible Values**: Number<br>
**Platforms**: Android, iOS, WM/CE<br>

###VerifyPeerCertificate
Controls whether server certificates will be verified against the internal certificates. **Enabled by default**. Useful for debugging, a value of 0 (disabled) is equivalent to automatically clicking 'OK' on a web browser's dialog when requesting approval for an untrusted certificate.

NOTE: It is strongly recommended that this feature be <u>enabled for deployment</u>. <br>

**Configuration Identifier**: VERIFYPEERCERTIFICATE<br>
**Possible Values**: 0 - disabled (do not verify peer certificates), 1 - enabled (verify peer certificates)<br>
**Platforms**: Android, iOS, WM/CE<br>

###UserAgent
Stores information about the device's operating environment. Can be used to spoof the device to a web server, for example to view content designed for the desktop on the mobile screen. When visiting a web server, the WebKit browser will report its User-Agent header as the value specified. Use the following substitution variables:<br>

* %p - Platform name ("Windows CE " + version number)
* %w - WebKit version number
* %e - Zebra WebKit version number

In RhoElements 2.1 and higher, the default value was changed to work out of the box with a greater number of server configurations. Prior to RhoElements 2.1 the default user agent was "Mozilla/5.0, AppleWebKit (KHTML, i.e. Gecko), MotorolaWebKit, Safari."<br>

**Configuration Identifier**: USERAGENT<br>
**Possible Values**: String<br>
**Platforms**: Android, iOS, WM/CE<br>

##NPAPI
###NPAPIDirectory
Not applicable to the Enterprise Tablet:<br>Path to an existing directory containing the NPAPI Plugins.<br>

**Configuration Identifier**: NPAPIDIRECTORY<br>
**Possible Values**: Fully qualified local path (case sensitive)<br>
**Platforms**: Android, iOS, WM/CE<br>

###Preloads\\PreloadLegacyActiveX
**Applies to Windows Mobile / CE with the Zebra Webkit only.**.

Determines whether to preload the ActiveX object in WebKit. Use this for backward compatibility with code written in PocketBrowser that used the ActiveXObject.<br>

**Configuration Identifier**: PRELOADLEGACYACTIVEX<br>
**Possible Values**: 0 - Do Not Preload, 1 - Preload<br>
**Platforms**: WM/CE Webkit<br>

###Preloads\\PreloadLegacyAirBeam
Determines whether to preload the NPAPI plugin to mimic the AirBeam ActiveX object in WebKit. **Not applicable to the Enterprise Tablet**. 

**Configuration Identifier**: PRELOADLEGACYAIRBEAM<br>
**Possible Values**: 0 - Do Not Preload, 1 - Preload<br>
**Platforms**: Android, iOS, WM/CE<br>

###Preloads\\PreloadLegacyAPD
Determines whether to preload the NPAPI plugin to mimic the APD ActiveX object in WebKit.<br>

**Configuration Identifier**: PRELOADLEGACYAPD<br>
**Possible Values**: 0 - Do Not Preload, 1 - Preload<br>
**Platforms**: Android, iOS, WM/CE<br>

###Preloads\\PreloadLegacyGeneric
Determines whether to preload the NPAPI plug-in to mimic the Generic ActiveX object in WebKit. On the Enterprise Tablet this plugin is automatically loaded when the JSObjects plugin is preloaded.<br>

**Configuration Identifier**: PRELOADLEGACYGENERIC<br>
**Possible Values**: 0 - Do Not Preload, 1 - Preload<br>
**Platforms**: Android, iOS, WM/CE<br>

###Preloads\\PreloadLegacyODAX
**Does not apply to the Enterprise Tablet.** 

Determines whether to preload the NPAPI plugin to mimic the ODAX ActiveX object in WebKit.<br>

**Configuration Identifier**: PRELOADLEGACYODAX<br>
**Possible Values**: 0 - Do Not Preload, 1 - Preload<br>
**Platforms**: Android, iOS, WM/CE<br>

###Preloads\\PreloadLegacyNoSIP
Determines whether to preload the NPAPI plug-in to mimic the NoSIP ActiveX object in WebKit.<br>

**Configuration Identifier**: PRELOADLEGACYNOSIP<br>
**Possible Values**: 0 - Do Not Preload, 1 - Preload<br>
**Platforms**: Android, iOS, WM/CE<br>


###Preloads\\PreloadJSObjects
Determines whether to preload the NPAPI plugin to provide native JavaScript objects for each of the modules<br>

**Configuration Identifier**: PRELOADLEGACYJSOBJECTS<br>
**Possible Values**: 0 - Do Not Preload, 1 - Preload<br>
**Platforms**: Android, iOS, WM/CE<br>

##Preloads
###Preload
Defines plug-ins to be pre-loaded with RhoElements rather than loading as needed by a program function. Pre-loading prevents application lag when a program function is called for the first time. For example, when `Barcode.enable` is called by an app, a slight lag will be seen as the `Barcode` DLL loads into memory. Specify a Preload tag for each module to be loaded when RhoElements starts up. 

* While multiple modules may be defined in the same DLL, **list all pre-loaded modules for maximum benefit**.

* For memory-constrained devices, **pre-load all required modules to prevent an out-of-memory condition during execution**. 

* **Plug-ins are integral to RhoElements on the Enterprise Tablet**, and therefore do not apply.

**Configuration Identifier**: PRELOAD<br>
**Possible Values**: 0 - Do Not Preload, 1 - Preload<br>
**Platforms**: Android, iOS, WM/CE<br>

##Scanner
###DisableScannerDuringNavigation
**Applies to RhoMobile 2.2 and higher**.

Controls whether scanner will be automatically disabled when navigating away from a page on which it was enabled. Override this default behavior by setting this option to '0'. Once enabled (either through meta tags, JavaScript or Ruby), the scanner will remain enabled in the foreground application until manually disabled.<br>

**Configuration Identifier**: DISABLESCANNERDURINGNAV<br>
**Possible Values**: 0 - Scanner remains enabled during page navigation, 1 - Scanner disabled during page navigation<br>
**Platforms**: Android, iOS, WM/CE<br>

##Screen
###FullScreen
Forces RhoElements to display in full screen mode, hiding the OS from the user unless specifically minimized using the [Application API](../api/Application#minimize). For Windows Mobile devices that include a custom Zebra user interface, access is provided to the status bar at the top of the screen.<br>

**Configuration Identifier**:
FULLSCREEN<br>
**Possible Values**: 
0 - Disabled, 1 - Enabled<br>
**Platforms**:
Android, iOS, WM/CE<br>

###PageZoom
Sets the zoom factor of the page. Default zoom value is 1.0 (if unspecified). On Android, zero and negative values are not supported. On Windows, zoom value less than 1.0 reverts to 1.0 since lower values would not be readable. [More info](#_pageZoom)<br>

**Configuration Identifier**: 
PAGEZOOM<br>
**Possible Values**: 
Zoom factor of the page<br>
**Platforms**: 
Android, iOS, WM/CE<br>

###ShowLicenseConfirmation
Controls the display of the "licensed to..." dialog at launch (on licensed devices only). Has no effect on unlicensed devices.<br>

**Configuration Identifier**: 
SHOWLICENSECONFIRMATION<br>
**Possible Values**:
0 - Do not show license confirmation, 1 - Show license confirmation<br>
**Platforms**: WM/CE<br>


##ScreenOrientation
###AutoRotate
Acts as a rotation lock. When AutoRotate is disabled, screen will remain in a fixed position regardless of device orientation. When enabled, screen will automatically adjust orientation as the device is rotated. <br>

**Configuration Identifier**: AUTOROTATE<br>
**Possible Values**: 0 - Disabled, 1 - Enabled<br>
**Platforms**: Android, iOS, WM/CE<br>


##Scrolling
###ScrollTechnique
Specifies the technique used to scroll the viewport:<br/>

* **FingerScroll:** Permits scrolling around a page with finger swiping<br>
* **Scrollbars:** Scrollbars will be presented when the page is too large to fit the viewport<br>
* **None:** No scrollbars will be displayed and the page will not respond to finger swipes<br>

NOTE: FingerScroll may interfere with drawing on a Canvas element.<br>

**Configuration Identifier**: SCROLLTECHNIQUE<br>
**Possible Values**: FingerScroll, Scrollbars, None<br>
**Platforms**: iOS, WM/CE<br>

##SIP
###EnableSIP
**Applies to Android only**.

Controls whether soft input panel (on-screen keyboard) will appear. On Windows Mobile/CE, this feature can be mimicked by manipulating the top and left position parameters of the SIP module to position the SIP off the screen, thereby 'disabling' its use.<br>

**Configuration Identifier**: Not Configurable<br>
**Possible Values**: 0 - Disabled, 1 - Enabled<br>
**Platforms**: Android<br>

###ResizeOnSIP
**Applies to Windows Mobile only. Requires SIP module preload**. 

Controls window resizing when the soft input panel (on-screen keyboard) is displayed. When enabled, the browser window will resize to accommodate the SIP, when displayed. If the SIP has been moved to the top half of the screen, the browser window will reduce in size from the top. 

* Not compatible with Windows CE
* Not compatible with Finger Scrolling
* The SIP always appears at the bottom of the screen

**Configuration Identifier**: RESIZEONSIP<br>
**Possible Values**: 0 - Disabled, 1 - Enabled<br>
**Platforms**: Windows Mobile<br>

##Sound
###DecodeDuration
Controls the duration of the device beeper sound when a barcode is scanned.<br>

**Configuration Identifier**: DECODEDURATION<br>
**Possible Values**: Milliseconds<br>
**Platforms**: Android, iOS, WM/CE<br>

###DecodeFrequency
Controls the frequency of the device beeper sound when a barcode is successfully decoded. This value (in hex) must be a frequency within the range of the device beeper.<br>

**Configuration Identifier**: DECODEFREQUENCY<br>
**Possible Values**: 0 to 0xFFFF<br>
**Platforms**: Android, iOS, WM/CE<br>

###DecodeVolume
Controls the volume of the device beeper when a barcode is scanned.<br>

**Configuration Identifier**: DECODEVOLUME<br>
**Possible Values**: 0 - off, 1 - 5 (lowest to loudest)<br>
**Platforms**: Android, iOS, WM/CE<br>

###ImagerCaptureWav
Specifies a .wav file to be played when the Imager captures an image.<br>

**Configuration Identifier**: IMAGERCAPTUREWAV<br>
**Possible Values**: Fully qualified local path to .wav file (case sensitive)<br>
**Platforms**: Android, iOS, WM/CE<br>


###InvalidDecodeFrequency
Controls the frequency of the device beeper sound when a barcode is scanned but not successfully decoded. This value (in hex) must be a frequency within the range of the device beeper. **Not applicable to the Enterprise Tablet**.<br>

**Configuration Identifier**: INVALIDDECODEFREQUENCY<br>
**Possible Values**: 0 to 0xFFFF<br>
**Platforms**: Android, iOS, WM/CE<br>

###ScanDecodeWav
Specifies a .wav file to be played when the scanner successfully decodes a barcode. **Overrides all scanner beeper settings**.<br>

**Configuration Identifier**: SCANDECODEWAV<br>
**Possible Values**: Fully qualified local path to .wav file (case sensitive)<br>
**Platforms**: Android, iOS, WM/CE<br>

###ScanInvalidWav
Specifies a .wav file to be played when a barcode is scanned but not successfully decoded. This setting overrides the scanner beeper. **Overrides all scanner beeper settings. Not applicable to the Enterprise Tablet**.<br>

**Configuration Identifier**: SCANINVALIDWAV<br>
**Possible Values**: Fully qualified local path to .wav file (case sensitive)<br>
**Platforms**: Android, iOS, WM/CE<br>


##System
###LowBatteryScan
**Applies to Windows Mobile and Windows CE only**. 

Controls whether the scanner can be used when battery charge level is low. Set to '0' to disable scanning with low battery and '1' to enable. **Can be overridden by calling `Barcode.enable`**.<br>

**Configuration Identifier**: LOWBATTERYSCAN<br>
**Possible Values**: 0 - Disabled, 1 - Enabled<br>
**Platforms**: Windows Mobile/CE<br>

##TabInstance
###NewTabPhysicalMemLimit
Controls whether a new Tab will be created using the [NativeTabbar.create API](../api/NativeTabbar#mcreate) when physical memory percentage hits a specific threshold. For example, if set to 80, no new tabs will be created once the physical memory usage on the device reaches 80 percent or more. Once the defined limit is reached, the NativeTabbar.create API callback will contain `tabEvent` = `onTabNewError`.  

**Configuration Identifier**: NEWTABPHYSICALMEMLIMIT<br>
**Possible Values**: 0-100 (100 = no limit)<br>
**Platforms**: Android, iOS, WM/CE<br>

###NewTabVirtualMemLimit
Controls whether a new Tab will be created using the [NativeTabbar.create API](../api/NativeTabbar#mcreate) when a virtual memory usage percentage is hit. For example, if set to 80, no new tabs will be created once the device virtual memory usage reaches 80 percent or more. Once the defined limit is reached, the NativeTabbar.create API callback will contain `tabEvent` = `onTabNewError`. 

**Configuration Identifier**: NEWTABVIRTUALMEMLIMIT<br>
**Possible Values**: 0-100 (100 = no limit)<br>
**Platforms**: Android, iOS, WM/CE<br>

##UserData
Used to persist data when using Read/WriteUserSetting.<br>

**Configuration Identifier**: N/A<br>
**Possible Values**: Any valid user setting<br>
**Platforms**: Android, iOS, WM/CE<br>

##VoidConnection
###HostURL
Used to specify the URL to which your application will connect. Supports IP addresses, host names and specific ports (when appended to URL with a colon. If no port is specified, default=80).<br>

**Configuration Identifier**: HostURL<br>
**Possible Values**: Fully qualified host name or IP address, with or without port number<br>
**Platforms**: Android, iOS, WM/CE<br>

###Message
Use to specify a custom message to be displayed in a pop-up window.<br>

**Configuration Identifier**: Message<br>
**Possible Values**: Alpha-numeric text<br>
**Platforms**: Android, iOS, WM/CE<br>

###PollInterval
Defines the amount of time (in milliseconds) the application should pause before subsequently checking for a connection to the URL specified in 'HostURL.' The minimum value is 5000; lower values will revert to 5000. The value in 'Timeout' should be a multiple of this number.<br>

NOTE: This parameter is not testable. 

**Configuration Identifier**: PollInterval<br>
**Possible Values**: PollInterval<br>
**Platforms**: Android, iOS, WM/CE<br>

###Timeout
Defines the amount of time (in milliseconds) the application should wait for a connection to the URL specified in 'HostURL' before displaying the 'bad link' message. The minimum value is 30000; lower values will revert to 30000. Value should be a multiple of the value set in PollInterval.<br>

**Configuration Identifier**: Timeout<br>
**Possible Values**: Whole number greater than 30000 (ms)<br>
**Platforms**: Android, iOS, WM/CE<br>

###TrackConnection
Controls connection tracking. When enabled, will display an alert whenever a connection with the URL defined in "HostURL" element is lost, removed when connection is restored, and changed to 'bad link' message if timeout is reached. Alert is modal on Android, and prevents any UI actions while displayed. Although alert is non-modal on Windows, interaction with the background app is not recommended while alert is being displayed.<br>

**Configuration Identifier**: TrackConnection<br>
**Possible Values**: 0 - disabled, 1- enabled<br>
**Platforms**: Android, iOS, WM/CE<br>

###PollInterval
Defines the amount of time (in milliseconds) the application should pause before subsequently checking for a connection to the URL specified in 'HostURL.' The minimum value is 5000; lower values will revert to 5000. The value in 'Timeout' should be a multiple of this number.<br>

NOTE: This parameter is not testable. 

**Configuration Identifier**: PollInterval<br>
**Possible Values**: PollInterval<br>
**Platforms**: Android, iOS, WM/CE<br>

##WebDB
###WebStorageDBPath
Sets the path to an existing directory for storage of web storage databases.<br>

**Configuration Identifier**: WEBSTORAGEDBPATH<br>
**Possible Values**: Fully qualified local path (case sensitive)<br>
**Platforms**: Windows Mobile / CE Webkit<br>

###WebSQLDBQuota
Sets the maximum per-database quota for Web SQL databases.<br>

**Configuration Identifier**: WEBSQLDBQUOTA<br>
**Possible Values**: Size in bytes<br>
**Platforms**: WM/CE Webkit<br>

###WebSQLDBPath
Path to an existing directory to store Web SQL databases<br>

**Configuration Identifier**: WEBSQLDBPATH<br>
**Possible Values**: Fully qualified local path (case sensitive)<br>
**Platforms**: WM/CE Webkit<br>

##WebServer
###Enabled
Determines whether a web server will be running locally on the device to service the application. When multiple Webview applications are deployed, all can run from a single embedded server or use discrete servers, each running on a different port.<br>

**Configuration Identifier**: WEBSENABLED<br>
**Possible Values**: 0 - Disabled, 1 - Enabled<br>
**Platforms**: Android, iOS, WM/CE<br>

###Port
Specifies the port number of the web server running locally on the device (default= 8080)<br>

**Configuration Identifier**: WEBSPORT<br>
**Possible Values**: 8080<br>
**Platforms**: Android, iOS, WM/CE<br>

###Public
Controls access to the local web server from an external device. Generally used only for debugging. 

NOTE: Enabling this feature in a production deployment is a potential security risk. <br><u>It is highly recommended that this feature be disabled before deployment</u>. <br>

**Configuration Identifier**: WEBSPUBLIC<br>
**Possible Values**: 0 - Disabled, 1 - Enabled<br>
**Platforms**: Android, iOS, WM/CE<br>

###WebFolder
Specifies the folder on the device in which the web application and its initial page are stored. By default, the initial page is 'index.html' unless another page is requested.<br>

**Configuration Identifier**: WEBFOLDER<br>
**Possible Values**: Fully qualified path to folder containing web application (case sensitive)<br>
**Platforms**: Android, iOS, WM/CE<br>

###Vulnerability Alert

>A vulnerability has been discovered that affects applications using SSL3, which is part of the Zebra Webkit (Ekioh 3.1.1). **This applies only to apps for Windows Mobile and Windows CE built with RMS 5.1 or higher**. Known as POODLE (Padded Oracle On Downgraded Legacy Encryption), the vulnerability [as described by the U.S. Comuputer Emergency Readiness Team](https://www.us-cert.gov/ncas/alerts/TA14-290A) would allow an attacker to exploit the means by which SSL 3.0 handles block cipher mode padding to decrypt and **extract information from inside an encrypted transaction**.<br><br> To protect against this, **Zebra now ships the Zebra Webkit with SSL3 disabled by default**. <br><br>

## Programming Notes
### <a name="_caseSensitivity">&dagger;</a>Case Sensitivity
The operating systems of some devices have case sensitive file systems. Therefore it is good practice to always keep URL values in the Config.xml file case identical to the names of the actual files.

### <a name="_pageZoom">*</a>Page Zoom Configuration
Sometimes, while navigating from any page to any other page, the actual page zoom setting reflects after few milli seconds delay. This doesn't happens everytime.

Setting page zoom property on page load event does not reflect the set value for the Application start page for the first time. Users are advised to set the page zoom property with a minimum of 1 second delay on page load.

Setting page zoom property on page load will reflect only for that page.

### <a name="_batteryRefresh">*</a>Battery Polling on the Enterprise Tablet
On the Enterprise Tablet the battery notification is asynchronous. For this reason, BatteryRefresh is not supported on the Enterprise Tablet. The effect of this is that a batteryEvent is fired only when the battery level changes. This has been done to save battery power compared to polling.

### <a name="_fnbehavior"></a>Interaction between FunctionKeysCapturable and EnableFunctionKey configuration settings
On Windows Mobile and Windows CE devices full control is given to the developer over how their application handles function keys. Because of the limitations of the operating system <b>any settings applied will persist until the device is next warm booted</b>. Which function keys have default operating system behavior will vary from device to device, e.g. on the MC75a F3 and F4 represent the red and green phone keys and on many devices the volume keys are also mapped as Function keys. Not all function keys will have default operating system behavior.

<b><i>Unblocking function keys may expose the underlying operating system, particularly the red and green phone keys will give access to the start menu and programs.</i></b>

The table below shows the behavior of RhoElements when Function Keys are pressed given the possible configuration settings:

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

### HTTP Authentication Limitations
On Windows Mobile/CE with the Zebra Webkit, only "Basic" and "Digest" forms of the Authenticate header are supported. Therefore, usernames and passwords are passed over the network as clear text on those platforms. Keep this in mind when considering app security. For more information, please refer to the IETF article on [HTTP Authentication: Basic and Digest Access Authentication](https://www.ietf.org/rfc/rfc2617.txt). 
