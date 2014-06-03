#NewORMModel


## Overview
<p>NewORMModel CoreAPI module</p>
<p>New implementation of the RHOM Model.</p>



##Methods



### anyChangedObjects()
Checks whether the model has any changed objects.

### buildComplexWhereCond()
Aux function.

### buildFindLimits()
Aux function.

### buildFindOrder()
Aux function.

### buildSimpleWhereCond()
Aux function.

### canModify()
Checks whether the object can be modified.

### clear()
Very, very dangerous method - only to be used in specs!!!

### createInstance()
Initializes model's object.

### createObject()
Initializes model's object and stores it in the DB.

### deleteObject()
Deletes object's attributes from the DB.

### deleteObjects()
Deletes all object's according to specified conditions.

### deleteObjectsPropertyBagByCondArray()
Deletes all objects for the given Property Bag model according to the specified conditions.

### deleteObjectsPropertyBagByCondHash()
Deletes all objects for the given Property Bag model according to the specified conditions.

### <span class="label label-inverse"> Destructor</span> destroy()
Destroys model's instance.

### enable()
Sets model's Boolean property to true (enables model's property)

### enumerate()

### findObjects()
Returns array of objects for the given model queried according to the specified conditions.

### findObjectsPropertyBagByCondArray()
Returns array of objects for the given Property Bag model queried according to the specified conditions.

### findObjectsPropertyBagByCondHash()
Returns array of objects for the given Property Bag model queried according to the specified conditions.

### find_by_sql()
Returns array of objects for the given model queried according to the specified SQL.

### getAllProperties()
This method will return all of object/value pairs for the propertyNames of the API class.

### getBackendRefreshTime()
Returns time string when the source has been synced.

### getBelongsTo()
Returns info about model's relationships with other models.

### getCount()
Returns total number of objects for the model.

### getModel()

### getModelProperty()
Returns info about model's field property.

### getProperties()
This method will return a set of object/value pairs for the list of the propertyName that is passed in. The propertyNames must be a valid property of the API class.

### getProperty()
This method will return the value of the propertyName that is passed in. The propertyName must be a valid property of the API class.

### hasChanges()
Checks whether the object has any changes.

### <span class="label label-inverse"> Constructor</span>  new NewORMModel()
Initializes new model's instance.

### initModel()
Initializes model's internal DB.

### onSyncCreateError()
Handles sync create errors.

### onSyncDeleteError()
Handles sync delete errors for the object.

### onSyncUpdateError()
Handles sync update errors for the object.

### pushChanges()
Pushes all changes for the source.

### saveObject()
Saves (creates if necessary or updates if already exists) object's attributes in the DB.

### set()
Sets model's property to value with additional processing for :sync property.

### setBelongsTo()
Adds 'belongs_to' relationship for the model.

### setModelProperty()
Initializes new model's field property.

### setProperties()
This method will set the values of a list of properties for the API class. The propertyName must be a valid property for the class and must also not be read only.

### setProperty()
This method will set the value of a property for the API class. The propertyName must be a valid property for the class and must also not be read only.

### setSchemaIndex()
Initializes new model's schema index.

### updateObject()
Updates object's attributes in the DB.

### validateFreezedAttribute()
Validates object's frozen attribute.

### validateFreezedAttributes()
Validates all object's frozen attributes.