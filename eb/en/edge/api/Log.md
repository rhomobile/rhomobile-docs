#Log


## Overview
 Use this API to control the behavior of the RhoMobile Log API as well as access it.
## Enabling the API
In order to use this API you must TBD INSERT Eb specific instructions here

        


##Methods



### cleanLogFile()
Clean log file, all logged messages will be removed. 

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Log.cleanLogFile()</code> </li></ul></li></ul>

### error(<span class="text-info">STRING</span> message, <span class="text-info">STRING</span> category)
Log message at the Error level.

####Parameters
<ul><li>message : <span class='text-info'>STRING</span><p>
Log message. </p></li><li>category : <span class='text-info'>STRING</span><span class='label '> Default: APP</span><p>
Log category. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Log.error(<span class="text-info">STRING</span> message, <span class="text-info">STRING</span> category)</code> </li></ul></li></ul>

### fatalError(<span class="text-info">STRING</span> message, <span class="text-info">STRING</span> category)
Log message at the FatalError level. Application will be terminated (on all platforms except iOS).

####Parameters
<ul><li>message : <span class='text-info'>STRING</span><p>
Log message. </p></li><li>category : <span class='text-info'>STRING</span><span class='label '> Default: APP</span><p>
Log category. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Log.fatalError(<span class="text-info">STRING</span> message, <span class="text-info">STRING</span> category)</code> </li></ul></li></ul>

### info(<span class="text-info">STRING</span> message, <span class="text-info">STRING</span> category)
Log message at the Info level.

####Parameters
<ul><li>message : <span class='text-info'>STRING</span><p>
Log message. </p></li><li>category : <span class='text-info'>STRING</span><span class='label '> Default: APP</span><p>
Log category. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Log.info(<span class="text-info">STRING</span> message, <span class="text-info">STRING</span> category)</code> </li></ul></li></ul>

### readLogFile(<span class="text-info">INTEGER</span> limit)
Read log file. Returns string from the log file containing specified number of symbols.

####Parameters
<ul><li>limit : <span class='text-info'>INTEGER</span><p>
Maximum size of the resulting string in symbols. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>STRING</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Log.readLogFile(<span class="text-info">INTEGER</span> limit)</code> </li></ul></li></ul>

### sendLogFile()
Send log file to destinationURI property. Please note that this procedure is blocking and will stop any logging while log file is being send.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Log.sendLogFile()</code> </li></ul></li></ul>

### showLog()
Display Log view window.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Log.showLog()</code> </li></ul></li></ul>

### trace(<span class="text-info">STRING</span> message, <span class="text-info">STRING</span> category)
Log message at the Trace level. By default trace messages are not shown in log (if level equals to 1).

####Parameters
<ul><li>message : <span class='text-info'>STRING</span><p>
Log message. </p></li><li>category : <span class='text-info'>STRING</span><span class='label '> Default: APP</span><p>
Log category. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Log.trace(<span class="text-info">STRING</span> message, <span class="text-info">STRING</span> category)</code> </li></ul></li></ul>

### warning(<span class="text-info">STRING</span> message, <span class="text-info">STRING</span> category)
Log message at the Warning level.

####Parameters
<ul><li>message : <span class='text-info'>STRING</span><p>
Log message. </p></li><li>category : <span class='text-info'>STRING</span><span class='label '> Default: APP</span><p>
Log category. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.Log.warning(<span class="text-info">STRING</span> message, <span class="text-info">STRING</span> category)</code> </li></ul></li></ul>

##Properties



###destination

####Type
<span class='text-info'>ARRAY</span> 
####Description

List of log destinations that are being used. Destination could be set to empty (disable all logging), "file" - log just into file specified in (filePath), "stdio" - log into debug debug console, "uri" - send log to the server. Logging to several destinations could be set by setting destination to comma separated list in any order (for example "stdio,file"). By default logging to console can be enabled from rhoconfig.txt (LogToOutput = 1). After Rhodes initialization logging to file is enabled automatically.
####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.Log.DEST_FILE 
	* String: file
	* 
Log is written to a local file on the device (typically rholog.txt)
* Constant: EB.Log.DEST_OUTPUT 
	* String: stdio
	* 
Log is written to the standard output (ex: Android ADB)
* Constant: EB.Log.DEST_URI 
	* String: uri
	* 
Log is written to a remote logger.
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.Log.destination</code> </li></ul></li></ul>


####Platforms

* Android
* Windows Mobile/CE

###destinationURI

####Type
<span class='text-info'>STRING</span> 
####Description

Log server URI where log will be posted by using Rho::Log.sendLogFile or from the log view. Log server source code is open and available at http://github.com/rhomobile/rhologs, so you can deploy your own logserver. URI format: 'http://host:port[/path][?log_name=appName]'. Default value is set in rhoconfig.txt (logserver)
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.Log.destinationURI</code> </li></ul></li></ul>


####Platforms

* Android
* Windows Mobile/CE

###excludeCategories

####Type
<span class='text-info'>STRING</span> 
####Description

Comma-separated list of excluded log categories. Set to '' (empty) to allow all messages to be logged. Set to concrete value to filter out log from those categories. Default value is '' (empty), it is set in rhoconfig.txt (ExcludeLogCategories)
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.Log.excludeCategories</code> </li></ul></li></ul>


####Platforms

* Android
* Windows Mobile/CE

###excludeFilter

####Type
<span class='text-info'>STRING</span> 
####Description

Define exclude parameters log filter(for security reasons) - parameter names separated by comma. It works when user tries to put in log string containing json / urls. Default value is "" (empty). For example, if user set excludeFilter="password", then tries to put in log this string: "{"user":"alex","password":"abcdef","sessionid":123456}", "abcdef" will not appear in log.
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.Log.excludeFilter</code> </li></ul></li></ul>


####Platforms

* Android
* Windows Mobile/CE

###filePath

####Type
<span class='text-info'>STRING</span> 
####Description

Path to the log file including file name. The path is relative to the platform specific application root or start if from '/' if you wish to store elsewhere ('/mnt/sdcard/myapp.log').  Default file path is "rholog.txt"
####Params
<p><strong>Default:</strong> rholog.txt</p>
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.Log.filePath</code> </li></ul></li></ul>


####Platforms

* Android
* Windows Mobile/CE

###fileSize

####Type
<span class='text-info'>INTEGER</span> 
####Description

Maximum log file size in bytes, set 0 to unlimited size; when limit is reached, log wraps to beginning of file. Default value is 50000, it is set in rhoconfig.txt (MaxLogFileSize)
####Params
<p><strong>Default:</strong> 50000</p>
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.Log.fileSize</code> </li></ul></li></ul>


####Platforms

* Android
* Windows Mobile/CE

###includeCategories

####Type
<span class='text-info'>STRING</span> 
####Description

Comma-separated list of included log categories. Set to '*' to log all categories. Set to '' (empty) to filter out all messages. Default value is '*', it is set in rhoconfig.txt (LogCategories).
####Params
<p><strong>Default:</strong> *</p>
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.Log.includeCategories</code> </li></ul></li></ul>


####Platforms

* Android
* Windows Mobile/CE

###level

####Type
<span class='text-info'>INTEGER</span> 
####Description

The current logging level. Minimal severity level of messages that will appear in log. When level is set to 0 any messages will be logged. When level is set to 4 only fatal error messages will be logged. Default value is defined in rhoconfig.txt (MinSeverity) 
####Values

<strong>Possible Values</strong> (<span class='text-info'>STRING</span>):
 
* Constant: EB.Log.LEVEL_TRACE 
	* String: 0
	* 
Everything will be logged. Also see settings for controlling log size.
* Constant: EB.Log.LEVEL_INFO 
	* String: 1
	* 
Information level logs and above will be shown.
* Constant: EB.Log.LEVEL_WARNING 
	* String: 2
	* 
Warnings and above will only be shown.
* Constant: EB.Log.LEVEL_ERROR 
	* String: 3
	* 
Error level log messages and above will be shown.
* Constant: EB.Log.LEVEL_FATAL 
	* String: 4
	* 
Fatal level log messages and above will be shown.
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.Log.level</code> </li></ul></li></ul>


####Platforms

* Android
* Windows Mobile/CE

###memoryPeriod

####Type
<span class='text-info'>INTEGER</span> 
####Description

Enables the logging of memory usage in the system; specifies the time interval in milliseconds at which memory logs will be generated periodically. Setting it to 0 will disable logging memory information.
####Params
<p><strong>Default:</strong> 0</p>
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.Log.memoryPeriod</code> </li></ul></li></ul>


####Platforms

* Android
* Windows Mobile/CE

###netTrace

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

Turn on local http server traces. Traces contain information about connection process, sent and received headers and data. Please note that this parameter will not take an effect in case of remote server app (and / or shared runtime). Default value can be overridden by the setting in rhoconfig.txt (net_trace) 
####Params
<p><strong>Default:</strong> false</p>
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.Log.netTrace</code> </li></ul></li></ul>


####Platforms

* Android

###skipPost

####Type
<span class='text-info'>BOOLEAN</span> 
####Description

Skip http package body from log(for security reasons). Please note that this parameter will not take an effect in case of remote server app (and / or shared runtime), no log will appear in this case. 
####Params
<p><strong>Default:</strong> false</p>
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.Log.skipPost</code> </li></ul></li></ul>


####Platforms

* Android
* Windows Mobile/CE