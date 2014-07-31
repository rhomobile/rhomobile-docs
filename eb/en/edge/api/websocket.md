#WebSocket


## Overview
This API provides access to the WebSocket protocol for two-way communication with a remote host.


##Methods



### <span class="label label-inverse"> Destructor</span> close()
Closes the connection.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android

####Method Access:
<ul><li>Class Method: This method is a destructor and can only be accessed via the object that was created by the `new` constructor. <ul><li><code>myObj.close()</code> </li></ul></li></ul>

### send(<span class="text-info">STRING</span> message)
Transmits data using the connection.

####Parameters
<ul><li>message : <span class='text-info'>STRING</span><p>
Data to transmit. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.send(<span class="text-info">STRING</span> message)</code></li></ul></li></ul>

##Properties



###onclose

####Type
<span class='text-info'>CALLBACK</span> 
####Description

This callback is fired when connection is closed. It's argument provides two members - 'code' and 'reason'.'
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.onclose</code></li></ul></li></ul>

###onerror

####Type
<span class='text-info'>CALLBACK</span> 
####Description

This callback is fired if error occurs. Use callback argument's 'message' attribute to access error message.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.onerror</code></li></ul></li></ul>

###onmessage

####Type
<span class='text-info'>CALLBACK</span> 
####Description

This callback is fired when message is received. Use callback argument's 'data' attribute to access received message.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.onmessage</code></li></ul></li></ul>

###onopen

####Type
<span class='text-info'>CALLBACK</span> 
####Description

This callback is fired when connection is established.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.onopen</code></li></ul></li></ul>

###readyState

####Type
<span class='text-info'>INTEGER</span> <span class='label'>Read Only</span>
####Description

Represents the state of the connection.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.readyState</code></li></ul></li></ul>

###url

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

URL passed to Websocket constructor.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.url</code></li></ul></li></ul>

##Constants


* CONNECTING
The connection has not yet been established.
* OPEN
The WebSocket connection is established and communication is possible.
* CLOSING
The connection is going through the closing handshake, or the close() method has been invoked.
* CLOSED
The connection has been closed or could not be opened.