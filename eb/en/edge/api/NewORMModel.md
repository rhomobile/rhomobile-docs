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
Synchronous Return:

* BOOLEAN

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.anyChangedObjects()</code>

### buildComplexWhereCond(<span class="text-info">STRING</span> attrKey, <span class="text-info">ARRAY</span> attrValues, <span class="text-info">STRING</span> valOp, <span class="text-info">STRING</span> valFunc)
Aux function.

####Parameters
<ul><li>attrKey : <span class='text-info'>STRING</span><p> </p></li><li>attrValues : <span class='text-info'>ARRAY</span><p> </p></li><li>valOp : <span class='text-info'>STRING</span><p> </p></li><li>valFunc : <span class='text-info'>STRING</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul></ul>

####Returns
Synchronous Return:

* ARRAY

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.buildComplexWhereCond(<span class="text-info">STRING</span> attrKey, <span class="text-info">ARRAY</span> attrValues, <span class="text-info">STRING</span> valOp, <span class="text-info">STRING</span> valFunc)</code>

### buildFindLimits(<span class="text-info">STRING</span> whatArg, <span class="text-info">HASH</span> hashArgs)
Aux function.

####Parameters
<ul><li>whatArg : <span class='text-info'>STRING</span><p> </p></li><li>hashArgs : <span class='text-info'>HASH</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul></ul>

####Returns
Synchronous Return:

* HASH

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.buildFindLimits(<span class="text-info">STRING</span> whatArg, <span class="text-info">HASH</span> hashArgs)</code>

### buildFindOrder(<span class="text-info">ARRAY</span> order_attrs, <span class="text-info">ARRAY</span> order_ops)
Aux function.

####Parameters
<ul><li>order_attrs : <span class='text-info'>ARRAY</span><p> </p></li><li>order_ops : <span class='text-info'>ARRAY</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul></ul>

####Returns
Synchronous Return:

* HASH

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.buildFindOrder(<span class="text-info">ARRAY</span> order_attrs, <span class="text-info">ARRAY</span> order_ops)</code>

### buildSimpleWhereCond(<span class="text-info">STRING</span> what, <span class="text-info">ARRAY</span> conditions)
Aux function.

####Parameters
<ul><li>what : <span class='text-info'>STRING</span><p> </p></li><li>conditions : <span class='text-info'>ARRAY</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul></ul>

####Returns
Synchronous Return:

* ARRAY

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.buildSimpleWhereCond(<span class="text-info">STRING</span> what, <span class="text-info">ARRAY</span> conditions)</code>

### canModify(<span class="text-info">STRING</span> objId)
Checks whether the object can be modified.

####Parameters
<ul><li>objId : <span class='text-info'>STRING</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:

* BOOLEAN

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.canModify(<span class="text-info">STRING</span> objId)</code>

### clear()
Very, very dangerous method - only to be used in specs!!!

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.NewORMModel.clear()</code> 


### createInstance(<span class="text-info">HASH</span> attrs)
Initializes model's object.

####Parameters
<ul><li>attrs : <span class='text-info'>HASH</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul></ul>

####Returns
Synchronous Return:

* HASH

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.createInstance(<span class="text-info">HASH</span> attrs)</code>

### createObject(<span class="text-info">HASH</span> attrs)
Initializes model's object and stores it in the DB.

####Parameters
<ul><li>attrs : <span class='text-info'>HASH</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul></ul>

####Returns
Synchronous Return:

* HASH

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.createObject(<span class="text-info">HASH</span> attrs)</code>

### deleteObject(<span class="text-info">STRING</span> objId)
Deletes object's attributes from the DB.

####Parameters
<ul><li>objId : <span class='text-info'>STRING</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.deleteObject(<span class="text-info">STRING</span> objId)</code>

### deleteObjects(<span class="text-info">HASH</span> strOptions, <span class="text-info">ARRAY</span> quests)
Deletes all object's according to specified conditions.

####Parameters
<ul><li>strOptions : <span class='text-info'>HASH</span><p> </p></li><li>quests : <span class='text-info'>ARRAY</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.deleteObjects(<span class="text-info">HASH</span> strOptions, <span class="text-info">ARRAY</span> quests)</code>

### deleteObjectsPropertyBagByCondArray(<span class="text-info">STRING</span> conditions, <span class="text-info">ARRAY</span> quests, <span class="text-info">HASH</span> strOptions)
Deletes all objects for the given Property Bag model according to the specified conditions.

####Parameters
<ul><li>conditions : <span class='text-info'>STRING</span><p> </p></li><li>quests : <span class='text-info'>ARRAY</span><p> </p></li><li>strOptions : <span class='text-info'>HASH</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul></ul>

####Returns
Synchronous Return:

* ARRAY

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.deleteObjectsPropertyBagByCondArray(<span class="text-info">STRING</span> conditions, <span class="text-info">ARRAY</span> quests, <span class="text-info">HASH</span> strOptions)</code>

### deleteObjectsPropertyBagByCondHash(<span class="text-info">HASH</span> conditions, <span class="text-info">HASH</span> strOptions)
Deletes all objects for the given Property Bag model according to the specified conditions.

####Parameters
<ul><li>conditions : <span class='text-info'>HASH</span><p> </p></li><li>strOptions : <span class='text-info'>HASH</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul></ul>

####Returns
Synchronous Return:

* ARRAY

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.deleteObjectsPropertyBagByCondHash(<span class="text-info">HASH</span> conditions, <span class="text-info">HASH</span> strOptions)</code>

### <span class="label label-inverse"> Destructor</span> destroy()
Destroys model's instance.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Method Access:

* Class Method: This method is a destructor and can only be accessed via the object that was created by the `new` constructor. 
	* <code>myObj.destroy()</code>


### enable(<span class="text-info">STRING</span> propertyName)
Sets model's Boolean property to true (enables model's property)

####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.enable(<span class="text-info">STRING</span> propertyName)</code>

### enumerate()


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul><ul><li><i>Object</i> : <span class='text-info'>SELF_INSTANCE: EB.NewORMModel</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:

* ARRAY : Array of NewORMModel objects.<ul><li><i>Object</i> : <span class='text-info'>SELF_INSTANCE: EB.NewORMModel</span><p> </p></li></ul>

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.NewORMModel.enumerate()</code> 


### findObjects(<span class="text-info">STRING</span> whatParam, <span class="text-info">HASH</span> strOptions, <span class="text-info">ARRAY</span> quests, <span class="text-info">ARRAY</span> selectAttrs, <span class="text-info">ARRAY</span> orderAttrs)
Returns array of objects for the given model queried according to the specified conditions.

####Parameters
<ul><li>whatParam : <span class='text-info'>STRING</span><p> </p></li><li>strOptions : <span class='text-info'>HASH</span><p> </p></li><li>quests : <span class='text-info'>ARRAY</span><p> </p></li><li>selectAttrs : <span class='text-info'>ARRAY</span><p> </p></li><li>orderAttrs : <span class='text-info'>ARRAY</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul></ul>

####Returns
Synchronous Return:

* ARRAY

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.findObjects(<span class="text-info">STRING</span> whatParam, <span class="text-info">HASH</span> strOptions, <span class="text-info">ARRAY</span> quests, <span class="text-info">ARRAY</span> selectAttrs, <span class="text-info">ARRAY</span> orderAttrs)</code>

### findObjectsPropertyBagByCondArray(<span class="text-info">STRING</span> whatParam, <span class="text-info">STRING</span> conditions, <span class="text-info">ARRAY</span> quests, <span class="text-info">HASH</span> strOptions, <span class="text-info">ARRAY</span> selectAttrs)
Returns array of objects for the given Property Bag model queried according to the specified conditions.

####Parameters
<ul><li>whatParam : <span class='text-info'>STRING</span><p> </p></li><li>conditions : <span class='text-info'>STRING</span><p> </p></li><li>quests : <span class='text-info'>ARRAY</span><p> </p></li><li>strOptions : <span class='text-info'>HASH</span><p> </p></li><li>selectAttrs : <span class='text-info'>ARRAY</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul></ul>

####Returns
Synchronous Return:

* ARRAY

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.findObjectsPropertyBagByCondArray(<span class="text-info">STRING</span> whatParam, <span class="text-info">STRING</span> conditions, <span class="text-info">ARRAY</span> quests, <span class="text-info">HASH</span> strOptions, <span class="text-info">ARRAY</span> selectAttrs)</code>

### findObjectsPropertyBagByCondHash(<span class="text-info">STRING</span> whatParam, <span class="text-info">HASH</span> conditions, <span class="text-info">HASH</span> strOptions, <span class="text-info">ARRAY</span> selectAttrs)
Returns array of objects for the given Property Bag model queried according to the specified conditions.

####Parameters
<ul><li>whatParam : <span class='text-info'>STRING</span><p> </p></li><li>conditions : <span class='text-info'>HASH</span><p> </p></li><li>strOptions : <span class='text-info'>HASH</span><p> </p></li><li>selectAttrs : <span class='text-info'>ARRAY</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul></ul>

####Returns
Synchronous Return:

* ARRAY

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.findObjectsPropertyBagByCondHash(<span class="text-info">STRING</span> whatParam, <span class="text-info">HASH</span> conditions, <span class="text-info">HASH</span> strOptions, <span class="text-info">ARRAY</span> selectAttrs)</code>

### find_by_sql(<span class="text-info">STRING</span> sqlQuery)
Returns array of objects for the given model queried according to the specified SQL.

####Parameters
<ul><li>sqlQuery : <span class='text-info'>STRING</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul></ul>

####Returns
Synchronous Return:

* ARRAY

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.find_by_sql(<span class="text-info">STRING</span> sqlQuery)</code>

### getAllProperties()
This method will return all of object/value pairs for the propertyNames of the API class.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:

* HASH : Map of all available properties<ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul>

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getAllProperties()</code>

### getBackendRefreshTime()
Returns time string when the source has been synced.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getBackendRefreshTime()</code>

### getBelongsTo(<span class="text-info">STRING</span> propertyName)
Returns info about model's relationships with other models.

####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul></ul>

####Returns
Synchronous Return:

* ARRAY

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getBelongsTo(<span class="text-info">STRING</span> propertyName)</code>

### getCount()
Returns total number of objects for the model.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></p><ul></ul>

####Returns
Synchronous Return:

* INTEGER

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getCount()</code>

### getModel(<span class="text-info">STRING</span> modelName)


####Parameters
<ul><li>modelName : <span class='text-info'>STRING</span><p>Name of the model you want returned. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul><ul><li><i>Object</i> : <span class='text-info'>SELF_INSTANCE: EB.NewORMModel</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:

* STRING : NewORMModel object.<ul><li><i>Object</i> : <span class='text-info'>SELF_INSTANCE: EB.NewORMModel</span><p> </p></li></ul>

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.NewORMModel.getModel(<span class="text-info">STRING</span> modelName)</code> 


### getModelProperty(<span class="text-info">STRING</span> propertyName)
Returns info about model's field property.

####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul></ul>

####Returns
Synchronous Return:

* HASH

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getModelProperty(<span class="text-info">STRING</span> propertyName)</code>

### getProperties(<span class="text-info">ARRAY</span> arrayofNames)
This method will return a set of object/value pairs for the list of the propertyName that is passed in. The propertyNames must be a valid property of the API class.

####Parameters
<ul><li>arrayofNames : <span class='text-info'>ARRAY</span><p>List of properties I want to know about </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul></ul>

####Returns
Synchronous Return:

* HASH : Map of properties I want to know about<ul><li> : <span class='text-info'>STRING</span><p> </p></li></ul>

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getProperties(<span class="text-info">ARRAY</span> arrayofNames)</code>

### getProperty(<span class="text-info">STRING</span> propertyName)
This method will return the value of the propertyName that is passed in. The propertyName must be a valid property of the API class.

####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p>The property to return info about. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING : The property to return info about.

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getProperty(<span class="text-info">STRING</span> propertyName)</code>

### hasChanges(<span class="text-info">STRING</span> objId)
Checks whether the object has any changes.

####Parameters
<ul><li>objId : <span class='text-info'>STRING</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:

* BOOLEAN

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.hasChanges(<span class="text-info">STRING</span> objId)</code>

### <span class="label label-inverse"> Constructor</span>  new EB.NewORMModel(<span class="text-info">STRING</span> modelName)
Initializes new model's instance.

####Parameters
<ul><li>modelName : <span class='text-info'>STRING</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Method Access:

* Class Method: This method is a constructor and can only be accessed via the `new` construct. 
	* <code>var myObj = new EB.NewORMModel(<span class="text-info">STRING</span> modelName)</code>


### initModel()
Initializes model's internal DB.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.initModel()</code>

### pushChanges()
Pushes all changes for the source.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.pushChanges()</code>

### saveObject(<span class="text-info">STRING</span> objId, <span class="text-info">HASH</span> attrs)
Saves (creates if necessary or updates if already exists) object's attributes in the DB.

####Parameters
<ul><li>objId : <span class='text-info'>STRING</span><p> </p></li><li>attrs : <span class='text-info'>HASH</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul></ul>

####Returns
Synchronous Return:

* HASH

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.saveObject(<span class="text-info">STRING</span> objId, <span class="text-info">HASH</span> attrs)</code>

### set(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)
Sets model's property to value with additional processing for :sync property.

####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p> </p></li><li>propertyValue : <span class='text-info'>STRING</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.set(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code>

### setBelongsTo(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> sourceName)
Adds 'belongs_to' relationship for the model.

####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p> </p></li><li>sourceName : <span class='text-info'>STRING</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.setBelongsTo(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> sourceName)</code>

### setModelProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyType, <span class="text-info">STRING</span> propOption)
Initializes new model's field property.

####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p> </p></li><li>propertyType : <span class='text-info'>STRING</span><p> </p></li><li>propOption : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><span class='label '> Default: </span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.setModelProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyType, <span class="text-info">STRING</span> propOption)</code>

### setProperties(<span class="text-info">HASH</span> propertyMap)
This method will set the values of a list of properties for the API class. The propertyName must be a valid property for the class and must also not be read only.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>Map of properties I want to set </p></li><ul><li><i>Object</i> : <span class='text-info'>STRING</span><p> </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.setProperties(<span class="text-info">HASH</span> propertyMap)</code>

### setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)
This method will set the value of a property for the API class. The propertyName must be a valid property for the class and must also not be read only.

####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p>The one property name that I want to set </p></li><li>propertyValue : <span class='text-info'>STRING</span><p>The one property value that I want to set </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.setProperty(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code>

### setSchemaIndex(<span class="text-info">STRING</span> indexName, <span class="text-info">ARRAY</span> indexCols, <span class="text-info">BOOLEAN</span> is_unique)
Initializes new model's schema index.

####Parameters
<ul><li>indexName : <span class='text-info'>STRING</span><p> </p></li><li>indexCols : <span class='text-info'>ARRAY</span><p> </p></li><li>is_unique : <span class='text-info'>BOOLEAN</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.setSchemaIndex(<span class="text-info">STRING</span> indexName, <span class="text-info">ARRAY</span> indexCols, <span class="text-info">BOOLEAN</span> is_unique)</code>

### updateObject(<span class="text-info">STRING</span> objId, <span class="text-info">HASH</span> oldAttrs, <span class="text-info">HASH</span> newAttrs)
Updates object's attributes in the DB.

####Parameters
<ul><li>objId : <span class='text-info'>STRING</span><p> </p></li><li>oldAttrs : <span class='text-info'>HASH</span><p> </p></li><li>newAttrs : <span class='text-info'>HASH</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul></ul>

####Returns
Synchronous Return:

* HASH

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.updateObject(<span class="text-info">STRING</span> objId, <span class="text-info">HASH</span> oldAttrs, <span class="text-info">HASH</span> newAttrs)</code>

### validateFreezedAttribute(<span class="text-info">STRING</span> attrName)
Validates object's frozen attribute.

####Parameters
<ul><li>attrName : <span class='text-info'>STRING</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:

* BOOLEAN

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.validateFreezedAttribute(<span class="text-info">STRING</span> attrName)</code>

### validateFreezedAttributes(<span class="text-info">HASH</span> attrHash)
Validates all object's frozen attributes.

####Parameters
<ul><li>attrHash : <span class='text-info'>HASH</span><p> </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:

* BOOLEAN

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.validateFreezedAttributes(<span class="text-info">HASH</span> attrHash)</code>

##Properties



###associations

####Type
<span class='text-info'>STRING</span> 
####Description
Returns model's associations.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.associations</code>

###fixed_schema

####Type
<span class='text-info'>BOOLEAN</span> 
####Description
Returns whether the model's type is fixed schema.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.fixed_schema</code>

###freezed

####Type
<span class='text-info'>BOOLEAN</span> 
####Description
Returns whether the model is frozen.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.freezed</code>

###loaded

####Type
<span class='text-info'>BOOLEAN</span> 
####Description
Returns true if model is loaded.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.loaded</code>

###model_name

####Type
<span class='text-info'>STRING</span> 
####Description
Returns model's name.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.model_name</code>

###partition

####Type
<span class='text-info'>STRING</span> 
####Description
Returns model's Db partition.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.partition</code>

###source_id

####Type
<span class='text-info'>INTEGER</span> 
####Description
Returns model's source_id.
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.source_id</code>

###sync_priority

####Type
<span class='text-info'>INTEGER</span> 
####Description
Returns model's Sync Priority.
####Params
<p><strong>Default:</strong> 1000</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.sync_priority</code>

###sync_type

####Type
<span class='text-info'>STRING</span> 
####Description
Returns model's Sync type.
####Params
<p><strong>Default:</strong> none</p>
####Access


* Instance: This property can be accessed via an instance object of this class: <code>myObject.sync_type</code>