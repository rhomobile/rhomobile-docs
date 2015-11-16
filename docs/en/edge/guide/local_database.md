# Data Handling Using Rhom

## What is Rhom?

Rhom is a database object mapper or [ORM](https://en.wikipedia.org/wiki/Object-relational_mapping) for RhoMobile. It provides a simple but powerful high level interface to use a local (on-device) SQLite database in terms of objects, and works hand in hand with [RhoConnectClient](../api/RhoConnectClient) to enable two-way synchronization between your application and a RhoConnect server.

One of its main benefits is that, instead of having to write SELECT and UPDATE statements by hand, you can carry out actions in your database by getting and setting properties on model objects.

Without Rhom, you would issue SQL statements to the database:

    :::sql
    update product set price=119,brand='Motorola' where object='12345'

With Rhom you can achieve the same result with:
    :::javascript
    product.updateAttibutes({price: 119, brand: "Zebra"});

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

In the property bag model, data is stored as key-value pairs in a single table using the object-attribute-value or [entity-attribute-value model](http://en.wikipedia.org/wiki/Entity-attribute-value_model). This model is sometimes referred to as 'open schema' because the fields (or keys) do not have to be defined in advance. Instead, the API stores and syncs all key-value pairs that are input.

### Advantages
* Simple, doesn’t require advance attribute design 
* Attributes can be added or removed without modifying the database schema
* Requires no data migration following a schema change 

### Disadvantages
* The database size can be significantly larger than that of a fixed schema; all attributed are indexed
* Sync process can be slower (because database insertions are performed at the attribute level)

## Fixed Schema Model

In a fixed schema model, each model has a separate database table and each attribute exists as a column in the table. In this sense, the fixed schema model is similar to the traditional relational database table.

### Advantages
* Smaller database size; indexes can be assigned to specific attributes
* Sync process may be faster because whole objects are inserted at once

### Disadvantages
* Schema changes require data migration
* Database performance may be slow without careful index specificity

## Ruby and JavaScript Access

---------->>> UNDER CONSTRUCTIONS <<<-------------

RhoMobile applications provide definition and access to create, read, update and delete (CRUD) operations on the data models in both Ruby and JavaScript apps. 

Differences in capabilties exist between the two languages. 

Please consult the API reference and guides for further information:


* JavaScript [ORM API](../api/Orm) and [ORM Model API](../api/OrmModel) 
* [JavaScript Rhom Guide](rhom_js) 
* [Ruby Rhom API](../api/rhom-api) 
* [Ruby Rhom Guide](rhom_ruby) 


## Database Encryption

**NOTE: As of Rhodes version 3.3.3, [Rhom data encryption](../../2.2.0/rhodes/rhom#database-encryption) is removed from Rhodes. This feature is only supported in Zebra RhoMobile Suite. If you wish to use this feature, you will need to upgrade to RhoMobile Suite purchase a [RhoElements license](licensing) is required.**

If your application requires that the local database is encrypted on the filesystem, you can enable it by setting a flag in `build.yml`:

    :::yaml
    encrypt_database: 1

**NOTE: Database encryption is not supported for applications that use bulk sync at this time.**

### Platform Notes
* iOS: Uses AES 128 encryption algorithm from iOS SDK.
* Android: Uses AES 128 ecryption algorithm from Android SDK.
* Windows Mobile: Uses RC4 algorithm from Windows Mobile SDK.

