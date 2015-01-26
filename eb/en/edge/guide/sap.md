# SAP ITS Mobile
The following information should be helpful when using Enterprise Browser within a SAP ITS Mobile environment.

## Configuration
The following configuration files should be used depending on your Enterprise Browser client:

### Windows Mobile/CE With Webkit Engine
Use the following [config.xml](https://s3.amazonaws.com/enterprise-browser/sapits/wmwebkit/Config.xml) settings when your mobile device is Windows Mobile/CE and you have installed the Webkit version of Enterprise Browser. Make sure to change the `StartPage` parameter to point to your SAP ITS Mobile server:

	:::xml
	<?xml version = "1.0"?>
	<!--
	Enterprise Browser Configuration file
	-->
	<Configuration>

		<DebugButtons>
			<DebugButtonsEnabled value="0" />
		</DebugButtons>

		<Logger>
			<LogProtocol   value="FILE"/>
			<LogPort       value="80"/>
			<LogURI        value="file://%INSTALLDIR%/Log.txt"/>
			<LogError      value="1"/>
			<LogWarning    value="1"/>
			<LogInfo       value="0"/>
			<LogUser       value="0"/>
			<LogMemory     value="0"/>
			<LogMemPeriod  value="5000"/>
			<LogMaxSize    value="1000"/>
		</Logger>

		<FileLocations>
			<RegEXFile  value="file://%INSTALLDIR%/RegEx.xml"/>
		</FileLocations>

		<Screen>
			<FullScreen value="1"/>
			<PageZoom value="1.0" />
		</Screen>

		<VoidConnection>
			<TrackConnection value="0"/>
			<HostURL value="192.168.1.1"/>
			<Message value="Establishing Connection..."/>
			<Timeout value="30000"/>
			<PollInterval value="5000"/>
		</VoidConnection>

		<DeviceKeys>
			<FunctionKeysCapturable   value="1"/>
			<EnableFunctionKey_F1     value="1"/>
			<EnableFunctionKey_F2     value="1"/>
			<EnableFunctionKey_F3     value="1"/>
			<EnableFunctionKey_F4     value="1"/>
			<EnableFunctionKey_F5     value="1"/>
			<EnableFunctionKey_F6     value="1"/>
			<EnableFunctionKey_F7     value="1"/>
			<EnableFunctionKey_F8     value="1"/>
			<EnableFunctionKey_F9     value="1"/>
			<EnableFunctionKey_F10    value="1"/>
			<EnableFunctionKey_F11    value="1"/>
			<EnableFunctionKey_F12    value="1"/>
			<EnableApplicationKey_A1  value="1"/>
			<EnableApplicationKey_A2  value="1"/>
			<EnableApplicationKey_A3  value="1"/>
			<EnableApplicationKey_A4  value="1"/>
			<EnableApplicationKey_A5  value="1"/>
			<EnableApplicationKey_A6  value="1"/>
			<EnableApplicationKey_A7  value="1"/>
			<EnableApplicationKey_A8  value="1"/>
		</DeviceKeys>

		<Navigation>
			<NavTimeout value="45000"/>
		</Navigation>

		<Geolocation>
			<GeolocationEnabled value="1"/>
		</Geolocation>

		<ScreenOrientation>
			<AutoRotate value="1" />
		</ScreenOrientation>

		<TabInstance>
			<NewTabPhysicalMemLimit value="90"/>
			<NewTabVirtualMemLimit value="80"/>
		</TabInstance>

		<Engine>
			<EngineInUse value="ENGINE_TO_USE"/>
			<EngineTimeout value="60000"/>
		</Engine>


		<UserData>
		</UserData>

		<Applications>
			<Application>

				<HTTP_Proxy value=""/>

				<General>
					<Name value="Menu"/>
					<StartPage value="SAP_SERVER_URL_GOES_HERE" name="Menu"/>
					<UseRegularExpressions value="1"/>
				</General>

				<Scanner>
					<DisableScannerDuringNavigation value="1"/>
				</Scanner>

				<WebDB>
					<WebStorageDBPath value="file://%INSTALLDIR%"/>
					<WebSQLDBQuota value="5000000"/>
					<WebSQLDBPath value="file://%INSTALLDIR%"/>
				</WebDB>
				<ApplicationCache>
					<ApplicationCachePath VALUE="file://%INSTALLDIR%"/>
					<ApplicationCacheQuota VALUE="5000000"/>
				</ApplicationCache>

				<NPAPI>
					<NPAPIDirectory value="file://%INSTALLDIR%/NPAPI/"/>
					<Preloads>
						<PreloadLegacyActiveX value="1"/>
						<PreloadLegacyGeneric value="1"/>
						<PreloadLegacyODAX    value="0"/>
						<PreloadLegacyNoSIP   value="1"/>
						<PreloadLegacyAirBeam value="0"/>
						<PreloadLegacyAPD     value="0"/>
						<PreloadJSObjects     value="1"/>
					</Preloads>
				</NPAPI>

				<Preloads>
					<Preload value="Hourglass"/>
					<Preload value="SIP"/>
					<Preload value="ScreenOrientation"/>
				</Preloads>

			<Scrolling>
			<ScrollTechnique VALUE="FingerScroll"/>
			</Scrolling>
			<!-- Authentication -->
			<!--  Used for Digest Access Authentication and Basic Access Authentication -->
			<!--  Global  -->
			<!--Username VALUE="user1"/ -->
			<!--Password VALUE="user1"/ -->
			<!--/Authentication -->

				<HTMLStyles>
					<FitToScreenEnabled    value="1" />
					<ClearTypeEnabled      value="1" />
					<JavascriptEnabled     value="1" />
					<TextSelectionEnabled  value="0" />
					<FontFamily            value="Droid Sans Fallback" />
				</HTMLStyles>

				<SIP>
					<ResizeOnSIP  value="0"/>
				</SIP>

				<System>
					<LowBatteryScan  value="0"/>
				</System>

				<Sound>
					<DecodeVolume           value="5"/>
					<DecodeFrequency        value="0xBB8"/>
					<InvalidDecodeFrequency value="0x9C4"/>
					<DecodeDuration         value="250"/>
					<ScanDecodeWav          value=""/>
					<ScanInvalidWav         value=""/>
					<ImagerCaptureWav       value=""/>
				</Sound>

				<GUI>
					<SignalRefresh      value="5000"/>
					<BatteryRefresh     value="5000"/>
					<HourglassEnabled   value="1" />
					<HourglassLeft      value="" />
					<HourglassTop       value="" />
				</GUI>

				<Navigation>
					<BadLinkURI value="file://%INSTALLDIR%/badlink.html"/>
					<UserAgent  value="Mozilla/5.0 (AndroidWebKit; U; /%p) AppleWebKit/%w (KHTML, like Gecko) Version/%e Mobile Safari/%w" />
					<NetworkCookieDatabase value="file://%INSTALLDIR%/cookies.db"/>
					<ViewportEnabled value="1"/>
					<VerifyPeerCertificate value="1"/>
					<!--ViewportWidth value="640"/-->
					<Cache      VALUE="5MB"/>
				</Navigation>


		<DeviceKeys>
					<EnableCtrlKey_A    value="1"/>
					<EnableCtrlKey_C    value="1"/>
					<EnableCtrlKey_V    value="1"/>
					<EnableCtrlKey_O    value="0"/>
					<EnableCtrlKey_P    value="0"/>
				</DeviceKeys>

				<DefaultMetaTags>
				</DefaultMetaTags>

			</Application>
		</Applications>
	</Configuration>

### Windows Mobile/CE With Internet Explorer Engine
Use the following [config.xml](https://s3.amazonaws.com/enterprise-browser/sapits/wmie/Config.xml) settings when your mobile device is Windows Mobile/CE and you have installed the Internet Explorer version of Enterprise Browser. Make sure to change the `StartPage` parameter to point to your SAP ITS Mobile server:

	:::xml
	<?xml version = "1.0"?>
	<!--
	Enterprise Browser Configuration file
	-->
	<Configuration>

		<DebugButtons>
			<DebugButtonsEnabled value="0" />
		</DebugButtons>

		<Logger>
			<LogProtocol   value="FILE"/>
			<LogPort       value="80"/>
			<LogURI        value="file://%INSTALLDIR%\Log.txt"/>
			<LogError      value="1"/>
			<LogWarning    value="1"/>
			<LogInfo       value="0"/>
			<LogUser       value="0"/>
			<LogMemory     value="0"/>
			<LogMemPeriod  value="5000"/>
			<LogMaxSize    value="1000"/>
		</Logger>

		<FileLocations>
			<RegEXFile  value="file://%INSTALLDIR%\Config\RegEx.xml"/>
			<PluginFile value="file://%INSTALLDIR%\Config\Plugin.xml"/>
		</FileLocations>

		<Screen>
			<FullScreen value="1"/>
			<PageZoom value="1.0" />
		</Screen>

		<VoidConnection>
			<TrackConnection value="0"/>
			<HostURL value="192.168.1.1"/>
			<Message value="Establishing Connection..."/>
			<Timeout value="30000"/>
			<PollInterval value="5000"/>
		</VoidConnection>

		<DeviceKeys>
			<FunctionKeysCapturable   value="1"/>
			<EnableFunctionKey_F1     value="1"/>
			<EnableFunctionKey_F2     value="1"/>
			<EnableFunctionKey_F3     value="1"/>
			<EnableFunctionKey_F4     value="1"/>
			<EnableFunctionKey_F5     value="1"/>
			<EnableFunctionKey_F6     value="1"/>
			<EnableFunctionKey_F7     value="1"/>
			<EnableFunctionKey_F8     value="1"/>
			<EnableFunctionKey_F9     value="1"/>
			<EnableFunctionKey_F10    value="1"/>
			<EnableFunctionKey_F11    value="1"/>
			<EnableFunctionKey_F12    value="1"/>
			<EnableApplicationKey_A1  value="0"/>
			<EnableApplicationKey_A2  value="0"/>
			<EnableApplicationKey_A3  value="0"/>
			<EnableApplicationKey_A4  value="0"/>
			<EnableApplicationKey_A5  value="0"/>
			<EnableApplicationKey_A6  value="0"/>
			<EnableApplicationKey_A7  value="0"/>
			<EnableApplicationKey_A8  value="0"/>
		</DeviceKeys>

		<Navigation>
			<NavTimeout value="45000"/>
		</Navigation>

		<Geolocation>
			<GeolocationEnabled value="1"/>
		</Geolocation>

		<ScreenOrientation>
			<AutoRotate value="1" />
		</ScreenOrientation>

	 <TabInstance>
			<NewTabPhysicalMemLimit value="100"/>
			<NewTabVirtualMemLimit value="100"/>
		</TabInstance>

		<Engine>
			<EngineInUse value="IE"/>
		</Engine>


		<UserData>
		</UserData>

		<Applications>
			<Application>

				<HTTP_Proxy value=""/>

				<General>
					<Name value="Menu"/>
					<StartPage value="SAP_SERVER_URL_GOES_HERE" name="Menu"/>
					<UseRegularExpressions value="1"/>
				</General>

				<Scanner>
					<DisableScannerDuringNavigation value="1"/>
				</Scanner>

				<WebDB>
					<WebStorageDBPath value="file://%INSTALLDIR%"/>
					<WebSQLDBQuota value="5000000"/>
					<WebSQLDBPath value="file://%INSTALLDIR%"/>
				</WebDB>
				<ApplicationCache>
					<ApplicationCachePath VALUE="file://%INSTALLDIR%"/>
					<ApplicationCacheQuota VALUE="5000000"/>
				</ApplicationCache>

				<NPAPI>
					<NPAPIDirectory value="file://%INSTALLDIR%\NPAPI\"/>
					<Preloads>
						<PreloadLegacyActiveX value="1"/>
						<PreloadLegacyGeneric value="1"/>
						<PreloadLegacyODAX    value="0"/>
						<PreloadLegacyNoSIP   value="1"/>
						<PreloadLegacyAirBeam value="0"/>
						<PreloadLegacyAPD     value="0"/>
						<PreloadJSObjects     value="1"/>
					</Preloads>
				</NPAPI>

				<Preloads>
					<!--Preload value="Hourglass"/-->
					<Preload value="SIP"/>
					<!--Preload value="ScreenOrientation"/-->
				</Preloads>

			<Scrolling>
			<ScrollTechnique VALUE="FingerScroll"/>
			</Scrolling>
			<!-- Authentication -->
			<!--  Used for Digest Access Authentication and Basic Access Authentication -->
			<!--  Global  -->
			<!--Username VALUE="user1"/ -->
			<!--Password VALUE="user1"/ -->
			<!--/Authentication -->

				<HTMLStyles>
					<FitToScreenEnabled    value="1" />
					<ClearTypeEnabled      value="1" />
					<JavascriptEnabled     value="1" />
					<TextSelectionEnabled  value="0" />
					<FontFamily            value="Tahoma" />
				</HTMLStyles>

				<SIP>
					<ResizeOnSIP  value="0"/>
				</SIP>

				<System>
					<LowBatteryScan  value="0"/>
				</System>

				<Sound>
					<DecodeVolume           value="5"/>
					<DecodeFrequency        value="0xBB8"/>
					<InvalidDecodeFrequency value="0x9C4"/>
					<DecodeDuration         value="250"/>
					<ScanDecodeWav          value=""/>
					<ScanInvalidWav         value=""/>
					<ImagerCaptureWav       value=""/>
				</Sound>

				<GUI>
					<SignalRefresh      value="5000"/>
					<BatteryRefresh     value="5000"/>
					<HourglassEnabled   value="0" />
					<HourglassLeft      value="" />
					<HourglassTop       value="" />
				</GUI>

				<Navigation>
					<BadLinkURI value="file://%INSTALLDIR%\HTML\BadLink.html"/>
					<UserAgent  value="Mozilla/5.0 (WebKit; U; /%p) AppleWebKit/%w (KHTML, like Gecko) Version/%e Mobile Safari/%w" />
					<NetworkCookieDatabase value="file://%INSTALLDIR%\cookies.db"/>
					<ViewportEnabled value="1"/>
					<VerifyPeerCertificate value="1"/>
					<!--ViewportWidth value="640"/-->
					<Cache      VALUE="5MB"/>
				</Navigation>


		<DeviceKeys>
					<EnableCtrlKey_A    value="1"/>
					<EnableCtrlKey_C    value="1"/>
					<EnableCtrlKey_V    value="1"/>
					<EnableCtrlKey_O    value="0"/>
					<EnableCtrlKey_P    value="0"/>
				</DeviceKeys>

				<DefaultMetaTags>
				</DefaultMetaTags>

			</Application>
		</Applications>
	</Configuration>

### Android
Use the following [config.xml](https://s3.amazonaws.com/enterprise-browser/sapits/wmie/Config.xml) settings when your mobile device is Android. Make sure to change the `StartPage` parameter to point to your SAP ITS Mobile server:

	:::xml
	<?xml version = "1.0"?>
	<!--
	Enterprise Browser Configuration file
	-->
	<Configuration>

		<DebugButtons>
			<DebugButtonsEnabled value="0" />
		</DebugButtons>

		<Logger>
			<LogProtocol   value="FILE"/>
			<LogPort       value="80"/>
			<LogURI        value="file://%INSTALLDIR%/Log.txt"/>
			<LogError      value="1"/>
			<LogWarning    value="1"/>
			<LogInfo       value="0"/>
			<LogUser       value="0"/>
			<LogMemory     value="0"/>
			<LogMemPeriod  value="5000"/>
			<LogMaxSize    value="1000"/>
		</Logger>

		<FileLocations>
			<RegEXFile  value="file://%INSTALLDIR%/RegEx.xml"/>
		</FileLocations>

		<Screen>
			<FullScreen value="1"/>
			<PageZoom value="1.0" />
		</Screen>

		<VoidConnection>
			<TrackConnection value="0"/>
			<HostURL value="192.168.1.1"/>
			<Message value="Establishing Connection..."/>
			<Timeout value="30000"/>
			<PollInterval value="5000"/>
		</VoidConnection>

		<DeviceKeys>
			<FunctionKeysCapturable   value="1"/>
			<EnableFunctionKey_F1     value="1"/>
			<EnableFunctionKey_F2     value="1"/>
			<EnableFunctionKey_F3     value="1"/>
			<EnableFunctionKey_F4     value="1"/>
			<EnableFunctionKey_F5     value="1"/>
			<EnableFunctionKey_F6     value="1"/>
			<EnableFunctionKey_F7     value="1"/>
			<EnableFunctionKey_F8     value="1"/>
			<EnableFunctionKey_F9     value="1"/>
			<EnableFunctionKey_F10    value="1"/>
			<EnableFunctionKey_F11    value="1"/>
			<EnableFunctionKey_F12    value="1"/>
			<EnableApplicationKey_A1  value="0"/>
			<EnableApplicationKey_A2  value="0"/>
			<EnableApplicationKey_A3  value="0"/>
			<EnableApplicationKey_A4  value="0"/>
			<EnableApplicationKey_A5  value="0"/>
			<EnableApplicationKey_A6  value="0"/>
			<EnableApplicationKey_A7  value="0"/>
			<EnableApplicationKey_A8  value="0"/>
		</DeviceKeys>

		<Navigation>
			<NavTimeout value="45000"/>
		</Navigation>

		<Geolocation>
			<GeolocationEnabled value="1"/>
		</Geolocation>

		<ScreenOrientation>
			<AutoRotate value="0" />
		</ScreenOrientation>

		<TabInstance>
			<NewTabPhysicalMemLimit value="90"/>
			<NewTabVirtualMemLimit value="80"/>
		</TabInstance>

		<Engine>
			<EngineInUse value="Android Stock"/>
			<EngineTimeout value="60000"/>
		</Engine>

		<UserData>
		</UserData>

		<Applications>
			<Application>

				<HTTP_Proxy value=""/>

				<General>
					<Name value="Menu"/>
					<StartPage value="file://%INSTALLDIR%/menu.html" name="Menu"/>
					<UseRegularExpressions value="1"/>
				</General>

				<Scanner>
					<DisableScannerDuringNavigation value="1"/>
				</Scanner>

				<WebDB>
					<WebStorageDBPath value="file://%INSTALLDIR%"/>
					<WebSQLDBQuota value="5000000"/>
					<WebSQLDBPath value="file://%INSTALLDIR%"/>
				</WebDB>
				<ApplicationCache>
					<ApplicationCachePath VALUE="file://%INSTALLDIR%"/>
					<ApplicationCacheQuota VALUE="5000000"/>
				</ApplicationCache>

				<NPAPI>
					<NPAPIDirectory value="file://%INSTALLDIR%/NPAPI/"/>
					<Preloads>
						<PreloadLegacyActiveX value="1"/>
						<PreloadLegacyGeneric value="1"/>
						<PreloadLegacyODAX    value="0"/>
						<PreloadLegacyNoSIP   value="1"/>
						<PreloadLegacyAirBeam value="0"/>
						<PreloadLegacyAPD     value="0"/>
						<PreloadJSObjects     value="1"/>
					</Preloads>
				</NPAPI>

				<Preloads>
					<!--Preload value="Hourglass"/-->
					<Preload value="SIP"/>
					<!--Preload value="ScreenOrientation"/-->
				</Preloads>

			<Scrolling>
			<ScrollTechnique VALUE="FingerScroll"/>
			</Scrolling>
			<!-- Authentication -->
			<!--  Used for Digest Access Authentication and Basic Access Authentication -->
			<!--  Global  -->
			<!--Username VALUE="user1"/ -->
			<!--Password VALUE="user1"/ -->
			<!--/Authentication -->

				<HTMLStyles>
					<FitToScreenEnabled    value="1" />
					<ClearTypeEnabled      value="1" />
					<JavascriptEnabled     value="1" />
					<TextSelectionEnabled  value="0" />
					<FontFamily            value="Droid Sans Fallback" />
				</HTMLStyles>

				<SIP>
					<ResizeOnSIP  value="0"/>
				</SIP>

				<System>
					<LowBatteryScan  value="0"/>
				</System>

				<Sound>
					<DecodeVolume           value="5"/>
					<DecodeFrequency        value="0xBB8"/>
					<InvalidDecodeFrequency value="0x9C4"/>
					<DecodeDuration         value="250"/>
					<ScanDecodeWav          value=""/>
					<ScanInvalidWav         value=""/>
					<ImagerCaptureWav       value=""/>
				</Sound>

				<GUI>
					<SignalRefresh      value="5000"/>
					<BatteryRefresh     value="5000"/>
					<HourglassEnabled   value="0" />
					<HourglassLeft      value="" />
					<HourglassTop       value="" />
				</GUI>

				<Navigation>
					<BadLinkURI value="file://%INSTALLDIR%/badlink.html"/>
					<UserAgent  value="Mozilla/5.0 (AndroidWebKit; U; /%p) AppleWebKit/%w (KHTML, like Gecko) Version/%e Mobile Safari/%w" />
					<NetworkCookieDatabase value="file://%INSTALLDIR%/cookies.db"/>
					<ViewportEnabled value="1"/>
					<VerifyPeerCertificate value="1"/>
					<!--ViewportWidth value="640"/-->
					<Cache      VALUE="5MB"/>
				</Navigation>

		<DeviceKeys>
					<EnableCtrlKey_A    value="1"/>
					<EnableCtrlKey_C    value="1"/>
					<EnableCtrlKey_V    value="1"/>
					<EnableCtrlKey_O    value="0"/>
					<EnableCtrlKey_P    value="0"/>
				</DeviceKeys>

				<DefaultMetaTags>
				</DefaultMetaTags>

			</Application>
		</Applications>
	</Configuration>