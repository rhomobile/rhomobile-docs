#Intent


## Overview
The Intent API provides an inter-application broadcast message-passing framework.
## Enabling the API
There are two methods of enabling the Intent API: 

* Include all ebapi modules or 
* Include only the API modules you need 

For either of these methods, you'll need to include files from the `/Enterprise Browser/JavaScript Files/Enterprise Browser` directory on the computer that you installed the Enterprise Browser.

### Include all JS API modules
To include all JS APIs, you must copy the ebapi-modules.js file to a location accessible by your app's files and include the JavaScript file in your app. For instance, to include the modules file in your index.html, with the file in the same directory as your index.html, you would add the following line to the <head> section of your index.html:

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi-modules.js"></script>

> Note: that the pathing for this file is relative to the current page.

This will define the EB class within the page. Any page you need to use the modules will need to have the .js file included in this fashion.

### Include only the modules you need
To include single APIs, you must first include the `ebapi.js` in your HTML as well as the API file you want to use. For instance, to use the Intent API, I would add the following code to my HTML file(s), assuming the API files have been copied to the same directory as the HTML.

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi.js"></script>
    <script type="text/javascript" charset="utf-8" src="eb.intent.js"></script>

The ebapi.js file is necessary for all single API inclusions.

        


##Methods



### send(<span class="text-info">HASH</span> params)
Sends an intent. The receiver of the intent can be another application that is listening for this Intent characteristic or, on Android the receiver can be a native Android application setup with an Intent-Filter that will trigger based on the parameters of this method. 

> Note: On Android, the callback should only be used when the intentType is set to START_ACTIVITY. On Android, the only valid way to pass private file from package directly to another application is set 'uri' parameter with content URI.
            

####Parameters
<ul><li>params : <span class='text-info'>HASH</span><p>A hash-map with intent parameters. </p></li><ul><li>intentType : <span class='text-info'>STRING</span><p>Type of Intent to send.  </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>Constant: Intent.BROADCAST <br/> String:broadcast</dt><dd>Use the intent as broadcast intent.</dd><dt>Constant: Intent.START_ACTIVITY <br/> String:startActivity</dt><dd>Use the intent to start a UI activity. Platforms: 
Android</dd><dt>Constant: Intent.START_SERVICE <br/> String:startService</dt><dd>Use the intent to start a background service. Platforms: 
Android</dd></dl></li><li>permission : <span class='text-info'>STRING</span><p>Permission used to send a broadcast intent. Platforms:
Android </p></li><li>action : <span class='text-info'>STRING</span><p>Intent action. See [Android docs](http://developer.android.com/reference/android/content/Intent.html#setAction(java.lang.String\)). for possible values.

> NOTE: Use the Constant Value instead of the actual Constant Name. Ex: For the Constant [ACTION_PICK](http://developer.android.com/reference/android/content/Intent.html#ACTION_PICK) use 'android.intent.action.PICK'

 Platforms:
Android </p></li><li>categories : <span class='text-info'>ARRAY</span><p>List of intent categories. See [Android docs](http://developer.android.com/reference/android/content/Intent.html#addCategory(java.lang.String\)) for possible values.
> NOTE: Use the Constant Value instead of the actual Constant Name. Ex: For the Constant [CATEGORY_HOME](http://developer.android.com/reference/android/content/Intent.html#CATEGORY_HOME) use 'android.intent.category.HOME'

 Platforms:
Android </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>appName : <span class='text-info'>STRING</span><p>Explicit name of the application on the device to run. The platform will determine what value to use. 

* Android it is application package name.
* Windows it is the application/executable name. For shared runtime based applications, the application name is taken from the "Name" attribute from the Config.xml file. Hence use the application name which is mentioned in config.xml.
 </p></li><li>targetClass : <span class='text-info'>STRING</span><p>Explicit name of the class in the application which will receive the intent. Must be specified if and only if 'appName' is defined. Platforms:
Android </p></li><li>uri : <span class='text-info'>STRING</span><p>Open the application associated with the URI. Behavior may be different on different platforms and depend on installed software. For example, open URL with http:// prefix usually executes the Web Browser installed on system and open URL in executed browser.
>NOTE: For Android, this is similar to [Intent.setData()](http://developer.android.com/reference/android/content/Intent.html#setData(android.net.Uri\)). For example, if you were sending a [Map Intent](http://developer.android.com/guide/components/intents-common.html#Maps) you would set this value to something like `geo:47.6,-122.3`
 </p></li><li>mimeType : <span class='text-info'>STRING</span><p>MIME type of data defined in the intent. For example, for Plain Text I would use `text/plain`
>NOTE: For Android, this is similar to [Intent.setType()](http://developer.android.com/reference/android/content/Intent.html#setType(java.lang.String\))
 </p></li><li>data : <span class='text-info'>HASH</span><p>Data which will be sent within the intent. 

For Android, this is similar to [Intent.putExtra()](http://developer.android.com/reference/android/content/Intent.html#putExtra(java.lang.String, java.lang.String\)). `data` should contain a HASH of Extra-String,Value pairs. The `Value` type of the `Extra` must be a string. Other object types are not supported at this time. For example:

`Android:`
    :::java
    intent.putExtra(Intent.EXTRA_TEXT, 'Here is the text I am passing to the Intent');

`JavaScript:`
    :::javascript
    var data = {"android.intent.extra.TEXT":"Here is the text I am passing to the Intent"}

Notice the use of the full constant string "android.intent.extra.TEXT" in place of [Intent.EXTRA_TEXT](http://developer.android.com/reference/android/content/Intent.html#EXTRA_TEXT)

 </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>responseCode : <span class='text-info'>INTEGER</span><p>Response code passed to Android Activity.setResult() method. [RESULT_OK](http://developer.android.com/reference/android/app/Activity.html#RESULT_OK) = -1. Check [Android Docs](http://developer.android.com/reference/android/app/Activity.html#setResult(int\)) for more information. Other attributes like `uri` may be returned depending on the Intent that was triggered. Possible parameters include the same params that are used in this `send(params)` method Platforms:
Android </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Intent.send(<span class="text-info">HASH</span> params)</code> 


### startListening()
Start listening for custom intents. 

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Intent.startListening()</code> 
