# Using the ORM Common API in JavaScript

The RhoMobile Suite provides several methods of handling device data. For RhoMobile Suite 5.3 and higher is the [ORM common API](../api/NewORM), which supports JavaScript (documented here) and Ruby. RMS 5.2 and lower support the original [Rhom API](../api/rhom-api) (for Ruby) and the [ORM API](../api/Orm), which adds JavaScript support to Rhom via the [OPAL library](http://opalrb.org).

## How to Include the ORM API

By default, RhoMobile apps will be built to use the older Rhom implementation (for Ruby) and ORM implementation (for JavaScript). To activate the newer ORM Common API (which supports both JavaScript _and_ Ruby), add the following line to application’s `rhoconfig.txt` file:

    :::yaml
    use_new_orm = 1  

Possible Values: 

* **0 = use 'old' Rhom/ORM API (default)**
* 1 = use newer ORM Common API

NOTE: If this parameter is left unspecified, the older Rhom/ORM API will be used. 

## Creating a JavaScript Model

The first step in using Rhom is to create a model class with the required attributes. Models are created in JavaScript using the [ORM.addModel](../api/Orm#maddModel) method, which defines a class reference for the model and makes it available to the application. 

When the application pages load, execute the `Rho.ORM.addModel` function for every model to be defined in the application.

    :::javascript
    // Models MUST be defined when your HTML pages load

    // Either set a global reference...
    var userModel = Rho.ORM.addModel('User', function(model) {
        model.setModelProperty('name','string','');
        model.setModelProperty('email','string','');     
        // optionally enable sync for rhoconnect applications:
        // model.enable('sync');
        // optionally define model as fixedSchema (default is propertyBag):
        // model.fixed_schema = true);
    });

    // ...or define the model without a global reference
    Rho.ORM.addModel('Product', function(model) {
        model.setModelProperty('name','string','');
        model.setModelProperty('qty','string','');
    });


Once created, models can be retrieved using the `ORM.getModel` method:

    :::javascript
    var productModel = Rho.ORM.getModel('Product');

**NOTE: It is advisable to use either the Ruby or JavaScript methods for handling model definition and access. <b>DO NOT do this from _both_ languages</b>**.

## Adding new items

The fastest way to insert a single item into the database is to use the `create` method to create a new model object and save it to the database:

    :::javascript
    var user = userModel.create({
                name: 'Alice', 
                email: 'alice@example.com'});

You also can create a new model object without saving it automatically, and then explicitly use the `save` method. This is useful for updating some of the object attributes before saving:

    :::javascript
    var user = userModel.make({name: 'Alice'});
    // update the object
    user.email = 'alice@example.com';
    user.save();

## Retrieving objects

Use the `find` method to retrieve all objects for a model or only those matching given conditions:

### Getting all objects for a model 

    :::javascript
    var users = userModel.find('all');

### Finding objects matching conditions

    :::javascript
    var users = userModel.find(
                    'all', 
                    {
                        conditions: {name: 'Alice'}
                    }
                );

### Ordering the objects

Use the `order` and `orderdir` parameters to retrieve objects sorted by one or more attributes: 

    :::javascript
    // order by one attribute
    var users = userModel.find(
                    'all', 
                    {
                        order: 'name', 
                        orderdir: 'DESC', 
                        conditions: {...} // JavaScript API requires conditions
                    }
                );
    
    // order by multiple attributes
    var users = userModel.find(
                    'all', 
                    {
                        order: ['name', 'email'], 
                        orderdir: ['ASC', 'DESC'], 
                        conditions: {...} // JavaScript API requires conditions
                    }
                );

### Retrieving specific attributes

If only some attributes in an object are needed for a particular action, increase app performance by using the `select` parameter to choose only the required attributes: 

JavaScript syntax:
    :::javascript
    var users = userModel.find(
                    'all', 
                    {
                        select: ['name'],
                        conditions: {...} // JavaScript API requires conditions
                    }
                );

### Retrieving the first object match

Use the `first` method (instead of `all`) when calling `find` to get only the first object matching the given condition(s):

    :::javascript
    var user = userModel.find(
                    'first', 
                    {
                        conditions: {name: 'Alice'}
                    }
                );

## Counting objects

Use the `count` parameter with `find` method to get a count of objects matching given condition(s): 

JavaScript syntax:
    :::javascript
    var count = userModel.find(
                    'count', 
                    {
                        conditions: {name: 'Alice'}
                    }
                );

## Updating

The fastest way to add or update object attributes is to save to the database using the `update_attributes` method: 

JavaScript syntax:
    :::javascript
    var user = userModel.find('first', {conditions: {name: 'Alice'});
    user.update_attributes({
            name: 'Bob', 
            email: 'bob@example.com'});

## Deleting

### Deleting one object

To delete one model object, use the `destroy` method on the object to be deleted:

JavaScript syntax:
    :::javascript
    var user = userModel.find('first');
    user.destroy();

### Delete multiple objects

Use the `deleteAll` method to delete all objects for a model or only those matching given condition(s):

JavaScript syntax:
    :::javascript
    // delete all objects
    userModel.delete_all();
    
    // delete only objects matching :conditions
    userModel.delete_all({conditions: {name: 'Alice'}})

## Transactions

For database operations that must either succeed or fail as a group without leaving any partially completed operations, use transactions to group them together. Combine any set of object/model operations, such as 'insert/update/delete' under a transaction: 

    :::javascript
    // open 'app' partition
    var db = new Rho.Database(Rho.Application.databaseFilePath('app'),'app');
    db.startTransaction();
    try
    {
        // do multiple operations
        db.executeSql("update User set name=?, email=? where object=?",["Alice","alice@example.com","12345"]);
        db.executeSql("update User set name=?, email=? where object=?",["Bob","bob@example.com","67890"]);

        // no errors, so commit all the changes
        db.commitTransaction();
    }
    catch
    {
        // on error rollback all changes
        db.rollbackTransaction();
    }
    finally // always close every database connection you open
    {
        db.close();
    }

## Executing SQL

Use the `Database.executeSql` method to execute SQL statements directly on the database:


JavaScript syntax:
    :::javascript
    try {
        var db = new Rho.Database(Rho.Application.databaseFilePath('app'),'app');
        var result = db.executeSql('SELECT * FROM User');  // result is an array of hashes, where each hash is a record
    } 
    finally {
        db.close();
    }

Use the `Database.executeBatchSql` to execute a series of SQL statements in a single method call:

    :::javascript
    db.executeBatchSql("UPDATE User set valid=0; Update Account set active=0");


## Resetting database

To recover the database from a bad or corrupt state or if the RhoConnect server returns errors, use the following method to delete all objects for given model(s): 

JavaScript syntax:
    :::javascript
    var ary = ['Product','Customer'];
    Rho.ORM.databaseFullResetEx(ary, false, true);


## Related reading

* [Database API reference](../api/Database)
* [ORM API reference](../api/Orm)
* [ORMModel API reference](../api/OrmModel)
