#Intent


## Overview
<p>The Intent API provides an inter-application broadcast message-passing framework.</p>
<h2>Enabling the API</h2>

<p>This API is part of the <code>coreapi</code> extension that is included automatically.</p>

<pre><code>:::ruby
extensions: ["coreapi"]
</code></pre>

<h2>JavaScript Usage</h2>

<p>Be sure to review the <a href="/guide/api_js">JavaScript API Usage</a> guide for important information about using this API in JavaScript.</p>

<h2>Ruby Usage</h2>

<p>Be sure to review the <a href="/guide/api_ruby">Ruby API Usage</a> guide for important information about using this API in Ruby.</p>



##Methods



### send(<span class="text-info">HASH</span> params)
Sends an intent. The receiver of the intent can either be another RhoMobile application that is listening for this Intent characteristic or on Android can be a native Android application setup with an Intent-Filter that will trigger based on the parameters of this method. 
***NOTE: On Android, the callback should only be used when the intentType is set to START_ACTIVITY.***
***NOTE: On Android, the only valid way to pass private file from package directly to another application is set 'uri' parameter with content URI. In most cases it is also needed to add extension of exported file to 'android:no_compression' list at build.yml***
`build.yml:`
    :::ruby
    android:
      no_compression: ['pdf','html','css']

`JavaScript:`
    :::javascript
    var params = {
        intentType: Rho.Intent.START_ACTIVITY,
        action: "ACTION_VIEW",
        uri: "content://com.rhomobile.sample/rhodata/apps/public/sample.pdf"
    }
    Rho.Intent.send(params);    


####Parameters
<ul><li>params : <span class='text-info'>HASH</span><p>
A hash-map with intent parameters. </p></li><ul><li>intentType : <span class='text-info'>STRING</span><p>
Type of Intent to send.  </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>Constant: RhoFile.BROADCAST <br/> String:broadcast</dt><dd>
Use the intent as broadcast intent.</dd><dt>Constant: RhoFile.START_ACTIVITY <br/> String:startActivity</dt><dd>
Use the intent to start a UI activity. Platforms: 
Android</dd><dt>Constant: RhoFile.START_SERVICE <br/> String:startService</dt><dd>
Use the intent to start a background service. Platforms: 
Android</dd></dl></li><li>permission : <span class='text-info'>STRING</span><p>
Permission used to send a broadcast intent. Platforms:Android </p></li><li>action : <span class='text-info'>STRING</span><p>
Intent action. See [Android docs](http://developer.android.com/reference/android/content/Intent.html#setAction(java.lang.String\)). for possible values.
***NOTE: Use the Constant Value instead of the actual Constant Name. Ex: For the Constant [ACTION_PICK](http://developer.android.com/reference/android/content/Intent.html#ACTION_PICK) use 'android.intent.action.PICK'***
 Platforms:Android </p></li><li>categories : <span class='text-info'>ARRAY</span><p>
List of intent categories. See [Android docs](http://developer.android.com/reference/android/content/Intent.html#addCategory(java.lang.String\)) for possible values.
***NOTE: Use the Constant Value instead of the actual Constant Name. Ex: For the Constant [CATEGORY_HOME](http://developer.android.com/reference/android/content/Intent.html#CATEGORY_HOME) use 'android.intent.category.HOME'***

 Platforms:Android </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>appName : <span class='text-info'>STRING</span><p>
Explicit name of the application on the device to run. The platform will determine what value to use. 

* iOS it is BundleURLScheme of executed application. 
* Android it is application package name.
* Windows it is the executable name.
 </p></li><li>targetClass : <span class='text-info'>STRING</span><p>
Explicit name of the class in the application which will receive the intent. Must be specified if and only if 'appName' is defined. Platforms:Android </p></li><li>uri : <span class='text-info'>STRING</span><p>
Open the application associated with the URI. Behavior may be different on different platforms and depend on installed software. For example, open URL with http:// prefix usually executes the Web Browser installed on system and open URL in executed browser.
***NOTE: For Android, this is similar to [Intent.setData()](http://developer.android.com/reference/android/content/Intent.html#setData(android.net.Uri\)). For example, if you were sending a [Map Intent](http://developer.android.com/guide/components/intents-common.html#Maps) you would set this value to something like `geo:47.6,-122.3`***
 </p></li><li>mimeType : <span class='text-info'>STRING</span><p>
MIME type of data defined in the intent. For example, for Plain Text I would use `text/plain`
***NOTE: For Android, this is similar to [Intent.setType()](http://developer.android.com/reference/android/content/Intent.html#setType(java.lang.String\))***
 </p></li><li>data : <span class='text-info'>HASH</span><p>
Data which will be sent within the intent. 

For Android, this is similar to [Intent.putExtra()](http://developer.android.com/reference/android/content/Intent.html#putExtra(java.lang.String, java.lang.String\)). `data` should contain a HASH of Extra-String,Value pairs. The `Value` type of the `Extra` must be a string. Other object types are not supported at this time. For example:

`Android:`
    :::java
    intent.putExtra(Intent.EXTRA_TEXT, 'Here is the text I am passing to the Intent');

`RhoMobile JavaScript:`
    :::javascript
    var data = {"android.intent.extra.TEXT":"Here is the text I am passing to the Intent"}

Notice the use of the full constant string "android.intent.extra.TEXT" in place of [Intent.EXTRA_TEXT](http://developer.android.com/reference/android/content/Intent.html#EXTRA_TEXT)

 </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>responseCode : <span class='text-info'>INTEGER</span><p>
Response code passed to Android Activity.setResult() method. [RESULT_OK](http://developer.android.com/reference/android/app/Activity.html#RESULT_OK) = -1. Check [Android Docs](http://developer.android.com/reference/android/app/Activity.html#setResult(int\)) for more information. Other attributes like `uri` may be returned depending on the Intent that was triggered. Possible parameters include the same params that are used in this `send(params)` method Platforms:Android </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.Intent.send(<span class="text-info">HASH</span> params)</code> </li></ul></li></ul>

### startListening()
Start listening for custom intents. 

NOTE: For Android, this is how we have implemented [Android Intent Filters](http://developer.android.com/guide/components/intents-filters.html#Receiving). In order to listen for Intents you will have to update the `AndroidManifest.erb` file and add a special section to it. This file is now generated with RhoMobile Version 4.1 when you create a new project. The file is located in the root of project.

Add the following snippet to AndroidManifest.erb within the `manifest` tags

    :::xml
    <receiver android:name='com.rho.intent.IntentReceiver'>
      <intent-filter>
        <action android:name="Intent.ACTION_BATTERY_CHANGED" />
      </intent-filter>
    </receiver> 


Notice that this looks very similar to a standard AndroidManifest.XML file section except the `receiver` is the common RhoMobile intent receiver. The `intent-filter` tags within this section are standard AndroidManifest.XML notation that you would put in for the Intent-Filters that you want to listen for. Consult the [Android Docs](http://developer.android.com/guide/components/intents-filters.html#Receiving) for more information about Intent Filters. From your Android application, you would use the [sendBroadcast() method](http://developer.android.com/reference/android/content/Context.html#sendBroadcast(android.content.Intent\)) with the appropriate parameters for this filter.


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.Intent.startListening()</code> </li></ul></li></ul>

### stopListening()
Stop listening for custom intents.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby
* Android
* iOS
* Windows Embedded

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.Intent.stopListening()</code> </li></ul></li></ul>

##Examples



###Plot a location on a map

You can use the Intent API to use the default mapping program to plot locations.
<pre><code>

function sendGeo(){
  var intentParams = {action     : "android.intent.action.VIEW",
                      intentType : Rho.Intent.START_ACTIVITY,
                      uri        : "geo:37.422, -122.084"};

  Rho.Intent.send(intentParams);
}
</code></pre>

###Sending Extras

Sometimes you will want to send some extras along with an intent such as an SMS body or do a web search with a given string. Here is an example of an intent that will launch the default web browser and perform a search with the default search engine.
<pre><code>

function webSearch(){}
  var intentParams = {action     : "android.intent.action.WEB_SEARCH",
                      intentType : Rho.Intent.START_ACTIVITY,
                      data       : {query : "Rhomobile docs"}}

  Rho.Intent.send(intentParams)
}
</code></pre>