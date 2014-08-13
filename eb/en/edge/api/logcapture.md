#LogCapture


## Overview
The LogCapture class is used for capturing logging events.
        
## Enabling the API
There are two methods of enabling the LogCapture API: 

* Include all ebapi modules or 
* Include only the API modules you need 

For either of these methods, you'll need to include files from the `/Enterprise Browser/JavaScript Files/Enterprise Browser` directory on the computer that you installed the Motorola Enterprise Browser.

### Include all JS API modules
To include all JS APIs, you must copy the ebapi-modules.js file to a location accessible by your app's files and include the JavaScript file in your app. For instance, to include the modules file in your index.html, with the file in the same directory as your index.html, you would add the following line to the <head> section of your index.html:

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi-modules.js"></script>

> Note: that the pathing for this file is relative to the current page.

This will define the EB class within the page. Any page you need to use the modules will need to have the .js file included in this fashion.

### Include only the modules you need
To include single APIs, you must first include the `ebapi.js` in your HTML as well as the API file you want to use. For instance, to use the LogCapture API, I would add the following code to my HTML file(s), assuming the API files have been copied to the same directory as the HTML.

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi.js"></script>
    <script type="text/javascript" charset="utf-8" src="eb.logcapture.js"></script>

The ebapi.js file is necessary for all single API inclusions.

        


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