#Message


## Overview
NFC Message
## Enabling the API
In order to use this API you must TBD INSERT Eb specific instructions here

        


##Methods



### addMessage(<span class="text-info">STRING</span> messageID)
Add new Smart Poster message to the message.

####Parameters
<ul><li>messageID : <span class='text-info'>STRING</span><p>
Added Message object ID. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.addMessage(<span class="text-info">STRING</span> messageID)</code></li></ul></li></ul>

### addRecord(<span class="text-info">STRING</span> recordID)
Add new Record to Message.

####Parameters
<ul><li>recordID : <span class='text-info'>STRING</span><p>
Added Record object ID. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.addRecord(<span class="text-info">STRING</span> recordID)</code></li></ul></li></ul>

### close()
Release NFC resources.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.close()</code></li></ul></li></ul>

### create()
Creates message object.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>Rho.NFC.Message</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>Rho.NFC.Message : 
Created Message object.</li></ul>

####Platforms

* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Message.create()</code> </li></ul></li></ul>

### getContent()
Returns Message as byte array.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>STRING : 
Message to get.</li></ul>

####Platforms

* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.getContent()</code></li></ul></li></ul>

### getMessageById(<span class="text-info">STRING</span> id)
This function returns Message object.

####Parameters
<ul><li>id : <span class='text-info'>STRING</span><p>
Message object ID. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>SELF_INSTANCE</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>SELF_INSTANCE : 
"self" instance of the Message object.</li></ul>

####Platforms

* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Message.getMessageById(<span class="text-info">STRING</span> id)</code> </li></ul></li></ul>

### getMessages()
Return array of Smart Poster Message objects.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul><ul><li><i>Object</i> : <span class='text-info'>Rho.NFC.Message</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>ARRAY : 
Array of Rho.NFC.Message objects.<ul><li><i>Object</i> : <span class='text-info'>Rho.NFC.Message</span><p> </p></li></ul></li></ul>

####Platforms

* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.getMessages()</code></li></ul></li></ul>

### getRecords()
Return array of Record objects.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul><ul><li><i>Object</i> : <span class='text-info'>Rho.NFC.Record</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>ARRAY : 
Array of Rho.NFC.Record objects.<ul><li><i>Object</i> : <span class='text-info'>Rho.NFC.Record</span><p> </p></li></ul></li></ul>

####Platforms

* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.getRecords()</code></li></ul></li></ul>

##Properties



###ID

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

Object ID.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.ID</code></li></ul></li></ul>


####Platforms

* Windows Mobile/CE