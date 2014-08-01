#RhoFile


## Overview
This API provides several methods for access to files and folders found on the device's local file system.
## Enabling the API
In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* ebapi-modules.js - this file contains all available Enterprise Browser APIs

If you wish to minimize the amount of JavaScript being included, you can choose to only include the individual API that your application is using:

ex:

* ebapi.js - core APIs needed 
* eb.rhofile.js - just the File API
* other individual JavaScript files included with the Enterprise Browser installation

        


##Methods



### basename(<span class="text-info">STRING</span> path)
<p>Return basename part for the specified path. Will remove any prefix up to the last path separator (&lsquo;/&rsquo; or &lsquo;\&rsquo; depending on platform). Example: for path &lsquo;/full/path/to/file.ext&rsquo; basename will return &lsquo;file.ext&rsquo;.</p>


####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>
<p>Absolute path for which basename is given.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING : 
<p>Basename part for the given path.</p>


####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoFile.basename(<span class="text-info">STRING</span> path)</code> 


### <span class="label label-inverse"> Destructor</span> close()
<p>Closes file.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method is a destructor and can only be accessed via the object that was created by the `new` constructor. 
	* <code>myObj.close()</code>


### copy(<span class="text-info">STRING</span> from, <span class="text-info">STRING</span> to)
<p>Copies file from &ldquo;from&rdquo; (source) to &ldquo;to&rdquo; (destination).</p>


####Parameters
<ul><li>from : <span class='text-info'>STRING</span><p>
<p>File name to be copied.</p>
 </p></li><li>to : <span class='text-info'>STRING</span><p>
<p>Destination path.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></p><ul></ul>

####Returns
Synchronous Return:

* INTEGER : 
<p>Error code raised during copy operation. 0 if no error.</p>


####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoFile.copy(<span class="text-info">STRING</span> from, <span class="text-info">STRING</span> to)</code> 


### deleteDir(<span class="text-info">STRING</span> path)
<p>Deletes specified directory. The specified directory must be empty to be deleted.</p>


####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>
<p>Absolute path to the directory to be deleted.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></p><ul></ul>

####Returns
Synchronous Return:

* INTEGER : 
<p>Error code raised on directory deletion. 0 on success, -1 otherwise.</p>


####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoFile.deleteDir(<span class="text-info">STRING</span> path)</code> 


### deleteFile(<span class="text-info">STRING</span> path)
<p>Deletes file.</p>


####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>
<p>Absolute path to the file to be deleted.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></p><ul></ul>

####Returns
Synchronous Return:

* INTEGER : 
<p>Error code raised on file deletion. 0 on success, -1 otherwise.</p>


####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoFile.deleteFile(<span class="text-info">STRING</span> path)</code> 


### deleteRecursive(<span class="text-info">STRING</span> path, <span class="text-info">BOOLEAN</span> leaveRoot)
<p>Deletes all directory contents.</p>


####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>
<p>Absolute path to the directory.</p>
 </p></li><li>leaveRoot : <span class='text-info'>BOOLEAN</span> <span class='label label-info'>Optional</span><span class='label '> Default: false</span><p>
<p>Set to true if you only want to delete directory contents, but no the directory itself.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoFile.deleteRecursive(<span class="text-info">STRING</span> path, <span class="text-info">BOOLEAN</span> leaveRoot)</code> 


### dirname(<span class="text-info">STRING</span> path)
<p>Returns directory name part of the specified path.</p>


####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>
<p>Absolute path to directory.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING : 
<p>Directory name.</p>


####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoFile.dirname(<span class="text-info">STRING</span> path)</code> 


### exists(<span class="text-info">STRING</span> path)
<p>Checks if specified path exists.</p>


####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>
<p>Absolute path to file or directory.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:

* BOOLEAN : 
<p>True if path exists, otherwise false.</p>


####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoFile.exists(<span class="text-info">STRING</span> path)</code> 


### flush()
<p>Flushes all buffered data to the storage media.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.flush()</code>

### getFileSize(<span class="text-info">STRING</span> path)
<p>Returns size of the file.</p>


####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>
<p>Absolute path to the file.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></p><ul></ul>

####Returns
Synchronous Return:

* INTEGER : 
<p>File size in bytes.</p>


####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoFile.getFileSize(<span class="text-info">STRING</span> path)</code> 


### isDir(<span class="text-info">STRING</span> path)
<p>Checks if specified path is a directory.</p>


####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>
<p>Absolute path of the directory.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:

* BOOLEAN : 
<p>True if path is a directory. False otherwise.</p>


####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoFile.isDir(<span class="text-info">STRING</span> path)</code> 


### isFile(<span class="text-info">STRING</span> path)
<p>Checks if specified path is a file.</p>


####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>
<p>Absolute path of the file.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:

* BOOLEAN : 
<p>True if path is a file, false otherwise.</p>


####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoFile.isFile(<span class="text-info">STRING</span> path)</code> 


### isOpened()
<p>Checks if file is opened.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:

* BOOLEAN : 
<p>True if file is opened, false otherwise.</p>


####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.isOpened()</code>

### join(<span class="text-info">STRING</span> p1, <span class="text-info">STRING</span> p2)
<p>Joins two parts of the path considering all necessary path delimiters. I.e.: join(&lsquo;/path/to&rsquo;,&lsquo;file&rsquo;) will return &lsquo;/path/to/file&rsquo;</p>


####Parameters
<ul><li>p1 : <span class='text-info'>STRING</span><p>
<p>First part of the path.</p>
 </p></li><li>p2 : <span class='text-info'>STRING</span><p>
<p>Second part of the path.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING : 
<p>Joined path.</p>


####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoFile.join(<span class="text-info">STRING</span> p1, <span class="text-info">STRING</span> p2)</code> 


### listDir(<span class="text-info">STRING</span> path)
<p>Lists all entries of specified directory.</p>


####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>
<p>Absolute path to directory.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul></ul>

####Returns
Synchronous Return:

* ARRAY : 
<p>Array of directory entry names. If directory is empty array of size 0 will be returned.</p>


####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoFile.listDir(<span class="text-info">STRING</span> path)</code> 


### makeDir(<span class="text-info">STRING</span> path)
<p>Creates directory with the provided path. If all top-level nodes of the path doesn&rsquo;t exists, directory will not be created.</p>


####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>
<p>Path to the new directory.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></p><ul></ul>

####Returns
Synchronous Return:

* INTEGER : 
<p>Error code raised on directory creation. 0 on success, -1 otherwise.</p>


####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoFile.makeDir(<span class="text-info">STRING</span> path)</code> 


### makeDirs(<span class="text-info">STRING</span> path)
<p>Creates directory and all top-level directories if necessary. Subsequent isDir call is necessary to check if path was successfully created.</p>


####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>
<p>Absolute path to the directory to be created.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoFile.makeDirs(<span class="text-info">STRING</span> path)</code> 


### <span class="label label-inverse"> Constructor</span>  new EB.RhoFile(<span class="text-info">STRING</span> path, <span class="text-info">INTEGER</span> mode)
<p>Opens file in a mode specified by the &ldquo;mode&rdquo; parameter.</p>


####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>
<p>Absolute path to the file.</p>
 </p></li><li>mode : <span class='text-info'>INTEGER</span><p>
<p>Mode in which to open the file.</p>
 </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>Constant: EB.RhoFile.OPEN_FOR_APPEND <br/> String:1</dt><dd>
<p>Open file for output at the end of a file. The file is created if it does not exist.</p>
</dd><dt>Constant: EB.RhoFile.OPEN_FOR_READ <br/> String:2</dt><dd>
<p>Open file for read-only operations. The file must exist.</p>
</dd><dt>Constant: EB.RhoFile.OPEN_FOR_WRITE <br/> String:3</dt><dd>
<p>Create an empty file for output operations. If a file with the same name already exists, its contents are discarded and the file is treated as a new empty file.</p>
</dd><dt>Constant: EB.RhoFile.OPEN_FOR_READ_WRITE <br/> String:4</dt><dd>
<p>Open a file for update (both for read and write). The file must exist.</p>
</dd></dl></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method is a constructor and can only be accessed via the `new` construct. 
	* <code>var myObj = new EB.RhoFile(<span class="text-info">STRING</span> path, <span class="text-info">INTEGER</span> mode)</code>


### read(<span class="text-info">STRING</span> path)
<p>Reads specified file to a string object.</p>


####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>
<p>Absolute path to file.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING : 
<p>File contents.</p>


####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoFile.read(<span class="text-info">STRING</span> path)</code> 


### read(<span class="text-info">INTEGER</span> size)
<p>Reads specified number of characters from current position of the file.</p>


####Parameters
<ul><li>size : <span class='text-info'>INTEGER</span><p>
<p>Number of characters to be read.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING : 
<p>String from current position of file containing specified number of characters.</p>


####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.read(<span class="text-info">INTEGER</span> size)</code>

### readAll()
<p>Reads all file contents to the string object.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:

* STRING : 
<p>Contents of the file.</p>


####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.readAll()</code>

### rename(<span class="text-info">STRING</span> from, <span class="text-info">STRING</span> to)
<p>Renames / moves file.</p>


####Parameters
<ul><li>from : <span class='text-info'>STRING</span><p>
<p>Original path / name.</p>
 </p></li><li>to : <span class='text-info'>STRING</span><p>
<p>New path / name.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></p><ul></ul>

####Returns
Synchronous Return:

* INTEGER : 
<p>Error code raised on move / rename. 0 on success, -1 otherwise.</p>


####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Class Method: This method can only be accessed via the API class object. 
	* <code>EB.RhoFile.rename(<span class="text-info">STRING</span> from, <span class="text-info">STRING</span> to)</code> 


### seek(<span class="text-info">INTEGER</span> pos)
<p>Sets file position to specified value from the beginning of the file.</p>


####Parameters
<ul><li>pos : <span class='text-info'>INTEGER</span><p>
<p>Position within the file.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:

* Void

####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.seek(<span class="text-info">INTEGER</span> pos)</code>

### size()
<p>Returns file size.</p>


####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></p><ul></ul>

####Returns
Synchronous Return:

* INTEGER : 
<p>File size in bytes.</p>


####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.size()</code>

### write(<span class="text-info">STRING</span> val)
<p>Writes the provided string at current position in the file.</p>


####Parameters
<ul><li>val : <span class='text-info'>STRING</span><p>
<p>String to be written to the file.</p>
 </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></p><ul></ul>

####Returns
Synchronous Return:

* INTEGER : 
<p>Number of bytes written.</p>


####Platforms

* Android
* Windows Mobile/CE

####Method Access:

* Instance Method: This method can be accessed via an instance object of this class: 
	* <code>myObject.write(<span class="text-info">STRING</span> val)</code>