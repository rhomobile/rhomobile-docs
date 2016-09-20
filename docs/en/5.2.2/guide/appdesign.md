#Application Architecture

RhoMobile comes with built in mechanisms to create a streamlined application architecture that uses a MVC approach to cleanly seperate your data, business logic and user interface code. Using the RhoMobile's App and Model Generators allows you to get coding quickly by providing templates and prebuilt code. of course, you can choose to implement your own application architecture or use a JavaScript based framework like Backbone.JS


##What is MVC
The Model View Controller pattern separates data definitions (models) from business logic (controllers) from interfaces (views). MVC based apps are far more maintainable and understandable. All modern web development languages now use MVC as their dominant approach (Java/Struts, ASP.NET MVC, Python/Django, Ruby/Rails, PHP/Zend). 

By convention, files for each Model include a controller, a model class and view templates described below.

## Model
To store data locally RhoMobile uses Sqlite on iPhone, Android, and Windows Mobile.On Blackberry version up to 5.0 Rhodes uses Hsql. On version 5.0 and higher it is possible to use Sqlite or Hsql. To access and manipulate stored data you may use RhoMobile's [ORM](../api/Orm) or [OrmModel](../api/OrmModel) APIs. ORM stands for object relational mapper and it provides a high level way to make the local database easier to program to.  

By convention, your model class is located in the model's folder. For the model "UserBase" the file would be called "user_base.rb"

Example of added upper_name method to the model:

	:::ruby
	class UserBase
		include Rhom::PropertyBag
	  	#add model specific code here
	  	def upper_name
	    	self.name.upcase
	  	end
	end

See more details about Data Models [here](local_database).

## Views (Templates)
Each controller action usually associated with a View template. The .erb files mentioned above are the templates used for views. Rhodes follows the Rails convention for template naming.

* index.erb - lists the data model objects
* edit.erb - lets you edit the object
* show.erb - shows the object's attribute values
* new.erb - creates a new object

These files are all created by the [rhodes generator](creating_a_project#creating-a-project-with-rhostudio). Inside the template, any valid HTML, JavaScript, and Ruby can be used, with Ruby code enclosed in <% and %> tags. See more information about Ruby ERB [here](http://www.ruby-doc.org/stdlib/libdoc/erb/rdoc/).

## Controller
Each generated model controller has several actions to perform basic CRUD (create, read, update and delete) on the object. These actions are:

* index - lists all objects
* new - displays the editing form for creating a new object
* create - actually creates the object
* edit - edits an existing object
* update - updates properties of the object
* show - views the object
* delete - deletes the object

Developer's may also create any number of controller actions by simply defining new methods in the controller class. Each action associated with a url and can be performed by calling that url from the View in the WebView control. WebView control is a Web Browser imbedded in the application UI.  

For example, if you have an Account Model your controller actions will be in account_controller.rb file. To defined an action called 'list' you would create a method 'list' in the account_controller.rb file:
	:::ruby
	def list
		#implement required business logic here
		#...
		#return result to the browser
		render :action => :list
	end  

To access this method from a view, you would specify the url to be 'Account/list' url. 



