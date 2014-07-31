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
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.LogCapture.clear()</code> </li></ul></li></ul>

### numLines()
Return number of captured lines.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>INTEGER</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.LogCapture.numLines()</code> </li></ul></li></ul>

### read()
Read captured items.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>STRING</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.LogCapture.read()</code> </li></ul></li></ul>

### start()
Start capture log events.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.LogCapture.start()</code> </li></ul></li></ul>

### stop()
Stop capture log events.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.LogCapture.stop()</code> </li></ul></li></ul>

##Properties



###excludeCategories

####Type
<span class='text-info'>STRING</span> 
####Description

Comma-separated list of excluded log categories.
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.LogCapture.excludeCategories</code> </li></ul></li></ul>


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
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.LogCapture.maxLines</code> </li></ul></li></ul>


####Platforms

* Android
* Windows Mobile/CE