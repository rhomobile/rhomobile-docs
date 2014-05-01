# EmberJS Tutorial

In this step of the tutorial we will bring this application into RhoMobile and create a Rhom Adapter that can be used for any Ember-Rhom application.

To reset your workspace to where the last step left off, in your `rhotut-emberjs` directory, type the following command:

    git checkout -f step-5


To jump ahead and complete this section, in your `rhotut-emberjs` directory, type the following command:

    git checkout -f step-6

## Creating the RhoMobile App
Open up RhoStudio and create a new RhoMobile Application

1. File / New Project
2. Select `RhoMobile Application`
3. Enter a name for the project and click `Finish`
4. After the project is built - replace the contents of the `Public` folder with the contents of the `Public` folder we have been using so far.

![](https://s3.amazonaws.com/rhodocs-images/rhotut-emberjs/Screen+Shot+2013-11-19+at+10.12.36+AM.jpg)

## Running the Ember App in RhoMobile
Now, change the `start_path` setting in the `rhoconfig.txt` file so that it will use `/public/index.html' Ember application we have been creating.

![](https://s3.amazonaws.com/rhodocs-images/rhotut-emberjs/Screen+Shot+2013-11-19+at+10.19.33+AM.jpg)

Create a `Run Configuration` for this project.

1. Run / Run Configurations
2. Click New Launch Configuration / RhoMobile Application
3. Select your project in the `Project Name` field
4. Select `RhoSimulator` for the `Simulator Type` field
5. Click `Run`

![](https://s3.amazonaws.com/rhodocs-images/rhotut-emberjs/Screen+Shot+2013-11-19+at+10.22.45+AM.jpg)

You will now see the Ember application running inside of the RhoSimulator

![](https://s3.amazonaws.com/rhodocs-images/rhotut-emberjs/Screen+Shot+2013-11-19+at+10.25.32+AM.jpg)

## Defining the Rhom Model
In order to use the Rhom Adapter that we will build, we first must define the model using the RhoMobile ORM JavaScript APIs:

`public/js/models/product.js` 
    :::js
    Rho.ORM.addModel(function(model){
      model.modelName("Product");
    });

The key here is to use the same exact name as we did when we defined the model in Ember: `App.Product`. You will notice that in the Rhom definition we did not define any fields. This is because we are using a `PropertyBag` definition (aka: Schema-less). This will allow us to add any attribute we want later by simply changing the model definition in Ember:

    :::js
    App.Product = DS.Model.extend({
      name: DS.attr('string'),
      brand: DS.attr('string'),
      qty: DS.attr('number'),
      isavailable: DS.attr('boolean'),
      myNewField: DS.attr('string')
    });

## Rhom Adapter
Create a new folder called `adapters` and copy the following code into a file called `rhom.js`. This will be the Ember Adapter for keeping the Ember data persistent using Rhomobile's Rhom.

`public/js/adapters/rhom.js`
    :::js
    DS.RhomAdapter = DS.Adapter.extend(Ember.Evented, {

      extractVars: function(rhomRecord) {
        data = rhomRecord.vars();
        //need to convert bool since Rhom stores as string
        // ember bind-attr works only with bools
        for (var key in data) {
          if(data[key] == 'true'){
                  data[key] = true;
          }
          if(data[key] == 'false'){
                  data[key] = false;
          }
        }
        return data;
      },

      objectToId: function(record) {
        record["id"] = record.object;
        return Ember.copy(record);
      },

      find: function(store, type, id) {
        var record = Rho.ORM.getModel(this.model).find(
          'first',
          {
            conditions: {object: id}
          }
        );
        var result = record.vars();
        result["id"] = result.object;
        return Ember.RSVP.resolve(result);
      },

      findAll: function(store, type) {
        var records = Rho.ORM.getModel(this.model).find('all');
        var results = records.map(this.extractVars);
        var results = results.map(this.objectToId);
        var promise = new Ember.RSVP.Promise(function(resolve, reject){
          // succeed
          resolve(results);
          // or reject
          reject([]);
        });
        return promise;
      },

      createRecord: function(store, type, record) {
        var json = record.toJSON();
        thisRecord = Rho.ORM.getModel(this.model).create(record.toJSON());
        json.id = thisRecord.get('object'); 
        return Ember.RSVP.resolve(json);
      },

      updateRecord: function(store, type, record) {
        var result = Rho.ORM.getModel(this.model).find('first', {conditions: {object: record.get('id')}});
        result.updateAttributes(record.toJSON());
        return Ember.RSVP.resolve();
      },

      deleteRecord: function(store, type, record) {
        var result = Rho.ORM.getModel(this.model).find('first', {conditions: {object: record.get('id')}});
        result.destroy();
        return Ember.RSVP.resolve();
      }
    });

Before we forget let's also update our `index.html` to include this new file in the list of JavaScript references. Be sure to place the adapter before the reference to the  `models/product.js` file:

`public/index.html`
    :::js
    <script src="js/app.js"></script>
    <script src="js/adapters/rhom.js"></script>
    <script src="js/models/product.js"></script>
    <script src="js/routes/product.js"></script> 

[Ember DS.Adapter](http://emberjs.com/api/data/classes/DS.Adapter.html) is a base class that we will override. These adapters require the minimum methods:

* find()
* createRecord()
* updateRecord()
* deleteRecord()

We will also include a method to find all records (for our product index page) as well as two helper functions that the RhomAdapter will use.

* findAll()
* extractVars()
* objectToId()

### find()
The `find()` method will be called when Ember attempts to retrieve a reference to a record of the model. The id of the record will be passed to this method.

    :::js
    find: function(store, type, id) {

We will use this `id` to look up the record in Rhom, using [RhoMobile ORM JavaScript APIs](../../api/Orm). The model name will be available in this method through the `this.model` variable and we will use the `.getModel()` Rhom method to get a reference to that model. The model needs to be defined in Rhom using the same name as we defined our Ember model in order for this to work (as we did in this beginning of this page). Since Rhom uses the `object` property as its unique id for the model, we will look up the record by checking for `object` = `id`.

    :::js
    var record = Rho.ORM.getModel(this.model).find(
      'first',
      {
        conditions: {object: id}
      }
    );
Once a record is found we have to return an object that matches how it was defined in Ember, ex:

    :::js
    {
      id: 1,
      name: '328i',
      brand: 'BMW',
      qty: 5,
      isavailable: true
    }

We accomplish this by calling the `.vars()` Rhom method that converts it to an object and then add the property `id` to this object, since that is what Ember expects:

    :::js
    var result = record.vars();
    result["id"] = result.object;
    return Ember.RSVP.resolve(result);

### createRecord()
The `createRecord()` method in the adapter needs to create a record in Rhom and then return the `id` of the record that was created. This is accomplished using the `.create()` Rhom method and passing in the object as a JSON object. We then set the `id` field of the Rhom unique id field `object` and return the `json` object.

    :::js
    createRecord: function(store, type, record) {
      var json = record.toJSON();
      thisRecord = Rho.ORM.getModel(this.model).create(record.toJSON());
      json.id = thisRecord.get('object'); 
      return Ember.RSVP.resolve(json);
    },

### updateRecord()
The `updateRecord()` method in the adapter looks very similar to the `createRecord()` method. Instead of creating a record we will first find the record and then use the `updateAttributes()` Rhom method for updating the attributes of the object by just passing in the full object (all fields will be updated).

    :::js
    updateRecord: function(store, type, record) {
      var result = Rho.ORM.getModel(this.model).find('first', {conditions: {object: record.get('id')}});
      result.updateAttributes(record.toJSON());
      return Ember.RSVP.resolve();
    },

### deleteRecord()
The `deleteRecord()` method in the adapter will find a reference to the record and then using the `.destroy()` Rhom method to remove the record from the Rhom database.

    :::js
    deleteRecord: function(store, type, record) {
      var result = Rho.ORM.getModel(this.model).find('first', {conditions: {object: record.get('id')}});
      result.destroy();
      return Ember.RSVP.resolve();
    }

### findAll()
The `findAll()` method will need to return an array of objects that will look similar to our fixture array we used in the beginning of this tutorial. It relies on some slight massaging of the record set, using some helper functions we will explain next, before returning the results.

    :::js
    findAll: function(store, type) {
      var records = Rho.ORM.getModel(this.model).find('all');
      var results = records.map(this.extractVars);
      var results = results.map(this.objectToId);
      var promise = new Ember.RSVP.Promise(function(resolve, reject){
        // succeed
        resolve(results);
        // or reject
        reject([]);
      });
      return promise;
    },

### extractVars()
The `extractVars()` method in the adapter will convert the Rhom record into a structure JavaScript object like we did in the `createRecord()` method. Since Rhom stores everything as strings we need to perform converting of boolean types to a true boolean JavaScript type. Otherwise Ember's data binding will not work correctly.

    :::js
    extractVars: function(rhomRecord) {
            data = rhomRecord.vars();
            //need to convert bool since Rhom stores as string
            // ember bind-attr works only with bools
            for (var key in data) {
                    if(data[key] == 'true'){
                            data[key] = true;
                    }
                    if(data[key] == 'false'){
                            data[key] = false;
                    }
                }
        return data;
    },

### objectToId()
The `objectToId()` method simply always ensures that the Rhom `object` field is being used as the `id` field that Ember Data will be using.

    :::js
    objectToId: function(record) {
        record["id"] = record.object;
        return Ember.copy(record);
    },

## Enabling the Rhom Adapter
Now that we have the adapter built and the Rhom model defined, we just need to change our Adapter definition for our `Product` model:

`public/js/models/product.js` 
    :::js
    //App.ApplicationAdapter = DS.FixtureAdapter.extend();
    
    App.ProductAdapter = DS.RhomAdapter.extend({
      model: "Product"
    });

You can see that again, Ember naming conventions kick in: `App.ProductAdapter` is automatically recognized as the Adapter for the model `Product`. This is how we would be able to use the same adapter for multiple models in our project, if we had them.

## Enabling RhoMobile JavaScript API's
In order to use the Rhom JS APIs that we used in our adapter, we need to add reference to the RhoMobile JS file: `rhoapi-modules.js` that gets built when we build the application. This file will automatically be created and placed in the `/public/api` folder. It needs to be included before the `jquery` library:

`public/index.html`
    :::js
    <script src="/public/api/rhoapi-modules.js"type="text/javascript" charset="utf-8" ></script>
    <script src="js/libs/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="js/libs/bootstrap.min.js"></script>
    <script src="js/libs/handlebars-1.0.0.js"></script>
    <script src="js/libs/ember-1.0.0.js"></script>
    <script src="js/libs/ember-data.js"></script>
    <script src="js/app.js"></script>


**NOTE: If you are going to be using the JS ORM API, you'll also need to include this line in any files that will be using it: `<script type="text/javascript" charset="utf-8" src="/public/api/rhoapi-modules-ORM.js"></script>`**

## Persistent Data
Now we should have all of the pieces we need to keep our data persistent using Rhom as the storage mechanism though the Ember `RhomDataAdapter`. If you relaunch the application, you will first see that there are no products in the list:


Well, this is normal. Recall that we are now using Rhom as the storage, so the initial loading of the app will not have any record in the database. Create some new records and then relaunch the app and you will see that updates to data will be maintained.

![](https://s3.amazonaws.com/rhodocs-images/rhotut-emberjs/Screen+Shot+2013-11-19+at+10.43.08+AM.jpg)

And if we look at the RhoSimulatr Web Inspector and inspect an element in the product list page. We can see that the URL scheme is still working and is using the Rhom Object id numbers in the URL, ex:

    :::js
    <a id='ember459' class='ember-view' href='#/154089773960001.03/delete'>....

![](https://s3.amazonaws.com/rhodocs-images/rhotut-emberjs/Screen+Shot+2013-11-19+at+10.47.24+AM.jpg)