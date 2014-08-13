#Message


## Overview
NFC Message
## Enabling the API
There are two methods of enabling the Message API: 

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
To include single APIs, you must first include the `ebapi.js` in your HTML as well as the API file you want to use. For instance, to use the Message API, I would add the following code to my HTML file(s), assuming the API files have been copied to the same directory as the HTML.

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi.js"></script>
    <script type="text/javascript" charset="utf-8" src="eb.message.js"></script>

The ebapi.js file is necessary for all single API inclusions.

        


##Methods



### addMessage(<span class="text-info">STRING</span> messageID)
Add new Smart Poster message to the message.

####Parameters
<ul><li>messageID : <span class='text-info'>STRING</span><p>Added Message object ID. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.addMessage(<span class="text-info">STRING</span> messageID)</code>

### addRecord(<span class="text-info">STRING</span> recordID)
Add new Record to Message.

####Parameters
<ul><li>recordID : <span class='text-info'>STRING</span><p>Added Record object ID. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.addRecord(<span class="text-info">STRING</span> recordID)</code>

### close()
Release NFC resources.

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
Creates message object.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>Rho.NFC.Message</span></p><ul></ul>

####Returns
Synchronous Return:

* Rho.NFC.Message : Created Message object.

####Platforms

* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Message.create()</code> 


### getContent()
Returns Message as byte array.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING : Message to get.

####Platforms

* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getContent()</code>

### getMessageById(<span class="text-info">STRING</span> id)
This function returns Message object.

####Parameters
<ul><li>id : <span class='text-info'>STRING</span><p>Message object ID. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>SELF_INSTANCE</span></p><ul></ul>

####Returns
Synchronous Return:

* SELF_INSTANCE : "self" instance of the Message object.

####Platforms

* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Message.getMessageById(<span class="text-info">STRING</span> id)</code> 


### getMessages()
Return array of Smart Poster Message objects.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul><ul><li><i>Object</i> : <span class='text-info'>Rho.NFC.Message</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:

* ARRAY : Array of Rho.NFC.Message objects.<ul><li><i>Object</i> : <span class='text-info'>Rho.NFC.Message</span><p> </p></li></ul>

####Platforms

* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getMessages()</code>

### getRecords()
Return array of Record objects.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul><ul><li><i>Object</i> : <span class='text-info'>Rho.NFC.Record</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:

* ARRAY : Array of Rho.NFC.Record objects.<ul><li><i>Object</i> : <span class='text-info'>Rho.NFC.Record</span><p> </p></li></ul>

####Platforms

* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getRecords()</code>

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