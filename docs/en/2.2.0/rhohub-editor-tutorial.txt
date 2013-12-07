RhoHub Editor Tutorial
========
This tutorial will guide you through editing a Rhodes and RhoSync project on RhoHub using the RhoHub Integrated Development Environment, or RhoHub Editor.

Webinar Video
-------------
[RhoHub 3.0 Editor webinar video](http://vimeo.com/21215373)

Pre-requisite Reading
---------------------
 * [RhoHub Tutorial](rhohub/tutorial)

## Setup
This tutorial assumes that you have set up an account on RhoHub. If you have not done this, see [Pre-requisite Reading](). The RhoHub tutorial contains instructions on how to set up a RhoHub account.

RhoHub Editor is an Integrated Development Environment for Rhodes and RhoSync. 

## Logging Into RhoHub

On the main RhoHub page, www.rhohub.com, click on login if you are not logged in already, and enter your username or email and password. (The screenshot below shows the user as already logged in; in that case, click on "My Account.")

<img src="http://rhodocs.s3.amazonaws.com/rhohub-editor-tutorial/rhohub-top-page.png" alt="RhoHub Website" />

You now see your RhoHub dashboard. It contains all the applications that you are working on in RhoHub. 

<img src="http://rhodocs.s3.amazonaws.com/rhohub-editor-tutorial/rhohub-dashboard-editor-create.png" alt="RhoHub Dashboard" />

If you have already created projects, you can click on Launch Editor to launch the [RhoHub Editor](#opening-the-rhohub-editor) for that project. You can also enter the project and click the Launch Editor button.

Or you can click the Create Project button to create a new project.

## Create a New Project

Click the Create Project button to create a new project. 

In the Create a New Project window, enter the name of the project and a description. Have the Generate Apps checkbox checked so your project can generate apps. Then click the Create Project button.

<img src="http://rhodocs.s3.amazonaws.com/rhohub-editor-tutorial/rhohub-create-new-project.png" alt="RhoHub Create New Project" />

You are retuned to the RhoHub project that you have just created.

<img src="http://rhodocs.s3.amazonaws.com/rhohub-editor-tutorial/rhohub-created-project.png" alt="New RhoHub Project" />

You can change the description and names in your project by clicking the rename icon (the pencil icon to the right of the name and description).

## Managing Collaborators

You can add collaborators to your project. Collaborators are other people who have RhoHub accounts who can work with you on this project. Within your RhoHub project, click the Collaborators tab. 

<img src="http://rhodocs.s3.amazonaws.com/rhohub-editor-tutorial/rhohub-collaborators-button.png" alt="Collaborators Button" />

In the Manage Collaborators tab, enter the username of the collaborator(s) you wish to work with. You can also select if this person is a member or the owner of the project; usually you would leave this at the default of "member", since you will tend to own your projects. Click Add Collaborator.

## Using Local Development Instead of RhoHub Editor

At this point, your project is hosted in a Git repository by RhoHub. If you want to do local development where you would access and develop the project code on your local computer instead of with RhoHub Editor, you will need a Git repository on your local computer. There, you will use the git clone command to clone the project to your local computer, then use a Rhodes and RhoSync installation on your local computer to develop the project, then use git commit to commit your project to RhoHub again. See the [RhoHub Tutorial](rhohub/tutorial) for those instructions.

## Opening the RhoHub Editor

To open the RhoHub Editor, either click on the My Project tab and click Launch Editor for that project, or enter your project and click on the Launch Editor tab.

<img src="http://rhodocs.s3.amazonaws.com/rhohub-editor-tutorial/rhohub-project-launch-editor.png" alt="Launch Editor Button" />

The RhoHub Editor appears, containing your Rhodes and RhoSync projects.

## Generating a Rhodes Model

To generate a model in the Rhodes project, click on Actions for your Rhodes project, then select Generate Model from the pop-up menu.

<img src="http://rhodocs.s3.amazonaws.com/rhohub-editor-tutorial/rhodes-editor-actions.jpg" alt="Rhodes Editor Actions" />

Enter the name for your model and its attributes. This example is a store application, so it uses a model name of product and attributes of name,brand,price,quantity.

<img src="http://rhodocs.s3.amazonaws.com/rhohub-editor-tutorial/generate-new-model.png" alt="Generate Model" />

In the app folder, you now see the model folder. In this example, the folder is named Product.

<img src="http://rhodocs.s3.amazonaws.com/rhohub-editor-tutorial/model-product.png" alt="Model: Product" />

You can edit the model files. Open app/Product/product.rb and uncomment the enable :sync line. Click Save.

	:::ruby
	# The model has already been created by the framework, 
	#   and extends Rhom::RhomObject
	# You can add more methods here
	class Product
	  include Rhom::PropertyBag
	  # Uncomment the following line to enable sync with Product.
	  enable :sync   # uncommented
	  #add model specific code here
	end

In app/index.erb, edit the link in the class content div to link to the new model.

	:::html
	<div class="pageTitle">
	  <h1>StoreRhodes</h1>
	</div>
	
	<div class="toolbar">
	  <% if SyncEngine::logged_in > 0 %>
	      <div class="leftItem blueButton">
	        <a href="<%= url_for :controller => :Settings, :action => :do_sync %>">Sync</a>
	      </div>
	      <div class="rightItem regularButton">
	        <a href="<%= url_for :controller => :Settings, :action => :logout %>">Logout</a>
	      </div>
	  <% else %>
	      <div class="rightItem regularButton">
	        <a href="<%= url_for :controller => :Settings, :action => :login %>">Login</a>
	      </div>
	  <% end %>
	</div>
	
	<div class="content">
	  <ul>
	    <li>
	      <!-- Edited to link to the Product model -->
	      <a href="Product"><span class="title">Products</span><span class="disclosure_indicator"></span></a>
	    </li>
	  </ul>
	</div>

In the icon folder, you can see the icons for the Rhodes application. The app/loading.png file shows the loading screen for the Rhodes application. You can open them and see what they look like.

<img src="http://rhodocs.s3.amazonaws.com/rhohub-editor-tutorial/icon.png" alt="Icon" />

## Generating the RhoSync Source

You need to generate the RhoSync source adapter for your Rhodes project model. Click on Actions for your RhoSync project, then select Generate Source.

<img src="http://rhodocs.s3.amazonaws.com/rhohub-editor-tutorial/rhosync-editor-actions.jpg" alt="Rhodes Editor Actions" />

In the Generate RhoSync Source window, enter the name of the source: in this example, enter product to match the name of the model in the Rhodes project.

<img src="http://rhodocs.s3.amazonaws.com/rhohub-editor-tutorial/generate-rhosync-source.png" alt="Generate Rhosync Source" />

You now have a sources folder in your RhoSync project. You can open the sources/product.rb file, but it only contains the default model code. It has the basic query, create, update, and delete, but it does not really do anything. In the RhoSync project, you can open the source/product.rb file and paste in the following code that works with the Rhodes product model.

	:::ruby
	require 'json'
	require 'rest_client'
	
	class Product < SourceAdapter
	
	  def initialize(source,credential)
	    @base = 'http://rhostore.heroku.com/products'
	    super(source,credential)
	  end
	  
	  def query(params=nil)
	    parsed = JSON.parse(RestClient.get("#{@base}.json").body)
	    
	    @result={}
	    parsed.each do |item|
	      @result[item["product"]["id"].to_s] = item["product"]
	    end if parsed
	  end
	    
	  def create(create_hash)
	    res = RestClient.post(@base,:product => create_hash)
	    
	    # After create we are redirected to the new record.
	    # We need to get the id of that record and return
	    # it as part pf create so rhosync can establish a link
	    # from its temporary object on the client to this newly
	    # created object on the server
	    JSON.parse(
	      RestClient.get("#{res.headers[:location]}.json").body)["product"]["id"]
	  end
	    
	  def update(update_hash)
	    obj_id = update_hash['id']
	    update_hash.delete('id')
	    RestClient.put("#{@base}/#{obj_id}",:product => update_hash)
	  end
	    
	  def delete(delete_hash)
	    RestClient.delete("#{@base}/#{delete_hash['id']}")
	  end
	end

## Committing the Project to the RhoHub Repository

You have made changes to the Rhodes and RhoSync files, and you have saved the changes, but you need to commit the files to the repository. Otherwise, when you do a build, the build only works with the default files that were first generated when you created the project. RhoHub uses a Git repository, and thus uses a Git type interface.

To commit the Rhodes files, click on Actions for the Rhodes project, and select Commit.

From the Commit Rhodes App window, click on Add All Files to add your files in Unstaged changes to Staged changes. (You could add the files individually by clicking on them in Unstaged changes.)

In the Commit message box, you can write a commit message. 

Click Commit to commit your changes to your Rhodes project to the RhoHUb repository.

<img src="http://rhodocs.s3.amazonaws.com/rhohub-editor-tutorial/commit-rhodes-app.png" alt="Commit Rhodes App" />

Click Close when the files are committed. This returns to the RhoHub Editor.

Commit the RhoSync project the same way. Click on Actions -> Commit, then in the Commit RhoSync App window, click on Add All Files, enter a commit message if you wish, then click Commit.

## Building the Rhodes Project

Now that the Rhodes project files have been edited to add a model and link to that model, and the project files have been committed, you can build the project. Click on the Rhodes Actions for your Rhodes project, then select Build from the popup menu.

<img src="http://rhodocs.s3.amazonaws.com/rhohub-editor-tutorial/rhodes-editor-actions.jpg" alt="Rhodes Editor Actions" />

In the Create a new build window, select the target device and platform version for which you want to build. You can build for the target devices Android, Blackberry, Windows Mobile, and iOS (you will need a license to build for iOS).

Click the Build button. Your project will take a little time to build. You can click Close to go back to the Editor while your Rhodes project is building.

<img src="http://rhodocs.s3.amazonaws.com/rhohub-editor-tutorial/create-a-new-build-completed.png" alt="Build completed" />

At this point, you can click on the green down arrow in Status, next to completed.

This will download a zip file of the Rhodes application to your computer. You can install this application build on your mobile device and try it out. For example, for an Android device, you can put the .apk file onto an http server, browse to it from an Android device, and follow the prompt to install the application.

You can also use RhoGallery, an application management tool, to invite people to galleries of applications and deploy them on mobile devices. This is discussed in the [RhoGallery tutorial](rhohub-rhogallery).

## Deploying the RhoSync Project

You have committed the RhoSync project. Now you need to deploy it for testing. Click on the RhoSync Actions for your Rhodes project, then select Deploy from the popup menu.

<img src="http://rhodocs.s3.amazonaws.com/rhohub-editor-tutorial/rhosync-editor-actions.jpg" alt="RhoSync Editor Actions" />

To deploy, click the Deploy button. You will then see that your RhoSync is deployed, and you get a link where it is deployed. This will have your RhoSync running in development mode, since it is not a live application yet.

<img src="http://rhodocs.s3.amazonaws.com/rhohub-editor-tutorial/deployed-rhosync.png" alt="Deployed RhoSync" />

Click on the location to go to the RhoSync console. You may need to login.

<img src="http://rhodocs.s3.amazonaws.com/rhohub-editor-tutorial/rhosync-console-login.png" alt="RhoSync Console Login" />

Once you are logged in, you see your RhoSync server running.

<img src="http://rhodocs.s3.amazonaws.com/rhohub-editor-tutorial/rhosync-console.png" alt="RhoSync Console" />


