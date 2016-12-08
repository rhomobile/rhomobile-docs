# User Interface Architecture
## What is included in the box
When using RhoMobile Application Generator, a [default application structure](creating_a_project#project-structure) is created that includes jQuery Mobile and associated CSS stylesheets to control the user interface of the application.

The RhoMobile framework also includes stylesheets customized for each device to give your applications a native look and feel. These stylesheets are included by default in all generated Rhodes applications (public/css/), and are included in the application layout file (app/layout.erb).

The default styles will automatically be applied to all supported content found in the "header", "footer", and "content" divs.  If you prefer using different names for any of these divs, you will need to update your stylesheets to reflect the new names in order to retain native styling.  Conversely, if you prefer not to use any of the customized styles in your applications, you can either delete the links to the default stylesheets from your application, or simply place any content you wish to create custom styles for in a div that does not descend from "header", "footer", or "content".

## Using Other Frameworks
You are free to remove the contents of layout.erb and implement your own CSS as well as 3rd party frameworks. There are many popular UI frameworks besides jQuery Mobile to choose from. Some frameworks that are traditionally geared towards mobilizing web sites like Twitter BootStrap or Zurb Foundation can be useful for those looking to take advantage of Responsive Design that these frameworks offer. Other frameworks like jQuery Mobile are geared towards providing many mobile enhance controls or elements. When choosing a UI framework, it is important to consider not only the features that it provides, but how they will perform on the intended targeted operating systems. Most of these frameworks use modern CSS3 techniques for UI effects and transitions that perform well on devices that provide a dedicated GPU typically found on Android and iOS devices. These frameworks may not be suitable for other platforms like Windows Mobile/CE.

## View Layouts

RhoMobile supports a layout mechanism based on ERB templates. The default layout template is called "layout.erb" and is located in the application root folder.  Unless overridden, this layout is rendered on all non-Ajax requests.

You may use layout.erb to define what CSS and JavaScript libraries are used by your views.

	:::html
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
            "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">
    
    <head>
      <title>Test</title>
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
      <link rel="stylesheet" href="/public/bootstrap-3.3.7/css/bootstrap.min.css">
      <script src="/public/jquery/jquery-3.1.1.min.js" type="text/javascript"></script>
      <script src="/public/bootstrap-3.3.7/js/bootstrap.min.js" type="text/javascript"></script>
    
      <% if Rho::System.getProperty('platform') == 'APPLE' || Rho::System.getProperty('platform') == 'ANDROID' ||
      ( Rho::System.getProperty('platform') != 'WINDOWS' && Rho::System.getProperty('webviewFramework') =~ /^WEBKIT/) %>
      <script src="/public/api/rhoapi-modules.js" type="text/javascript"></script>
      <% end %>
    
    </head>
    
    <body data-platform="<%= Rho::System.getProperty('platform') %>">
    <%= @content %>
    </body>
    
    </html>

### Customizing Layouts

If you would like to override or customize layout behavior for individual application pages, you can call the render function with the following parameters:

	:::ruby
	render :action => 'index',
	  :layout => 'mycustomlayout', :use_layout_on_ajax => false

The first argument is the action you would like to render.  Next is the (optional) layout name, which assumes the application root as a base directory.  In the above example, RhoMobile would look for a file called "mycustomlayout.erb" in the application root directory (you also may use :layout => false to disable the use of a layout template).  The use_layout_on_ajax argument tells Rhodes whether or not to use the layout on Ajax calls (default is false).

You can call the layout method on the controller to overwrite the default layout name:

	:::ruby
	layout :mycustomlayout

This will force the render call to use mycustomlayout.erb in place of the default layout file for all actions of this controller.

## UI handling for multiple platforms

While there are enough similarities between most browsers to facilitate the use of a single view file across platforms, you may encounter some differences which may necessitate the use of custom view files for specific devices.  RhoMobile supports such differences in several ways:

### Conditional display in view files

To render content in some browsers but not others, you can include conditional statements within your views.  For example, this code can be used to conditionally display the name of the phone's operating system in your model views.

	:::ruby
	<% if platform == 'APPLE' %>
	  iPhone
	<% elsif  platform == 'ANDROID' %>
	  Android
	<% else %>
	  Windows Mobile
	<% end %>

To see the appropriate conditional logic for determining the current platform in the application index (or other page outside a model), refer to the generated application <code>layout.erb</code> - this file contains conditional logic for loading the appropriate automatically-generated stylesheets.

If you use more complex conditionals on a regular basis, you can also create custom helper methods in /app/helpers/browser_helper.rb. The following helper method can be used to

a) determine if a browser is webkit based

	:::ruby
	def is_webkit?
	  platform == "APPLE" || platform == "ANDROID"
	end

b) and if it is, include a custom webkit stylesheet in the html header in the application layout file.

	:::ruby
	<%= '<link href="/public/css/my_custom_webkit.css" type="text/css" rel="stylesheet"/>'  if is_webkit? %>

### Dynamic loading of custom view files based on the current platform
For more significant differences between browsers, RhoMobile supports platform-specific loading of view files.  At runtime, the application detects the current platform, and checks first for a platform-specific file before loading the default view file.

To create a platform-specific view file, simply name the file using the following convention
`[action_name].[platform_abbreviation].erb` (e.g., `show.wm.erb`)

<table>
<tr><td width="125">Android:</td><td width="125" > android</td><td width="125" >index.android.erb</td></tr>
<tr><td width="125">iPhone:</td><td width="125" >iphone</td><td width="125" >index.iphone.erb</td></tr>
<tr><td width="125">Windows Mobile:</td><td width="125" > wm</td><td width="125" >index.wm.erb</td></tr>
</table>

Keep in mind that any changes made to the standard view files are not incorporated into the custom views, so if you're developing custom views for a specific platform, ensure that any necessary changes are applied to all relevant view files.

### Escaping HTML
If you need to output values that might contain HTML-unsafe characters, you can use ERB's `escape_html` to ensure that your code is escaped properly. This will help against accidental breakage as well as intentional XSS attempts. In your controller, include the `ERB::Util` module and in your templates, print values with `<%=html_escape @value %>` or the shorthand version `<%=h @value %>`

Example:

Ruby code:

    :::ruby
    class ProductController < Rho::RhoController
      include BrowserHelper
      # We include the ERB::Util module so that the escape_html function is accessible from the view
      include ERB::Util


HTML view:

    :::ruby
    <div>Message received: <%=h @message %></div>

## Advanced Usage of Render
Render does not need to be called at the end of each controller action method. If render was not called, then it will default to rendering the action of the method you are in.

Rendering of views works with no method in controller. If the method does not exist for an action, but a view exists for that action, then the view will be rendered.

Rendering of files: render :file => "Settings/wait.erb" will render that file with the current controller's instance. By default, layout is false when rendering a file.

Rendering of partials, with collections or locals. Either collections or locals must be provided:

    :::ruby
    render :partial => "ad", :collection => ["foo1","foo2","foo3"]

or

    :::ruby
    render :partial =>"ad", :locals => { :ad => "foo_ad" }

Will render the partial "_ad.erb"  and the local variable "ad" will be available. With a collection, the partial will be rendered once per element.

Load from 'partials' folder:

    :::ruby
    render :partial =>"partials/ad", :locals => { :ad => "foo_ad" }

### Partial Efficiency
Some developers may shy-away from partials because they have the mistaken impression that they are inefficient. You might easily imagine a file being read and parsed every time you use a partial however, that is not the reality.

What really happens:

* At build time, the partial is transformed from ERB to Ruby code
* Then (still at build time) the Ruby code is compiled to Ruby bytecode
* At run time, a file of Ruby bytecode is read into memory upon first encounter. Then it stays there (in memory).
* Other than that initial load, the overhead of using a partial is the overhead of a Ruby call and return. In other words, insignifigant.

You should still use CSS to alter appearance but, if you use inline styles, etc. it is much more manageable with partials. And now you have the freedom to alter structure, add a CSS class you thought you wouldn't need, etc. etc. much more easily, and efficiently, than with some massive editor search-and-replace.