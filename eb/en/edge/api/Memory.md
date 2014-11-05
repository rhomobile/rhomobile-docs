#Memory


## Overview
The Memory Module is used to to retrieve the current available memory or notification of memory dropping below a user defined value.

## Enabling the API
In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* elements.js 

> Note - this file either needs to be on the device in a relative folder from where your HTML page is, or it must be copied to your web server appropriately.

    :::html
    <script type="text/javascript" charset="utf-8" src="elements.js"></script>;


### API Usage
This API does not use the `EB` namespace. It is simply referenced using the API name:

	:::javascript
	memory.getMemoryStats();

##Events
To handle events, you assign a string value to the event name that represents a function name or javascript statement to execute.

### memoryEvent 
The memoryEvent event is triggered when the available Memory drops below the set value.

####Callback Parameters

* totalMemory - The total memory in the device, specified in KB.
* availMemory - The available memory in the device, specified in KB

####Usage  
	:::javascript
	memory.memoryEvent = "url('JavaScript:getMemory(%json);')";
  	
  	function getMemory(params)
    {
        alert("Total Memory: " + params.totalMemory + "KB, Avail Memory: " + params.availMemory + "KB");        
        memory.lowMemThreshold  = params.totalMemory / 10;
        memory.memoryEvent = "onLowMemory(%json);";     
    } 

    function onLowMemory(params)
    {
        alert("The device is running low on memory, only " + params.availMemory + "KB is left on the device");          
    }


##Methods

### getMemoryStats()
This returns the current status of the device such as total memory and available memory via memoryEvent definition.

####Returns
* Void

####Platforms

* Windows Mobile/CE

##Properties

###lowMemThreshold

####Type
<span class='text-info'>INTEGER</span> 
####Description
The minimum amount of available memory, specified in KB.

### Possible Values

* Values in KB - Default: 10% of the total memory 

####Platforms

* Windows Mobile/CE

