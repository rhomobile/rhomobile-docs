
#Scanner Module

<b>
The Scanner Module provides access to control the functionality of the device's scanner.
</b>

##Syntax

<table class="re-table"><tr><th class="tableHeading">scanner (Module) &lt;META&gt; Syntax
</th></tr><tr><td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="Scanner" content="[parameter / method]"&gt;</p></td></tr><tr><td class="clsSyntaxCells clsEvenRow"><p>&lt;META HTTP-Equiv="Scanner" content="DecodeEvent:url('[jsFunction | url]')"&gt;</p></td></tr></table>
<table class="re-table"><tr><th class="tableHeading">Scanner JavaScript Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the JavaScript Object <b>'scanner'</b> will exist on the current page and can be used to interact directly with the scanner.
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Invoke scanner methods via JavaScript use the following syntax: scanner.method();
<P />e.g. <b>scanner</b>.enumerate();
</td></tr><tr><td class="clsSyntaxCells clsOddRow">
To Set scanner parameters via JavaScript use the following syntax: scanner.parameter = 'value'; remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>scanner</b>.enabled = 'value';
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">						
To Set scanner return events via JavaScript use the following syntax: scanner.event = Javascript Function;
<P />e.g. <b>scanner</b>.decodeEvent = 'doFunction(%json)';
<P />
For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents">Retrieval Events</a> page.

</td></tr><tr><td class="clsSyntaxCells clsOddRow">							
To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: scanner.setEMML("[Your EMML Tags]");
<P />
e.g. <b>scanner</b>.setEMML("enabled:<i>value</i>;decodeEvent:url('JavaScript:doFunction(%json)');enumerate");							
</td></tr></table>

<table class="re-table"><tr><th class="tableHeading">Scanner Ruby Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the Ruby Object <b>'Scanner'</b> will exist on the current page and can be used to interact directly with the Scanner. All Methods, Parameters and Events are the same as Javascript, however, notice <b>'Scanner'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b></td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Invoke Scanner methods via Ruby use the following syntax: Scanner.method()
<P />e.g. <b>Scanner</b>.enumerate</td></tr><tr><td class="clsSyntaxCells clsOddRow">
To Set Scanner parameters via Ruby use the following syntax: Scanner.parameter = 'value' remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>Scanner</b>.enabled = 'value'
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">						
To Set Scanner return events via Ruby use the following syntax: Scanner.event = url_for(:action =&gt; :event_callback) 
<P />e.g. <b>Scanner</b>.decodeEvent = url_for(:action =&gt; :scanner_event_callback)
<P />
For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents#params-object">Retrieval Events</a> page.
<p>To access the event parameters in a Ruby callback function, you reference the @params object within the callback function. This object is simply a ruby hash {"parameter1 name" =&gt; "parameter1 value", "parameter2 name" =&gt; "parameter2 value", ...}</p></td></tr><tr><td class="clsSyntaxCells clsOddRow" /></tr></table>


	

##Methods


Items listed in this section indicate methods or, in some cases, indicate parameters which will be retrieved.

<table class="re-table"><col width="10%" /><col width="68%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>enumerate</b></td><td class="clsSyntaxCells clsOddRow">Return a list of scanners present on the device via EnumScannerEvent.  This tag will be actioned immediately and should be called via JavaScript.</td><td class="clsSyntaxCells clsOddRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>enable</b></td><td class="clsSyntaxCells clsEvenRow">Enables the default scanner if no scanner is currently enabled. Note: Enabling a scanner without setting decoders will result in some default decoders enabled. If decoders have been set and then disabled has been called, the required decoder settings should be reapplied.</td><td class="clsSyntaxCells clsEvenRow">Device specific</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>disable</b></td><td class="clsSyntaxCells clsOddRow">Disables the currently enabled scanner.  This reverts the scanner to its default state and flushes any current decoder settings.</td><td class="clsSyntaxCells clsOddRow">Device specific</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>start</b></td><td class="clsSyntaxCells clsEvenRow">Performs a soft trigger start.  If the scan does not result in a decode it is necessary to perform a soft stop before another soft start.</td><td class="clsSyntaxCells clsEvenRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>stop</b></td><td class="clsSyntaxCells clsOddRow">Performs a soft trigger stop</td><td class="clsSyntaxCells clsOddRow">
N/A
</td></tr></table>


##Parameters


Items listed in this section indicate parameters, or attributes which can be set.
<table class="re-table"><col width="20%" /><col width="20%" /><col width="38%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Description</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>enabled:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Enables the specified scanner.  The non-default scanner should only be used on licensed devices.<br /><br /><b>Possible Values:ID of Scanner, obtained via EnumScanner</b><br /><br /><i>Default: SCN1</i></td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>[Decoder Name]:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Sets each Decoders' parameters.  Refer to the "Decoders" Section of this help file to know available decoders and Their Parameters.<br /><br /><b>Possible Values:Decoder Property</b><br /><br /><i>Default: Refer to the "Decoders" Section</i></td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>autoEnter:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">If "enabled" then automatically append an Enter to the end of any barcodes scanned.  This feature is only available when a decodeEvent is not specified and is useful for submitting forms.  See Remarks.<br /><br /><b>Possible Values:'enabled' / 'disabled'</b><br /><br /><i>Default: 'Disabled'</i></td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>autoTab:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">If "enabled" then automatically appends a Tab to the end of any barcodes scanned.  This feature is only available when a decodeEvent is not specified and is useful for advancing to the next input field.  See Remarks.<br /><br /><b>Possible Values:'enabled' / 'disabled'</b><br /><br /><i>Default: Disabled</i></td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>linearSecurityLevel:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Describes the linear security level used during decoding.  
<DESCDETAIL>
 <br /><b>Possible values:</b>
<br /><b>redundancyAndLength:</b>
  Two times redundancy based on redundancy flags and code length.
 <br /><b>shortOrCodabar:</b>
  Two times redundancy if short barcode or Codabar.
 <br /><b>longAndShort:</b>
  Two times redundancy for long barcodes, three times for short barcodes.
 <br /><b>allTwice:</b>
  Two times redundancy for all barcodes.  
 <br /><b>allThrice:</b>
  Three times redundancy for all barcodes.</DESCDETAIL><i>Applicable scanner types: Laser and Imager / Camera</i><br /><i>Default: Device specific</i></td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>scanTimeout:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Maximum time in milliseconds that laser scanners will emit a beam or imager scanners will enable the imager.  A value of 0 indicates an infinite timeout.  This parameter is compatibile with aimType:trigger, aimType:timedHold, aimType:timedRelease and aimType:pressAndRelease.  Note that for regulatory reasons scanTimeout is not configurable on all laser/imager scanners.<br /><br /><b>Possible Values:milliseconds</b><br /><i>Applicable scanner types: Laser and Imager / Camera</i><br /><i>Default: 5000 (Laser), 15000 (Imager)</i></td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>rasterMode:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Describes the type of vertical rastering to use.  This is not supported on Android.
<DESCDETAIL>
 <br /><b>Possible values:</b>
<br /><b>none:</b>
  No vertical rastering.
 <br /><b>openAlways:</b>
  Vertical rastering is always full open.  To adjust the rastering height use the rasterHeight property.
<br /><b>smart:</b>
  Vertical rastering mode is 'Smart'.
 <br /><b>cyclone:</b>
  Vertical rastering mode is 'Cyclone'.</DESCDETAIL><i>Applicable scanner types: Laser Only</i><br /><i>Default: Device specific</i></td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>rasterHeight:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Vertical rastering height to use, as a percentage, when rasterMode:openAlways is applied.<br /><br /><b>Possible Values:0 - 100</b><br /><i>Applicable scanner types: Laser Only</i><br /><i>Default: Device specific</i></td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>aimType:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Describes the type of aiming to use.  This is not supported on Android. 
<DESCDETAIL>
 <br /><b>Possible values:</b>
 <br /><b>trigger:</b>
  Standard trigger mode.  Holding the trigger will start a decoding session.  
  The decoding session ends when a barcode is decoded, scanTimeout occurs or the trigger is released.
 <br /><b>timedHold:</b>
  Aiming lasts for the time specified by 'timedAimDuration' before decoding.  
  The decode will last until the barcode is decoded or scanTimeout occurs.
 <br /><b>timedRelease:</b>
  Aiming lasts until trigger is released.  
  If the timedAimDuration has expired when the trigger is released then a decode session is started
  until a barcode is decoded or for the remaining time equal to the scanTimeout value.
 <br /><b>presentation:</b>
  Provided to support Kiosk devices.  The scanner illuminates when movement is detected in the range
  of the scanner window.  In order to use this mode the scanner must be initiated with a softscan
  using the scanner.start() method and again after each decode.  The device must be equipped with a 
  sensor to detect movement to use presentation mode.  See examples below.  
 <br /><b>pressAndRelease:</b>
  Scan will continue after the trigger is released until scanTimeout occurs.
 <br /><b>continuousRead:</b>	
  Once the trigger is pulled barcodes will continue to be scanned whilst the trigger
  is held, enabling rapid scanning, to be used in conjunction with sameSymbolTimeout 
  and differentSymbolTimeout.  This value is ignored if viewfinderMode is set to 
  'dynamicReticle'</DESCDETAIL><i>Applicable scanner types: Laser and Imager / Camera</i><br /><i>Default: Device specific</i></td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>timedAimDuration:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Duration in milliseconds for aimType:timedHold and aimType:timedRelease<br /><br /><b>Possible Values:milliseconds</b><br /><i>Applicable scanner types: Laser and Imager / Camera</i><br /><i>Default: Device specific</i></td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>sameSymbolTimeout:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">When the aimType:continuousRead property is applied this value defines the interval between which the same barcode can be decoded twice.  The value is specified in milliseconds, use 0 to indicate no interval between successive reads.  Use this value to prevent accidental duplicate scans.<br /><br /><b>Possible Values:milliseconds</b><br /><i>Applicable scanner types: Laser and Imager / Camera</i><br /><i>Default: 2500</i></td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>differentSymbolTimeout:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">When the aimType:continuousRead property is applied this value defines the interval between which different barcodes can be scanned.  The value is specified in milliseconds, use 0 to indicate no interval between successive reads.  Use this setting to allow time for the operator to reaim the device between successive scans.<br /><br /><b>Possible Values:milliseconds</b><br /><i>Applicable scanner types: Laser and Imager / Camera</i><br /><i>Default: 500</i></td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>aimMode:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Describes the aiming mode to used.  
<DESCDETAIL>
<br /><b>Possible values:</b>
<br /><b>none:</b>
  No Aiming (Can be overridden by picklistMode).  
<br /><b>dot:</b>
  Laser barcode readers will show a dot for aiming.
<br /><b>slab:</b>
  Laser barcode readers will show a slab for aiming.
<br /><b>reticle:</b>
  Imager barcode readers will show a reticle for aiming</DESCDETAIL><i>Applicable scanner types: Laser and Imager / Camera</i><br /><i>Default: Device specific</i></td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>picklistMode:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Allows the imager to decode only the barcode that is directly under the cross-hair on Android and center of the reticle on WM/CE.  This feature is most useful in applications where multiple barcodes may appear in the field of view during a decode session and only one of them is targeted for decode.  When enabled picklistMode will override aimMode if no aiming is chosen and use aimMode:reticle.  This mode will also interact with viewfinderMode, see the EMDK for C help file for more information.  Enabling picklist mode may adversely affect overall decoding performance.  
<DESCDETAIL>
<br /><b>Possible values:</b>
<br /><b>disabled:</b>
  Disables picklist mode so any barcode within the field of view can be decoded.
<br /><b>hardwareReticle:</b> (<i>not available on Enterprise Tablet</i>)
  Enables picklist mode so that only the barcode under the projected reticle can 
  be decoded.  If the imager does not support a projected reticle then the 
  behaviour is the same as softwareReticle.
<br /><b>softwareReticle:</b>
  Enables picklist mode so that only the barcode in the center of the image is 
  decoded on WM/CE and under the cross-hair on Android.  This is most useful when used in conjunction with static and 
  dynamic reticle viewfinder modes.</DESCDETAIL><i>Applicable scanner types: Imager / Camera Only</i><br /><i>Default: Device specific</i></td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>viewfinderMode:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Configures the mode of the scanner viewfinder window.  This attribute is not supported on all Scanners and will interact with the picklistMode parameter, see the EMDK for C help file for more information.    
<DESCDETAIL>
<br /><b>Possible values:</b>
<br /><b>enabled:</b>
  Only the viewfinder is enabled (not the reticle).  Displays a viewfinder on the
  screen showing the image being captured by the camera.
<br /><b>disabled:</b> (<i>not available on Enterprise Tablet</i>)
  The viewfinder will not be displayed during aiming or scanning.
<br /><b>staticReticle:</b>
  Displays the viewfinder as well as draws a red reticle in the center of the image
  which helps with tracking the barcode.
<br /><b>dynamicReticle:</b> (<i>not available on Enterprise Tablet</i>)
  Displays the viewfinder as well as draws a red reticle in the center of the image.
  If the barcode in the image is 'decodable' the reticle turns green to indicate
  this.  This mode requires a second trigger press to decode the barcode after the
  reticle turns green.</DESCDETAIL><i>Applicable scanner types: Camera Only</i><br /><i>Default: Device specific</i></td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>viewfinderX:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">When scanning a barcode using an imager scanner the viewfinder preview window will appear this number of pixels from the left hand side of the screen.  The images displayed in the viewfinder will be scaled as appropriate.<br /><br /><b>Possible Values:pixels</b><br /><i>Applicable scanner types: Camera Only</i><br /><i>Default: Device specific</i></td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>viewfinderY:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">When scanning a barcode using an imager scanner the viewfinder preview window will appear this number of pixels from the top of the screen.  The images displayed in the viewfinder will be scaled as appropriate.<br /><br /><b>Possible Values:pixels</b><br /><i>Applicable scanner types: Camera Only</i><br /><i>Default: Device specific</i></td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>viewfinderWidth:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">When scanning a barcode using an imager scanner the viewfinder preview window will be this number of pixels wide.  The images displayed in the viewfinder will be scaled as appropriate.<br /><br /><b>Possible Values:pixels</b><br /><i>Applicable scanner types: Camera Only</i><br /><i>Default: Device specific</i></td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>viewfinderHeight:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">When scanning a barcode using an imager scanner the viewfinder preview window will be this number of pixels high.  The images displayed in the viewfinder will be scaled as appropriate.<br /><br /><b>Possible Values:pixels</b><br /><i>Applicable scanner types: Camera Only</i><br /><i>Default: Device specific</i></td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>viewfinderFeedback:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Configures the feedback given after a successful scan in milliseconds.  This value is ignored if aimType is set to continuousRead and no feedback will be given.  
<DESCDETAIL>
<br /><b>Possible values:</b>
<br /><b>disabled:</b>
  No feedback is given after a successful decode.
<br /><b>enabled:</b>
  The last image that was successfully decoded is displayed.  The time for which
  the image is displayed can be configured by the viewfinderFeedbackTime parameter.
<br /><b>reticle:</b>
  The last image that was successfully decoded is displayed along with a red reticle 
  in the center of the image.  The time for which the image is displayed can be 
  configured by the viewfinderFeedbackTime parameter.</DESCDETAIL><i>Applicable scanner types: Camera Only</i><br /><i>Default: Device specific</i></td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>viewfinderFeedbackTime:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">If the viewfinderFeedback:enabled or viewfinderFeedback:reticle are applied then the decoded barcode will remain on the screen for this duration.<br /><br /><b>Possible Values:milliseconds</b><br /><i>Applicable scanner types: Camera Only</i><br /><i>Default: Device specific</i></td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>focusMode:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Sets the focus mode in use.  
<DESCDETAIL>
<br /><b>Possible values:</b>
<br /><b>fixed:</b>
  Use fixed focus.
<br /><b>auto:</b>
  Use auto focus.</DESCDETAIL><i>Applicable scanner types: Imager / Camera Only</i><br /><i>Default: Device specific</i></td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>illuminationMode:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Selects the illumination mode to use. This parameter is not currently supported on Android (illumination is always on).  
<DESCDETAIL>
<br /><b>Possible values:</b>
<br /><b>auto:</b>(<i>not available on Enterprise Tablet</i>)
  Auto-exposure algorithms will decide whether illumination is required.
<br /><b>alwaysOn:</b>
  External illumination is always on.
<br /><b>alwaysOff:</b>
  External illumination is always off.
<br /><b>Note:</b> On Enterprise Tablet for Camera scanners this setting has to be enabled/disabled before starting the scanner.</DESCDETAIL><i>Applicable scanner types: Imager / Camera Only</i><br /><i>Default: Device specific</i></td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>dpmMode:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Allows Direct Part Marking (DPM) barcodes to be read when true but may adversely affect overall decoding performance.  DPM is a way of stamping barcodes directly on physical objects and is only available on DPM terminals.<br /><br /><b>Possible Values:true / false</b><br /><i>Applicable scanner types: Imager / Camera Only</i><br /><i>Default: Device specific</i></td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>inverse1dMode:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Allows the user to select inverse 1D barcodes for decoding.  
<DESCDETAIL>
<br /><b>Possible values:</b>
<br /><b>enabled:</b>
  Inverse 1D symbology decoding is enabled.
<br /><b>disabled:</b>
  Inverse 1D symbology decoding is disabled.
<br /><b>auto:</b>  
  Allows decoding of both positive and inverse 1D symbologies</DESCDETAIL><i>Applicable scanner types: Imager / Camera Only and a scanning engine which supports Inverse barcodes.</i><br /><i>Default: Device specific</i></td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>poorQuality1dMode:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Allows poor quality 1D barcodes to be read when true but this will adversely affect the overall decoding performance.<br /><br /><b>Possible Values:true / false</b><br /><i>Applicable scanner types: Imager / Camera Only</i><br /><i>Default: Device specific</i></td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>beamWidth:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Specifies the width of the laser beam.<br /><br /><b>Possible Values:normal / narrow / wide</b><br /><i>Applicable scanner types: Laser Only</i><br /><i>Default: Device specific</i></td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>dbpMode:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Describes the type of Digital Bar Pulse (DBP) being produced by the scan engine.  
<DESCDETAIL>
<br /><b>Possible values:</b>
<br /><b>normal:</b>
  Tells the engine to produce normal DBP.
<br /><b>composite:</b>
  Tells the engine to produce composite DBP, which is 2 different sets of DBP data 
  multiplexed together for better decode performance.  In order to enable this mode 
  it must be supported by the scanner.</DESCDETAIL><i>Applicable scanner types: Laser Only</i><br /><i>Default: Device specific</i></td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>klasseEins:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Enables or disables the Klasse Eins laser on time function.<br /><br /><b>Possible Values:true / false</b><br /><i>Applicable scanner types: Laser Only</i><br /><i>Default: Device specific</i></td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>adaptiveScanning:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Enables or disables adaptive scanning.  When set to true, the scan engine will automatically toggle between 2 scan angles, wide and narrow, allowing the scan engine to decode barcodes both in close proximity and far away (~100 inches).  Adaptive scanning is only supported in high performance, long working range scan engines such as SE960.<br /><br /><b>Possible Values:true / false</b><br /><i>Applicable scanner types: Laser Only</i><br /><i>Default: Device specific</i></td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>bidirectionalRedundancy:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Enables or disables bidirectional redundancy.<br /><br /><b>Possible Values:true / false</b><br /><i>Applicable scanner types: Laser Only</i><br /><i>Default: Device specific</i></td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>barcodeDataFormat:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Specifies the format in which the barcode data is returned, binary data is returned in Data URI format with the appropriate mime type.  This parameter is designed to be used primarily with image based symbologies (eg. Signature).  Binary data will not be output as keystrokes, you must set a decodeEvent in order to receive scanned data.<br /><br /><b>Possible Values:text / binary</b><br /><i>Applicable scanner types: Imager Only</i><br /><i>Default: Text</i></td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>dataBufferSize:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Specifies the number of bytes allocated to receive the scanned barcode.  This parameter is designed to be used primarily with image based symbologies and should not be modified unless absolutely necessary (eg. Signature).<br /><br /><b>Possible Values:Number</b><br /><i>Applicable scanner types: All</i><br /><i>Default: 2500 bytes</i></td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>connectionIdleTimeout:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Specifies the time, in seconds, that an external scanner will be allowed to remain idle before the connection is terminated to conserve power.<br /><br /><b>Possible Values:seconds</b><br /><i>Applicable scanner types: Bluetooth Only</i><br /><i>Default: Device specific</i></td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>disconnectBtOnDisable:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Forces the scanner to disconnect from the terminal when it is 'disabled'.  Since the scanner is disabled when you navigate to a new page, set this value to false if you want to maintain the bluetooth connection to your remote scanner.<br /><br /><b>Possible Values:true / false</b><br /><i>Applicable scanner types: Bluetooth Only</i><br /><i>Default: Device specific</i></td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>displayBtAddressBarcodeOnEnable:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">If set to true the bluetooth address will be displayed as a barcode on the screen during the pairing process, initiated by calling 'enable' on a bluetooth scanner.  Not all devices support this functionality.  Note you must specify this parameter before calling 'enable'.<br /><br /><b>Possible Values:true / false</b><br /><i>Applicable scanner types: Bluetooth Only</i><br /><i>Default: Device specific</i></td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>enableTimeout:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Configures the time (in seconds) allowed to pair with the external bluetooth scanner after calling the 'enable()' method.  You must specify this parameter before calling 'enable'.<br /><br /><b>Possible Values:seconds</b><br /><i>Applicable scanner types: Bluetooth Only</i><br /><i>Default: Device specific</i></td></tr></table>
<table class="re-table"><col width="78%" /><col width="8%" /><col width="1%" /><col width="5%" /><col width="1%" /><col width="5%" /><col width="2%" /></table>	

##Events


Values are returned to the caller in RhoElements via Events.  Most modules contain events and those returned from this module are given below along with the event parameters.  Events can cause a navigation to a new URL or a Javascript function on the page to be invoked.  Each event will in most cases have a number of parameters associated with it which will either be strings or javascript arrays.  Event parameters can be accessed either directly or via JSON objects.

<br />
###decodeEvent
A decode event is sent by the Scanner whenever a barcode is decoded.
<table class="re-table"><col width="3%" /><col width="20%" /><col width="77%" /><tr><th class="tableHeading">ID</th><th class="tableHeading">Name</th><th class="tableHeading">Description</th></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">1</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>data</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">The data decoded by the scanner or imaging device</td></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">2</td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>source</b></td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">The source device and human readable decoder type of the decoded barcode or symbol</td></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">3</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>type</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">Hex value representing the decoder type</td></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">4</td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>time</b></td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">The time at which the decode occurred (hh:mm:ss)</td></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">5</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>length</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">The length of the decoded barcode or symbol</td></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">6</td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>event</b></td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">The type of event which has occurred at the scanner.  This field will be either 'Decode' for barcode scanning or a message from a Bluetooth scanner.  See Remarks</td></tr></table>
<br />
###bluetoothStatusEvent
A bluetoothStatusEvent is sent whenever a bluetooth connection / disconnection event occurs. If you are connected to a bluetooth scanner and have not registered to receive this event the status message will be sent as the sixth return value of the decodeEvent.
<table class="re-table"><col width="3%" /><col width="20%" /><col width="77%" /><tr><th class="tableHeading">ID</th><th class="tableHeading">Name</th><th class="tableHeading">Description</th></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">1</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>status</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">The message describing the bluetooth connection, see remarks.</td></tr></table>
<br />
###enumScannerEvent
The Enum Scanner Event is used to ascertain the scanners present on the device.
<table class="re-table"><col width="3%" /><col width="20%" /><col width="77%" /><tr><th class="tableHeading">ID</th><th class="tableHeading">Name</th><th class="tableHeading">Description</th></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">1</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>scannerArray (deviceName, friendlyName)</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">2 dimensional array of scanners present on the device.  See remarks.</td></tr></table>



##Multi Instance
When multiple RhoElememts applications are running the following considerations should be made: Only the foreground RhoElements application is given access to the device scanner, when an application is sent to the background its state will be saved and it will automatically relinquish control of the Scanner.  When brought back to the foreground, an application previously using the scanner will have its previous configuration (eg. selected decoders) reapplied to the scanner automatically.


##Remarks


###General
If the Scanner Meta Tag is used without DecodeEvent, the data will be output as keystrokes. On unlicensed devices it is not recommended to enable the Scanner on the application's startup page, this can interfere with the the license screen.


###Use Meta Tags Instead of Scanner Object
Prefer Meta Tags instead of Scanner Object, if an application is designed to perform continuos scanning on reload of the page with certain properties(exposed by scanner object).


###Scanning and Image Capture Interaction
In some device configurations the scanner and imager share the same hardware, e.g. the blockbuster scanner and top mounted imager on the MC75a. Where two modules share the same physical hardware they cannot be enabled simultaneously, once the scanner is enabled it must be disabled before the imager can be used, and vice versa.


###AutoEnter and AutoTab
AutoEnter and AutoTab are mutually exclusive, only one can be enabled at any one time. If both are enabled then AutoEnter will take priority.


###Bluetooth Scanner Overview
Once associated with the Device a Bluetooth Scanner will remain associated even after losing the BT connection. In order to associate a different Bluetooth scanner with the device it is necessary to scan the 'unpairing' barcode and then invoke the 'disabled' meta tag followed by the 'enabled' meta tag, this will allow you to scan the BT association barcode with a different scanner. You can override this default behaviour using the disconnectBtOnDisable parameter.

<pre>

The following messages will be received from the Bluetooth Scanner in the bluetoothStatus event:

* 'BTScanAssociationBarcode' 
   Means the device is ready to be associated with a BT scanner.  You must scan the 
   association barcode.  It is only necessary to scan the association 
   barcode when you first associate a scanner with the device, this pairing will be remembered until
   you scan the unpairing barcode.

* 'BluetoothConnected'
   The remote scanner has successfully connected to the device.
	
* 'BluetoothDisconnected'
   The remote scanner has become disconnected from the device, this may be due to loss of battery, being out
   of range or scanning the 'unpairing' barcode.  The scanner will attempt to reconnect automatically for
   a period of time once it regains power or goes out of range, if it fails to reconnect after the specified
   timeout the reconnect button on the device should be pushed.  Once the unpairing barcode is scanned
   it is necessary to disable the scanner and then re-enable it before another scanner can be associated.
</pre>


###ScannerArray attribute
The ScannerArray attribute returned from Scanner tag with parameter "EnumScannerEvent" will enumerate each scanner present on the device in a 2D array, associating each scanner's device name with a user friendly name. The device ID can be passed as a parameter to "Scanner" "Enabled:&lt;deviceID&gt;", the friendly name is a user readable description of the scanner, e.g:

<pre>

"SCN1", "1D Scanner Driver"
"SCN2", "Camera"
"SCN3", "Bluetooth SSI Scanner Driver"
</pre>


###Viewfinder Position Parameters
The scanner viewfinder window is not infinitely resizable, when setting ViewFinderX, ViewFinderY, ViewFinderWidth and ViewFinderHeight ensure you do not exceed the size of the screen and it is recommended to use the same aspect ratio as your device. For applications designed to handle screen rotation it is recommended to use a scan window whose longest side will fit within both the screen width and screen height. If your viewfinder position fails to be applied it is recommended you query your log file to see which parameter is causing trouble, or reposition the window away from the edges of the screen.


###DataWedge Interaction With Native Apps
In order to use the scanner with RhoElements Native Apps you will need to either disable DataWedge or create a DataWedge profile for your app.

<pre>
DISABLING DATAWEDGE
1.	Start the DataWedge app
2.	Click the menu button &gt; "Settings" and untick "DataWedge enabled". 
RHOELEMENTS DATAWEDGE PROFILE
1.	Install your RhoElements native app,
2.	Start the DataWedge app
3.	Click the menu button &gt; "New Profile" and enter a name,
4.	Click on the link to the new profile in the profile list,
5.	Click on "Associated apps" in the "Applications" section,
6.	Click the menu button &gt; "New app/activity",
7.	Select the package name for your app,
8.	Select "*",
9.	Click the "Back" capacitive button,
10.	Make sure the "Profile enabled" checkbox is ticked.
11.	Uncheck all three "Enabled" checkboxes under the sections of:
	"Barcode input", "Keystroke output" and "Intent output".
</pre>

###Devices lacking support
Due to platform limitations this API is not available on the following Zebra Technologies devices on specific platform. Note: However one can enable legacy scanner service and can scan the respective barcode.

* VH10 CE 6.0


##Requirements

<table class="re-table"><tr><th class="tableHeading">RhoElements Version</th><td class="clsSyntaxCell clsEvenRow">1.0.0 or above
</td></tr><tr><th class="tableHeading">Supported Devices</th><td class="clsSyntaxCell clsOddRow">All supported devices that have a scanner component. Android only supports the following parameters: enabled, [Decoder Name], autoEnter, autoTab, illuminationMode, linearSecurityLevel, picklistMode, scanTimeout, viewfinderMode, inverse1d.  Note that not all parameters will be supported by all scanner engines, e.g. Inverse1D barcodes are not supported on the MK4000.</td></tr><tr><th class="tableHeading">Minimum Requirements</th><td class="clsSyntaxCell clsOddRow">None.</td></tr><tr><th class="tableHeading">Persistence</th><td class="clsSyntaxCell clsEvenRow">Transient - The scanner is disabled when navigating to a new page or refreshing the current page.  Disabling and Re-enabling the scanner may reset some parameters back to their device default.  The Zebra utility CtlPanel, available as a separate download, can be used to configure the default state of the scanner. For Scanner to work with VC70, it should be connected as SSI mode.</td></tr></table>


##HTML/Javascript Examples

The following example enables the scanner, turns on autoenter and performs a soft trigger start:

	<META HTTP-Equiv="scanner" Content="Enable">
	<META HTTP-Equiv="scanner" Content="AutoEnter:Enabled">
	<META HTTP-Equiv="scanner" Content="Start">
	
The following example sets up the scanner on a page to submit the scanned data to an asp page upon successful decoding

	<META HTTP-Equiv="scanner" Content="enabled">
	<META HTTP-Equiv="scanner" Content="DecodeEvent:url('mypage.asp?Data=%s&Source=%s&Type=%s&Time=%s&Length=%s')">
	
The following example sets up the scanner on a page to call a javascript function upon successful decoding:

	<META HTTP-Equiv="scanner" Content="enable">
	<META HTTP-Equiv="scanner" Content="DecodeEvent:url('javascript:doScan(%json);')">
	
	<script>
	   function doScan(jsonObject)
	   {
	      if(jsonObject.type == 0x35) //ean 13
	      {
	         alert('Please scan a non EAN 13 code!');
	      }
	      else
	      {
	         alert('You scanned: ' + jsonObject.data);
	      }
	   }
	</script>
	
The following example demonstrates how to set a device into presentation mode.

	<HTML>
	<HEAD>
	  <Meta http-equiv="scanner" content="aimType:presentation">
	  <Meta http-equiv="scanner" content="DecodeEvent:url('Javascript:doScan('%s');')">
	  <Meta http-equiv="scanner" content="enable">
	</HEAD>
	<BODY onLoad="doSoftScan();">
	  <SCRIPT LANGUAGE="JavaScript">
	
	    function doSoftScan()
	    {
		    scanner.start();
	    }
	
	    function doScan(jsonObject)
	    {
		    bcode.innerHTML = jsonObject.data;
		    doSoftScan();
		}
	  </SCRIPT>
	  <div id="bcode"></div>
	</BODY>
	</HTML>
	
	
The following example shows how an application might handle a Bluetooth Scanner whose ID is SCN2:

	<HTML>
	<HEAD>
	<!-- Status Updates are received via bluetoothStatusEvent -->
	<META HTTP-Equiv="Scanner" Content="BluetoothStatusEvent:url('Javascript:BTStatusFunc(%json);')">
	<META HTTP-Equiv="Scanner" Content="DecodeEvent:url('Javascript:ScanFunc(%json);')">
	<!-- Enable the Bluetooth Scanner, this will commence the BT pairing -->
	<META HTTP-Equiv="Scanner" Content="Enabled:SCN2">
	</HEAD>
	
	Barcode Data: <DIV ID="bcode"> </DIV>
	User Message: <DIV ID="message"> </DIV>
	<P><INPUT TYPE="button" VALUE="Change Associated Scanner" ONCLICK="onChangeScanner();"></P>
	</BODY>
	</HTML>
	
	<SCRIPT LANGUAGE="JavaScript">
	
	//  Whether or not the next barcode data we receive will be the unpairing barcode
	var expectingUnpairingBarcode = false;
	
	function ScanFunc(jsonObject)
	{
		//  Output the scanned barcode
		bcode.innerHTML = data;
	}
	
	function BTStatusFunc(jsonObject)
	{
		if (expectingUnpairingBarcode)
		{
			//  restart the scanner component so it is ready
			//  to accept a different Bluetooth Scanner
			expectingUnpairingBarcode = false;
			scanner.disable();
			scanner.enabled = 'SCN2';
			return;
		}
		
		if (jsonObject.status == 'BTScanAssociationBarcode')
		{
			//  Instruct the User to scan the association barcode
			alert('Scan Association Barcode');
		}
		else if(jsonObject.status == 'BluetoothConnected')
		{
			message.innerHTML = "Bluetooth Scanner Connected";
		}
		else if(jsonObject.status == 'BluetoothDisconnected')
		{
			message.innerHTML = "Bluetooth Disconnected, Please Reconnect";
		}
	}
	
	function onChangeScanner()
	{
		//  Change the BT Scanner associated with the device, the logic to do this is handled
		//  once the 'unpairing' barcode is scanned.
		message.innerHTML = "Please Scan Unpairing Barcode";
		expectingUnpairingBarcode = true;
	}
	</SCRIPT>
	
	
The following example displays the available scanners on screen and enables the Bluetooth Scanner (if available)

	<HTML>
	<HEAD>
	<META HTTP-Equiv="Scanner" Content="DecodeEvent:url('Javascript:ScanFunc(%json);')">
	<META HTTP-Equiv="Scanner" Content="BluetoothStatusEvent:url('Javascript:BTFunc(%json);')">
	<META HTTP-Equiv="Scanner" Content="EnumScannerEvent:url('Javascript:EnumScanners(%json);')">
	</HEAD>
	
	<BODY onLoad="setEnumScannerTimer();">
	<DIV ID="message"></DIV>
	</BODY>
	</HTML>
	
	<SCRIPT LANGUAGE="JavaScript">
	function ScanFunc(jsonObject) {message.innerHTML = jsonObject.data;}
	
	function BTFunc(jsonObject) {message.innerHTML = jsonObject.status;}
	
	function EnumScanners(jsonObject)
	{
		var scannerInfo = "Scanners On Device: " + jsonObject.scannerArray.length + "<BR>ID  --  Name<BR>" 
		for (i=0; i < jsonObject.scannerArray.length; i++)
		{
			scannerInfo = scannerInfo + jsonObject.scannerArray[i].deviceName + ' -- '
			+ jsonObject.scannerArray[i].friendlyName + '<BR>';
			//  See if this is the Bluetooth Scanner
			if (jsonObject.scannerArray[i].friendlyName.indexOf("Bluetooth") >= 0)
			{
				//  This is the Bluetooth Scanner, Enable it
				scanner.enabled = jsonObject.scannerArray[i].deviceName;
			}
		}
		message.innerHTML = scannerInfo;
	}
	
	//  Wait for the DOM to fully load before we enumerate the scanners
	function setEnumScannerTimer()
	{
	    setTimeout("onScannerEnable()", 3000);
	}
	function onScannerEnable()
	{
		scanner.enumerate();
	}
	</SCRIPT>
	


##Ruby Examples

The following example lists the available scanners on a device. It first detaches the listeners to 'enumScannerEvent' (if any), then attaches it to a listner and makes a call to 'enumerate' which fires the 'enumScannerEvent'. This piece of code should be placed in the controller

	def registerEnumEvent
		Scanner.enumScannerEvent = ''
		Scanner.enumScannerEvent = url_for(:action => :enumScannerEventListener)
		Scanner.enumerate
	end

To call the this function from HTML, use the following code: 

	<li onclick="enumerateScanner();">Enumerate Scanners</li>

Where 'enumerateScanner()' is a JavaScript function which looks like: 

	function enumerateScanner() {
		$.get('/app/ScannerModule/registerEnumEvent', { });
		return false;
    }

The following piece of code captures the array of scanners returned from the 'enumScannerEvent' and constructs a string to be displayed on an HTML div:
  
	def enumScannerEventListener
		scanners = @params
			  
		String buf = "Available scanners: <BR>"    
		if scanners    
		  scanners['scannerArray'].each {|scanner| buf += '' + scanner["deviceName"] + " : " + scanner["friendlyName"] + "<BR>"}
		  WebView.execute_js("setFieldValue('"+buf+"');")
		else
		  WebView.execute_js("setFieldValue('No Scanners found! ');")
		end    
	end

The following example enables the scanner and attaches a listener to the decode event. This can be called from HTML in a similar fashion to the one described above.
  
	def enableScanner
		Scanner.enable
		Scanner.decodeEvent = url_for(:action => :scannerEventListener)
		WebView.execute_js("setFieldValue('Scanner Enabled');")
	end

The following example populates an HTML div with scanned data upon successful decoding of a barcode:

	def scannerEventListener
		scanResult = @params
		WebView.execute_js("setFieldValue('You scanned: <BR>" + scanResult['data'] +"<BR>');")
	end

The following example disables the scanner and detaches any listeners attached to the decode event. This can be called from HTML in a similar fashion to the one described above.

	def disableScanner
		Scanner.disable
		Scanner.decodeEvent = ''
		WebView.execute_js("setFieldValue('Scanner Disabled.');")
	end 

For all the examples described above, the 'setFieldValue()' JavaScript function looks like: 

	function setFieldValue(returnval){
		document.getElementById("result").innerHTML=returnval;
	}
