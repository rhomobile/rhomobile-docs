# Rfid Module
The Rfid Module is not included in the default RhoElements/RhoStudio installers. To be able to use the RFID module, a separate package must be downloaded and installed - please SEE REMARKS for how this can be obtained. Provides access to control the functionality of the device's RFID reader. Currently the plug-in is supported on MC 3190Z and MC 9190Z devices.

## Syntax
<table class="re-table">
	<tr>
		<th class="tableHeading">rfid (Module) &lt;META&gt; Syntax</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="rfid" content="[parameter / method]"&gt;</p></td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><p>&lt;META HTTP-Equiv="rfid" content="tagEvent:url('[jsFunction | url]')"&gt;</p></td>
	</tr>

<!-- Table Break -->

	<tr><th class="tableHeading">Rfid JavaScript Object Syntax:</th></tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">By default the JavaScript Object <b>'rfid'</b> will exist on the current page and can be used to interact directly with the rfid.
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow">To Invoke rfid methods via JavaScript use the following syntax: rfid.method();<P/>e.g. <b>rfid</b>.enumerate();
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">To Set rfid parameters via JavaScript use the following syntax: rfid.parameter = 'value'; remembering to enclose your value in quotes where appropriate.<P/>e.g. <b>rfid</b>.antennaSelected = 'value';
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow">To Set rfid return events via JavaScript use the following syntax: rfid.event = JavaScript Function;<P />e.g. <b>rfid</b>.enumRFIDEvent = 'doFunction(%json)';<P />For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents">Retrieval Events</a> page.
		</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow">To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: rfid.setEMML("[Your EMML Tags]");<P />e.g. <b>rfid</b>.setEMML("antennaSelected:<i>value</i>;enumRFIDEvent:url('JavaScript:doFunction(%json)');enumerate");
		</td>
	</tr>

<!-- Table Break -->

	<tr>
		<th class="tableHeading">Rfid Ruby Object Syntax:</th></tr>
		<tr>
			<td class="clsSyntaxCells clsOddRow">By default the Ruby Object <b>'Rfid'</b> will exist on the current page and can be used to interact directly with the Rfid. All Methods, Parameters and Events are the same as JavaScript, however, notice <b>'Rfid'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b>
			</td>
		</tr>
		<tr>
			<td class="clsSyntaxCells clsEvenRow">To Invoke Rfid methods via Ruby use the following syntax: Rfid.method()<P />e.g. <b>Rfid</b>.enumerate.
			</td>
		</tr>
		<tr>
			<td class="clsSyntaxCells clsOddRow">To Set Rfid parameters via Ruby use the following syntax: Rfid.parameter = 'value' remembering to enclose your value in quotes where appropriate.<P />e.g. <b>Rfid</b>.antennaSelected = 'value'
			</td>
		</tr>
		<tr>
			<td class="clsSyntaxCells clsEvenRow">To Set Rfid return events via Ruby use the following syntax: Rfid.event = url_for(:action =&gt; :event_callback)<P />e.g. <b>Rfid</b>.enumRFIDEvent = url_for(:action =&gt; :rfid_event_callback)<P /> For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents#params-object">Retrieval Events</a> page.<p>To access the event parameters in a Ruby callback function, you reference the @params object within the callback function. This object is simply a ruby hash {"parameter1 name" =&gt; "parameter1 value", "parameter2 name" =&gt; "parameter2 value", ...}</p>
			</td>
		</tr>
	</tr>
</table>

## Methods
Items listed in this section indicate methods or, in some cases, indicate parameters which will be retrieved.

<table class="re-table"><col width="10%" /><col width="68%" /><col width="22%" />
	<tr><th class="tableHeading">Name</th>
		<th class="tableHeading">Description</th>
		<th class="tableHeading">Default Value</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>enumerate</b></td>
		<td class="clsSyntaxCells clsOddRow">Returns a list of RFID readers present on the device, and their respective capabilities via enumRFIDEvent.  For the supported devices, this method will return the number of RFID readers in the device as 1.
		</td>
		<td class="clsSyntaxCells clsOddRow" />
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>connect</b></td>
		<td class="clsSyntaxCells clsEvenRow">Creates connection to the default RFID reader. By default, the plug-in attempts to connect to the RFID Reader whenever the plug-in is loaded.</td>
		<td class="clsSyntaxCells clsEvenRow" />
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>disconnect</b></td>
		<td class="clsSyntaxCells clsOddRow">Disconnects the current RFID connection and flushes all properties of the "rfid" module,except for the events.</td>
		<td class="clsSyntaxCells clsOddRow" />
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>stop</b></td>
		<td class="clsSyntaxCells clsEvenRow">Soft trigger to stop a runnning inventory or locateTag operation.  All the pending tag reports are discarded.</td>
		<td class="clsSyntaxCells clsEvenRow" />
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>performInventory</b></td>
		<td class="clsSyntaxCells clsOddRow">Performs an inventory operation on the RFID reader which is started and stopped according to the trigger settings done by the application. By default, performInventory starts an inventory operation immediately and there is no default stop trigger.  So, an explicit "stop" call must be made operation. Tags will be reported as part of the TagData Array in the tagEvent's JSON object.  When the property "invMemBank" is set(to either Reserved/EPC/TID/User) prior to calling performInventory, the corresponding memory-bank's data shall also be read for the tags being inventoried.  For the inventoried tags, additional fields may be reported as part of tagEvent JSON by setting to true properties such as "enableTagCRC", "enableTagPC", "enableTagSeenCount", "enableTagRSSI", "enableTagAntennaID",etc. As long as inventory operation is running, the plug-in cannot process those Meta-tags that could initiate a RFID operation like performInventory, locateTag, readTag and other Access operations. The plug-in returns an error string describing that it is busy and it can perform other RFID operations only when the inventory is stopped.</td>
		<td class="clsSyntaxCells clsOddRow" />
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>locateTag</b></td>
		<td class="clsSyntaxCells clsEvenRow">Configures the locateTag operation which will look for a specific Tag ID on a specific antennaID, and will keep reporting tagEvents if the tag is found along with relative distance (In a scale of 0-100, 100 being the closest) to help locate the requested tag. Also if the beepOnRead is enabled (Default state), the beep frequency varies proportionate to the relative distance (Geiger counter).  The tagLocationing algorithms can use only one antenna to locate a tagID.  Thus, antennaSelected cannot take the take default value 0, but one of the antenna IDs supported by the device. As with performInventory, the start and stop trigger settings can autonomously invoke and stop the locateTag operation.  Please note that while the properties "reportUniqueTags","reportTrigger" are not relevant here, the tag field settings "enableTagAntennaID", "enableTagRssi", etc are still applicable</td>
		<td class="clsSyntaxCells clsEvenRow" />
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>killTag</b></td>
		<td class="clsSyntaxCells clsOddRow">Kills the currently selected tag referenced by tagID, or kills tags that match the filter criteria. Requires tagKillPassword. tagID property is ignored if useAccessFilter property is set to true.  If useAccessFilter is set to true, then tagPatternA, tagPatternB and matchPattern will be used to filter out tags to perform the operation. If tagID is empty and useAccessFilter is false (i.e the default value),the kill operation will be attempted on all the tags in the field of view.</td>
		<td class="clsSyntaxCells clsOddRow" />
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>getRadioPowerState</b></td>
		<td class="clsSyntaxCells clsEvenRow">Returns a boolean value (1 or 0) representing the radio power state via radioPowerStateEvent.</td>
		<td class="clsSyntaxCells clsEvenRow" />
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>addPreFilter</b></td>
		<td class="clsSyntaxCells clsOddRow">Adds a pre-configured filter to the currently selected antenna.  It is used to sort out the subset of tags to participate in the next RFID operations. Multiple preFilters may be added, limited by the RFID reader.  Each of them should be referenced by a unique value (which should be assigned to preFilterID property) before calling addPreFilter method.</td>
		<td class="clsSyntaxCells clsOddRow" />
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>deletePreFilter</b></td>
		<td class="clsSyntaxCells clsEvenRow">Deletes a pre-filter of the index set by preFilterID property.</td>
		<td class="clsSyntaxCells clsEvenRow" />
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>clearPreFilters</b></td>
		<td class="clsSyntaxCells clsOddRow">Deletes ALL preFilters</td>
		<td class="clsSyntaxCells clsOddRow" />
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>radioPowerStateOn</b></td>
		<td class="clsSyntaxCells clsEvenRow">Sets the radio power of the RFID module on</td>
		<td class="clsSyntaxCells clsEvenRow" />
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>radioPowerStateOff</b></td>
		<td class="clsSyntaxCells clsOddRow">Sets the radio power of the RFID module off</td>
		<td class="clsSyntaxCells clsOddRow" />
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>tagRead</b></td>
		<td class="clsSyntaxCells clsEvenRow">Reads from a tag or  a set of tags (defined by Access filter) using the pre-configured read Parameters. The tag data is returned via a tagEvent. The read data is available in tagData.memoryBankData field of the JSON object passed to tagEvent handler. The tagID property is ignored if useAccessFilter property is set to true. If useAccessFilter is set to true, then tagPatternA, tagPatternB and matchPattern will be used to filter out tags to perform the operation. If the tagID is empty and useAccessFilter is false, the read operation will be performed on all the tags in field of view.</td>
		<td class="clsSyntaxCells clsEvenRow" />
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>tagWrite</b></td>
		<td class="clsSyntaxCells clsOddRow">Writes data to a tag or a set of tags (defined by Access filter) using the pre-configured Write parameters. The tagID property is ignored if useAccessFilter property is set to true. If useAccessFilter is set to true, then tagPatternA, tagPatternB and matchPattern will be used to filter out tags to perform the operation. If the tagID is empty and useAccessFilter is false, the write operation will be attempted on all the tags in field of view</td>
		<td class="clsSyntaxCells clsOddRow" />
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>setTagID</b></td>
		<td class="clsSyntaxCells clsEvenRow">Writes a pre-configured new tag ID to the currently selected tag.</td>
		<td class="clsSyntaxCells clsEvenRow" />
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>setTagAccessPassword</b></td>
		<td class="clsSyntaxCells clsOddRow">Writes a pre-configured new tag access password to the currently selected tag.</td>
		<td class="clsSyntaxCells clsOddRow" />
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>setTagKillPassword</b></td>
		<td class="clsSyntaxCells clsEvenRow">Writes a pre-configured new kill password to the currently selected tag.</td>
		<td class="clsSyntaxCells clsEvenRow" />
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>setSingulation</b></td>
		<td class="clsSyntaxCells clsOddRow">sets the pre-configured singulation parameters on all the antenna(e).  At least one of Session or TagPopulation parameters must be properly set before calling this method. When state-aware singulation is desired, performStateAwareSingulation is to be set to true and the configured values for SL flag and Inventory state will be matched during singulation of tags.</td>
		<td class="clsSyntaxCells clsOddRow" />
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>getSingulation</b></td>
		<td class="clsSyntaxCells clsEvenRow">Requests the current singulation parameters (session and tag population) for the antenna(e). The result is returned in a singulationEvent. Note that all antennae share the same singulation settings.</td>
		<td class="clsSyntaxCells clsEvenRow" />
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>getRFParams</b></td>
		<td class="clsSyntaxCells clsOddRow">gets the current RF Mode, Transmit power parameter for the currently selected antenna. The result is return in rfParamsEvent. The property antennaSelected cannot take default value(0) because the RF Params are returned only for one antennaID.</td>
		<td class="clsSyntaxCells clsOddRow" />
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>tagLock</b></td>
		<td class="clsSyntaxCells clsEvenRow">Locks a tag (or tags) according to the lockPrivilege and lockField, requires tagPassword. The tagID property is ignored if useAccessFilter property is set to true. If useAccessFilter is set to true, then tagPatternA, tagPatternB and matchPattern will be used to filter out tags to perform the operation. If the tagID is empty and useAccessFilter is false, the lock operation will be attempted on all the tags in field of view</td>
		<td class="clsSyntaxCells clsEvenRow" />
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>getRFModeInfo</b></td>
		<td class="clsSyntaxCells clsOddRow">Gets the RF mode information for the given RFMode index. The result is returned in a rfModeInfoEvent</td>
		<td class="clsSyntaxCells clsOddRow" />
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>setRFParams</b></td>
		<td class="clsSyntaxCells clsEvenRow">Sets the RF mode and / or transmit power of a selected antenna</td>
		<td class="clsSyntaxCells clsEvenRow" />
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>getLastAccessResult</b></td>
		<td class="clsSyntaxCells clsOddRow">gets the result of the last access operation in the lastAccessResultEvent. The result consists of numbers of tags on which the last access operation succeeded and failed. Note that this method can give valid results only after a operationCompleteEvent is received indicating that the last operation has ended.</td>
		<td class="clsSyntaxCells clsOddRow" />
	</tr>
</table>

## Parameters
Items listed in this section indicate parameters, or attributes which can be set.

<table class="re-table"><col width="20%" /><col width="20%" /><col width="38%" /><col width="22%" />
	<tr>
		<th class="tableHeading">Name</th>
		<th class="tableHeading">Possible Values</th>
		<th class="tableHeading">Description</th>
		<th class="tableHeading">Default Value</th>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>antennaSelected:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">0-N</td>
		<td class="clsSyntaxCells clsOddRow">Index of the antenna being selected for the subsequent data or configuration operations. A '0' indicates all antennas to be selected.</td>
		<td class="clsSyntaxCells clsOddRow">0(ALL)</td>
	</tr>
		<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>beepOnRead:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">true, false, 1, 0</td>
		<td class="clsSyntaxCells clsEvenRow">Specifies if the device should beep whenever application receives a tag.</td>
		<td class="clsSyntaxCells clsEvenRow">true</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>enableTagAccessStatus:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">true, false, 1, 0</td>
		<td class="clsSyntaxCells clsOddRow">Enable/Disable the access status field in the tag reports.  Contains valid values for Read/Write/Lock/Kill operations</td>
		<td class="clsSyntaxCells clsOddRow">false</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>enableTagAntennaID:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">true, false, 1, 0</td>
		<td class="clsSyntaxCells clsEvenRow">Enable/Disable the antenna ID field in the tag reports</td>
		<td class="clsSyntaxCells clsEvenRow">false</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>enableTagCRC:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">true, false, 1, 0</td>
		<td class="clsSyntaxCells clsOddRow">Enable/Disable the CRC field in the tag reports</td>
		<td class="clsSyntaxCells clsOddRow">false</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>enableTagXPC:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">true, false, 1, 0</td>
		<td class="clsSyntaxCells clsEvenRow">Enable/Disable the XPC field in the tag reports</td>
		<td class="clsSyntaxCells clsEvenRow">false</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>enableTagPC:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">true, false, 1, 0</td>
		<td class="clsSyntaxCells clsOddRow">Enable/Disable the PC field in the tag reports</td>
		<td class="clsSyntaxCells clsOddRow">false</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>enableTagRSSI:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">true, false, 1, 0</td>
		<td class="clsSyntaxCells clsEvenRow">Enable/Disable the RSSI data field in tag reports</td>
		<td class="clsSyntaxCells clsEvenRow">false</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>enableTagSeenCount:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">true, false, 1, 0</td>
		<td class="clsSyntaxCells clsOddRow">Enable/Disable the SeenCount field in tag reports</td>
		<td class="clsSyntaxCells clsOddRow">false</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>enableTagUTCTimeStamp:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">true, false, 1, 0</td>
		<td class="clsSyntaxCells clsEvenRow">Enable/Disable the UTCTimeStamp data field in tag reports</td>
		<td class="clsSyntaxCells clsEvenRow">false</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>invMemBank:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">None, Reserved, EPC, TID, User</td>
		<td class="clsSyntaxCells clsOddRow">Specifies if any memory bank is to be read during an inventory</td>
		<td class="clsSyntaxCells clsOddRow">None</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>lockField:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">killPassword, accessPassword, EPC, TID, User</td>
		<td class="clsSyntaxCells clsEvenRow">sets the data field to be used for tagLock operation</td>
		<td class="clsSyntaxCells clsEvenRow">None</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>lockPrivilege:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">lock, unlock, permanentLock, permanentUnlock</td>
		<td class="clsSyntaxCells clsOddRow">sets the lock privilege to be used for tagLock operation</td>
		<td class="clsSyntaxCells clsOddRow">None</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>matchPattern:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">A_AND_B, NOTA_AND_B, NOTA_AND_NOTB, A_AND_NOTB, A</td>
		<td class="clsSyntaxCells clsEvenRow">Match criteria to be used for filtering using tag-patterns A and B.</td>
		<td class="clsSyntaxCells clsEvenRow">A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>newTagID:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">hex password</td>
		<td class="clsSyntaxCells clsOddRow">sets a new tag ID to be assigned to the currently selected tag in the setTagID method</td>
		<td class="clsSyntaxCells clsOddRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>newAccessPassword:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">hex password</td>
		<td class="clsSyntaxCells clsEvenRow">sets a new tag access password to be assigned to the currently selected tag in the setTagAccessPassword method</td>
		<td class="clsSyntaxCells clsEvenRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>newKillPassword:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">hex password</td>
		<td class="clsSyntaxCells clsOddRow">sets a new tag kill password to be assigned to the currently selected tag in the setTagKillPassword method</td>
		<td class="clsSyntaxCells clsOddRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>performStateAwareSingulation:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">true, false, 1, 0</td>
		<td class="clsSyntaxCells clsEvenRow">If set to true, the tags will henceforth be singulated based on the configured inventory states/SL flags rather than the reader defaults. Besides, the subsequently added pre-filters should indicate the desired inventory state/SL flags of the matching / non-matching tags. If this property is set to false, the tags are singulated based on the Reader defaults.</td>
		<td class="clsSyntaxCells clsEvenRow">false</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>preFilterStateAwareAction:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">INV_A_NOT_INV_B, ASRT_SL_NOT_DSRT_SL, INV_A,ASRT_SL, NOT_INV_B, NOT_DSRT_SL, INV_A2BB2A_NOT_INV_A, NEG_SL_NOT_ASRT_SL, INV_B_NOT_INV_A, DSRT_SL_NOT_ASRT_SL, INV_B, DSRT_SL, NOT_INV_A, NOT_ASRT_SL, NOT_INV_A2BB2A, NOT_NEG_SL</td>
		<td class="clsSyntaxCells clsOddRow">Sets the State-aware Action(s) for the current pre-filter's matching and / or non-matching tags.  This property is considered only when performStateAwareSingulation is true. All actions indicating asserting/de-asserting SL flags are valid only when preFilterTarget is SL. All actions indicating changes to the inventoried states(i.e A/B) are valid only when preFilterTarget is INV_S0/INV_S1/INV_S2/INV_S3</td>
		<td class="clsSyntaxCells clsOddRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>preFilterTarget:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">SL, INV_S0, INV_S1, INV_S2, INV_S3</td>
		<td class="clsSyntaxCells clsEvenRow">Indicates which flag(i.e SL/INV_S0/INV_S1/INV_S2/INV_S3) shall be affected when the current state-Aware pre-filter is applied. This property will be considered only when performStateAwareSingulation is true.</td>
		<td class="clsSyntaxCells clsEvenRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>preFilterStateUnawareAction:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">SELECT_NOT_UNSELECT, SELECT, NOT_UNSELECT, UNSELECT, UNSELECT_NOT_SELECT, NOT_SELECT</td>
		<td class="clsSyntaxCells clsOddRow">Sets the State-unaware Action for the current pre-filter's matching and / or non-matching tags.  This property is considered only when performStateAwareSingulation is false. This determines whether to select and / or unselect matching tags / non-matching tags when the current pre-filter is applied.</td>
		<td class="clsSyntaxCells clsOddRow">SELECT_NOT_UNSELECT</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>preFilterBitCount:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">Number of applicable bits in the filterHexPattern</td>
		<td class="clsSyntaxCells clsEvenRow">Specifies the number of bits within the preFilterHexPattern to match in a subsequent call to addFilter()</td>
		<td class="clsSyntaxCells clsEvenRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>preFilterBitOffset:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">Offset from the start of the memory bank in bits</td>
		<td class="clsSyntaxCells clsOddRow">Specifies the offset into the memory bank (position) applicable to a subsequent call to addFilter()</td>
		<td class="clsSyntaxCells clsOddRow">32</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>preFilterHexPattern:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">Hex Pattern</td>
		<td class="clsSyntaxCells clsEvenRow">Specifies a hex pattern to apply in a subsequent call to addFilter()</td>
		<td class="clsSyntaxCells clsEvenRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>preFilterID:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">unsigned integer</td>
		<td class="clsSyntaxCells clsOddRow">Specifies the ID of the filter to apply in a subsequent call to addFilter()`or deleteFilter()</td>
		<td class="clsSyntaxCells clsOddRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>preFilterMemBank:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">Reserved, EPC, TID, User</td>
		<td class="clsSyntaxCells clsEvenRow">Specifies the memory bank to apply in a subsequent call to addFilter()</td>
		<td class="clsSyntaxCells clsEvenRow">EPC</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>startPeriod:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">milliseconds</td>
		<td class="clsSyntaxCells clsOddRow">Sets the repeat period for a subsequent inventory</td>
		<td class="clsSyntaxCells clsOddRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>reportTrigger:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">0-N</td>
		<td class="clsSyntaxCells clsEvenRow">This property controls the reporting of tags from the plug-in. Setting this property to N indicate to the plug-in that it should report tags on seeing N tags. 0 indicates to report tags only at the end of inventory.</td>
		<td class="clsSyntaxCells clsEvenRow">1</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>reportUniqueTags:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">true, false, 1, 0</td>
		<td class="clsSyntaxCells clsOddRow">Specifies to report only unique tags</td>
		<td class="clsSyntaxCells clsOddRow">true</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>RFMode:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">One of the supported RF Modes listed in the capabilities (see enumRFIDEvent)</td>
		<td class="clsSyntaxCells clsEvenRow">Sets the RFMode of the currently selected antenna(e)</td>
		<td class="clsSyntaxCells clsEvenRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>singulationSession:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">0-3</td>
		<td class="clsSyntaxCells clsOddRow">Sets the singulation session parameter</td>
		<td class="clsSyntaxCells clsOddRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>singulationTagPopulation:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">unsigned short integer</td>
		<td class="clsSyntaxCells clsEvenRow">Sets the singulation tag population parameter</td>
		<td class="clsSyntaxCells clsEvenRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>singulationInventoryState:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">INV_A, INV_B</td>
		<td class="clsSyntaxCells clsOddRow">Indicates the inventory state [A or B] to be matched during the singulation.</td>
		<td class="clsSyntaxCells clsOddRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>singulationSLFlag:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">SL_ASSERTED, SL_DEASSERTED</td>
		<td class="clsSyntaxCells clsEvenRow">Indicates the SL bit [asserted or deasserted] to be matched during the singulation.</td>
		<td class="clsSyntaxCells clsEvenRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>startTriggerType:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">immediate, triggerPress, triggerRelease, periodicStart</td>
		<td class="clsSyntaxCells clsOddRow">Specifies the start triggers allowed for performInventory and tagLocate methods</td>
		<td class="clsSyntaxCells clsOddRow">immediate</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>stopDuration:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">milliseconds</td>
		<td class="clsSyntaxCells clsEvenRow">Sets the duration of a inventory or locateTag</td>
		<td class="clsSyntaxCells clsEvenRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>stopObservationCount:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">unsigned integer</td>
		<td class="clsSyntaxCells clsOddRow">Stops the inventory or locateTag after n tags are found</td>
		<td class="clsSyntaxCells clsOddRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>stopTriggerType:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">triggerPress, triggerRelease, duration, tagObservation</td>
		<td class="clsSyntaxCells clsEvenRow">Specifies the stop-triggers allowed for performInventory and tagLocate methods</td>
		<td class="clsSyntaxCells clsEvenRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>tagByteOffset:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">unsigned integer</td>
		<td class="clsSyntaxCells clsOddRow">sets the offset into the selected memory Bank to use for the next access of the currently selected tag</td>
		<td class="clsSyntaxCells clsOddRow">0</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>tagID:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">Tag ID in hex</td>
		<td class="clsSyntaxCells clsEvenRow">Select an RFID Tag ID to perform further operations on</td>
		<td class="clsSyntaxCells clsEvenRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>tagKillPassword:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">hex kill password</td>
		<td class="clsSyntaxCells clsOddRow">sets the password to use when calling the killTag method</td>
		<td class="clsSyntaxCells clsOddRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>tagMemBank:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">Reserved, EPC, TID, User</td>
		<td class="clsSyntaxCells clsEvenRow">sets the memory bank to access within the currently selected tag.</td>
		<td class="clsSyntaxCells clsEvenRow">EPC</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>tagPassword:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">hex password</td>
		<td class="clsSyntaxCells clsOddRow">Sets the access password to use when accessing the currently selected tag.</td>
		<td class="clsSyntaxCells clsOddRow">00000000</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>tagPatternAByteOffset:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">Offset from the start of the memory bank in bytes</td>
		<td class="clsSyntaxCells clsEvenRow">Specifies the offset into the memory bank (position)</td>
		<td class="clsSyntaxCells clsEvenRow">4</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>tagPatternAHexMask:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">Hex Mask</td>
		<td class="clsSyntaxCells clsOddRow">Specifies the mask for above pattern</td>
		<td class="clsSyntaxCells clsOddRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>tagPatternAHexPattern:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">Hex Pattern</td>
		<td class="clsSyntaxCells clsEvenRow">Specifies a hex pattern to be used for comparing memory bank data</td>
		<td class="clsSyntaxCells clsEvenRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>tagPatternAMemBank:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">Reserved, EPC, TID, User</td>
		<td class="clsSyntaxCells clsOddRow">Specifies the memory bank for the tag pattern A</td>
		<td class="clsSyntaxCells clsOddRow">EPC</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>tagPatternBByteOffset:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">Offset from the start of the memory bank in bytes</td>
		<td class="clsSyntaxCells clsEvenRow">Specifies the offset into the memory bank (position)</td>
		<td class="clsSyntaxCells clsEvenRow">4</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>tagPatternBHexMask:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">Hex Mask</td>
		<td class="clsSyntaxCells clsOddRow">Specifies the mask for above pattern</td>
		<td class="clsSyntaxCells clsOddRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>tagPatternBHexPattern:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">Hex Pattern</td>
		<td class="clsSyntaxCells clsEvenRow">Specifies a hex pattern to be used for comparing memory bank data</td>
		<td class="clsSyntaxCells clsEvenRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>tagPatternBMemBank:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">Reserved, EPC, TID, User</td>
		<td class="clsSyntaxCells clsOddRow">Specifies the memory bank for the tag pattern B</td>
		<td class="clsSyntaxCells clsOddRow">EPC</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>tagReadSize:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">0 (all) - N bytes</td>
		<td class="clsSyntaxCells clsEvenRow">sets the number of bytes to read in the tagRead method.</td>
		<td class="clsSyntaxCells clsEvenRow">0 (all)</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>tagWriteData:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">hex data</td>
		<td class="clsSyntaxCells clsOddRow">sets the data to write in the tagWrite method</td>
		<td class="clsSyntaxCells clsOddRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow"><b>transmitPower:[Value]</b></td>
		<td class="clsSyntaxCells clsEvenRow">power in dbm derived from min, max and step values provided in the enumRFIDevent</td>
		<td class="clsSyntaxCells clsEvenRow">Specifies the transmit power to be used in a subsequent call to setTransmitPower</td>
		<td class="clsSyntaxCells clsEvenRow">N/A</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsOddRow"><b>useAccessFilter:[Value]</b></td>
		<td class="clsSyntaxCells clsOddRow">true, false, 1, 0</td>
		<td class="clsSyntaxCells clsOddRow">Specifies whether to use the access filter in tag access operations</td>
		<td class="clsSyntaxCells clsOddRow">false</td>
	</tr>
</table>

##Events
Values are returned to the caller in RhoElements via Events.  Most modules contain events and those returned from this module are given below along with the event parameters.  Events can cause a navigation to a new URL or a JavaScript function on the page to be invoked.  Each event will in most cases have a number of parameters associated with it which will either be strings or JavaScript arrays.  Event parameters can be accessed either directly or via JSON objects.

### enumRFIDEvent
Enumerates the RFID readers present on the device (normally only one) along with their respective capabilities
<table class="re-table"><col width="3%" /><col width="20%" /><col width="77%" />
	<tr>
		<th class="tableHeading">ID</th>
		<th class="tableHeading">Name</th>
		<th class="tableHeading">Description</th>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">1</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>numberOfDevices</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">returns total number of device enumerated, returns always 1</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">2</td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>readerID</b></td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">ID assigned to reader</td>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">3</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>firmwareVersion</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">Firmware version of the reader</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">4</td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>modelName</b></td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">Model FX, MC</td>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">5</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>numberOfAntennas</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">Antennas supported/connected by/to reader</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">6</td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>numberOfPreFilters</b></td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">Total number of pre-filters available </td>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">7</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>countryCode</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">region configured</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">8</td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>communicationStandard</b></td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">country/region frequency band standards</td>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">9</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>transmitPowerMin</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">Minimum transmit power supported by reader 500dbm</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">10</td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>transmitPowerMax</b></td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">Maximum transmit power supported by reader 3000dbm</td>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">11</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>transmitPowerStep</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">Transmit power can be set in multiple of value - step</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">12</td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>numberOfRFModes</b></td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">Number of supported RFModes</td>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">13</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>stateAwareSingulationSupported</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">Indicates whether Inventory State Aware Singulation is supported by the Reader.</td>
	</tr>
</table>

### rfParamsEvent
Returns RF Parameter values - Transmit Power and RF Mode of a selected antenna
<table class="re-table"><col width="3%" /><col width="20%" /><col width="77%" />
	<tr>
		<th class="tableHeading">ID</th>
		<th class="tableHeading">Name</th>
		<th class="tableHeading">Description</th>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">1</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>transmitPower</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">radiated power in db</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">2</td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>RFMode</b></td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">RF Mode Table Index</td>
	</tr>
</table>

### rfModeInfoEvent
Returns the RF Characteristics for a particular RF Mode
<table class="re-table"><col width="3%" /><col width="20%" /><col width="77%" />
	<tr>
		<th class="tableHeading">ID</th>
		<th class="tableHeading">Name</th>
		<th class="tableHeading">Description</th>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">1</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>modeIdentifier</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">Refer to EPC-Global's definition</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">2</td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>divideRatio</b></td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">Refer to EPC-Global's definition</td>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">3</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>bdrValue</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">Refer to EPC-Global's definition</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">4</td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>modulation</b></td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">Refer to EPC-Global's definition</td>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">5</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>forwardLinkModulationType</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">Refer to EPC-Global's definition</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">6</td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>pieValue</b></td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">Refer to EPC-Global's definition</td>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">7</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>minTariValue</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">Refer to EPC-Global's definition</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">8</td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>maxTariValue</b></td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">Refer to EPC-Global's definition</td>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">9</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>stepTariValue</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">Refer to EPC-Global's definition</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">10</td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>spectralMaskIndicator</b></td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">Refer to EPC-Global's definition</td>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">11</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>epcHAGTCConformance</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">Refer to EPC-Global's definition</td>
	</tr>
</table>

### tagEvent
Returns received RFID tag data from N tags, where N = reportTrigger. Typically methods like performInventory, tagLocate, readTag/writeTag/lockTag/killTag (performed on one or more tags) generate tagEvents with necessary data.
<table class="re-table"><col width="3%" /><col width="20%" /><col width="77%" />
	<tr>
		<th class="tableHeading">ID</th>
		<th class="tableHeading">Name</th>
		<th class="tableHeading">Description</th>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">1</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>TagData (tagID, PC, tagSeenCount, memoryBankData, XPC, CRC, antennaID, RSSI, accessStatus, relativeDistance, firstSeenTimeStamp)</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">Tag data array with various parameter of read tag TagData[1..N]</td>
	</tr>
</table>

### radioPowerStateEvent
Returns 1 if the radio is ON and 0 if the radio is off
<table class="re-table"><col width="3%" /><col width="20%" /><col width="77%" />
	<tr>
		<th class="tableHeading">ID</th>
		<th class="tableHeading">Name</th>
		<th class="tableHeading">Description</th>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">1</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>powerState</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">Radio is on/off</td>
	</tr>
</table>

### statusEvent
Returns any error conditions where required
<table class="re-table"><col width="3%" /><col width="20%" /><col width="77%" />
	<tr>
		<th class="tableHeading">ID</th>
		<th class="tableHeading">Name</th>
		<th class="tableHeading">Description</th>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">1</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>method</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">Name of method where exactly error was generated</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">2</td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>errorCode</b></td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">standard RFID API error code or a plug-in specific error code. Plug-in Error code Description.<br/>
2000 - One of the relevant parameters is invalid or missing.<br/>
2001 - Plug-in Busy.<br/>
2002 - Failed to create a plug-in thread.<br/>
2003 - Plug-in Cannot process properties or methods unless connected.<br/>
		</td>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">3</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>vendorMessage</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">Additional Error Info if any</td>
	</tr>
</table>

### singulationEvent
Returns singulation values.

<table class="re-table"><col width="3%" /><col width="20%" /><col width="77%" />
	<tr>
		<th class="tableHeading">ID</th>
		<th class="tableHeading">Name</th>
		<th class="tableHeading">Description</th></tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">1</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>singulationSession</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">Indicates the session in which the antenna singulates</td>
	</tr>
		<tr>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">2</td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>singulationTagPopulation</b></td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">Indicates the tag-population that the reader considers is in an antenna's field of view</td>
	</tr>
		<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">3</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>performStateAwareSingulation</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">Indicates whether the antennas perform stateAware-singulation.</td>
	</tr>
		<tr>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">4</td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>singulationSLFlag</b></td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">Indicates which SL bit(asserted or deasserted) will be matched during singulation</td>
	</tr>
		<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">5</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>singulationInventoryState</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">Indicates which inventory state [A or B] will be matched during the singulation</td>
	</tr>
</table>

### operationCompleteEvent
Indicates the currently running operation (Inventory/Access/Locationing) is complete and there are no more tags to report.
<table class="re-table"><col width="3%" /><col width="20%" /><col width="77%" />
	<tr>
		<th class="tableHeading">ID</th>
		<th class="tableHeading">Name</th>
		<th class="tableHeading">Description</th>
	</tr>
</table>

### lastAccessResultEvent
Returns results of the last Access operation
<table class="re-table"><col width="3%" /><col width="20%" /><col width="77%" />
	<tr>
		<th class="tableHeading">ID</th>
		<th class="tableHeading">Name</th>
		<th class="tableHeading">Description</th>
	</tr>
	<tr>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">1</td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>tagsSucceeded</b></td>
		<td style="text-align:left;" class="clsSyntaxCells clsOddRow">Number of tags on which the access operation succeeded.</td>
	</tr>
	<tr>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">2</td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>tagsFailed</b></td>
		<td class="clsSyntaxCells clsEvenRow" style="text-align:left;">Number of tags on which the access operation failed.</td>
	</tr>
</table>

## Remarks
### Installation
The RFID plug-in package for RhoElements 2.2 SP1 must be [downloaded separately on Zebra Technologies Support Site](http://goo.gl/4IwC6T) and installed on the device. Please refer to the RFID plug-in release notes included with the download for installation instructions. You can find a sample app [here](http://goo.gl/arDsF2) to see how to use rfid as the RhoMobile framework expects it to be used. And you can find release notes for the rfid plug-in and the sample app [here](http://goo.gl/VtCDnO). Once you have the plug-in installed, you'll also need to modify your config.xml setting `PreloadLegacyActiveX` and set it to '1' as such:

	:::xml
	<PreloadLegacyActiveX value="1"/>

### General
By default the plug-in, when loaded, is already connected to RFID Module. In order to disconnect, one may use disconnect() method call on the rfid object. After a successful disconnection, the connect() method may be used to make a new connection to the RFID Module. For a plug-in method to be successfully invoked, all of its associated non-default properties must be successfully set prior to making the call.

### Waiting for operationCompleteEvent
When RhoElements finishes execution of a plug-in method call, the corresponding RFID operation may not have been completed, rather it may have just been started. Specifically, for performInventory, tagLocate, tag access operations (readTag/writeTag/lockTag/killTag) using access-filter or performed on all tags, the corresponding method call just initiates the corresponding RFID operation. These operations generate Tag-reports, and once all the reports are completely sent to the application, the plug-in sends a operationCompleteEvent. The disconnect() method also gives an operationCompleteEvent back to the application. It is important that the application register for operationCompleteEvent and further method calls will have to be made only after the reception of this event.

### Handling the TagEvent
TagEvent should be assigned to a Callback that handles the tag-reports arising out of Inventory/Locationing/Read/Write/Lock/Kill operations. Every tagEvent callback should usually result in JSON TagData Array object of length equalling to the reportTrigger property set. However, in the contingency that the RFID operation has ended and the plug-in hasn't accumulated reportTrigger number of tagData objects, then the pending tags are all sent to the tagEvent callback.

### Access Operation Status Codes
For an access operation performed by using an access filter or an access operation performed on all tags, the status code only indicates that the operation has been successfully started. Setting enableTagAccessStatus to true generates Tag reports with the tagID and status of the access operation on the corresponding tagID. However, for a single tag access operation, the statusEvent indicates the result of the access operation for the given tagID.

### Handling the operationCompleteEvent
When RhoElements finishes execution of a plug-in method call, the corresponding RFID operation may not have been completed, rather it may have just been started. Specifically, for performInventory, tagLocate, tag access operations (readTag/writeTag/lockTag/killTag) using access-filter or performed on all tags, the corresponding method call just initiates the corresponding RFID operation. These operations generate Tag-reports, and once all the reports are completely sent to the application, the plug-in sends a operationCompleteEvent.

### Plug-in Busy
The Plug-in can perform only one RFID protocol operation (Inventory/Read/Write/Locate/Kill) at a time. Trying to invoke a new operation when an existing one is still running, will generate a "Plugin Busy" error. Irrespective whether stop method is called or not, the plug-in is ready to initiate a new operation only after it sends the operationCompleteEvent. Trying to start a new operation before the event is received will return a "Plugin Busy error".

### Deleting Pre-filters
Once a pre-filter is added with a particular ID, the same ID should be used to reference it when deleting it.

### Tag Locating
Tag Locating can be performed only a particular antennaID.

### Access Operations On All Visible Tags
One can perform an access operation on all tags in the field of view by setting rfid.tagID to an empty string("")

### Access Filters
Access-filter can take up to tag-patterns. By default, match pattern used is Pattern-A alone and settings for tagPattern B are not considered unless specified by the appropriate matchPattern.

## Requirements
<table class="re-table">
	<tr>
		<th class="tableHeading">RhoElements Version</th>
		<td class="clsSyntaxCell clsEvenRow">2.2 SP1 - Additional Download Required or above</td>
	</tr>
	<tr>
		<th class="tableHeading">Supported Devices</th><td class="clsSyntaxCell clsOddRow">MC 3190Z, MC 9190Z</td>
	</tr>
	<tr>
		<th class="tableHeading">Minimum Requirements</th><td class="clsSyntaxCell clsOddRow">Hardware for reading RFID Tags</td>
	</tr>
	<tr>
		<th class="tableHeading">Persistence</th><td class="clsSyntaxCell clsEvenRow">Not Persistent - Changes to this module will not persist when navigating to a new page.</td>
	</tr>
</table>

## HTML/JavaScript Examples
This example starts an inventory using HTTP Meta Tags and tags are sent to a JavaScript function "TagHandler".

	:::html
	<META HTTP-Equiv="rfid" content="statusEvent:url('javascript:statusHandler(%json)')">
	<META HTTP-Equiv="rfid" content="tagEvent:url('javascript:TagHandler(%json)')">
	<META HTTP-Equiv="rfid" content="performInventory">
	<script>
		// Function to handle a tagReport containing only tagID field
		function TagHandler(tagReportJSON){
		   objGeneric.Log("TagID read:"+tagReportJSON.TagData[0].tagID,3);
		}
	</script>


This example runs inventory as long as trigger button is pressed. By default, the plug-in reports unique tags to tagEvent callback in JSON format and beeps for every unique tag encountered. By default, only one tagID is reported per the JSON tagReport. Besides, this JSON contains only the field tagID.

	:::html
	<script>
		var objGeneric = new ActiveXObject("PocketBrowser.Generic");
		objGeneric.InvokeMETAFunction("OnTrigger", "javascript:doTrigger('%s')");
		rfid.statusEvent = "statusHandler(%json)";

		function doTrigger(state){

		  if(state == 0){
			  rfid.stop();
		  }
		  else{
			  rfid.tagEvent =  "TagHandler(%json)";
			  rfid.performInventory();
		  }
		}

		// Function to handle a tagReport containing only tagID field
		function TagHandler(tagReportJSON){
		   objGeneric.Log("TagID read:"+tagReportJSON.TagData[0].tagID,3);
		}

		function statusHandler(statusJSON){
		  objGeneric.Log("Status:"+statusJSON.method+'  '+statusJSON.errorCode,1);
		}
	</script>

This example performs inventory with start and stop triggers configured. Here all the tag-reads are reported to tagEvent callback with 5 reports per callback. Besides, the tagSeenCount and the UTCTtimestamp at which tag was first seen is also reported. Note:It will still beep for only unique tags read.

	:::html
	<script>
		var objGeneric = new ActiveXObject("PocketBrowser.Generic");
		rfid.statusEvent = "statusHandler(%json)";

		function performAdvancedInventory1(){
			rfid.tagEvent =  "TagHandlerAdvanced1(%json)";
			rfid.reportUniqueTags = false;
			rfid.reportTrigger = 5;
			rfid.enableTagSeenCount = true;
			rfid.enableTagUTCTimeStamp = true;
			rfid.startTriggerType = "triggerPress";
			rfid.stopTriggerType = "duration";
			rfid.stopDuration = 10000;// Duration in milliseconds.
			rfid.performInventory();
		}

		// Function to handle tagReports containing tagID, seenCount and firstSeenTimeStamp fields.
		function TagHandlerAdvanced1(tagReportJSON){
		   objGeneric.Log("TagID :"+tagReportJSON.TagData[0].tagID+" Seen Count: "+tagReportJSON.TagData[0].tagSeenCount+" First seen Timestamp:"+tagReportJSON.TagData[0].firstSeenTimeStamp,3);
		   objGeneric.Log("TagID :"+tagReportJSON.TagData[1].tagID+" Seen Count: "+tagReportJSON.TagData[1].tagSeenCount+" First seen Timestamp:"+tagReportJSON.TagData[1].firstSeenTimeStamp,3);
		   objGeneric.Log("TagID :"+tagReportJSON.TagData[2].tagID+" Seen Count: "+tagReportJSON.TagData[2].tagSeenCount+" First seen Timestamp:"+tagReportJSON.TagData[2].firstSeenTimeStamp,3);
		   objGeneric.Log("TagID :"+tagReportJSON.TagData[3].tagID+" Seen Count: "+tagReportJSON.TagData[3].tagSeenCount+" First seen Timestamp:"+tagReportJSON.TagData[3].firstSeenTimeStamp,3);
		   objGeneric.Log("TagID :"+tagReportJSON.TagData[4].tagID+" Seen Count: "+tagReportJSON.TagData[4].tagSeenCount+" First seen Timestamp:"+tagReportJSON.TagData[4].firstSeenTimeStamp,3);
		}

		function statusHandler(statusJSON){
		   objGeneric.Log("Status:"+statusJSON.method+'  '+statusJSON.errorCode,1);
		}
	</script>

This example performs inventory and reads the Reserved memory Bank of all tags inventoried. The tags are selected to match a particular pre-filter pattern (EPC starts with "9742") The tagEvent handler extracts both tagID and memoryBankData fields. Inventory is stopped after 10 tag-reads are observed

	:::html
	<script>
		var objGeneric = new ActiveXObject("PocketBrowser.Generic");
		rfid.statusEvent = "statusHandler(%json)";

		function performAdvancedInventory2(){
			rfid.tagEvent =  "TagHandlerAdvanced2(%json)";
			rfid.stopTriggerType = "tagObservation";
			rfid.stopObservationCount = 10;
			rfid.preFilterID = 1;
			rfid.preFilterMemBank = "EPC";
			rfid.preFilterBitOffset = 32;
			rfid.preFilterHexPattern = "9742";
			rfid.preFilterBitCount = 16;
			rfid.addPreFilter();
			rfid.invMemBank = "Reserved";
			rfid.performInventory();
		}

		// Function to handle tagReports containing tagID, seenCount and firstSeenTimeStamp fields.
		function TagHandlerAdvanced2(tagReportJSON){
		   objGeneric.Log("TagID :"+tagReportJSON.TagData[0].tagID+" Reserved MemoryBank Data: "+tagReportJSON.TagData[0].memoryBankData,1);
		}

		function statusHandler(statusJSON){
		   objGeneric.Log("Status:"+statusJSON.method+'  '+statusJSON.errorCode,1);
		}
	</script>

This example gets the capabilities of the local RFID Module and configures the antenna's RF and Singulation parameters. The application should register JavaScript callbacks for the enumRFIDEvent and rfParamsEvent events.

	:::html
	<script>
		var objGeneric = new ActiveXObject("PocketBrowser.Generic");
		rfid.statusEvent = "statusHandler(%json)";

		function EnumerateRFIDModule(){
		  rfid.enumRFIDEvent = "enumerateRFIDHandler(%json)";
		  objGeneric.Log("In EnumerateRFIDModule :",3);
		  rfid.enumerate();
		  ConfigureRFIDModule();
		}

		function enumerateRFIDHandler(enumRFIDJSON){
		  objGeneric.Log("Number of Devices:"+enumRFIDJSON.numberOfDevices,3);
		  objGeneric.Log("Reader ID:"+enumRFIDJSON.readerID,3);
		  objGeneric.Log("Firmware version:"+enumRFIDJSON.firmwareVersion,3);
		  objGeneric.Log("Model Name:"+enumRFIDJSON.modelName,3);
		  objGeneric.Log("Number of Antennas:"+enumRFIDJSON.numberOfAntennas,3);
		  objGeneric.Log("Number of Prefilters:"+enumRFIDJSON.numberOfPreFilters,3);
		  objGeneric.Log("Country code:"+enumRFIDJSON.countryCode,3);
		  objGeneric.Log("Communication standard:"+enumRFIDJSON.communicationStandard,3);
		  objGeneric.Log("Minimum Transmit Power:"+enumRFIDJSON.transmitPowerMin,3);
		  objGeneric.Log("Maximum Transmit Power:"+enumRFIDJSON.transmitPowerMax,3);
		  objGeneric.Log("Step Transmit Power:"+enumRFIDJSON.transmitPowerStep,3);
		  objGeneric.Log("Supported RF Modes:"+enumRFIDJSON.numberOfRFModes,3);
		  objGeneric.Log("State Aware Singulation:"+enumRFIDJSON.stateAwareSingulationSupported,3);
		}

		function ConfigureRFIDModule(){
		  rfid.singulationEvent = "getSingulationHandler(%json)";
		  rfid.rfParamsEvent = "getRFParamsHandler(%json)";

		  rfid.singulationSession  = "1";
		  rfid.singulationTagPopulation = "100";

		  rfid.RFMode = "4";             // Mode table Index
		  rfid.transmitPower = "25.20";  // Transmit Power in dbM

		  rfid.setSingulation(); // Applies on both the antennas.
		  rfid.setRFParams();

		  rfid.antennaSelected = 1;  // To verify if the settings have indeed been applied.
		  rfid.getSingulation();
		  rfid.getRFParams();
		}

		function getRFParamsHandler(RFParamsJSON){
		  objGeneric.Log("RFMode of Antenna 1:"+RFParamsJSON.RFMode,3);
		  objGeneric.Log("Transmit Power of Antenna 1:"+RFParamsJSON.transmitPower,3);
		}

		function getSingulationHandler(singulationJSON){
		  objGeneric.Log("Session of Antenna 1:"+singulationJSON.singulationSession,3);
		  objGeneric.Log("Tag Population of Antenna 1:"+singulationJSON.singulationTagPopulation,3);
		}

		function statusHandler(statusJSON){
		  objGeneric.Log("Status:"+statusJSON.method+'  '+statusJSON.errorCode,1);
		}
	</script>

This example performs TagLocationing operation and reports the real-time relative distance information of the tag being located.

	:::html
	<script>
		var objGeneric = new ActiveXObject("PocketBrowser.Generic");
		rfid.statusEvent = "statusHandler(%json)";

		function TagLocationing(){
			rfid.tagEvent = "TagLocateHandler(%json)";
			rfid.antennaSelected = 1;
			rfid.tagID = "97427423111111111111111111111111111111111111111111111111";
			rfid.locateTag();
			setTimeout("stopRunningLocate()",10000);
		}

		function stopRunningLocate(){
			rfid.stop();

		}

		function TagLocateHandler(tagReportJSON){
			objGeneric.Log("TagID :"+tagReportJSON.TagData[0].tagID+" Relative Distance: "+tagReportJSON.TagData[0].relativeDistance,1);
		}

		function statusHandler(statusJSON){
		   objGeneric.Log("Status:"+statusJSON.method+'  '+statusJSON.errorCode,1);
		}
	</script>

This example performs Read operation on a particular tagID.

	:::html
	<script>
		var objGeneric = new ActiveXObject("PocketBrowser.Generic");
		rfid.statusEvent = "statusHandler(%json)";

		function readSingleTag(){
			rfid.tagID = "97427423111111111111111111111111111111111111111111111111";
			rfid.tagEvent =  "TagMemBankHandler(%json)";
			rfid.tagByteOffset = 4;
			rfid.tagMemBank = "Reserved";
			rfid.tagReadSize = 4;
			rfid.tagRead();
		}

		function TagMemBankHandler(tagReportJSON){
		  objGeneric.Log("TagID :"+tagReportJSON.TagData[0].tagID+" Access Password: "+tagReportJSON.TagData[0].memoryBankData,1);
		}

		function statusHandler(statusJSON){
		   objGeneric.Log("Status:"+statusJSON.method+'  '+statusJSON.errorCode,1);
		}
	</script>

This example performs Read operation on all tags that match a particular tagPattern(access-filter). Reads User memory bank of all tags whose EPC start with "9742".

	:::html
	<script>
		var objGeneric = new ActiveXObject("PocketBrowser.Generic");
		rfid.statusEvent = "statusHandler(%json)";
		function testReadMultipleTags(){
		  var selectedTagPattern = "9742";
		  var hexMaskStr = "";var i =0;
		  for(i =0;i < selectedTagPattern.length;i++)
		  hexMaskStr += "F";

		  rfid.useAccessFilter = true;
		  rfid.matchPattern = "A";
		  rfid.tagPatternAMemBank = "EPC";
		  rfid.tagPatternAByteOffset = 4;
		  rfid.tagPatternAHexPattern = selectedTagPattern;
		  rfid.tagPatternAHexMask = hexMaskStr.toString();
		  hexMaskStr = "";
		  for(i=0;i < selectedTagPattern.length;i++)
		  hexMaskStr += "F";

		  rfid.tagByteOffset = 0;
		  rfid.tagMemBank = "User";
		  rfid.tagReadSize = 0;
		  rfid.tagEvent =  "TagMemBankHandler(%json)";
		  rfid.tagRead();
		}

		function TagMemBankHandler(tagReportJSON){
		  objGeneric.Log("TagID :"+tagReportJSON.TagData[0].tagID+" User Memory Data: "+tagReportJSON.TagData[0].memoryBankData,1);
		}

		function statusHandler(statusJSON){
		  objGeneric.Log("Status:"+statusJSON.method+'  '+statusJSON.errorCode,1);
		}
	</script>

This example shows the usage of State aware pre-filters and operationCompleteEvent. This function tries to search for a tag whose EPC starts with "56780000"

	:::html
	<script>
		var objGeneric = new ActiveXObject("PocketBrowser.Generic");
		var tagCount = 0;

		function testStateAwarePreFilter(){
		  rfid.tagEvent =  "TagHandler(%json)";
		  rfid.statusEvent = "statusHandler(%json)";
		  rfid.operationCompleteEvent = "operCompleteHandler()";

		  rfid.performStateAwareSingulation = true;

		  rfid.singulationSLFlag = "SL_ASSERTED";
		  rfid.singulationInventoryState = "INV_B";
		  rfid.setSingulation();

		  rfid.preFilterID = 0;
		  rfid.preFilterHexPattern = "0000";
		  rfid.preFilterMemBank = "EPC";
		  rfid.preFilterBitOffset = 48;
		  rfid.preFilterStateAwareAction = "INV_B_NOT_INV_A";
		  rfid.preFilterTarget = "INV_S0";
		  rfid.addPreFilter();

		  rfid.preFilterID = 1;
		  rfid.preFilterHexPattern = "5678";
		  rfid.preFilterBitOffset = 32;
		  rfid.preFilterStateAwareAction = "ASRT_SL_NOT_DSRT_SL";
		  rfid.preFilterTarget = "SL";
		  rfid.addPreFilter();

		  rfid.reportUniqueTags = false;
		  rfid.beepOnRead = true;
		  rfid.stopTriggerType = "tagObservation";
		  rfid.stopObservationCount = 10;
		  rfid.performInventory();
		}

		function operCompleteHandler(){
			alert('Operation Complete. Total tags received:'+tagCount.toString());
		}

		function TagHandler(tagReportJSON){
			tagCount += tagReportJSON.TagData.length;
			objGeneric.Log("TagID :"+tagReportJSON.TagData[0].tagID,1);

		}

		function statusHandler(statusJSON){
		  objGeneric.Log("Status:"+statusJSON.method+'  '+statusJSON.errorCode,1);
		}
	</script>

This example shows the usage of getLastAccessResult method. At the completion of a multiple tag Write operation, the latter method is called to find out how many tags the operation succeeded and failed.

	:::html
	<script>
		var objGeneric = new ActiveXObject("PocketBrowser.Generic");
		var tagCount = 0;
		function writeMultipleTags(){
		  rfid.tagEvent =  "TagAccessStatusFieldHandler(%json)";
		  rfid.statusEvent = "statusHandler(%json)";
		  rfid.operationCompleteEvent = "operCompleteHandler()";
		  rfid.lastAccessResultEvent = "lastAccessResultHandler(%json)";
		  clear();

		  var hexMaskStr = "";var i =0;
		  for(i =0;i<8;i++)
		  hexMaskStr += "F";
		  rfid.enableTagAccessStatus = true;
		  rfid.useAccessFilter = true;
		  rfid.tagPatternAMemBank = "Reserved";
		  rfid.tagPatternAByteOffset = 4;
		  rfid.tagPatternAHexPattern = "FFFFFFFF";
		  rfid.tagPatternAHexMask = hexMaskStr.toString();
		  rfid.tagByteOffset = 4;
		  rfid.tagMemBank = "EPC";
		  rfid.tagWriteData = "EEEEAAAA";
		  rfid.tagWrite();
		}

		function TagAccessStatusFieldHandler(tagReportJSON){
			objGeneric.Log("TagID:"tagReportJSON.TagData[0].tagID+" Access Status "+tagReportJSON.TagData[0].accessStatus);
		}

		function operCompleteHandler(){
			rfid.getLastAccessResult();
		}

		function lastAccessResultHandler(accessResultJSON){
			alert("Success: "+accessResultJSON.tagsSucceeded.toString()+" Failures: "+accessResultJSON.tagsFailed.toString());
		}

		function statusHandler(statusJSON){
		  objGeneric.Log("Status:"+statusJSON.method+'  '+statusJSON.errorCode,1);
		}
	</script>