
#FileTransfer Module

<b>
The FileTransfer Module is used to send or receive files between the local filestore and either an FTP or HTTP site.
</b>

##Syntax

<table class="re-table"><tr><th class="tableHeading">fileTransfer (Module) &lt;META&gt; Syntax
</th></tr><tr><td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="FileTransfer" content="[Method | Parameter]"&gt;</p></td></tr><tr><td class="clsSyntaxCells clsEvenRow"><p>&lt;META HTTP-Equiv="FileTransfer" content="TransferEvent:url('[jsFunction | url]')"&gt;</p></td></tr></table>
<table class="re-table"><tr><th class="tableHeading">FileTransfer JavaScript Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the JavaScript Object <b>'fileTransfer'</b> will exist on the current page and can be used to interact directly with the fileTransfer.
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Invoke fileTransfer methods via JavaScript use the following syntax: filetransfer.method();
<P />e.g. <b>fileTransfer</b>.transfer();
</td></tr><tr><td class="clsSyntaxCells clsOddRow">
To Set fileTransfer parameters via JavaScript use the following syntax: filetransfer.parameter = 'value'; remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>fileTransfer</b>.destination = 'value';
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">						
To Set fileTransfer return events via JavaScript use the following syntax: filetransfer.event = Javascript Function;
<P />e.g. <b>fileTransfer</b>.transferEvent = 'doFunction(%json)';
<P />
For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents">Retrieval Events</a> page.

</td></tr><tr><td class="clsSyntaxCells clsOddRow">							
To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: filetransfer.setEMML("[Your EMML Tags]");
<P />
e.g. <b>fileTransfer</b>.setEMML("destination:<i>value</i>;transferEvent:url('JavaScript:doFunction(%json)');transfer");							
</td></tr></table>

<table class="re-table"><tr><th class="tableHeading">FileTransfer Ruby Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the Ruby Object <b>'FileTransfer'</b> will exist on the current page and can be used to interact directly with the FileTransfer. All Methods, Parameters and Events are the same as Javascript, however, notice <b>'FileTransfer'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b></td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Invoke FileTransfer methods via Ruby use the following syntax: FileTransfer.method()
<P />e.g. <b>FileTransfer</b>.transfer</td></tr><tr><td class="clsSyntaxCells clsOddRow">
To Set FileTransfer parameters via Ruby use the following syntax: FileTransfer.parameter = 'value' remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>FileTransfer</b>.destination = 'value'
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">						
To Set FileTransfer return events via Ruby use the following syntax: FileTransfer.event = url_for(:action =&gt; :event_callback) 
<P />e.g. <b>FileTransfer</b>.transferEvent = url_for(:action =&gt; :filetransfer_event_callback)
<P />
For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents#params-object">Retrieval Events</a> page.
<p>To access the event parameters in a Ruby callback function, you reference the @params object within the callback function. This object is simply a ruby hash {"parameter1 name" =&gt; "parameter1 value", "parameter2 name" =&gt; "parameter2 value", ...}</p></td></tr><tr><td class="clsSyntaxCells clsOddRow" /></tr></table>


	

##Methods


Items listed in this section indicate methods or, in some cases, indicate parameters which will be retrieved.

<table class="re-table"><col width="10%" /><col width="68%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>transfer</b></td><td class="clsSyntaxCells clsOddRow">Sends or receives the file according to the configured properties.</td><td class="clsSyntaxCells clsOddRow">N/A</td></tr></table>


##Parameters


Items listed in this section indicate parameters, or attributes which can be set.
<table class="re-table"><col width="20%" /><col width="20%" /><col width="38%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Possible Values</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>destination:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">URL or a path</td><td class="clsSyntaxCells clsOddRow">Sets the destination path and name of the file to be transferred.  If specifying a URL this should be fully qualified with protocol, port and optionally username and password.</td><td class="clsSyntaxCells clsOddRow">N/A</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>source:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">URL or a path</td><td class="clsSyntaxCells clsEvenRow">Sets the source path and name of the file to be transferred.  If specifying a URL this should be fully qualified with protocol, port and optionally username and password.</td><td class="clsSyntaxCells clsEvenRow">N/A</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>username:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">String</td><td class="clsSyntaxCells clsOddRow">The username for the HTTP or FTP server if required</td><td class="clsSyntaxCells clsOddRow">No username</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>password:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">String</td><td class="clsSyntaxCells clsEvenRow">The password for the HTTP or FTP server if required</td><td class="clsSyntaxCells clsEvenRow">No password</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>createFolders:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">'True' or 'False'</td><td class="clsSyntaxCells clsOddRow">On a filetransfer that results in local file storage, createFolders can automatically create the directory path.</td><td class="clsSyntaxCells clsOddRow">False</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>overWrite:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">'True' or 'False'</td><td class="clsSyntaxCells clsEvenRow">On a filetransfer that results in local file storage, OverWrite will overwrite the destination file if it already exists.</td><td class="clsSyntaxCells clsEvenRow">False</td></tr></table>
<table class="re-table"><col width="78%" /><col width="8%" /><col width="1%" /><col width="5%" /><col width="1%" /><col width="5%" /><col width="2%" /></table>	

##Events


Values are returned to the caller in RhoElements via Events.  Most modules contain events and those returned from this module are given below along with the event parameters.  Events can cause a navigation to a new URL or a Javascript function on the page to be invoked.  Each event will in most cases have a number of parameters associated with it which will either be strings or javascript arrays.  Event parameters can be accessed either directly or via JSON objects.

<br />
###transferEvent
Provided the source and destination parameters were valid, the TransferEvent is fired after the transfer has been made. When the transfer is via the HTTP protocol 'OK: File Received' is returned; for HTTP uploads the destination server message is returned. When the transfer is via FTP either 'OK: File Sent', 'OK: File Received'. If there is an error during the transfer 'Error:' will be returned and may be followed by the relevant Windows error code; see the log file for more information on the error. Note when downloading from an HTTP server if the requested file does not exist you may receive 'OK: File received' and the server 404 string placed in your destination file.
<table class="re-table"><col width="3%" /><col width="20%" /><col width="77%" /><tr><th class="tableHeading">ID</th><th class="tableHeading">Name</th><th class="tableHeading">Description</th></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">1</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>transferResult</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">Success or failure of the transfer, see note above.</td></tr></table>





##Remarks


###Default Ports
The default port settings are 80 for HTTP and 21 for FTP.


###Common mistakes
Remember that in Javascript the '\' character is the escape character so to use a backslash in the URL use '\\'. This is not the case when specifying the URL via a meta tag where a single '\' will suffice. See the examples above.


###Setting up a Transfer
File transfer is designed to be configured before any transfer() is made. Once a transfer hs been initiated the parameters can not be guaranteed to be the same for the next transfer, therefore set all non default parameters before starting the transfer.


###Creating a fully qualified URL
The protocol, port number, username (optional) and password (optional) are all derived from the URL string and should be specified in the following manner: [protocol]://[username]:[password@]Server[:Port]FileNameAndPath. FTP Example: ftp://admin:root@192.168.1.1:2500/Folder/file.txt. HTTP Example: http://admin:root@192.168.1.1:8080/Folder/upload.aspx


###Relative URLs
The FileTransfer meta tag also supports relative URLs, for example if the current page's path is 'http://192.168.0.1/myElementsApp/index.html and you specify &lt;META HTTP-Equiv="FileTransfer" Content="Source:url('../file.xls')"&gt; then the source file will be 'http://192.168.0.1/file.xls'. This notation can also be used for FTP upload and file URLs. Note that the relative URL must start with a '.' so to specify a file in the same directory as your application page use Source:url('./file.xls')


###Maximum File Size
The maximum file size which can be transferred is about 4MB but is also dependant on the memory available to the device and the transport protocol selected. For file sizes above 2MB on lower memory devices alternate methods for transferring files should be considered.


###Platform differences
Although the file transfer functionality has the same behavior on all supported platforms the vast majority of the times, there might be scenarios where the Android version may return different error codes when compared to the Windows (CE, Mobile) version.


###File transfer result code received in Javascipt or JASON events
If an invalid username or password are used on an FTP transfer to a remote server the response returned is 0 instead of the expected 12014




##Requirements

<table class="re-table"><tr><th class="tableHeading">RhoElements Version</th><td class="clsSyntaxCell clsEvenRow">1.0.0 or above
</td></tr><tr><th class="tableHeading">Supported Devices</th><td class="clsSyntaxCell clsOddRow">All supported devices.</td></tr><tr><th class="tableHeading">Minimum Requirements</th><td class="clsSyntaxCell clsOddRow">None.</td></tr><tr><th class="tableHeading">Persistence</th><td class="clsSyntaxCell clsEvenRow">Transient - any changes made by changing parameters will be lost when navigating to a new page or initiating a transfer.</td></tr></table>


##HTML/Javascript Examples

The following example shows how to move the file 'myfile.txt' from the device's root to a folder off the root:

	<META HTTP-Equiv="FileTransfer" Content="Source:url('file://\myfile.txt')">
	<META HTTP-Equiv="FileTransfer" Content="Destination:url('file://\MyFolder\myfile.txt')">
	<META HTTP-Equiv="FileTransfer" Content="Overwrite:True">
	<META HTTP-Equiv="FileTransfer" Content="CreateFolders:True">
	<META HTTP-Equiv="FileTransfer" Content="Transfer">
	
The following example sets up a protocol, destination and source file and sends the file via HTTP. Upon a successful transfer, the server message (if any) is sent to 'mypage.asp.':

	<META HTTP-Equiv="FileTransfer" Content="TransferEvent:url('mypage.asp?Data=%s')">
	<META HTTP-Equiv="FileTransfer" Content="Destination:url('HTTP://192.168.1.1/accounts/upload.aspx')">
	<META HTTP-Equiv="FileTransfer" Content="Source:url('file://\temp/accounts.xls')">
	<META HTTP-Equiv="FileTransfer" Content="Transfer">
	
The following example shows how to download a file from an HTTP server.

	<META HTTP-Equiv="FileTransfer" Content="TransferEvent:url('Javascript:alert('%s')'); Transfer">
	
	<script type="text/javascript">
	   //  HTTP Functions
	  
	   //  Download from an HTTP site
	   function downloadFromHTTP()
	   {
	      fileTransfer.source = "url('http://myserver/myfile.txt')";
	      fileTransfer.destination = "url('file://\\myfile.txt')";
	      fileTransfer.transfer();     
	   }
	
	   //  Download from an HTTP site requiring login credentials
	   function downloadFromHTTPAuth()
	   {
	      fileTransfer.source = "url('http://httpAdmin:httpPassword@myserver/myfile.txt')";
		  fileTransfer.destination = "url('file://\\myfile.txt')";
		  fileTransfer.transfer();
	   }
	</script>
	
The following example shows to transfer a file via FTP. After each transfer the result (OK or Error) is given in an alert box.

	<META HTTP-Equiv="FileTransfer" Content="TransferEvent:url('Javascript:alert('%s')'); Transfer">
	
	<script type="text/javascript">
	   //  FTP Functions
	  
	   //  Upload to an FTP server
	   function uploadToFTP()
	   {
	        fileTransfer.source = "url('file://\\Program Files\\RhoElements\\file.txt')";
	        fileTransfer.destination = "url('ftp://192.168.4.110/file.txt')";
	        fileTransfer.transfer();     
	   }
	
	   //  Upload to an FTP server on port 2500 using username 'ftpadmin' and password 'ftpadminpw'
	   function uploadToFTPWithAuthentication()
	   {
	        fileTransfer.source = "url('file://\\Program Files\\RhoElements\\file.txt')"; 
	        fileTransfer.destination = "url('ftp://ftpadmin:ftpadminpw@192.168.4.110:2500/Folder/file.txt')";
	        fileTransfer.transfer();    
	   }
	
	   //  Download from an FTP Server using username 'ftpadmin' and password 'ftpadminpw'   
	   function downloadFromFTP()
	   {
	        fileTransfer.source = "url('ftp://ftpadmin:ftpadminpw@192.168.4.110/NewFolder/file.txt')"; 
	        fileTransfer.destination = "url('file://\\sigReceived.bmp')";
	        fileTransfer.transfer();
	   }
	</script>
	


## Ruby Examples

The following example moves a file 'myfile.txt' from the root of the device to the 'myFolder' folder inside of the root. The folder does not need to be created. 

	def transferLocally
		FileTransfer.source="url('file://\\myfile.txt')"
		FileTransfer.destination="url('file://\\MyFoder\\myfile.txt')"
		FileTransfer.overWrite='true'
		FileTransfer.createFolders='true'
		FileTransfer.transfer
	end
	
To call the this function from HTML, use the following code: 

	<li onclick="tranferLocal(); ">Transfer file locally</li>

Where 'transferLocal()' is a JavaScript function which looks like: 

	function tranferLocal() {
		$.get('/app/FileTransfer/transferLocally', { });
		return false;
	}

The following example sets up a protocol, destination and source file and sends the file via HTTP. It also attaches a listener to the 'transferEvent' to display the server message, if any. The 'transferEventListener' function is described at the end of this document. 

	def transferToHttp
		FileTransfer.transferEvent=url_for(:action => :transferEventListener)
		FileTransfer.destination="url('HTTP://192.168.1.1/accounts/upload.aspx')"
		FileTransfer.source="url('file://myfile.txt')"
		FileTransfer.transfer
	end
	
The following example shows how to download a file via HTTP when there are no login credentials required:

	def downloadFile
		FileTransfer.transferEvent=url_for(:action => :transferEventListener)
		FileTransfer.source="url('http://myserver/myfile.txt')"
		FileTransfer.destination="url('fil://myfile.txt')"
		FileTransfer.transfer
	end

The following example shows how to download a file via HTTP with login credentials:

	def downloadFileWithCredentials
		FileTransfer.transferEvent=url_for(:action => :transferEventListener)
		FileTransfer.source="url('http://myusername:mypassword@myserver/myfile.txt')"
		FileTransfer.destination="url('fil://myfile.txt')"
		FileTransfer.transfer
	end

The following example shows how to upload a file via FTP without login credentials required:

	def uploadFileViaFTP
		FileTransfer.transferEvent=url_for(:action => :transferEventListener)
		FileTransfer.destination="url('ftp://192.168.4.110/file.txt')"
		FileTransfer.transfer  
	end
	
The following example shows how to upload a file via FTP on port 2500 where login is required:

	def uploadFileViaFTPWithCredentials
		FileTransfer.transferEvent=url_for(:action => :transferEventListener)
		FileTransfer.destination="url('ftp://ftpusername:ftppasswor@192.168.4.110:2500/file.txt')"
		FileTransfer.transfer  
	end  
	
All the examples above can be called via HTTP in a manner similar to that described for the 'transferLocally' function above. The 'transferEventListener' method is given below. It simply sets the transfer result to an HTML div via JavaScript.

	def transferEventListener
		WebView.execute_js("setFieldValue('"+@params['transferResult']+"');")
	end