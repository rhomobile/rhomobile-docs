# PowerOn
## Overview
The PowerOn API is used to register to receive an event when the device is resumed from suspend mode.

## Enabling the API
In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* elements.js 

> Note - this file either needs to be on the device in a relative folder from where your HTML page is, or it must be copied to your web server appropriately.

	:::html
	<script type="text/javascript" charset="utf-8" src="elements.js"></script>;


### API Usage
This API does not use the `EB` namespace. It is simply referenced using the API name:

	:::javascript
	powerOn.powerOnEvent = "url('JavaScript:powerOnCallback(%json)';)";

## Events
To handle events, you assign a string value to the event name that represents a function name or JavaScript statement to execute.

### powerOnEvent 
The PowerOnEvent is sent whenever the device is resumed from suspend mode. There is no data associated with this event.

## Remarks

### Example usage
This feature is very useful for security. Navigating to an offline page (file:// protocol) when the device is powered on can be used to request a pin number from the user.

### Use when cradled
Windows Power events will not always be generated when the device is connected to power and instructed to stand by / wake up, though this is dependent on the Operating System in use.