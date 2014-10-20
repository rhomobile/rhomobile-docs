# RhoMobile Suite KitchenSink 

KitchenSink is a sample application and developer tool full of code snippets that show you how to use the APIs of RhoMobile 5.0 If you are new to RhoMobile, it is an excellent starting point to see how to start interacting with the different features of the platform and if you are an experienced user, it will quickly show you how to start getting the maximum value out of the new Ruby and JavaScript APIs.

This document will be your step-by-step guide to how some specific features of KitchenSink were built. Along the way you will learn a few tricks on:

* How to better organize your own applications using partials
* Using custom fonts
* JavaScript scoping
* and more

## Download the Project
The KitchenSink source code can be found at [https://github.com/rhomobile/rho-samples/tree/master/kitchensink](https://github.com/rhomobile/rho-samples/tree/master/kitchensink)

## Download the App
* [Android](https://s3.amazonaws.com/rhomobile-suite/4.0/Kitchen+Sink-Android.apk)
* [Windows Mobile](https://s3.amazonaws.com/rhomobile-suite/4.0/Kitchen+Sink_WM.cab)

## Filesystem Layout

KitchenSink 4 is a regular RhoMobile application like any other. Refer to [project structure](creating_a_project#project-structure) to know more about a typical RhoMobile project layout. In addition to the standard folders, however, KitchenSink 4 also contains:

* `public/fonts` with the font called "OpenSans" in the appropriate format for use within a browser. Read on to see how to [convert and use fonts](#fonts)
* `app/partials`. You will learn more about [partials](#partials) in this guide
* `public/js/samples` contains the code for each sample


## JavaScript

All JavaScript samples in KitchenSink 4 follow the same pattern: There is a global `KitchenSink` object, which contains a member object for each API and these objects in turn contain the functions that invoke the sample code.

Take for instance `js/samples/notification.js`, the file that contains the samples for the new [Notification API](../api/Notification):

	:::javascript
	KitchenSink.Samples.Notification = KitchenSink.Samples.Notification || (function() {

		function beep() {
			...
		}
		
		function popup() {
			...
		}
		
		function popup_with_multiple_buttons() {
			...
		}
		
		function popup_callback(params) {
			...
		}
		
		return {
			beep : beep,
			popup : popup,
			popup_with_multiple_buttons : popup_with_multiple_buttons
		};

	})();

**NOTE: The rest of this section explains how to use anonymous functions to avoid polluting the global namespace. If you are already familiar with this idiom, feel free to skip to the next section.**


If you have not seen this type of construct before it can seem strange at first but once you analyze it step by step, it turns out to be quite straightforward. We will inspect it from the outside first and peel off its different layers until we reach the innermost code. Starting with the first line, we see that `KitchenSink.Samples.Notification` is going to be assigned a value:

	:::javascript
	KitchenSink.Samples.Notification = KitchenSink.Samples.Notification || (function() {

Which value will it take? Forget for a minute the specifics of the example and focus only on the structure:

	:::javascript
	left_side = expression_a || expression_b

`||` is the "logical or" operator. It returns `expression_a` if it can be converted to true, otherwise it returns `expression_b`. Which values can be converted to true? Every value can be converted to true except for:

* `false` 
* The number `0`
* an empty string `""`
* `null`
* `undefined`
* `NaN` (Not A Number)

These are called "falsy" values, because within JavaScript's automatic type conversion, they can be converted into the boolean `false`, while all other values are converted into the boolean `true` and are considered "truthy" values.

Back to the example, this construct:

	:::javascript
	KitchenSink.Samples.Notification = KitchenSink.Samples.Notification || (function() {

protects the code against accidentally loading the `notification.js` JavaScript more than once. The first time it code runs, `KitchenSink.Samples.Notification` is `undefined`, which is a "falsy" value as we just saw, and the `||` operator returns the result of the expression located to its right. If for some reason we included the `notification.js` file again, the second time this code runs `KitchenSink.Samples.Notification` will have a "truthy" value and the assignment will have no visible effect.

Let's examine now the right-side expression; if we remove the body of the function and focus only on the structure, we are left with:

	:::javascript
	KitchenSink.Samples.Notification = KitchenSink.Samples.Notification || 
		( // open grouping brackets

			function() { // declare an anoymous function

			}
		) // close grouping brackets
		(); // call a function with no parameters

When the JavaScript interpreter parses the right operand, it will follow approximately this process:
* find the brackets
* evaluate what is inside them
  - inside the brackets is a function
  - there is nothing else
* the brackets are now evaluated, their value is a function.
* a function followed by opening and closing brackets mean to invoke the function

The end result is that the function is called and the benefit from this approach is that, by encapsulating the function in this way, it does not need to have a name and therefore, there is no possibility that its name can conflict with any other code in the application. If we had used a named function instead, the expression could have been something like this:


	:::javascript
	function initialize() {
		...
	}

	KitchenSink.Samples.Notification = KitchenSink.Samples.Notification || initialize();

However, we would have to be very careful throughout our whole application not to name any other function `initialize` or there would be conflicts in our code. That is somewhat easy if you have little code, but as soon as your application starts to grow beyond a handful of functions, using anonymous functions when possible is a good choice.

Lastly, let's focus on the contents of the function itself:

	:::javascript
	function() {

		function beep() {
			...
		}
		
		function popup() {
			...
		}
		
		function popup_with_multiple_buttons() {
			...
		}
		
		function popup_callback(params) {
			...
		}
		
		return {
			beep : beep,
			popup : popup,
			popup_with_multiple_buttons : popup_with_multiple_buttons
		};
	}

What the function does is it declares some other functions and returns a hash. In JavaScript, each function creates a `scope`, which at a high level means that code outside the function is isolated from code inside. It is not possible for code outside this function to call any of the functions defined inside. We can take advantage of this fact and export some of the functions and not others: if you look closely, the function `popup_callback` is not present in the hash. You can have any number of functions declared inside another and only export those you want to be accessible, while keeping others private, with the benefit that you need not worry about name collisions. As long as they are declared in different scopes, there can be multiple functions with the same name and they will not interfere with each other.

**NOTE: Use this pattern whenever you want to keep some functions "private" and not visible to the outside world**

Finally, we see that in the end, the `KitchenSink.Samples.Notification` object is being set to a hash containing several functions, equivalent to the following code:

	:::javascript
	KitchenSink.Samples.Notification = {
		beep: function() {
			...
		},
		popup: function() {
			...
		},
		popup_with_multiple_buttons: function() {

		}
	}

with the following added advantages:

* we have additional, internal functions that cannot cause conflicts anywhere else
* before the `return` statement we could include initialization code if required, calling functions or setting default values
* if we loaded the same file multiple times, initialization code would not run more than once for the same page, because the `||` operator guards the assignment as previously seen


## Partials

It is very common for an application to have fragments of HTML code that are the same or very similar across different pages. One typical example of the way that RhoMobile helps fight repetition is by having a `layout.erb` file with the parts of a page that are common in all pages of an application and then individual files for each view, which are merged with the layout to produce the full HTML document. For example, when loading the `display_log_file` view from the `Log` controller, this is what happens:

	:::code
	app/layout.erb 											app/Log/display_log_file.erb

														/----
	<html>												|	<div data-role="page">
		<head>											|		<div data-role="header" data-position="inline">
			...											|			<h1>Log file</h1>
		</head>											|		</div>
		<body>											|
														|		<div data-role="content">
														|			<%= @logFileContent %>
								is replaced by			|		</div>
			<%= @content %> <---------------------------|
														|	</div>
														\-----
		</body>
	</html>

Another way to reuse HTML code is by using something called `partials`. The concept is similar to that of functions, in the sense that whenever you have a piece of code that you want to call from different places, you do not simply copy and paste it but instead extract it into its own function and call the new function whenever necessary. Partials work the same way, you take a snippet of HTML code and extract it into its own file that you can later call from multiple places.

KitchenSink 4 uses partials in several places. The first one is the main navigation menu where you see the list of APIS and samples. Open `app/index.erb` and you will find this line:

	:::ruby
	<%= render :partial => "/partials/navmenu" %>

This is the simplest example of using partials: specify the file, call `render` and print the result. Partials are stored in `/app/partials` and their filenames start with an underscore and end with the `.erb` extension. In this case, the partial called `navmenu` is stored in `/partials/_navmenu.erb`.

**Partials can be nested to arbitrary depths**: within a partial, you can invoke another partial which in turn might invoke another and so on. This is a very powerful pattern to use when you have several common sections across pages. If you split your HTML code into partials as much as reasonably possible, you will make your application easier to update when the time comes to make changes to its design or structure.

**Partials accept parameters**. Very similarly to how a function can receive parameters and use them to produce its resulting value, a partial accepts `locals`, which it can use. Here is an excerpt from `app/Log/confirm_read_log.erb`:

	:::ruby
    <%= render :partial => "/partials/example_header", :locals => {:title => "Read log file", :description => "
      This example will show you the Log information
    " }
    %>

In this case, apart from specifying which partial to render, we are also passing it values for `title` and `description`. If you look inside `app/partials/_example_header.erb` you can see where these values are used in <%= => tags.

	:::html
	<div class="example_description">
	  <%= description %>
	</div>	

This technique gives you a tremendous amount of flexibility to structure your partials for maximum reuse; if you start to see snippets of code in your application that are repeated frequently, consider converting them into partials.

## Fonts and Colors

By default, each device has a predefined set of fonts you can use but thanks to advances in CSS support, it is now possible to embed your own fonts and use them in your application. As of this writing, [Google fonts](http://www.google.com/fonts) contains a large collection of open-source fonts you can use for any purpose, including commercial. You can browse the collection and download any fonts you like. Do not import the fonts using Google's instructions, however: those instructions are designed for regular web pages. What you want to do instead is convert the font to a web-ready format and bundle it with your application so that it is not downloaded from the network.

Once you have the files on your computer, there are several sites that can do the conversion for you. Two examples are [Font Squirrel](http://www.fontsquirrel.com/tools/webfont-generator) and [Font2Web](http://www.font2web.com/). Simply take the output from one of those sites, include it in your application and link to it like any other .css file.

**NOTE: Rendering too many different fonts on the same page requires a significant amount of processing resources and can make your application feel slow. Try to limit the amount of fonts, especially on Windows Mobile devices. **

Now that the font is available for use in your application, you have two options to start using it: one is to manually create a .css file and use the `font-family` property to manually assign the font to particular elements in your application. This gives you the most flexibility and control, at the expense of added complexity. The most straightforward option, and what was used in KitchenSink 4, is to use jQuery Mobile's [ThemeRoller](http://jquerymobile.com/themeroller/?ver=1.3.1) to build a custom jQuery Mobile theme. In the theme settings column, open "Font Family" and enter `Open Sans`. That will set the default font for the whole application.

If you want to experiment with changing the look of KitchenSink, import `public/jqmobile/rms40.css` into ThemeRoller (there is a button at the top of the page labeled "Import or upgrade") and play with the different colors and settings. Once you like the preview, download your new theme and overwrite the .css file with your new version. Make sure the jQuery Mobile version selector in ThemeRoller is set to match the version included with KitchenSink (currently 1.3.1)


## Related reading

* [App architecture](appdesign)
* [User Interface architecture](uichoices)