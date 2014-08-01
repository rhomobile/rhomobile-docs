#WebSocket


## Overview
This API provides access to the WebSocket protocol for two-way communication with a remote host.


##Methods



### <span class="label label-inverse"> Destructor</span> close()
<p>Closes the connection.</p>


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
<p>Transmits data using the connection.</p>


####Parameters
<ul><li>message : <span class='text-info'>STRING</span><p>
<p>Data to transmit.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

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

<p>This callback is fired when connection is closed. It&rsquo;s argument provides two members &ndash; &lsquo;code&rsquo; and &lsquo;reason&rsquo;.'</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.onclose</code>

###onerror

####Type
<span class='text-info'>CALLBACK</span> 
####Description

<p>This callback is fired if error occurs. Use callback argument&rsquo;s &lsquo;message&rsquo; attribute to access error message.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.onerror</code>

###onmessage

####Type
<span class='text-info'>CALLBACK</span> 
####Description

<p>This callback is fired when message is received. Use callback argument&rsquo;s &lsquo;data&rsquo; attribute to access received message.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.onmessage</code>

###onopen

####Type
<span class='text-info'>CALLBACK</span> 
####Description

<p>This callback is fired when connection is established.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.onopen</code>

###readyState

####Type
<span class='text-info'>INTEGER</span> <span class='label'>Read Only</span>
####Description

<p>Represents the state of the connection.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.readyState</code>

###url

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>URL passed to Websocket constructor.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.url</code>

##Constants


* CONNECTING
<p>The connection has not yet been established.</p>

* OPEN
<p>The WebSocket connection is established and communication is possible.</p>

* CLOSING
<p>The connection is going through the closing handshake, or the close() method has been invoked.</p>

* CLOSED
<p>The connection has been closed or could not be opened.</p>
