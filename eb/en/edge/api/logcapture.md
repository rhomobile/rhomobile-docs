#LogCapture


## Overview
The LogCapture class is used for capturing logging events.
        
## Enabling the API
In order to use this API you must TBD INSERT Eb specific instructions here

        


##Methods



### clear()
<p>Clear captured events.</p>


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
<p>Return number of captured lines.</p>


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
<p>Read captured items.</p>


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
<p>Start capture log events.</p>


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
<p>Stop capture log events.</p>


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

<p>Comma-separated list of excluded log categories.</p>

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

<p>Maximum number of captured lines.</p>

####Params
<p><strong>Default:</strong> 1024</p>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.LogCapture.maxLines</code>



####Platforms

* Android
* Windows Mobile/CE