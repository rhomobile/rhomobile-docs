#Navbar


## Overview
The NavBar API supports a native navigation bar for iOS devices.
## Enabling the API
In order to use this API you must TBD INSERT Eb specific instructions here

        


##Methods



### create(<span class="text-info">HASH</span> navBarProperties)
Removes the current NavBar and replaces it with this one.

####Parameters
<ul><li>navBarProperties : <span class='text-info'>HASH</span><p>
HASH with NavBar elements. </p></li><ul><li>left : <span class='text-info'>HASH</span><p>
Left button with :action and :label defined. </p></li><ul><li>label : <span class='text-info'>STRING</span><p>
Label for the button. </p></li><li>action : <span class='text-info'>STRING</span><p>
URL to call when button is pressed.It may be path to Ruby controller action; i.e. '/app/Account' would load the Account index action. For ruby callback use 'callback:/app/Account' Or javascript method to call: 'javascript: methodOnButton();'. </p></li></ul><li>right : <span class='text-info'>HASH</span><p>
(optional) Right button with :action and :label defined. </p></li><ul><li>label : <span class='text-info'>STRING</span><p>
Label for the button. </p></li><li>action : <span class='text-info'>STRING</span><p>
URL to call when button is pressed.It may be path to Ruby controller action; i.e. '/app/Account' would load the Account index action. For ruby callback use 'callback:/app/Account' Or javascript method to call: 'javascript: methodOnButton();'. </p></li></ul><li>title : <span class='text-info'>STRING</span><p>
Title of the navigation bar. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Navbar.create(<span class="text-info">HASH</span> navBarProperties)</code> </li></ul></li></ul>

### remove()
Removes the current navigation bar. Does nothing if there is no active navigation bar.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Navbar.remove()</code> </li></ul></li></ul>

### started()
Return true is navbar is started (used only for automatic tests)

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>BOOLEAN</li></ul>

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Navbar.started()</code> </li></ul></li></ul>