# Using the ORM Common API in JavaScript

The RhoMobile Suite provides several methods of handling device data. For RhoMobile Suite 5.3 and higher is the [ORM common API](../api/NewORM), which supports JavaScript (documented here) and Ruby. RMS 5.2 and lower support the original [Rhom API](../api/rhom-api) (for Ruby) and the [ORM API](../api/Orm), which adds JavaScript support to Rhom via the [OPAL library](http://opalrb.org).

## Creating a JavaScript Model

The first step in using Rhom is to create a model class with the required attributes. Create models from JavaScript using the [ORM.addModel](../api/Orm#maddModel) method, which defines a class reference for the model and makes it available to the application. 

When the application pages load, execute the `Rho.ORM.addModel` function for every model to be defined in the application.

    :::javascript
    // Models MUST be defined when your HTML pages load

    // Either set a global reference 
    var userModel = Rho.ORM.addModel('User', function(model) {
        model.setModelProperty('name','string','');
        model.setModelProperty('email','string','');     
        // optionally enable sync for rhoconnect applications
        // model.enable('sync');
        // optionally, define the model as fixed schema default is propertyBag
        // model.fixed_schema = true);
    });

    // Or define the model without a global reference
    Rho.ORM.addModel('Product', function(model) {
        model.setModelProperty('name','string','');
        model.setModelProperty('qty','string','');
    });


Once created, models can be retrieved using the `ORM.getModel` method.

    :::javascript
    var productModel = Rho.ORM.getModel('Product');

**NOTE: It is advised that you either use the Ruby or JavaScript methods for handling model definition and access and not do this from <b>both</> languages. **

## Adding new items

Use the `create` method to create a new model object and save it to the database. 

NOTE: This is the fastest way to insert a single item into the database.

    :::javascript
    var user = userModel.create({
                name: 'Alice', 
                email: 'alice@example.com'});

You can also create the new model object without saving it automatically and then explicitly use the `save` method. This is useful when you want to update some of the object attributes before saving.

    :::javascript
    var user = userModel.make({name: 'Alice'});
    // update the object
    user.email = 'alice@example.com';
    user.save();

## Retrieving objects

You can retrieve all objects for a model or only those matching given conditions using the `find` method.

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

You can retrieve objects sorted by one or more attributes using the `order` and `orderdir` parameters.

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

If, for a particular action, you do not need every attribute in an object, you can make your application faster by selecting only the specific attributes you need using the `select` parameter.

JavaScript syntax:
    :::javascript
    var users = userModel.find(
                    'all', 
                    {
                        select: ['name'],
                        conditions: {...} // JavaScript API requires conditions
                    }
                );

### Retrieving only the first object matching conditions

You can get only the first object matching given conditions using `first` instead of `all` when calling `find`.

    :::javascript
    var user = userModel.find(
                    'first', 
                    {
                        conditions: {name: 'Alice'}
                    }
                );

## Counting objects

You can get the number of objects matching given conditions using the `count` parameter with `find` method.

JavaScript syntax:
    :::javascript
    var count = userModel.find(
                    'count', 
                    {
                        conditions: {name: 'Alice'}
                    }
                );

## Updating

You can update an object’s attributes and save it to the database using the `update_attributes` method

NOTE: This is the fastest way to add or update item attributes.

JavaScript syntax:
    :::javascript
    var user = userModel.find('first', {conditions: {name: 'Alice'});
    user.update_attributes({
            name: 'Bob', 
            email: 'bob@example.com'});

## Deleting

### Deleting one object

To delete one model object use the `destroy` method on the object to be deleted.

JavaScript syntax:
    :::javascript
    var user = userModel.find('first');
    user.destroy();

### Delete multiple objects

To delete all objects for a model, or only those matching given conditions, use the `delete_all` method.

JavaScript syntax:
    :::javascript
    // delete all objects
    userModel.delete_all();
    
    // delete only objects matching :conditions
    userModel.delete_all({conditions: {name: 'Alice'}})

## Transactions

Use transactions to group together database operations that must either succeed or fail as a group, without leaving any partially completed operations. You can combine any set of object/model operations like insert/update/delete under a transaction.


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

You can execute SQL statements directly on the database by using `Database.executeSql` method.


JavaScript syntax:
    :::javascript
    try {
        var db = new Rho.Database(Rho.Application.databaseFilePath('app'),'app');
        var result = db.executeSql('SELECT * FROM User');  // result is an array of hashes, where each hash is a record
    } 
    finally {
        db.close();
    }

You can execute a series of SQL statements in a single method call by using `Database.executeBatchSql` method.

    :::javascript
    db.executeBatchSql("UPDATE User set valid=0; Update Account set active=0");


## Resetting database

You can use the following method for recovering the database from a bad or corrupt state or if the RhoConnect server returns errors.

### Delete all objects for given models.

JavaScript syntax:
    :::javascript
    var ary = ['Product','Customer'];
    Rho.ORM.databaseFullResetEx(ary, false, true);


## Related reading

* [Database API reference](../api/Database)
* [ORM API reference](../api/Orm)
* [ORMModel API reference](../api/OrmModel)
