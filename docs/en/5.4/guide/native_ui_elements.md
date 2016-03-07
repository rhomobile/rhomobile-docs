# Using native UI elements

## Overview

Apart from the regular `WebView` component that contains your HTML, CSS and JavaScript code, RhoMobile also includes some platform-native components that make your app act like other applications users are already accustomed to. When used properly, these components help you make navigation easier, improve accessibility and shorten the learning curve for your users.

## NativeTabbar

By default, there is only one `WebView` component in a RhoMobile application. On startup, it loads the `start_path` url specified in `rhoconfig.txt` and displays the corresponding HTML. However, it is possible to have more than one `WebView` in the same application: `NativeTabbar` allows you to create several independent `WebView`s, each inside its own tab and selectable by the user.

**NOTE: On Windows Mobile, NativeTabbar, despite the name, does not actually show any visible tabs. In order to switch tabs, you must do it in code**

### Usage

`NativeTabbar`s can be created and removed dynamically at runtime. To create a `NativeTabbar`, invoke [NativeTabbar.create](../api/NativeTabbar#mcreate) with the appropriate parameters:

* An array of tabs, with each element describing one of the tabs
* Global tab properties
* A callback function to be invoked when the user switches tabs

Ruby:

	:::ruby
    Rho::NativeTabbar.create(
    	# Tabs array
	    [
	    	# First tab - we have specified our application's start path but it could be anything
			{
	    		:label => "Home",
	    		:action => Rho::Application.startURI
			},

			# Second tab - invoke an action in a controller
			{
	    		:label => "Do something",
	    		:action => url_for(:controller => :MyController, :action => :my_action)
			},

			# Third tab - an external site
			{
	    		:label => "example.com",
	    		:action => "http://www.example.com"
			}
	    ],

	    # Global tab properties
	    {
	      		:createOnInit => true
	    },

	    # Callback
    	url_for(:controller => :MyController, :action => :tabbar_callback)
    )

    def tabbar_callback
    	Rho::Notification.showPopup("Switching to tab #{@params["tab_index"]}")
    end


JavaScript:

	:::javascript
    Rho.NativeTabbar.create(
    	// Tabs array
	    [
	    	// First tab - we have specified our application's start path but it could be anything
			{
	    		label  : "Home",
	    		action : Rho.Application.startURI
			},

			// Second tab - invoke an action in a controller
			{
	    		label  : "Do something",
	    		action : "/app/MyController/my_action"
			},

			// Third tab - an external site
			{
	    		label  : "example.com",
	    		action : "http://www.example.com"
			}
	    ],

	    // Global tab properties
	    {
	      		createOnInit : true
	    },

	    // Callback
    	tabbar_callback
    );

    function tabbar_callback(params) {
    	Rho.Notification.showPopup("Switching to tab "+params.tab_index);
    }

![NativeTabbar](http://rhodocs-images.s3.amazonaws.com/guide/native_ui_elements/nativetabbar.png)

Apart from `label` and `action`, there are more properties you can specify for each tab, including `icon` and `disabled` among others. Refer to [NativeTabbar.create](../api/NativeTabbar#mcreate) for the complete list.

Once you have more than one tab and therefore more than one `WebView`, the [WebView API](../api/webview) can be used to control each of them independently. A regular call would be

	:::javascript
	Rho.WebView.navigate("http://www.example.com")

That code does not indicate which `WebView` to operate on, so it applies to whichever `WebView` is currently active. However, you can cause a different `WebView` to be affected instead:

	:::javascript
	// Direct the third WebView to example.com
	Rho.WebView.navigate("http://www.example.com",2)


### Use cases

* An additional tab can provide users with a way to quickly access instructions or cross-reference documentation, as well as help validate data before saving. For example, if your application required users to capture information in different physical locations, you could have the data capture forms in one tab, a map on another and the instructions for the current location on a third tab.

* As can be seen in the example above, the `:action` of a tab does not necessarily have to link to an internal URL in your application. This can be leveraged to provide side-by-side documentation from a website, which can be updated frequently without requiring redeployment of the RhoMobile application.


### Considerations

* Each `NativeTabbar` creates its own `WebView`, which consumes a fair amount of resources. On older devices, mainly on Windows Mobile, this can make the whole application run more slowly, especially if your views are complex. Be sure to test on a physical device to get a feel for the responsiveness of your application.

* If you need tabs to load their contents as soon as they are created, set `createOnInit` to `true`. This will cause your application to slow down while all tabs process their requests, so it should only be used when strictly necessary.

* Before using `NativeTabbar` for navigation, think about the tradeoff of easy access vs losing so much screen real estate on a small screen plus increased memory usage. If it fits your application, create the `NativeTabbar` when needed and call [NativeTabbar.remove](../api/NativeTabbar#mremove) when it is no longer needed, to reclaim the memory and visual space. Normally, `NativeToolbar` and `NavBar` provide a better alternative as navigation controls.

* The `NativeTabbar` in iOS7 includes a few differences from legacy `NativeTabbar`. See the [Differences in iOS7](build_ios#differences-building-for-ios7) section in [building for iOS](build_ios) for details and examples.

## NativeToolbar

A `NativeToolbar` is a container for buttons that remain visible at all times and provide shortcuts to actions in your application.

### Usage

Ruby:
	:::ruby
    Rho::NativeToolbar.create([
    	{
    		:label => "New product",
    		:action => url_for(:action => :new)
    	},
    	{
    		:label => "Home",
    		:action => "home"
    	},
    	{
    		:label => "Refresh",
    		:action => "refresh"
    	},
    	{
	  		:label => "Exit",
	  		:action => "exit"
    	}
	],
	{}
   )

JavaScript:
	:::javascript
    Rho.NativeToolbar.create([
    	{
    		label  : "New product",
    		action :  "/app/Product/new"
    	},
    	{
    		label  : "Home",
    		action : "home"
    	},
    	{
    		label  : "Refresh",
    		action : "refresh"
    	},
    	{
	  		label  : "Exit",
	  		action : "exit"
    	}
	],
	{}
   );

### Use cases

* `NativeToolbar` is ideally suited for operations that may be used frequently. You can use it to provide efficient access to the key actions of your application.

* Different areas of your application may benefit from their own shortcuts. You can create `NativeToolbar`s with specific buttons depending on the section the user is currently browsing. If you are swapping one toolbar for another, you do not need to call `NativeToolbar.remove`, `NativeToolbar.create` will replace the existing toolbar, if any.

### Considerations

* The toolbar does not support scrolling. If you add too many items to the toolbar, some of them will not be accessible by the user.

* Input on a mobile device is prone to error and users will often tap the wrong button. Actions that cannot be undone or that can potentially cause data loss must provide a confirmation dialog before being executed.

* The `NativeToolbar` in iOS7 includes a few differences from legacy `NativeToolbar`. See the [Differences in iOS7](build_ios#differences-building-for-ios7) section in [building for iOS](build_ios) for details and examples.

## NavBar

A `NavBar` is a composite navigation control with two buttons (left, right) and a title, that appears at the top of the screen and uses its two buttons to help the user move through the application.

### Usage

Ruby:
	:::ruby
    Rho::Navbar.create({
      :left => {
        :label => "Home",
        :action => url_for(Rho::Application.startURI)
      },
      :right => {
        :label => "example.com",
        :action => "http://www.example.com"
      },
      :title => "Hello World"
    })

JavaScript:
	:::javascript
    Rho.Navbar.create({
      left : {
        label  : "Home",
        action : "/app"
      },
      right => {
        label  : "example.com",
        action : "http://www.example.com"
      },
      title : "Hello World"
    });


### Use cases

* "back" and "forward" buttons in complex multi-step workflows


### Considerations

* `Navbar` is only available on iOS.

* jQuery Mobile emulates the NavBar and provides an HTML+JavaScript equivalent by default. Do not use both, as that tends to be confusing and waste screen real estate.


## NativeMenubar

The `NativeMenubar` component allows you to interact with the native application menus of the different platforms. Android and Windows Mobile both have a main menu, plus WM has an extra menu that can be leveraged for less-frequently used actions when there are too many items on the main menu.



### Usage

`NativeMenu.mainMenu` and `NativeMenu.extraMenu` are simple arrays where you can add or remove items as required. Each item is represented by a `hash` with the following keys:

* `label` : user-visible text that identifies the item
* `action` : either a callback that will be invoked when the item is selected or one of the predefined special values
* `disabled` : if present, the item will be visible but not selectable

### Example

Ruby:
	:::ruby
    def tweak_menus
        Rho::NativeMenubar.extraButton = {
            :label => "Extra"
        }

        Rho::NativeMenubar.extraMenu = [
          {
            :label => "Show alert 1",
            :action => url_for(:action => :show_alert_1)
          },
          {
            :label => "Show alert 2",
            :action => url_for(:action => :show_alert_2)
          },
          {
            :label => "Win the lottery",
            :disabled => true # sorry! maybe in the next version. Pull requests welcome
          }
        ]

    end

    def show_alert_1
        Rho::Notification.showPopup({
          :message => "This alert was invoked from a NativeMenubar item",
          :buttons => ["OK"]
        })
        render :action => :menubar_menu
    end

    def show_alert_2
      Rho::Notification.showPopup({
        :message => "This is another alert, also called from the NativeMenubar",
        :buttons => ["OK"]
      })
      render :action => :menubar_menu
    end

    def remove_menuitems
        Rho::NativeMenubar.extraMenu = []
        render :action => :menubar_menu
    end


JavaScript:
	:::javascript
    function show_alert_1() {
        alert("This alert was invoked from a NativeMenubar item");
    }

    function show_alert_2() {
        alert("This is another alert, also called from the NativeMenubar");
    }

    function create_menuitems() {
        Rho.NativeMenubar.extraButton = {
            label : "Extra"
        };

        Rho.NativeMenubar.extraMenu = [
        {
          label : "Show alert 1",
          action : show_alert_1,
        },
        {
          label : "Show alert 2",
          action : show_alert_2,
        },
        {
          label : "Win the lottery",
          disabled : true // sorry! maybe in the next version. Pull requests welcome
        }
      ];
    }

    function remove_menuitems() {
        Rho.NativeMenubar.mainMenu = [];
        Rho.NativeMenubar.extraMenu = [];
    }

### Considerations

* Use `NativeMenubar` to provide quick access to frequently-used actions, but do not rely on it to be the only way to access functionality.

* Avoid having more than a few items in a menu. Windows Mobile allows menus to scroll if the number of items does not fit the screen but this process requires very precise aiming and is very prone to error. If you have many actions that are performed with equal frequency, consider adding a single item that takes the user to a new page with larger buttons.


## Predefined actions

The following predefined strings are recognized as values for the `action` key with special meanings:

* `separator` : inserts a separator line between items
* `exit` or `close` : quit the application
* `options` : navigate to the "settings" page as defined in rhoconfig.txt or Application.settingsPageURI
* `home` : navigate to the home page as defined in rhoconfig.txt or Application.startURI
* `refresh` : reload the current page (equivalent to [WebView.refresh](../api/webview#mrefresh))
* `back` : navigate to the previous page (equivalent to [WebView.navigateBack](../api/webview#mnavigateBack))
* `log` : open the log viewer dialog (equivalent to [Log.showLog](../api/Log#mshowLog))
* `fullscreen` : toggle fullscreen mode (equivalent to [WebView.fullScreen](../api/webview#pfullScreen))
* `sync` : invoke [RhoConnectClient.doSync](../api/RhoConnectClient#mdoSync)
* `minimize` : invoke [Application.minimize](../api/Application#mminimize)
* `SIP` : toggle the on-screen virtual keyboard (WM only)


## Related reading

* [NativeTabbar](../api/NativeTabbar)
* [NativeToolbar](../api/NativeToolbar)
* [NativeMenubar](../api/NativeMenubar)
* [WebView](../api/webview)
