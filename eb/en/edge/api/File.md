#RhoFile


## Overview
This API provides several methods for access to files and folders found on the device's local file system. Use this API to access local files for reading and writing. Only string data can be read and written with this API. Please note that binary files are not supported. Strings filled with \0 will be truncated to the last non \0 character.
## Enabling the API
There are two methods of enabling the RhoFile API:

* Include all ebapi modules or
* Include only the API modules you need

For either of these methods, you'll need to include files from the `/Enterprise Browser/JavaScript Files/Enterprise Browser` directory on the computer that you installed the Enterprise Browser.

### Include all JS API modules
To include all JS APIs, you must copy the ebapi-modules.js file to a location accessible by your app's files and include the JavaScript file in your app. For instance, to include the modules file in your index.html, with the file in the same directory as your index.html, you would add the following line to the <head> section of your index.html:

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi-modules.js"></script>

> Note: that the pathing for this file is relative to the current page.

This will define the EB class within the page. Any page you need to use the modules will need to have the .js file included in this fashion.

### Include only the modules you need
To include single APIs, you must first include the `ebapi.js` in your HTML as well as the API file you want to use. For instance, to use the RhoFile API, I would add the following code to my HTML file(s), assuming the API files have been copied to the same directory as the HTML.

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi.js"></script>
    <script type="text/javascript" charset="utf-8" src="eb.file.js"></script>

The ebapi.js file is necessary for all single API inclusions.
    


##Methods



### basename(<span class="text-info">STRING</span> path)
Return basename part for the specified path. Will remove any prefix up to the last path separator ('/' or '\' depending on platform). Example: for path '/full/path/to/file.ext' basename will return 'file.ext'. 

####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>Absolute path for which basename is given. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING : Basename part for the given path.

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoFile.basename(<span class="text-info">STRING</span> path)</code> 


### <span class="label label-inverse"> Destructor</span> close()
Closes file.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method is a destructor and can only be accessed via the object that was created by the `new` constructor. 
	* <code>myObj.close()</code>


### copy(<span class="text-info">STRING</span> from, <span class="text-info">STRING</span> to)
Copies file from "from" (source) to "to" (destination).

####Parameters
<ul><li>from : <span class='text-info'>STRING</span><p>File name to be copied. </p></li><li>to : <span class='text-info'>STRING</span><p>Destination path. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></p><ul></ul>

####Returns
Synchronous Return:

* INTEGER : Error code raised during copy operation. 0 if no error.

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoFile.copy(<span class="text-info">STRING</span> from, <span class="text-info">STRING</span> to)</code> 


### deleteDir(<span class="text-info">STRING</span> path)
Deletes specified directory. The specified directory must be empty to be deleted.

####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>Absolute path to the directory to be deleted. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></p><ul></ul>

####Returns
Synchronous Return:

* INTEGER : Error code raised on directory deletion. 0 on success, -1 otherwise.

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoFile.deleteDir(<span class="text-info">STRING</span> path)</code> 


### deleteFile(<span class="text-info">STRING</span> path)
Deletes file.

####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>Absolute path to the file to be deleted. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></p><ul></ul>

####Returns
Synchronous Return:

* INTEGER : Error code raised on file deletion. 0 on success, -1 otherwise.

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoFile.deleteFile(<span class="text-info">STRING</span> path)</code> 


### deleteRecursive(<span class="text-info">STRING</span> path, <span class="text-info">BOOLEAN</span> leaveRoot)
Deletes all directory contents.

####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>Absolute path to the directory. </p></li><li>leaveRoot : <span class='text-info'>BOOLEAN</span> <span class='label label-info'>Optional</span><span class='label '> Default: false</span><p>Set to true if you only want to delete directory contents, but no the directory itself. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoFile.deleteRecursive(<span class="text-info">STRING</span> path, <span class="text-info">BOOLEAN</span> leaveRoot)</code> 


### dirname(<span class="text-info">STRING</span> path)
Returns directory name part of the specified path.

####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>Absolute path to directory. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING : Directory name.

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoFile.dirname(<span class="text-info">STRING</span> path)</code> 


### exists(<span class="text-info">STRING</span> path)
Checks if specified path exists.

####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>Absolute path to file or directory. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:

* BOOLEAN : True if path exists, otherwise false.

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoFile.exists(<span class="text-info">STRING</span> path)</code> 


### flush()
Flushes all buffered data to the storage media.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.flush()</code>

### getFileSize(<span class="text-info">STRING</span> path)
Returns size of the file.

####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>Absolute path to the file. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></p><ul></ul>

####Returns
Synchronous Return:

* INTEGER : File size in bytes.

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoFile.getFileSize(<span class="text-info">STRING</span> path)</code> 


### isDir(<span class="text-info">STRING</span> path)
Checks if specified path is a directory.

####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>Absolute path of the directory. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:

* BOOLEAN : True if path is a directory. False otherwise.

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoFile.isDir(<span class="text-info">STRING</span> path)</code> 


### isFile(<span class="text-info">STRING</span> path)
Checks if specified path is a file.

####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>Absolute path of the file. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:

* BOOLEAN : True if path is a file, false otherwise.

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoFile.isFile(<span class="text-info">STRING</span> path)</code> 


### isOpened()
Checks if file is opened.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:

* BOOLEAN : True if file is opened, false otherwise.

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.isOpened()</code>

### join(<span class="text-info">STRING</span> p1, <span class="text-info">STRING</span> p2)
Joins two parts of the path considering all necessary path delimiters. I.e.: join('/path/to','file') will return '/path/to/file' 

####Parameters
<ul><li>p1 : <span class='text-info'>STRING</span><p>First part of the path. </p></li><li>p2 : <span class='text-info'>STRING</span><p>Second part of the path. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING : Joined path.

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoFile.join(<span class="text-info">STRING</span> p1, <span class="text-info">STRING</span> p2)</code> 


### listDir(<span class="text-info">STRING</span> path)
Lists all entries of specified directory.

####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>Absolute path to directory. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul></ul>

####Returns
Synchronous Return:

* ARRAY : Array of directory entry names. If directory is empty array of size 0 will be returned.

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoFile.listDir(<span class="text-info">STRING</span> path)</code> 


### makeDir(<span class="text-info">STRING</span> path)
Creates directory with the provided path. If all top-level nodes of the path doesn't exists, directory will not be created.

####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>Path to the new directory. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></p><ul></ul>

####Returns
Synchronous Return:

* INTEGER : Error code raised on directory creation. 0 on success, -1 otherwise.

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoFile.makeDir(<span class="text-info">STRING</span> path)</code> 


### makeDirs(<span class="text-info">STRING</span> path)
Creates directory and all top-level directories if necessary. Subsequent isDir call is necessary to check if path was successfully created.

####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>Absolute path to the directory to be created. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoFile.makeDirs(<span class="text-info">STRING</span> path)</code> 


### <span class="label label-inverse"> Constructor</span>  new EB.RhoFile(<span class="text-info">STRING</span> path, <span class="text-info">INTEGER</span> mode)
Opens file in a mode specified by the "mode" parameter.

####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>Absolute path to the file. </p></li><li>mode : <span class='text-info'>INTEGER</span><p>Mode in which to open the file. </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>Constant: EB.RhoFile.OPEN_FOR_APPEND <br/> String:1</dt><dd>Open file for output at the end of a file. The file is created if it does not exist.</dd><dt>Constant: EB.RhoFile.OPEN_FOR_READ <br/> String:2</dt><dd>Open file for read-only operations. The file must exist.</dd><dt>Constant: EB.RhoFile.OPEN_FOR_WRITE <br/> String:3</dt><dd>Create an empty file for output operations. If a file with the same name already exists, its contents are discarded and the file is treated as a new empty file.</dd><dt>Constant: EB.RhoFile.OPEN_FOR_READ_WRITE <br/> String:4</dt><dd>Open a file for update (both for read and write). The file must exist.</dd></dl></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method is a constructor and can only be accessed via the `new` construct. 
	* <code>var myObj = new EB.RhoFile(<span class="text-info">STRING</span> path, <span class="text-info">INTEGER</span> mode)</code>


### read(<span class="text-info">STRING</span> path)
Reads specified file to a string object.

####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>Absolute path to file. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING : File contents.

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoFile.read(<span class="text-info">STRING</span> path)</code> 


### read(<span class="text-info">INTEGER</span> size)
Reads specified number of characters from current position of the file.

####Parameters
<ul><li>size : <span class='text-info'>INTEGER</span><p>Number of characters to be read. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING : String from current position of file containing specified number of characters.

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.read(<span class="text-info">INTEGER</span> size)</code>

### readAll()
Reads all file contents to the string object.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING : Contents of the file.

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.readAll()</code>

### rename(<span class="text-info">STRING</span> from, <span class="text-info">STRING</span> to)
Renames / moves file.

####Parameters
<ul><li>from : <span class='text-info'>STRING</span><p>Original path / name. </p></li><li>to : <span class='text-info'>STRING</span><p>New path / name. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></p><ul></ul>

####Returns
Synchronous Return:

* INTEGER : Error code raised on move / rename. 0 on success, -1 otherwise.

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoFile.rename(<span class="text-info">STRING</span> from, <span class="text-info">STRING</span> to)</code> 


### seek(<span class="text-info">INTEGER</span> pos)
Sets file position to specified value from the beginning of the file.

####Parameters
<ul><li>pos : <span class='text-info'>INTEGER</span><p>Position within the file. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.seek(<span class="text-info">INTEGER</span> pos)</code>

### size()
Returns file size.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></p><ul></ul>

####Returns
Synchronous Return:

* INTEGER : File size in bytes.

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.size()</code>

### write(<span class="text-info">STRING</span> val)
Writes the provided string at current position in the file.

####Parameters
<ul><li>val : <span class='text-info'>STRING</span><p>String to be written to the file. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></p><ul></ul>

####Returns
Synchronous Return:

* INTEGER : Number of bytes written.

####Platforms

* Android
* Windows Mobile
* Windows CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.write(<span class="text-info">STRING</span> val)</code>