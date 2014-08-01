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
<p>Returns true if the Rhodes model object is not currently being synced (if it is being synced, you should disable editing of the object). Before displaying an edit page for an object, your application can check if the object is currently being accessed by the sync process. If it is, you should disable editing of the object. can_modify could return true, for example, on a new local record that was created and sent to the RhoConnect application, but no response has been received yet.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:

* BOOLEAN

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.canModify()</code>

### create(<span class="text-info">HASH</span> attributes)
<p>Create a new Rhodes model object and save it to the database. This is the fastest way to insert a single item into the database.</p>


####Parameters
<ul><li>attributes : <span class='text-info'>HASH</span><p>
<p>List of attributes assigned to the new model object, such as {name : &ldquo;ABC Inc.&rdquo;,address: &ldquo;555 5th St.&rdquo;}.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>OBJECT</span></p><ul></ul>

####Returns
Synchronous Return:

* OBJECT

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.create(<span class="text-info">HASH</span> attributes)</code>

### deleteAll()
<p>Delete all Rhodes model objects for a source.For JavaScript you cannot specify conditions.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.deleteAll()</code>

### destroy()
<p>Destroy a Rhodes model object and removes the record from the database.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.destroy()</code>

### find(<span class="text-info">STRING</span> queryType, <span class="text-info">HASH</span> queryOptions)
<p>Find model objects.</p>


####Parameters
<ul><li>queryType : <span class='text-info'>STRING</span><p> </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>all</dt><dd>
<p>returns all objects; can use optional :conditions.</p>
</dd><dt>first</dt><dd>
<p>returns first object matching :conditions.</p>
</dd><dt>count</dt><dd>
<p>returns the number of objects matching these :conditions.</p>
</dd></dl></li><li>queryOptions : <span class='text-info'>HASH</span><p>
<p>An object of selection options</p>
 </p></li><ul><li>conditions : <span class='text-info'>HASH</span><p>
<p>A name:value object that you want to find. Ex: conditions { name:&lsquo;Motorola&rsquo;}.</p>
 </p></li><ul><li>propertyName : <span class='text-info'></span><p> </p></li><li>propertyValue : <span class='text-info'></span><p> </p></li></ul><li>order : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>
<p>Attribute(s) to order the list. This cannot be used when using a select parameter and you must pass a conditions hash.</p>
 </p></li><li>orderdir : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>
<p>Order direction. This cannot be used when using a select parameter and you must pass a conditions hash</p>
 </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>ASC</dt><dd>
<p>Ascending order. (Default)</p>
</dd><dt>DESC</dt><dd>
<p>Descending Order</p>
</dd></dl></li><li>select : <span class='text-info'>ARRAY</span> <span class='label label-info'>Optional</span><p>
<p>Array of string attributes to return with the object. Useful if your model has many attributes and your query only needs a few of them. This cannot be used in combination with order or orderdir.</p>
 </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul></ul>

####Returns
Synchronous Return:

* ARRAY

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.find(<span class="text-info">STRING</span> queryType, <span class="text-info">HASH</span> queryOptions)</code>

### get(<span class="text-info">STRING</span> propertyName)
<p>Get the value of a property of the current model.Ex: myModel.get(&lsquo;name&rsquo;); See also the vars() method.</p>


####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p>
<p>The name of the property you are trying to retrieve.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING : 
<p>Value of the specified property from the database.</p>


####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.get(<span class="text-info">STRING</span> propertyName)</code>

### has(<span class="text-info">STRING</span> propertyName)
<p>Returns true or false if the model has the propertyName given.</p>


####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p>
<p>The name of the property you are checking for validity. See also the vars() method.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:

* BOOLEAN

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.has(<span class="text-info">STRING</span> propertyName)</code>

### make(<span class="text-info">HASH</span> attributes)
<p>Create a new Rhodes model object JavaScript reference but does not save it to the database. To save this reference to the database, you will need to execute the .save() method. See the ORM new example.</p>


####Parameters
<ul><li>attributes : <span class='text-info'>HASH</span><p>
<p>List of attributes assigned to the new model object, such as {name:&ldquo;ABC Inc.&rdquo;,address:&ldquo;5555th St.&rdquo;}.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>OBJECT</span></p><ul></ul>

####Returns
Synchronous Return:

* OBJECT

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.make(<span class="text-info">HASH</span> attributes)</code>

### object()
<p>Returns the unique ID for the data record. Use this to identify records. You can also use this in a .find() method for retrieving a specific record.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.object()</code>

### save()
<p>Saves the current Rhodes model object to the database.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.save()</code>

### set(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)
<p>Sets the value of a property of the current model. Ex: myModel.set(&lsquo;name&rsquo;,&lsquo;new name&rsquo;); This does not save to the database until you execute a myModel.save().</p>


####Parameters
<ul><li>propertyName : <span class='text-info'>STRING</span><p>
<p>The name of the property you are trying to set.</p>
 </p></li><li>propertyValue : <span class='text-info'>STRING</span><p>
<p>The value you are setting in the current model. After setting values you must issue a .save() in order for the data to be saved to the database.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.set(<span class="text-info">STRING</span> propertyName, <span class="text-info">STRING</span> propertyValue)</code>

### updateAttributes(<span class="text-info">HASH</span> attributes)
<p>Updates the current Rho model object attributes and saves it to the database. This is the fastest way to add or update model attributes.</p>


####Parameters
<ul><li>attributes : <span class='text-info'>HASH</span><p>
<p>List of attributes and their updated values, such as {name : &ldquo;ABC Inc.&rdquo;,address: &ldquo;555 5th St.&rdquo;}.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.updateAttributes(<span class="text-info">HASH</span> attributes)</code>

### vars()
<p>Returns an object containing all propertyName and values for the model. You can use myModel.vars().name instead of myModel.get(&lsquo;name&rsquo;).</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul></ul>

####Returns
Synchronous Return:

* HASH

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.vars()</code>