#ScreenOrientation


## Overview
The ScreenOrientation Module is used to control the screen orientation / layout and register to receive an event when it changes.
## Enabling the API
There are two methods of enabling the ScreenOrientation API:

* Include all ebapi modules or
* Include only the API modules you need

For either of these methods, you'll need to include files from the `/Enterprise Browser/JavaScript Files/Enterprise Browser` directory on the computer that you installed the Enterprise Browser.

### Include all JS API modules
To include all JS APIs, you must copy the ebapi-modules.js file to a location accessible by your app's files and include the JavaScript file in your app. For instance, to include the modules file in your index.html, with the file in the same directory as your index.html, you would add the following line to the <head> section of your index.html:

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi-modules.js"></script>

> Note: that the pathing for this file is relative to the current page.

This will define the EB class within the page. Any page you need to use the modules will need to have the .js file included in this fashion.

### Include only the modules you need
To include single APIs, you must first include the `ebapi.js` in your HTML as well as the API file you want to use. For instance, to use the ScreenOrientation API, I would add the following code to my HTML file(s), assuming the API files have been copied to the same directory as the HTML.

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi.js"></script>
    <script type="text/javascript" charset="utf-8" src="eb.screenorientation.js"></script>

The ebapi.js file is necessary for all single API inclusions.

## Persistence
With the old PocketBrowser APIs, any events, such as `screenOrientationEvent` were canceled when a full navigate was performed. The original reason for this was a limitation of the IE engine on WM5 devices. When moving to the common API this was changed so that callbacks are not canceled.
        


##Methods



### leftHanded()
Sets the screen orientation to left-handed orientation. Note the webpage will not reformat in line with the new screen size automatically.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.ScreenOrientation.leftHanded()</code> 


### normal()
Sets the screen orientation to default device orientation.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.ScreenOrientation.normal()</code> 


### rightHanded()
Sets the screen orientation to right-handed orientation. Note the webpage will not reformat in line with the new screen size automatically.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.ScreenOrientation.rightHanded()</code> 


### setScreenOrientationEvent()
Sets the callback to be called when a screen orientation event occurs.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.ScreenOrientation.setScreenOrientationEvent()</code> 


### upsideDown()
Sets the screen orientation to upside down, useful if presenting the device to a customer to obtain a signature.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.ScreenOrientation.upsideDown()</code> 


##Properties



###autoRotate

####Type
<span class='text-info'>BOOLEAN</span> 
####Description
Enables or Disables auto-rotation of the screen orientation when the device is rotated. For Windows Mobile/CE devices, support is limited to only Symbol Technologies devices with IST Sensor support.
####Params
<p><strong>Default:</strong> true</p>
####Access


* Class: This property can only be accessed via the API class object.
	* <code>EB.ScreenOrientation.autoRotate</code>



####Platforms

* Android
* Windows Mobile

##Examples



###Manipulating the Screen Orientation
In this example you'll see how to manipulate the screen orientation and how to receive events when the orientation changes. This example assumes that the ebapi-modules.js file resides in the same folder as the HTML file invoking it.
<pre><code>:::javascript
&lt;head&gt;
    &lt;script type="text/javascript" charset="utf-8" src="ebapi-modules.js"&gt;&lt;/script&gt;

    &lt;title&gt;ScreenOrientation API Test&lt;/title&gt;

    &lt;script&gt;
        function orientationEventCallback(params){
            display.innerHTML = "Orientation: " + params;
        }

        function changeOrientation(direction){
            switch(direction){
                case "left":
                    EB.ScreenOrientation.leftHanded();
                    break;
                case "right":
                    EB.ScreenOrientation.rightHanded();
                    break;
                case "normal":
                    EB.ScreenOrientation.normal();
                    break;
                case "upsideDown":
                    EB.ScreenOrientation.upsideDown();
                    break;
                default:
                    alert('Incorrect Orientation!!');
            }
        }

        function toggleAutoRotate(){
            if(EB.ScreenOrientation.autoRotate){
                EB.ScreenOrientation.autoRotate = false;
                autoRotate.innerHTML = 'Auto Rotate: Disabled';
            }
            else{
                EB.ScreenOrientation.autoRotate = true;
                autoRotate.innerHTML = 'Auto Rotate: Enabled';
            }
        }

        EB.ScreenOrientation.setScreenOrientationEvent(orientationEventCallback);
    &lt;/script&gt;
&lt;/head&gt;

&lt;body&gt;
    &lt;h1&gt;ScreenOrientation API Test&lt;/h1&gt;
    &lt;div id="display"&gt;
        Orientation:
    &lt;/div&gt;
    &lt;div id="autoRotate"&gt;
        Auto Rotate: Enabled
    &lt;/div&gt;
    &lt;div&gt;
        &lt;button onclick="toggleAutoRotate()"&gt;Toggle Auto Rotate&lt;/button&gt;
        &lt;/br&gt;&lt;/br&gt;
        &lt;button onclick="changeOrientation('normal')"&gt;Upright Portrait&lt;/button&gt;&lt;/br&gt;
        &lt;button onclick="changeOrientation('right')"&gt;Counter-Clockwise&lt;/button&gt;
        &lt;button onclick="changeOrientation('left')"&gt;Clockwise&lt;/button&gt;&lt;/br&gt;
        &lt;button onclick="changeOrientation('upsideDown')"&gt;Upside-Down&lt;/button&gt;&lt;/br&gt;
    &lt;/div&gt;
&lt;/body&gt;
                                
                            
</code></pre>