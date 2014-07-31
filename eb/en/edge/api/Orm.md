#ORM


## Overview
This JavaScript API class allows you to interact with the local RHOM database and programatically add models or get references to models.
## Enabling the API
This API is part of the `coreapi` extension that is included automatically.
    :::ruby
    extensions: ["coreapi"]

## JavaScript Usage
Be sure to review the [JavaScript API Usage](/guide/api_js) guide for important information about using this API in JavaScript.

If you are going to be using the JS ORM API, you'll also need to include this line in any files that will be using it:

    :::html
    <script type="text/javascript" charset="utf-8" src="/public/api/rhoapi-modules-ORM.js"></script>

## Ruby Usage
For Ruby access to the RHOM database please see the [Rhom Ruby API guide](/api/rhom-api).
        


##Methods



### addModel(<span class="text-info"></span> Anoynomous Function methods)
Creates an ORM model reference.

####Parameters
<ul><li>Anoynomous Function methods : <span class='text-info'></span><p> </p></li><ul><li>modelName("value") : <span class='text-info'>STRING</span><p>
The name of your model. </p></li><li>enable("value") : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>
Enables Model Properties. </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>sync</dt><dd>
If set then model is set for RhoConnect Sync.</dd><dt>propertyBag</dt><dd>
(Default) Model will be of type propertyBag.</dd><dt>fixedSchema</dt><dd>
Model will be of type fixedSchema.</dd></dl></li><li>property("name","type") : <span class='text-info'>STRING,STRING</span> <span class='label label-info'>Optional</span><p>
Used to create properties on your model. </p></li><ul><li>name : <span class='text-info'>STRING</span><p>
The name of the property. </p></li><li>type : <span class='text-info'>STRING</span><p>
The type of property value: String, Float, integer, Varchar, Blob - String is default. </p></li></ul><li>addIndex("name",[colArray]) : <span class='text-info'>STRING, ARRAY</span> <span class='label label-info'>Optional</span><p>
Add an index to your fixedSchema model. </p></li><ul><li>name : <span class='text-info'>STRING</span><p>
The name of the index. </p></li><li>colArray : <span class='text-info'>ARRAY</span><p>
Array of model column names to use in index, Ex: ['name','qty'] </p></li></ul><li>addUniqueIndex("name",[colArray]) : <span class='text-info'>STRING, ARRAY</span> <span class='label label-info'>Optional</span><p>
Add an index to your fixedSchema model. </p></li><ul><li>name : <span class='text-info'>STRING</span><p>
The name of the index. </p></li><li>colArray : <span class='text-info'>ARRAY</span><p>
Array of model column names to use in index, Ex: ['name','qty'] </p></li></ul><li>belongs_to("name") : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>
Add belongs_to association to another defined model, for sync models. Comma-separated String for more than one model. </p></li><li>set(property,value) : <span class='text-info'>STRING,VALUE</span> <span class='label label-info'>Optional</span><p>
Set Behavior of this model. Possible `property` options and corresponding values. </p></li><ul><li>partition : <span class='text-info'>STRING</span><p>
The partition to use for this model. Partitions can be used to segment the data and keep non-synched data separate from synched models. Possible `values`. </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>local</dt><dd>
This partition is used automatically if the model is not a sync model.</dd><dt>user</dt><dd>
This partition is used automatically if the model is a sync model.</dd></dl></li><li>sync_type : <span class='text-info'>STRING</span><p>
Sets the type of sync it will be.  </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>none</dt><dd>
If data model is not a sync model.</dd><dt>incremental</dt><dd>
Used when the data model is a sync model. Just syncs changes.</dd></dl></li><li>sync_priority : <span class='text-info'>INTEGER</span><p>
Determines how frequently to check for changes. In seconds. Default is 1000.  </p></li></ul></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>Model</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>Model</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.ORM.addModel(<span class="text-info"></span> Anoynomous Function methods)</code> </li></ul></li></ul>

### databaseFullReset(<span class="text-info">BOOLEAN</span> resetClientInfo, <span class="text-info">BOOLEAN</span> resetLocalModels)
Deletes all records from the property bag and model tables.

####Parameters
<ul><li>resetClientInfo : <span class='text-info'>BOOLEAN</span> <span class='label label-info'>Optional</span><p>
True to clean the client_info table, false otherwise. 
False on default.</p></li><li>resetLocalModels : <span class='text-info'>BOOLEAN</span> <span class='label label-info'>Optional</span><p>
True to clean local (non-synced) models, false otherwise. 
Reset all models.</p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.ORM.databaseFullReset(<span class="text-info">BOOLEAN</span> resetClientInfo, <span class="text-info">BOOLEAN</span> resetLocalModels)</code> </li></ul></li></ul>

### databaseFullResetAndLogout()
Deletes all records from the property bag and model tables. Logout the user from RhoConnectClient. For examples, see Resetting the Database in Using the Local Database with ORM.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.ORM.databaseFullResetAndLogout()</code> </li></ul></li></ul>

### databaseFullResetEx(<span class="text-info">HASH</span> propertyMap)
Deletes all records from the property bag and model tables for the model names passed in parameters.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>
Properties map. </p></li><ul><li>models : <span class='text-info'>ARRAY</span><p>
Array of models names to reset. </p></li><li>reset_client_info : <span class='text-info'>BOOLEAN</span> <span class='label label-info'>Optional</span><p>
If set to true, client_info table will be cleaned. 
False on default.</p></li><li>reset_local_models : <span class='text-info'>BOOLEAN</span> <span class='label label-info'>Optional</span><span class='label '> Default: false</span><p>
If set to true, local(non-synced models) will be cleaned. 
Reset all models.</p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.ORM.databaseFullResetEx(<span class="text-info">HASH</span> propertyMap)</code> </li></ul></li></ul>

### databaseFullclientResetAndLogout()
Deletes all records from the property bag and model tables. Logout the user from RhoConnectClient and erase all RhoConnectClient device information. Equivalent to ORM::ORM.databaseFullReset(true) followed by RhoConnectClient.logout.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.ORM.databaseFullclientResetAndLogout()</code> </li></ul></li></ul>

### databaseLocalReset()
Reset only local (non-sync-enabled) models.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.ORM.databaseLocalReset()</code> </li></ul></li></ul>

### export()
Export db.

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
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.ORM.export()</code> </li></ul></li></ul>

### getClientId()
Returns the current sync client id.

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
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.ORM.getClientId()</code> </li></ul></li></ul>

### getModel(<span class="text-info">String</span> modelName)
Returns a model.

####Parameters
<ul><li>modelName : <span class='text-info'>String</span><p>
Name of the model you want returned. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>Model</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>Model</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.ORM.getModel(<span class="text-info">String</span> modelName)</code> </li></ul></li></ul>

### haveLocalChanges()
Returns true if any of the Rhodes model objects have local database changes that need to be synchronized, false otherwise.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>BOOLEAN</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.ORM.haveLocalChanges()</code> </li></ul></li></ul>

### import(<span class="text-info">STRING</span> zipName)
Import db.

####Parameters
<ul><li>zipName : <span class='text-info'>STRING</span><p>
The name of the zip file. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>BOOLEAN</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.ORM.import(<span class="text-info">STRING</span> zipName)</code> </li></ul></li></ul>