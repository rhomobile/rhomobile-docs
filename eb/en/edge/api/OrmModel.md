#[Your-OrmModel]


## Overview
RhoMobile applications provide automatic JavaScript CRUD methods for any models that you have defined to interact with the database.  You must define a model class by using the [ORM.addModel](Orm#maddModel) method before you can use the API's referenced here.  See [Orm](Orm) to learn about defining and adding a model.

All methods here are accessed from the model instance object that you have created. In places where you see `[Your-OrmModel]` on this page, you would use the instance object instead.

    :::js
    var productModel = Rho.ORM.addModel(function(model){
      model.modelName("Product");
      model.enable("sync");
      model.property("name","string");
      model.property("brand","string");
      model.property("price","float");
      model.set("partition","user");
    });

    // create model object and save it to database
    var product = productModel.create({
      brand: 'Apple',
      name: 'iPhone5',
      price: 199.99});

    // read product from database
    var product = productModel.find('first');
    product.get('brand'); // Apple
    product.get('name'); // iPhone5

         
## Enabling the API
This API is part of the `coreapi` extension that is included automatically.
    :::ruby
    extensions: ["coreapi"]

## JavaScript Usage
Be sure to review the [JavaScript API Usage](/guide/api_js) guide for important information about using this API in JavaScript.

## Ruby Usage
For Ruby access to the RHOM database please see the [Rhom Ruby API guide](/api/rhom-api).
        


##Methods



### canModify()
Returns true if the Rhodes model object is not currently being synced (if it is being synced, you should disable editing of the object). Before displaying an edit page for an object, your application can check if the object is currently being accessed by the sync process. If it is, you should disable editing of the object. can_modify could return true, for example, on a new local record that was created and sent to the RhoConnect application, but no response has been received yet.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>BOOLEAN</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.canModify()</code></li></ul></li></ul>

### create(<span class="text-info">HASH</span> attributes)
Create a new Rhodes model object and save it to the database. This is the fastest way to insert a single item into the database.

####Parameters
<ul><li>attributes : <span class='text-info'>HASH</span><p>
List of attributes assigned to the new model object, such as {name : "ABC Inc.",address: "555 5th St."}. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>OBJECT</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>OBJECT</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.create(<span class="text-info">HASH</span> attributes)</code></li></ul></li></ul>

### deleteAll()
Delete all Rhodes model objects for a source.For JavaScript you cannot specify conditions.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.deleteAll()</code></li></ul></li></ul>

### destroy()
Destroy a Rhodes model object and removes the record from the database.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.destroy()</code></li></ul></li></ul>

### find(<span class="text-info">STRING</span> queryType, <span class="text-info">HASH</span> queryOptions)
Find model objects.

####Parameters
<ul><li>queryType : <span class='text-info'>STRING</span><p> </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>all</dt><dd>
returns all objects; can use optional :conditions.</dd><dt>first</dt><dd>
returns first object matching :conditions.</dd><dt>count</dt><dd>
returns the number of objects matching these :conditions.</dd></dl></li><li>queryOptions : <span class='text-info'>HASH</span><p>
An object of selection options </p></li><ul><li>conditions : <span class='text-info'>HASH</span><p>
A name:value object that you want to find. Ex: conditions { name:'Motorola'}. </p></li><ul><li>propertyName : <span class='text-info'></span><p> </p></li><li>propertyValue : <span class='text-info'></span><p> </p></li></ul><li>order : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>
Attribute(s) to order the list. This cannot be used when using a select parameter and you must pass a conditions hash. </p></li><li>orderdir : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>
Order direction. This cannot be used when using a select parameter and you must pass a conditions hash </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>ASC</dt><dd>
Ascending order. (Default)</dd><dt>DESC</dt><dd>
Descending Order</dd></dl></li><li>select : <span class='text-info'>ARRAY</span> <span class='label label-info'>Optional</span><p>
Array of string attributes to return with the object. Useful if your model has many attributes and your query only needs a few of them. This cannot be used in combination with order or orderdir. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>ARRAY</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.find(<span class="text-info">STRING</span> queryType, <span class="text-info">HASH</span> queryOptions)</code></li></ul></li></ul>

### get(<span class="text-info">STRING</span> propertyName)
Get the value of a property of the current model.Ex: myModel.get('name'); See also the vars() method.

####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p>
The name of the property you are trying to retrieve.  </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>STRING : 
Value of the specified property from the database.</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.get(<span class="text-info">STRING</span> propertyName)</code></li></ul></li></ul>

### has(<span class="text-info">STRING</span> propertyName)
Returns true or false if the model has the propertyName given.

####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p>
The name of the property you are checking for validity. See also the vars() method. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>BOOLEAN</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.has(<span class="text-info">STRING</span> propertyName)</code></li></ul></li></ul>

### make(<span class="text-info">HASH</span> attributes)
Create a new Rhodes model object JavaScript reference but does not save it to the database. To save this reference to the database, you will need to execute the .save() method. See the ORM new example.

####Parameters
<ul><li>attributes : <span class='text-info'>HASH</span><p>
List of attributes assigned to the new model object, such as {name:"ABC Inc.",address:"5555th St."}. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>OBJECT</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>OBJECT</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.make(<span class="text-info">HASH</span> attributes)</code></li></ul></li></ul>

### object()
Returns the unique ID for the data record. Use this to identify records. You can also use this in a .find() method for retrieving a specific record.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>STRING</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.object()</code></li></ul></li></ul>

### save()
Saves the current Rhodes model object to the database.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.save()</code></li></ul></li></ul>

### set(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)
Sets the value of a property of the current model. Ex: myModel.set('name','new name'); This does not save to the database until you execute a myModel.save().

####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p>
The name of the property you are trying to set. </p></li><li>propertyValue : <span class='text-info'>STRING</span><p>
The value you are setting in the current model. After setting values you must issue a .save() in order for the data to be saved to the database. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.set(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code></li></ul></li></ul>

### updateAttributes(<span class="text-info">HASH</span> attributes)
Updates the current Rho model object attributes and saves it to the database. This is the fastest way to add or update model attributes.

####Parameters
<ul><li>attributes : <span class='text-info'>HASH</span><p>
List of attributes and their updated values, such as {name : "ABC Inc.",address: "555 5th St."}. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.updateAttributes(<span class="text-info">HASH</span> attributes)</code></li></ul></li></ul>

### vars()
Returns an object containing all propertyName and values for the model. You can use myModel.vars().name instead of myModel.get('name').

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>HASH</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.vars()</code></li></ul></li></ul>