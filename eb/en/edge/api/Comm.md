# Comm
## Overview
The Comm Module is used to control the functionality of the devices communication (serial) port; the way the Enterprise Browser interacts with that port and the data it provides.

## Enabling the API
In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* elements.js 

> Note - this file either needs to be on the device in a relative folder from where your HTML page is, or it must be copied to your web server appropriately.

	:::html
    <script type="text/javascript" charset="utf-8" src="elements.js"></script>;


### API Usage
This API does not use the `EB` namespace. It is simply referenced using the API name:

	:::javascript
	comm.open();

## Events
To handle events, you assign a string value to the event name that represents a function name or javascript statement to execute.

### commEvent 
This event is used to read data from the COM port and is triggered in response to a port event. Port events can be one of ‘Chars’, ‘EndChar’ or ‘Time’ as described in the Parameters section. If no CommEvent is defined the associated data is output as keystrokes.

#### Callback Parameters

* data - The data that has been accumulated from the open communications port since the last time data was returned.

#### Usage  
	:::javascript
	comm.endChar = 35;
	comm.commEvent = "url('JavaScript:commCallback(%json);')";
	comm.open();
	
	function commCallback(params){
		alert('Received the following data on the Comm port:' + params['data']);
	}

## Methods
### open()
Opens the COM port using applied settings.

#### Returns

* Void

#### Platforms

* Android
* Windows Mobile/CE

### close()
Closes the currently open COM port, if any.

#### Returns
* Void

#### Platforms

* Android
* Windows Mobile/CE

## Properties
### baudRate
#### Type
<span class='text-info'>INTEGER</span> 

#### Description
Sets the baud rate of the serial port. (not all values are supported on all devices)

### Possible Values

* 110, 300, 600, 1200, 2400, 4800, **9600**, 14400, 19200, 38400, 56000, 57600, 115200, 128000, 256000

#### Platforms

* Android
* Windows Mobile/CE

### dataBits
#### Type
<span class='text-info'>INTEGER</span> - Integers between 5 and 9 inclusive.

#### Description
Sets the number of data bits per word on the device serial port (not all values are supported on all devices).

### Default Value

* 8

#### Platforms

* Android
* Windows Mobile/CE

### stopBits
#### Type
<span class='text-info'>STRING</span> 

#### Description
Sets the number of stop bits per word on the device serial port (not all values are supported on all devices).

### Possible Values

* **1**, 1.5, 2.

#### Platforms

* Android
* Windows Mobile/CE

### parity
#### Type
<span class='text-info'>STRING</span> 

#### Description
Sets the parity check type for the device serial port. (not all values are supported on all devices).

### Possible Values

* Even, Odd, Mark, Space, **No Parity**

#### Platforms

* Android
* Windows Mobile/CE

### handshake
#### Type
<span class='text-info'>STRING</span> 

#### Description
Sets the handshaking for the device serial port. (not all values are supported on all devices).

### Possible Values

* HW - Hardware Handshake
* SW - Software Handshake
* **None** - No handshake

#### Platforms

* Android
* Windows Mobile/CE

### port
#### Type
<span class='text-info'>STRING</span> 

#### Description
Sets the device serial port. (only certain port designations are valid on any given device).

### Possible Values

* The device comm port, in the format COMn. Default = **COM1**

#### Platforms

* Android
* Windows Mobile/CE

### chars
#### Type
<span class='text-info'>INTEGER</span> - Positive Number

#### Description
Data will be received by Enterprise Browser after the specified number of characters have been received over the COM port. Enterprise Browser will receive the data in either a CommEvent or as keystrokes. 'Chars', 'EndChar' and 'Time' are mutually exclusive, see remarks.

### Possible Values

* Positive number

#### Platforms

* Android
* Windows Mobile/CE

### endChar
#### Type
<span class='text-info'>STRING</span>

#### Description
Data will be received by Enterprise Browser after the specified character (or Carriage return + Line Feed) has been received over the COM port. Enterprise Browser will receive the data, minus the final CRLF, in either a CommEvent or as keystrokes. 'Chars', 'EndChar' and 'Time' are mutually exclusive, see remarks.

### Possible Values

* Character code expressed as a decimal or 'CRLF' to specify Carriage return + Line Feed

#### Platforms

* Android
* Windows Mobile/CE

### time
#### Type
<span class='text-info'>INTEGER</span>

#### Description
Data will be received by Enterprise Browser after the specified period of COM port inactivity has elapsed. Enterprise Browser will receive the data in either a CommEvent or as keystrokes. 'Chars', 'EndChar' and 'Time' are mutually exclusive, see remarks.

### Possible Values

* Number of Milliseconds

#### Platforms

* Android
* Windows Mobile/CE

### writeBytes
#### Type
<span class='text-info'>STRING</span>

#### Description
Value is converted to an array of bytes and written to the COM port.

### Possible Values

* A string of bytes, each byte represented as '%hh' where 'h' is a hexidecimal digit. A delimiter is optional and may be any character

#### Platforms

* Android
* Windows Mobile/CE

### writeString
#### Type
<span class='text-info'>STRING</span>

#### Description
Writes the specified string to the COM port.

### Possible Values

* A string.

#### Platforms

* Android
* Windows Mobile/CE

### writeFile
#### Type
<span class='text-info'>STRING</span>

#### Description
The specified file is opened and its contents is written to the COM port.

### Possible Values

* Filename and Path.

#### Platforms

* Android
* Windows Mobile/CE

### autoEnter
#### Type
<span class='text-info'>STRING</span>

#### Description
Provided no CommEvent is defined and the received data is being received as keystrokes each block received will have a CR (Carriage Return) character appended to it.

### Possible Values

* Enabled 
* Disabled.

#### Platforms

* Android
* Windows Mobile/CE

### autoTab
#### Type
<span class='text-info'>STRING</span>

#### Description
Provided no CommEvent is defined and the received data is being received as keystrokes each block received will have a tab character appended to it.

### Possible Values

* Enabled 
* Disabled.

#### Platforms

* Android
* Windows Mobile/CE

## Remarks
### General
If any of the parameters (e.g. BaudRate) are set whilst the COM port is open they will not take effect until the port is closed and reopened again. The parameters ‘Chars’, ‘EndChar’ and ‘Time’ are mutually exclusive and the last one set will take priority when the COM port is next opened.

### AutoEnter and AccelerateKey
The AccelerateKey Meta tag controls the behavior of Accelerate keys on Windows CE, if the Enter key is configured to be non functional then AutoEnter will also appear to not function either