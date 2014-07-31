#NativeMenubar


## Overview
The NativeMenubar API lets you customize the Windows Mobile/CE native menu buttons.
## Enabling the API
This API is part of the `coreapi` extension that is included automatically.
    :::ruby
    extensions: ["coreapi"]

## JavaScript Usage
Be sure to review the [JavaScript API Usage](/guide/api_js) guide for important information about using this API in JavaScript.

## Ruby Usage
Be sure to review the [Ruby API Usage](/guide/api_ruby) guide for important information about using this API in Ruby.
        


##Properties



###extraButton

####Type
<span class='text-info'>HASH</span> 
####Description

Defined behavior of the Left menu button for Windows Mobile applications. This takes the same HASH as a menu item {label: 'Left Button', action: 'alert("You pressed the left button")'}. If your menu is using menu items via mainMenu, then be sure to not set an action for the extraButton. Setting an action for the extraButton will cause the mainMenu setting to be ignored. 
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.NativeMenubar.extraButton</code> </li></ul></li></ul>


####Platforms

* Windows Mobile/CE

###extraMenu

####Type
<span class='text-info'>ARRAY</span> 
####Description

The Left menu items for Windows Mobile applications. This defines the list of menu choices when the extraButton is pressed.
####Params
<li><i>Object</i> : <span class='text-info'>HASH</span><p>
Same values as for mainMenu. </p></li>
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.NativeMenubar.extraMenu</code> </li></ul></li></ul>


####Platforms

* Windows Mobile/CE

###mainButton

####Type
<span class='text-info'>HASH</span> 
####Description

Defined behavior of the Right menu button for Windows Mobile applications. This takes the same HASH as a menu item {label: 'Right Button', action: 'javascript: alert("You pressed the right button");'}. If your menu is using menu items via mainMenu, then be sure to not set an action for the mainButton. Setting an action for the mainButton will cause the mainMenu setting to be ignored.
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.NativeMenubar.mainButton</code> </li></ul></li></ul>


####Platforms

* Windows Mobile/CE

###mainMenu

####Type
<span class='text-info'>ARRAY</span> 
####Description

The Right menu items in Windows Mobile applications. This defines the list of menu choices when the mainButton is pressed.
####Params
<li><i>Object</i> : <span class='text-info'>HASH</span><p> </p></li><ul><li>label : <span class='text-info'>STRING</span><p>
Visible label. </p></li><li>action : <span class='text-info'>STRING</span><p>
URL to page which will be loaded into tab. It may be path to Ruby controller action; i.e. '/app/Account' would load the Account index action. For ruby callback use 'callback:/app/Account' Or JavaScript method to call: 'javascript: methodOnTab();'. Or path to html page to load. </p></li><li>disabled : <span class='text-info'>BOOLEAN</span><span class='label '> Default: false</span><p>
Menu item will be displayed as disabled. Platforms:
WM </p></li></ul>
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.NativeMenubar.mainMenu</code> </li></ul></li></ul>


####Platforms

* Windows Mobile/CE

##Examples



###Customize the extra menu

<pre><code>:::javascript
                  
Rho.NativeMenubar.extraButton = {
    label: "Extra"
};

Rho.NativeMenubar.extraMenu = [
  {
      label: "Show alert 1",
      action: javascript:show_alert_1();,
  },
  {
      label: "Show alert 2",
      action: javascript:show_alert_2();,
  },
  {
      label: "Win the lottery",
      disabled: true
  }
];
                  
                 
</code></pre>

###Clear the main menu

<pre><code>:::javascript
                  
function remove_menuitems() {
    Rho.NativeMenubar.mainMenu = [];
}
                  
                 
</code></pre>