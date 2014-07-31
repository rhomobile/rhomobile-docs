#NewORM


## Overview
NewORM CoreAPI moduleNew implementation of the RHOM.


##Methods



### databaseClientReset(<span class="text-info">BOOLEAN</span> resetLocalModels)
Resets client info and sync models (optionally, local models as well)

####Parameters
<ul><li>resetLocalModels : <span class='text-info'>BOOLEAN</span><span class='label '> Default: true</span><p>
Whether or not to reset Local Models. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.NewORM.databaseClientReset(<span class="text-info">BOOLEAN</span> resetLocalModels)</code> </li></ul></li></ul>

### databaseFullReset(<span class="text-info">BOOLEAN</span> resetClientInfo, <span class="text-info">BOOLEAN</span> resetLocalModels)
Resets selected models, client info and local models.

####Parameters
<ul><li>resetClientInfo : <span class='text-info'>BOOLEAN</span> <span class='label label-info'>Optional</span><span class='label '> Default: false</span><p>
Whether or not to reset Client Info. </p></li><li>resetLocalModels : <span class='text-info'>BOOLEAN</span> <span class='label label-info'>Optional</span><span class='label '> Default: true</span><p>
Whether or not to reset Local Models. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.NewORM.databaseFullReset(<span class="text-info">BOOLEAN</span> resetClientInfo, <span class="text-info">BOOLEAN</span> resetLocalModels)</code> </li></ul></li></ul>

### databaseFullResetAndLogout()
Resets sync models, client info and local models and does the user logout.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.NewORM.databaseFullResetAndLogout()</code> </li></ul></li></ul>

### databaseFullResetEx(<span class="text-info">ARRAY</span> models, <span class="text-info">BOOLEAN</span> resetClientInfo, <span class="text-info">BOOLEAN</span> resetLocalModels)
Resets selected models, client info and local models.

####Parameters
<ul><li>models : <span class='text-info'>ARRAY</span><p>
List of models to reset. </p></li><li>resetClientInfo : <span class='text-info'>BOOLEAN</span><p>
Whether or not to reset Client Info. </p></li><li>resetLocalModels : <span class='text-info'>BOOLEAN</span><p>
Whether or not to reset Local Models. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.NewORM.databaseFullResetEx(<span class="text-info">ARRAY</span> models, <span class="text-info">BOOLEAN</span> resetClientInfo, <span class="text-info">BOOLEAN</span> resetLocalModels)</code> </li></ul></li></ul>

### databaseFullclientResetAndLogout()
Resets sync models, client info and local models and does the user logout.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.NewORM.databaseFullclientResetAndLogout()</code> </li></ul></li></ul>

### databaseLocalReset()
Resets local database.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.NewORM.databaseLocalReset()</code> </li></ul></li></ul>

### generateId()
Returns newly generated unique object Id.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>INTEGER</li></ul>

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.NewORM.generateId()</code> </li></ul></li></ul>

### getClientId()
Returns current Client Id.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>STRING</li></ul>

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.NewORM.getClientId()</code> </li></ul></li></ul>

### haveLocalChanges()
Returns TRUE whenever there are any local (non-synced) changes.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>BOOLEAN</li></ul>

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.NewORM.haveLocalChanges()</code> </li></ul></li></ul>

### useNewOrm()
Returns TRUE if NewORM is enabled in rhoconfig.txt.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>BOOLEAN</li></ul>

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.NewORM.useNewOrm()</code> </li></ul></li></ul>