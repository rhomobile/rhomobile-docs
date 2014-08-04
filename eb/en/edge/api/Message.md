#Message


## Overview
NFC Message
## Enabling the API
In order to use this API you must TBD INSERT Eb specific instructions here

        


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