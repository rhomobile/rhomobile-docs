#Tag


## Overview
<p>NFC Tag</p>
<p>This class representative NFC Tag object</p>

<h1>Enabling the API</h1>

<p>In order to use this API you must include the following extension in your <code>build.yml</code></p>

<pre><code>:::ruby
extensions: ["nfc"]
</code></pre>

<p>NOTE: If you are building a Windows Mobile or Windows CE app with this API, you must set your app_type as &ldquo;rhoelements&rdquo; in your build.yml as shown <a href="../guide/build_config#other-build-time-settings">here</a>.</p>



##Methods



### close()
release resources, close connection

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Windows Embedded

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.close()</code></li></ul></li></ul>

### exchangeData(<span class="text-info">STRING</span> sendData)
This function exchanges raw data with Tag

####Parameters
<ul><li>sendData : <span class='text-info'>STRING</span><p>
{} </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>receiveData : <span class='text-info'>STRING</span><p>
NFC_SUCCESS if OK </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>HASH<ul><li>receiveData : <span class='text-info'>STRING</span><p>
NFC_SUCCESS if OK </p></li></ul></li></ul>

####Platforms

* Windows Embedded

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.exchangeData(<span class="text-info">STRING</span> sendData)</code></li></ul></li></ul>

### formatNDEF()
format Tag to NDEF type

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Windows Embedded

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.formatNDEF()</code></li></ul></li></ul>

### getTagById(<span class="text-info">STRING</span> id)
This function returns Tag object

####Parameters
<ul><li>id : <span class='text-info'>STRING</span><p>
{} </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>SELF_INSTANCE</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>SELF_INSTANCE</li></ul>

####Platforms

* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.Tag.getTagById(<span class="text-info">STRING</span> id)</code> </li></ul></li></ul>

### makeReadOnly()
make Tag read only

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Windows Embedded

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.makeReadOnly()</code></li></ul></li></ul>

### writeMessage(<span class="text-info">ARRAY</span> messages)
write messages on Tag. On the current moment only 1 message is supported.

####Parameters
<ul><li>messages : <span class='text-info'>ARRAY</span><p>
{} </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p>
id of Rho.NFC.Message object </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Windows Embedded

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.writeMessage(<span class="text-info">ARRAY</span> messages)</code></li></ul></li></ul>

##Properties



###ID

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

object ID
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.ID</code></li></ul></li></ul>

###freeSize

####Type
<span class='text-info'>INTEGER</span> <span class='label'>Read Only</span>
####Description

free size in bytes
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.freeSize</code></li></ul></li></ul>

###isConnected

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description

connected or not(if connections between tag and nfc device exists)
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.isConnected</code></li></ul></li></ul>

###isNdef

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description

ndef or not
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.isNdef</code></li></ul></li></ul>

###isReadOnly

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description

Indicating if the tag is locked for write operation.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.isReadOnly</code></li></ul></li></ul>

###serialNumber

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

The serial number of a tag.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.serialNumber</code></li></ul></li></ul>

###size

####Type
<span class='text-info'>INTEGER</span> <span class='label'>Read Only</span>
####Description

size in bytes
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.size</code></li></ul></li></ul>

###type

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

Tag type
####Values

<strong>Possible Values</strong> (<span class='text-info'>false</span>):
 
* Constant: Rho.Tag.TAG_TYPE_TOPAZ 
	* String: 1
	* 
* Constant: Rho.Tag.TAG_TYPE_FELICA 
	* String: 2
	* 
* Constant: Rho.Tag.TAG_TYPE_MIFARE_CLASSIC 
	* String: 3
	* 
* Constant: Rho.Tag.TAG_TYPE_MIFARE_UL 
	* String: 4
	* 
* Constant: Rho.Tag.TAG_TYPE_MIFARE_DESFIRE 
	* String: 6
	* 
* Constant: Rho.Tag.TAG_TYPE_ISO15693 
	* String: 7
	* 
* Constant: Rho.Tag.TAG_TYPE_B 
	* String: 8
	* 
* Constant: Rho.Tag.TAG_TYPE_MIFARE 
	* String: 9
	* 
* Constant: Rho.Tag.TAG_TYPE_NXP_I_CODE 
	* String: 10
	* 
* Constant: Rho.Tag.TAG_TYPE_MIFARE_PLUS 
	* String: 11
	* 
* Constant: Rho.Tag.TAG_TYPE_MIFARE_ULC 
	* String: 12
	* 
* Constant: Rho.Tag.TAG_TYPE_MIFARE_PLUS_S2K 
	* String: 13
	* 
* Constant: Rho.Tag.TAG_TYPE_MIFARE_PLUS_X2K 
	* String: 14
	* 
* Constant: Rho.Tag.TAG_TYPE_UNKNOWN 
	* String: 255
	* 
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.type</code></li></ul></li></ul>