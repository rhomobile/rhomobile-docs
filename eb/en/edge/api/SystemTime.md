#SystemTime


## Overview
The SystemTime Module is used to set the device clock, set the timezone, or synchronize it with a network SNTP server.

## Enabling the API
In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* elements.js 

### API Usage
This API does not use the `EB` namespace. It is simply referenced using the API name:

	:::javascript
	systemTime.SntpServerIP = '152.76.203.89';

##Properties

###setLocal

####Type
<span class='text-info'>STRING</span> 
####Description
Local Time String in the format `<YYYY>-<MM>-<DD>T<HH>-<MM>-<SS><+/-><HH offset from UTC>-<MM offset from UTC>`. The offset from UTC is optional.

#### Possible Value

* Local Time String i.e. `2011-12-25T09-57-00+01-00` or `2011-12-25T09-57-00`

####Platforms

* Windows Mobile/CE

###setUtc

####Type
<span class='text-info'>STRING</span> 
####Description
UTC Time String in the format `<YYYY>-<MM>-<DD>T<HH>-<MM>-<SS><+/-><HH offset from UTC>-<MM offset from UTC>`. The offset from UTC is optional.

#### Possible Value

* UTC Time String i.e. `2011-12-25T09-57-00+01-00` or `2011-12-25T09-57-00`

####Platforms

* Windows Mobile/CE


##Remarks

###Latency
Once the SntpServerIP tag is parsed Enterprise Browser will request the time from the SNTP server immediately, however the clock will not be updated until a response is received. Network latency and connectivity issues can all affect the speed and success with which this tag is actioned.

###Proxy Settings
Windows Mobile 5.0 or above will not allow you to obtain SNTP time when requesting via a proxy server, it is recommended the proxy is bypassed for this to work.

###Time Zone
The Time Zone location string (Windows CE) is not supported. The timezone offset from GMT will be correctly set, but the geographical location will not be set.



