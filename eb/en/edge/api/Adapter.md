#Adapter


## Overview
<p>NFC Adapter</p>
<p>NFC Adapter provides access to the NFC device to perform device related operations.</p>

<pre><code>All properties and methods should be used after activate. Besides supported and isActive.
</code></pre>

<h2>Enabling the API</h2>

<p>In order to use this API you must include the following extension in your <code>build.yml</code></p>

<pre><code>:::ruby
extensions: ["NFC"]
</code></pre>

<p>NOTE: If you are building a Windows Mobile or Windows CE app with this API, you must set your app_type as &ldquo;rhoelements&rdquo; in your build.yml as shown <a href="../guide/build_config#other-build-time-settings">here</a>.</p>



##Methods



### activate()Activates the NFC device so that all the NFC operations will be executed.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.Adapter.activate()</code> </li></ul></li></ul>

### btConnect()Connects the Bluetooth device to obtain device properties.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>btName : <span class='text-info'>STRING</span><p>Device name. </p></li><li>btAddress : <span class='text-info'>STRING</span><p>Device MAC address. </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.Adapter.btConnect()</code> </li></ul></li></ul>

### btDisconnect()Disconnects the Bluetooth device.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.Adapter.btDisconnect()</code> </li></ul></li></ul>

### getDeviceInfo()Gets the NFC device capabilities.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>operatingModesSupported : <span class='text-info'>ARRAY</span><p> </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p><p><strong>Possible Values</strong> :</p> <dt>Constant: Rho.Adapter.NFC_P2P <br/> String: 1 </dt><dd></dd><dt>Constant: Rho.Adapter.NFC_Reader_Writer <br/> String: 2 </dt><dd></dd><dt>Constant: Rho.Adapter.NFC_CE <br/> String: 3 </dt><dd></dd><dt>Constant: Rho.Adapter.NFC_CE_UICC <br/> String: 4 </dt><dd></dd><dt>Constant: Rho.Adapter.NFC_CE_SE <br/> String: 5 </dt><dd></dd><dt>Constant: Rho.Adapter.NFC_CE_Host <br/> String: 6 </dt><dd></dd><dt>Constant: Rho.Adapter.Multiple_NDEFMessages <br/> String: 7 </dt><dd></dd><dt>Constant: Rho.Adapter.NFC_LLCP <br/> String: 8 </dt><dd></dd><dt>Constant: Rho.Adapter.NFC_SNEP <br/> String: 9 </dt><dd></dd><dt>Constant: Rho.Adapter.NFC_NPP <br/> String: 10 </dt><dd></dd><dt>Constant: Rho.Adapter.NFC_BT_StaticHandover <br/> String: 11 </dt><dd></dd><dt>Constant: Rho.Adapter.NFC_BT_DynamicHandover <br/> String: 12 </dt><dd></dd></dl></li></ul><li>tagsSupported : <span class='text-info'>ARRAY</span><p>Array with tag types - only those tags will be detected. </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p><p><strong>Possible Values</strong> :</p> <dt>Constant: Rho.Adapter.MiFareUL <br/> String: 1 </dt><dd></dd><dt>Constant: Rho.Adapter.MiFareStd <br/> String: 2 </dt><dd></dd><dt>Constant: Rho.Adapter.MifareULC <br/> String: 3 </dt><dd></dd><dt>Constant: Rho.Adapter.ISO14443_4A <br/> String: 4 </dt><dd></dd><dt>Constant: Rho.Adapter.ISO14443_4B <br/> String: 5 </dt><dd></dd><dt>Constant: Rho.Adapter.ISO15693 <br/> String: 6 </dt><dd></dd><dt>Constant: Rho.Adapter.FeliCa <br/> String: 7 </dt><dd></dd><dt>Constant: Rho.Adapter.Jewel <br/> String: 8 </dt><dd></dd><dt>Constant: Rho.Adapter.Desfire <br/> String: 9 </dt><dd></dd><dt>Constant: Rho.Adapter.MiFarePlus <br/> String: 10 </dt><dd></dd><dt>Constant: Rho.Adapter.NXPIcode <br/> String: 11 </dt><dd></dd><dt>Constant: Rho.Adapter.Topaz <br/> String: 12 </dt><dd></dd><dt>Constant: Rho.Adapter.Calypso <br/> String: 13 </dt><dd></dd><dt>Constant: Rho.Adapter.TITagIt <br/> String: 14 </dt><dd></dd></dl></li></ul><li>formattingTagsSupported : <span class='text-info'>ARRAY</span><p>Array with tag types - only those tags will be detected. See above tagsSupported parameter. </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>writeProtectedTagsSupported : <span class='text-info'>ARRAY</span><p>Array with tag types - only those tags will be detected. See see above tagsSupported parameter. </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>firmwareVersion : <span class='text-info'>STRING</span><p>This array has only one element. </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul></ul></ul>

####Returns
Synchronous Return:<ul><li>HASH : Return hash with capabilities.<ul><li>operatingModesSupported : <span class='text-info'>ARRAY</span><p> </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p><p><strong>Possible Values</strong> :</p> <dt>Constant: Rho.Adapter.NFC_P2P <br/> String: Constant: Rho.Adapter.NFC_P2P <br/> String: 1  </dt><dd></dd><dt>Constant: Rho.Adapter.NFC_Reader_Writer <br/> String: Constant: Rho.Adapter.NFC_Reader_Writer <br/> String: 2  </dt><dd></dd><dt>Constant: Rho.Adapter.NFC_CE <br/> String: Constant: Rho.Adapter.NFC_CE <br/> String: 3  </dt><dd></dd><dt>Constant: Rho.Adapter.NFC_CE_UICC <br/> String: Constant: Rho.Adapter.NFC_CE_UICC <br/> String: 4  </dt><dd></dd><dt>Constant: Rho.Adapter.NFC_CE_SE <br/> String: Constant: Rho.Adapter.NFC_CE_SE <br/> String: 5  </dt><dd></dd><dt>Constant: Rho.Adapter.NFC_CE_Host <br/> String: Constant: Rho.Adapter.NFC_CE_Host <br/> String: 6  </dt><dd></dd><dt>Constant: Rho.Adapter.Multiple_NDEFMessages <br/> String: Constant: Rho.Adapter.Multiple_NDEFMessages <br/> String: 7  </dt><dd></dd><dt>Constant: Rho.Adapter.NFC_LLCP <br/> String: Constant: Rho.Adapter.NFC_LLCP <br/> String: 8  </dt><dd></dd><dt>Constant: Rho.Adapter.NFC_SNEP <br/> String: Constant: Rho.Adapter.NFC_SNEP <br/> String: 9  </dt><dd></dd><dt>Constant: Rho.Adapter.NFC_NPP <br/> String: Constant: Rho.Adapter.NFC_NPP <br/> String: 10  </dt><dd></dd><dt>Constant: Rho.Adapter.NFC_BT_StaticHandover <br/> String: Constant: Rho.Adapter.NFC_BT_StaticHandover <br/> String: 11  </dt><dd></dd><dt>Constant: Rho.Adapter.NFC_BT_DynamicHandover <br/> String: Constant: Rho.Adapter.NFC_BT_DynamicHandover <br/> String: 12  </dt><dd></dd></dl></li></ul><li>tagsSupported : <span class='text-info'>ARRAY</span><p>Array with tag types - only those tags will be detected. </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p><p><strong>Possible Values</strong> :</p> <dt>Constant: Rho.Adapter.MiFareUL <br/> String: Constant: Rho.Adapter.MiFareUL <br/> String: 1  </dt><dd></dd><dt>Constant: Rho.Adapter.MiFareStd <br/> String: Constant: Rho.Adapter.MiFareStd <br/> String: 2  </dt><dd></dd><dt>Constant: Rho.Adapter.MifareULC <br/> String: Constant: Rho.Adapter.MifareULC <br/> String: 3  </dt><dd></dd><dt>Constant: Rho.Adapter.ISO14443_4A <br/> String: Constant: Rho.Adapter.ISO14443_4A <br/> String: 4  </dt><dd></dd><dt>Constant: Rho.Adapter.ISO14443_4B <br/> String: Constant: Rho.Adapter.ISO14443_4B <br/> String: 5  </dt><dd></dd><dt>Constant: Rho.Adapter.ISO15693 <br/> String: Constant: Rho.Adapter.ISO15693 <br/> String: 6  </dt><dd></dd><dt>Constant: Rho.Adapter.FeliCa <br/> String: Constant: Rho.Adapter.FeliCa <br/> String: 7  </dt><dd></dd><dt>Constant: Rho.Adapter.Jewel <br/> String: Constant: Rho.Adapter.Jewel <br/> String: 8  </dt><dd></dd><dt>Constant: Rho.Adapter.Desfire <br/> String: Constant: Rho.Adapter.Desfire <br/> String: 9  </dt><dd></dd><dt>Constant: Rho.Adapter.MiFarePlus <br/> String: Constant: Rho.Adapter.MiFarePlus <br/> String: 10  </dt><dd></dd><dt>Constant: Rho.Adapter.NXPIcode <br/> String: Constant: Rho.Adapter.NXPIcode <br/> String: 11  </dt><dd></dd><dt>Constant: Rho.Adapter.Topaz <br/> String: Constant: Rho.Adapter.Topaz <br/> String: 12  </dt><dd></dd><dt>Constant: Rho.Adapter.Calypso <br/> String: Constant: Rho.Adapter.Calypso <br/> String: 13  </dt><dd></dd><dt>Constant: Rho.Adapter.TITagIt <br/> String: Constant: Rho.Adapter.TITagIt <br/> String: 14  </dt><dd></dd></dl></li></ul><li>formattingTagsSupported : <span class='text-info'>ARRAY</span><p>Array with tag types - only those tags will be detected. See above tagsSupported parameter. </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>writeProtectedTagsSupported : <span class='text-info'>ARRAY</span><p>Array with tag types - only those tags will be detected. See see above tagsSupported parameter. </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>firmwareVersion : <span class='text-info'>STRING</span><p>This array has only one element. </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul></ul></li></ul>

####Platforms

* Javascript
* Ruby
* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.Adapter.getDeviceInfo()</code> </li></ul></li></ul>

### reset()Resets the NFC device to default configuration. Pollingtime will set to 90, passkey to empty string.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.Adapter.reset()</code> </li></ul></li></ul>

### setConfigChangeHandler()Register callback for config change. If you change properties like pollingTimeout, passkey then callback will fire.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>passKey : <span class='text-info'>STRING</span><p>Bluetooth device pass key. </p></li><li>pollingTimeout : <span class='text-info'>INTEGER</span><p>Polling timeout in seconds of the NFC device. </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.Adapter.setConfigChangeHandler()</code> </li></ul></li></ul>

### setMessageHandler()Register callback for Message receive.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>messageId : <span class='text-info'>STRING</span><p>Message Id. </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.Adapter.setMessageHandler()</code> </li></ul></li></ul>

### setTagDetectionHandler(<span class="text-info">ARRAY</span> tagsToBeDetected)Register callback for Tag detection.

####Parameters
<ul><li>tagsToBeDetected : <span class='text-info'>ARRAY</span><p>Array with tag types - only those tags will be detected. If empty array - all types. See below tagsSupported parameter in getDeviceInfo method. </p></li><ul><li><i>Object</i> : <span class='text-info'>INTEGER</span><p> </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>tagId : <span class='text-info'>STRING</span><p>Tag Id. </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.Adapter.setTagDetectionHandler(<span class="text-info">ARRAY</span> tagsToBeDetected)</code> </li></ul></li></ul>

### stop()Stops the NFC device.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.Adapter.stop()</code> </li></ul></li></ul>

##Properties



###isActive

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description
Gets a value indicating whether or not the NFC device is currently active.
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>Rho.Adapter.isActive</code> </li></ul></li></ul>

###passkey

####Type
<span class='text-info'>STRING</span> 
####Description
Bluetooth device pass key. Max of 6 characters, empty string is no Passkey (Default is No Passkey). The property is enabled after NFC engine activation.
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>Rho.Adapter.passkey</code> </li></ul></li></ul>

###pollingTimeout

####Type
<span class='text-info'>INTEGER</span> 
####Description
Polling timeout in seconds of the NFC device. 0 - timeout disabled, default: 90. The property is enabled after NFC engine activation.
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>Rho.Adapter.pollingTimeout</code> </li></ul></li></ul>

###supported

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description
Return true if NFC supported on this device.
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>Rho.Adapter.supported</code> </li></ul></li></ul>

###version

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description
Gets the version of the NFC stack.
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>Rho.Adapter.version</code> </li></ul></li></ul>