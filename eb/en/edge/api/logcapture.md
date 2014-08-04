#LogCapture


## Overview
The LogCapture class is used for capturing logging events.
        
## Enabling the API
In order to use this API you must TBD INSERT Eb specific instructions here

        


##Methods



### clear()
Clear captured events.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.LogCapture.clear()</code> 


### numLines()
Return number of captured lines.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></p><ul></ul>

####Returns
Synchronous Return:

* INTEGER

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.LogCapture.numLines()</code> 


### read()
Read captured items.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.LogCapture.read()</code> 


### start()
Start capture log events.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.LogCapture.start()</code> 


### stop()
Stop capture log events.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.LogCapture.stop()</code> 


##Properties



###excludeCategories

####Type
<span class='text-info'>STRING</span> 
####Description
Comma-separated list of excluded log categories.
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.LogCapture.excludeCategories</code>



####Platforms

* Android
* Windows Mobile/CE

###maxLines

####Type
<span class='text-info'>INTEGER</span> 
####Description
Maximum number of captured lines.
####Params
<p><strong>Default:</strong> 1024</p>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.LogCapture.maxLines</code>



####Platforms

* Android
* Windows Mobile/CE