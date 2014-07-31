#EventSource


## Overview
Example extension apiThis is example of API. Implementation contain in extension.


##Methods



### addEventListener(<span class="text-info">STRING</span> event)

####Parameters
<ul><li>event : <span class='text-info'>STRING</span><p>
{} </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>OBJECT</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.addEventListener(<span class="text-info">STRING</span> event)</code></li></ul></li></ul>

### <span class="label label-inverse"> Destructor</span> close()

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Method Access:
<ul><li>Class Method: This method is a destructor and can only be accessed via the object that was created by the `new` constructor. <ul><li><code>myObj.close()</code> </li></ul></li></ul>

##Properties



###onerror

####Type
<span class='text-info'>CALLBACK</span> 
####Description

{}
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.onerror</code></li></ul></li></ul>

###onmessage

####Type
<span class='text-info'>CALLBACK</span> 
####Description

{}
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.onmessage</code></li></ul></li></ul>

###onopen

####Type
<span class='text-info'>CALLBACK</span> 
####Description

{}
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

URL passed to EventSource constructor.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.url</code></li></ul></li></ul>

###withCredentials

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description

Currently will return empty string.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.withCredentials</code></li></ul></li></ul>

##Constants


* CONNECTING
The connection has not yet been established.
* OPEN
The WebSocket connection is established and communication is possible.
* CLOSED
The connection has been closed or could not be opened.