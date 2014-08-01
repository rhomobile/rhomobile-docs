#PrintingEpson


## Overview
Example extension api
## Enabling the API
In order to use this API you must include the following extension in your `build.yml`.
    :::ruby
    extensions: ["printing_epson"]

The `printing_epson` extension is also included automatically if you specify the following in your `build.yml`.
    :::ruby
    app_type: "rhoelements"

NOTE: If you are building a Windows Mobile or Windows CE app with this API, you must set your app_type as "rhoelements" in your build.yml as shown [here](../guide/build_config#other-build-time-settings).
        This is example of API. Implementation contain in extension.


##Methods



### calcSumm(<span class="text-info">INTEGER</span> a, <span class="text-info">INTEGER</span> b)
<p>Return sum of two params: a+b.</p>


####Parameters
<ul><li>a : <span class='text-info'>INTEGER</span><p> </p></li><li>b : <span class='text-info'>INTEGER</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></p><ul></ul>

####Returns
Synchronous Return:

* INTEGER

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.calcSumm(<span class="text-info">INTEGER</span> a, <span class="text-info">INTEGER</span> b)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.PrintingEpson.calcSumm(<span class="text-info">INTEGER</span> a, <span class="text-info">INTEGER</span> b)</code> 


### enumerate()

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul><ul><li><i>Object</i> : <span class='text-info'>SELF_INSTANCE: EB.PrintingEpson</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:

* ARRAY : 
<p>Array of PrintingEpson objects.</p>
<ul><li><i>Object</i> : <span class='text-info'>SELF_INSTANCE: EB.PrintingEpson</span><p> </p></li></ul>

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.PrintingEpson.enumerate()</code> 


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

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getAllProperties()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.PrintingEpson.getAllProperties()</code> 


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


####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.PrintingEpson.getDefault()</code> 


### getPlatformName()
<p>Return string with platform.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getPlatformName()</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.PrintingEpson.getPlatformName()</code> 


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

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.PrintingEpson.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code> 


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


####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getProperty(<span class="text-info">STRING</span> propertyName)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.PrintingEpson.getProperty(<span class="text-info">STRING</span> propertyName)</code> 


### joinStrings(<span class="text-info">STRING</span> a, <span class="text-info">STRING</span> b)
<p>Return join of two strings: a+b.</p>


####Parameters
<ul><li>a : <span class='text-info'>STRING</span><p> </p></li><li>b : <span class='text-info'>STRING</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.joinStrings(<span class="text-info">STRING</span> a, <span class="text-info">STRING</span> b)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.PrintingEpson.joinStrings(<span class="text-info">STRING</span> a, <span class="text-info">STRING</span> b)</code> 


### setDefault(<span class="text-info">SELF_INSTANCE: EB.PrintingEpson</span> defaultInstance)
<p>This method allows you to set the attributes of the default object instance by passing in an object of the same class.</p>


####Parameters
<ul><li>defaultInstance : <span class='text-info'>SELF_INSTANCE: EB.PrintingEpson</span><p>
<p>An instance object that is of the same class.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.PrintingEpson.setDefault(<span class="text-info">SELF_INSTANCE: EB.PrintingEpson</span> defaultInstance)</code> 


### setProperties(<span class="text-info">HASH</span> propertyMap)
<p>This method will set the values of a list of properties for the API class. The propertyName must be a valid property for the class and must also not be read only.</p>


####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>
<p>Map of properties I want to set</p>
 </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.setProperties(<span class="text-info">HASH</span> propertyMap)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.PrintingEpson.setProperties(<span class="text-info">HASH</span> propertyMap)</code> 


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

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code>
* Default Instance: This method can be accessed via the default instance object of this class. 
	* <code>EB.PrintingEpson.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code> 


##Properties



###simpleStringProperty

####Type
<span class='text-info'>STRING</span> 
####Description

<p>Simple string property.</p>

####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.simpleStringProperty</code>
* Default Instance: This property can be accessed via the default instance object of this class. 
	* <code>EB.PrintingEpson.simpleStringProperty</code> 
