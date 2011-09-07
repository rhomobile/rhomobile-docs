rhoconnect.NET
===

A .NET 4 framework library for the [Rhoconnect](http://rhomobile.com/products/rhosync) App Integration Server.

Using rhoconnect.NET, your [ASP.NET MVC3](http://www.asp.net/mvc/mvc3) application's data will transparently synchronize with a mobile application built on the [Rhodes framework](http://rhomobile.com/products/rhodes), or any of the available [Rhoconnect clients](http://rhomobile.com/products/rhosync/).

## Getting started

Copy the [`rhoconnect.NET`](https://github.com/rhomobile/rhoconnect.NET) github repository to your PC:

	$ git clone git@github.com:rhomobile/rhoconnect.NET.git

By default, the `rhoconnect.NET` repository contains the pre-built `RhoconnectNET.dll` library in the `bin/Release` subdirectory.
However, you can build your own library using the provided Microsoft Visual Studio .NET solution file and the source code files. 

In order to use `Rhoconnect.NET` functionality in your `ASP.NET MVC 3` application, first you need to include the `Rhoconnect.NET` library 
as a dependency to your application. Click `Project => Add Reference` menu item in the Visual Studio and navigate to the `RhoconnectNET.dll` library.
After this step is completed, you can add references to the `Rhoconnect.NET` namespace into the application's and Controller's files:

	using RhoconnectNET;
	using RhoconnectNET.Controllers;


## Registering `Rhoconnect.NET` routes for your application

To establish the communication channel between ASP.NET MVC 3 application and Rhoconnect server, 
you need to implement the following `init_rhoconnect` and `rhoconnect_authenticate` methods in the `Global.asax.cs` file 
and call them from the `Application_Start` method:

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
	// and ASP.NET MVC 3 application
	const bool init_rhoconnect()
	{
		// this call allows parsing JSON structures into Objects
		ValueProviderFactories.Factories.Add(new JsonValueProviderFactory());
		
		// this call establishes communication between Rhoconnect and ASP.NET application
		// as a last parameter we supply authentication routine that will called 
		// by rhoconnect server to authenticate users.
		RhoconnectNET.Client.set_app_endpoint("my_rhoconnect_server_url", 
											  "my_mvc_app_root_url", 
											  "rhoconnect_api_token", 
											  rhoconnect_authenticate);
	}
	
	const bool rhoconnect_authenticate(String username, String password, Hashtable params)
	{
		// perform your authentication here
		return true;
	}
	
`RhoconnectNET.Client.set_app_point` method is a main point
in establishing the communication link between `Rhoconnect` server and the ASP.NET MVC 3 application
and it has the following parameters:

<table border="1">
	<tr>
		<td>String</td>
		<td><code>rhoconnect_url</code></td>
		<td>rhoconnect server's url, for example <code>http://localhost:9292</code>.</td>
	</tr>
	<tr>
		<td>String</td>
		<td><code>app_endpoint</code></td>
		<td>your MVC app url, for example <code>http://my_pc_host/MyApp</code>.</td>
	</tr>
	<tr>
		<td>String</td>
		<td><code>api_token</code></td>
		<td>rhoconnect server's api_token, for example <code>secrettoken</code>.</td>
	</tr>
	<tr>
		<td>Func&lt;String, String, Hashtable, bool&gt;</td>
		<td><code>Authenticating_Routine</code></td>
		<td>handle to the application's authenticating routine (if null, <code>true</code> is returned by default).</td>
	</tr>
</table>

`Rhoconnect.NET` installs a `/rhoconnect/authenticate` route into your application which will receive credentials from the client.  
By providing the `rhoconnect_authenticate` method and registering it with the `Rhoconnect.NET` in the `set_app_endpoint`
method, you map your application specific authentication to the Rhoconnect `authenticate` requests:

	const bool rhoconnect_authenticate(String username, String password, Hashtable params)
	{
		// perform real authentication here
		return true;
	}

## Implementing CRUD functionality
`Rhoconnect.NET` lib installs `/rhoconnect/<CRUD>` routes in your application which the Rhoconnect instance 
invokes to perform CRUD operations on the data for the dataset you want to synchronize.
Each of the routes is mapped to a corresponding `rhoconnect_<operation>` method in the **IRhoconnectCRUD** interface
which you must implement in the dataset's Controller class.

		public class MyDataController : Controller, IRhoconnectCRUD
		{
			... implementation of Controller routes
	
			// next four methods must be implemented
			// and will be called by Rhoconnect server
			JsonResult rhoconnect_query_objects(String partition);
			ActionResult rhoconnect_create(String objJson, String partition);
			ActionResult rhoconnect_update(Dictionary<string, object> changes, String partition);
			ActionResult rhoconnect_delete(Object objId, String partition);
		} 

## Query the datasets
The route `/rhoconnect/query` is mapped to the `rhoconnect_query_objects` method of the **IRhoconnectCRUD**
interface that you must implement in the corresponding dataset's Controller class. It must
return a collection of source objects in the form of a JsonResult:

		JsonResult rhoconnect_query_objects(String partition)
		{
			return Json(db.Products.ToDictionary("id"));
		}
	
In the above example, the Products object set is converted to `Dictionary<String, Object>`
where the dictionary's key must correspond to an unique object's `id` field.
After dictionary is created , it is converted to JsonResult and sent to the Rhoconnect server.

## Create new objects
The route `/rhoconnect/create` is mapped to the `rhoconnect_create` method of the IRhoconnectCRUD
interface that you must implement in the corresponding dataset's Controller class. It should
return a newly created object's id in case of success:

		public ActionResult rhoconnect_create(String objJson, String partition)
        {
            Product new_product = (Product)RhoconnectNET.Helpers.deserialize_json(objJson, typeof(Product));
            db.Products.AddObject(new_product);
            db.SaveChanges();
            return RhoconnectNET.Helpers.serialize_result(new_product.id);
        }
	
## Update existing objects
In the similar fashion, the route `/rhoconnect/update` is mapped to the `rhoconnect_update` method of the IRhoconnectCRUD
interface that you must implement in the corresponding dataset's Controller class. It should
return an updated object's id in case of success:

		public ActionResult rhoconnect_update(Dictionary<string, object> changes, String partition)
        {
            String obj_id = changes["id"]);
            Product product_to_update = db.Products.First(p => p.id == obj_id); 
		    // this method will update only the modified fields
            RhoconnectNET.Helpers.merge_changes(product_to_update, changes);
            db.ObjectStateManager.ChangeObjectState(product_to_update, EntityState.Modified);
            db.SaveChanges();
            return RhoconnectNET.Helpers.serialize_result(obj_id); 
        }

## Delete objects from the dataset
The route `/rhoconnect/delete` is mapped to the `rhoconnect_delete` method of the IRhoconnectCRUD
interface that you must implement in the corresponding dataset's Controller class. It should
return a deleted object's id in case of success:

        public ActionResult rhoconnect_delete(Object objId, String partition)
        {
            String key = objId.ToString();

            Product product_to_delete = db.Products.Single(p => p.id == key);
            db.Products.DeleteObject(product_to_delete);
            db.SaveChanges();
            return RhoconnectNET.Helpers.serialize_result(objId);
        }

## Partitioning Datasets
Each of the above methods have a partition key supplied with the CRUD request.	This partition key is used by `Rhoconnect` to uniquely identify the model dataset when it is stored in a rhoconnect instance.  It is typically an attribute on the model or related model.  `Rhoconnect` supports two types of partitions:

* :app - No unique key will be used, a shared dataset is synchronized for all users.
* lambda { some lambda } - Execute a lambda which returns the unique key string.

For example, the `Product` model above might have a relationship to the User model.  This provides us a simple way to organize the `Product` dataset for rhoconnect by reusing this relationship.  
In this case, your implementation might filter out data on a per user basis.
	
For more information about Rhoconnect partitions, please refer to the [Rhoconnect docs](http://docs.rhomobile.com/rhosync/source-adapters#data-partitioning).

## Implementing MVC callbacks
All of the above methods are necessary to establish the communication from the Rhoconnect instance to your ASP.NET MVC application. 
However, to complete the implementation, it is necessary to implement a reverse way to notify the Rhoconnect instance about the changes made in your MVC app.
Typically, your MVC Controller class reacts to the actions by implementing the CRUD POST routes, for example:

		[HttpPost]
		public ActionResult Create(Product new_product)
		{
		     if (ModelState.IsValid)
		     {
                db.Product.AddObject(new_product);
                db.SaveChanges();
                return RedirectToAction("Index");  
              }

            return View(new_product);
        }

Here, you need to insert a call which will notify the Rhoconnect instance that a new object has been created.
For this reason, `RhoconnectNET` library provides three callback routines for CUD notifications.
The above example will look like this after inserting the corresponding callback routine:

		[HttpPost]
	    public ActionResult Create(Product product)
	    {
		     if (ModelState.IsValid)
		     {
                db.Product.AddObject(product);
                db.SaveChanges();

				// insert these lines to provide
				// notifications to Rhoconnect server
				Hashtable reqHash = new Hashtable();
                reqHash.Add(new_product.id.ToString(), new_products);
                RhoconnectNET.Client.notify_on_create("Product", "partition_string", reqHash);

                return RedirectToAction("Index");  
              }

              return View(new_product);
        }

In the example above, user need to call `RhoconnectNET.Client.notify_on_create` method 
with the following parameters:

- String rhoconnect_source_name : dataset's name
- String rhoconnect_partition : partition to which the object belongs (see above section "Partitioning datasets")
- Hashtable<String, Object> object_hash : Hashtable with object's id as a key and the object itself as a value

In the same fashion , your dataset's Controller need to implement `Edit` and `Delete` callback notifications:

		[HttpPost]
        public ActionResult Edit(Product product)
        {
            if (ModelState.IsValid)
            {
                db.Products.Attach(product);
                db.ObjectStateManager.ChangeObjectState(product, EntityState.Modified);
                db.SaveChanges();
				
				// insert this callback to notify Rhoconnect
				// about the update operation
                Hashtable reqHash = new Hashtable();
                reqHash.Add(product.id.ToString(), product);
                RhoconnectNET.Client.notify_on_update("Product", "partition_string", reqHash);

                return RedirectToAction("Index");
            }
            return View(product);
        }

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(String id)
        {            
            Product product = db.Products.Single(p => p.id == id);
            db.Products.DeleteObject(product);
            db.SaveChanges();

			// insert this callback to notify Rhoconnect
			// about the delete operation
            RhoconnectNET.Client.notify_on_delete("Product", rhoconnect_partition(), id);

            return RedirectToAction("Index");
        }

## Meta
Created and maintained by Maxim Zverev.

Released under the [MIT License](http://www.opensource.org/licenses/mit-license.php).