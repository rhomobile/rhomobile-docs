# EmberJS Tutorial

In this step of the tutorial we will re-use the partial view we created before and add defining a controller to hook in the actions to update the record.

To reset your workspace to where the last step left off, in your `rhotut-emberjs` directory, type the following command:

    git checkout -f step-2


To jump ahead and complete this section, in your `rhotut-emberjs` directory, type the following command:

    git checkout -f step-3

## Re-Using the Create Record view 'partial'
In the previous step in the tutorial, we created a New product page that used the partial view called: `_productForm`. So creating a new page to handle product updates will be very easy. We simply create a new template called `productedit` and reference the partial using: `{{partial "productForm"}}` 

`public/index.html`
    :::js
    <script type="text/x-handlebars" id="productedit">
      <div class="container">
        <h2>Edit {{name}}</h2>
        {{partial "productForm"}}
      </div>
    </script>

Notice that we also have `Edit {{name}}` - this will show the name of the current product that we are editing. It will do this automatically, because we will be binding this form to the same product model

## Add a route for Edit
We then will add a route for this view so it can be used later. Notice in this case we define the url to contain a variable called `:product_id`. This defines that the url scheme to edit a product will look something like `#productedit/1234` where `1234` will the id of the record.


`public/js/app.js`
    :::js
    App.Router.map(function() {
      // put your routes here
      this.resource('products', {path: '/'}, function(){
        this.resource('productnew');
        this.resource('productedit', { path: ':product_id' });
      });
    });

## Using the edit route
We can now go back to our Products list template and wrap the product item in the list with a link to this view:

`public/index.html`
    :::js
    <script type="text/x-handlebars" data-template-name="products/index">
      <div class="container">
        <h2>Products</h2>
          {{#link-to 'productnew'}}<span class="btn btn-primary" ><i class="icon-plus-sign  icon-white" ></i>  New</span>{{/link-to}}
        
        <ul class="list-group">
          {{#each model}}

            <li class="list-group-item">
              {{#link-to 'productedit' this}}
              <span class="badge pull-left">{{qty}}</span>
              {{name}} - {{brand}}
              {{/link-to}}  
            </li>
          
          {{/each}}
        </ul>
      </div>
    </script>

Notice that the `{{link-to}}` helper function references `productedit` and also includes another parameter called `this`. The `this` will be replaced by the current model record's id from the data store.

![](https://s3.amazonaws.com/rhodocs-images/rhotut-emberjs/Screen+Shot+2013-11-18+at+4.16.58+PM.jpg)

If we look in the Web Inspector we will see that the `href` is now pointing to `#/1` for our first item in the list. The `1` corresponds to the id that our data store has for this record. Recall that this is coming from the `App.Product.FIXTURES` object right now.

## Binding the route to the model
Before we attempt to run this, we still have to bind the route to the model, so that the view will have a reference to a particular record. 

Add the following to:
`public/js/routes/product.js`
    :::js
    App.ProductsEditRoute = Ember.Route.extend({
      model: function(params) {
        return this.store.findBy('id',params.product_id);
        
      }
    });

Remember that the url will be appended with a parameter called `product_id` as we defined in the `App.Router` above. So when the ProductsEditRoute is called, it will retrieve the `params.product_id` and then use the `this.store.findBy()` method to get a reference to that record. This record will now be bound through the `model` object to the form.

## Adding a controller
Like with the New page, we have to add a controller for the Edit page so we can perform actions like updating the record. Open up the `public/js/controllers/product.js` and paste the following code:

`public/js/controllers/product.js`
    :::js
    App.ProducteditController = Ember.ObjectController.extend({
      actions: {
        save: function () {
          var isavailable = $('#isavailable').is(':checked');

          this.set('isavailable',isavailable);
          this.get('model').save();
          this.transitionTo('products');
        }
      }
    });

Keeping with the Ember naming conventions this controller will be for the `productedit` view and will therefore be called `ProducteditController`. 

### actions
Recall that this view is using the same partial that the ProductnewController is, therefore we have to define a `save` action to account for the user clicking on the `save button`:

`public/index.html - _productForm template` 
    :::js
    <button id="save" class="btn  btn-success" {{action "save" on="click"}} type="button">Save</button>

Since the view has a checkbox control we have to read the current value from the page using jQuery and then set the attribute using `this.set()` method. Otherwise we would just have to execute `this.get.('model').save()` method. 

You should now be able to update the models' data. Notice that when you change the name of the product, it automatically changes the `Edit {{name}}` section on the form.

![](https://s3.amazonaws.com/rhodocs-images/rhotut-emberjs/Screen+Shot+2013-11-18+at+4.37.40+PM.jpg)

In the next step of the tutorial, we will add delete capabilities.