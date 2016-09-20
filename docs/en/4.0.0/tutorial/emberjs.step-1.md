# EmberJS Tutorial

In this step of the tutorial we will add a model called `product` and create a view that will display the list of products.

To reset your workspace to where the last step left off, in your `rhotut-emberjs` directory, type the following command:

    git checkout -f step-0


To jump ahead and complete this section, in your `rhotut-emberjs` directory, type the following command:

    git checkout -f step-1

## Creating a model
To keep our code nice and clean, let's put all of our models in the folder `js/models/`. We will explain how models are tied to the view in the next section, but lets define the attributes the model will have:

Create the file called `product.js` and put it in the `js/models/` folder:

    :::js
    App.Product = DS.Model.extend({
      name: DS.attr('string'),
      brand: DS.attr('string'),
      qty: DS.attr('number'),
      isavailable: DS.attr('boolean')
    });

## Creating a view
As we saw in the previous example, our user interface will be driven by views that we define using the `script type="text/x-handlebars"` code blocks. We will create many different views in our `index.html` page that our application will display under different circumstances. 

Let's first create a new view under the previous Hello world example:

    :::html
    <script type="text/x-handlebars" data-template-name="products/index">
    <div class="container">
      <h2>Products</h2>
      <ul class="list-group">
        {{#each model}}

          <li class="list-group-item">
            <span class="badge pull-left">{{qty}}</span>
            {{name}} - {{brand}}
            
          </li>
        
        {{/each}}
      </ul>
    </div>
    </script>

This view assumes that it will be backed by an array of models, that we will define an explain later. It uses the Handlebars `{{each}}` script block to iterate through each instance. Inside the `{{each}}` block, the model will have attributes: `name`, `brand` and `qty`, that will be displayed inside each `<li>` tag.

Now if we refresh our browser we will see that nothing happens. There is still some work that needs to be done which leads us to the next concept; Routes

## Creating a route
Ember.js considers the URL as the center of your application and will parse it to figure out which part of the application should be activated. A side effect of that is that you must tell Ember.js which URLs your application will react to; there are two concepts that the Router in Ember.js knows about: routes and resources.
 
A route is just what you would expect: you tell the router that the application knows about a particular URL and Ember.js takes care of the rest. Creating a top-level route is straightforward:

    :::js
    App.Router.map(function() {  
      this.route("welcome");  
    }); 

This creates a route named "welcome" that will load a template with the same name and be handled by App.WelcomeRoute and App.WelcomeController whenever you visit /welcome. If you do not define WelcomeRoute or WelcomeController in your code, Ember.js will generate them for you automatically, so you can create routes with simple views very easily.
 
The other construct is what Ember.js calls a "resource", which is nothing more than a route that can have sub-routes. Let's say we want to have a "/products" route that shows a list of products and we also want to edit the details of a particular product at "/products/1234".  We will add the code for the edit later, so let's just start by defining the resource for the `products` route by adding the following code in the `app.js file: 

    :::js
    App.Router.map(function() {
      this.resource('products', {path: '/'}, function(){
      
      });
    });

Based on [Ember naming conventions](http://emberjs.com/guides/concepts/naming-conventions/) navigating to the default url for the app will look for a template that is has an id of 'products': which we created a view for above `<script type="text/x-handlebars" data-template-name="products/index">`

Refreshing the browser you may expect the view to be displayed, but you will find again nothing happened. Why? Well We need to tell Ember where the view is to be displayed. Remember that Ember is giving you the means for Single Page Application architecture where you can have many components of the application updating at the same time. In our simple example let's replace the main Hello World view with the code below:

    :::js
    <script type="text/x-handlebars" >
    <H1>RhoTut Ember JS Example</H1>
    {{outlet}}
    </script>

You will notice that we removed the `input` and the `<p>` section and added the `{{outlet}}`. This is where the views will be rendered. Refreshing the browser will now display the `products` view that we defined above.

Well you only see the `Products` text being displayed because there is no data. Let's add some test data so we can see how this view will look.

![](https://s3.amazonaws.com/rhodocs-images/rhotut-emberjs/Screen+Shot+2013-11-18+at+2.41.10+PM.jpg)

## Adding Data Fixtures

Let's go back to the `js/models/product.js` file and add the following:
    :::js
    App.Product.FIXTURES = [
     {
      id: 1,
      name: '328i',
      brand: 'BMW',
      qty: 5,
      isavailable: true
     },
     {
      id: 2,
      name: '528i',
      brand: 'BMW',
      qty: 3,
      isavailable: true
     },
     {
      id: 3,
      name: '728i',
      brand: 'BMW',
      qty: 0,
      isavailable: false
     },
    ];

## Associating model to route
In Ember, every route has an associated model. This model is set by implementing a route's model hook. Let's keep our code tidy and create a `js/routes` folder and then create a file for our Product routes called `product.js`

    :::js
    App.ProductsIndexRoute = Ember.Route.extend({
      model: function () {
        return App.Product.FIXTURES
      }
    }); 

If we refresh the page at this point nothing will have changed since we haven't loaded the newly created files into our index.html file. Let's ad the necessary code to load these into our `/public/js/index.html`.

    :::html
    <script src="js/models/product.js"></script>
    <script src="js/routes/product.js"></script>

Ember's naming conventions come into play again here. Recall that we defined our view as `data-template-name="products/index"`. To ember this is really `product.index` and it will automatically look for a corresponding `ProductsIndexRoute` and `ProductIndexController` definitions and use them if they are there. Notice that camel casing and appending of `Route` and `Controller`. This is a double edge sword in that if you mistype you application won't work, but can be very useful once you get the hang of it since it saves you from writing a lot of code.

![](https://s3.amazonaws.com/rhodocs-images/rhotut-emberjs/Screen+Shot+2013-11-18+at+2.44.10+PM.jpg)

Refreshing the browser should now show the fixture data in the list and we can see the template repeat for each instance of the model.

![](https://s3.amazonaws.com/rhodocs-images/rhotut-emberjs/Screen+Shot+2013-11-18+at+2.49.26+PM.jpg)

In the next step, we will add the ability to create new records.
