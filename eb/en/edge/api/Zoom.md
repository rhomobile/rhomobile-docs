#Zoom

## Overview
The Zoom Module is used to set the zoom size of the text or page.

## Enabling the API
In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* elements.js 

### API Usage
This API does not use the `EB` namespace. It is simply referenced using the API name:

	:::javascript
	zoom.text = 2;


##Properties

###text

####Type
<span class='text-info'>INTEGER</span> 
####Description
Sets the font size to be displayed on the page, set to 0 for the smallest font and 4 for the largest font.

#### Possible Value

* Number in the range 0 to 4 - Default:2

####Platforms

* Windows Mobile/CE

###page

####Type
<span class='text-info'>FLOAT</span> 
####Description
**Applies to Android with stock webkit and WM/CE with Zebra Webkit**. Sets the zoom factor of the page. Factor 1.0 is no zoom, values less than 1.0 are zoomed out and values greater than 1.0 are zoomed in. On Android, zoom will take effect after a page refresh or page transition. **Not supported on WM/CE with IE engine**. 

#### Possible Value

* Number greater than 0.0 - Default: 1.0

####Platforms

* Android
* Windows Mobile/CE

