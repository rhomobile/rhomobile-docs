
#Imager Module

<b>
The Imager Module controls the imager functions and navigates to a URL or calls a JavaScript function in response to an HTTP image transfer carried out by the imager meta tag.
</b>

##Syntax

<table class="re-table"><tr><th class="tableHeading">imager (Module) &lt;META&gt; Syntax
</th></tr><tr><td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="imager" content="[parameter]"&gt;</p></td></tr><tr><td class="clsSyntaxCells clsEvenRow"><p>&lt;META HTTP-Equiv="imager" content="ImagerEvent:url('jsFunction or url')"&gt;</p></td></tr><tr><td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="imager" content="ImagerEnumEvent:url('jsFunction or url')"&gt;</p></td></tr></table>
<table class="re-table"><tr><th class="tableHeading">Imager JavaScript Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the JavaScript Object <b>'imager'</b> will exist on the current page and can be used to interact directly with the imager.
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Invoke imager methods via JavaScript use the following syntax: imager.method();
<P />e.g. <b>imager</b>.enable();
</td></tr><tr><td class="clsSyntaxCells clsOddRow">
To Set imager parameters via JavaScript use the following syntax: imager.parameter = 'value'; remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>imager</b>.enabled = 'value';
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">						
To Set imager return events via JavaScript use the following syntax: imager.event = JavaScript Function;
<P />e.g. <b>imager</b>.imagerEvent = 'doFunction(%json)';
<P />
For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents">Retrieval Events</a> page.

</td></tr><tr><td class="clsSyntaxCells clsOddRow">							
To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: imager.setEMML("[Your EMML Tags]");
<P />
e.g. <b>imager</b>.setEMML("enabled:<i>value</i>;imagerEvent:url('JavaScript:doFunction(%json)');enable");							
</td></tr></table>

<table class="re-table"><tr><th class="tableHeading">Imager Ruby Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the Ruby Object <b>'Imager'</b> will exist on the current page and can be used to interact directly with the Imager. All Methods, Parameters and Events are the same as JavaScript, however, notice <b>'Imager'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b></td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Invoke Imager methods via Ruby use the following syntax: Imager.method()
<P />e.g. <b>Imager</b>.enable</td></tr><tr><td class="clsSyntaxCells clsOddRow">
To Set Imager parameters via Ruby use the following syntax: Imager.parameter = 'value' remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>Imager</b>.enabled = 'value'
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">						
To Set Imager return events via Ruby use the following syntax: Imager.event = url_for(:action =&gt; :event_callback) 
<P />e.g. <b>Imager</b>.imagerEvent = url_for(:action =&gt; :imager_event_callback)
<P />
For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents#params-object">Retrieval Events</a> page.
<p>To access the event parameters in a Ruby callback function, you reference the @params object within the callback function. This object is simply a ruby hash {"parameter1 name" =&gt; "parameter1 value", "parameter2 name" =&gt; "parameter2 value", ...}</p></td></tr><tr><td class="clsSyntaxCells clsOddRow" /></tr></table>


	

##Methods


Items listed in this section indicate methods or, in some cases, indicate parameters which will be retrieved.

<table class="re-table"><col width="10%" /><col width="68%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>enable</b></td><td class="clsSyntaxCells clsOddRow">enables the imager device and shows the viewer window</td><td class="clsSyntaxCells clsOddRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>disable</b></td><td class="clsSyntaxCells clsEvenRow">disables the imager device and hides the viewer window</td><td class="clsSyntaxCells clsEvenRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>capture</b></td><td class="clsSyntaxCells clsOddRow">captures the current image and sends the file to the specified destination address.  If an imagerCaptureEvent is specified the image will also be returned as a Data URI object.</td><td class="clsSyntaxCells clsOddRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>enumerate</b></td><td class="clsSyntaxCells clsEvenRow">Return a list of imagers available on the device using ImagerEnumEvent. This tag will be actioned immediately</td><td class="clsSyntaxCells clsEvenRow">
N/A
</td></tr></table>


##Parameters


Items listed in this section indicate parameters, or attributes which can be set.
<table class="re-table"><col width="20%" /><col width="20%" /><col width="38%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Possible Values</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>enabled:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">enables referenced Imager. Imager IDs can be obtained via ImagerEnumEvent</td><td class="clsSyntaxCells clsOddRow">enables the referenced imager device and shows the viewer window</td><td class="clsSyntaxCells clsOddRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>desiredWidth:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">numeric Value</td><td class="clsSyntaxCells clsEvenRow">Sets the desired width of the output image, in pixels.  Depending on the camera hardware in use the closest matching image size will be chosen; the width of the chosen image will equal or exceed the value specified up to the capabilities of the hardware.  On Zebra devices the imaging hardware (that hardware shared by the imager scanner) can not have its output image width configured.  This parameter is only available in version 2.2 and higher</td><td class="clsSyntaxCells clsEvenRow">Hardware Specific</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>desiredHeight:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">numeric Value</td><td class="clsSyntaxCells clsOddRow">Sets the desired height of the output image, in pixels.  Depending on the camera hardware in use the closest matching image size will be chosen; the height of the chosen image will equal or exceed the value specified up to the capabilities of the hardware.  On Zebra devices the imaging hardware (that hardware shared by the imager scanner) can not have its output image height configured.  This parameter is only available in version 2.2 and higher</td><td class="clsSyntaxCells clsOddRow">Hardware Specific</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>left:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">numeric Value (0 - ScreenWidth)</td><td class="clsSyntaxCells clsEvenRow">Sets the top left horizontal position of the viewer window in pixels</td><td class="clsSyntaxCells clsEvenRow">Device Specific</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>top:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Numeric values (0 - ScreenHeight)</td><td class="clsSyntaxCells clsOddRow">Sets the top left vertical position of the viewer window in pixels</td><td class="clsSyntaxCells clsOddRow">Device Specific</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>width:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Numeric values (0 - ScreenWidth)</td><td class="clsSyntaxCells clsEvenRow">Sets the width of the viewer window in pixels</td><td class="clsSyntaxCells clsEvenRow">Device Specific</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>height:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Numeric values (0 - ScreenHeight)</td><td class="clsSyntaxCells clsOddRow">Sets the height of the viewer window in pixels</td><td class="clsSyntaxCells clsOddRow">Device Specific</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>lamp:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">ON/OFF</td><td class="clsSyntaxCells clsEvenRow">switches the lamp ON or OFF</td><td class="clsSyntaxCells clsEvenRow">OFF</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>aim:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">ON/OFF</td><td class="clsSyntaxCells clsOddRow">switches the imager's aim ON or OFF. This is not available on Android.</td><td class="clsSyntaxCells clsOddRow">OFF</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>username:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">http or ftp server user name</td><td class="clsSyntaxCells clsEvenRow">username for the http or ftp server if required</td><td class="clsSyntaxCells clsEvenRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>password:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">http or ftp server password</td><td class="clsSyntaxCells clsOddRow">password for the http or ftp server if required</td><td class="clsSyntaxCells clsOddRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>sound:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">wav file name</td><td class="clsSyntaxCells clsEvenRow">specifies the wave file to play when capturing an image</td><td class="clsSyntaxCells clsEvenRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>destination:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">http,ftp or file path </td><td class="clsSyntaxCells clsOddRow">the path of the destination</td><td class="clsSyntaxCells clsOddRow">
N/A
</td></tr></table>
<table class="re-table"><col width="78%" /><col width="8%" /><col width="1%" /><col width="5%" /><col width="1%" /><col width="5%" /><col width="2%" /></table>	

##Events


Values are returned to the caller in RhoElements via Events.  Most modules contain events and those returned from this module are given below along with the event parameters.  Events can cause a navigation to a new URL or a JavaScript function on the page to be invoked.  Each event will in most cases have a number of parameters associated with it which will either be strings or JavaScript arrays.  Event parameters can be accessed either directly or via JSON objects.

<br />
###imagerEvent

<table class="re-table"><col width="3%" /><col width="20%" /><col width="77%" /><tr><th class="tableHeading">ID</th><th class="tableHeading">Name</th><th class="tableHeading">Description</th></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">1</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>transferResult</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">In response to an upload to an HTTP site, the reply from the web server will be returned.  There will be no response to an upload to an FTP site</td></tr></table>
<br />
###imagerCaptureEvent
Specifying an ImagerCaptureEvent will cause the captured image to be returned as a Data URI object when the capture() method is invoked. A Data URI is a base 64 encoding of the image and can be used to easily embed the image on the page, store the image in a database or transfer the image to a server.
<table class="re-table"><col width="3%" /><col width="20%" /><col width="77%" /><tr><th class="tableHeading">ID</th><th class="tableHeading">Name</th><th class="tableHeading">Description</th></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">1</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>imageData</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">A DataURI representation of the captured Image.</td></tr></table>
<br />
###imagerEnumEvent

<table class="re-table"><col width="3%" /><col width="20%" /><col width="77%" /><tr><th class="tableHeading">ID</th><th class="tableHeading">Name</th><th class="tableHeading">Description</th></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">1</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>imagerArray (deviceName, friendlyName)</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">Two dimensional array of imagers present on the device</td></tr></table>



##Multi Instance
When multiple RhoElememts applications are running the following considerations should be made: Only the foreground RhoElements application is given access to the imaging hardware, when an application is sent to the background its state will be saved and it will automatically relinquish control of the imager.  When brought back to the foreground, an application previously using the imager will have its previous configuration (eg. whether it was enabled or not) reapplied to the imager automatically. Please note that any file transfer that is in progress continues even if the application is sent to the background and capture will not have any effect on an application that is in the background.


##Remarks


###ImagerArray attribute
The ImagerArray attribute returned from ImagerEnumevent retrieval tag will enumerate each imager present on the device in a 2D array, associating each Imager's device name with a user friendly name. The device ID can be passed as a parameter to "Imager" "Enabled:&lt;deviceID&gt;", the friendly name is a user readable description of the Imager, e.g: "IMG1", "Imager" "IMG2", "color Camera".


###Scanning and Image Capture Interaction
In some device configurations the scanner and imager share the same hardware, e.g. the blockbuster scanner and top mounted imager on the MC75a. Where two modules share the same physical hardware they cannot be enabled simultaneously, once the scanner is enabled it must be disabled before the imager can be used, and vice versa.


###Setting up a Transfer to a remote HTTP or FTP location
The Imager module is designed to be configured before any transfer is made to a remote location. If the 'Destination' paramter is specified as either HTTP or an FTP location the 'destination' / 'username' / 'password' parameters can not be guaranteed to stay the same after capture() has been called, therefore configure your destination for each capture. The above examples will work for a single transfer.


###Stretching the Image
The image can only be stretched as far as the screen dimensions will allow, do not expect to be able to create an image larger than the dimensions of your screen.


###Creating a fully qualified URL
The protocol, port number, username (optional) and password (optional) are all derived from the URL string and should be specified in the following manner: [protocol]://[username]:[password@]Server[:Port]FileNameAndPath. FTP Example: ftp://admin:root@192.168.1.1:2500/Folder/file.txt. HTTP Example: http://admin:root@192.168.1.1:8080/Folder/upload.aspx. Remember to also wrap your URL with url('') when being used as part of a meta tag, as shown in the examples above.


###imagerEnumEvent Array Format
The imagerArray parameter in the imagerEnumEvent is defined as a 2D array:

<pre>

(
   (            //  Array for Imager 1
      deviceName,    //  The internal name given to the Imager, use this when enabling a specific imager.
      friendlyName,  //  A human readable description of the Imager.
   )
   (            //  Array for Imager 2
      deviceName,
      friendlyName,
   )
)
</pre>


###Platform differences
On Android the height of the viewfinder cannot be set to any value less than 200.




##Requirements

<table class="re-table"><tr><th class="tableHeading">RhoElements Version</th><td class="clsSyntaxCell clsEvenRow">1.0.0 or above
</td></tr><tr><th class="tableHeading">Supported Devices</th><td class="clsSyntaxCell clsOddRow">All supported devices except Kiosk units.</td></tr><tr><th class="tableHeading">Minimum Requirements</th><td class="clsSyntaxCell clsOddRow">The device must have an Imager device or Color Camera.</td></tr><tr><th class="tableHeading">Persistence</th><td class="clsSyntaxCell clsEvenRow">Partially Persistent - Changes to this module will persist when navigating to a new page with the exception of the view finder: this will be hidden on page navigation.</td></tr></table>


##HTML/JavaScript Examples

The following example sets up the imager to capture an image and transfer it to an ftp site:

	<meta http-equiv="Imager" content="width:100">
	<meta http-equiv="Imager" content="height:100">
	<meta http-equiv="Imager" content="left:120">
	<meta http-equiv="Imager" content="Destination:url('software.uk.motorolasolutions.com')">
	<meta http-equiv="Imager" content="username:elementstest">
	<meta http-equiv="Imager" content="password:elements30">
	<meta http-equiv="Imager" content="sound:\windows\alarm2.wav">
	<meta http-equiv="Imager" content="aim:on">
	<meta http-equiv="Imager" content="lamp:off">
	<meta http-equiv="Imager" content="FTP">
	<meta http-equiv="Imager" content="imagerevent:url('javascript:alert('%s');')">
	<meta http-equiv="Imager" content="enabled">
	<meta http-equiv="onkey0x0d" content="KeyEvent:url('javascript:doCapture(0);')">
	
	<SCRIPT>
	   function doCapture()
	   {
	      imager.capture();
	   }
	</SCRIPT>
	
The following example sets up the imager to capture an image when the JavaScript function 'doCapture' is called:

	
	<meta HTTP-Equiv="Imager" Content="enabled;left:30;top:50;width:160;height:100;aim:off;lamp:off">
	<meta HTTP-Equiv="Imager" Content="destination:url('http://ds-laptop/PHTest/Received/HTTP/Upload.aspx')">
	<meta http-equiv="Imager" content="sound:\windows\alarm2.wav">
	<meta http-equiv="Imager" content="imagerevent:url('javascript:alert('%s');')">
	
	<script>
	   function doCapture()
	   {
	      imager.capture();
	   }
	</script>
	
	
The following ASP.NET example receives a file from the imager and saves it in a new filename:

	<%@ Import namespace="System.Web.UI.HtmlControls" %>
	<%@ Import namespace="System.IO" %>
	
	<script runat="server" language="C#">
	   //called when the file is submitted	
	   protected void Page_Load(object o, EventArgs e) 
	   {
	      //check we have submitted a file
	      if( elementsImagerFile.PostedFile != null )
	      {
	         // Get a reference to PostedFile object
	         HttpPostedFile myFile = elementsImagerFile.PostedFile;
	
	         // Get size of uploaded file
	         int nFileLen = myFile.ContentLength; 
	
	         // make sure the size of the file is > 0
	         if(nFileLen > 0 )
	         {
	            //Allocate a buffer for reading of the file
	            byte[] myData = new byte[nFileLen];
	
	            // Read uploaded file from the Stream
	            myFile.InputStream.Read(myData, 0, nFileLen);
	
	            // Create a name for the file to store
	            string strFilename = Path.GetFileName(myFile.FileName);
	
	            // Write data into a file
	            WriteToFile(Server.MapPath(strFilename), ref myData);
	
	            // Write a response back to sender
	            Response.Write("File Received");
	         }
	      }
	   }
	
	   // Writes file to current folder
	   private void WriteToFile(string strPath, ref byte[] Buffer)
	   {
	      // Create a file
	      FileStream newFile = new FileStream(strPath, FileMode.Create);
	
	      // Write data to the file
	      newFile.Write(Buffer, 0, Buffer.Length);
	
	      // Close file
	      newFile.Close();
	   }
	</script>
	
	<form name="elementsImagerForm" method="post" action="upload.aspx" id="elementsImagerForm" enctype="multipart/form-data">
	   <input id="elementsImagerFile" type="file" runat="server" Visible="false">
	</form>
	
The following is a useful desktop html file for testing the example above:

	<form name="elementsImagerForm" method="post" action="upload.aspx" id="elementsImagerForm" enctype="multipart/form-data">
	   <input name="elementsImagerFile" id="elementsImagerFile" type="file" />
	   <input type="submit" value="submit">
	</form>
	
The following example displays the available imagers on screen

	<html>
	<head>
	<meta HTTP-Equiv="imager" Content="imagerEnumEvent:url('JavaScript:Enumimagers(%s);')">
	<meta HTTP-Equiv="quitbutton" Content="left:200;top:0;visibility:visible">
	</head>
	
	<body BGCOLOR="#FFFFEA" TEXT="#0000A0" LINK="#FF0000" VLINK="#808080" ALINK="#008040" onLoad="setImagerEnumTimer();">
	<a HREF="./Index.html">Back</a><br>
	<div ID="message"></div>
	</body>
	</html>
	
	<SCRIPT LANGUAGE="JavaScript">
	
	function Enumimagers(imagerArray)
	{
	    var imagerInfo = "Imagers On Device: " + imagerArray.length + "<BR>ID  --  Name<BR>" 
	  
	    for (i=0; i < imagerArray.length; i++)
	    {
	        imagerInfo = imagerInfo + imagerArray[i][0] + ' -- ' + imagerArray[i][1] + '<BR>';
	    }
	    message.innerHTML = imagerInfo;
	}
	
	//  We can not call Scanner:Enumerate during page load on WM so give the page 3 seconds to finish loading
	function setImagerEnumTimer()
	{
	    message.innerHTML = "getting data...";
	    setTimeout("onImagerEnable()", 3000);
	}
	function onImagerEnable()
	{
		imager.enumerate();
	}
	</SCRIPT>
	
The following example shows image being captured as a Data URI and displayed on the page

	<META HTTP-Equiv="Imager" Content="imagerCaptureEvent:url('JavaScript:onImageCapture(%json)');">
	  
	<script type="text/javascript">
	function onImageCapture(jsonObject)
	{
		imagerImage.src = jsonObject.imageData;
	}
	</script>
	  
	</HEAD>
	  <BODY>
	  <BR><BR><BR><BR>
	  <img src="" id="imagerImage"<>/img>
	</BODY>  
	


