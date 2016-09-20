Creating an application
===
The following instructions describe how to use `rhoconnect.js` to connect your application to a rhoconnect instance.  <a href='http://jquerymobile.com/demos/1.0b1/' target='_blank'>jQuery Mobile</a> will be used for the UI and <a href='http://persistencejs.org/' target='_blank'>persistence.js</a>  will be used as an object-database mapper. Currently rhoconnect.js supports both Sencha Touch and persistence.js.

To view the finished application, which is written to run with the PhoneGap framework, visit <a href='https://github.com/rhomobile/rhoconnect.js/tree/master/samples/jqmobile-persistence-ffcrm/www' target='_blank'>rho-fat-freec-crm</a> example.

NOTE: Unless you are using Sencha Touch for your UI as well, you will need to use persistence.js as your object-database mapper to avoid framework conflicts.

## Getting Started

You need to add libraries and define the rhoconnect location.

### Adding Dependent Libraries

Add all of the JavaScript and stylesheet libraries to the application. Inside of the index.html file, add the following lines:

	:::html
	 <script type="text/javascript" charset="utf-8" src="external/jquery/jquery-1.6.1.min.js"></script>
     <script type="text/javascript" charset="utf-8" src="external/jquery/jquery.base64.min.js"></script>
     <script type="text/javascript" charset="utf-8" src="external/jquery/json.js"></script>

	 <link rel="stylesheet" href="external/jqmobile/jquery.mobile-1.0b1pre.css">
	 <script type="text/javascript" charset="utf-8" src="external/jqmobile/jquery.mobile-1.0b1pre.min.js"></script>
	
	 <script src="external/persistencejs/persistence.js" type="application/javascript"></script>
	 <script src="external/persistencejs/persistence.store.sql.js" type="application/javascript"></script>

	 <script type="text/javascript" charset="utf-8" src="js/rhoconnect-0_9.js"></script>
     <script type="text/javascript" language="javascript" src="application.js"></script>

The first five files included are for jQuery mobile. They include jQuery 1.6.1, jQuery.base64.js (needed for binary encoding of data), json.js, and jquery.mobile css and js files.

The next two files are for persistence.js, and since we are using SQLite, persistence.store.sql.js. <a href='https://github.com/zefhemel/persistencejs' target='_blank'>See persistence.js documentation</a> for more information on this.

The next file is, at this time, the latest version of rhoconnect.js.  We will add all of our JavaScript code into a file called application.js, so include that file as well.

### Defining the rhoconnect Location

Include the location of our rhoconnect instance.  In this example, we are connecting to a rhoconnect instance provisioned on heroku.  We also define our application name and set the log level.

	:::html
	<script type="text/javascript">
        var syncUrl = 'http://rhoconnect-resource.heroku.com/application';
        RhoConfig = {
            appName: 'rho-fat-free-crm',
            syncServer: syncUrl,
            logLevel: 'trace'
        }; 
    </script>

## Creating a Login View

Next we will create a simple login view to login to the rhoconnect instance.

### Defining a jQuery Mobile Page

Inside of index.html we will define a jQuery Mobile page with two textfields for username and password. Notice the onload event attached to the body tag.  This will be used to attach the JavaScript functions that we will write inside of application.js.

	:::html
	<body onload="onLoad()">
	<!-- start of page 1 -->
	    <div data-role="page" id="form">
	        <div data-role="header">
	            <h1>Fat Free CRM</h1>
	        </div>
	        <div data-role="content">
				<div class='login-error'></div>
	            <div data-role="fieldcontain">
	                <label for="username">username:</label>
	                <input type="text" name="username" id="username" value=""/>
	                <label for="password">password:</label>
	                <input type="text" name="password" id="password" value=""/>
					<a id="login" href="#" data-role="button">Login</a>
	            </div>
	        </div>
	    </div>
	<!------  end page               -->
	</body>

### Defining a Login Function

Inside of application.js, define a login function that is returned with the onload event attached to the body tag.

	var username = null;
	var password = null;
	onLoad = (function($) {
    	function mapPages() {
			$('a#login').live('tap',function(event){
				setNames();
	            loginRhoConnect(username, password).done(function(){
					sync();
					$.mobile.changePage("#home", "slideup");
		            attach_events();
				$('.greeting').replaceWith("<h1 style='text-align:center'>Welcome " + username + '</h1>');
	            }).fail(function(errCode){
					$('.login-error').replaceWith("<div class='login-error'>Error logging in" + errCode + "</div>");
					$('.login-error').fadeOut(3000);
				})
			})
	    }
	
		
		var modelDefinitions = [
			{
	            name: 'User',
	            fields: [
					{name: 'username',    	type: 'string'},
	                {name: 'email',			type: 'string'},
	                {name: 'first_name',	type: 'string'},
	                {name: 'last_name',   	type: 'string'},
	                {name: 'title',   		type: 'string'},
	                {name: 'company', 		type: 'string'},
					{name: 'created_at',   	type: 'string'},
					{name: 'updated_at',   	type: 'string'}
	            ]
		   },
		   {
	            name: 'Task',
	            fields: [
					{name: 'user_id',    	type: 'string'},
	                {name: 'assigned_to',	type: 'string'},
	                {name: 'completed_by',	type: 'string'},
	                {name: 'name',   		type: 'string'},
	                {name: 'asset_id',   	type: 'string'},
	                {name: 'priority', 		type: 'string'},
	                {name: 'category',    	type: 'string'},
	                {name: 'bucket',   		type: 'string'},
	                {name: 'due_at',     	type: 'string'},
	                {name: 'completed_at',  type: 'string'},
	                {name: 'deleted_at',    type: 'string'},
					{name: 'created_at',   	type: 'string'},
					{name: 'updated_at',   	type: 'string'},
					{name: 'background_info',   type: 'string'}
	            ]
			}
		]
	
		return mapPages;
	})(jQuery);

### Get the Username and Password

Inside of the mapPages() function, call setNames(). The setNames() function grabs the username and password from the fields defined in the jQuery mobile page defined in index.html.

	function setNames(){
        username = $('input#username')[0].value;
        password = $('input#password')[0].value;    
    }

### Call Rhoconnect.login, Rhoconnect.init, and Rhoconnect.syncAllSources

Next, call loginRhoConnect(username,password). We are using <a href='http://api.jquery.com/category/deferred-object/' target='_blank'>deferred objects</a> to chain multiple callbacks. First Rhoconnect.login is called, on success Rhoconnect.init is called.

	function loginRhoConnect(username, password) {
		persistence.store.rhoconnect.config(persistence);

        return $.Deferred(function(dfr){
            RhoConnect.login(username, password,
                    new RhoConnect.SyncNotification(), true /*do db init*/).done(function(){
                // Init DB for the user on success
                initRhoconnect(username, false).done(function(){
                    dfr.resolve();
                }).fail(function(errCode, err){
                    alert('DB init error: ' +errCode);
                    dfr.reject(errCode, err);
                });
            }).fail(function(errCode, err){
                //alert('RhoConnect login error: ' +errCode);
                dfr.reject(errCode, err);
            });
        }).promise();
    }

    // RhoConnect.js initialization
    function initRhoconnect(username, doReset) {
        return RhoConnect.init(modelDefinitions, 'persistencejs', doReset);
    }

Rhoconnect.init takes three parameters: an array of hashes defining each model or data-object, the data-object mapping library (either persistencejs or extjs), and a callback function. All parameters are optional except for the modelDefinitions (the hash array).

On success of Rhoconnect.init, the callback chain will be resolved and a promise object (see <a href='http://api.jquery.com/category/deferred-object/' target='_blank'>deferred objects</a>) will be returned.

Inside of loginRhoConnect(username, password), the sync() function will be called.

	function sync(){
		RhoConnect.syncAllSources().done(function(){
			alert('sync successful');
		}).fail(function(errCode, err){
			alert('Data sync error: ' +errCode);
	    });
	}

Rhoconnect.syncAllSources() will attempt to sync all model definitions defined with the rhoconnect instance.

## Querying objects

Since we have logged in successfully and synced with the rhoconnect instance, we will want to display all of the records.

### Define a New jQuery Mobile Page

Notice in the login function, we call $.mobile.changePage("#home", "slideup") as well as attach\_events().  Define a new jQuery Mobile page called "home" inside of index.html.

	:::html
	<!-- start of page 2     -->
	    <div data-role="page" id="home">
	        <div data-role="header">
	            <div class='greeting'></div>
	        </div>
	        <div data-role="content">
	            <a id='tasks' href="#" data-role="button" data-icon="arrow-r">Tasks</a>
	        </div>
	    </div>
	<!------   end page              -->
	
The button called "tasks" is used to display all the records from the Task model.

### Map the Tasks Button

We can now define the attach\_events() function to map this task button:

	function attach_events() {
		$('a#tasks').live('tap',function(event){
			pull_data('Task');
		})
	}
	
	var fields = [
					'user_id','assigned_to','completed_by','name','asset_id','priority','category','bucket',
					'due_at','completed_at','deleted_at','created_at','updated_at','background_info','campaign_id',
					'first_name','last_name','title','company','status','email','lead_id','probability','closes_on', 'source'
				]

### Accept the Model to Query

The pull\_data function accepts any model we would like to query. In this case it is passed the Task model.

	function pull_data(model) {
		var store = RhoConnect.dataAccessObjects()[model];
		
		current_model = model;
		persistence.loadFromRhoConnect(function() {
            storeLoaded();
        });
		
	    function storeLoaded() {
		    html = "";
			html = "<div id='list-data'><div id='d-list' data-role='collapsible-set'>";
			store.all().each(null, function(record){
				html += "<div data-role='collapsible' data-collapsed='false'><h3>"+ get_title(record) + "</h3> \
						<a id='edit' rhoId='" + record._rhoId + "' href='#' data-role='button' data-theme='e'>edit</a><fieldset class='ui-grid-a' > \
						<a id='delete' rhoId='" + record._rhoId + "' href='#' data-role='button' data-icon='minus' data-theme='f'>delete</a><fieldset class='ui-grid-a' >";
				for( var j=0; j<fields.length; j++){
				  if( record[fields[j]] != undefined ) {
				  	html += "<div class='ui-block-a'><div class='ui-bar ui-bar-c' style='height:40px;text-align:center'>"+ 
							fields[j] +"</div></div><div class='ui-block-b'><div class='ui-bar ui-bar-c' style='height:40px;text-align:center'>" + 
							format_field(record[fields[j]],fields[j]) + "</div></div>"; 
				  }
				}
				html += "</fieldset></div>"
	        });
	        html += "</div></div>"
			$('#list-data').replaceWith(html);
			$('a#delete').live('tap',function(){
				delete_object($(this).attr('rhoId'));
			});
			$('a#edit').live('tap',function(){
				edit_object($(this).attr('rhoId'));
			});
			$('#list-data').page();
			$.mobile.changePage('#list',"slideup");
		}
	}

This is a very busy function. The important calls to take out of it are:

	var store = RhoConnect.dataAccessObjects()[model];

This function is passed a model name and returns a hash of data access objects.

	persistence.loadFromRhoConnect(function() {
        storeLoaded();
    });

When using persistance.js, you need to call loadFromRhoConnect and parse the hash of dataAccessObjects inside of the callback function: in this case, storeLoaded().

The storeLoaded() function iterates through all the models constructing html to be inserted into a page yet to be defined in index.html.  Buttons for edit and delete are also being mapped here.

### Display the Results

Create a new page in index.html to display the results from pull\_data().

	<!-- start of page 3     -->
		<div data-role="page" id="list">
		    <div data-role="header">
		        <div class='greeting'>

		        </div>
		    </div>
		   <div data-role="content">
		    	<div id='list-data'><!-- lists are inserted here --></div>
			</div>
		</div>
	<!------   end page              -->
	
Notice `<div id='list-data'></div>`.  This is a place holder that is used to insert the constructed html list of Tasks.

## Creating an Object

To create a new Task object, first add a button to the page we defined above.

	<!-- start of page 3     -->
		<div data-role="page" id="list">
		    <div data-role="header">
		        <div class='greeting'>

		        </div>
				<a id='new_form' href="#" data-role="button" data-icon="plus">new</a>
		    </div>
		   <div data-role="content">
		    	<div id='list-data'><!-- lists are inserted here --></div>
			</div>
		</div>
	<!------   end page              -->

### Show a Form to Enter Object Values

Create another page to show a form for a user to enter object values.

	<!-- start of page 4 			 -->
		<div data-role="page" id="form-new">
	        <div data-role="header">
	            <div class='form-header'></div>
	        </div>
	        <div data-role="content">
				<div class='new-error'></div>
	             <form action='#' id='form-create'></form>
	        </div>
	    </div>
	<!------ end of page             -->

### Map the Task Button

In the attach\_events function, map this button:
	
	function attach_events() {
		$('a#tasks').live('tap',function(event){
			pull_data('Task');
		})
		$('a#new_form').live('tap',function(event){
			var rec = null;
			form = get_form_html();
			html = "<form action='#' id='form-create'>" + form + "</form>";
			$('#form-create').replaceWith(html);
			$('.form-header').replaceWith("<div class='form-header' style='text-align:center'>New " + current_model + "</div>")
			$('#form-create').page();
			$.mobile.changePage("#form-new", "slideup");
		})
	}
	
	function get_form_html(){
		if(current_model == 'Task') {
			html += "<div data-role='fieldcontain'> \
	            <label for='name'>name</label> \
	            <input type='text' name='name' id='name' value=''/> \
				<label for='background_info'>background info</label> \
				<textarea cols='40' rows='8' name='background_info' id='background_info'></textarea> \
				<div data-role='fieldcontain'> \
				<label for='select-choice-2' class='select'>category</label> \
				<select name='category' id='category'> \
					<option value='call'>call</option> \
					<option value='email'>email</option> \
					<option value='follow_up'>follow-up</option> \
					<option value='lunch'>lunch</option> \
					<option value='meeting'>meeting</option> \
					<option value='money'>money</option> \
					<option value='presentation'>presentation</option> \
					<option value='trip'>trip</option> \
				</select></div> \
				<div data-role='fieldcontain'> \
				<label for='select-choice-1' class='select'>due</label> \
				<select name='bucket' id='bucket'> \
					<option value='due_asap'>as soon as possible</option> \
					<option value='due_today'>today</option> \
					<option value='due_tomorrow'>tomorrow</option> \
					<option value='due_this_week'>this week</option> \
					<option value='due_next_week'>next week</option> \
					<option value='due_later'>sometime later</option> \
				</select></div> \
	            <a id='create' href='#' data-role='button'>create</a> \
	        	</div>"
		}
	}
	
This function calls get\_form\_data(), which constructs the html form to insert into the newly created page `form-new`.  It then uses the place holder 
	`<form action='#' id='form-create'></form>`
to insert this html.  After this 
	`$.mobile.changePage("#form-new", "slideup");`
is called and the form-new page defined above is loaded.

### Map the Create Event

In the function attach_events(), add another function to map the event that a user selects with the create button on the form.

	function attach_events() {
		$('a#tasks').live('tap',function(event){
			pull_data('Task');
		})
		$('a#new_form').live('tap',function(event){
			var rec = null;
			form = get_form_html();
			html = "<form action='#' id='form-create'>" + form + "</form>";
			$('#form-create').replaceWith(html);
			$('.form-header').replaceWith("<div class='form-header' style='text-align:center'>New " + current_model + "</div>")
			$('#form-create').page();
			$.mobile.changePage("#form-new", "slideup");
		})
		$('#create').live('tap',function(event){
			create_obj();
		})
	}

### Create the Data Object

Then define the create\_obj() function.
	
	function create_obj(){
		var record = null;
		
		var model = RhoConnect.dataAccessObjects()[current_model];
		var f = $('#form-create').serializeArray()
		record = new model();
		for(var i=0;i < f.length; i++) {
			record[f[i].name] = f[i].value;
		}
		record['user_id'] = get_user_id(username);
		persistence.add(record);	
		persistence.flush();
        persistence.saveToRhoConnect(function() {
            alert("New " + current_model + " saved successfully!");
        });
		
		$.mobile.changePage("#home", "slideup");
	}

### Grab the Hash from the Data Object

Inside of this function, grab the hash of the data object for the current\_model: in this case, current\_model = 'Task'.

	var model = RhoConnect.dataAccessObjects()[current_model];

### Create a New Model and Populate the Record Fields

Now create a new model.
	
	record = new model();
	
The next loop populates the record fields.  You will then add this new record to persistence.  When modifications to objects have been made, persistence.js requires you to flush to database. This is done by calling persistence.flush.

	persistence.add(record);	
	persistence.flush();

### Save to RhoConnect

The last step is to save to RhoConnect.

	 persistence.saveToRhoConnect(function() {
            alert("New " + current_model + " saved successfully!");
        });

At this point you have created a new object locally.  To synch with your rhoconnect instance you need to call the sync() function described above at login.

## Updating an Object

Updating an object is very similar to creating an object.  The code required to update an object is shown below.  You can see all the UI functionality by looking at the complete <a href='https://github.com/rhomobile/rhoconnect.js/tree/master/samples/jqmobile-persistence-ffcrm/www' target='_blank'>project</a>.

Inside of application.js is a function named update\_object().

 	function update_object() {
		var rec = null;
		
		var model = RhoConnect.dataAccessObjects()[current_model];
		var f     = $('#form-create').serializeArray();
		var len   = f.length - 1;
		model.all().each(null, function(record){
			if(record._rhoId == f[len].value){
				rec = record;
				return;
			}
		})
		if(rec != null) {
			for(var i=0;i < f.length; i++) {
				if(rec[f[i].name] != undefined && rec[f[i].name].match(/(_at)/)  == null){
					rec[f[i].name] = f[i].value;
				}
			}	
			persistence.flush();
	        persistence.saveToRhoConnect(function() {
	            alert(current_model + " updated successfully!");
	        });
		}
		else {
			alert("error updating record");
		}
		$.mobile.changePage("#home", "slideup");
	}
	
You will notice this function is very similar to create\_object.  The only difference is that a new model is not created.  Instead a model is searched for, when found, its fields are assigned new values and the object is flushed and saved to Rhoconnect.  You do not need to call `persistence.add(record)` in this case because the item already exists in the persistence hash.  

## Deleting an Object

Deleting an object is exactly like creating an object except that instead of call `persistance.add(recored)`, you call `persistance.remove(record)`.  The other calls to persistence and rhoconnect are the same.

	function delete_object(id){
		var model   = RhoConnect.dataAccessObjects()[current_model];
		var del_rec = null;
		model.all().each(null, function(record){
			if(record._rhoId == id){
				del_rec = record;
				return;
			}
		})
		if(del_rec != null){
			persistence.remove(del_rec);		
			persistence.flush();
	        persistence.saveToRhoConnect(function() {
	            alert(current_model + " deleted successfully!");
	        });
			$.mobile.changePage("#home", "slideup");
		}
		else {
			alert('could not find record ' + id);
		}
	}