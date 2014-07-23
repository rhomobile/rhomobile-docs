# EmberJS Tutorial

In this step of the tutorial we will add a delete record view and defining a controller to hook in the actions to delete the record.

To reset your workspace to where the last step left off, in your `rhotut-emberjs` directory, type the following command:

    git checkout -f step-3


To jump ahead and complete this section, in your `rhotut-emberjs` directory, type the following command:

    git checkout -f step-4

## Adding a delete view
Like in the other pages, we will be adding a new view for prompting the user before deleting. Add the following template to the `index.html` page: 

`public/index.html`
    :::js
    <script type="text/x-handlebars" data-template-name="productdelete">
      <div class="container">
        <h2>
        Are you sure you want to delete {{brand}} - {{name}}?</h2>
        <div >
          <button id="delete" class="btn  btn-success" {{action "delete" on="click"}} type="button">Yes</button>
          {{#link-to 'products'}}<button id="cancel" class="btn btn-default ">No</button>{{/link-to}}
        </div>
      </div>
    </script>

Notice that again we will be binding this template to a model and will display some of the models attributes like `{{brand}}` and `{{name}}`. We also hook the `Cancel` button back to the `products` link. And like the Edit and New template we have an action button, but this time will be calling the `delete` action, which we will explain shortly.

## Add a route for Delete
We then update our `App.Router` to include this new reference. Notice that this time, for the sake of the tutorial, we show a different way to specify the url scheme. For delete, the url will be something like `#/1234/delete`.

`public/js/app.js`
    :::js
    App.Router.map(function() {
      // put your routes here
      this.resource('products', {path: '/'}, function(){
        this.resource('productnew');
        this.resource('productedit', { path: ':product_id' });
        this.resource('productdelete', { path: '/:product_id/delete' });
      });
    });

## Using the edit route
We can now go back to our Products list template and add a button in the list to link to this `productdelete` route:

`public/index.html - products/index template`
    :::js
    ...
    <li class="list-group-item">
      {{#link-to 'productdelete' this}}<span id="reportdelete" class="button btn-sm btn-danger pull-right" >
      <i class="icon icon-trash"></i></span>{{/link-to}}
      {{#link-to 'productedit' this}}
        <span class="badge pull-left">{{qty}}</span>
        {{name}} - {{brand}}
      {{/link-to}}
    </li>
    ...

Notice that the `{{link-to}}` helper function references `productdelete` and also includes another parameter called `this`. The `this` will be replaced by the current model record's id from the data store.

If we look in the Web Inspector we will see that the `href` is now pointing to `#/3/delete` for our third item in the list. The `3` corresponds to the id that our data store has for this record. Recall that this is coming from the `App.Product.FIXTURES` object right now.

![](https://s3.amazonaws.com/rhodocs-images/rhotut-emberjs/Screen+Shot+2013-11-18+at+4.53.23+PM.jpg)

And clicking in the delete button will navigate to the delete template we just created.

![](https://s3.amazonaws.com/rhodocs-images/rhotut-emberjs/Screen+Shot+2013-11-18+at+4.52.35+PM.jpg)

## Adding a controller
Like with the New and Edit pages, we have to add a controller for the Delete page so we can perform the delete action. Open up the `public/js/controllers/product.js` and paste the following code:

`public/js/controllers/product.js`
    :::js
    App.ProductdeleteController = Ember.ObjectController.extend({
      actions: {
        delete: function () {
          var product = this.get('model');
          product.deleteRecord();
          product.save();
          this.transitionTo('products');
        }
      }
    });

Keeping with the Ember naming conventions this controller will be for the `productdelete` view and will therefore be called `ProductdeleteController`. 

The `delete` action uses the `deleteRecord()` and `.save()` methods to remove the record reference from the Ember Data store.

![](https://s3.amazonaws.com/rhodocs-images/rhotut-emberjs/Screen+Shot+2013-11-18+at+5.00.48+PM.jpg)

You have now successfully created a Ember JS CRUD app for a data model. In the next step of the tutorial, we will add some actions to the products list to update the quantity without even changing the view.