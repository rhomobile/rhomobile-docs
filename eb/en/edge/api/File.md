#RhoFile


## Overview
<p>File I/O</p>
<p>Use this API to access local files for reading and writing. Only string data can be read and written with this API. Please note that binary files are not supported. Strings filled with \0 will be truncated to the last non \0 character.</p>

<h2>Enabling the API</h2>

<p>This API is part of the <code>coreapi</code> extension that is included automatically.</p>

<pre><code>:::ruby
extensions: ["coreapi"]
</code></pre>

<h2>JavaScript Usage</h2>

<p>Be sure to review the <a href="/guide/api_js">JavaScript API Usage</a> guide for important information about using this API in JavaScript.</p>

<h2>Ruby Usage</h2>

<p>Be sure to review the <a href="/guide/api_ruby">Ruby API Usage</a> guide for important information about using this API in Ruby.</p>



##Methods



### basename()
Return basename part for the specified path. Will remove any prefix up to the last path separator ('/' or '\' depending on platform). Example: for path '/full/path/to/file.ext' basename will return 'file.ext'. 

### <span class="label label-inverse"> Destructor</span> close()
Closes file.

### copy()
Copies file from "from" (source) to "to" (destination).

### deleteDir()
Deletes specified directory. The specified directory must be empty to be deleted.

### deleteFile()
Deletes file.

### deleteRecursive()
Deletes all directory contents.

### dirname()
Returns directory name part of the specified path.

### exists()
Checks if specified path exists.

### flush()
Flushes all buffered data to the storage media.

### getFileSize()
Returns size of the file.

### isDir()
Checks if specified path is a directory.

### isFile()
Checks if specified path is a file.

### isOpened()
Checks if file is opened.

### join()
Joins two parts of the path considering all necessary path delimiters. I.e.: join('/path/to','file') will return '/path/to/file' 

### listDir()
Lists all entries of specified directory.

### makeDir()
Creates directory with the provided path. If all top-level nodes of the path doesn't exists, directory will not be created.

### makeDirs()
Creates directory and all top-level directories if necessary. Subsequent isDir call is necessary to check if path was successfully created.

### <span class="label label-inverse"> Constructor</span>  new RhoFile()
Opens file in a mode specified by the "mode" parameter.

### read()
Reads specified file to a string object.

### read()
Reads specified number of characters from current position of the file.

### readAll()
Reads all file contents to the string object.

### rename()
Renames / moves file.

### seek()
Sets file position to specified value from the beginning of the file.

### size()
Returns file size.

### write()
Writes the provided string at current position in the file.