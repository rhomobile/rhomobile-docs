#Sip


## Overview
The SIP API controls whether the default software input panel (SIP) is displayed on the Android Device.
## Enabling the API
There are two ways to enable Enterprise Browser APIs: 

* Include all 'ebapi' modules
* Include only the API modules you need

Both methods are explained below. 

Either way, the included files will be from: 
`/Enterprise Browser/JavaScript Files/Enterprise Browser`,
a directory on the computer that contains the Enterprise Browser installation.

### Include all JS API modules
To include all JavaScript APIs, copy the `ebapi-modules.js` file to a location accessible by your app's files and include the JavaScript modules file in your app. For instance, to include the modules file in your `index.html`, copy the file to the same directory as your index.html and add the following line to the HEAD section of your index.html file:

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi-modules.js"></script>

> This will define the EB class within the page. **Note that the path for this file is relative to the current page** (index.html). Any page on which the modules are required will need to have the required .js file(s) included in this fashion.

### Include only the modules you need

To include individual APIs, you must first include the `ebapi.js` in your HTML, and then the additional required API file(s). For instance, to use the SIP API, add the following code to the HTML file(s). Again, this assumes that relevant API files have been copied to the same directory as the HTML.

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi.js"></script>
    <script type="text/javascript" charset="utf-8" src="eb.sip.js"></script>

> In the code lines above, notice that `ebapi.js` is included first, followed by `eb.sip.js`, which is the SIP API for Enterprise Browser. **This coding is required on each HTML page whenever an individual API will be called from that page**.

        


##Methods



### hide()
Hides the default software keyboard.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Sip.hide()</code> 


### show()
Displays the default software keyboard on the device.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.Sip.show()</code> 


##Remarks



###Focus on calling show method

                    
Focus on input field will not be reflected automatically when show method of SIP module is called.
                    
                

###Software keyboard behavior after hide method

                    
The hide method does not permanently disable the SIP, but simply hides it until the focus returns to a text input field, which causes it to reappear. 
                    
                