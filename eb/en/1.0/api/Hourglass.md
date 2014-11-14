#Hourglass

## Overview
The Hourglass Module is used to show or hide the hourglass (wait cursor) as well as adjust its position.

## Enabling the API
In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* elements.js 

> Note - this file either needs to be on the device in a relative folder from where your HTML page is, or it must be copied to your web server appropriately.

	:::html
    <script type="text/javascript" charset="utf-8" src="elements.js"></script>;


### API Usage
This API does not use the `EB` namespace. It is simply referenced using the API name:

	:::javascript
	hourglass.visibility = 'visible';


##Properties

###visibility

####Type
<span class='text-info'>STRING</span> 
####Description
Shows or hides the hourglass.

#### Possible Value

* visible
* **hidden**

####Platforms

* Android
* Windows Mobile/CE

###left

####Type
<span class='text-info'>INTEGER</span> - Positive number, representing pixels

####Description
Sets the horizontal position of the hourglass.

###Possible Values

* Horizontal position, in pixels - Default = center of screen

####Platforms

* Android
* Windows Mobile/CE

###top

####Type
<span class='text-info'>INTEGER</span> - Positive number, representing pixels
####Description
Sets the vertical position of the hourglass.

###Possible Values

* Vertical position, in pixels - Default = center of screen

####Platforms

* Android
* Windows Mobile/CE

## Remarks
###Navigation
When navigating between pages the hourglass will be shown and hidden automatically and will override the current visibility settings. The position the hourglass is shown at during page loads will be as set using the Left / Top properties. Because the Hourglass is shown and hidden automatically during page loads it is not recommended to use static meta tags to show or hide it, in preference use InvokeMETATag from JavaScript.

###Scrolling
The hourglass is not compatible with scrolling the browser window. The spinning cursor will move with the HTML page.

