#Record


## Overview
<p>NFC Record</p>
<p>This class representative Record object</p>

<h1>Enabling the API</h1>

<p>In order to use this API you must include the following extension in your <code>build.yml</code></p>

<pre><code>:::ruby
extensions: ["nfc"]
</code></pre>

<p>NOTE: If you are building a Windows Mobile or Windows CE app with this API, you must set your app_type as &ldquo;rhoelements&rdquo; in your build.yml as shown <a href="../guide/build_config#other-build-time-settings">here</a>.</p>



##Methods



### close()Release resources.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Windows Embedded

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.close()</code></li></ul></li></ul>

### create()Creates record.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>Rho.NFC.Record</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>Rho.NFC.Record : Record object.</li></ul>

####Platforms

* Javascript
* Ruby
* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.Record.create()</code> </li></ul></li></ul>

##Properties



###ID

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description
Object ID.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.ID</code></li></ul></li></ul>

###payload

####Type
<span class='text-info'>STRING</span> 
####Description
Record payload(data buffer).
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.payload</code></li></ul></li></ul>

###recordId

####Type
<span class='text-info'>STRING</span> 
####Description
Optional field for NFC_NDEF_RTD_GENERAL record type.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.recordId</code></li></ul></li></ul>

###textCharEncoding

####Type
<span class='text-info'>INTEGER</span> 
####Description
Use if record type is NFC_NDEF_RTD_TEXT. Values see NFC Forum. For example UTF-8 is 2 and it will be set by default. This property will be ignored in read tag mode, you should find it in a payload.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.textCharEncoding</code></li></ul></li></ul>

###textLanguage

####Type
<span class='text-info'>STRING</span> 
####Description
Use if record type is NFC_NDEF_RTD_TEXT. This property will be ignored in read tag mode. This property will be ignored in read tag mode, you should find it in a payload.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.textLanguage</code></li></ul></li></ul>

###tnf

####Type
<span class='text-info'>INTEGER</span> 
####Description
When you create a new record then this field is needed for NFC_NDEF_RTD_GENERAL, for another types it will be set automatically.
####Values

<strong>Possible Values</strong> (<span class='text-info'>false</span>):
 
* Constant: Rho.Record.NDEF_TNF_EMPTY 
	* String: 1
	* 
* Constant: Rho.Record.NDEF_TNF_WELL_KNOWN 
	* String: 2
	* 
* Constant: Rho.Record.NDEF_TNF_MEDIA 
	* String: 3
	* 
* Constant: Rho.Record.NDEF_TNF_ABSOLUTE_URI 
	* String: 4
	* 
* Constant: Rho.Record.NDEF_TNF_EXTERNAL 
	* String: 5
	* 
* Constant: Rho.Record.NDEF_TNF_UNKNOWN 
	* String: 6
	* 
* Constant: Rho.Record.NDEF_TNF_UNCHANGED 
	* String: 7
	* 
* Constant: Rho.Record.NDEF_TNF_ANY_TYPE 
	* String: 8
	* 
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.tnf</code></li></ul></li></ul>

###type

####Type
<span class='text-info'>INTEGER</span> 
####Description
Record type. This property will be ignored in read tag mode. If you create a record you should set this property firstly.
####Values

<strong>Possible Values</strong> (<span class='text-info'>false</span>):
 
* Constant: Rho.Record.NDEF_RTD_TEXT 
	* String: 1
	* A text type record.
* Constant: Rho.Record.NDEF_RTD_URI 
	* String: 2
	* A URI type record.
* Constant: Rho.Record.NDEF_RTD_GENERAL 
	* String: 3
	* A generic type record.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.type</code></li></ul></li></ul>

###typeName

####Type
<span class='text-info'>STRING</span> 
####Description
When you create a new record then this field is needed for NFC_NDEF_RTD_GENERAL, for another types it will be set automatically. For values see NFC Forum.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.typeName</code></li></ul></li></ul>

###uriProtocol

####Type
<span class='text-info'>INTEGER</span> 
####Description
Use if record type is NFC_NDEF_RTD_URI. For values please see NFC Forum. This property will be ignored in read tag mode, you should find it in a payload.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.uriProtocol</code></li></ul></li></ul>