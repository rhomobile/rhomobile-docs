
#Rsm Module

<b>
The Rsm Module is used to configure or to retrieve attributes relating to a remote scanner either tethered to the device or connected via Bluetooth. The properties of the scanner which can be configured are detailed in the 'Remarks' section. When used for retrieval navigation to URL or call to JavaScript function happens immediately.
</b>

##Syntax

<table class="re-table"><tr><th class="tableHeading">rsm (Module) &lt;META&gt; Syntax
</th></tr><tr><td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="RSM" content="[parameter]"&gt;</p></td></tr></table>
<table class="re-table"><tr><th class="tableHeading">Rsm JavaScript Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the JavaScript Object <b>'rsm'</b> will exist on the current page and can be used to interact directly with the rsm.
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Invoke rsm methods via JavaScript use the following syntax: rsm.method();
<P />e.g. <b>rsm</b>.markForRetrievalModelNumber();
</td></tr><tr><td class="clsSyntaxCells clsOddRow">
To Set rsm parameters via JavaScript use the following syntax: rsm.parameter = 'value'; remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>rsm</b>.bluetoothAuthentication = 'value';
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">						
To Set rsm return events via JavaScript use the following syntax: rsm.event = JavaScript Function;
<P />e.g. <b>rsm</b>.rsmGetEvent = 'doFunction(%json)';
<P />
For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents">Retrieval Events</a> page.

</td></tr><tr><td class="clsSyntaxCells clsOddRow">							
To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: rsm.setEMML("[Your EMML Tags]");
<P />
e.g. <b>rsm</b>.setEMML("bluetoothAuthentication:<i>value</i>;rsmGetEvent:url('JavaScript:doFunction(%json)');markForRetrievalModelNumber");							
</td></tr></table>

<table class="re-table"><tr><th class="tableHeading">Rsm Ruby Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the Ruby Object <b>'Rsm'</b> will exist on the current page and can be used to interact directly with the Rsm. All Methods, Parameters and Events are the same as JavaScript, however, notice <b>'Rsm'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b></td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Invoke Rsm methods via Ruby use the following syntax: Rsm.method()
<P />e.g. <b>Rsm</b>.markForRetrievalModelNumber</td></tr><tr><td class="clsSyntaxCells clsOddRow">
To Set Rsm parameters via Ruby use the following syntax: Rsm.parameter = 'value' remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>Rsm</b>.bluetoothAuthentication = 'value'
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">						
To Set Rsm return events via Ruby use the following syntax: Rsm.event = url_for(:action =&gt; :event_callback) 
<P />e.g. <b>Rsm</b>.rsmGetEvent = url_for(:action =&gt; :rsm_event_callback)
<P />
For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents#params-object">Retrieval Events</a> page.
<p>To access the event parameters in a Ruby callback function, you reference the @params object within the callback function. This object is simply a ruby hash {"parameter1 name" =&gt; "parameter1 value", "parameter2 name" =&gt; "parameter2 value", ...}</p></td></tr><tr><td class="clsSyntaxCells clsOddRow" /></tr></table>


	

##Methods


Items listed in this section indicate methods or, in some cases, indicate parameters which will be retrieved.

<table class="re-table"><col width="10%" /><col width="68%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>markForRetrievalModelNumber</b></td><td class="clsSyntaxCells clsOddRow">	Marks the ModelNumber to be returned when RSMGetEvent is next called.  See Remarks.</td><td class="clsSyntaxCells clsOddRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>markForRetrievalSerialNumber</b></td><td class="clsSyntaxCells clsEvenRow">	Marks the SerialNumber to be returned when RSMGetEvent is next called.  See Remarks.</td><td class="clsSyntaxCells clsEvenRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>markForRetrievalDateOfManufacture</b></td><td class="clsSyntaxCells clsOddRow">	Marks the DateOfManufacture to be returned when RSMGetEvent is next called.  See Remarks.</td><td class="clsSyntaxCells clsOddRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>markForRetrievalDateOfService</b></td><td class="clsSyntaxCells clsEvenRow">	Marks the DateOfService to be returned when RSMGetEvent is next called.  See Remarks.</td><td class="clsSyntaxCells clsEvenRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>markForRetrievalBluetoothAddress</b></td><td class="clsSyntaxCells clsOddRow">	Marks the BluetoothAddress to be returned when RSMGetEvent is next called.  See Remarks.</td><td class="clsSyntaxCells clsOddRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>markForRetrievalFirmwareVersion</b></td><td class="clsSyntaxCells clsEvenRow">	Marks the FirmwareVersion to be returned when RSMGetEvent is next called.  See Remarks.</td><td class="clsSyntaxCells clsEvenRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>markForRetrievalDeviceClass</b></td><td class="clsSyntaxCells clsOddRow">	Marks the DeviceClass to be returned when RSMGetEvent is next called.  See Remarks.</td><td class="clsSyntaxCells clsOddRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>markForRetrievalBatteryStatus</b></td><td class="clsSyntaxCells clsEvenRow">	Marks the BatteryStatus to be returned when RSMGetEvent is next called.  See Remarks.</td><td class="clsSyntaxCells clsEvenRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>markForRetrievalBatteryCapacity</b></td><td class="clsSyntaxCells clsOddRow">	Marks the BatteryCapacity to be returned when RSMGetEvent is next called.  See Remarks.</td><td class="clsSyntaxCells clsOddRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>markForRetrievalBatteryId</b></td><td class="clsSyntaxCells clsEvenRow">	Marks the BatteryID to be returned when RSMGetEvent is next called.  See Remarks.</td><td class="clsSyntaxCells clsEvenRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>markForRetrievalBluetoothAuthentication</b></td><td class="clsSyntaxCells clsOddRow">	Marks the BluetoothAuthentication to be returned when RSMGetEvent is next called.  See Remarks.</td><td class="clsSyntaxCells clsOddRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>markForRetrievalBluetoothEncryption</b></td><td class="clsSyntaxCells clsEvenRow">	Marks the BluetoothEncryption to be returned when RSMGetEvent is next called.  See Remarks.</td><td class="clsSyntaxCells clsEvenRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>markForRetrievalBluetoothPinCode</b></td><td class="clsSyntaxCells clsOddRow">	Marks the BluetoothPINCode to be returned when RSMGetEvent is next called.  See Remarks.</td><td class="clsSyntaxCells clsOddRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>markForRetrievalBluetoothPinCodeType</b></td><td class="clsSyntaxCells clsEvenRow">	Marks the BluetoothPINCodeType to be returned when RSMGetEvent is next called.  See Remarks.</td><td class="clsSyntaxCells clsEvenRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>markForRetrievalBluetoothReconnectAttempts</b></td><td class="clsSyntaxCells clsOddRow">Marks the BluetoothReconnectAttempts to be returned when RSMGetEvent is next called.  See Remarks.</td><td class="clsSyntaxCells clsOddRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>markForRetrievalBluetoothBeepOnReconnectAttempt</b></td><td class="clsSyntaxCells clsEvenRow">	Marks the BluetoothBeepOnReconnectAttempt to be returned when RSMGetEvent is next called.  See Remarks.</td><td class="clsSyntaxCells clsEvenRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>markForRetrievalBluetoothHidAutoReconnect</b></td><td class="clsSyntaxCells clsOddRow">	Marks the BluetoothHIDAutoReconnect to be returned when RSMGetEvent is next called.  See Remarks.</td><td class="clsSyntaxCells clsOddRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>markForRetrievalBluetoothFriendlyName</b></td><td class="clsSyntaxCells clsEvenRow">	Marks the BluetoothFriendlyName to be returned when RSMGetEvent is next called.  See Remarks.</td><td class="clsSyntaxCells clsEvenRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>markForRetrievalBluetoothInquiryMode</b></td><td class="clsSyntaxCells clsOddRow">	Marks the BluetoothInquiryMode to be returned when RSMGetEvent is next called.  See Remarks.</td><td class="clsSyntaxCells clsOddRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>markForRetrievalBluetoothAutoReconnect</b></td><td class="clsSyntaxCells clsEvenRow">	Marks the BluetoothAutoReconnect to be returned when RSMGetEvent is next called.  See Remarks.</td><td class="clsSyntaxCells clsEvenRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>markForRetrievalForceSavePairingBarcode</b></td><td class="clsSyntaxCells clsOddRow">	Marks the ForceSavePairingBarcode to be returned when RSMGetEvent is next called.  See Remarks.</td><td class="clsSyntaxCells clsOddRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>markForRetrievalLowBatteryIndication</b></td><td class="clsSyntaxCells clsEvenRow">	Marks the LowBatteryIndication to be returned when RSMGetEvent is next called.  See Remarks.</td><td class="clsSyntaxCells clsEvenRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>markForRetrievalLowBatteryIndicationCycle</b></td><td class="clsSyntaxCells clsOddRow">	Marks the LowBatteryIndicationCycle to be returned when RSMGetEvent is next called.  See Remarks.</td><td class="clsSyntaxCells clsOddRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>markForRetrievalScanLineWidth</b></td><td class="clsSyntaxCells clsEvenRow">	Marks the ScanLineWidth to be returned when RSMGetEvent is next called.  See Remarks.</td><td class="clsSyntaxCells clsEvenRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>markForRetrievalGoodScansDelay</b></td><td class="clsSyntaxCells clsOddRow">	Marks the GoodScansDelay to be returned when RSMGetEvent is next called.  See Remarks.</td><td class="clsSyntaxCells clsOddRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>markForRetrievalDecodeFeedback</b></td><td class="clsSyntaxCells clsEvenRow">	Marks the DecodeFeedback to be returned when RSMGetEvent is next called.  See Remarks.</td><td class="clsSyntaxCells clsEvenRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>markForRetrievalIgnoreCode128Usps</b></td><td class="clsSyntaxCells clsOddRow">	Marks the IgnoreCode128USPS to be returned when RSMGetEvent is next called.  See Remarks.</td><td class="clsSyntaxCells clsOddRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>markForRetrievalScanTriggerWakeup</b></td><td class="clsSyntaxCells clsEvenRow">	Marks the ScanTriggerWakeup to be returned when RSMGetEvent is next called.  See Remarks.</td><td class="clsSyntaxCells clsEvenRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>markForRetrievalMems</b></td><td class="clsSyntaxCells clsOddRow">	Marks the Mems to be returned when RSMGetEvent is next called.  See Remarks.</td><td class="clsSyntaxCells clsOddRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>markForRetrievalProximityEnable</b></td><td class="clsSyntaxCells clsEvenRow">	Marks the ProximityEnable to be returned when RSMGetEvent is next called.  See Remarks.</td><td class="clsSyntaxCells clsEvenRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>markForRetrievalProximityContinuous</b></td><td class="clsSyntaxCells clsOddRow">	Marks the ProximityContinuous to be returned when RSMGetEvent is next called.  See Remarks.</td><td class="clsSyntaxCells clsOddRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>markForRetrievalProximityDistance</b></td><td class="clsSyntaxCells clsEvenRow">	Marks the ProximityDistance to be returned when RSMGetEvent is next called.  See Remarks.</td><td class="clsSyntaxCells clsEvenRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>markForRetrievalPagingEnable</b></td><td class="clsSyntaxCells clsOddRow">	Marks the PagingEnable to be returned when RSMGetEvent is next called.  See Remarks.</td><td class="clsSyntaxCells clsOddRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>markForRetrievalPagingBeepSequence</b></td><td class="clsSyntaxCells clsEvenRow">	Marks the PagingBeepSequence to be returned when RSMGetEvent is next called.  See Remarks.</td><td class="clsSyntaxCells clsEvenRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>bluetoothDisconnect</b></td><td class="clsSyntaxCells clsOddRow">Instructs the Bluetooth scanner to disconnect from its associated device.</td><td class="clsSyntaxCells clsOddRow">Device Dependant</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>bluetoothUnpair</b></td><td class="clsSyntaxCells clsEvenRow">Instructs the bluetooth scanner to unpair from its associated device.  Allows the scanner to be associated with a different device</td><td class="clsSyntaxCells clsEvenRow">Device Dependant</td></tr></table>


##Parameters


Items listed in this section indicate parameters, or attributes which can be set.
<table class="re-table"><col width="20%" /><col width="20%" /><col width="38%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Possible Values</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>bluetoothAuthentication:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">See Remarks</td><td class="clsSyntaxCells clsOddRow">Sets the BluetoothAuthentication of the connected BT Scanner to the stated value.</td><td class="clsSyntaxCells clsOddRow">Device Dependant</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>bluetoothEncryption:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">See Remarks</td><td class="clsSyntaxCells clsEvenRow">Sets the BluetoothEncryption of the connected BT Scanner to the stated value.</td><td class="clsSyntaxCells clsEvenRow">Device Dependant</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>bluetoothPinCode:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">See Remarks</td><td class="clsSyntaxCells clsOddRow">Sets the BluetoothPINCode of the connected BT Scanner to the stated value.</td><td class="clsSyntaxCells clsOddRow">Device Dependant</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>bluetoothPinCodeType:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">See Remarks</td><td class="clsSyntaxCells clsEvenRow">Sets the BluetoothPINCodeType of the connected BT Scanner to the stated value.</td><td class="clsSyntaxCells clsEvenRow">Device Dependant</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>bluetoothReconnectAttempts:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">See Remarks</td><td class="clsSyntaxCells clsOddRow">Sets the BluetoothReconnectAttempts of the connected BT Scanner to the stated value.</td><td class="clsSyntaxCells clsOddRow">Device Dependant</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>bluetoothBeepOnReconnectAttempt:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">See Remarks</td><td class="clsSyntaxCells clsEvenRow">Sets the BluetoothBeepOnReconnectAttempt of the connected BT Scanner to the stated value.</td><td class="clsSyntaxCells clsEvenRow">Device Dependant</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>bluetoothHidAutoReconnect:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">See Remarks</td><td class="clsSyntaxCells clsOddRow">Sets the BluetoothHIDAutoReconnect of the connected BT Scanner to the stated value.</td><td class="clsSyntaxCells clsOddRow">Device Dependant</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>bluetoothFriendlyName:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">See Remarks</td><td class="clsSyntaxCells clsEvenRow">Sets the BluetoothFriendlyName of the connected BT Scanner to the stated value.</td><td class="clsSyntaxCells clsEvenRow">Device Dependant</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>bluetoothInquiryMode:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">See Remarks</td><td class="clsSyntaxCells clsOddRow">Sets the BluetoothInquiryMode of the connected BT Scanner to the stated value.</td><td class="clsSyntaxCells clsOddRow">Device Dependant</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>bluetoothAutoReconnect:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">See Remarks</td><td class="clsSyntaxCells clsEvenRow">Sets the BluetoothAutoReconnect of the connected BT Scanner to the stated value.</td><td class="clsSyntaxCells clsEvenRow">Device Dependant</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>forceSavePairingBarcode:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">See Remarks</td><td class="clsSyntaxCells clsOddRow">Sets the ForceSavePairingBarcode of the connected BT Scanner to the stated value.</td><td class="clsSyntaxCells clsOddRow">Device Dependant</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>lowBatteryIndication:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">See Remarks</td><td class="clsSyntaxCells clsEvenRow">Sets the LowBatteryIndication of the connected BT Scanner to the stated value.</td><td class="clsSyntaxCells clsEvenRow">Device Dependant</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>lowBatteryIndicationCycle:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">See Remarks</td><td class="clsSyntaxCells clsOddRow">Sets the LowBatteryIndicationCycle of the connected BT Scanner to the stated value.</td><td class="clsSyntaxCells clsOddRow">Device Dependant</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>scanLineWidth:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">See Remarks</td><td class="clsSyntaxCells clsEvenRow">Sets the ScanLineWidth of the connected BT Scanner to the stated value.</td><td class="clsSyntaxCells clsEvenRow">Device Dependant</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>goodScansDelay:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">See Remarks</td><td class="clsSyntaxCells clsOddRow">Sets the GoodScansDelay of the connected BT Scanner to the stated value.</td><td class="clsSyntaxCells clsOddRow">Device Dependant</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>decodeFeedback:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">See Remarks</td><td class="clsSyntaxCells clsEvenRow">Sets the DecodeFeedback of the connected BT Scanner to the stated value.</td><td class="clsSyntaxCells clsEvenRow">Device Dependant</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>ignoreCode128Usps:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">See Remarks</td><td class="clsSyntaxCells clsOddRow">Sets the IgnoreCode128USPS of the connected BT Scanner to the stated value.</td><td class="clsSyntaxCells clsOddRow">Device Dependant</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>scanTriggerWakeup:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">See Remarks</td><td class="clsSyntaxCells clsEvenRow">Sets the ScanTriggerWakeup of the connected BT Scanner to the stated value.</td><td class="clsSyntaxCells clsEvenRow">Device Dependant</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>mems:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">See Remarks</td><td class="clsSyntaxCells clsOddRow">Sets the Mems of the connected BT Scanner to the stated value.  See remarks</td><td class="clsSyntaxCells clsOddRow">Device Dependant</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>proximityEnable:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">See Remarks</td><td class="clsSyntaxCells clsEvenRow">Sets the ProximityEnable of the connected BT Scanner to the stated value.  See remarks.</td><td class="clsSyntaxCells clsEvenRow">Device Dependant</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>proximityContinuous:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">See Remarks</td><td class="clsSyntaxCells clsOddRow">Sets the ProximityContinuous of the connected BT Scanner to the stated value.</td><td class="clsSyntaxCells clsOddRow">Device Dependant</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>proximityDistance:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">See Remarks</td><td class="clsSyntaxCells clsEvenRow">Sets the ProximityDistance of the connected BT Scanner to the stated value.</td><td class="clsSyntaxCells clsEvenRow">Device Dependant</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>pagingEnable:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">See Remarks</td><td class="clsSyntaxCells clsOddRow">Sets the PagingEnable of the connected BT Scanner to the stated value.</td><td class="clsSyntaxCells clsOddRow">Device Dependant</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>pagingBeepSequence:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">See Remarks</td><td class="clsSyntaxCells clsEvenRow">Sets the PagingBeepSequence of the connected BT Scanner to the stated value.</td><td class="clsSyntaxCells clsEvenRow">Device Dependant</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>pagingActivate:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">See Remarks</td><td class="clsSyntaxCells clsOddRow">Sets the PagingActivate of the connected BT Scanner to the stated value.</td><td class="clsSyntaxCells clsOddRow">Device Dependant</td></tr></table>
<table class="re-table"><col width="78%" /><col width="8%" /><col width="1%" /><col width="5%" /><col width="1%" /><col width="5%" /><col width="2%" /></table>	

##Events


Values are returned to the caller in RhoElements via Events.  Most modules contain events and those returned from this module are given below along with the event parameters.  Events can cause a navigation to a new URL or a JavaScript function on the page to be invoked.  Each event will in most cases have a number of parameters associated with it which will either be strings or JavaScript arrays.  Event parameters can be accessed either directly or via JSON objects.

<br />
###rsmGetEvent

<table class="re-table"><col width="3%" /><col width="20%" /><col width="77%" /><tr><th class="tableHeading">ID</th><th class="tableHeading">Name</th><th class="tableHeading">Description</th></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">1</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>attributeArray</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">Array of attribute values.  The attributes returned in this array are those
						registered for by calls to markForRetrievalXXX prior to calling RSMGetEvent.  
						The table in the remarks section gives the possible values associated with 
						each attribute, if an attribute is not supported then 'Unsupported Attribute' 
						will be returned in that attribute's array position.</td></tr></table>



##Multi Instance
When multiple RhoElememts applications are running the following considerations should be made: Only the foreground RhoElements application is given access to the device scanner, when an application is sent to the background its state will be saved and it will automatically relinquish control of the Scanner.  When brought back to the foreground, an application previously using the scanner will have its previous configuration (eg. selected decoders) reapplied to the scanner automatically.


##Remarks


###
The following is a mapping between Attributes, their possible values and whether they are read / write:

<pre>



Attribute                      Access  Associated Value

modelNumber                      R     The model number    
serialNumber                     R     The serial number    
dateOfManufacture                R     Date of manufacture as DDMMYY    
dateOfService                    R     Date of service as DDMMYY    
bluetoothAddress                 R     Bluetooth address as FF:FF:FF:FF:FF:FF where FF is a hex number.    
firmwareVersion                  R     Scanner's operating system version.    
deviceClass                      R     The device class of the system    
batteryStatus                    R     Indicates the status us the scanner's battery, 'Unknown', 'Full', 
                                       'Medium', 'Empty', 'Charging-FullRate', 'Charging-HalfRate', 
                                       'Charging-Trickle' or 'Discharging'    
batteryCapacity                  R     Remaining capacity of the battery, integer in the range '0' to 
                                       '100'.  'Unknown' if unable to determine, e.g. if no battery in the scanner.    
batteryID                        R     'Simple', 'Double', 'Cabled', 'Unknown'    
bluetoothAuthentication          RW    'True' if authentication is required, else 'False'    
bluetoothEncryption              RW    True' if encryption is required, else 'False'    
bluetoothPinCode                 RW    Up to 5 character PIN code used for Bluetooth authentication    
bluetoothPinCodeType             RW    'PromptUser' to prompt the user for the PIN code or 'UseStored' to 
                                       use the code stored in memory.    
bluetoothReconnectAttempts       RW    How long the scanner tries to re-establish connection if it goes 
                                       out of range, in seconds.  This value must be a multiple of 5
                                       and in the range 30 to 60 seconds.
bluetoothBeepOnReconnectAttempt  RW    When 'True' scanner will emit 5 beeps every 5 seconds whilst 
                                       re-connection in progress, else 'False'    
bluetoothHidAutoReconnect        RW    'NeverReconnect', 'ReconnectOnData' or 'ReconnectImmediately'    
bluetoothFriendlyName            RW    Friendly Bluetooth name, e.g. 'MyBTScanner'    
bluetoothInquiryMode             RW    'General' to use a general inquiry mode, else 'Limited'    
bluetoothAutoReconnect           RW    Bluetooth reconnection scheme: 
                                         'None' - No scheme
                                         'OnPower' - when powered on
                                         'OnOutofRange' - when device goes out of range
                                         'OnPowerOutofRange' - when powered on or when device goes out
                                         of range.    
forceSavePairingBarcode          RW    Force saving the barcode assigned to the device to which the scanner has
                                       been paired.  'Enabled' or 'Disabled'
bluetoothDisconnect              W     Command scanner to disconnect from its connected device.
bluetoothUnpair                  W     Command scanner to unpair from its paired device.  Allows scanner to associate
                                       with a different device.
lowBatteryIndication             RW    Low battery indication 'Enabled' or 'Disabled'    
lowBatteryIndicationCycle        RW    Low battery indication cycle time, in seconds 
                                       ('10', '20', '30', '40' or '50').   
scanLineWidth                    RW    The laser scan line width, 'Wide' or 'Narrow'.
goodScansDelay                   RW    Delay between good scans in proximity continuous mode, measured in milliseconds.
                                       Range 0 to 15000.  This value must be a multiple of 100.										 
decodeFeedback                   RW    The remote scanner beeps and illuminates its green LED on a 
                                       successful decode.  'Enabled' or 'Disabled'.
ignoreCode128Usps                RW    Feature for ignoring Code 128 barcodes beginning with 420 and 421,
                                       'Enabled' or 'Disabled' 
scanTriggerWakeup                RW    Scanner trigger will wakeup the device from a low power state, 
                                       'Enabled' or 'Disabled'    
mems                             RW    Mems feature 'Enabled' or 'Disabled'    
proximityEnable                  RW    Proximity feature 'Enabled' or 'Disabled'    
proximityContinuous              RW    Proximity continuous mode 'Enabled' or 'Disabled'
proximityDistance                RW    Specify the distance for the proximity feature as 'Short', 'Medium' 
                                       or 'Long'    
pagingEnable                     RW    Specify whether paging the device is 'Enabled' or 'Disabled'    
pagingBeepSequence               RW    Range '0' to '15' to specify the pattern for the paging beep 
                                       sequence.    
pagingActivate                   W     'Start' or 'Stop' paging to the scanner.
</pre>


###ProximityEnable / Mems
If you press the trigger on an RSM scanner proximity enabled will be turned off, even though it still reports its self as being turned on if you query the RSM parameter. In order to use ProximityEnable you need to also have Mems enabled, this is the motion sensor and if you disable Mems the scanner will not function.




##Requirements

<table class="re-table"><tr><th class="tableHeading">RhoElements Version</th><td class="clsSyntaxCell clsEvenRow">1.0.0 or above
</td></tr><tr><th class="tableHeading">Supported Devices</th><td class="clsSyntaxCell clsOddRow">All supported devices that have the ability to connect to remote scanners.</td></tr><tr><th class="tableHeading">Minimum Requirements</th><td class="clsSyntaxCell clsOddRow">This tag requires appropriate hardware to run, i.e. a remote scanner and a device which supports it.</td></tr><tr><th class="tableHeading">Persistence</th><td class="clsSyntaxCell clsEvenRow">Transient - The RSM parameters are volatile and only the current value of the RSM attribute will be altered.  Changes to RSM attributes will persist until the scanner is disabled or a navigation occurs.  rsmGetEvent will persist until a navigation occurs.</td></tr></table>


##HTML/JavaScript Examples

The following example configures some parameters associated with the remote Bluetooth scanner:

	<META HTTP-Equiv="Scanner" Content="Enabled:SCN2">
	<META HTTP-Equiv="RSM" Content="BluetoothAuthentication:True">
	<META HTTP-Equiv="RSM" Content="BluetoothPinCode:5678">
	<META HTTP-Equiv="RSM" Content="BluetoothReconnectAttempts:6">
	<META HTTP-Equiv="RSM" Content="BluetoothBeepOnReconnectAttempt:True">
	<META HTTP-Equiv="RSM" Content="BluetoothPINCodeType:UseStored">
	<META HTTP-Equiv="RSM" Content="BluetoothAutoReconnect:OnPowerOutOfRange">
	
The following example retrieves some attributes of the Bluetooth Scanner:

	<SCRIPT TYPE="TEXT/JAVASCRIPT">
	
	function onRSMAttributes(jsonObject)
	{
		//  Receive array of attribute values in the order they were registered and populate SPAN tags.
		var spanID;
		var spanElement;
		for(i=0; i < jsonObject.attributeArray.length; i++)
		{
			spanID = "Span" + (i+1);
			spanElement = document.getElementById(spanID);
			spanElement.innerText = jsonObject.attributeArray[i];
		}
	}
	
	function onTest()
	{
		//Invoke some attributes to be returned 
		rsm.markForRetrievalModelNumber();	//  Array Index 0
		rsm.markForRetrievalSerialNumber();			
		rsm.markForRetrievalBluetoothAddress();		
		rsm.markForRetrievalBluetoothPinCode();
		rsm.markForRetrievalBluetoothFriendlyName();
		rsm.markForRetrievalProximityEnable();	//  Array Index 5
		
		//	Finally assign a function for RSMGetEvent, this will call onRSMAttributes with the array of parameters we have registered for above.
		rsm.rsmGetEvent = onRSMAttributes(%json);
	
	}
	</SCRIPT>
	
	<HTML>
		<HEAD>
			<!-- Scanner must be enabled to use RSM functionality -->
			<META HTTP-Equiv="Scanner" Content="Enabled:SCN2">
		</HEAD>
		<BODY>
			<a href="javascript:onTest()">Get Values</a><br>
			Model Number: <span id=Span1></span><br>
			Serial Number: <span id=Span2></span><br>
			BT Address: <span id=Span3></span><br>
			BT PINcode: <span id=Span4></span><br>
			BT Friendly Name: <span id=Span5></span><br>
			Proximity Enable: <span id=Span6></span><br>
		</BODY>
	</HTML>
	
	


