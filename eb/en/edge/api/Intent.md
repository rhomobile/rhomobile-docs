#Intent


## Overview
The Intent API provides an inter-application broadcast message-passing framework.
## Enabling the API
In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* ebapi-modules.js - this file contains all available Enterprise Browser APIs

If you wish to minimize the amount of JavaScript being included, you can choose to only include the individual API that your application is using:

ex:

* ebapi.js - core APIs needed 
* eb.intent.js - just the Intent API
* other individual JavaScript files included with the Enterprise Browser installation

        


##Methods



### send(<span class="text-info">HASH</span> params)
<p>Sends an intent. The receiver of the intent can either be another RhoMobile  application that is listening for this Intent characteristic or on Android can be a native Android application setup with an Intent-Filter that will trigger based on the parameters of this method.</p>

<blockquote><p>Note: On Android, the callback should only be used when the intentType is set to START_ACTIVITY. On Android, the only valid way to pass private file from package directly to another application is set &lsquo;uri&rsquo; parameter with content URI. In most cases it is also needed to add extension of exported file to &lsquo;android:no_compression&rsquo; list at build.yml</p></blockquote>

<p><code>build.yml:</code></p>

<pre><code>:::ruby
android:
  no_compression: ['pdf','html','css']
</code></pre>

<p><code>JavaScript:</code></p>

<pre><code>:::javascript
var params = {
    intentType: Rho.Intent.START_ACTIVITY,
    action: "ACTION_VIEW",
    uri: "content://com.rhomobile.sample/rhodata/apps/public/sample.pdf"
}
Rho.Intent.send(params);    
</code></pre>


####Parameters
<ul><li>params : <span class='text-info'>HASH</span><p>
<p>A hash-map with intent parameters.</p>
 </p></li><ul><li>intentType : <span class='text-info'>STRING</span><p>
<p>Type of Intent to send.</p>
 </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>Constant: Intent.BROADCAST <br/> String:broadcast</dt><dd>
<p>Use the intent as broadcast intent.</p>
</dd><dt>Constant: Intent.START_ACTIVITY <br/> String:startActivity</dt><dd>
<p>Use the intent to start a UI activity.</p>
 Platforms: 
Android</dd><dt>Constant: Intent.START_SERVICE <br/> String:startService</dt><dd>
<p>Use the intent to start a background service.</p>
 Platforms: 
Android</dd></dl></li><li>permission : <span class='text-info'>STRING</span><p>
<p>Permission used to send a broadcast intent.</p>
 Platforms:
Android </p></li><li>action : <span class='text-info'>STRING</span><p>
<p>Intent action. See <a href="http://developer.android.com/reference/android/content/Intent.html#setAction(java.lang.String)">Android docs</a>. for possible values.</p>

<blockquote><p>NOTE: Use the Constant Value instead of the actual Constant Name. Ex: For the Constant <a href="http://developer.android.com/reference/android/content/Intent.html#ACTION_PICK">ACTION_PICK</a> use &lsquo;android.intent.action.PICK&rsquo;</p></blockquote>
 Platforms:
Android </p></li><li>categories : <span class='text-info'>ARRAY</span><p>
<p>List of intent categories. See <a href="http://developer.android.com/reference/android/content/Intent.html#addCategory(java.lang.String)">Android docs</a> for possible values.</p>

<blockquote><p>NOTE: Use the Constant Value instead of the actual Constant Name. Ex: For the Constant <a href="http://developer.android.com/reference/android/content/Intent.html#CATEGORY_HOME">CATEGORY_HOME</a> use &lsquo;android.intent.category.HOME&rsquo;</p></blockquote>
 Platforms:
Android </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>appName : <span class='text-info'>STRING</span><p>
<p>Explicit name of the application on the device to run. The platform will determine what value to use.</p>

<ul>
<li>Android it is application package name.</li>
<li>Windows it is the executable name.</li>
</ul>

 </p></li><li>targetClass : <span class='text-info'>STRING</span><p>
<p>Explicit name of the class in the application which will receive the intent. Must be specified if and only if &lsquo;appName&rsquo; is defined.</p>
 Platforms:
Android </p></li><li>uri : <span class='text-info'>STRING</span><p>
<p>Open the application associated with the URI. Behavior may be different on different platforms and depend on installed software. For example, open URL with http:// prefix usually executes the Web Browser installed on system and open URL in executed browser.</p>

<blockquote><p>NOTE: For Android, this is similar to <a href="http://developer.android.com/reference/android/content/Intent.html#setData(android.net.Uri)">Intent.setData()</a>. For example, if you were sending a <a href="http://developer.android.com/guide/components/intents-common.html#Maps">Map Intent</a> you would set this value to something like <code>geo:47.6,-122.3</code></p></blockquote>
 </p></li><li>mimeType : <span class='text-info'>STRING</span><p>
<p>MIME type of data defined in the intent. For example, for Plain Text I would use <code>text/plain</code></p>

<blockquote><p>NOTE: For Android, this is similar to <a href="http://developer.android.com/reference/android/content/Intent.html#setType(java.lang.String)">Intent.setType()</a></p></blockquote>
 </p></li><li>data : <span class='text-info'>HASH</span><p>
<p>Data which will be sent within the intent.</p>

<p>For Android, this is similar to <a href="http://developer.android.com/reference/android/content/Intent.html#putExtra(java.lang.String,%20java.lang.String)">Intent.putExtra()</a>. <code>data</code> should contain a HASH of Extra-String,Value pairs. The <code>Value</code> type of the <code>Extra</code> must be a string. Other object types are not supported at this time. For example:</p>

<p><code>Android:</code></p>

<pre><code>:::java
intent.putExtra(Intent.EXTRA_TEXT, 'Here is the text I am passing to the Intent');
</code></pre>

<p><code>JavaScript:</code></p>

<pre><code>:::javascript
var data = {"android.intent.extra.TEXT":"Here is the text I am passing to the Intent"}
</code></pre>

<p>Notice the use of the full constant string &ldquo;android.intent.extra.TEXT&rdquo; in place of <a href="http://developer.android.com/reference/android/content/Intent.html#EXTRA_TEXT">Intent.EXTRA_TEXT</a></p>
 </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>responseCode : <span class='text-info'>INTEGER</span><p>
<p>Response code passed to Android Activity.setResult() method. <a href="http://developer.android.com/reference/android/app/Activity.html#RESULT_OK">RESULT_OK</a> = -1. Check <a href="http://developer.android.com/reference/android/app/Activity.html#setResult(int)">Android Docs</a> for more information. Other attributes like <code>uri</code> may be returned depending on the Intent that was triggered. Possible parameters include the same params that are used in this <code>send(params)</code> method</p>
 Platforms:
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
