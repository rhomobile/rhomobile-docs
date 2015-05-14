# Runtime Application Configuration
Apart from your source code, there are other important files that control how your application behaves at runtime: `rhoconfig.txt` and `Config.xml`

## rhoconfig.txt
### What it affects
The values in `rhoconfig.txt` control different aspects of your application, such as what page is loaded when the application starts or the address of the `RhoConnect` synchronization server, while those in `Config.xml` refer to features of the RhoElements runtime itself like what keys can be intercepted by the application or whether to preload modules on startup.

Apart from the settings recognized by the platform, you can add arbitrary values that are specific to your application:

    :::yaml
    # application-specific value
    foo = 'bar'

All values will be accessible at runtime via `Rho::RhoConfig`

    :::ruby
    foo = Rho::RhoConfig.bar
    start_path = Rho::RhoConfig.start_path

You can also check if a configuration property actually exists before accessing it

    :::ruby
    start_path_exists = Rho::RhoConfig.exists?("start_path") # will return true


The `rhoconfig.txt` file generated with a new application contains the following default values, as well as descriptions of each setting:

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
    # 0-trace, 1-info(app level), 3-warnings, 4-errors
    # for production set to 3
    MinSeverity  = 1

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
    #geo_location_inactivity_timeout = 30

    # open rhodes app in full screen mode
    # default 1 for Android up to Rhodes 2.2.5.
    # on all other platforms and on Android from Rhodes > 2.2.5 default 0
    full_screen = 0

    # show top menu on Windows desktop in full screen mode (default is 0=don't show top menu)
    #w32_fullscreen_menu = 1

    # disable the Android page loading progress bar
    disable_loading_indication = 1

    # Port of the local (embedded) HTTP server. This parameter is mainly for debug purposes.
    # If not specified, application will use dynamically selected one.
    # WARNING!!! Remove this parameter before put application to production.
    #local_server_port = 8080

    # show status bar on windows mobile. default 1
    #wm_show_statusbar = 1

    # disable screen rotation (enabled by default) - disable possible for ANDROID and iPhone ONLY
    #disable_screen_rotation = 1

    # disable close app when pressing back on home screen on blackberry
    #bb_disable_closebyback = 0

    # load images in background, this improve reaction speed on user actions, 0 by default
    #bb_loadimages_async = 0

    # set to 0 to reset the bulksync_state and trigger a bulk sync the next time rhodes synchronizes
    #bulksync_state = 1

    # hides forward button and animates back button transition
    jqtouch_mode=1

    splash_screen='zoom'

    use_bb_full_browser=6

    esri_map_url_roadmap: type: string

    ESRI server url with roads map tiles.
        iOS             - supported in esri extension.
        Android      - supported with ESRI map type.
        WM             - supported with WM mapview.
        WP8           - mapping is not supported.

    esri_map_url_satellite: type: string
        ESRI server url with satellite map tiles.
            iOS             - supported in esri extension.
            Android      - supported with ESRI map type.
            WM             - supported with WM mapview.
            WP8           - mapping is not supported.

    OSM_map_url_roadmap: type: string
        OSM server url with road map tiles.
            iOS            - not supported as only Google and ESRI maps are supported.
            Android     - supported with OSM map type.
            WM             - supported with WM mapview.
            WP8           - mapping is not supported.

    disable_loading_indication:type - Bool
        If enabled, blocks loading indication in webview
            Supported only on Android.

### Additional parameters that can be used in rhoconfig.txt

    :::yaml
    # Address and port of proxy server. This settings uses Network module.
    http_proxy_host = 'server'
    http_proxy_port = port

    # Login and password for access to proxy server. Only basic authentication is supported
    http_proxy_login = 'user'
    http_proxy_password = 'password'

## Config.xml
### What it affects
> Note: The Config.xml effects applications that are using Zebra Webkit. However the setting `CAFile` in this file will be used for 4.0 applications using the stock browser.

Runtime configuration of RhoElements is managed through an XML file called Config.xml. This file is *mandatory* for proper RhoElements execution: not every setting has a default and if the configuration file cannot be found, RhoElements will *not* start. An example configuration file is provided as part of the installation and contains sensible defaults, this page explains the meanings of each of the settings and their possible values. The example `Config.xml` file is bundled with the `rhoelements` gem; its location depends on the operating system:

* Windows: `<RhoMobile Suite installation directory>\ruby\lib\ruby\gems\1.9.1\gems\rhoelements-4.0.0\libs\data\Config\Config.xml`

* OS X: `~/.rvm/gems/ruby-1.9.3-p392/gems/rhoelements-4.0.0/libs/data/Config/Config.xml`

### Configuration File Location in a mobile device
The location of the configuration file loaded by RhoElements is dependant on a number of factors:

* When running on the Enterprise Tablet the configuration file is read from `/Android/data/com.motorolasolutions.rhoelements/Config.xml`.
* When running on all other devices RhoElements will attempt to launch the configuration file `Config.xml` located in the folder `Config` off the installation root.
* You can change which configuration file is loaded using the /C: configuration option

For persistant installations, on cold boot the `Config.xml` file is copied from `\Application\RhoElements\Config\Config.xml` to `\Program Files\RhoElements\Config\Config.xml`; bear this in mind if you want your configuration to persist across cold boot. This behavior may be modified by changing `\Application\RhoElements.cpy`.

## Config.xml File Format
The following is an example of a typical configuration file
    :::xml
    <Configuration>
      <DebugButtons>
        <DebugButtonsEnabled VALUE="0" />
      </DebugButtons>
      <Logger>
        <LogProtocol  VALUE="FILE"/>
        <LogPort      VALUE="80"/>
        <LogURI       VALUE="file://\Program Files\RhoElements\Log.txt"/>
        <LogError     VALUE="1"/>
        <LogWarning   VALUE="1"/>
        <LogInfo      VALUE="1"/>
        <LogUser      VALUE="1"/>
        <LogMemory    VALUE="1"/>
        <LogMemPeriod VALUE="5000"/>
        <LogMaxSize   VALUE="10"/>
      </Logger>
      <FileLocations>
        <RegEXFile  VALUE="\Program Files\RhoElements\Config\RegEx.xml"/>
        <PluginFile VALUE="\Program Files\RhoElements\Config\Plugin.xml"/>
      </FileLocations>
      <Screen>
        <FullScreen VALUE="1"/>
      </Screen>
      <WebServer>
        <Enabled   VALUE="1"/>
        <Port      VALUE="8080"/>
        <WebFolder VALUE="\www"/>
        <Public    VALUE="0"/>
      </WebServer>
      <DeviceKeys>
        <FunctionKeysCapturable   VALUE="0"/>
        <EnableFunctionKey_F1     VALUE="0"/>
        <EnableFunctionKey_F2     VALUE="0"/>
        <EnableFunctionKey_F3     VALUE="0"/>
        <EnableFunctionKey_F4     VALUE="0"/>
        <EnableFunctionKey_F5     VALUE="0"/>
        <EnableFunctionKey_F6     VALUE="0"/>
        <EnableFunctionKey_F7     VALUE="0"/>
        <EnableFunctionKey_F8     VALUE="0"/>
        <EnableFunctionKey_F9     VALUE="0"/>
        <EnableFunctionKey_F10    VALUE="0"/>
        <EnableFunctionKey_F11    VALUE="0"/>
        <EnableFunctionKey_F12    VALUE="0"/>
        <EnableApplicationKey_A1  VALUE="0"/>
        <EnableApplicationKey_A2  VALUE="0"/>
        <EnableApplicationKey_A3  VALUE="0"/>
        <EnableApplicationKey_A4  VALUE="0"/>
        <EnableApplicationKey_A5  VALUE="0"/>
        <EnableApplicationKey_A6  VALUE="0"/>
        <EnableApplicationKey_A7  VALUE="0"/>
        <EnableApplicationKey_A8  VALUE="0"/>
      </DeviceKeys>
      <Navigation>
        <NavTimeout VALUE="45000"/>
      </Navigation>
      <ScreenOrientation>
        <AutoRotate VALUE="0"/>
      </ScreenOrientation>
      <TabInstance>
        <NewTabPhysicalMemLimit value="90"/>
        <NewTabVirtualMemLimit value="80"/>
      </TabInstance>
      <Geolocation>
        <GeolocationEnabled VALUE="0"/>
      </Geolocation>
      <UserData>
      </UserData>
      <Applications>
        <Application>
          <General>
            <Name                  VALUE="Menu"/>
            <StartPage             VALUE="file://\Program Files\RhoElements\HTML\Menu.htm" name="Menu"/>
            <UseRegularExpressions VALUE="0"/>
          </General>
          <HTTP_Proxy  VALUE="http://myproxy.com:1050"/>
          <No_Proxy    VALUE="myhost, .mydomain.com, 192.168.1.1,192.168.0.0/24"/>
          <WebDB>
            <WebStorageDBPath VALUE="file://\Program Files\RhoElements"/>
            <WebSQLDBQuota    VALUE="5000000"/>
            <WebSQLDBPath     VALUE="file://\Program Files\RhoElements"/>
          </WebDB>
          <ApplicationCache>
            <ApplicationCachePath   VALUE="file://\Program Files\RhoElements"/>
            <ApplicationCacheQuota  VALUE="5000000"/>
          </ApplicationCache>
          <NPAPI>
            <NPAPIDirectory         VALUE="file://\Program Files\RhoElements\NPAPI\"/>
            <Preloads>
              <PreloadLegacyActiveX VALUE="0"/>
              <PreloadLegacyGeneric VALUE="1"/>
              <PreloadLegacyODAX    VALUE="1"/>
              <PreloadLegacyNoSIP   VALUE="1"/>
              <PreloadLegacyAirBeam VALUE="1"/>
              <PreloadLegacyAPD     VALUE="1"/>
              <PreloadJSObjects     VALUE="1"/>
            </Preloads>
          </NPAPI>
          <Preloads>
            <Preload VALUE="Scanner"/>
            <Preload VALUE="Hourglass"/>
          </Preloads>
          <Scrolling>
            <ScrollTechnique VALUE="FingerScroll"/>
          </Scrolling>
          <Authentication>
            <Username VALUE="user"/>
            <Password VALUE="pass"/>
          </Authentication>
          <HTMLStyles>
            <CaretWidth            VALUE="1" />
            <FontFamily            VALUE="Tahoma" />
            <FontDirectory         VALUE="file://\Windows" />
            <UseNativeFonts        VALUE="0" />
          </HTMLStyles>
          <SIP>
            <ResizeOnSIP  VALUE="0"/>
            <EnableSIP    VALUE="1"/>
          </SIP>
          <System>
            <LowBatteryScan VALUE="0"/>
          </System>
          <Scanner>
            <DisableScannerDuringNavigation VALUE="1"/>
          </Scanner>
          <Sound>
            <DecodeVolume           VALUE="5"/>
            <DecodeFrequency        VALUE="0xBB8"/>
            <InvalidDecodeFrequency VALUE="0x9C4"/>
            <DecodeDuration         VALUE="250"/>
            <ScanDecodeWav          VALUE=""/>
            <ScanInvalidWav         VALUE=""/>
            <ImagerCaptureWav       VALUE=""/>
          </Sound>
          <GUI>
            <SignalRefresh      VALUE="5000"/>
            <BatteryRefresh     VALUE="5000"/>
            <HourglassEnabled   VALUE="1" />
            <HourglassLeft      VALUE="" />
            <HourglassTop       VALUE="" />
          </GUI>
          <Navigation>
            <BadLinkURI               VALUE=""/>
            <UserAgent                VALUE="Mozilla/5.0 (%p) AppleWebKit/%w (KHTML, like Gecko) MotorolaWebKit/%e Mobile Safari/%w" />
            <ViewportEnabled          VALUE="0"/>
            <ViewportWidth            VALUE="640"/>
            <CaFile                   VALUE="%INSTALLDIR%\server.pem"/>
            <VerifyPeerCertificate    VALUE="1"/>
            <NetworkCookieDatabase    VALUE="file://\Program Files\RhoElements\cookies.db" />
            <Cache                    VALUE="5MB" />
          </Navigation>
          <DeviceKeys>
            <EnableCtrlKey_C          VALUE="0"/>
            <EnableCtrlKey_V          VALUE="0"/>
            <EnableBacklightSlider    VALUE="0"/>
            <EnableVolumeSlider       VALUE="0"/>
          </DeviceKeys>
          <DefaultMetaTags>
            <MetaTag VALUE="SignatureCapture~left:30;top:130;height:100;bgcolor:#663300;width:200;border:visible;visibility:visible;" />
            <MetaTag VALUE="Signal~left:10;top:200;color:#663300;"/>
          </DefaultMetaTags>
        </Application>
      </Applications>
    </Configuration>

## Configuration settings and values
> Note: The following settings effects applications that are using Zebra Webkit. However the setting `CAFile` in this file will be used for 4.0 native applications using the stock browser

> Note: Fullscreen Mode is currently unavailable for the iOS7 SDK. For details and other differences, see the [Differences in iOS7](build_ios#differences-building-for-ios7) section in the [Build for iOS](build_ios) doc.

<div style="width:100%">
  <table class="table table-striped table-bordered table-condensed configxml" style="table-layout: fixed !important;">
    <tr>
      <th>Group\\XML Tag</th>
      <th>Configuration Identifier<a href="#_configIndentifiers">*</a></th>
      <th>Description</th>
      <th width="12%">Possible Values</th>
    </tr>

    <tr>
      <td class="clsEvenRow">DebugButtons\\<BR>DebugButtonsEnabled</td>
      <td class="clsEvenRow">DEBUGBUTTONSENABLED</td>
      <td class="clsEvenRow">When enabled, a set of controls useful for development and debugging purposes will be present in the interface.  </td>
      <td class="clsEvenRow">0 - Disabled<BR>1 - Enabled</td>
    </tr>

    <tr>
      <td>Logger\\LogProtocol</td>
      <td>LOGPROTOCOL</td>
      <td>Sets the protocol over which the logging data will be sent</td>
      <td>"File" or "HTTP"</td>
    </tr>

    <tr>
      <td class="clsEvenRow">Logger\\LogPort</td>
      <td class="clsEvenRow">LOGPORT</td>
      <td class="clsEvenRow">The port over which the logging data will be sent (ignored for File protocol)</td>
      <td class="clsEvenRow">Any valid HTTP port</td>
    </tr>

    <tr>
      <td>Logger\\LogURI</td>
      <td>LOGURI</td>
      <td>The URL or File name & path to which logged data should be sent</td>
      <td>Any valid URL or fully qualified file name</td>
    </tr>

    <tr>
      <td class="clsEvenRow">Logger\\LogError</td>
      <td class="clsEvenRow">LOGERROR</td>
      <td class="clsEvenRow">Enables or Disables the logging of ERROR messages generated by RhoElements</td>
      <td class="clsEvenRow">0 - Disabled<BR>1 - Enabled</td>
    </tr>

    <tr>
      <td>Logger\\LogWarning</td>
      <td>LOGWARNING</td>
      <td>Enables or Disables the logging of WARNING messages generated by RhoElements</td>
      <td>0 - Disabled<BR>1 - Enabled</td>
    </tr>

    <tr>
      <td class="clsEvenRow">Logger\\<BR>LogInfo</td>
      <td class="clsEvenRow">LOGINFO</td>
      <td class="clsEvenRow">Enables or Disables the logging of INFORMATION messages generated by RhoElements</td>
      <td class="clsEvenRow">0 - Disabled<BR>1 - Enabled</td>
    </tr>

    <tr>
      <td>Logger\\LogUser</td>
      <td>LOGUSER</td>
      <td>Enables or Disables the logging of messages from the user application. Data can be logged using the <a href="../api/log">Log API</a></td>
      <td>0 - Disabled<BR>1 - Enabled</td>
    </tr>

    <tr>
      <td class="clsEvenRow">Logger\\LogMemory</td>
      <td class="clsEvenRow">LOGMEMORY</td>
      <td class="clsEvenRow">Enables or Disables the logging of memory usage in the system. Not applicable to the Enterprise Tablet.</td>
      <td class="clsEvenRow">0 - Disabled<BR>1 - Enabled</td>
    </tr>

    <tr>
      <td>Logger\\LogMemPeriod</td>
      <td>LOGMEMPERIOD</td>
      <td>Specifies the time interval at which memory logs will be generated periodically. Not applicable to the Enterprise Tablet</td>
      <td>Time in milliseconds</td>
    </tr>

    <tr>
      <td class="clsEvenRow">Logger\\LogMaxSize</td>
      <td class="clsEvenRow">LOGMAXSIZE</td>
      <td class="clsEvenRow">The maximum size the log file should be allowed to reach, once the maximum size is reached no more logs will be saved.</td>
      <td class="clsEvenRow">File size in kilobytes</td>
    </tr>

    <tr>
      <td>FileLocations\\RegExFile</td>
      <td>REGEXFILE</td>
      <td>In order to enable backward compatibility with pages written in EMML 1.0 regular expressions are used to convert to EMML1.1 meta tags.  This setting defines the location of the XML file which contains the conversions to be used.  This setting is only applicable to Windows</td>
      <td>Fully qualified path to file defining the regular expressions.<a href="#_caseSensitivity">&dagger;</a></td>
    </tr>

    <tr>
      <td class="clsEvenRow">FileLocations\\PluginFile</td>
      <td class="clsEvenRow">PLUGINFILE</td>
      <td class="clsEvenRow">Not applicable to the Enterprise Tablet:<br>RhoElements has a plugin based architecture so functionality can be tailored to the individual application, lessening the memory footprint on the device.  It is necessary for RhoElements to have a mapping between modules, plugins and the physical location of the Plugin DLL on the device; this mapping is stored in the Plug-in file and the location of that file is defined by this setting.</td>
      <td class="clsEvenRow">Fully qualified path to file defining the plugins.<a href="#_caseSensitivity">&dagger;</a></td>
    </tr>

    <tr>
      <td>Screen\\FullScreen</td>
      <td>FULLSCREEN</td>
      <td>Sets RhoElements to fullscreen mode, locking out the OS to the user unless specifically minimized using the <a href="../api/Application#mminimize">Application API</a>.  Some Windows Mobile devices feature a customized Zebra user interface; in this case access is provided to the status bar at the top of the screen.</td>
      <td>0 - Disabled<BR>1 - Enabled</td>
    </tr>

    <tr>
      <td class="clsEvenRow">WebServer\\Enabled</td>
      <td class="clsEvenRow">WEBSENABLED</td>
      <td class="clsEvenRow">Enables or Disables an internal web server to run locally on the device.  If running multiple applications with internal web servers consideration should be made over whether a single server should be used or multiple servers running on different ports.</td>
      <td class="clsEvenRow">0 - Disabled<BR>1 - Enabled</td>
    </tr>

    <tr>
      <td>WebServer\\Port</td>
      <td>WEBSPORT</td>
      <td>By default should be left at 8080, This specifies the IP port the Web Server is running on.</td>
      <td>8080</td>
    </tr>

    <tr>
      <td class="clsEvenRow">WebServer\\WebFolder</td>
      <td class="clsEvenRow">WEBSFOLDER</td>
      <td class="clsEvenRow">Specifies a folder on the device where the web application is stored, Index.html is the default page if no other page is requested</td>
      <td class="clsEvenRow">Fully qualified path to folder containing web application.<a href="#_caseSensitivity">&dagger;</a></td>
    </tr>

    <tr>
      <td>WebServer\\Public</td>
      <td>WEBSPUBLIC</td>
      <td>Enables or Disables access to the local WebServer from an external device, it is recommended that the setting is only used for debugging purposes. <strong>Enabling this feature in a production deployment is a potential security risk. Make sure to check this value before deployment.</strong></td>
      <td>0 - Disabled<BR>1 - Enabled</td>
    </tr>

    <tr>
      <td class="clsEvenRow">DeviceKeys\\<BR>FunctionKeysCapturable</td>
      <td class="clsEvenRow">FUNCTIONKEYSCAPTURABLE</td>
      <td class="clsEvenRow">This parameter is specific to Windows Mobile and Windows CE:<P>When disabled (default) this parameter will allow enabled Function keys to have their default Windows system behavior (e.g. F6/F7 controls the volume on some devices whilst F3/F4 represent the Red / Green phone keys).  When enabled, function keys will be capturable by the <a href="/api/keycapture">Key Capture module</a>.<P>The interaction between FunctionKeysCapturable and EnableFunctionKey_X is shown <a href="#_fnbehavior">here</a>.  This setting is not specific to the current application and will be applied globally on the device.</td>
      <td class="clsEvenRow">0 - F keys not capturable<BR>1 - F keys capturable</td>
    </tr>

    <tr>
      <td>DeviceKeys\\<BR>EnableFunctionKey_X</td>
      <td>ENABLEFUNCTIONKEY_FX</td>
      <td>By default all function keys are disabled (e.g. F1, F2) but this setting is used to specify which function keys should be enabled.  For each key you wish to enable define a EnableFunctionKey_X tag but replace 'X' with the key being enabled, so for example to enable F1 specify EnableFunctionKey_F1.  The maximum function key you can enable is F24.  In order to use this configuration setting you must preload the KeyCapture module<p>On the Enterprise tablet, this tag can be used to enable the 'P' keys. For compatibility with other devices the 'P' keys are referred to as 'F' keys in the config file. Therefore in order to enable P2 key on the enterprise tablet, the tag EnableFunctionKey_F2 should be set to 1.  For Windows Mobile / CE this setting is not specific to the current application and will be applied globally on the device, <b>only being unset when a device warm boot is performed.</b></p>
        <p>On MC40, F1 is mapped to the Volume Down button, F2 to the Volume UP button and F3 to the Search button.</p>
        <P>The interaction between FunctionKeysCapturable and EnableFunctionKey_X is shown at <a href="#_fnbehavior">the end of this document</a>
      </td>
      <td>0 - Disabled<BR>1 - Enabled</td>
    </tr>

    <tr>
      <td class="clsEvenRow">DeviceKeys\\<BR>EnableApplicationKey_X</td>
      <td class="clsEvenRow">Not Configurable</td>
      <td class="clsEvenRow">This parameter is specific to Windows Mobile and Windows CE:<br>Some devices have keys to access specific applications on the device, e.g. Calendar, Outlook etc, all of which are disabled by default.  This setting is used to specify which application keys should be enabled, numbered A1 to A16.  For each key you wish to enable define a EnableApplicationKey_X tag but replace 'X' with the key being enabled, e.g. EnableApplicationKey_A1.  Note that the mapping of keys to applications is device specific so A1 may have two functions on two different devices.  In order to use this configuration setting you must preload the KeyCapture module<P>This setting is not specific to the current application and will be applied globally on the device. <b>Once set, this will persist across multiple RhoElements executions and can only be unset by performing a device warm boot.</b></td>
      <td class="clsEvenRow">0 - Disabled<BR>1 - Enabled</td>
    </tr>

    <tr>
      <td>Navigation\\NavTimeout</td>
      <td>NAVTIMEOUT</td>
      <td>Number of milliseconds before the browser times out and navigates to the page specified in the badlink setting.  If it is determined that the destination is unreachable regardless of wait time, the 'badlink' page may be loaded before NAVTIMEOUT.  This is the time taken to establish communication with the server, not the time taken to fully load the page.<br><br>Note that the navigation timeout will not be invoked when navigating to the start page, best practice is to store your first page locally to avoid connectivity issues at start up, you can then redirect to an on-line page if desired.</td></td></td>
      <td>Timeout in Milliseconds, maximum value is 45000</td>
    </tr>

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
      <td class="clsEvenRow">General\\Name</td>
      <td class="clsEvenRow">Not Configurable</td>
      <td class="clsEvenRow">The name of the application</td>
      <td class="clsEvenRow">ASCII text</td>
    </tr>

    <tr>
      <td>General\\StartPage</td>
      <td>STARTPAGE</td>
      <td>Defines the start page of the RhoElements application, the first page to be displayed when RhoElements is launched.  This should be a local file to avoid connectivity issues on start up.</td>
      <td>Fully qualified path to start page.<a href="#_caseSensitivity">&dagger;</a></td>
    </tr>

    <tr>
      <td class="clsEvenRow">General\\UseRegularExpressions</td>
      <td class="clsEvenRow">USEREGULAREXPRESSIONS</td>
      <td class="clsEvenRow">In order to be backwardly compatible with PocketBrowser syntax for controlling device capabilities RhoElements uses a Regular Expression engine to apply a series of transformations to each meta tag or JavaScript call being processed, as defined in RegEx.xml. If you are developing applications without the need to be backwardly compatible with PocketBrowser syntax you can disable regular expressions, this can result in an improvement in application performance, depending on how the application is structured. This setting is only applicable to RhoMobile Suite version 2.2 and above on Windows devices.</td>
      <td class="clsEvenRow">0 - Do Not Use Regular Expressions<br>1 - Use Regular Expressions</a></td>
    </tr>

    <tr>
      <td>HTTP_Proxy</td>
      <td>HTTPPROXY</td>
      <td>Specifies the HTTP Proxy settings to use in the format URL:port.  Note that this setting only applies to the Zebra WebKit engine, proxy settings for the Internet Explorer engine are picked up from the Windows connection manager.  Leave this field blank to not use a proxy.</td>
      <td>URL:PortNo</td>
    </tr>

    <tr>
      <td class="clsEvenRow">HTTPS_Proxy</td>
      <td class="clsEvenRow">N/A</td>
      <td class="clsEvenRow">Specifies the HTTPS Proxy settings to use in the format URL:port.  Note that this setting only applies to the Zebra WebKit engine, proxy settings for the Internet Explorer engine are picked up from the Windows connection manager.  Leave this field blank to not use a proxy. Not supported on Windows Mobile/Windows CE, use HTTP_Proxy instead.</td>
      <td class="clsEvenRow">URL:PortNo</td>
    </tr>

    <tr>
      <td>No_Proxy</td>
      <td>NOPROXY</td>
      <td>Sets the sites that should be accessed directly. This should be a comma-separated list of host names, domain names (starting with a dot), IP addresses, or CIDR format IP network addresses eg. myhost, .mydomain.com, 192.168.1.1,192.168.0.0/24. Note this configuration setting is usable with the Zebra Webkit browser only.</td>
      <td>Comma separated list of direct access addresses.</td>
    </tr>

    <tr>
      <td class="clsEvenRow">WebDB\\WebStorageDBPath</td>
      <td class="clsEvenRow">WEBSTORAGEDBPATH</td>
      <td class="clsEvenRow">Path to an existing directory to store Web Storage databases</td>
      <td class="clsEvenRow">Fully qualified local path.<a href="#_caseSensitivity">&dagger;</a></td>
    </tr>

    <tr>
      <td>WebDB\\WebSQLDBQuota</td>
      <td>WEBSQLDBQUOTA</td>
      <td>Web SQL database maximum quota per database</td>
      <td>Size in bytes</td>
    </tr>

    <tr>
      <td class="clsEvenRow">WebDB\\WebSQLDBPath</td>
      <td class="clsEvenRow">WEBSQLDBPATH</td>
      <td class="clsEvenRow">Path to an existing directory to store Web SQL databases</td>
      <td class="clsEvenRow">Fully qualified local path.<a href="#_caseSensitivity">&dagger;</a></td>
    </tr>

    <tr>
      <td>ApplicationCache\\ApplicationCacheQuota</td>
      <td>APPLICATIONCACHEQUOTA</td>
      <td>Application Cache data maximum quota per application</td>
      <td>Size in bytes</td>
    </tr>

    <tr>
      <td class="clsEvenRow">ApplicationCache\\ApplicationCachePath</td>
      <td class="clsEvenRow">APPLICATIONCACHEPATH</td>
      <td class="clsEvenRow">Path to an existing directory to store Application Cache data</td>
      <td class="clsEvenRow">Fully qualified local path.<a href="#_caseSensitivity">&dagger;</a></td>
    </tr>

    <tr>
      <td>NPAPI\\NPAPIDirectory</td>
      <td>NPAPIDIRECTORY</td>
      <td>Not applicable to the Enterprise Tablet:<br>Path to an existing directory where the NPAPI Plugins are stored</td>
      <td>Fully qualified local path.<a href="#_caseSensitivity">&dagger;</a></td>
    </tr>

    <tr>
      <td class="clsEvenRow">NPAPI\\Preloads\\PreloadLegacyActiveX</td>
      <td class="clsEvenRow">PRELOADLEGACYACTIVEX</td>
      <td class="clsEvenRow">Whether or not to preload the ActiveX object in WebKit. You'll need to use this if you want backwards compatibility with code written in PocketBrowser that used the ActiveXObject. This setting is supported on Windows Mobile / CE with the Zebra Webkit only.</td>
      <td class="clsEvenRow">0 - Do Not Preload<br>1 - Preload</td>
    </tr>

    <tr>
      <td>NPAPI\\Preloads\\PreloadLegacyGeneric</td>
      <td>PRELOADLEGACYGENERIC</td>
      <td>Whether or not to preload the NPAPI plugin to mimic the Generic ActiveX object in WebKit. On the Enterprise Tablet this plugin is automatically loaded when the JSObjects plugin is preloaded.</td>
      <td>0 - Do Not Preload<br>1 - Preload</td>
    </tr>

    <tr>
      <td class="clsEvenRow">NPAPI\\Preloads\\PreloadLegacyODAX</td>
      <td class="clsEvenRow">PRELOADLEGACYODAX</td>
      <td class="clsEvenRow">Not applicable to the Enterprise Tablet:<br>Whether or not to preload the NPAPI plugin to mimic the ODAX ActiveX object in WebKit</td>
      <td class="clsEvenRow">0 - Do Not Preload<br>1 - Preload</td>
    </tr>

    <tr>
      <td>NPAPI\\Preloads\\PreloadLegacyNoSIP</td>
      <td>PRELOADLEGACYNOSIP</td>
      <td>Whether or not to preload the NPAPI plugin to mimic the NoSIP ActiveX object in WebKit</td>
      <td>0 - Do Not Preload<br>1 - Preload</td>
    </tr>

    <tr>
      <td class="clsEvenRow">NPAPI\\Preloads\\PreloadLegacyAirBeam</td>
      <td class="clsEvenRow">PRELOADLEGACYAIRBEAM</td>
      <td class="clsEvenRow">Not applicable to the Enterprise Tablet:<br>Whether or not to preload the NPAPI plugin to mimic the AirBeam ActiveX object in WebKit</td>
      <td class="clsEvenRow">0 - Do Not Preload<br>1 - Preload</td>
    </tr>

    <tr>
      <td>NPAPI\\Preloads\\PreloadLegacyAPD</td>
      <td>PRELOADLEGACYAPD</td>
      <td>Whether or not to preload the NPAPI plugin to mimic the APD ActiveX object in WebKit</td>
      <td>0 - Do Not Preload<br>1 - Preload</td>
    </tr>

    <tr>
      <td class="clsEvenRow">NPAPI\\Preloads\\PreloadJSObjects</td>
      <td class="clsEvenRow">PRELOADLEGACYJSOBJECTS</td>
      <td class="clsEvenRow">Whether or not to preload the NPAPI plugin to provide native JavaScript objects for each of the modules</td>
      <td class="clsEvenRow">0 - Do Not Preload<br>1 - Preload</td>
    </tr>

    <tr>
      <td>Preloads\\Preload</td>
      <td>PRELOAD</td>
      <td>By default plugins will be loaded into memory when needed, e.g. when <code>Barcode.enable</code> is called, the <code>Barcode</code> plugin DLL will be loaded into memory. This loading operation takes takes a certain amount of time when it is performed for the first time; to prevent the user from noticing any lag when using their application, modules can be loaded in the background when RhoElements starts.  Specify a Preload tag for each module you wish to load at RhoElements startup; note that multiple modules may be defined in the same DLL but you still need to list all modules to preload here to see maximum benefit.<p>On low memory devices, it is recommended to preload all your required modules to avoid your program running out of memory during execution.</p>
        <p>Preloads are not applicable to the enterprise tablet, as plugins are integral to RhoElements on this platform.</p></td>
      <td>Module name</td>
    </tr>

    <tr>
      <td class="clsEvenRow">Scrolling\\ScrollTechnique</td>
      <td class="clsEvenRow">SCROLLTECHNIQUE</td>
      <td class="clsEvenRow">Specifies the technique used to scroll the viewport:<br/>
        <b>FingerScroll</b> - You can scroll around the page using finger swiping.(Only setting applicable to Android)<br/>
        <b>Scrollbars</b> - When the size of the page is too large to fit into the viewport, scrollbars will be presented which can be used to scroll the page.<br/>
        <b>None</b> - No scrollbars will be displayed and the page will not respond to finger swipes.<br/>
        <b>NOTE:</b> FingerScroll may interfere with drawing on a Canvas element</td>
      <td class="clsEvenRow">See description</td>
      <td class="clsEvenRow">Windows Mobile, Windows CE, Android, iOS</td>
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
      <td>HTMLStyles\\CaretWidth</td>
      <td>CARETWIDTH</td>
      <td>This setting is a number which specifies the width of the textbox / text area caret, in pixels. The default value if you don't specify anything is '1'.  Prior to this release the width was fixed at '1' and you could not change it. This setting only applies to the Webkit on Windows Mobile or Windows CE.</td>
      <td>Integer values for caret width in pixels from 1 to 5, inclusively</td>
    </tr>

    <tr>
      <td class="clsEvenRow">HTMLStyles\\FontFamily</td>
      <td class="clsEvenRow">FONTFAMILY</td>
      <td class="clsEvenRow">Specifies the default font to use when rendering text in web pages.  The specified font should be a TrueType font present on the device. On Windows, the default font has been set to 'Tahoma' as this is present on all Zebra WM / CE devices. Note that Tahoma has no italic or oblique variants. On the Enterprise Tablet the default is Droid Sans Fallback. The specified font must be stored in <code>\Windows</code> for Windows WM / CE devices, or <code>/system/fonts for Enterprise Tablet</code>.</td>
      <td class="clsEvenRow">Font name</td>
    </tr>

    <tr>
      <td>HTMLStyles\\FontDirectory</td>
      <td>FONTDIRECTORY</td>
      <td>Specifies the font directory where true type fonts can be found.  On Windows the default font directory is <code>\Windows</code> on all Zebra WM / CE devices.  Not applicable to the Enterprise Tablet.</td>
      <td><code>\Windows</code></td>
    </tr>

    <tr>
      <td class="clsEvenRow">HTMLStyles\\UseNativeFonts</td>
      <td class="clsEvenRow">USENATIVEFONTS</td>
      <td class="clsEvenRow">When set to 0 (default) the FreeType library is used, this is the same as behavior on RMS 2.x. When set to 1 the native font engine on the device is used to render fonts and the 'FontFamily' setting will have no effect. By default, on localized devices from 4.1 onwards the native font engine will be used as the FreeType library can not render localized characters (e.g. Italian accented characters, Korean characters, Chinese characters etc). Some early BSPs of CE7 do not support the native font render unfortunately. The log file will show the font engine in use on launch if there is doubt. This setting is specific to Windows Mobile / Windows CE. NOTE: This config item is not currently available on the latest BSPs for MC92, VC70 or WT41N0.</td>
      <td class="clsEvenRow">0 - Use FontFamily Setting<BR>1 - Use FreeType font library</td>
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
      <td class="clsEvenRow">GUI\\SignalRefresh</td>
      <td class="clsEvenRow">SIGNALREFRESH</td>
      <td class="clsEvenRow">Specifies the refresh rate of the signal display, see the <a href="/api/signalindicators">Signal</a> API for more information.</td>
      <td class="clsEvenRow">Refresh rate in milliseconds</td>
    </tr>

    <tr>
      <td>GUI\\BatteryRefresh</td>
      <td>BATTERYREFRESH</td>
      <td>Specifies the refresh rate of the battery display, see the <a href="/api/battery">Battery</a> API for more information. Not applicable to the Enterprise Tablet<a href="#_batteryRefresh">* (see remark)</a></td>
      <td>Refresh rate in milliseconds</td>
    </tr>

    <tr>
      <td class="clsEvenRow">GUI\\HourglassEnabled</td>
      <td class="clsEvenRow">HOURGLASSENABLED</td>
      <td class="clsEvenRow">By default an <a href="/v/2.2/rhoelements/hourglass">Hourglass</a> will be displayed whilst navigating between pages, this setting can be used to disable that behavior.</td>
      <td class="clsEvenRow">0 - Disabled<BR>1 - Enabled</td>
    </tr>

    <tr>
      <td>GUI\\HourglassLeft</td>
      <td>HOURGLASSLEFT</td>
      <td>By default an <a href="/v/2.2/rhoelements/hourglass">Hourglass</a> will be displayed whilst navigating between pages, this setting can be used to adjust its horizontal position.  If not specified the hourglass will appear at the center of the screen.</td>
      <td>Pixels</td>
    </tr>

    <tr>
      <td class="clsEvenRow">GUI\\HourglassTop</td>
      <td class="clsEvenRow">HOURGLASSTOP</td>
      <td class="clsEvenRow">By default an <a href="/v/2.2/rhoelements/hourglass">Hourglass</a> will be displayed whilst navigating between pages, this setting can be used to adjust its vertical position.  If not specified the hourglass will appear in the center of the screen.</td>
      <td class="clsEvenRow">Pixels</td>
    </tr>

    <tr>
      <td>Navigation\\BadLinkURI</td>
      <td>BADLINKURI</td>
      <td>Navigates to the specified badlink uri when one of the following occurs:<br>
      <ul>
        <li>There is an error attempting to navigate to the page, e.g. the device has no network connection.
        <li>The timeout occurs when navigating to the page.  You can adjust the value of the timeout using the NavTimeout setting.
        <li>The user presses the stop button.
      </ul>
      The browser will automatically append the querystring value "badlink" containing the url of the page which could not be reached and "stop=true" if the page was loaded because the user pressed the stop button.  The page specified in the badlink setting should be an offline file using the <code>file://</code> protocol, this way the browser can always access the file.
      </td>
      <td>File name and path stored locally on the device.<a href="#_caseSensitivity">&dagger;</a></td>
    </tr>

    <tr>
      <td class="clsEvenRow">Navigation\\UserAgent</td>
      <td class="clsEvenRow">USERAGENT</td>
      <td class="clsEvenRow">When visiting a web server the WebKit browser will report its User-Agent header as the specified value.  Use the following substitution variables:<br>
      <ul>
        <li>%p - platform name ("Windows CE " + version number)
        <li>%w - WebKit version number
        <li>%e - MotorolaWebKit version number.
      </ul>
      Use the UserAgent setting to spoof your device to the server, e.g. to view content designed for the desktop on your mobile screen.<br/>
      From RhoElements 2.1 onwards the default value was changed to work out of the box with a greater number of server configurations, prior to RhoElements 2.1 the default user agent was: "Mozilla/5.0 (%p) AppleWebKit/%w (KHTML, like Gecko) MotorolaWebKit/%e Safari/%w"</td>
      <td class="clsEvenRow">String</td>
    </tr>

    <tr>
      <td>Navigation\\ViewportEnabled</td>
      <td>VIEWPORTENABLED</td>
      <td>Whether to enable or disable viewport meta tag processing (default is enabled)</td>
      <td>0 - Disabled<BR>1 - Enabled</td>
    </tr>

    <tr>
      <td class="clsEvenRow">Navigation\\ViewportWidth</td>
      <td class="clsEvenRow">VIEWPORTWIDTH</td>
      <td class="clsEvenRow">Default viewport width to use for pages that do not have a viewport meta tag (uses 1:1 scaling if not specified)</td>
      <td class="clsEvenRow">Number</td>
    </tr>

    <tr>
      <td>Navigation\\CaFile</td>
      <td>CAFILE</td>
      <td>A file of CA certificates in PEM format.  See <a href="http://www.openssl.org/docs/ssl/SSL_CTX_load_verify_locations.html" target="_blank">openssl</a>.  This setting is supported on Windows Mobile / CE and Android.</td>
      <td>Local File name on the device.</td>
    </tr>

    <tr>
      <td class="clsEvenRow">Navigation\\VerifyPeerCertificate</td>
      <td class="clsEvenRow">VERIFYPEERCERTIFICATE</td>
      <td class="clsEvenRow">Verify the server certificate against the internal certificates.  It is strongly recommended not to set this to 0 in deployment situations, but it can be useful during development.  A value of 0 is equivalent to automatically clicking 'OK' on a web browser's dialog querying an untrusted certificate.</td>
      <td class="clsEvenRow">Boolean</td>
    </tr>

    <tr>
      <td>Navigation\\NetworkCookieDatabase</td>
      <td>NETWORKCOOKIEDATABASE</td>
      <td>If you want your cookies to persist across device boots then specify a file name here for the database used to hold the cookies.  If the specified file does not already exist then one will be created.  The cookies will be loaded in from this file and saved back to it when RhoElements exits, unless the file is read only in which case it will not be overwritten.  If not specified cookies will not persist.</td>
      <td>Fully qualified local path.<a href="#_caseSensitivity">&dagger;</a></td>
    </tr>

    <tr>
      <td class="clsEvenRow">Navigation\\Cache</td>
      <td class="clsEvenRow">NAVIGATIONCACHE</td>
      <td class="clsEvenRow">The browser cache size, in whole MBs.  This setting is only applicable to RhoMobile Suite version 2.2 and above.</td>
      <td class="clsEvenRow">Whole MBs, eg. 5MB</td>
    </tr>

    <tr>
      <td>DeviceKeys\\<BR>EnableCtrlKey_X</td>
      <td>Not Configurable</td>
      <td>CE Only:<BR>By default all CTRL+Key combinations are disabled (e.g. CTRL+C to copy text; CTRL+V to paste text).  This setting is used to specify which CTRL+Key combinations should be enabled.  For each combination you wish to enable define a EnableCtrlKey_X tag but replace 'X' with the key being enabled, so for example to enable text copying specify EnableCtrlKey_C as enabled or to enable text pasting specify EnableCtrlKey_V as enabled.</td>
      <td>0 - Disabled<BR>1 - Enabled</td>
    </tr>

    <tr>
      <td class="clsEvenRow">DeviceKeys\\<BR>EnableVolumeSlider</td>
      <td class="clsEvenRow">ENABLEVOLUMESLIDER</td>
      <td class="clsEvenRow">Specific to the MC2100:<BR>Allows or prevents the key combination Orange+F1 from bringing up a slider to adjust the volume.  This setting is not application specific and will be applied globally on the device.</td>
      <td class="clsEvenRow">0 - Disabled<BR>1 - Enabled</td>
    </tr>

    <tr>
      <td>DeviceKeys\\<BR>EnableBacklightSlider</td>
      <td>ENABLEBACKLIGHTSLIDER</td>
      <td>Specific to the MC2100:<BR>Allows or prevents the key combination Orange+F2 from bringing up a slider to adjust the backlight.  This setting is not application specific and will be applied globally on the device.</td>
      <td>0 - Disabled<BR>1 - Enabled</td>
    </tr>

    <tr>
      <td class="clsEvenRow">DefaultMetaTags\\MetaTag</td>
      <td class="clsEvenRow">DEFAULTMETATAG</td>
      <td class="clsEvenRow">All RhoElements Meta Tags can be set by default in the configuration, meaning if a common tag is required by the application it need not be present on every HTML page. Set a default tag in by specifying the tag's module, followed by a tilda character and then the properties of the module you wish to set, specified in EMML 1.1.  If the meta tag is present in both the configuration and a loaded page then the page will take priority. Logically only persistent tags can be set in the configuration, a tag's persistence being stated in the 'additional information' section in the help file.</td>
      <td class="clsEvenRow">[Module]~[Contents expressed in EMML1.1]</td>
    </tr>

    <tr>
      <td>Geolocation\\GeolocationEnabled</td>
      <td>Not Configurable</td>
      <td>Enables/disables HTML5 Geolocation. When enabled on a device supporting geolocation and under GPS/network coverage, the geolocation data is returned to the defined JavaScript callback. When disabled the defined JavaScript error callback is called notifying that the permission to using Geolocation is disabled.</td>
      <td>0 - Disabled<BR>1 - Enabled</td>
    </tr>

    <tr>
      <td class="clsEvenRow">TabInstance\\NewTabPhysicalMemLimit</td>
      <td class="clsEvenRow">NEWTABPHYSICALMEMLIMIT</td>
      <td class="clsEvenRow">This setting controls whether a new Tab will be created using the <a href="../api/NativeTabbar#mcreate">NativeTabbar.create API</a> when a physical memory usage percentage is hit. Ex: if it is set to 80 - then the tab instance will not be created if the physical memory usage on the device is>=80%. If the tab is unable to be created due to this limit being reached the <a href="../api/NativeTabbar#mcreate">NativeTabbar.create API</a> callback will contain a <code>tabEvent</code> = <code>onTabNewError</code>.</td>
      <td class="clsEvenRow">0-100 (100=no limit)</td>
    </tr>

    <tr>
      <td>TabInstance\\NewTabVirtualMemLimit</td>
      <td>NEWTABVIRTUALMEMLIMIT</td>
      <td>This setting controls whether a new Tab will be created using the <a href="../api/NativeTabbar#mcreate">NativeTabbar.create API</a> when a virtual memory usage percentage is hit. Ex: if it is set to 80 - then the tab instance will not be created if the physical memory usage on the device is>=80%.If the tab is unable to be created due to this limit being reached the <a href="../api/NativeTabbar#mcreate">NativeTabbar.create API</a> callback will contain a <code>tabEvent</code> = <code>onTabNewError</code></td>
      <td>0-100 (100=no limit)</td>
    </tr>
  </table>
</div>

<a name="_configIndentifiers">*</a> The configuration identifiers are used in the ReadConfigSetting and Write Config Setting methods of <a href="/v/2.2/rhoelements/generic">Generic</a>

## Substitution Variables
The following substitution variables are available in the configuration file
<table class="re-table">
  <tr>
    <th>Substitution Variable</th>
    <th>Expanded Value</th>
  </tr>
  <tr>
    <td>%INSTALLDIR%</td>
    <td>The directory into which RhoElements.exe has been installed</td>
  </tr>
</table>

## Remarks
###<a name="_caseSensitivity">&dagger;</a>Case Sensitivity
The operating systems of some devices have case sensitive file systems. Therefore it is good practice to always keep URL values in the Config.xml file case identical to the names of the actual files.

###<a name="_batteryRefresh">*</a>Battery Polling on the Enterprise Tablet
On the Enterprise Tablet the battery notification is asynchronous. For this reason, BatteryRefresh is not supported on the Enterprise Tablet. The effect of this is that a batteryEvent is fired only when the battery level changes. This has been done to save battery power compared to polling.

###<a name="_fnbehavior"></a>Interaction between FunctionKeysCapturable and EnableFunctionKey configuration settings
On Windows Mobile and Windows CE devices full control is given to the developer over how their application handles function keys.  Because of the limitations of the operating system <b>any settings applied will persist until the device is next warm booted</b>.  Which function keys have default operating system behavior will vary from device to device, e.g. on the MC75a F3 and F4 represent the red and green phone keys and on many devices the volume keys are also mapped as Function keys.  Not all function keys will have default operating system behavior.

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
On Windows Mobile and Windows CE, using the Webkit, we only support the "Basic" and "Digest" forms of the Authenticate header as described in [This article](https://www.ietf.org/rfc/rfc2617.txt). This means that whenever using WM or WinCE, you'll need to pass the username and password over the network as clear-text. Keep this in mind when thinking about your app's security on these platforms.