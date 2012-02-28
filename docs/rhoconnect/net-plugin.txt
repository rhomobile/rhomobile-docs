rhoconnect.NET
===

The RhoConnect-Java library is designed for the [RhoConnect](http://rhomobile.com/products/rhoconnect/) Application Integration Server.

The .NET 4 framework library is designed for the [Rhoconnect](http://rhomobile.com/products/rhoconnect) Application Integration Server.

Using the rhoconnect.NET plugin, your [ASP.NET MVC](http://www.asp.net/mvc/mvc4) application's data will transparently synchronize with a mobile application built on the [Rhodes framework](http://rhomobile.com/products/rhodes), or any of the available [Rhoconnect clients](http://rhomobile.com/products/rhoconnect/).

<img src='https://s3.amazonaws.com/rhodocs/rhoconnect-service/rhoconnect-plugin-net.jpg' alt='image' />

## Prerequisites

* Windows OS
* .NET 4 framework
* Git
* [ASP.NET MVC4](http://www.asp.net/mvc/mvc4) framework
* Visual Studio 2010
* [`rhoconnect.NET`](https://github.com/rhomobile/rhoconnect.NET) github repository

## Getting Started

Copy the [`rhoconnect.NET`](https://github.com/rhomobile/rhoconnect.NET) github repository to your PC:

	$ git clone https://github.com/rhomobile/rhoconnect.NET.git

By default, the `rhoconnect.NET` repository contains the pre-built `RhoconnectNET.dll` library in the `bin/Release` subdirectory.
However, you can build your own library using the provided Microsoft Visual Studio .NET solution file and the source code files. 

## A Sample ASP.NET MVC4 Backend Application

You can download and use the sample [`ASP.NET MVC4`](https://github.com/rhomobile/RhoconnectNET_MVC4_App) application to repeat the steps described below. 

In addition, the sample application also contains the final code (the .NET plugin is applied to it) in its `ContactsApp_final` subdirectory. You can use this final code, but you will still need to modify the `set_app_point` with your app endpoints and add the RhoconnectNET library reference to your project.

To run this application, build it in Visual Studio, create a deployment package (using Project --> Build Deployment Package), then deploy it on Microsoft's IIS server to run.

<img src="http://rhodocs.s3.amazonaws.com/rhoconnect-plugin/net-backend-running.png">

This sample ASP.NET MVC4 application was created using similar steps to [this tutorial to create a C# application and add support for basic database operations](http://www.asp.net/mvc/tutorials/contact-manager/iteration-1-create-the-application-cs).

## Settings for the Client App

Your client application needs to have its model match the model used in your Java Sprint 3.0 MVC backend application. For example, you can generate a Rhodes application for a Contact model to match the sample ASP.NET MVC4 backend application:

	:::term 
	$ rhodes app contact-app
	$ cd contact-app
	$ rhodes model contact lastname,firstname,email,phone

Edit the `rhoconfig.txt` configuration file to point to your RhoConnect server, where <your_rhoconnect_server_url> is the url for your RhoConnect server.

	:::term
	syncserver = 'http://<your_rhoconnect_server_url>/application'

And edit the `app/index.erb` view file to say Contacts.

	:::html
	...
	<li><a href="Contact">Contacts</a></li>
	...

And edit `app/Contact/contact.rb` file to enable sync.

	:::ruby
	...
	enable :sync
	...

## Settings for the RhoConnect Server App

You must generate a RhoConnect server application and edit its settings for the RhoConnect .NET plugin.

	:::term 
	$ rhoconnect app syncserver
	$ cd syncserver; bundle install

Edit the `settings/settings.yml` development section to add an api\_token key/value pair. This value is the same as the api\_token that you will set in the `WEB-INF/spring-servlet.xml` file for your ASP.NET MVC4 backend application.

	:::term
	:development:
	   ...
	   :api_token: rhoconnect_api_token

## Including the RhoConnect.NET Library in the Backend Application

In order to use `Rhoconnect.NET` functionality in your `ASP.NET MVC` application, first you need to include the `Rhoconnect.NET` library 
as a dependency to your application. In Visual Studio, click the `Project => Add Reference` menu item and navigate to and select the `RhoconnectNET.dll` library.

After this step is completed, you can add references to the `Rhoconnect.NET` namespace into the application's and Controller's files: in the case of the ASP.NET MVC4 sample application, the files are ContactsApp/Global.asax.cs and ContactsApp/Controllers/ContactController.cs.

	using RhoconnectNET;
	using RhoconnectNET.Controllers;

## Registering Rhoconnect.NET Routes in the Backend Application

To establish the communication channel between the ASP.NET MVC application and the Rhoconnect server, you need to implement the following `init_rhoconnect` and `rhoconnect_authenticate` methods in the ASP.NET MVC application's `Global.asax.cs` file and call them from its `Application_Start` method:

	protected void Application_Start()
	{
		... ASP.NET initialization routines ...
		... typically, registering routes and filters is done here ...
		
		// after app is properly initialized
		// call RhoconnectNET initialization
		init_rhoconnect();
	}
	
	// implement init_rhoconnect() method to establish
	// communication link between `Rhoconnect` server
	// and ASP.NET MVC application
	private void init_rhoconnect()
	{
		// this call allows parsing JSON structures into Objects
		ValueProviderFactories.Factories.Add(new JsonValueProviderFactory());
		
		// this call establishes communication between Rhoconnect and ASP.NET application
		// as a last parameter we supply authentication routine that will called 
		// by rhoconnect server to authenticate users.
		// Its parameters are the rhoconnect url, the MVC app url, 
		//    the api_token, and the authenticate method, shown here by
		//    <parameter_name> placeholders.
		RhoconnectNET.Client.set_app_endpoint("<your_rhoconnect_server_url>", 
											  "<app_endpoint_url>", 
											  "<api_token>", 
											  <Authenticating_Routine>);
	}
	
	private bool rhoconnect_authenticate(ref String username, String password, Hashtable auth_attrs)
	{
		// uncomment the following line, if you want to replace the default partitioning to 'app'
        // username = "app";
        // perform your authentication here
        return true;
	}

The `RhoconnectNET.Client.set_app_endpoint` method is a main point
in establishing the communication link between the `Rhoconnect` server and the ASP.NET MVC application. It has the following parameters that you need to set.

<table border="1">
	<tr>
		<td>String</td>
		<td><code>your_rhoconnect_server_url</code></td>
		<td>The RhoConnect server's url, for example <code>http://localhost:9292</code>.</td>
	</tr>
	<tr>
		<td>String</td>
		<td><code>app_endpoint_url</code></td>
		<td>your MVC app url, for example <code>http://my_pc_host/MyApp</code>.</td>
	</tr>
	<tr>
		<td>String</td>
		<td><code>api_token</code></td>
		<td>rhoconnect server's api_token, for example <code>rhoconnect_api_token</code>.</td>
	</tr>
	<tr>
		<td>delegate rhoAuthHandler(ref String, String, Hashtable, bool)</td>
		<td><code>Authenticating_Routine</code></td>
		<td>handle to the application's authenticating routine (if null, <code>true</code> is returned by default).</td>
	</tr>
</table>

## Implementing the Backend Application's Authenticate Method

`Rhoconnect.NET` installs a `/rhoconnect/authenticate` route into your application which will receive credentials from the client. In the ASP.NET MVC application's `Global.asax.cs` file, you can provide the `rhoconnect_authenticate` method and register it with the `Rhoconnect.NET` in the `set_app_endpoint`
method; this maps your application specific authentication to the Rhoconnect `authenticate` requests:

	private bool rhoconnect_authenticate(ref String username, String password, Hashtable auth_attrs)
	{
		// uncomment the following line, if you want to replace the default partitioning to 'app'
        // username = "app";
        // perform your authentication here
        return true;
	}
	
If you want your data to be partitioned by 'app' (i.e. the data will be shared among all users), you can replace
the provided `username` parameter (which is passed by reference) to `app` - which will instruct Rhoconnect to partition the data accordingly. 

## Establishing Communication from the RhoConnect Server to the Backend Application

The `Rhoconnect.NET` lib installs `/rhoconnect/<CRUD>` routes in your application which the Rhoconnect server instance invokes to perform CRUD operations on the data for the dataset you want to synchronize.
Each of the routes is mapped to a corresponding `rhoconnect_<operation>` method in the **IRhoconnectCRUD** interface
which you must implement in the dataset's Controller class.

In the case of the sample ASP.NET MVC application, you implement these methods in `ContactsApp/Controllers/ContactController.cs`. You could start with code like this:

		public class ContactController : Controller, IRhoconnectCRUD
		{
			... implementation of Controller routes
	
			// You must implement the next four methods
			// These methods will be called by the Rhoconnect server
			JsonResult rhoconnect_query_objects(String partition);
			ActionResult rhoconnect_create(String objJson, String partition);
			ActionResult rhoconnect_update(Dictionary<string, object> changes, String partition);
			ActionResult rhoconnect_delete(Object objId, String partition);
		}

And you will implement the rhoconnect_query_objects, rhoconnect_create, rhoconnect_update, and rhoconnect_delete methods.

### Implement rhoconnect_query_objects to Query the Datasets

The route `/rhoconnect/query` is mapped to the `rhoconnect_query_objects` method of the **IRhoconnectCRUD** interface. You must implement this method in the corresponding dataset's Controller class. It must return a collection of source objects in the form of a JsonResult.

In the case of the sample ASP.NET MVC application, you could implement this method in the `ContactsApp/Controllers/ContactController.cs` file as follows:
		
		public JsonResult rhoconnect_query_objects(String partition)
		{
			return Json(db.Contacts.ToDictionary(c => c.ID.ToString()));
		}
	
In the above example, the Contacts Db set is converted to `Dictionary<String, Object>` where the dictionary's key must correspond to an unique object's `ID` field.
After the dictionary is created, it is converted to a JsonResult and sent to the Rhoconnect server.

### Implement rhoconnect_create to Create New Objects

The route `/rhoconnect/create` is mapped to the `rhoconnect_create` method of the IRhoconnectCRUD interface that you must implement in the corresponding dataset's Controller class. It should return a newly created object's id in case of success.

In the case of the sample ASP.NET MVC application, you could implement this method in the `ContactsApp/Controllers/ContactController.cs` file as follows:

		public ActionResult rhoconnect_create(String objJson, String partition)
        {
            Contact new_contact = (Contact)RhoconnectNET.Helpers.deserialize_json(objJson, typeof(Contact));
            db.Contacts.Add(new_contact);
            db.SaveChanges();
            return RhoconnectNET.Helpers.serialize_result(new_contact.ID);
        }
	
### Implement rhoconnect_update to Update Existing Objects

In the similar fashion, the route `/rhoconnect/update` is mapped to the `rhoconnect_update` method of the IRhoconnectCRUD
interface that you must implement in the corresponding dataset's Controller class. It should return an updated object's id in case of success.

In the case of the sample ASP.NET MVC application, you could implement this method in the `ContactsApp/Controllers/ContactController.cs` file as follows:

		public ActionResult rhoconnect_update(Dictionary<string, object> changes, String partition)
        {
            int obj_id = Convert.ToInt32(changes["id"]);
            Contact contact_to_update = db.Contacts.First(c => c.ID == obj_id); 
            // this method will update only the modified fields
            RhoconnectNET.Helpers.merge_changes(contact_to_update, changes);
            db.Entry(contact_to_update).State = EntityState.Modified;
            db.SaveChanges();
            return RhoconnectNET.Helpers.serialize_result(contact_to_update.ID); 
        }

### Implement rhoconnect_delete to Delete Objects from the Dataset

The route `/rhoconnect/delete` is mapped to the `rhoconnect_delete` method of the IRhoconnectCRUD interface that you must implement in the corresponding dataset's Controller class. It should return a deleted object's id in case of success.

In the case of the sample ASP.NET MVC application, you could implement this method in the `ContactsApp/Controllers/ContactController.cs` file as follows:

        public ActionResult rhoconnect_delete(Object objId, String partition)
        {
            int key = Convert.ToInt32(objId);

            Contact contact = db.Contacts.Find(key);
            db.Contacts.Remove(contact);
            db.SaveChanges();
            return RhoconnectNET.Helpers.serialize_result(key);
        }

### Partitioning Datasets

Each of the above methods have a partition key supplied with the CRUD request.	This partition key is used by `Rhoconnect` to uniquely identify the model dataset when it is stored in a rhoconnect instance.  It is typically an attribute on the model or related model.  `Rhoconnect` supports two types of partitions:

* app - No unique key will be used, a shared dataset is synchronized for all users.
* String partition key - unique key string identifying the partition (typically, user name).

For example, the `Contact` model above might have a relationship to the User model. This provides us a simple way to organize the `Contact` dataset for rhoconnect by reusing this relationship.  
In this case, your implementation might filter out data on a per user basis.
	
For more information about Rhoconnect partitions, please refer to the [Rhoconnect docs](http://docs.rhomobile.com/rhoconnect/source-adapters#data-partitioning).

## Notifying the RhoConnect Server of Changes Made by the Backend Application

You must implement methods to notify the Rhoconnect server instance about the changes made in your MVC backend application. Typically, your MVC Controller class reacts to the actions by implementing the CRUD POST routes, for example:

		[HttpPost]
		public ActionResult Create(Contact new_contact)
		{
		     if (ModelState.IsValid)
		     {
                db.Contacts.Add(new_contact);
                db.SaveChanges();
                return RedirectToAction("Index");  
              }

            return View(new_contact);
        }

You need to insert calls in your ASP.NET MVC application which will notify the Rhoconnect server instance that the backend created, updated, or deleted an object. For this reason, the `RhoconnectNET` library provides three callback routines for CUD notifications: `notify_on_create`, `notify_on_update`, and `notify_on_delete`.

### Notifying the RhoConnect Server that the Backend Created a New Object

You need to insert a call to `notify_on_create` to notify the Rhoconnect server instance that a new object has been created.

The previous example for ActionResult Create will look like this after inserting the corresponding callback routine:

		// This method is used to access current partition
		// in Rhoconnect notification callback
        private String partition()
        {
			// If you're using 'app' partition
			// uncomment the following line
			// return "app";
            return "testuser";
        }
		
		[HttpPost]
        public ActionResult Create(Contact contact)
        {
            if (ModelState.IsValid)
            {
                db.Contacts.Add(contact);
                db.SaveChanges();

                // insert these lines to provide
                // notifications to Rhoconnect server
                RhoconnectNET.Client.notify_on_create(partition(), contact);

                return RedirectToAction("Index");  
            }

            return View(contact);
        }

In the example above, you need to call the `RhoconnectNET.Client.notify_on_create` method with the following parameters:

<table border="1">
	<tr>
		<td>String</td>
		<td><code>partition</code></td>
		<td>partition to which the object belongs (see above section "Partitioning datasets")
		In the above example, the partition string is returned from the partition() method</td>
	</tr>
	<tr>
		<td>Object</td>
		<td><code>new_object</code></td>
		<td>newly inserted object, which will be passed to Rhoconnect in a Json form</td>
	</tr>
</table>

### Overriding To Pass Information Into the notify_on_create Callback Method

The above notification callback has several overloads. In its simplest form, the
`notify_on_create` callback will obtain information about the source name from the `Contact` object
class name (since it is equal) and will get the `id` field from the object itself. If your model
stores `id` field under the custom name, then you can use the following override to pass its name into
the callback, where its value will be accessed through the Reflection mechanism:

		// insert these lines to provide
        // notifications to Rhoconnect server
        RhoconnectNET.Client.notify_on_create(partition(), "MyContactCustomID", contact);

In addition, if your model's class is not equal to the Rhoconnect's Source Adapter name, you can use the following override to pass it along:

		// insert these lines to provide
        // notifications to Rhoconnect server
        RhoconnectNET.Client.notify_on_create("MyCustomContactSourceName", partition(), "MyContactCustomID", contact);

### Notifying the RhoConnect Server that the Backend Application Edited or Deleted

In the same fashion, your dataset's Controller need to implement `Edit` and `Delete` callback notifications.

		[HttpPost]
        public ActionResult Edit(Contact contact)
        {
            if (ModelState.IsValid)
            {
                db.Entry(contact).State = EntityState.Modified;
                db.SaveChanges();

                // insert this callback to notify Rhoconnect
                // about the update operation
                RhoconnectNET.Client.notify_on_update(partition(), contact);

                return RedirectToAction("Index");
            }
            return View(contact);
        }
		
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            Contact contact = db.Contacts.Find(id);
            db.Contacts.Remove(contact);
            db.SaveChanges();

            // insert this callback to notify Rhoconnect
            // about the delete operation
            RhoconnectNET.Client.notify_on_delete("Contact", partition(), id);

            return RedirectToAction("Index");
        }

## Meta
Created and maintained by Maxim Zverev.

Released under the [MIT License](http://www.opensource.org/licenses/mit-license.php).