#PrintingEpson


## Overview
<p>Example extension api</p>

<h2>Enabling the API</h2>

<p>In order to use this API you must include the following extension in your <code>build.yml</code>.</p>

<pre><code>:::ruby
extensions: ["printing_epson"]
</code></pre>

<p>The <code>printing_epson</code> extension is also included automatically if you specify the following in your <code>build.yml</code>.</p>

<pre><code>:::ruby
app_type: "rhoelements"
</code></pre>

<p>NOTE: If you are building a Windows Mobile or Windows CE app with this API, you must set your app_type as &ldquo;rhoelements&rdquo; in your build.yml as shown <a href="../guide/build_config#other-build-time-settings">here</a>.</p>
<p>This is example of API. Implementation contain in extension.</p>



##Methods



### calcSumm(<span class="text-info">INTEGER</span> a, <span class="text-info">INTEGER</span> b)
Return sum of two params: a+b.

####Parameters
<ul><li>a : <span class='text-info'>INTEGER</span><p> </p></li><li>b : <span class='text-info'>INTEGER</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>INTEGER</li></ul>

####Platforms

* Javascript
* Ruby

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.calcSumm(<span class="text-info">INTEGER</span> a, <span class="text-info">INTEGER</span> b)</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.PrintingEpson.calcSumm(<span class="text-info">INTEGER</span> a, <span class="text-info">INTEGER</span> b)</code> </li></ul></li></ul>

### enumerate()

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul><ul><li><i>Object</i> : <span class='text-info'>SELF_INSTANCE: Rho.PrintingEpson</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>ARRAY : 
Array of PrintingEpson objects.<ul><li><i>Object</i> : <span class='text-info'>SELF_INSTANCE: Rho.PrintingEpson</span><p> </p></li></ul></li></ul>

####Platforms

* Javascript
* Ruby

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.PrintingEpson.enumerate()</code> </li></ul></li></ul>

### getAllProperties()
This method will return all of object/value pairs for the propertyNames of the API class.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>HASH : 
Map of all available properties<ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul></li></ul>

####Platforms

* Javascript
* Ruby

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.getAllProperties()</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.PrintingEpson.getAllProperties()</code> </li></ul></li></ul>

### getDefault()
This method will return an object that represents the default instance of the API Class. For example Camera.getDefault will return a Camera object that represents the default camera.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>SELF_INSTANCE</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>SELF_INSTANCE : 
Default object of Module.</li></ul>

####Platforms

* Javascript
* Ruby

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.PrintingEpson.getDefault()</code> </li></ul></li></ul>

### getPlatformName()
Return string with platform.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>STRING</li></ul>

####Platforms

* Javascript
* Ruby

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.getPlatformName()</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.PrintingEpson.getPlatformName()</code> </li></ul></li></ul>

### getProperties(<span class="text-info">ARRAY</span> arrayofNames)
This method will return a set of object/value pairs for the list of the propertyName that is passed in. The propertyNames must be a valid property of the API class.

####Parameters
<ul><li>arrayofNames : <span class='text-info'>ARRAY</span><p>
List of properties I want to know about </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>HASH : 
Map of properties I want to know about<ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul></li></ul>

####Platforms

* Javascript
* Ruby

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.PrintingEpson.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code> </li></ul></li></ul>

### getProperty(<span class="text-info">STRING</span> propertyName)
This method will return the value of the propertyName that is passed in. The propertyName must be a valid property of the API class.

####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p>
The property to return info about. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>STRING : 
The property to return info about.</li></ul>

####Platforms

* Javascript
* Ruby

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.getProperty(<span class="text-info">STRING</span> propertyName)</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.PrintingEpson.getProperty(<span class="text-info">STRING</span> propertyName)</code> </li></ul></li></ul>

### joinStrings(<span class="text-info">STRING</span> a, <span class="text-info">STRING</span> b)
Return join of two strings: a+b.

####Parameters
<ul><li>a : <span class='text-info'>STRING</span><p> </p></li><li>b : <span class='text-info'>STRING</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>STRING</li></ul>

####Platforms

* Javascript
* Ruby

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.joinStrings(<span class="text-info">STRING</span> a, <span class="text-info">STRING</span> b)</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.PrintingEpson.joinStrings(<span class="text-info">STRING</span> a, <span class="text-info">STRING</span> b)</code> </li></ul></li></ul>

### setDefault(<span class="text-info">SELF_INSTANCE: Rho.PrintingEpson</span> defaultInstance)
This method allows you to set the attributes of the default object instance by passing in an object of the same class.

####Parameters
<ul><li>defaultInstance : <span class='text-info'>SELF_INSTANCE: Rho.PrintingEpson</span><p>
An instance object that is of the same class. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>Rho.PrintingEpson.setDefault(<span class="text-info">SELF_INSTANCE: Rho.PrintingEpson</span> defaultInstance)</code> </li></ul></li></ul>

### setProperties(<span class="text-info">HASH</span> propertyMap)
This method will set the values of a list of properties for the API class. The propertyName must be a valid property for the class and must also not be read only.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>
Map of properties I want to set </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.setProperties(<span class="text-info">HASH</span> propertyMap)</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.PrintingEpson.setProperties(<span class="text-info">HASH</span> propertyMap)</code> </li></ul></li></ul>

### setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)
This method will set the value of a property for the API class. The propertyName must be a valid property for the class and must also not be read only.

####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p>
The one property name that I want to set </p></li><li>propertyValue : <span class='text-info'>STRING</span><p>
The one property value that I want to set </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Javascript
* Ruby

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul><li><code>Rho.PrintingEpson.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code> </li></ul></li></ul>

##Properties



###simpleStringProperty

####Type
<span class='text-info'>STRING</span> 
####Description

Simple string property.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.simpleStringProperty</code></li></ul></li><li><i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class. <ul><li><code>Rho.PrintingEpson.simpleStringProperty</code> </li></ul></li></ul>