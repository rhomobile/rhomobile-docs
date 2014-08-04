#EventSource


## Overview
Example extension apiThis is example of API. Implementation contain in extension.


##Methods



### addEventListener(<span class="text-info">STRING</span> event)


####Parameters
<ul><li>event : <span class='text-info'>STRING</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul></ul>

####Returns
Synchronous Return:

* Void

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.addEventListener(<span class="text-info">STRING</span> event)</code>

### <span class="label label-inverse"> Destructor</span> close()


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Method Access:

* Class Method: This method is a destructor and can only be accessed via the object that was created by the `new` constructor. 
	* <code>myObj.close()</code>


##Properties



###onerror

####Type
<span class='text-info'>CALLBACK</span> 
####Description
{}
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.onerror</code>

###onmessage

####Type
<span class='text-info'>CALLBACK</span> 
####Description
{}
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.onmessage</code>

###onopen

####Type
<span class='text-info'>CALLBACK</span> 
####Description
{}
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
URL passed to EventSource constructor.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.url</code>

###withCredentials

####Type
<span class='text-info'>BOOLEAN</span> <span class='label'>Read Only</span>
####Description
Currently will return empty string.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.withCredentials</code>

##Constants


* CONNECTINGThe connection has not yet been established.
* OPENThe WebSocket connection is established and communication is possible.
* CLOSEDThe connection has been closed or could not be opened.