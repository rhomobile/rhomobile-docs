#Record


## Overview
NFC Record
## Enabling the API
There are two methods of enabling the Record API: 

* Include all ebapi modules or 
* Include only the API modules you need 

For either of these methods, you'll need to include files from the `/Enterprise Browser/JavaScript Files/Enterprise Browser` directory on the computer that you installed the Motorola Enterprise Browser.

### Include all JS API modules
To include all JS APIs, you must copy the ebapi-modules.js file to a location accessible by your app's files and include the JavaScript file in your app. For instance, to include the modules file in your index.html, with the file in the same directory as your index.html, you would add the following line to the <head> section of your index.html:

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi-modules.js"></script>

> Note: that the pathing for this file is relative to the current page.

This will define the EB class within the page. Any page you need to use the modules will need to have the .js file included in this fashion.

### Include only the modules you need
To include single APIs, you must first include the `ebapi.js` in your HTML as well as the API file you want to use. For instance, to use the Record API, I would add the following code to my HTML file(s), assuming the API files have been copied to the same directory as the HTML.

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi.js"></script>
    <script type="text/javascript" charset="utf-8" src="eb.record.js"></script>

The ebapi.js file is necessary for all single API inclusions.

        


##Methods



### close()
Release resources.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.close()</code>

### create()
Creates record.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>Rho.NFC.Record</span></p><ul></ul>

####Returns
Synchronous Return:

* Rho.NFC.Record : Record object.

####Platforms

* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Record.create()</code> 


##Properties



###ID

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description
Object ID.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.ID</code>


####Platforms

* Windows Mobile/CE

###payload

####Type
<span class='text-info'>STRING</span> 
####Description
Record payload(data buffer).
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.payload</code>


####Platforms

* Windows Mobile/CE

###recordId

####Type
<span class='text-info'>STRING</span> 
####Description
Optional field for NFC_NDEF_RTD_GENERAL record type.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.recordId</code>


####Platforms

* Windows Mobile/CE

###textCharEncoding

####Type
<span class='text-info'>INTEGER</span> 
####Description
Use if record type is NFC_NDEF_RTD_TEXT. Values see NFC Forum. For example UTF-8 is 2 and it will be set by default. This property will be ignored in read tag mode, you should find it in a payload.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.textCharEncoding</code>


####Platforms

* Windows Mobile/CE

###textLanguage

####Type
<span class='text-info'>STRING</span> 
####Description
Use if record type is NFC_NDEF_RTD_TEXT. This property will be ignored in read tag mode. This property will be ignored in read tag mode, you should find it in a payload.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.textLanguage</code>


####Platforms

* Windows Mobile/CE

###tnf

####Type
<span class='text-info'>INTEGER</span> 
####Description
When you create a new record then this field is needed for NFC_NDEF_RTD_GENERAL, for another types it will be set automatically.
####Values

<strong>Possible Values</strong> (<span class='text-info'>false</span>):
 
* Constant: EB.Record.NDEF_TNF_EMPTY - String: 1 
* Constant: EB.Record.NDEF_TNF_WELL_KNOWN - String: 2 
* Constant: EB.Record.NDEF_TNF_MEDIA - String: 3 
* Constant: EB.Record.NDEF_TNF_ABSOLUTE_URI - String: 4 
* Constant: EB.Record.NDEF_TNF_EXTERNAL - String: 5 
* Constant: EB.Record.NDEF_TNF_UNKNOWN - String: 6 
* Constant: EB.Record.NDEF_TNF_UNCHANGED - String: 7 
* Constant: EB.Record.NDEF_TNF_ANY_TYPE - String: 8 
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.tnf</code>


####Platforms

* Windows Mobile/CE

###type

####Type
<span class='text-info'>INTEGER</span> 
####Description
Record type. This property will be ignored in read tag mode. If you create a record you should set this property firstly.
####Values

<strong>Possible Values</strong> (<span class='text-info'>false</span>):
 
* Constant: EB.Record.NDEF_RTD_TEXT - String: 1 A text type record.
* Constant: EB.Record.NDEF_RTD_URI - String: 2 A URI type record.
* Constant: EB.Record.NDEF_RTD_GENERAL - String: 3 A generic type record.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.type</code>


####Platforms

* Windows Mobile/CE

###typeName

####Type
<span class='text-info'>STRING</span> 
####Description
When you create a new record then this field is needed for NFC_NDEF_RTD_GENERAL, for another types it will be set automatically. For values see NFC Forum.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.typeName</code>


####Platforms

* Windows Mobile/CE

###uriProtocol

####Type
<span class='text-info'>INTEGER</span> 
####Description
Use if record type is NFC_NDEF_RTD_URI. For values please see NFC Forum. This property will be ignored in read tag mode, you should find it in a payload.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.uriProtocol</code>


####Platforms

* Windows Mobile/CE