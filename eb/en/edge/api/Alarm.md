# Alarm
## Overview
The Alarm API is used to set an alarm and register an action to perform when that alarm fires.

## Enabling the API
In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* elements.js 

> Note - this file either needs to be on the device in a relative folder from where your HTML page is, or it must be copied to your web server appropriately.

	:::html
    <script type="text/javascript" charset="utf-8" src="elements.js"></script>;

### API Usage
This API does not use the `EB` namespace. It is simply referenced using the API name:

	:::javascript
	alarm.clear();

## Events
To handle events, you assign a string value to the event name that represents a function name or javascript statement to execute.

### alarmTriggered 
The alarm triggered event will be fired when either the alarm time reaches that specified in the ‘Time’ parameter or the period specified in ‘Interval’ expires. There are no parameters associated with the AlarmTriggered event..

#### Callback Parameters
None

	:::javascript
	alarm.alarmTriggered = "alert('Alarm Fired')";
	
	// this function does not have callback return parameters
	// if it did, we would use the %json notation
	alarm.alarmTriggered = "doFunction(%json)";

## Methods
### clear()
Clears the currently set alarm.

#### Returns
* Void

#### Platforms

* Android
* Windows Mobile/CE

### set()
Sets the alarm. The alarm will fire after the specified interval or at the specified time (see the properties section). You can only have one active alarm at a time.

#### Returns
* Void

#### Platforms

* Android
* Windows Mobile/CE

## Properties
### interval
#### Type
<span class='text-info'>STRING</span> - Alarm Interval in the format HH-MM-SS

#### Description
Sets a time after which the Alarm will fire. The delay cannot be set to less that 30 seconds, if a value of less than 30 seconds is supplied, the delay will be defaulted to 30 seconds.

#### Platforms

* Android
* Windows Mobile/CE

### repeat
#### Type
<span class='text-info'>BOOLEAN</span> -True/**False**

#### Description
Provided the alarm has been set using the Interval parameter the alarm will be reset once fired. If the alarm is set using the 'Time' parameter then this value is ignored.

#### Platforms

* Android
* Windows Mobile/CE

### time
#### Type
<span class='text-info'>STRING</span> - Time in the format "YYYY-MM-DDtHH-MM-SStzd" (e.g. "2009-11-19t11-56-00+01-00"), See Remarks

#### Description
Sets the alarm to trigger at the specified time.

#### Platforms

* Android
* Windows Mobile/CE

## Remarks
### Validity of registered action on Alarm Triggered
Uniquely for an Enterprise Browser event the registered action for the AlarmTriggered event does not get cleared when you navigate away from the current page. If using a JavaScript function, you must ensure the script is still valid when the alarm fires or alternatively you can clear the alarm.

### Minimum Time Interval
The Alarm is not designed to be triggered for intervals less than 30 seconds, if you require a shorter delay then consider using the JavaScript function ‘SetTimeout’.

### Explanation of Time Format
You must specify the time in GMT and then the device's timezone offset from that. E.g. a time expressed as 2012-07-27t08-30-00-05-00 breaks down as follows:

>Assuming a device with timezone offset -5 hours
>This alarm will fire at 8:30am (local time) on 27th July 2012
>
>* Year: 2012
>* Month: July
>* Day: 27th
>* Time: 13:30 exactly (GMT)
>* Timezone: -5 (Eastern Time, 8:30am local time)