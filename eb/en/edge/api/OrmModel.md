#[Your-OrmModel]


## Overview
<p>RhoMobile applications provide automatic JavaScript CRUD methods for any models that you have defined to interact with the database.  You must define a model class by using the <a href="Orm#maddModel">ORM.addModel</a> method before you can use the API&rsquo;s referenced here.  See <a href="Orm">Orm</a> to learn about defining and adding a model.</p>

<p>All methods here are accessed from the model instance object that you have created. In places where you see <code>[Your-OrmModel]</code> on this page, you would use the instance object instead.</p>

<pre><code>:::js
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
</code></pre>
<h2>Enabling the API</h2>

<p>This API is part of the <code>coreapi</code> extension that is included automatically.</p>

<pre><code>:::ruby
extensions: ["coreapi"]
</code></pre>

<h2>JavaScript Usage</h2>

<p>Be sure to review the <a href="/guide/api_js">JavaScript API Usage</a> guide for important information about using this API in JavaScript.</p>

<h2>Ruby Usage</h2>

<p>For Ruby access to the RHOM database please see the <a href="/api/rhom-api">Rhom Ruby API guide</a>.</p>



##Methods



### canModify()
Returns true if the Rhodes model object is not currently being synced (if it is being synced, you should disable editing of the object). Before displaying an edit page for an object, your application can check if the object is currently being accessed by the sync process. If it is, you should disable editing of the object. can_modify could return true, for example, on a new local record that was created and sent to the RhoConnect application, but no response has been received yet.

### create()
Create a new Rhodes model object and save it to the database. This is the fastest way to insert a single item into the database.

### deleteAll()
Delete all Rhodes model objects for a source.For JavaScript you cannot specify conditions.

### destroy()
Destroy a Rhodes model object and removes the record from the database.

### find()
Find model objects.

### get()
Get the value of a property of the current model.Ex: myModel.get('name'); See also the vars() method.

### has()
Returns true or false if the model has the propertyName given.

### make()
Create a new Rhodes model object JavaScript reference but does not save it to the database. To save this reference to the database, you will need to execute the .save() method. See the ORM new example.

### object()
Returns the unique ID for the data record. Use this to identify records. You can also use this in a .find() method for retrieving a specific record.

### save()
Saves the current Rhodes model object to the database.

### set()
Sets the value of a property of the current model. Ex: myModel.set('name','new name'); This does not save to the database until you execute a myModel.save().

### updateAttributes()
Updates the current Rho model object attributes and saves it to the database. This is the fastest way to add or update model attributes.

### vars()
Returns an object containing all propertyName and values for the model. You can use myModel.vars().name instead of myModel.get('name').