# Data Handling Using Rhom

## What is Rhom?

Rhom is a database object mapper or [ORM](https://en.wikipedia.org/wiki/Object-relational_mapping) for RhoMobile. It provides a simple but powerful high level interface to use a local (on-device) SQLite database in terms of objects, and works hand in hand with [RhoConnectClient](../api/RhoConnectClient) to enable two-way synchronization between your application and a RhoConnect server.

One of its main benefits is that, instead of having to write SELECT and UPDATE statements by hand, you can carry out actions in your database by getting and setting properties on model objects.

Without Rhom, you would issue SQL statements to the database:

    :::sql
    update product set price=119,brand='Motorola' where object='12345'

With Rhom you can achieve the same result with:
    :::javascript
    product.updateAttibutes({price: 119, brand: "Motorola"});

Object deletion in SQL:

    :::sql
    delete from product where object='12345'

Object deletion with Rhom:

    :::javascript
    product.destroy();

## What is a model?
RhoMobile applications, in general, follow the [Model-View-Controller  ](http://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller) (MVC) pattern. In RhoMobile, a model can store information from two origins: 

* data created directly on the device
* data retrieved from a RhoConnect synchronization server

Each model contains attributes that it stores information about. For example, a `Product` model could have as attributes `name`, `brand`, `price`, etc. Applications will normally have one model for each entity they handle (`Customer`, `Product`, `Invoice`, `InvoiceLine`, `Order`, `LineItem`, etc).

There are two types of models used with RhoMobile applications: Property Bag and Fixed Schema. Each of them are useful under different conditions. Be sure to consider the points below when chosing which scheme you wish to use in your application.

## Property Bag Model

In a property bag model, all data is stored in a single table using the object-attribute-value pattern also referred to as the [Entity-attribute-value model](http://en.wikipedia.org/wiki/Entity-attribute-value_model). This data is schemaless, which means that you don't need to specify ahead of time what keys exist on each ORM Model. You simply set whatever key-value pairs you want, and Rhom will store and sync it.

### Advantages
* Simple to use, it doesn’t require specifying attributes
* Data migrations are not necessary
* Attributes can be added or removed without modifying the database schema

### Disadvantages
* For some applications, the database size may be significantly larger than fixed schema. This is because each attribute is indexed for fast lookup
* Sync process may be slightly slower because inserts are performed at attribute level

## Fixed Schema Model

In a fixed schema model, each model has a separate database table and each attribute exists as a column in the table. In this sense, fixed schema models are similar to traditional relational tables.

### Advantages
* Smaller database size, indexes can be specified only on specific attributes.
* Sync process may perform faster because whole objects are inserted at a time.

### Disadvantages
* Schema changes must be handled with data migrations.
* Database performance may be slow unless you specify proper indexes.

## Ruby and JavaScript Access
RhoMobile applications provide definition and CRUD access to your data models in both Ruby and JavaScript, however there are some differences in capabilties between the two. Please consult the API reference and guides for further information:


* JavaScript [ORM API](../api/Orm) and [ORM Model API](../api/OrmModel) 
* [JavaScript Rhom Guide](rhom_js) 
* [Ruby Rhom API](../api/rhom-api) 
* [Ruby Rhom Guide](rhom_ruby) 


## Database Encryption

**NOTE: As of Rhodes version 3.3.3, [Rhom data encryption](../../2.2.0/rhodes/rhom#database-encryption) is removed from Rhodes. This feature is only supported in Motorola RhoMobile Suite. If you wish to use this feature, you will need to upgrade to RhoMobile Suite purchase a [RhoElements license](licensing) is required.**

If your application requires that the local database is encrypted on the filesystem, you can enable it by setting a flag in `build.yml`:

    :::yaml
    encrypt_database: 1

**NOTE: Database encryption is not supported for applications that use bulk sync at this time.**

### Platform Notes
* iOS: Uses AES 128 encryption algorithm from iOS SDK.
* Android: Uses AES 128 ecryption algorithm from Android SDK.
* Windows Mobile: Uses RC4 algorithm from Windows Mobile SDK.

