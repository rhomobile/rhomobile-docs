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



### send()
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


### stopListening()
Stop listening for custom intents.