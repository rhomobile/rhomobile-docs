# Using Rhom in JavaScript with Backbone.js

## Overview

In past versions of RhoMobile, applications were developed with a combination of HTML and JavaScript for the view plus Ruby for the controllers. That approach is still supported but in RhoMobile 5.0 is that all the features of the platform can be accessed using JavaScript. Anything you can do in Ruby, can be done in JavaScript and it is now possible to build applications without writing any Ruby code at all. In this guide we will see an example of building an application in 100% JavaScript

## Why Backbone.js

If you are familiar with jQuery, you already know that while it provides a very helpful set of functions to manipulate the DOM, following large chains of callbacks and DOM operations becomes a maintenance problem very quickly, not to mention that you still have to write a lot of code to keep your models and views in sync with each other.

[Backbone.js](http://backbonejs.org) is a JavaScript library that helps you structure your applications in a more maintainable way, including a set of high-level abstractions for models, views and event handling. These primitives are designed to be the basic building blocks of your application and to be extended with your own functionality.


## Getting started with Backbone.js

**NOTE: If you are already familiar with Backbone.js, skip to [Integrating Backbone.js and Rhom](#integrating-backbonejs-and-rhom)**

### First steps - creating a basic view

Backbone.js depends on two other libraries to work: [Underscore.js](http://underscorejs.org) and either [jQuery](http://jquery.com/) or [Zepto](http://zeptojs.com/). We will use jQuery in this guide.

The most basic thing you can do with Backbone.js is to create a simple view with static content. 

	:::html
	<html>
	<head>
	  <meta charset="utf-8">
	  <title>hello-backbonejs</title>
	</head>
	<body>
		<div id="content"></div> <!-- our view will be rendered in this element -->

  		<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
		<script src="http://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.5.1/underscore-min.js"></script>
		<script src="http://cdnjs.cloudflare.com/ajax/libs/backbone.js/1.0.0/backbone-min.js"></script>

		<script type="text/javascript">
			// declare a new type of view: Homeview. Note that we used a capital letter
			var HomeView = Backbone.View.extend({
				el: #content", // this view will be rendered to the element whose id is "content"
				render: function() { // here is where our view replaces the contents of its "el" element
					$(this.el).html("<h1>Hello, world!</h1>");
				}
			});

			var homeView = new HomeView();
			homeView.render();
		</script>


  	</body>
	</html>	

<a href="/rhom_backbone_tutorial/1.html" target="_blank">See the example running</a>

That is all there is to creating a basic view - extend Backbone.View and provide a render method. Obviously, you will soon want to add interactive elements to your views and respond to events. This is easily achieved by adding an `events` property to your view as a hash of the format 'event selector' : 'method'.

	:::javascript
	var HomeView = Backbone.View.extend({
		el: "content", 
		events: {
		// this hash tells which events we are interested in and where they should be delivered
		// the format is
		//  'event      selector'           :     method
			'click button.add_greeting' 	: 'add_greeting',
			'click button.remove_greetings' : 'remove_greetings'
		},
		render: function() {
			var template = ""+
				"<h1>Hello, world!</h1>"+
				"<button class='add_greeting'>Add greeting</button>"+ // add some buttons
				"<button class='remove_greetings'>Remove greetings</button>"+
				"<div class='greetings'></div>"; // empty placeholder

			$(this.el).html(template);	// write the template to our assigned element
		},
		add_greeting: function() {
			$(this.el).find(".greetings").append("<h2>Hello</h2>");
		},
		remove_greetings: function() {
			$(this.el).find(".greetings").empty();
		}
		});

<a href="/rhom_backbone_tutorial/2.html" target="_blank">See the example running</a>

Once we know how to respond to interactive events, our next step is to edit some data; Backbone.js expects that you will define a Model to represent each entity in our application, and by default, it will provide functionality to create, read, update and delete objects by talking to a RESTful backend. It is also common to group models of the same type together, to show them in lists for example; Backbone.js provides a `Collection` class for that purpose.


	:::javascript

	// define our model class
	var Greeting = Backbone.Model.extend({
		defaults: {				// optional: define default values
			greeting: "Hello",
			greete: "world",
			exclamation: false
		},
		toString: function() {
			var result = this.escape("greeting")+", "+this.escape("name");
			if (this.get("exclamation")) {
				result+='!';
			}
			return result;
		}

	});

	// define a collection class
	var GreetingList = Backbone.Collection.extend({
		model: Greeting		// this collection holds Greeting objects
	});

### Moving between views - Routing

We will create a new view to edit greetings but as soon as we have more than one view, we need a way to switch between them. In multi-page applications, that poses no problem, we place links that change the URL and the browser loads the new page when the user clicks on them. In a JavaScript application, because we are trying to avoid page reloads, switching between views requires a bit of thought from our side. Fortunately, Backbone.js provides a `Router` component that does most of the work for us. It listens to changes in the current URL's `fragment` (the part after the hash sign) and fires events we can listen to:

	:::javascript
	var Router = Backbone.Router.extend({
		routes: {
			// fragment	: 'method'
			'' 			: 'home',
			'new' 		: 'editGreeting',
			// routes can also automatically interpret parts of the URL as parameters
			'edit/:id' 	: 'editGreeting'
		},
	});

	var router = new Router();
	var homeView = new HomeView();
	var editGreetingView = new EditGreetingView();

	router.on("route:home", function() {
		// render home view
	});

	// because there are two different routes that point to this method, one with a parameter and the other without,
	// id may contain a value or not, depending on what route was triggered. We can use that to detect if we are
	// creating a new greeting or editing an existing one

	router.on("editGreeting", function(id) {
		// edit the greeting with a particular id
	});

With routing in place, it is time to create EditGreetingView so that the user can add greetings to our list, and to update HomeView to display those greetings and allow them to be edited:

	:::javascript
	var HomeView = Backbone.View.extend({
		el: "#content", 
		events: {
		//  'event      selector'           : 'method'
			'click button.remove_greetings' : 'remove_greetings'
		},
		render: function() {
			var template = ""+
				"<h1>Hello, world!</h1>"+
				"<a href='#new'>Add greeting</a>"+ // add some buttons
				"<button class='remove_greetings'>Remove greetings</button>"+
				"<div class='greetings'>"+
				"	<ul>";

				for (var i=0; i<greetingList.length; i++) {
					var greeting = greetingList.at(i);
					template+="<li><a href='#edit/"+greeting.cid+"'>"+greeting.toString()+"</a></li>";
				}

				template+=""+
				"	</ul>"+
				"</div>";

			$(this.el).html(template); // write the template to our assigned element
		},
		remove_greetings: function() {
			greetingList.reset(); // empty the collection
			this.render();
		},
		edit_greeting: function(ev) {
			var link = $(ev.currentTarget);
			console.log(link);
		}
	});

	var EditGreetingView = Backbone.View.extend({
		el: "#content",
		events: {
		//  'event    selector'		: 'method'
			'click button.save' 	: 'save',
			'click button.cancel' 	: 'cancel'
		},
		render: function(greeting) {
			var is_new = !greeting;

			if (is_new) {
				greeting = new Greeting();
			}

			this.greeting = greeting;

			var template = ""+
				"<div>"+
				"	<label>Greeting: <input type='text' name='greeting' value='"+(greeting ? greeting.escape("greeting") : "")+"'></label>"+
				"	<label>Name: <input type='text' name='name' value='"+(greeting ? greeting.escape("name") : "")+"'></label>"+
				"	<label>Exclamation: <input type='checkbox' name='exclamation' "+(greeting && greeting.get("exclamation") ? "checked" : "") +"></label>"+
				"	<input type='hidden' name='new' value='"+is_new+"'>"+
				"	<button class='save'>Save</button>"+
				"	<button class='cancel'>Cancel</button>"+
				"	<button class='delete'>Delete</button>"+
				"</div>";

			this.$el.html(template);
		},
		save: function(event) {
			console.log("save");
			console.log(event);

			var is_new = this.$el.find('input[name=new]').val(); // are we creating a new greeting or editing an existing one?

			var new_values = {};
			new_values.greeting = this.$el.find('input[name=greeting]').val();
			new_values.name = this.$el.find('input[name=name]').val();
			new_values.exclamation = this.$el.find('input[name=exclamation]').is(':checked');

			this.greeting.set(new_values);

			if (is_new) {
				greetingList.add(this.greeting);
			}
			// go back home
			router.navigate("", {trigger: true});
		},
		cancel: function() {
			// go back home
			router.navigate("", {trigger: true});
		},
		delete: function() {
			if (this.greeting) {
				greetingList.remove(this.greeting);
			}
			return false;
		}
	});

<a href="/rhom_backbone_tutorial/3.html" target="_blank">See the example running</a>

### Templates

The approach we have taken so far is promising: instead of having our data scattered across a multitude of different DOM elements, it is neatly stored in models that can be easily manipulated. However, the `render` methods in our views are using string operations to build their templates; this style becomes unmanageable very quickly as soon as your views contain anything beyond a handful of elements.

Backbone.js does not dictate the use of any templating library in particular but because it counts Underscore.js as one of its dependencies, it is common to use the `_.template` function. Underscore templates use a syntax similar to ERB: angle brackets and percent signs:
		
	:::erb
	<% JavaScript code goes here %>

You an also print values with <%= value %>
	:::erb
	Today's date in milliseconds: <%= Date.now() %>

To be safe against XSS, you will frequently use the HTML escaping syntax:

	:::erb
	<%- value %>

Here is the way our HomeView and EditGreetingView templates would look like if we converted them to Underscore.js:

	:::html
	...
	<body>
	...
		<!-- template for HomeView -->
		<script type="text/x-underscore-template" id="HomeView-template">
			<h1>Hello, world!</h1>
			<a href="#new">Add greeting</a>
			<button class="remove_greetings">Remove greetings</button>
			<div class="greetings">
				<ul>
					<% 	_.each(greetings, function(greeting) { %>  
						<li><a href="#edit/<%- greeting.cid %>"><%- greeting.toString() %></a></li>
					<% }); %>
				</ul>
			</div>
		</script>

		<script type="text/x-underscore-template" id="EditGreetingView-template">
			<div>
				<label>
					Greeting: <input type="text" name="greeting" value="<%- greeting ? greeting.get("greeting") : "" %>">
				</label>
				<label>
					Name: <input type="text" name="name" value="<%- greeting ? greeting.get("name") : "" %>">
				</label>
				<label>
					Exclamation: <input type="checkbox" name="exclamation" <%- greeting && greeting.get("exclamation") ? "checked" : "" %>></label>
				<input type="hidden" name="new" value="<%- is_new %>">
				<button class="save">Save</button>
				<button class="cancel">Cancel</button>
				<button class="delete">Delete</button>
			</div>

		</script>
	</body>

They look much more maintainable now that they are outside JavaScript code and rendering them consists of two easy steps: first, you compile the template into a function; second, that function is called with the parameters its template uses. Let's see how HomeView does it:

	:::javascript

	var HomeView = Backbone.View.extend({
		el: "#content", 
		events: {
			'click button.remove_greetings' : 'remove_greetings'
		},
		initialize: function() {
			// compile template into a function and store it for future use
			this.template = _.template($("#HomeView-template").html());
		},
		render: function() {
			// call the template to render the current list of models
			var template_contents = this.template({ greetings : greetingList.models });
			$(this.el).html(template_contents); // write the template to our assigned element
		},
		remove_greetings: function() {
			greetingList.reset(); // empty the collection
			this.render();
		},
		edit_greeting: function(ev) {
			var link = $(ev.currentTarget);
			console.log(link);
		}
	});

That is the whole code listing for HomeView, now that its template lives independently.

<a href="/rhom_backbone_tutorial/4.html" target="_blank">See the completed example running</a>

## Backbone.js in RhoMobile

You can start using Backbone.js in a RhoMobile application right away if you do not need persistent data or if you interact with a RESTful backend, for which Backbone.js provides support out of the box. If, however, you want to store data locally and potentially synchronize it with a RhoConnect server, you must use Rhom for your data storage.

**NOTE: See the guide called [Using the local database](local_database) for a full description of Rhom**

A JavaScript application wishing to use Rhom for data storage and, potentially, two-way synchronization via a RhoConnect server, must first define its models:

	:::javascript
	var rhoProductModel = Rho.ORM.addModel(function(model) {
		model.modelName("Product");
		// Uncomment for RhoConnect integration
		// model.enable("sync");
		model.property("name", "string");
		model.property("brand", "string");
		model.property("price", "float");
		model.set("partition", "app");
	});

With a reference to the [ORMModel](../api/OrmModel), either retained after creation or the model, or obtained with a call to `Rho.ORM.getModel('Product')`, you can now create instances of your models, get and set their properties or delete them from the database.

	:::javascript
	// create a product and save it to the database
	var product = rhoProductModel.create({
		name: "ET1",
		brand: "Zebra",
		price: 199.99
	});


	var name = product.get("name"); // "ET1"

	product.destroy(); // remove product from the database

We have seen that Backbone.js provides a Model class and here we have RhoMobile's models that are similar but cannot be used directly by Backbone.js. Fortunately, there is an integration library available that will help you develop faster and with less effort.

### Enter RhoTendon

A tendon is "tissue that connects bone to muscle" and RhoTendon is a small JavaScript glue library that binds Backbone.js to the power of Rhom, allowing you to develop pure-JavaScript applications in a very rapid fashion. [RhoTendon is available for download here](https://github.com/javiermolina1234/rhotendon). Once you define a Rhom model as seen above, you just need to derive your Backbone.js models from `RhoTendon.Model`, which extends Backbone.Model and links with Rhom under the hood:

	:::javascript
	<script src="/public/js/rhotendon.js"></script>

	/// define model
	var rhoProductModel = Rho.ORM.addModel(function(model) {
		model.modelName("Product");
		// Uncomment for RhoConnect integration
		// model.enable("sync");
		model.property("name", "string");
		model.property("brand", "string");
		model.property("price", "float");
		model.set("partition", "app");
	});

	var Product = RhoTendon.Model.extend({
		ormModel: "Product", // identify the Rhom model this class represents
		mirrorAttributes: ["name", "brand"] // enumerate which attributes our Backbone model will care about
	});

	var ProductList = RhoTendon.ModelCollection.extend({
		model: Product, // this collection handles Product models
	});

That is all you need to do to integrate Backbone.js models and Rhom. Internally, RhoTendon models override the Backbone.js `sync` method so that whatever operations you perform on your instances of the Product model are be reflected in the database:

	:::javascript

	// all the following is standard Backbone.js code, nothing special
	var product = new Product();

	product.set({
		name: "ET1",
		brand: "Zebra",
		price: 199.99
		});

	product.save();
	// at this point, your object has been persisted in the Rhom database

	product.destroy();
	// and now it has been deleted


There is a [sample application available for download](https://github.com/javiermolina1234/rhomobile-backbonejs-sample) built with RhoMobile, jQuery Mobile, Backbone.js and RhoTendon. It is intended to serve as a short and readable example of bringing all these technologies together and to be a starting point for your own RhoMobile applications.


## Related reading
* [Backbone.js](http://backbonejs.org)
* [Underscore.js](http://underscorejs.org)
* [Using the local database](../api/local_database)
* [ORM API documentation](../api/Orm)
* [ORMModel API documentation](../api/OrmModel)