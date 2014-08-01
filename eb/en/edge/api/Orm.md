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
<p>Creates an ORM model reference.</p>


####Parameters
<ul><li>Anoynomous Function methods : <span class='text-info'></span><p> </p></li><ul><li>modelName("value") : <span class='text-info'>STRING</span><p>
<p>The name of your model.</p>
 </p></li><li>enable("value") : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>
<p>Enables Model Properties.</p>
 </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>sync</dt><dd>
<p>If set then model is set for RhoConnect Sync.</p>
</dd><dt>propertyBag</dt><dd>
<p>(Default) Model will be of type propertyBag.</p>
</dd><dt>fixedSchema</dt><dd>
<p>Model will be of type fixedSchema.</p>
</dd></dl></li><li>property("name","type") : <span class='text-info'>STRING,STRING</span> <span class='label label-info'>Optional</span><p>
<p>Used to create properties on your model.</p>
 </p></li><ul><li>name : <span class='text-info'>STRING</span><p>
<p>The name of the property.</p>
 </p></li><li>type : <span class='text-info'>STRING</span><p>
<p>The type of property value: String, Float, integer, Varchar, Blob &ndash; String is default.</p>
 </p></li></ul><li>addIndex("name",[colArray]) : <span class='text-info'>STRING, ARRAY</span> <span class='label label-info'>Optional</span><p>
<p>Add an index to your fixedSchema model.</p>
 </p></li><ul><li>name : <span class='text-info'>STRING</span><p>
<p>The name of the index.</p>
 </p></li><li>colArray : <span class='text-info'>ARRAY</span><p>
<p>Array of model column names to use in index, Ex: [&lsquo;name&rsquo;,&lsquo;qty&rsquo;]</p>
 </p></li></ul><li>addUniqueIndex("name",[colArray]) : <span class='text-info'>STRING, ARRAY</span> <span class='label label-info'>Optional</span><p>
<p>Add an index to your fixedSchema model.</p>
 </p></li><ul><li>name : <span class='text-info'>STRING</span><p>
<p>The name of the index.</p>
 </p></li><li>colArray : <span class='text-info'>ARRAY</span><p>
<p>Array of model column names to use in index, Ex: [&lsquo;name&rsquo;,&lsquo;qty&rsquo;]</p>
 </p></li></ul><li>belongs_to("name") : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>
<p>Add belongs_to association to another defined model, for sync models. Comma-separated String for more than one model.</p>
 </p></li><li>set(property,value) : <span class='text-info'>STRING,VALUE</span> <span class='label label-info'>Optional</span><p>
<p>Set Behavior of this model. Possible <code>property</code> options and corresponding values.</p>
 </p></li><ul><li>partition : <span class='text-info'>STRING</span><p>
<p>The partition to use for this model. Partitions can be used to segment the data and keep non-synched data separate from synched models. Possible <code>values</code>.</p>
 </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>local</dt><dd>
<p>This partition is used automatically if the model is not a sync model.</p>
</dd><dt>user</dt><dd>
<p>This partition is used automatically if the model is a sync model.</p>
</dd></dl></li><li>sync_type : <span class='text-info'>STRING</span><p>
<p>Sets the type of sync it will be.</p>
 </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>none</dt><dd>
<p>If data model is not a sync model.</p>
</dd><dt>incremental</dt><dd>
<p>Used when the data model is a sync model. Just syncs changes.</p>
</dd></dl></li><li>sync_priority : <span class='text-info'>INTEGER</span><p>
<p>Determines how frequently to check for changes. In seconds. Default is 1000.</p>
 </p></li></ul></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>Model</span></p><ul></ul>

####Returns
Synchronous Return:

* Model

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.ORM.addModel(<span class="text-info"></span> Anoynomous Function methods)</code> 


### databaseFullReset(<span class="text-info">BOOLEAN</span> resetClientInfo, <span class="text-info">BOOLEAN</span> resetLocalModels)
<p>Deletes all records from the property bag and model tables.</p>


####Parameters
<ul><li>resetClientInfo : <span class='text-info'>BOOLEAN</span> <span class='label label-info'>Optional</span><p>
<p>True to clean the client_info table, false otherwise.</p>
 
<p>False on default.</p>
</p></li><li>resetLocalModels : <span class='text-info'>BOOLEAN</span> <span class='label label-info'>Optional</span><p>
<p>True to clean local (non-synced) models, false otherwise.</p>
 
<p>Reset all models.</p>
</p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.ORM.databaseFullReset(<span class="text-info">BOOLEAN</span> resetClientInfo, <span class="text-info">BOOLEAN</span> resetLocalModels)</code> 


### databaseFullResetAndLogout()
<p>Deletes all records from the property bag and model tables. Logout the user from RhoConnectClient. For examples, see Resetting the Database in Using the Local Database with ORM.</p>


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
	* <code>EB.ORM.databaseFullResetAndLogout()</code> 


### databaseFullResetEx(<span class="text-info">HASH</span> propertyMap)
<p>Deletes all records from the property bag and model tables for the model names passed in parameters.</p>


####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>
<p>Properties map.</p>
 </p></li><ul><li>models : <span class='text-info'>ARRAY</span><p>
<p>Array of models names to reset.</p>
 </p></li><li>reset_client_info : <span class='text-info'>BOOLEAN</span> <span class='label label-info'>Optional</span><p>
<p>If set to true, client_info table will be cleaned.</p>
 
<p>False on default.</p>
</p></li><li>reset_local_models : <span class='text-info'>BOOLEAN</span> <span class='label label-info'>Optional</span><span class='label '> Default: false</span><p>
<p>If set to true, local(non-synced models) will be cleaned.</p>
 
<p>Reset all models.</p>
</p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.ORM.databaseFullResetEx(<span class="text-info">HASH</span> propertyMap)</code> 


### databaseFullclientResetAndLogout()
<p>Deletes all records from the property bag and model tables. Logout the user from RhoConnectClient and erase all RhoConnectClient device information. Equivalent to ORM::ORM.databaseFullReset(true) followed by RhoConnectClient.logout.</p>


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
	* <code>EB.ORM.databaseFullclientResetAndLogout()</code> 


### databaseLocalReset()
<p>Reset only local (non-sync-enabled) models.</p>


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
	* <code>EB.ORM.databaseLocalReset()</code> 


### export()
<p>Export db.</p>


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
	* <code>EB.ORM.export()</code> 


### getClientId()
<p>Returns the current sync client id.</p>


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
	* <code>EB.ORM.getClientId()</code> 


### getModel(<span class="text-info">String</span> modelName)
<p>Returns a model.</p>


####Parameters
<ul><li>modelName : <span class='text-info'>String</span><p>
<p>Name of the model you want returned.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>Model</span></p><ul></ul>

####Returns
Synchronous Return:

* Model

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.ORM.getModel(<span class="text-info">String</span> modelName)</code> 


### haveLocalChanges()
<p>Returns true if any of the Rhodes model objects have local database changes that need to be synchronized, false otherwise.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:

* BOOLEAN

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.ORM.haveLocalChanges()</code> 


### import(<span class="text-info">STRING</span> zipName)
<p>Import db.</p>


####Parameters
<ul><li>zipName : <span class='text-info'>STRING</span><p>
<p>The name of the zip file.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:

* BOOLEAN

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.ORM.import(<span class="text-info">STRING</span> zipName)</code> 
