#Navbar


## Overview
The NavBar API supports a native navigation bar for iOS devices.
## Enabling the API
In order to use this API you must TBD INSERT Eb specific instructions here

        


##Methods



### create(<span class="text-info">HASH</span> navBarProperties)
<p>Removes the current NavBar and replaces it with this one.</p>


####Parameters
<ul><li>navBarProperties : <span class='text-info'>HASH</span><p>
<p>HASH with NavBar elements.</p>
 </p></li><ul><li>left : <span class='text-info'>HASH</span><p>
<p>Left button with :action and :label defined.</p>
 </p></li><ul><li>label : <span class='text-info'>STRING</span><p>
<p>Label for the button.</p>
 </p></li><li>action : <span class='text-info'>STRING</span><p>
<p>URL to call when button is pressed.It may be path to Ruby controller action; i.e. &lsquo;/app/Account&rsquo; would load the Account index action. For ruby callback use &lsquo;callback:/app/Account&rsquo; Or javascript method to call: &lsquo;javascript: methodOnButton();&rsquo;.</p>
 </p></li></ul><li>right : <span class='text-info'>HASH</span><p>
<p>(optional) Right button with :action and :label defined.</p>
 </p></li><ul><li>label : <span class='text-info'>STRING</span><p>
<p>Label for the button.</p>
 </p></li><li>action : <span class='text-info'>STRING</span><p>
<p>URL to call when button is pressed.It may be path to Ruby controller action; i.e. &lsquo;/app/Account&rsquo; would load the Account index action. For ruby callback use &lsquo;callback:/app/Account&rsquo; Or javascript method to call: &lsquo;javascript: methodOnButton();&rsquo;.</p>
 </p></li></ul><li>title : <span class='text-info'>STRING</span><p>
<p>Title of the navigation bar.</p>
 </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Navbar.create(<span class="text-info">HASH</span> navBarProperties)</code> 


### remove()
<p>Removes the current navigation bar. Does nothing if there is no active navigation bar.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Navbar.remove()</code> 


### started()
<p>Return true is navbar is started (used only for automatic tests)</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:

* BOOLEAN

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Navbar.started()</code> 
