#NewORM


## Overview
NewORM CoreAPI moduleNew implementation of the RHOM.


##Methods



### databaseClientReset(<span class="text-info">BOOLEAN</span> resetLocalModels)
<p>Resets client info and sync models (optionally, local models as well)</p>


####Parameters
<ul><li>resetLocalModels : <span class='text-info'>BOOLEAN</span><span class='label '> Default: true</span><p>
<p>Whether or not to reset Local Models.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.NewORM.databaseClientReset(<span class="text-info">BOOLEAN</span> resetLocalModels)</code> 


### databaseFullReset(<span class="text-info">BOOLEAN</span> resetClientInfo, <span class="text-info">BOOLEAN</span> resetLocalModels)
<p>Resets selected models, client info and local models.</p>


####Parameters
<ul><li>resetClientInfo : <span class='text-info'>BOOLEAN</span> <span class='label label-info'>Optional</span><span class='label '> Default: false</span><p>
<p>Whether or not to reset Client Info.</p>
 </p></li><li>resetLocalModels : <span class='text-info'>BOOLEAN</span> <span class='label label-info'>Optional</span><span class='label '> Default: true</span><p>
<p>Whether or not to reset Local Models.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.NewORM.databaseFullReset(<span class="text-info">BOOLEAN</span> resetClientInfo, <span class="text-info">BOOLEAN</span> resetLocalModels)</code> 


### databaseFullResetAndLogout()
<p>Resets sync models, client info and local models and does the user logout.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.NewORM.databaseFullResetAndLogout()</code> 


### databaseFullResetEx(<span class="text-info">ARRAY</span> models, <span class="text-info">BOOLEAN</span> resetClientInfo, <span class="text-info">BOOLEAN</span> resetLocalModels)
<p>Resets selected models, client info and local models.</p>


####Parameters
<ul><li>models : <span class='text-info'>ARRAY</span><p>
<p>List of models to reset.</p>
 </p></li><li>resetClientInfo : <span class='text-info'>BOOLEAN</span><p>
<p>Whether or not to reset Client Info.</p>
 </p></li><li>resetLocalModels : <span class='text-info'>BOOLEAN</span><p>
<p>Whether or not to reset Local Models.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.NewORM.databaseFullResetEx(<span class="text-info">ARRAY</span> models, <span class="text-info">BOOLEAN</span> resetClientInfo, <span class="text-info">BOOLEAN</span> resetLocalModels)</code> 


### databaseFullclientResetAndLogout()
<p>Resets sync models, client info and local models and does the user logout.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.NewORM.databaseFullclientResetAndLogout()</code> 


### databaseLocalReset()
<p>Resets local database.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.NewORM.databaseLocalReset()</code> 


### generateId()
<p>Returns newly generated unique object Id.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></p><ul></ul>

####Returns
Synchronous Return:

* INTEGER

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.NewORM.generateId()</code> 


### getClientId()
<p>Returns current Client Id.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.NewORM.getClientId()</code> 


### haveLocalChanges()
<p>Returns TRUE whenever there are any local (non-synced) changes.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:

* BOOLEAN

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.NewORM.haveLocalChanges()</code> 


### useNewOrm()
<p>Returns TRUE if NewORM is enabled in rhoconfig.txt.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:

* BOOLEAN

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.NewORM.useNewOrm()</code> 
