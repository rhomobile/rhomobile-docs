#Process


## Overview
This API is used to either navigate to a URL or call a javascript function when an attached card reader decodes data. Only the foreground application is given access to the card reader hardware, when an application is sent to the background its state will be saved and it will automatically relinquish control of the card reader. When brought back to the foreground, an application previously using the card reader will have its previous configuration (eg. pinTimeout) reapplied to the card reader automatically.
## Enabling the API
In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* ebapi-modules.js - this file contains all available Enterprise Browser APIs

If you wish to minimize the amount of JavaScript being included, you can choose to only include the individual API that your application is using:

ex:

* ebapi.js - core APIs needed 
* eb.process.js - just the Process API
* other individual JavaScript files included with the Enterprise Browser installation

        


##Methods



### closeHandle()
<p>Close process handle.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.closeHandle()</code>

### getProcessExitCode()
<p>GetProcessExitCode.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></p><ul></ul>

####Returns
Synchronous Return:

* INTEGER : 
<p>Process exit code.</p>


####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.getProcessExitCode()</code>

### runApplication(<span class="text-info">STRING</span> appName, <span class="text-info">STRING</span> params, <span class="text-info">BOOLEAN</span> blockingCall)
<p>Run an application.</p>


####Parameters
<ul><li>appName : <span class='text-info'>STRING</span><p>
<p>The name of the application on the device to run.</p>
 </p></li><li>params : <span class='text-info'>STRING</span> <span class='label label-info'>Optional</span><p>
<p>The name of the application on the device to run.</p>
 </p></li><li>blockingCall : <span class='text-info'>BOOLEAN</span> <span class='label label-info'>Optional</span><p>
<p>The name of the application on the device to run.</p>
 
<p>False by default.</p>
</p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>SELF_INSTANCE</span></p><ul></ul>

####Returns
Synchronous Return:

* SELF_INSTANCE : 
<p>Process object.</p>


####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Process.runApplication(<span class="text-info">STRING</span> appName, <span class="text-info">STRING</span> params, <span class="text-info">BOOLEAN</span> blockingCall)</code> 


### waitForApplication()
<p>WaitForApplication.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.waitForApplication()</code>