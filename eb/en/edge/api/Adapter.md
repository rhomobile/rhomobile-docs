#Adapter


## Overview
NFC Adapter
## Enabling the API
In order to use this API you must TBD INSERT Eb specific instructions here

        


##Methods



### activate()
<p>Activates the NFC device so that all the NFC operations will be executed.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Adapter.activate()</code> 


### btConnect()
<p>Connects the Bluetooth device to obtain device properties.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>btName : <span class='text-info'>STRING</span><p>
<p>Device name.</p>
 </p></li><li>btAddress : <span class='text-info'>STRING</span><p>
<p>Device MAC address.</p>
 </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Adapter.btConnect()</code> 


### btDisconnect()
<p>Disconnects the Bluetooth device.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Adapter.btDisconnect()</code> 


### getDeviceInfo()
<p>Gets the NFC device capabilities.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>operatingModesSupported : <span class='text-info'>ARRAY</span><p>
<p>{}</p>
 </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p><p><strong>Possible Values</strong> :</p> <dt>Constant: EB.Adapter.NFC_P2P <br/> String: 1 </dt><dd></dd><dt>Constant: EB.Adapter.NFC_Reader_Writer <br/> String: 2 </dt><dd></dd><dt>Constant: EB.Adapter.NFC_CE <br/> String: 3 </dt><dd></dd><dt>Constant: EB.Adapter.NFC_CE_UICC <br/> String: 4 </dt><dd></dd><dt>Constant: EB.Adapter.NFC_CE_SE <br/> String: 5 </dt><dd></dd><dt>Constant: EB.Adapter.NFC_CE_Host <br/> String: 6 </dt><dd></dd><dt>Constant: EB.Adapter.Multiple_NDEFMessages <br/> String: 7 </dt><dd></dd><dt>Constant: EB.Adapter.NFC_LLCP <br/> String: 8 </dt><dd></dd><dt>Constant: EB.Adapter.NFC_SNEP <br/> String: 9 </dt><dd></dd><dt>Constant: EB.Adapter.NFC_NPP <br/> String: 10 </dt><dd></dd><dt>Constant: EB.Adapter.NFC_BT_StaticHandover <br/> String: 11 </dt><dd></dd><dt>Constant: EB.Adapter.NFC_BT_DynamicHandover <br/> String: 12 </dt><dd></dd></dl></li></ul><li>tagsSupported : <span class='text-info'>ARRAY</span><p>
<p>Array with tag types &ndash; only those tags will be detected.</p>
 </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p><p><strong>Possible Values</strong> :</p> <dt>Constant: EB.Adapter.MiFareUL <br/> String: 1 </dt><dd></dd><dt>Constant: EB.Adapter.MiFareStd <br/> String: 2 </dt><dd></dd><dt>Constant: EB.Adapter.MifareULC <br/> String: 3 </dt><dd></dd><dt>Constant: EB.Adapter.ISO14443_4A <br/> String: 4 </dt><dd></dd><dt>Constant: EB.Adapter.ISO14443_4B <br/> String: 5 </dt><dd></dd><dt>Constant: EB.Adapter.ISO15693 <br/> String: 6 </dt><dd></dd><dt>Constant: EB.Adapter.FeliCa <br/> String: 7 </dt><dd></dd><dt>Constant: EB.Adapter.Jewel <br/> String: 8 </dt><dd></dd><dt>Constant: EB.Adapter.Desfire <br/> String: 9 </dt><dd></dd><dt>Constant: EB.Adapter.MiFarePlus <br/> String: 10 </dt><dd></dd><dt>Constant: EB.Adapter.NXPIcode <br/> String: 11 </dt><dd></dd><dt>Constant: EB.Adapter.Topaz <br/> String: 12 </dt><dd></dd><dt>Constant: EB.Adapter.Calypso <br/> String: 13 </dt><dd></dd><dt>Constant: EB.Adapter.TITagIt <br/> String: 14 </dt><dd></dd></dl></li></ul><li>formattingTagsSupported : <span class='text-info'>ARRAY</span><p>
<p>Array with tag types &ndash; only those tags will be detected. See above tagsSupported parameter.</p>
 </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>writeProtectedTagsSupported : <span class='text-info'>ARRAY</span><p>
<p>Array with tag types &ndash; only those tags will be detected. See see above tagsSupported parameter.</p>
 </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>firmwareVersion : <span class='text-info'>STRING</span><p>
<p>This array has only one element.</p>
 </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul></ul></ul>

####Returns
Synchronous Return:

* HASH : 
<p>Return hash with capabilities.</p>
<ul><li>operatingModesSupported : <span class='text-info'>ARRAY</span><p>
<p>{}</p>
 </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p><p><strong>Possible Values</strong> :</p> <dt>Constant: EB.Adapter.NFC_P2P <br/> String: Constant: EB.Adapter.NFC_P2P <br/> String: 1  </dt><dd></dd><dt>Constant: EB.Adapter.NFC_Reader_Writer <br/> String: Constant: EB.Adapter.NFC_Reader_Writer <br/> String: 2  </dt><dd></dd><dt>Constant: EB.Adapter.NFC_CE <br/> String: Constant: EB.Adapter.NFC_CE <br/> String: 3  </dt><dd></dd><dt>Constant: EB.Adapter.NFC_CE_UICC <br/> String: Constant: EB.Adapter.NFC_CE_UICC <br/> String: 4  </dt><dd></dd><dt>Constant: EB.Adapter.NFC_CE_SE <br/> String: Constant: EB.Adapter.NFC_CE_SE <br/> String: 5  </dt><dd></dd><dt>Constant: EB.Adapter.NFC_CE_Host <br/> String: Constant: EB.Adapter.NFC_CE_Host <br/> String: 6  </dt><dd></dd><dt>Constant: EB.Adapter.Multiple_NDEFMessages <br/> String: Constant: EB.Adapter.Multiple_NDEFMessages <br/> String: 7  </dt><dd></dd><dt>Constant: EB.Adapter.NFC_LLCP <br/> String: Constant: EB.Adapter.NFC_LLCP <br/> String: 8  </dt><dd></dd><dt>Constant: EB.Adapter.NFC_SNEP <br/> String: Constant: EB.Adapter.NFC_SNEP <br/> String: 9  </dt><dd></dd><dt>Constant: EB.Adapter.NFC_NPP <br/> String: Constant: EB.Adapter.NFC_NPP <br/> String: 10  </dt><dd></dd><dt>Constant: EB.Adapter.NFC_BT_StaticHandover <br/> String: Constant: EB.Adapter.NFC_BT_StaticHandover <br/> String: 11  </dt><dd></dd><dt>Constant: EB.Adapter.NFC_BT_DynamicHandover <br/> String: Constant: EB.Adapter.NFC_BT_DynamicHandover <br/> String: 12  </dt><dd></dd></dl></li></ul><li>tagsSupported : <span class='text-info'>ARRAY</span><p>
<p>Array with tag types &ndash; only those tags will be detected.</p>
 </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p><p><strong>Possible Values</strong> :</p> <dt>Constant: EB.Adapter.MiFareUL <br/> String: Constant: EB.Adapter.MiFareUL <br/> String: 1  </dt><dd></dd><dt>Constant: EB.Adapter.MiFareStd <br/> String: Constant: EB.Adapter.MiFareStd <br/> String: 2  </dt><dd></dd><dt>Constant: EB.Adapter.MifareULC <br/> String: Constant: EB.Adapter.MifareULC <br/> String: 3  </dt><dd></dd><dt>Constant: EB.Adapter.ISO14443_4A <br/> String: Constant: EB.Adapter.ISO14443_4A <br/> String: 4  </dt><dd></dd><dt>Constant: EB.Adapter.ISO14443_4B <br/> String: Constant: EB.Adapter.ISO14443_4B <br/> String: 5  </dt><dd></dd><dt>Constant: EB.Adapter.ISO15693 <br/> String: Constant: EB.Adapter.ISO15693 <br/> String: 6  </dt><dd></dd><dt>Constant: EB.Adapter.FeliCa <br/> String: Constant: EB.Adapter.FeliCa <br/> String: 7  </dt><dd></dd><dt>Constant: EB.Adapter.Jewel <br/> String: Constant: EB.Adapter.Jewel <br/> String: 8  </dt><dd></dd><dt>Constant: EB.Adapter.Desfire <br/> String: Constant: EB.Adapter.Desfire <br/> String: 9  </dt><dd></dd><dt>Constant: EB.Adapter.MiFarePlus <br/> String: Constant: EB.Adapter.MiFarePlus <br/> String: 10  </dt><dd></dd><dt>Constant: EB.Adapter.NXPIcode <br/> String: Constant: EB.Adapter.NXPIcode <br/> String: 11  </dt><dd></dd><dt>Constant: EB.Adapter.Topaz <br/> String: Constant: EB.Adapter.Topaz <br/> String: 12  </dt><dd></dd><dt>Constant: EB.Adapter.Calypso <br/> String: Constant: EB.Adapter.Calypso <br/> String: 13  </dt><dd></dd><dt>Constant: EB.Adapter.TITagIt <br/> String: Constant: EB.Adapter.TITagIt <br/> String: 14  </dt><dd></dd></dl></li></ul><li>formattingTagsSupported : <span class='text-info'>ARRAY</span><p>
<p>Array with tag types &ndash; only those tags will be detected. See above tagsSupported parameter.</p>
 </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>writeProtectedTagsSupported : <span class='text-info'>ARRAY</span><p>
<p>Array with tag types &ndash; only those tags will be detected. See see above tagsSupported parameter.</p>
 </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>firmwareVersion : <span class='text-info'>STRING</span><p>
<p>This array has only one element.</p>
 </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul></ul>

####Platforms

* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Adapter.getDeviceInfo()</code> 


### reset()
<p>Resets the NFC device to default configuration. Pollingtime will set to 90, passkey to empty string.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Adapter.reset()</code> 


### setConfigChangeHandler()
<p>Register callback for config change. If you change properties like pollingTimeout, passkey then callback will fire.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>passKey : <span class='text-info'>STRING</span><p>
<p>Bluetooth device pass key.</p>
 </p></li><li>pollingTimeout : <span class='text-info'>INTEGER</span><p>
<p>Polling timeout in seconds of the NFC device.</p>
 </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Adapter.setConfigChangeHandler()</code> 


### setMessageHandler()
<p>Register callback for Message receive.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>messageId : <span class='text-info'>STRING</span><p>
<p>Message Id.</p>
 </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Adapter.setMessageHandler()</code> 


### setTagDetectionHandler(<span class="text-info">ARRAY</span> tagsToBeDetected)
<p>Register callback for Tag detection.</p>


####Parameters
<ul><li>tagsToBeDetected : <span class='text-info'>ARRAY</span><p>
<p>Array with tag types &ndash; only those tags will be detected. If empty array &ndash; all types. See below tagsSupported parameter in getDeviceInfo method.</p>
 </p></li><ul><li><i>Object</i> : <span class='text-info'>INTEGER</span><p> </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>tagId : <span class='text-info'>STRING</span><p>
<p>Tag Id.</p>
 </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Adapter.setTagDetectionHandler(<span class="text-info">ARRAY</span> tagsToBeDetected)</code> 


### stop()
<p>Stops the NFC device.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Adapter.stop()</code> 


##Properties



###isActive

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description

<p>Gets a value indicating whether or not the NFC device is currently active.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Adapter.isActive</code>



####Platforms

* Windows Mobile/CE

###passkey

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Bluetooth device pass key. Max of 6 characters, empty string is no Passkey (Default is No Passkey). The property is enabled after NFC engine activation.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Adapter.passkey</code>



####Platforms

* Windows Mobile/CE

###pollingTimeout

####Type
<span class='text-info'>INTEGER</span> 
####Description

<p>Polling timeout in seconds of the NFC device. 0 &ndash; timeout disabled, default: 90. The property is enabled after NFC engine activation.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Adapter.pollingTimeout</code>



####Platforms

* Windows Mobile/CE

###supported

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description

<p>Return true if NFC supported on this device.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Adapter.supported</code>



####Platforms

* Windows Mobile/CE

###version

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>Gets the version of the NFC stack.</p>

####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.Adapter.version</code>



####Platforms

* Windows Mobile/CE