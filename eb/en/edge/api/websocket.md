#WebSocket


## Overview
This API provides access to the WebSocket protocol for two-way communication with a remote host.


##Methods



### <span class="label label-inverse"> Destructor</span> close()
Closes the connection.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android

####Method Access:

* Class Method: This method is a destructor and can only be accessed via the object that was created by the `new` constructor. 
	* <code>myObj.close()</code>


### send(<span class="text-info">STRING</span> message)
Transmits data using the connection.

####Parameters
<ul><li>message : <span class='text-info'>STRING</span><p>Data to transmit. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.send(<span class="text-info">STRING</span> message)</code>

##Properties



###onclose

####Type
<span class='text-info'>CALLBACK</span> 
####Description
This callback is fired when connection is closed. It's argument provides two members - 'code' and 'reason'.'
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.onclose</code>

###onerror

####Type
<span class='text-info'>CALLBACK</span> 
####Description
This callback is fired if error occurs. Use callback argument's 'message' attribute to access error message.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.onerror</code>

###onmessage

####Type
<span class='text-info'>CALLBACK</span> 
####Description
This callback is fired when message is received. Use callback argument's 'data' attribute to access received message.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.onmessage</code>

###onopen

####Type
<span class='text-info'>CALLBACK</span> 
####Description
This callback is fired when connection is established.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.onopen</code>

###readyState

####Type
<span class='text-info'>INTEGER</span> <span class='label'>Read Only</span>
####Description
Represents the state of the connection.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.readyState</code>

###url

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description
URL passed to Websocket constructor.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.url</code>

##Constants


* CONNECTINGThe connection has not yet been established.
* OPENThe WebSocket connection is established and communication is possible.
* CLOSINGThe connection is going through the closing handshake, or the close() method has been invoked.
* CLOSEDThe connection has been closed or could not be opened.