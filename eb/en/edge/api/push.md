#Push


## Overview
The Push API provides access to Push messaging functionality. Use this API to give your application the ability to receive server initiated messages.
## Enabling the API
In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* ebapi-modules.js - this file contains all available Enterprise Browser APIs

If you wish to minimize the amount of JavaScript being included, you can choose to only include the individual API that your application is using:

ex:

* ebapi.js - core APIs needed 
* eb.push.js - just the Push API
* other individual JavaScript files included with the Enterprise Browser installation

        


##Methods



### enumerate()
<p>Returns the push API objects configured within the application.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul><ul><li><i>Object</i> : <span class='text-info'>SELF_INSTANCE: Push</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:

* ARRAY : 
<p>Array of available push engines.</p>
<ul><li><i>Object</i> : <span class='text-info'>SELF_INSTANCE: Push</span><p> </p></li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Push.enumerate()</code> 


### getAllProperties()
<p>This method will return all of object/value pairs for the propertyNames of the API class.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:

* HASH : 
<p>Map of all available properties</p>
<ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getAllProperties()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Push.getAllProperties()</code> 


### getDefault()
<p>This method will return an object that represents the default instance of the API Class. For example Camera.getDefault will return a Camera object that represents the default camera.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>SELF_INSTANCE</span></p><ul></ul>

####Returns
Synchronous Return:

* SELF_INSTANCE : 
<p>Default object of Module.</p>


####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Push.getDefault()</code> 


### getDeviceId()
<p>Returns push token used to identify particular device.</p>


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

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getDeviceId()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Push.getDeviceId()</code> 


### getProperties(<span class="text-info">ARRAY</span> arrayofNames)
<p>This method will return a set of object/value pairs for the list of the propertyName that is passed in. The propertyNames must be a valid property of the API class.</p>


####Parameters
<ul><li>arrayofNames : <span class='text-info'>ARRAY</span><p>
<p>List of properties I want to know about</p>
 </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:

* HASH : 
<p>Map of properties I want to know about</p>
<ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Push.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code> 


### getProperty(<span class="text-info">STRING</span> propertyName)
<p>This method will return the value of the propertyName that is passed in. The propertyName must be a valid property of the API class.</p>


####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p>
<p>The property to return info about.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING : 
<p>The property to return info about.</p>


####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getProperty(<span class="text-info">STRING</span> propertyName)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Push.getProperty(<span class="text-info">STRING</span> propertyName)</code> 


### setDefault(<span class="text-info">SELF_INSTANCE: EB.Push</span> defaultInstance)
<p>This method allows you to set the attributes of the default object instance by passing in an object of the same class.</p>


####Parameters
<ul><li>defaultInstance : <span class='text-info'>SELF_INSTANCE: EB.Push</span><p>
<p>An instance object that is of the same class.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Push.setDefault(<span class="text-info">SELF_INSTANCE: EB.Push</span> defaultInstance)</code> 


### setProperties(<span class="text-info">HASH</span> propertyMap)
<p>This method will set the values of a list of properties for the API class. The propertyName must be a valid property for the class and must also not be read only.</p>


####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>
<p>Map of properties I want to set</p>
 </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.setProperties(<span class="text-info">HASH</span> propertyMap)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Push.setProperties(<span class="text-info">HASH</span> propertyMap)</code> 


### setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)
<p>This method will set the value of a property for the API class. The propertyName must be a valid property for the class and must also not be read only.</p>


####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p>
<p>The one property name that I want to set</p>
 </p></li><li>propertyValue : <span class='text-info'>STRING</span><p>
<p>The one property value that I want to set</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Push.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code> 


### startNotifications()
<p>Start listening for push messages, errors or other push related events.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>doSync : <span class='text-info'>STRING</span><p>
<p>List of sources to sync separated by comma or &lsquo;all&rsquo;.</p>
 </p></li><li>alertText : <span class='text-info'>STRING</span><p>
<p>Alert message to show to user.</p>
 </p></li><li>vibrateDuration : <span class='text-info'>INTEGER</span><p>
<p>Vibrate duration in milliseconds.</p>
 </p></li><li>alertSound : <span class='text-info'>STRING</span><p>
<p>Path to sound file to play when push message is received.</p>
 </p></li></ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.startNotifications()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Push.startNotifications()</code> 


### stopNotifications()
<p>Stop listening push events.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.stopNotifications()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.Push.stopNotifications()</code> 


##Properties



###pushAppName

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>Application name used by RhoConnect Push server to identify application.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.pushAppName</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Push.pushAppName</code> 



####Platforms

* Android
* Windows Mobile/CE

###pushServer

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>URL of RhoConnect Push server.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.pushServer</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Push.pushServer</code> 



####Platforms

* Android
* Windows Mobile/CE

###type

####Type
<span class='text-info'>STRING</span> <span class='label'>Read Only</span>
####Description

<p>Push engine type.</p>

####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.Push.PUSH_TYPE_RHOCONNECT - String: rhoconnect-push 
<p>RhoConnect push engine.</p>

* Constant: EB.Push.PUSH_TYPE_NATIVE - String: native-push 
<p>Native push engine (like GCM on Android).</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.type</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.Push.type</code> 



####Platforms

* Android
* Windows Mobile/CE