# EmberJS Tutorial

In this step of the tutorial we will update the quantity attribute of the record right from the list without having to change the view.

To reset your workspace to where the last step left off, in your `rhotut-emberjs` directory, type the following command:

    git checkout -f step-4


To jump ahead and complete this section, in your `rhotut-emberjs` directory, type the following command:

    git checkout -f step-5

## Adding Up/Down Buttons
Let's add two new buttons to the `<li>` tag in the products list that we will create actions for:

`public/index.html`

    :::js
    <li class="list-group-item">
      {{#link-to 'productdelete' this}}<span id="reportdelete" class="button btn-sm btn-danger pull-right" ><i class="icon icon-trash"></i></span>{{/link-to}}
      {{#link-to 'productedit' this}}
      <span class="badge pull-left">{{qty}}</span>
      {{name}} - {{brand}}
      {{/link-to}}
      <button {{action "up" this}} class="button btn-sm pull-right"><i class="icon icon-arrow-up"></i></button>
      <button {{action "down" this}} class="button btn-sm pull-right"><i class="icon icon-arrow-down"></i></button>
    </li>

We are basically pointing to a `up` and `down` action that we will need to create. Notice that this is not a `{{link-to}}` because we do not wan't to change views, but what we do want is to actually update the models qty that the data store has. We will have to wire these actions into the the `App.ProductsIndexRoute` object and pass in the reference to the model via the `this` object.

## Adding Actions
We will now add the actions to the `ProductsIndexRoute`.

`public/js/routes/product.js`
    :::js
    App.ProductsIndexRoute = Ember.Route.extend({
      model: function () {
        return this.store.find('product');
      },
      actions: {
        up: function(m) {
          m.set('qty',parseInt(m.get('qty')) + 1);
          m.save();
        },
        down: function(m) {
          m.set('qty',parseInt(m.get('qty')) - 1);
          m.save();
        }
      }
      
    });

The `up` action will contain a reference to the model via the passed in parameter `m`. We can then set the qty attribute using `m.set('qty',newQty)`, likewise for the `down` action, followed by a `m.save()` call to save the updates to the store.

If you click on the item to bring up the edit view, you should see the new value represented. Also if you have installed Ember Chrome Inspector you can also look at the data tab.

![](https://s3.amazonaws.com/rhodocs-images/rhotut-emberjs/Screen+Shot+2013-11-18+at+6.21.51+PM.jpg)


So far we have created a model, defined routes, views and controllers to deliver a basic application that performs CRUD operations on data. This data however is non-persistent and any changes made in this application will be reset when reloading the page.

In the next step in the tutorial we will be bringing this application into RhoMobile and create a Ember Adapter that will automatically handle keeping the Ember model data persistent in Rhom. This will be very useful if your user scenario requires being disconnected from your backend or if you plan on using RhoConnect for data synchronization. If you plan on keeping all of your data on your backend, then you will need to plug in some other adapter like the RestAdapter. We will not cover these topics in this tutorial as you can find these on the Internet.