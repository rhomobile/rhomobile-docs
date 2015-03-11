# Using Rhom in JavaScript with Angular.js
In past versions of RhoMobile, applications were developed with a combination of HTML and JavaScript for the view plus Ruby for the controllers. That approach is still supported but in RhoMobile 5.0 all the features of the platform can be accessed using JavaScript. Anything you can do in Ruby, can be done in JavaScript and it is now possible to build applications without writing any Ruby code at all. In this guide we will see an example of building an application in 100% JavaScript

## Why Angular.js
If you are familiar with jQuery, you already know that while it provides a very helpful set of functions to manipulate the DOM, following large chains of callbacks and DOM operations becomes a maintenance problem very quickly, not to mention that you still have to write a lot of code to keep your models and views in sync with each other.

[Angular.js](http://angularjs.org) has emerged as a favorite framework for developing data-intensive applications, thanks to its emphasis on declarative programming and data binding. With Angular.js, you can turn your HTML code into a two-way data binding template just by adding a few attributes and a small snippet of code. Then, without any other effort on your part, Angular.js will keep your views updated whenever you make changes to your model


## Getting started with Angular.js
You can get started with Angular.js with very little code. Suppose you have a list of products you want to display, with each product having `name` and `brand` properties.

HTML:

    :::html
    <html data-ng-app="myApp"> <!-- declare which application handles this tag -->
        <head>
        <!-- include angular.js script here -->
        </head>
        <body>
            <div ng-controller="MyCtrl"> <!-- everything inside this tag is managed by MyCtrl -->
                    <div>Products</div>
                    <!-- iterate over the products array -->
                    <ul data-ng-repeat="product in products">
                        <!-- show product information -->
                        <li>Name: {{product.name}}, Brand: {{product.brand}}</li>
                    </ul>
            </div>
        </body>
    </html>


JavaScript:

    :::javascript
    var myApp = angular.module('myApp',[]); // initialize Angular

    myApp.controller("MyCtrl", function($scope) { // declare a controller with the same name we used previously in our HTML
        $scope.products = [{  // populate the "products" array
            name: "product1",
            brand: "brand1"
        },{
            name: "product2",
            brand: "brand2"
        }];
    });

These snippets will, as you would expect, result in the list of products being displayed on the page. In order to know more about how and why they worked, we need to know about some Angular.js concepts such as "application", "scope", "directives" and "services".

## Directives
A directive is a link between HTML and JavaScript: it is the way you connect a particular HTML tag with some dynamic behavior, either from the built-in Angular library or from your own code.

    :::html
    <!-- ngRepeat is a directive -->
    <ul data-ng-repeat="product in products">
    ...
    </ul>

### Brief notes on directive naming and invocation
* Directives are defined in JavaScript code and they use camelCase for their names
* When adding a directive to an HTML tag, you convert the camelCase name to snake_case and optionally (but highly recommended) prefix it with `data-` to make it valid HTML5

Examples:

    :::html
    <ul data-ng-repeat="product in products"> <!-- directive ngRepeat -->
    <span data-ng-bind="product.name"> <!-- directive ngBind -->

## Scopes
At a high level, a scope contains your model and lets your controllers and views interact with it. When you change a value in the scope, the change is propagated to any other part of the application. Let's expand on our previous example and add a way for the user to minimally interact with the application.

    :::javascript
    myApp.controller("MyCtrl", function($scope) {
        $scope.products = [{
            name: "product1",
            brand: "brand1"
        },{
            name: "product2",
            brand: "brand2"
        }];

        <!-- add a function to the scope -->

        $scope.switchProducts = function() {
            this.products=[{
            name: "product3",
            brand: "brand3"
        },{
            name: "product4",
            brand: "brand4"
        }];
        };
    });

In the HTML code, we will add a simple button:
    :::html
    <div ng-controller="MyCtrl">
        <div>Products</div>
        <ul data-ng-repeat="product in products">
            <li>Name: {{product.name}}, Brand: {{product.brand}}</li>
        </ul>
        <!-- when this button is clicked, the switchProducts function will be called in the scope -->
        <button data-ng-click="switchProducts()">Update products</button>
    </div>

What we have done here is:

* Add a new function to the scope. When this function is called, the "products" member of the scope will be substituted with a different array
* Add an HTML button with an `ngClick` directive. `ngClick` binds the `onclick` event to an expression, which will often be just a function call. The expression is evaluated in the context of the scope, that is, within the expression, `this` refers to the scope, hence why the `switchProducts` function sets `this.products`.

Note that when we built the first version of the example, we did not write any code to read values from the scope and put them into the HTML, the `{{ }}` syntax took care of that automatically. Note also that we have not written any code to update the HTML after we make changes to the scope either. If you run the example, however, it will do just what you expect: when you click the button, the HTML changes automatically and shows product3 and product4.

> Note: Scopes are the central concept everything revolves around in Angular.js: the scope becomes the ultimate truth holder for your application; whatever data is inside the scope is what the rest of the application sees. Keep this in mind when designing your services and controllers.

## Services and Dependency Injection
### Dependency Injection in a nutshell
**NOTE: See the [Wikipedia entry for Dependency Injection](en.wikipedia.org/wiki/Dependency_injection) for a more thorough explanation.**

In order to create `MyCtrl` in the example, we called `myApp.controller` with two parameters, a name and a function:

    :::javascript
    myApp.controller("MyCtrl", function($scope) {
        ...
    });

The function has a parameter called `$scope`, through which it receives the scope for the controller. When Angular.js calls this function, it sees that there is a parameter with the name `$scope`, recognizes that name and passes the appropriate value. This style of declaring your dependencies and having them fulfilled automatically is called "Dependency Injection", because you do not connect your dependencies manually, they are "injected" into your code automatically.

### Services
In Angular.js, a "Service" is a [singleton](http://en.wikipedia.org/wiki/Singleton_pattern) that can be injected as a dependency. In your own applications, you will often find it useful to define your own services (there is an example below in the section called [Integrating Rhom into Angular.js](#integrating-rhom-into-angularjs)).

Services allow you to augment the dependency injector, adding your own objects to it. There are several ways to define a service, we will see the "factory" pattern here: create and return the object that will be injected:

    :::javascript
    // create a new service with the name "GreetingService"
    myApp.factory("GreetingService", function() {

        var greetings=["Hello","Welcome"];

        // build the service
        var service = {};

        service.randomGreeting = function() {
            var random_index = Math.round(Math.random()); // 0 or 1
            return greetings[random_index];
        };

        // whatever we return from the function is what will be injected afterwards
        // when some other code requests a "GreetingService" via dependency injection
        return service;
    });

Now that a service called `GreetingService` exists, it can be injected like any other. You can test that it works by updating `MyCtrl`:

    :::javascript
    myApp.controller("MyCtrl", function($scope, GreetingService) { // add GreetingService to the list of parameters
        $scope.products = ...;

        $scope.updateProducts = ...;

        // add a new function to test that service injection worked:
        $scope.testService = function() {
            alert(GreetingService.randomGreeting());
        };
    });

Add a new button to the HTML:

    :::html
    ...
    <button ng-click="updateProducts()">Update products</button>
    <!-- new button -->
    <button ng-click="testService()">Test service</button>

When you click the new button, `testService` will be invoked in the scope and `GreetingService` will be called to provide a random greeting.

## Applications
Angular.js was designed so that it could be added to an existing page and control only part of the DOM without interferring with the rest of the page. It is actually possible to have several Angular applications on the same page, completely independent from one another. However, because mobile devices have to work with limited screen real estate compared to traditional desktop computers, it is common for mobile apps to be composed of a single Angular app. The ability to have more than one is still there, if you want to use it. The `ngApp` directive controls which part of the DOM belongs to which application and in single-app pages, it is common to have it in the `html` tag.

## Views and Routing
Any non-trivial application will consist of more than one view; in order to work with multiple views, Angular.js provides a `RouteProvider` that maps urls to views and controllers.

Mapping urls to views and controllers is straightforward:

    :::javascript
    // create application and declare a dependency on ngRoute (required)
    var productApp = angular.module("ProductApp", ['ngRoute']);

    // application configuration function, request routeProvider via dependency injection
    productApp.config(function($routeProvider) {

        // when the url equals "/app"...
        $routeProvider.when("/app", {

            // ... load index.html ...
            templateUrl: "/public/partials/index.html",

            // ... and use HomeCtrl as the controller
            controller: "HomeCtrl"
        })

        // if the url starts with /edit/, and contains a second path element, extract an "id" parameter from it and make
        // it available to our code later...
        .when("/edit/:id", {

            // ... load edit.html ...
            templateUrl: "/public/partials/edit.html",

            // and use EditCtrl as the controller
            controller: "EditCtrl",
        })
        // if the path is /edit but it does not contain any more information, treat it as creating a new product. The same view
        // and controller will take care of that
        .when("/edit", {
            templateUrl: "/public/partials/edit.html",
            controller: "EditCtrl",
        })
        .otherwise({
            redirectTo: "/app",
        });
    });

When the application starts, the router will check the current url and process the rules. If none of them match, it will fallback to the "otherwise" section, if present. Once the router has determined which view to, it will process the template and try to find a tag with an `ngView` directive:

    :::html
    <!-- designate this tag as the placeholder for views -->
    <div data-ng-view>
    </div>



## Integrating Rhom into Angular.js
While Angular.js provides a lot of directives and services, out of the box, with just the information above you can already start to build data-driven applications and you will soon want to integrate Rhom for easy database access. In the rest of this guide, we will show how to build a CRUD application for a sample model called `Product` with `name` and `brand` properties. The application will consist of two screens:

* Home screen
  - list of all known products
  - button to create new product
  - buttons to edit and delete existing products

* Edit screen
  - product edit form
  - save button

> Note: The code for this application is available [here](https://github.com/javiermolina1234/rhomobile-angular-sample).

The first thing we need in our code in order to use Rhom is a [Rhom model](local_database):

    :::javascript
    var rhoProductModel = Rho.ORM.addModel(function(model) {
            model.modelName("Product");
            // Uncomment for RhoConnect integration
            // model.enable("sync");
            model.property("name", "string");
            model.property("brand", "string");
            model.set("partition", "app");
    });

To use Angular.js, we need to instantiate our application. Because we will use Angular.js routes to handle navigation between views, our application will declare a dependency on `ngRoutes`. Also included in the excerpt below is the controller for the Home view, `HomeCtrl`:

    :::javascript
    var productApp = angular.module("ProductApp", ['ngRoute']);

    productApp.controller("HomeCtrl",
        // request the ProductHelper via dependency injection
        function HomeCtrl($scope, $location, ProductHelper) {

            $scope.products = ProductHelper.products;

            $scope.create = function() {
                // navigate to edit page without passing an id
                // the Edit controller will interpret that as a request to create a new product
                $location.url("/edit");
            }

            $scope.create_with_data = function() {
                ProductHelper.create({name: "New product"});
            }

            $scope.del = function(product_id) {
                ProductHelper.del(product_id);
            }

            $scope.sync = function() {
                // RhoConnect integration
                Rho.RhoConnectClient.doSync();
            }
        }
    );

The HTML code for the Home view is as follows:

    :::html
    <a data-role="button" data-ng-click="create()">New product</a>
    <a data-role="button" data-ng-click="create_with_data()">New product with data</a>
    <!-- uncomment for RhoConnect integration
    <button data-ng-click="sync">Sync</button>
    -->
    <table class="products">
      <thead>
        <tr>
          <th>Name</th>
          <th>Brand</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
          <tr data-ng-repeat="product in products">
            <td class="name">{{ product.name }}</td>
            <td class="brand">{{ product.brand }}</td>
            <td class="actions">
              <a data-role="button" data-ng-href="#/edit/{{product.object}}">Edit</a>
              <a data-role="button" data-ng-click="del(product.object)">Delete</a>
            </td>
          </tr>
      </tbody>
    </table>

`HomeCtrl` is very easy to follow: if has a few methods to deal with objects and the only thing it does is delegate those calls to `ProductHelper`, which is where we will place our database integration code. The HTML code is also quite simple: the are some buttons with `ngClick` directives binding them to the appropriate functions in the scope, as well as a table with an `ngRepeat` that loops over a property called `products` in the scope and contains two more buttons to edit and delete products by their primary key.

`ProductHelper` is a service that follows the [Facade pattern](http://en.wikipedia.org/wiki/Facade_pattern) and wraps Rhom with an interface specific to our use case:

* a `products` array, that contains all the products we are interested in showing (in our case, every product stored in the database). We will add this `products` property to our scope so that the `ngRepeat` in the table can find it
* CRUD methods
* a `find_by_id` method to load a particular product from the database
* a helper method `to_hash` to extract properties from Rhom model objects and put them into simple JavaScript hashes that Angular knows how to handle

The code for `ProductHelper` is below:

    :::javascript
    productApp.factory("ProductHelper", function() {
        var ormModel = Rho.ORM.getModel("Product");
        return {
            products: [],
            load_products: function() {
                // we do not want to reassign the array, because we are binding it in the
                // Home controller's scope and that would break the binding. Instead, we
                // just empty it before loading products from the database
                this.products.splice(0,this.products.length);

                var rhoProducts = ormModel.find("all");
                for (var i = 0; i < rhoProducts.length; i++) {
                    var rhoProduct = rhoProducts[i];
                    this.products.push(this.to_hash(rhoProduct));
                }
            },
            create: function(params) {
                var rhoProduct = ormModel.create(params);
                var hash = this.to_hash(rhoProduct);
                this.products.push(hash);
                return hash;
            },
            del: function(product_id) {
                var rhoProduct = this.find_by_id(product_id);
                if (rhoProduct) {
                    // remove the product from the database
                    rhoProduct.destroy();
                }

                // remove the product from the products array
                // this is faster than discarding and re-reading the whole collection
                for (var i=0; i<this.products.length; i++) {
                    var product = this.products[i];

                    if (product.object == product_id) {
                        this.products.splice(i,1);
                        break;
                    }
                }
            },
            update: function(rhoProduct, hash) {
                    rhoProduct.updateAttributes(hash);

                    for (var i=0; i<this.products.length; i++) {
                        var product = this.products[i];
                        if (product.object==hash.object) {
                            this.products[i] = hash;
                            break;
                        }
                    }
            },
            find_by_id: function(product_id) {
                return ormModel.find("first", {conditions: {"object": product_id}});
            },
            to_hash: function(rhoProduct) {
                return {
                    object: rhoProduct.object(),
                    name: rhoProduct.get("name"),
                    brand: rhoProduct.get("brand")
                }
            }
        };
    });

By creating a service in this way we gain a very desirable property for our application: all database access in centralized in a single place and the `products` array becomes the canonical data source for every view. As long all database access calls are made via `ProductHelper`, it will take care of updating the `products` array and every view in the application will be automatically in sync. As a performance optimization, the `del` and `update` functions change the array in place in order to avoid reloading the whole database from memory each time; the application would also work (albeit more slowly) if we just called `load_products` after every change.

That completes our `Home` screen, the list of products. The `Edit` screen is handled by the following view:

    :::html
    <div data-role="header">
      <h1><span data-ng-show="product.object">Edit</span> <span data-ng-hide="product.object">New</span> product</h1>
    </div>
    <div data-role="content" >
              <form class="edit-product-form">

                <label>Name<input type="text" name="name" data-ng-model="product.name"></label>
                <label>Brand<input type="text" name="brand" data-ng-model="product.brand"></label>

                <a data-role="button" class="save" data-ng-click="save()">Save</a>
              </form>
    </div>

* `ngShow` displays its contents only when its expression resolves to a truthy value
* `ngHide` does the opposite, it will show the element only if its expression is falsy
* `ngModel` tells `<input>` tags which value they must bind to in the scope

`EditCtrl` is the controller for that view:

    :::javascript
    productApp.controller("EditCtrl",
        function EditCtrl($scope,$routeParams,$location,ProductHelper) {
            // We will see how to bind route parameters in a moment, for now just assume that
            // $routeParams.id will contain the primary key of the product to edit, or be empty
            // if we are creating a new product

            var product_id = $routeParams.id;

            if (product_id) {
                var rhoProduct = ProductHelper.find_by_id(product_id);
                // this "product" member of the scope is what the <input> tags
                // in the view are binding to
                $scope.product = ProductHelper.to_hash(rhoProduct);
                $scope.rhoProduct = rhoProduct;
            } else {
                $scope.product = {};
            }

            $scope.save = function() {

                if (this.rhoProduct) {
                    // "this.product" is $scope.product and will have been updated with
                    // whatever the user has entered in the <input> tags
                    ProductHelper.update(this.rhoProduct,this.product);
                } else {
                    ProductHelper.create(this.product);
                }
                // redirect to the home screen
                $location.url("/app");
            }
        }
    );

There is nothing particularly surprising in `EditCtrl`, just pure controller logic: move values to and from the database as required.

All that is missing now is:

* loading the products from the database on application start
* wiring all the views together to respond to changes in the url

In order to schedule a task to be performed when the application starts, call `run` on your application passing it a function:

    :::javascript
    productApp.run(function(ProductHelper) {
        ProductHelper.load_products();
    });

To set up routing, inject $routeProvider in your application`s `config` function:

    :::javascript
    productApp.config(function($routeProvider) {
            $routeProvider.when("/app", {
                templateUrl: "/public/partials/index.html",
                controller: "HomeCtrl",
            })
            .when("/edit/:id", {
                templateUrl: "/public/partials/edit.html",
                controller: "EditCtrl",
            })
            .when("/edit", {
                templateUrl: "/public/partials/edit.html",
                controller: "EditCtrl",
            })
            .otherwise({
                redirectTo: "/app",
            });
    });

Finally, to prevent jQuery Mobile from conflicting with Angular's routing and view handling, the following code can be used:

    :::javascript
    $(document).bind("mobileinit", function () {
        $.mobile.ajaxEnabled = false;
        $.mobile.linkBindingEnabled = false;
        $.mobile.hashListeningEnabled = false;
        $.mobile.pushStateEnabled = false;
    });

Angular.js takes care of two-way data binding throughout the whole application, freeing you from having to write tedious plumbing code for copying values to and from HTML elements.

## Conclusions and highlights
* During this exercise, not a single line of code was written to touch the DOM; this approach is core to the Angular.js philosophy that controllers should never perform DOM operations.
* CRUD operations are performed through a central `ProductHelper` service that handles all database calls via Rhom and maintains a model of products from which the application feeds its views

## Related reading
There is much more to Angular.js than what we have covered in this guide. Refer to the [Angular.js tutorial](http://docs.angularjs.org/tutorial) and the [developer guide](http://docs.angularjs.org/guide/) for more in-depth treatment

* [ORM API documentation](../api/Orm)
* [ORMModel API documentation](../api/OrmModel)