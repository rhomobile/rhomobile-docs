#Intent


## Overview
The Intent API provides an inter-application broadcast message-passing framework.
## Enabling the API

There are two methods of enabling the Intent API:

* Include all 'ebapi' modules
* Include only the API modules you need

Both methods are explained below. 

Either way, the included files will be found in: 
`/Enterprise Browser/JavaScript Files/Enterprise Browser`,
a directory on the computer that contains the Enterprise Browser installation.

### Include all JS API modules
To include all JavaScript APIs, copy the `ebapi-modules.js` file to a location accessible by your app's files and include the JavaScript modules file in your app. For instance, to include the modules file in your `index.html`, copy the file to the same directory as your index.html and add the following line to the HEAD section of your index.html file:

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi-modules.js"></script>

> This will define the EB class within the page. **Note that the path for this file is relative to the current page** (index.html). Any page on which the modules are required will need to have the required .js file(s) included in this fashion.

### Include only the modules you need
To include individual APIs, you must first include the `ebapi.js` in your HTML, and then the additional required API file(s). For instance, to use the Intent API, add the following code to the HTML file(s). Again, this assumes that relevant API files have been copied to the same directory as the HTML.

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi.js"></script>
    <script type="text/javascript" charset="utf-8" src="eb.intent.js"></script>

> In the code lines above, notice that `ebapi.js` is included first, followed by `eb.intent.js`, which is the Intent API for Enterprise Browser. **This coding is required on each HTML page whenever an individual API will be called from that page**.

        


##Methods



### send(<span class="text-info">HASH</span> params)
Sends an intent. The receiver of the intent can be another application that is listening for this Intent characteristic or, on Android, the receiver can be a native Android application set up with an Intent-Filter that will trigger based on the parameters of this method.

**Android Note**: On Android, the callback should be used only when the intentType is set to START_ACTIVITY. The only valid way for an Android app to pass a private file from a package directly to another application is to set the 'uri' parameter with content URI. 
            

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
* Windows Mobile

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

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Intent.startListening()</code> 


### stopListening()
Stop listening for custom intents.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Intent.stopListening()</code> 


##Remarks



###Registering Intent Receiver

                    
For an Android app to receive intent data, the Intent receiver must be registered in the app's `Config.xml` file. Please refer to the <a href="#guide-configreference?Intent">Intent section of the EB Config Reference</a> for more information. 
                    
                