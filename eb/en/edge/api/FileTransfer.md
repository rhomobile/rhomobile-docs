#FileTransfer


## Overview
The FileTransfer Module is used to send or receive files between the local filestore and either an FTP or HTTP site.

## Enabling the API
In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* elements.js 

> Note - this file either needs to be on the device in a relative folder from where your HTML page is, or it must be copied to your web server appropriately.

      :::html
      <script type="text/javascript" charset="utf-8" src="elements.js"></script>;
    
    
### API Usage
This API does not use the `EB` namespace. It is simply referenced using the API name:

	:::javascript
	function downloadFromHTTP()
   	{
      fileTransfer.source = "url('http://myserver/myfile.txt')";
      fileTransfer.destination = "url('file://\\myfile.txt')";
      fileTransfer.transfer();     
   	}

##Events
To handle events, you assign a string value to the event name that represents a function name or javascript statement to execute.

### transferEvent 
Provided the source and destination parameters were valid, the TransferEvent is fired after the transfer has been made. 

####Callback Parameters

* transferResult - Success or failure of the transfer

Using the HTTP protocol:

* 'OK: File Received' is returned; 
* 'destination server message' for HTTP uploads

> Note: when downloading from an HTTP server if the requested file does not exist you may receive 'OK: File received' and the server 404 string placed in your destination file.

Using the FTP protocol:

* 'OK: File Sent'
* 'OK: File Received'
* 'Error':  If there is an error during the transfer and may be followed by the relevant Windows error code; see the log file for more information on the error.
    
    
####Usage  
	:::javascript
	function downloadFromHTTP()
   	{
      fileTransfer.source = "url('http://myserver/myfile.txt')";
      fileTransfer.destination = "url('file://\\myfile.txt')";
      fileTransfer.transferEvent = url("JavaScript:handleResult('%json');");
  	
      fileTransfer.transfer();     
   	}
	
	function handleResult(params){
		alert('Download Result:' + params['transferResult']);
	}


##Methods

### transfer()
Sends or receives the file according to the configured properties.

####Returns
* Void

####Platforms

* Android
* Windows Mobile/CE

##Properties

###destination

####Type
<span class='text-info'>STRING</span> 
####Description
Sets the destination path and name of the file to be transferred. If specifying a URL this should be fully qualified with protocol, port and optionally username and password.

### Possible Values

* URL or a path

####Platforms

* Android
* Windows Mobile/CE

###source

####Type
<span class='text-info'>STRING</span> 
####Description
Sets the source path and name of the file to be transferred. If specifying a URL this should be fully qualified with protocol, port and optionally username and password.

### Possible Values

* URL or a path

####Platforms

* Android
* Windows Mobile/CE

###username

####Type
<span class='text-info'>STRING</span> 
####Description
The username for the HTTP or FTP server if required.

####Platforms

* Android
* Windows Mobile/CE

###password

####Type
<span class='text-info'>STRING</span> 
####Description
The password for the HTTP or FTP server if required.

####Platforms

* Android
* Windows Mobile/CE

###createFolders

####Type
<span class='text-info'>STRING</span> 
####Description
On a filetransfer that results in local file storage, createFolders can automatically create the directory path.

### Possible Values

* True
* **False**

####Platforms

* Android
* Windows Mobile/CE

###overWrite

####Type
<span class='text-info'>STRING</span> 
####Description
On a filetransfer that results in local file storage, OverWrite will overwrite the destination file if it already exists.

### Possible Values

* True
* **False**

####Platforms

* Android
* Windows Mobile/CE

## Remarks
###Default Ports
The default port settings are 80 for HTTP and 21 for FTP.

###Common mistakes
Remember that in Javascript the '\' character is the escape character so to use a backslash in the URL use '\'. This is not the case when specifying the URL via a meta tag where a single '\'' will suffice. See the examples above.

###Setting up a Transfer
File transfer is designed to be configured before any transfer() is made. Once a transfer hs been initiated the parameters can not be guaranteed to be the same for the next transfer, therefore set all non default parameters before starting the transfer.

###Creating a fully qualified URL
The protocol, port number, username (optional) and password (optional) are all derived from the URL string and should be specified in the following manner: [protocol]://[username]:[password@]Server[:Port]FileNameAndPath. FTP Example: ftp://admin:root@192.168.1.1:2500/Folder/file.txt. HTTP Example: http://admin:root@192.168.1.1:8080/Folder/upload.aspx

###Relative URLs
The FileTransfer meta tag also supports relative URLs, for example if the current page’s path is `http://192.168.0.1/myElementsApp/index.html` and you specify 
      <META HTTP-Equiv="FileTransfer" Content="Source:url('../file.xls')">
then the source file will be `http://192.168.0.1/file.xls`. This notation can also be used for FTP upload and file URLs. Note that the relative URL must start with a '.' so to specify a file in the same directory as your application page use `Source:url('./file.xls')`

###Maximum File Size
The maximum file size which can be transferred is about 4MB but is also dependent on the memory available to the device and the transport protocol selected. For file sizes above 2MB on lower memory devices alternate methods for transferring files should be considered.

###Platform differences
Although the file transfer functionality has the same behavior on all supported platforms the vast majority of the times, there might be scenarios where the Android version may return different error codes when compared to the Windows (CE, Mobile) version.

#File transfer result code 
If an invalid username or password are used on an FTP transfer to a remote server the response returned is 0 instead of the expected 12014

