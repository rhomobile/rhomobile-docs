# Data Handling with Rhom and ORM

The RhoMobile Suite provides several APIs for handling device data. Released with RhoMobile Suite 5.3 is the [ORM common API](../api/NewORM), which supports JavaScript and Ruby. RMS 5.2 and earlier versions support the original [Rhom API](../api/rhom-api) for Ruby apps and the [ORM API](../api/Orm), which adds JavaScript support to Rhom via the [OPAL library](http://opalrb.org). 

**RMS 5.3 and higher**:

* [ORM Common API](../api/NewORM) (JavaScript and Ruby)
* [ORM Model Common API](../api/NewORMModel) (JavaScript and Ruby)

**RMS 5.2 and lower**:

* [ORM API](../api/Orm) and [ORM Model API](../api/OrmModel) (JavaScript)
* [Rhom API](../api/rhom-api) (Ruby)

**Documentation**:

* [ORM Common API Guide](newORM_js) (JavaScript)
* [ORM Common API Guide](newORM_ruby) (Ruby)
* [JavaScript 'Rhom' Guide](rhom_js)
* [Ruby Rhom Guide](rhom_ruby)

NOTE: The ORM common API exposes more methods to JavaScript than the ORM API, and is therefore recommended for building new JavaScript apps. Ruby developers can use Rhom or the ORM common API. 

## What is ORM?
In general computing, [ORM](https://en.wikipedia.org/wiki/Object-relational_mapping) refers to the object-relational mapping technique that permits records of a relational database to be stored and retrieved programatically as objects. For RhoMobile, the ORM API provides a powerful high-level interface to an on-device SQLite database that can work alone or with the [RhoConnectClient](../api/RhoConnectClient) to enable two-way synchronization between your application and a RhoConnect server.

One of the main benefits of using an ORM is the simplicity it brings to database operations. Instead of having to write complex SQL statements by hand, an app can perform database actions by getting and setting properties on model objects. For example: 

Update a record with a SQL command:

    :::sql
    update product set price=119,brand='Symbol' where object='12345'

Update the same record with ORM:

    :::javascript
    product.updateAttibutes({price: 119, brand: "Symbol"});

Delete a record with SQL:

    :::sql
    delete from product where object='12345'

Delete an object with ORM:

    :::javascript
    product.destroy();

## What's a model?
In general, RhoMobile applications follow the [Model-View-Controller](http://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller) (MVC) pattern. In RhoMobile, a model can store information from two sources: 

* Data created or collected on the device
* Data retrieved from a RhoConnect synchronization server

Each model contains attributes (aka 'fields') that store information relating to that model. For example, a `Product` model might have the attributes of `name`, `brand` and `price`. Applications will normally have a model for each entity that they handle (i.e. `Customer`, `Product`, `Invoice`, `InvoiceLine`, `Order`, `LineItem`, etc).

RhoMobile apps can use two kinds of models: 

* Property Bag
* Fixed Schema

Each model type has advantages and disadvantages depending on the application.

## Property Bag Model

In the property bag model, data is stored as key-value pairs in a single table using the object-attribute-value or [entity-attribute-value model](http://en.wikipedia.org/wiki/Entity-attribute-value_model). This model is sometimes referred to as 'open schema' because the fields (or keys) do not have to be defined in advance; the API stores and syncs all key-value pairs that are entered.

### Advantages
* Simple, doesn’t require advance attribute design 
* Attributes can be added or removed without modifying the database schema
* Requires no data migration following a schema change 

### Disadvantages
* Since all attributes are indexed, the database can be much larger than with fixed schema 
* Sync process can be slower because database insertions are performed at the attribute level

## Fixed Schema Model

In a fixed schema model, each model has a separate database table and attributes forms the columns of that table. In this sense, the fixed schema model is similar to a traditional relational database.

### Advantages
* Smaller database size; indexes can be assigned to specific attributes
* Sync process may be faster because whole objects are inserted at once

### Disadvantages
* Schema changes require data migration
* Database performance may be slow without careful index specificity

## How to Include the ORM API

By default, RhoMobile apps will be built to use the older Rhom implementation (for Ruby) and ORM implementation (for JavaScript). To activate the newer ORM Common API (which supports both JavaScript _and_ Ruby), add the following line to application’s `rhoconfig.txt` file:

    :::yaml
    use_new_orm = 1  

Possible Values: 

* **0 = use 'old' Rhom/ORM API (default)**
* 1 = use newer ORM Common API

NOTE: If this parameter is left unspecified, the older Rhom/ORM API will be used. 

## Database Encryption

If your application requires local (on-device) database encryption, enable it by setting a flag in `build.yml`:

    :::yaml
    encrypt_database: 1

**NOTE: Database encryption is not currently supported for applications that use bulk sync.**

### Platform Notes
* iOS uses an AES 128 encryption algorithm from the iOS SDK.
* Android uses an AES 128 ecryption algorithm from the Android SDK.
* Windows Mobile uses an RC4 algorithm from Windows Mobile SDK.


**NOTE: [Rhom data encryption](../../2.2.0/rhodes/rhom#database-encryption) is no longer available as of Rhodes 3.3.3 and higher.**
