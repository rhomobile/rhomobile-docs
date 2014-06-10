# EmberJS Tutorial

In this step of the tutorial we will add a new view for creating records and as well as defining a controller to hook in the actions from the form.

To reset your workspace to where the last step left off, in your `rhotut-emberjs` directory, type the following command:

    git checkout -f step-1


To jump ahead and complete this section, in your `rhotut-emberjs` directory, type the following command:

    git checkout -f step-2

## Defining a 'partial'
Our application will allow for creating of new products as well as editing existing ones. Since we would like to share the same form and not have to create duplicate templates to maintain, we have decided to create what is called a partial. This is denoted by using the underscore prefixing the name : `_productForm`

`public/index.html`
    :::js
    <script type="text/x-handlebars" data-template-name="_productForm">
      <form role="form">
        <div class="form-group">
        <label >Name</label>

        {{input type="text" id="new-name" placeholder="Product Name" value=name }}
        </div>
        <div class="form-group">
        <label >Brand</label>
        {{input type="text" id="new-brand" placeholder="Brand Name" value=brand }}
        </div>
        <div class="form-group">
        <label >Qty</label>

        {{input type="text" id="new-qty" placeholder="Qty" value=qty }}
        </div>
        <div class="form-group">
          <label> Available</label>
          <input type="checkbox" id="isavailable" {{bind-attr checked=isavailable}}>
        </div>
        <div >
        <button id="save" class="btn  btn-success" {{action "save" on="click"}} type="button">Save</button>
        {{#link-to 'products'}}<button id="cancel" class="btn btn-default ">Cancel</button>{{/link-to}}

      </div>
      </form>

    </script>

And then our `productnew` template will reference the `productForm` partial we just defined:

    :::js
    <script type="text/x-handlebars" id="productnew">
    <div class="container">
      <h2>New Product</h2>

      {{partial "productForm"}}
    </div>

    </script>

When this view is used it will replace the `{{partial "productForm"}}` section with the contents of the productForm template. We will show how the Edit view will use this in the next step of the tutorial

## Add route for New
We then will add a route for the view so that browsing to `productnew` will show this page


`public/js/app.js`
    :::js
    App.Router.map(function() {
      // put your routes here
      this.resource('products', {path: '/'}, function(){
        this.resource('productnew');
      });
    });

## Helper functions
We can now go back to our Products  list template and add a button that will load this view

`public/index.html`
    :::js
    <script type="text/x-handlebars" data-template-name="products/index">
    <div class="container">
      <h2>Products</h2>
       {{#link-to 'productnew'}}<span class="btn btn-primary" ><i class="icon-plus-sign  icon-white" ></i>  New</span>{{/link-to}}

Notice that we are using the `{{link-to}}` helper function that is provided by Ember and Handlebars. This will automatically be replaced by the correct url path that is defined by the `App.router` resource/route that has the same name of `productnew`

![](https://s3.amazonaws.com/rhodocs-images/rhotut-emberjs/Screen+Shot+2013-11-18+at+3.22.52+PM.jpg)

We used this same helper function to wire the `Cancel` button on this view to navigate back to the `products.index` view
    :::js
     {{#link-to 'products'}}<button id="cancel" class="btn btn-default ">Cancel</button>{{/link-to}}

If you try to click on the `Save` button you will see an error in the JavaScript console:
    :::js
    Uncaught Error: Nothing handled the event 'save'. 

This is because we need to create a controller for this view to handle actions when on the view.

## Adding a controller
Keeping with the code and folder tidiness, let's create a folder called `public/js/controllers` where we will put all of our controller files in. And now create a file called `product.js` and paste the following code:

`public/js/controllers/product.js`
    :::js
    App.ProductnewController = Ember.ObjectController.extend({
       content: Ember.Object.create(),
      actions: {
        save: function () {
          var name = this.get('name');
          if (!name.trim()) { return; }

          var brand = this.get('brand');

          var qty = this.get('qty');
          if (!qty.trim()) { qty=0; }

          var isavailable = $('#isavailable').is(':checked');

          var product = this.store.createRecord('product', {
            name: name,
            brand: brand,
            qty: qty,
            isavailable: isavailable

          });

          
          // Save the new model
          product.save();

          this.transitionTo('products');
        }
      }
    });

Before we forget, lets add a reference in our `index.html` file to this new file we will need in our app

`public/index.html`
    :::js
    <script src="js/controllers/product.js"></script>

Keeping with the Ember naming conventions this controller will be for the `productnew` view and will likewise be called `ProductnewController`. It is of type `Ember.ObjectController` because it will be bound to our product model. Inside this method we pass in an object that defines it's behavior.

### actions
The actions section of the parameter defines what actions will be available to this controller. This will allow us to easily tie a button to some JS that needs to run. In this controller, we have a Save button that needs to save the model we just created in the form. From the form we reference the `save` action like:

`public/index.html - _productForm template created above` 
    :::js
    <button id="save" class="btn  btn-success" {{action "save" on="click"}} type="button">Save</button>

Clicking this button will cause the `save` action code to be triggered where we get the data from the form and then create a new record using `this.store.createRecord` which has the first parameter representing the model name: `product`, followed by a JavaScript object that contains the attribute name and corresponding value pairs. Once the object is created, we call the `.save()` method to save the new record.

## Saving Records
At this point when we are saying saving, deleting, etc it is in the Ember SPA sense - where it is saved for the current session. We have not tied any persistance to these models so it neither saves it in Rhom or on a backend. If you refresh the web page you will not see any new or updated data. 

We will get into this concept in great detail later in the tutorial. This will involve the concept of `Adapters`. Adapters are built to store the model data somewhere through an interface you define called an `Adapter`. Later in the tutorial we will create one for saving the records to the Rhom database. Ember also comes with a RESTAdapter that allows you to save the data on a backend using REST APIs. For this step in the tutorial we will be using the `FixtureAdapter` that is also built in. It will allow us to `save` to the Fixture object we created earlier.

Let's start by changing the `public/js/models/product.js` file and add the following line:
  
    :::js
    App.ApplicationAdapter = DS.FixtureAdapter.extend();

This tells our application that we want the models to use this adapter when modifying a record.

Then in the `public/js/routes/product.js` file instead of returning App.Product.Fixtures, we actually want to utilize the store method and get the list of products from the Ember Data Store. This will allow us to change the `Adapter` later to something else and not have to change this code.

`public/js/routes/product.js`
    :::js
    App.ProductsIndexRoute = Ember.Route.extend({
      model: function () {
        return this.store.find('product');
      }

    });

Now when we create new records they will be added to our Fixture array and be displayed in the list. 

![](https://s3.amazonaws.com/rhodocs-images/rhotut-emberjs/Screen+Shot+2013-11-18+at+3.55.23+PM.jpg)

NOTE: Here is where the Ember inspector comes in handy. From the screen-shot above you can see that I can actually see the data that the view is using to display the records.

In the next step of the tutorial we will show how to Edit records.