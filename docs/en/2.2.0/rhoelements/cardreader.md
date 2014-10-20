# CardReader Module
**The CardReader Module is used to either navigate to a URL or call a JavaScript function when an attached card reader decodes data.**

## Syntax

<table class="re-table">
	<tr>
		<th class="tableHeading">cardReader (Module) &lt;META&gt; Syntax</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="cardreader" content="parameter:value"&gt;</p></td>
	</tr>
</table>

<table class="re-table">
	<tr>
		<th class="tableHeading">CardReader JavaScript Object Syntax:</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			By default the JavaScript Object <b>'cardReader'</b> will exist on the current page and can be used to interact directly with the cardReader.
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow">To Invoke cardReader methods via JavaScript use the following syntax: cardreader.method();
			<br/><br/>
			e.g. <b>cardReader</b>.open();
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			To Set cardReader parameters via JavaScript use the following syntax: cardreader.parameter = 'value'; remembering to enclose your value in quotes where appropriate.  
			<br/><br/>
			e.g. <b>cardReader</b>.pinTimeout = 'value';
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow">
			To Set cardReader return events via JavaScript use the following syntax: cardreader.event = JavaScript Function;
			<br/><br/>
			e.g. <b>cardReader</b>.readEvent = 'doFunction(%json)';
			<br/><br/>
			For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents">Retrieval Events</a> page.
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: cardreader.setEMML("[Your EMML Tags]");
			<br/><br/>
			e.g. <b>cardReader</b>.setEMML("pinTimeout:<i>value</i>;readEvent:url('JavaScript:doFunction(%json)');open");
		</td>
	</tr>
</table>

<table class="re-table">
	<tr>
		<th class="tableHeading">CardReader Ruby Object Syntax:</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			By default the Ruby Object <b>'CardReader'</b> will exist on the current page and can be used to interact directly with the CardReader. All Methods, Parameters and Events are the same as JavaScript, however, notice <b>'CardReader'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b>
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow">
			To Invoke CardReader methods via Ruby use the following syntax: CardReader.method()
			<br/><br/>
			e.g. <b>CardReader</b>.open
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">
			To Set CardReader parameters via Ruby use the following syntax: CardReader.parameter = 'value' remembering to enclose your value in quotes where appropriate
			<br/><br/>
			e.g. <b>CardReader</b>.pinTimeout = 'value'
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow">
			To Set CardReader return events via Ruby use the following syntax: CardReader.event = url_for(:action =&gt; :event_callback) 
			<br/><br/>
			e.g. <b>CardReader</b>.readEvent = url_for(:action =&gt; :cardreader_event_callback)
			<br/><br/>
			For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents#params-object">Retrieval Events</a> page.<br/>
			To access the event parameters in a Ruby callback function, you reference the @params object within the callback function. This object is simply a ruby hash {"parameter1 name" =&gt; "parameter1 value", "parameter2 name" =&gt; "parameter2 value", ...}</p>
		</td>
	</tr>
</table>

## Methods
Items listed in this section indicate methods or, in some cases, indicate parameters which will be retrieved.

<table class="re-table"><col width="10%"/><col width="68%"/><col width="22%"/>
	<tr>
		<th class="tableHeading">Name</th>
		<th class="tableHeading">Description</th>
		<th class="tableHeading">Default Value</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>open</b></td>
		<td class="clsSyntaxCells clsOddRow">Opens the card reader. Resets the ReadEvent to "".</td>
		<td class="clsSyntaxCells clsOddRow">Closed</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>close</b></td>
		<td class="clsSyntaxCells clsEvenRow">Closes the card reader</td>
		<td class="clsSyntaxCells clsEvenRow">Closed</td>
	</tr>
</table>

## Parameters
Items listed in this section indicate parameters, or attributes which can be set.

<table class="re-table"><col width="20%"/><col width="20%"/><col width="38%"/><col width="22%"/>
	<tr>
		<th class="tableHeading">Name</th>
		<th class="tableHeading">Possible Values</th>
		<th class="tableHeading">Description</th>
		<th class="tableHeading">Default Value</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>pinTimeout:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">0 - 65535</td>
		<td class="clsSyntaxCells clsOddRow">PIN entry timeout in milliseconds. A value of 65535 sets the timeout to infinite.</td>
		<td class="clsSyntaxCells clsOddRow">30000-&gt;30s timeout</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>pinEntry:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">On, Off</td>
		<td class="clsSyntaxCells clsEvenRow">Turns the PIN entry on or off.</td>
		<td class="clsSyntaxCells clsEvenRow">OFF</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>panData:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">Any 16 digit number</td>
		<td class="clsSyntaxCells clsOddRow">
			Sets the card data without the need of a swipe. This parameter should not be called via a Meta tag as doing so simulates a card read.
		</td>
		<td class="clsSyntaxCells clsOddRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>autoTab:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">Enabled, Disabled</td>
		<td class="clsSyntaxCells clsEvenRow">When enabled, appends a tab to any data returned as keystrokes by the cardreader.</td>
		<td class="clsSyntaxCells clsEvenRow">"disabled"</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>autoEnter:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">Enabled, Disabled</td>
		<td class="clsSyntaxCells clsOddRow">When enabled, appends a carriage return to any data returned as keystrokes by the cardreader.</td>
		<td class="clsSyntaxCells clsOddRow">"disabled"</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>moduleName:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">MSR9000, MSR9001, MSR9500, MSRCAMEO, MSR7000, DCR7000, MSR55, MSR3000</td>
		<td class="clsSyntaxCells clsEvenRow">
			This method is present to provide backwards compatibility with PocketBrowser code, devices supported by RhoElements will have a single card reader driver installed as part of the platform.  If the device has multiple card reader drivers installed this parameter is used to select which driver to use.  The drivers present are output in the log file when the card reader is initialised.  This parameter is also used to distinguish between an MSR and a DCR, e.g. if you attach a DCR7000 to your device you can specify that only the MSR functionality is used by specifying this parameter as 'MSR7000'
		</td>
		<td class="clsSyntaxCells clsEvenRow">None</td>
	</tr>
</table>

## Events
Values are returned to the caller in RhoElements via Events.  Most modules contain events and those returned from this module are given below along with the event parameters.  Events can cause a navigation to a new URL or a JavaScript function on the page to be invoked.  Each event will in most cases have a number of parameters associated with it which will either be strings or JavaScript arrays.  Event parameters can be accessed either directly or via JSON objects.

### readEvent
readEvent:URL('URI') URI is either a URL or a JavaScript function. If a URL, the browser navigates to the URL when the attached card reader decodes some data. If a JavaScript function, the function is treated as a callback which is invoked when the card reader decodes data. Issuing this tag, automatically opens the card reader, if it has not been opened already.

<table class="re-table"><col width="3%"/><col width="20%"/><col width="77%"/>
	<tr>
		<th class="tableHeading">ID</th>
		<th class="tableHeading">Name</th>
		<th class="tableHeading">Description</th>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">1</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>data</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">
			Data read by the card reader. This may be card data, the PAN data extracted from the card data, encrypted PIN block data, or a message. In case of an ISO/ABA card [eg: a financial card], data is encrypted. For other cards, data is in the clear.
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">2</td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>mode</b></td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">
			Describes the data. This will be either: 'CR','ENCDATA','PAN', or 'MESSAGE'.  This equates to card data, encrypted PIN block data, PAN data, or a message, respectively.
		</td>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">3</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>encryption</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">
			This provides the information regarding the card reader head configuration. Available only on Android and the value can be "encrypted" or "unencrypted".
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">4</td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>rawData</b></td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">
			This is the raw data read by the card reader from all the tracks. Available only on Android and the value is in HEX format.
		</td>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">5</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>track1</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">
			The track1 clear/masked data read by the card reader. Available only on Android and the value is in HEX format. This value should be used only when the track1Status value returned is "true".
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">6</td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>track2</b></td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">
			The track2 clear/masked data read by the card reader. Available only on Android and the value is in HEX format. This value should be used only when the track2Status value returned is "true".
		</td>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">7</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>track3</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">
			The track3 clear/masked data read by the card reader. Available only on Android and the value is in HEX format. This value should be used only when the track3Status value returned is "true".
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">8</td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>track1Status</b></td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">
			The status of the track1 clear/masked data read by the card reader. Available only on Android and the value can be "true" or "false".
		</td>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">9</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>track2Status</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">
			The status of the track2 clear/masked data read by the card reader. Available only on Android and the value can be "true" or "false".
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">10</td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>track3Status</b></td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">
			The status of the track3 clear/masked data read by the card reader. Available only on Android and the value can be "true" or "false".
		</td>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">11</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>track1Encrypted</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">
			The track1 encrypted data read by the card reader. Available only on Android and the value is in HEX format. This value should be used only when the track1EncryptedStatus value returned is "true".
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">12</td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>track2Encrypted</b></td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">
			The track2 encrypted data read by the card reader. Available only on Android and the value is in HEX format. This value should be used only when the track2EncryptedStatus value returned is "true".
		</td>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">13</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>track3Encrypted</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">
			The track3 encrypted data read by the card reader. Available only on Android and the value is in HEX format. This value should be used only when the track3EncryptedStatus value returned is "true".
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">14</td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>track1EncryptedStatus</b></td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">
			The status of the track1 encrypted data read by the card reader. Available only on Android and the value can be "true" or "false".
		</td>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">15</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>track2EncryptedStatus</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">
			The status of the track2 encrypted data read by the card reader. Available only on Android and the value can be "true" or "false".
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">16</td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>track3EncryptedStatus</b></td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">
			The status of the track3 encrypted data read by the card reader. Available only on Android and the value can be "true" or "false".
		</td>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">17</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>ksn</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">
			The encrypted KSN serial number read by the card reader. Available only on Android and the value is in HEX format.
		</td>
	</tr>
</table>

## Multi Instance
When multiple RhoElememts applications are running the following considerations should be made: Only the foreground RhoElements application is given access to the card reader hardware, when an application is sent to the background its state will be saved and it will automatically relinquish control of the card reader.  When brought back to the foreground, an application previously using the card reader will have its previous configuration (eg. pinTimeout) reapplied to the card reader automatically.

## Remarks
### General
If the CardReader return URI is "", the cardreader data will be returned as keystrokes. The readevent parameter must be set at least once before the pandata parameter is set. If both the autotab and autoenter parameters are set to "enabled", autoenter will take precedence. An opened card reader must be closed before the attached card reader device and associated modulename parameter are changed.

### AutoEnter and AccelerateKey
The AccelerateKey Meta tag controls the behaviour of Accelerate keys on Windows CE, if the Enter key is configured to be non functional then AutoEnter will also appear to not function either

### Operational Modes (Backwards compatibility with PocketBrowser)
For the DCR7000 the ModuleName parameter must be set at least once before the readevent parameter is set. If the card reader is an MSR, when a card is swiped it returns the data read from the card. Setting ModuleName to a DCR will cause the card data to be returned followed by the PAN Data before waiting for a PIN to be entered on the keypad. Once entered the PIN will be encrypted and returned by a third ReadEvent. The card must be a validly formatted IATA or ABA card.

### Event URI and Parameter Persistence
The ReadEvent URI, the PINTimeout, PINEntry, AutoEnter / AutoTab parameters are page-specific values. When RhoElements performs a page navigate (not a JavaScript callback), the URI is invalidated, the parameters set to their default values and the cardreader is closed. While the cardreader is open, the URI value may be changed via passing a new readevent parameter/value pair. In the case that the CardReader is already open, the readevent parameter will simply update the URI and do nothing to the state of the port.

### Invalid parameter values
Any attempt to set a parameter to an invalid value, will result in no effect on the parameter's current value.

### Closing the reader while PIN entry pending
There is no way to abort a pending PIN entry (other than the customer pressing the Cancel button), for security reasons. Therefore if the reader is closed or RhoElements is quit during that time it will become unresponsive until a PIN is entered or the PIN timeout occurs.

### Blank card data
In certain circumstances it is possible that the card reader may return empty card data. The JavaScript event function should be able to handle this correctly.

### Detaching / Reattaching the Card Reader
Applications running in RhoElements should be resilient against the card reader being detached and subsequently reattached. Card data parsing code should be robust against unexpected characters in the first read after reattachment.

### Encrypted Card data
The encrypted data is supported only on the card readres that are configured for encryption. Since the encrypted data might contain unreadable characters sometimes it is recommended to use only JSON object method rather than JavaScript '%s' notation.

### Navigation to URL on ReadEvent
Because encrypted card data can contain characters not accepted in a URL the ReadEvent should be handled entirely in either JavaScript or Ruby.

## Requirements

<table class="re-table">
	<tr>
		<th class="tableHeading">RhoElements Version</th>
		<td class="clsSyntaxCell clsEvenRow">1.0.0 or above</td>
	</tr>
	<tr>
		<th class="tableHeading">Supported Devices</th>
		<td class="clsSyntaxCell clsOddRow">All supported devices that have a card reader attachment.</td>
	</tr>
	<tr>
		<th class="tableHeading">Minimum Requirements</th>
		<td class="clsSyntaxCell clsOddRow">
			You must have the appropriate drivers installed on your device to use the CardReader. You will see which drivers are installed in the RhoElements log file after you attempt to use any of the card reader functions in RhoElements.  All necessary drivers should be included as part of the platform for supported devices.
		</td>
	</tr>
	<tr>
		<th class="tableHeading">Persistence</th>
		<td class="clsSyntaxCell clsEvenRow">See Comment Above.</td>
	</tr>
</table>

## HTML/JavaScript Examples
The following example sets up the card reader to submit the scanned data to an asp page upon successful decoding

	:::html
	<META HTTP-Equiv="cardreader" Content="readevent:url('http://mypage.asp?Data=%s;Mode=%s')">

The following example sets up the card reader to call a JavaScript function upon successful decoding. The JavaScript function will be called 3 times, once with the raw card data, once with just the pan data extracted from the raw card data, and once with the encrypted pan data if the pin has been supplied by the user within 10s.:

	:::html
	<html>
		<head>
			<title>RhoElements CardReader Test</title>
			<meta http-equiv="content-type" content="text/html; charset=UTF-8">
			<meta HTTP-Equiv="CardReader" Content="PINEntry:ON">
			<meta HTTP-Equiv="CardReader" Content="PINTimeout:0x2710">
			<meta HTTP-Equiv="CardReader" Content="ReadEvent:url('javascript:doTransaction('%s', '%s');')">

			<script language="javascript" type="text/javascript">
				function doTransaction(data, mode){
					switch(mode) {
						case 'CR':
							alert('Card: '+data);
							break;
						case 'ENCDATA':
							alert('Encoded data: '+data);
							break;
						case 'MESSAGE':
							alert('Error: '+data);
							break;
						case 'PAN':
							alert('PAN data: '+data);
							alert('Please turn the unit over and enter the PIN');
							break;
					}
				}
			</script>
		</head>
		<body>
		</body>
	</html>

The following example closes the card reader

	:::html
	<META HTTP-Equiv="CardReader" Content="Close">

The following example reads the encrypted data from the card reader

	:::html
	<html>
		<head>
			<meta http-equiv="content-type" content="text/html; charset=UTF-8">
			<title>RhoElements CardReader data Test</title>
			<META HTTP-Equiv="CardReader" Content="ReadEvent:url('javascript:doTransaction(%json);')">
			<script language="javascript" type="text/javascript">
				function doTransaction(j){
					switch(j.mode) {
						case 'CR':
							htmlData.innerHTML = "Encryption = " + j.encryption + "<br>" 
								+ "Total data = " + j.data + "<br>"
								+ "Raw data = " + j.rawData + "<br>"
								+ "Unencrypted track1 data = " + j.track1 + "<br>"
								+ "Unencrypted track2 data = " + j.track2 + "<br>"
								+ "Unencrypted track3 data = " + j.track3 + "<br>"
								+ "Unencrypted track1 Status = " + j.track1Status + "<br>"
								+ "Unencrypted track2 Status = " + j.track2Status + "<br>"
								+ "Unencrypted track3 Status = " + j.track3Status + "<br>"
								+ "Encrypted track1 data = " + j.track1Encrypted + "<br>"
								+ "Encrypted track2 data = " + j.track2Encrypted + "<br>"
								+ "Encrypted track3 data = " + j.track3Encrypted + "<br>"
								+ "Encrypted track1 Status = " + j.track1EncryptedStatus + "<br>"
								+ "Encrypted track2 Status = " + j.track2EncryptedStatus + "<br>"
								+ "Encrypted track3 Status = " + j.track3EncryptedStatus + "<br>"
								+ "KSN number = " + j.ksn;
								break;
					}
				}
			</script>
		</head>
		<body>
			<br><br><br><br><br>
			<DIV id="htmlData">The card data will appear here</div>
		</body>
	</html>