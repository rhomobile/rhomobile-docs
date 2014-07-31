#RhoFile


## Overview
File I/OUse this API to access local files for reading and writing. Only string data can be read and written with this API. Please note that binary files are not supported. Strings filled with \0 will be truncated to the last non \0 character. 
## Enabling the API
This API is part of the `coreapi` extension that is included automatically.
    :::ruby
    extensions: ["coreapi"]

## JavaScript Usage
Be sure to review the [JavaScript API Usage](/guide/api_js) guide for important information about using this API in JavaScript.

## Ruby Usage
Be sure to review the [Ruby API Usage](/guide/api_ruby) guide for important information about using this API in Ruby.
  


##Methods



### basename(<span class="text-info">STRING</span> path)
Return basename part for the specified path. Will remove any prefix up to the last path separator ('/' or '\' depending on platform). Example: for path '/full/path/to/file.ext' basename will return 'file.ext'. 

####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>
Absolute path for which basename is given. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>STRING : 
Basename part for the given path.</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.RhoFile.basename(<span class="text-info">STRING</span> path)</code> </li></ul></li></ul>

### <span class="label label-inverse"> Destructor</span> close()
Closes file.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li>Class Method: This method is a destructor and can only be accessed via the object that was created by the `new` constructor. <ul><li><code>myObj.close()</code> </li></ul></li></ul>

### copy(<span class="text-info">STRING</span> from, <span class="text-info">STRING</span> to)
Copies file from "from" (source) to "to" (destination).

####Parameters
<ul><li>from : <span class='text-info'>STRING</span><p>
File name to be copied. </p></li><li>to : <span class='text-info'>STRING</span><p>
Destination path. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>INTEGER : 
Error code raised during copy operation. 0 if no error.</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.RhoFile.copy(<span class="text-info">STRING</span> from, <span class="text-info">STRING</span> to)</code> </li></ul></li></ul>

### deleteDir(<span class="text-info">STRING</span> path)
Deletes specified directory. The specified directory must be empty to be deleted.

####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>
Absolute path to the directory to be deleted. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>INTEGER : 
Error code raised on directory deletion. 0 on success, -1 otherwise.</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.RhoFile.deleteDir(<span class="text-info">STRING</span> path)</code> </li></ul></li></ul>

### deleteFile(<span class="text-info">STRING</span> path)
Deletes file.

####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>
Absolute path to the file to be deleted. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>INTEGER : 
Error code raised on file deletion. 0 on success, -1 otherwise.</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.RhoFile.deleteFile(<span class="text-info">STRING</span> path)</code> </li></ul></li></ul>

### deleteRecursive(<span class="text-info">STRING</span> path, <span class="text-info">BOOLEAN</span> leaveRoot)
Deletes all directory contents.

####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>
Absolute path to the directory. </p></li><li>leaveRoot : <span class='text-info'>BOOLEAN</span> <span class='label label-info'>Optional</span><span class='label '> Default: false</span><p>
Set to true if you only want to delete directory contents, but no the directory itself. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.RhoFile.deleteRecursive(<span class="text-info">STRING</span> path, <span class="text-info">BOOLEAN</span> leaveRoot)</code> </li></ul></li></ul>

### dirname(<span class="text-info">STRING</span> path)
Returns directory name part of the specified path.

####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>
Absolute path to directory. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>STRING : 
Directory name.</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.RhoFile.dirname(<span class="text-info">STRING</span> path)</code> </li></ul></li></ul>

### exists(<span class="text-info">STRING</span> path)
Checks if specified path exists.

####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>
Absolute path to file or directory. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>BOOLEAN : 
True if path exists, otherwise false.</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.RhoFile.exists(<span class="text-info">STRING</span> path)</code> </li></ul></li></ul>

### flush()
Flushes all buffered data to the storage media.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.flush()</code></li></ul></li></ul>

### getFileSize(<span class="text-info">STRING</span> path)
Returns size of the file.

####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>
Absolute path to the file. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>INTEGER : 
File size in bytes.</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.RhoFile.getFileSize(<span class="text-info">STRING</span> path)</code> </li></ul></li></ul>

### isDir(<span class="text-info">STRING</span> path)
Checks if specified path is a directory.

####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>
Absolute path of the directory. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>BOOLEAN : 
True if path is a directory. False otherwise.</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.RhoFile.isDir(<span class="text-info">STRING</span> path)</code> </li></ul></li></ul>

### isFile(<span class="text-info">STRING</span> path)
Checks if specified path is a file.

####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>
Absolute path of the file. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>BOOLEAN : 
True if path is a file, false otherwise.</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.RhoFile.isFile(<span class="text-info">STRING</span> path)</code> </li></ul></li></ul>

### isOpened()
Checks if file is opened.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>BOOLEAN</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>BOOLEAN : 
True if file is opened, false otherwise.</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.isOpened()</code></li></ul></li></ul>

### join(<span class="text-info">STRING</span> p1, <span class="text-info">STRING</span> p2)
Joins two parts of the path considering all necessary path delimiters. I.e.: join('/path/to','file') will return '/path/to/file' 

####Parameters
<ul><li>p1 : <span class='text-info'>STRING</span><p>
First part of the path. </p></li><li>p2 : <span class='text-info'>STRING</span><p>
Second part of the path. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>STRING : 
Joined path.</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.RhoFile.join(<span class="text-info">STRING</span> p1, <span class="text-info">STRING</span> p2)</code> </li></ul></li></ul>

### listDir(<span class="text-info">STRING</span> path)
Lists all entries of specified directory.

####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>
Absolute path to directory. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>ARRAY</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>ARRAY : 
Array of directory entry names. If directory is empty array of size 0 will be returned.</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.RhoFile.listDir(<span class="text-info">STRING</span> path)</code> </li></ul></li></ul>

### makeDir(<span class="text-info">STRING</span> path)
Creates directory with the provided path. If all top-level nodes of the path doesn't exists, directory will not be created.

####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>
Path to the new directory. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>INTEGER : 
Error code raised on directory creation. 0 on success, -1 otherwise.</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.RhoFile.makeDir(<span class="text-info">STRING</span> path)</code> </li></ul></li></ul>

### makeDirs(<span class="text-info">STRING</span> path)
Creates directory and all top-level directories if necessary. Subsequent isDir call is necessary to check if path was successfully created.

####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>
Absolute path to the directory to be created. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.RhoFile.makeDirs(<span class="text-info">STRING</span> path)</code> </li></ul></li></ul>

### <span class="label label-inverse"> Constructor</span>  new EB.RhoFile(<span class="text-info">STRING</span> path, <span class="text-info">INTEGER</span> mode)
Opens file in a mode specified by the "mode" parameter.

####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>
Absolute path to the file. </p></li><li>mode : <span class='text-info'>INTEGER</span><p>
Mode in which to open the file. </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>Constant: EB.RhoFile.OPEN_FOR_APPEND <br/> String:1</dt><dd>
Open file for output at the end of a file. The file is created if it does not exist.</dd><dt>Constant: EB.RhoFile.OPEN_FOR_READ <br/> String:2</dt><dd>
Open file for read-only operations. The file must exist.</dd><dt>Constant: EB.RhoFile.OPEN_FOR_WRITE <br/> String:3</dt><dd>
Create an empty file for output operations. If a file with the same name already exists, its contents are discarded and the file is treated as a new empty file.</dd><dt>Constant: EB.RhoFile.OPEN_FOR_READ_WRITE <br/> String:4</dt><dd>
Open a file for update (both for read and write). The file must exist.</dd></dl></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li>Class Method: This method is a constructor and can only be accessed via the `new` construct. <ul><li><code>var myObj = new EB.RhoFile(<span class="text-info">STRING</span> path, <span class="text-info">INTEGER</span> mode)</code> </li></ul></li></ul>

### read(<span class="text-info">STRING</span> path)
Reads specified file to a string object.

####Parameters
<ul><li>path : <span class='text-info'>STRING</span><p>
Absolute path to file. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>STRING : 
File contents.</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.RhoFile.read(<span class="text-info">STRING</span> path)</code> </li></ul></li></ul>

### read(<span class="text-info">INTEGER</span> size)
Reads specified number of characters from current position of the file.

####Parameters
<ul><li>size : <span class='text-info'>INTEGER</span><p>
Number of characters to be read. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>STRING : 
String from current position of file containing specified number of characters.</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.read(<span class="text-info">INTEGER</span> size)</code></li></ul></li></ul>

### readAll()
Reads all file contents to the string object.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>STRING</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>STRING : 
Contents of the file.</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.readAll()</code></li></ul></li></ul>

### rename(<span class="text-info">STRING</span> from, <span class="text-info">STRING</span> to)
Renames / moves file.

####Parameters
<ul><li>from : <span class='text-info'>STRING</span><p>
Original path / name. </p></li><li>to : <span class='text-info'>STRING</span><p>
New path / name. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>INTEGER : 
Error code raised on move / rename. 0 on success, -1 otherwise.</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.RhoFile.rename(<span class="text-info">STRING</span> from, <span class="text-info">STRING</span> to)</code> </li></ul></li></ul>

### seek(<span class="text-info">INTEGER</span> pos)
Sets file position to specified value from the beginning of the file.

####Parameters
<ul><li>pos : <span class='text-info'>INTEGER</span><p>
Position within the file. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.seek(<span class="text-info">INTEGER</span> pos)</code></li></ul></li></ul>

### size()
Returns file size.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>INTEGER : 
File size in bytes.</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.size()</code></li></ul></li></ul>

### write(<span class="text-info">STRING</span> val)
Writes the provided string at current position in the file.

####Parameters
<ul><li>val : <span class='text-info'>STRING</span><p>
String to be written to the file. </p></li><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>INTEGER</span></p><ul></ul>

####Returns
Synchronous Return:<ul><li>INTEGER : 
Number of bytes written.</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.write(<span class="text-info">STRING</span> val)</code></li></ul></li></ul>

##Examples



###List contents of a folder

Iterate through the contents of a folder and divide the entries in "folders" and "files".
<pre><code>:::javascript
           
var folders = [];
var files = [];
var root_path = "/arbitrary/path"
var entries = Rho.RhoFile.listDir(root_path);

for (var i = 0; i &lt; entries.length; i++) {
  var entry = entries[i];
  if ((entry != ".") && (entry != "..")) {

    (Rho.RhoFile.isDir(Rho.RhoFile.join(root_path, entry)) ? folders : files).push(entry);
  }
}
                   
                 
</code></pre>