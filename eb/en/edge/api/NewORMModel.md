#NewORMModel


## Overview
NewORMModel CoreAPI moduleNew implementation of the RHOM Model.


##Methods



### anyChangedObjects()
Checks whether the model has any changed objects.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>BOOLEAN</li></ul>

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.anyChangedObjects()</code></li></ul></li></ul>

### buildComplexWhereCond(<span class="text-info">STRING</span> attrKey, <span class="text-info">ARRAY</span> attrValues, <span class="text-info">STRING</span> valOp, <span class="text-info">STRING</span> valFunc)
Aux function.

####Parameters
<ul><li>attrKey : <span class='text-info'>STRING</span><p> </p></li><li>attrValues : <span class='text-info'>ARRAY</span><p> </p></li><li>valOp : <span class='text-info'>STRING</span><p> </p></li><li>valFunc : <span class='text-info'>STRING</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>ARRAY</li></ul>

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.buildComplexWhereCond(<span class="text-info">STRING</span> attrKey, <span class="text-info">ARRAY</span> attrValues, <span class="text-info">STRING</span> valOp, <span class="text-info">STRING</span> valFunc)</code></li></ul></li></ul>

### buildFindLimits(<span class="text-info">STRING</span> whatArg, <span class="text-info">HASH</span> hashArgs)
Aux function.

####Parameters
<ul><li>whatArg : <span class='text-info'>STRING</span><p> </p></li><li>hashArgs : <span class='text-info'>HASH</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>HASH</li></ul>

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.buildFindLimits(<span class="text-info">STRING</span> whatArg, <span class="text-info">HASH</span> hashArgs)</code></li></ul></li></ul>

### buildFindOrder(<span class="text-info">ARRAY</span> order_attrs, <span class="text-info">ARRAY</span> order_ops)
Aux function.

####Parameters
<ul><li>order_attrs : <span class='text-info'>ARRAY</span><p> </p></li><li>order_ops : <span class='text-info'>ARRAY</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>HASH</li></ul>

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.buildFindOrder(<span class="text-info">ARRAY</span> order_attrs, <span class="text-info">ARRAY</span> order_ops)</code></li></ul></li></ul>

### buildSimpleWhereCond(<span class="text-info">STRING</span> what, <span class="text-info">ARRAY</span> conditions)
Aux function.

####Parameters
<ul><li>what : <span class='text-info'>STRING</span><p> </p></li><li>conditions : <span class='text-info'>ARRAY</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>ARRAY</li></ul>

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.buildSimpleWhereCond(<span class="text-info">STRING</span> what, <span class="text-info">ARRAY</span> conditions)</code></li></ul></li></ul>

### canModify(<span class="text-info">STRING</span> objId)
Checks whether the object can be modified.

####Parameters
<ul><li>objId : <span class='text-info'>STRING</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>BOOLEAN</li></ul>

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.canModify(<span class="text-info">STRING</span> objId)</code></li></ul></li></ul>

### clear()
Very, very dangerous method - only to be used in specs!!!

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.NewORMModel.clear()</code> </li></ul></li></ul>

### createInstance(<span class="text-info">HASH</span> attrs)
Initializes model's object.

####Parameters
<ul><li>attrs : <span class='text-info'>HASH</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>HASH</li></ul>

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.createInstance(<span class="text-info">HASH</span> attrs)</code></li></ul></li></ul>

### createObject(<span class="text-info">HASH</span> attrs)
Initializes model's object and stores it in the DB.

####Parameters
<ul><li>attrs : <span class='text-info'>HASH</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>HASH</li></ul>

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.createObject(<span class="text-info">HASH</span> attrs)</code></li></ul></li></ul>

### deleteObject(<span class="text-info">STRING</span> objId)
Deletes object's attributes from the DB.

####Parameters
<ul><li>objId : <span class='text-info'>STRING</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.deleteObject(<span class="text-info">STRING</span> objId)</code></li></ul></li></ul>

### deleteObjects(<span class="text-info">HASH</span> strOptions, <span class="text-info">ARRAY</span> quests)
Deletes all object's according to specified conditions.

####Parameters
<ul><li>strOptions : <span class='text-info'>HASH</span><p> </p></li><li>quests : <span class='text-info'>ARRAY</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.deleteObjects(<span class="text-info">HASH</span> strOptions, <span class="text-info">ARRAY</span> quests)</code></li></ul></li></ul>

### deleteObjectsPropertyBagByCondArray(<span class="text-info">STRING</span> conditions, <span class="text-info">ARRAY</span> quests, <span class="text-info">HASH</span> strOptions)
Deletes all objects for the given Property Bag model according to the specified conditions.

####Parameters
<ul><li>conditions : <span class='text-info'>STRING</span><p> </p></li><li>quests : <span class='text-info'>ARRAY</span><p> </p></li><li>strOptions : <span class='text-info'>HASH</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>ARRAY</li></ul>

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.deleteObjectsPropertyBagByCondArray(<span class="text-info">STRING</span> conditions, <span class="text-info">ARRAY</span> quests, <span class="text-info">HASH</span> strOptions)</code></li></ul></li></ul>

### deleteObjectsPropertyBagByCondHash(<span class="text-info">HASH</span> conditions, <span class="text-info">HASH</span> strOptions)
Deletes all objects for the given Property Bag model according to the specified conditions.

####Parameters
<ul><li>conditions : <span class='text-info'>HASH</span><p> </p></li><li>strOptions : <span class='text-info'>HASH</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>ARRAY</li></ul>

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.deleteObjectsPropertyBagByCondHash(<span class="text-info">HASH</span> conditions, <span class="text-info">HASH</span> strOptions)</code></li></ul></li></ul>

### <span class="label label-inverse"> Destructor</span> destroy()
Destroys model's instance.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Method Access:
<ul><li>Class Method: This method is a destructor and can only be accessed via the object that was created by the `new` constructor. <ul><li><code>myObj.destroy()</code> </li></ul></li></ul>

### enable(<span class="text-info">STRING</span> propertyName)
Sets model's Boolean property to true (enables model's property)

####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.enable(<span class="text-info">STRING</span> propertyName)</code></li></ul></li></ul>

### enumerate()

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul><ul><li><i>Object</i> : <span class='text-info'>SELF_INSTANCE: EB.NewORMModel</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>ARRAY : 
Array of NewORMModel objects.<ul><li><i>Object</i> : <span class='text-info'>SELF_INSTANCE: EB.NewORMModel</span><p> </p></li></ul></li></ul>

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.NewORMModel.enumerate()</code> </li></ul></li></ul>

### findObjects(<span class="text-info">STRING</span> whatParam, <span class="text-info">HASH</span> strOptions, <span class="text-info">ARRAY</span> quests, <span class="text-info">ARRAY</span> selectAttrs, <span class="text-info">ARRAY</span> orderAttrs)
Returns array of objects for the given model queried according to the specified conditions.

####Parameters
<ul><li>whatParam : <span class='text-info'>STRING</span><p> </p></li><li>strOptions : <span class='text-info'>HASH</span><p> </p></li><li>quests : <span class='text-info'>ARRAY</span><p> </p></li><li>selectAttrs : <span class='text-info'>ARRAY</span><p> </p></li><li>orderAttrs : <span class='text-info'>ARRAY</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>ARRAY</li></ul>

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.findObjects(<span class="text-info">STRING</span> whatParam, <span class="text-info">HASH</span> strOptions, <span class="text-info">ARRAY</span> quests, <span class="text-info">ARRAY</span> selectAttrs, <span class="text-info">ARRAY</span> orderAttrs)</code></li></ul></li></ul>

### findObjectsPropertyBagByCondArray(<span class="text-info">STRING</span> whatParam, <span class="text-info">STRING</span> conditions, <span class="text-info">ARRAY</span> quests, <span class="text-info">HASH</span> strOptions, <span class="text-info">ARRAY</span> selectAttrs)
Returns array of objects for the given Property Bag model queried according to the specified conditions.

####Parameters
<ul><li>whatParam : <span class='text-info'>STRING</span><p> </p></li><li>conditions : <span class='text-info'>STRING</span><p> </p></li><li>quests : <span class='text-info'>ARRAY</span><p> </p></li><li>strOptions : <span class='text-info'>HASH</span><p> </p></li><li>selectAttrs : <span class='text-info'>ARRAY</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>ARRAY</li></ul>

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.findObjectsPropertyBagByCondArray(<span class="text-info">STRING</span> whatParam, <span class="text-info">STRING</span> conditions, <span class="text-info">ARRAY</span> quests, <span class="text-info">HASH</span> strOptions, <span class="text-info">ARRAY</span> selectAttrs)</code></li></ul></li></ul>

### findObjectsPropertyBagByCondHash(<span class="text-info">STRING</span> whatParam, <span class="text-info">HASH</span> conditions, <span class="text-info">HASH</span> strOptions, <span class="text-info">ARRAY</span> selectAttrs)
Returns array of objects for the given Property Bag model queried according to the specified conditions.

####Parameters
<ul><li>whatParam : <span class='text-info'>STRING</span><p> </p></li><li>conditions : <span class='text-info'>HASH</span><p> </p></li><li>strOptions : <span class='text-info'>HASH</span><p> </p></li><li>selectAttrs : <span class='text-info'>ARRAY</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>ARRAY</li></ul>

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.findObjectsPropertyBagByCondHash(<span class="text-info">STRING</span> whatParam, <span class="text-info">HASH</span> conditions, <span class="text-info">HASH</span> strOptions, <span class="text-info">ARRAY</span> selectAttrs)</code></li></ul></li></ul>

### find_by_sql(<span class="text-info">STRING</span> sqlQuery)
Returns array of objects for the given model queried according to the specified SQL.

####Parameters
<ul><li>sqlQuery : <span class='text-info'>STRING</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>ARRAY</li></ul>

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.find_by_sql(<span class="text-info">STRING</span> sqlQuery)</code></li></ul></li></ul>

### getAllProperties()
This method will return all of object/value pairs for the propertyNames of the API class.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>HASH : 
Map of all available properties<ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul></li></ul>

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.getAllProperties()</code></li></ul></li></ul>

### getBackendRefreshTime()
Returns time string when the source has been synced.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>STRING</li></ul>

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.getBackendRefreshTime()</code></li></ul></li></ul>

### getBelongsTo(<span class="text-info">STRING</span> propertyName)
Returns info about model's relationships with other models.

####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>ARRAY</li></ul>

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.getBelongsTo(<span class="text-info">STRING</span> propertyName)</code></li></ul></li></ul>

### getCount()
Returns total number of objects for the model.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>INTEGER</li></ul>

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.getCount()</code></li></ul></li></ul>

### getModel(<span class="text-info">STRING</span> modelName)

####Parameters
<ul><li>modelName : <span class='text-info'>STRING</span><p>
Name of the model you want returned. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul><ul><li><i>Object</i> : <span class='text-info'>SELF_INSTANCE: EB.NewORMModel</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>STRING : 
NewORMModel object.<ul><li><i>Object</i> : <span class='text-info'>SELF_INSTANCE: EB.NewORMModel</span><p> </p></li></ul></li></ul>

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.NewORMModel.getModel(<span class="text-info">STRING</span> modelName)</code> </li></ul></li></ul>

### getModelProperty(<span class="text-info">STRING</span> propertyName)
Returns info about model's field property.

####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>HASH</li></ul>

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.getModelProperty(<span class="text-info">STRING</span> propertyName)</code></li></ul></li></ul>

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

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code></li></ul></li></ul>

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

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.getProperty(<span class="text-info">STRING</span> propertyName)</code></li></ul></li></ul>

### hasChanges(<span class="text-info">STRING</span> objId)
Checks whether the object has any changes.

####Parameters
<ul><li>objId : <span class='text-info'>STRING</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>BOOLEAN</li></ul>

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.hasChanges(<span class="text-info">STRING</span> objId)</code></li></ul></li></ul>

### <span class="label label-inverse"> Constructor</span>  new EB.NewORMModel(<span class="text-info">STRING</span> modelName)
Initializes new model's instance.

####Parameters
<ul><li>modelName : <span class='text-info'>STRING</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Method Access:
<ul><li>Class Method: This method is a constructor and can only be accessed via the `new` construct. <ul><li><code>var myObj = new EB.NewORMModel(<span class="text-info">STRING</span> modelName)</code> </li></ul></li></ul>

### initModel()
Initializes model's internal DB.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.initModel()</code></li></ul></li></ul>

### pushChanges()
Pushes all changes for the source.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.pushChanges()</code></li></ul></li></ul>

### saveObject(<span class="text-info">STRING</span> objId, <span class="text-info">HASH</span> attrs)
Saves (creates if necessary or updates if already exists) object's attributes in the DB.

####Parameters
<ul><li>objId : <span class='text-info'>STRING</span><p> </p></li><li>attrs : <span class='text-info'>HASH</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>HASH</li></ul>

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.saveObject(<span class="text-info">STRING</span> objId, <span class="text-info">HASH</span> attrs)</code></li></ul></li></ul>

### set(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)
Sets model's property to value with additional processing for :sync property.

####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p> </p></li><li>propertyValue : <span class='text-info'>STRING</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.set(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code></li></ul></li></ul>

### setBelongsTo(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> sourceName)
Adds 'belongs_to' relationship for the model.

####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p> </p></li><li>sourceName : <span class='text-info'>STRING</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.setBelongsTo(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> sourceName)</code></li></ul></li></ul>

### setModelProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyType, <span class="text-info">STRING</span> propOption)
Initializes new model's field property.

####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p> </p></li><li>propertyType : <span class='text-info'>STRING</span><p> </p></li><li>propOption : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><span class='label '> Default: </span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.setModelProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyType, <span class="text-info">STRING</span> propOption)</code></li></ul></li></ul>

### setProperties(<span class="text-info">HASH</span> propertyMap)
This method will set the values of a list of properties for the API class. The propertyName must be a valid property for the class and must also not be read only.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>
Map of properties I want to set </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.setProperties(<span class="text-info">HASH</span> propertyMap)</code></li></ul></li></ul>

### setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)
This method will set the value of a property for the API class. The propertyName must be a valid property for the class and must also not be read only.

####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p>
The one property name that I want to set </p></li><li>propertyValue : <span class='text-info'>STRING</span><p>
The one property value that I want to set </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code></li></ul></li></ul>

### setSchemaIndex(<span class="text-info">STRING</span> indexName, <span class="text-info">ARRAY</span> indexCols, <span class="text-info">BOOLEAN</span> is_unique)
Initializes new model's schema index.

####Parameters
<ul><li>indexName : <span class='text-info'>STRING</span><p> </p></li><li>indexCols : <span class='text-info'>ARRAY</span><p> </p></li><li>is_unique : <span class='text-info'>BOOLEAN</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.setSchemaIndex(<span class="text-info">STRING</span> indexName, <span class="text-info">ARRAY</span> indexCols, <span class="text-info">BOOLEAN</span> is_unique)</code></li></ul></li></ul>

### updateObject(<span class="text-info">STRING</span> objId, <span class="text-info">HASH</span> oldAttrs, <span class="text-info">HASH</span> newAttrs)
Updates object's attributes in the DB.

####Parameters
<ul><li>objId : <span class='text-info'>STRING</span><p> </p></li><li>oldAttrs : <span class='text-info'>HASH</span><p> </p></li><li>newAttrs : <span class='text-info'>HASH</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>HASH</li></ul>

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.updateObject(<span class="text-info">STRING</span> objId, <span class="text-info">HASH</span> oldAttrs, <span class="text-info">HASH</span> newAttrs)</code></li></ul></li></ul>

### validateFreezedAttribute(<span class="text-info">STRING</span> attrName)
Validates object's frozen attribute.

####Parameters
<ul><li>attrName : <span class='text-info'>STRING</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>BOOLEAN</li></ul>

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.validateFreezedAttribute(<span class="text-info">STRING</span> attrName)</code></li></ul></li></ul>

### validateFreezedAttributes(<span class="text-info">HASH</span> attrHash)
Validates all object's frozen attributes.

####Parameters
<ul><li>attrHash : <span class='text-info'>HASH</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>BOOLEAN</li></ul>

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.validateFreezedAttributes(<span class="text-info">HASH</span> attrHash)</code></li></ul></li></ul>

##Properties



###associations

####Type
<span class='text-info'>STRING</span> 
####Description

Returns model's associations.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.associations</code></li></ul></li></ul>

###fixed_schema

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

Returns whether the model's type is fixed schema.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.fixed_schema</code></li></ul></li></ul>

###freezed

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

Returns whether the model is frozen.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.freezed</code></li></ul></li></ul>

###loaded

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

Returns true if model is loaded.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.loaded</code></li></ul></li></ul>

###model_name

####Type
<span class='text-info'>STRING</span> 
####Description

Returns model's name.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.model_name</code></li></ul></li></ul>

###partition

####Type
<span class='text-info'>STRING</span> 
####Description

Returns model's Db partition.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.partition</code></li></ul></li></ul>

###source_id

####Type
<span class='text-info'>INTEGER</span> 
####Description

Returns model's source_id.
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.source_id</code></li></ul></li></ul>

###sync_priority

####Type
<span class='text-info'>INTEGER</span> 
####Description

Returns model's Sync Priority.
####Params
<p><strong>Default:</strong> 1000</p>
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.sync_priority</code></li></ul></li></ul>

###sync_type

####Type
<span class='text-info'>STRING</span> 
####Description

Returns model's Sync type.
####Params
<p><strong>Default:</strong> none</p>
####Access
<ul><li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.sync_type</code></li></ul></li></ul>