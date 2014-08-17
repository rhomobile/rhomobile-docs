# Using Rhom in JavaScript
<!-- TBD - Tweak this for EB specific. Came from http://docs.rhomobile.com/en/4.1.0/guide/rhom_js -->

## Creating a JavaScript Model

The first step in order to use Rhom is to create a model class with the required attributes. You can create models from JavaScript using the [ORM.addModel](../api/Orm#maddModel) method. What this method does is define a class reference for your model so it is available to the rest of your application. When your application pages load, you must execute the `Rho.ORM.addModel` function for every model that you wish to define in your application.

    :::javascript
    // Models MUST be defined when your HTML pages load

    // You can either set a global reference 
    var userModel = Rho.ORM.addModel(function(model) {
        model.modelName('User');
        model.property('name','string');
        model.property('email','string');
        // optionally enable sync for rhoconnect applications
        // model.enable('sync');
        // optionally, define the model as fixed schema default is propertyBag
        // model.enable('fixedSchema');
    });

    // Or just define the model without a global reference
    Rho.ORM.addModel(function(model) {
        model.modelName('Product');
        model.property('name','string');
        model.property('qty','string');
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

You can also sort with an user defined function.

    :::javascript
    // order by one attribute
    var users = userModel.find(
        'all',
        {
            orderFunction: function(a, b) { return a <= b }
        }
    ); 

    // order by multiple attributes
    var users = userModel.find(
        'all',
        {
            orderFunction: function(a, b) {
                    return a.name <= b.name && a.email <= b.email
                }
        }
    );

**NOTE: Whenever possible, use `order` instead of `orderFunction`. The database will sort objects faster than JavaScript code.**

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

You can update an object’s attributes and save it to the database using the `updateAttributes` method

NOTE: This is the fastest way to add or update item attributes.

JavaScript syntax:
    :::javascript
    var user = userModel.find('first', {conditions: {name: 'Alice'});
    user.updateAttributes({
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

To delete all objects for a model, or only those matching given conditions, use the `deleteAll` method.

JavaScript syntax:
    :::javascript
    // delete all objects
    userModel.deleteAll();
    
    // delete only objects matching :conditions
    userModel.deleteAll({conditions: {name: 'Alice'}})

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
    } finally {
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
    Rho.ORM.databaseFullResetEx({'models': ['User'], 'reset_client_info': true, 'reset_local_models': true});


## Related reading

* [Database API reference](../api/Database)
* [ORM API reference](../api/Orm)
* [ORMModel API reference](../api/OrmModel)
