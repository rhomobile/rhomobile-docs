
#SignatureCapture Module

<b>
The SignatureCapture Module creates a rectangular box that the user can draw within using the device's stylus to record handwritten data. Common usages for this tag include the capture of client/customer signatures and the input of handwritten text/notations.
</b>

##Syntax

<table class="re-table"><tr><th class="tableHeading">signatureCapture (Module) &lt;META&gt; Syntax
</th></tr><tr><td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="SignatureCapture" content="[method / parameter]"&gt;</p></td></tr><tr><td class="clsSyntaxCells clsEvenRow"><p>&lt;META HTTP-Equiv="SignatureCapture" content="SignatureSaveEvent:url('[jsFunction | url]')"&gt;</p></td></tr></table>
<table class="re-table"><tr><th class="tableHeading">SignatureCapture JavaScript Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the JavaScript Object <b>'signatureCapture'</b> will exist on the current page and can be used to interact directly with the signatureCapture.
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Invoke signatureCapture methods via JavaScript use the following syntax: signaturecapture.method();
<P />e.g. <b>signatureCapture</b>.clear();
</td></tr><tr><td class="clsSyntaxCells clsOddRow">
To Set signatureCapture parameters via JavaScript use the following syntax: signaturecapture.parameter = 'value'; remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>signatureCapture</b>.visibility = 'value';
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">						
To Set signatureCapture return events via JavaScript use the following syntax: signaturecapture.event = JavaScript Function;
<P />e.g. <b>signatureCapture</b>.signatureSaveEvent = 'doFunction(%json)';
<P />
For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents">Retrieval Events</a> page.

</td></tr><tr><td class="clsSyntaxCells clsOddRow">							
To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: signaturecapture.setEMML("[Your EMML Tags]");
<P />
e.g. <b>signatureCapture</b>.setEMML("visibility:<i>value</i>;signatureSaveEvent:url('JavaScript:doFunction(%json)');clear");							
</td></tr></table>

<table class="re-table"><tr><th class="tableHeading">SignatureCapture Ruby Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the Ruby Object <b>'SignatureCapture'</b> will exist on the current page and can be used to interact directly with the SignatureCapture. All Methods, Parameters and Events are the same as JavaScript, however, notice <b>'SignatureCapture'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b></td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Invoke SignatureCapture methods via Ruby use the following syntax: SignatureCapture.method()
<P />e.g. <b>SignatureCapture</b>.clear</td></tr><tr><td class="clsSyntaxCells clsOddRow">
To Set SignatureCapture parameters via Ruby use the following syntax: SignatureCapture.parameter = 'value' remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>SignatureCapture</b>.visibility = 'value'
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">						
To Set SignatureCapture return events via Ruby use the following syntax: SignatureCapture.event = url_for(:action =&gt; :event_callback) 
<P />e.g. <b>SignatureCapture</b>.signatureSaveEvent = url_for(:action =&gt; :signaturecapture_event_callback)
<P />
For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents#params-object">Retrieval Events</a> page.
<p>To access the event parameters in a Ruby callback function, you reference the @params object within the callback function. This object is simply a ruby hash {"parameter1 name" =&gt; "parameter1 value", "parameter2 name" =&gt; "parameter2 value", ...}</p></td></tr><tr><td class="clsSyntaxCells clsOddRow" /></tr></table>


	

##Methods


Items listed in this section indicate methods or, in some cases, indicate parameters which will be retrieved.

<table class="re-table"><col width="10%" /><col width="68%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>clear</b></td><td class="clsSyntaxCells clsOddRow">Clears the capture area.</td><td class="clsSyntaxCells clsOddRow">N/A</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>capture</b></td><td class="clsSyntaxCells clsEvenRow">Saves the signature as a bitmap on the device and attempts to send that bitmap to the location specified in the 'Destination' parameter.  If a signatureCaptureEvent is specified the signature will also be returned as a Data URI object.</td><td class="clsSyntaxCells clsEvenRow">
N/A
</td></tr></table>


##Parameters


Items listed in this section indicate parameters, or attributes which can be set.
<table class="re-table"><col width="20%" /><col width="20%" /><col width="38%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Possible Values</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>visibility:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">'Visible' or 'Hidden'</td><td class="clsSyntaxCells clsOddRow">Shows or hides the rectangular capture area</td><td class="clsSyntaxCells clsOddRow">By default the capture area is hidden</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>border:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">'Visible' or 'Hidden'</td><td class="clsSyntaxCells clsEvenRow">Shows or hides a border for the rectangular capture area</td><td class="clsSyntaxCells clsEvenRow">Visible</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>width:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Positive number</td><td class="clsSyntaxCells clsOddRow">Sets the width of the rectangular capture area in pixels</td><td class="clsSyntaxCells clsOddRow">200</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>height:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Positive number</td><td class="clsSyntaxCells clsEvenRow">Sets the height of the rectangular capture area in pixels</td><td class="clsSyntaxCells clsEvenRow">150</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>left:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Positive number</td><td class="clsSyntaxCells clsOddRow">Sets the top left horizontal position of the rectangular capture area in pixels</td><td class="clsSyntaxCells clsOddRow">15</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>top:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Positive number</td><td class="clsSyntaxCells clsEvenRow">Sets the top left vertical position of the rectangular capture area in pixels</td><td class="clsSyntaxCells clsEvenRow">60</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>penWidth:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Positive number but values less than 5 are advised</td><td class="clsSyntaxCells clsOddRow">Sets the width of the pen line in pixels when using the device's stylus. On Android this setting will also be applied to any previously drawn signature currently displayed.</td><td class="clsSyntaxCells clsOddRow">1</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>penColor:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">#000000 to #FFFFFF</td><td class="clsSyntaxCells clsEvenRow">RGB value that sets the color of the stylus pen ink using HTML web colors.</td><td class="clsSyntaxCells clsEvenRow">#000000</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>bgColor:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">#000000 to #FFFFFF</td><td class="clsSyntaxCells clsOddRow">RGB value that sets the background color of the signature capture area</td><td class="clsSyntaxCells clsOddRow">#FFFFFF</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>destination:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Fully qualified URL or file name.  Supports HTTP, FTP and File protocols.</td><td class="clsSyntaxCells clsEvenRow">Sets the destination path and name for the signature bitmap when the 'capture' method is called.  See Remarks</td><td class="clsSyntaxCells clsEvenRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>username:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">String</td><td class="clsSyntaxCells clsOddRow">The username for the HTTP or FTP server if required</td><td class="clsSyntaxCells clsOddRow">No username</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>password:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">String</td><td class="clsSyntaxCells clsEvenRow">The password for the HTTP or FTP server if required</td><td class="clsSyntaxCells clsEvenRow">No password</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>name:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">String compliant with Windows Naming restrictions</td><td class="clsSyntaxCells clsOddRow">When the 'Capture' method is invoked the contents of the signature capture area are saved in a bitmap in the root directory of the device.  This parameter is used to specify the filename when storing the bitmap locally.</td><td class="clsSyntaxCells clsOddRow">Signature</td></tr></table>
<table class="re-table"><col width="78%" /><col width="8%" /><col width="1%" /><col width="5%" /><col width="1%" /><col width="5%" /><col width="2%" /></table>	

##Events


Values are returned to the caller in RhoElements via Events.  Most modules contain events and those returned from this module are given below along with the event parameters.  Events can cause a navigation to a new URL or a JavaScript function on the page to be invoked.  Each event will in most cases have a number of parameters associated with it which will either be strings or JavaScript arrays.  Event parameters can be accessed either directly or via JSON objects.

<br />
###signatureSaveEvent
The Signature Save Event is called when the captured signature has been successfully transfered to the specified destination. When 'Capture' is called with the HTTP protocol, the destination server message is returned. When 'Capture' is called with the FTP protocol, either 'OK: File Sent', 'OK: File Received' or 'ERROR' is returned. This tag should be used in conjunction with the Capture method.
<table class="re-table"><col width="3%" /><col width="20%" /><col width="77%" /><tr><th class="tableHeading">ID</th><th class="tableHeading">Name</th><th class="tableHeading">Description</th></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">1</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>transferResult</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">Success or failure of transfer, see note above.</td></tr></table>
<br />
###signatureCaptureEvent
Specifying a SignatureCaptureEvent will cause the signature to be returned as a Data URI object when the capture() method is invoked. A Data URI is a base 64 encoding of the signature and can be used to easily embed the signature on the page, store the image in a database or transfer the image to a server.
<table class="re-table"><col width="3%" /><col width="20%" /><col width="77%" /><tr><th class="tableHeading">ID</th><th class="tableHeading">Name</th><th class="tableHeading">Description</th></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">1</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>imageData</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">A DataURI representation of the captured Signature.</td></tr></table>
<br />
###vectorEvent
Signature data is formatted into a series of vectors and returned to the application via this callback function. The received data may not represent the entire signature as the vectors will be sent in batches if the signature is large. A single vector (array entry) contains an X, Y coordinate and the beginning / end of the signature is defined by (0xFFFF, 0xFFFF). This event is independent of the SignatureSaveEvent or capture method, when specified the event will be called whenever a 'pen up' occurs in the signature box.
<table class="re-table"><col width="3%" /><col width="20%" /><col width="77%" /><tr><th class="tableHeading">ID</th><th class="tableHeading">Name</th><th class="tableHeading">Description</th></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow">1</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>vectorArray</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">JavaScript array of vectors which represent the signature.</td></tr></table>





##Remarks


###Scrolling
The signature capture area is not compatible with scrolling the browser window.


###Parameters which clear the Signature
The signature capture area is designed to be set up prior to capturing the signature, as such the following parameters will clear any current signature: "Width", "Height", "PenColor", "BGColor".


###Common Issues
The 'Visibility:Visible' parameter must be set in order to display the signature capture area.


###Setting up a Transfer to a remote HTTP or FTP location
Signature Capture is designed to be configured before any transfer is made to a remote location. If the 'Destination' paramter is specified as either HTTP or an FTP location the 'destination' / 'username' / 'password' parameters can not be guaranteed to stay the same after capture() has been called, therefore configure your destination for each capture, as in the above examples.


###Format of the Destination URL
The protocol, port number, username (optional) and password (optional) are all derived from the URL string and should be specified in the following manner: [protocol]://[username]:[password@]Server[:Port]FileNameAndPath. FTP Example: ftp://admin:root@192.168.1.1:2500/Folder/Sig.bmp. HTTP Example: http://admin:root@192.168.1.1:8080/Folder/Upload.aspx. File Example: file://\path\Sig.bmp. Remember to also wrap your URL with url('') when being used as part of a meta tag, as shown in the examples above.


###Supported Output File Formats
All devices support ".bmp" as the default file format for the saved signature. ET1 also supports ".png" format.




##Requirements

<table class="re-table"><tr><th class="tableHeading">RhoElements Version</th><td class="clsSyntaxCell clsEvenRow">1.0.0 or above
</td></tr><tr><th class="tableHeading">Supported Devices</th><td class="clsSyntaxCell clsOddRow">All supported devices.</td></tr><tr><th class="tableHeading">Minimum Requirements</th><td class="clsSyntaxCell clsOddRow">Touch Screen.</td></tr><tr><th class="tableHeading">Persistence</th><td class="clsSyntaxCell clsEvenRow">Partially Persistent - Changes to this module will persist when navigating to a new page with the exception of  The signature box and Save / Vector events. These will be cleared during page navigation.</td></tr></table>


##HTML/JavaScript Examples

The following META Tag example sets up a yellow rectangular area that has a border with a pen color of burgundy. When the Capture method is invoked via JavaScript the signature will be transferred to a server via HTTP and an alert will inform the user whether or not the transfer succeeded.

	<META HTTP-Equiv="SignatureCapture" Content="width:200">
	<META HTTP-Equiv="SignatureCapture" Content="height:100">
	<META HTTP-Equiv="SignatureCapture" Content="left:20">
	<META HTTP-Equiv="SignatureCapture" Content="top:60">
	<META HTTP-Equiv="SignatureCapture" Content="penwidth:2">
	<META HTTP-Equiv="SignatureCapture" Content="name:Sig">
	<META HTTP-Equiv="SignatureCapture" Content="pencolor:#AA0000">
	<META HTTP-Equiv="SignatureCapture" Content="bgcolor:#FFFF00">
	<META HTTP-Equiv="SignatureCapture" Content="Visibility:Visible">
	<META HTTP-Equiv="SignatureCapture" Content="Destination:url('HTTP://192.168.1.1:80/RhoElementsLog/upload.aspx')">
	<META HTTP-Equiv="SignatureCapture" Content="SignatureSaveEvent:url('javascript:alert('%s');')">
	
The following JavaScript will show a Signature Capture box with default settings when the JavaScript function onDisplay is called:

	<script>
	   function onDisplay()
	   {
	      signatureCapture.visibility  = 'visible';
	   }
	</script>
	
The following example shows signature being captured as a Data URI and displayed on the page

	<META HTTP-Equiv="SignatureCapture" Content="Height:200">
	<META HTTP-Equiv="SignatureCapture" Content="BGColor:#FFFF00">
	<META HTTP-Equiv="SignatureCapture" Content="Width:400">
	<META HTTP-Equiv="SignatureCapture" Content="Visibility:Visible">
	<META HTTP-Equiv="SignatureCapture" Content="PenColor:#FF00FF">
	<META HTTP-Equiv="SignatureCapture" Content="PenWidth:4">
	<META HTTP-Equiv="SignatureCapture" Content="signatureCaptureEvent:url('JavaScript:onSignatureCapture(%json)');">
	  
	<script type="text/javascript">
	function onSignatureCapture(jsonObject)
	{
		signatureImage.src = jsonObject.imageData;
	}
	</script>
	  
	</HEAD>
	  <BODY>
	  <BR><BR><BR><BR>
	  <img src="" id="signatureImage"<>/img>
	</BODY>  
	
The following example shows signature vectors being displayed in an HTML table

	<META HTTP-Equiv="SignatureCapture" Content="Height:200">
	<META HTTP-Equiv="SignatureCapture" Content="BGColor:#FFFF00">
	<META HTTP-Equiv="SignatureCapture" Content="Width:400">
	<META HTTP-Equiv="SignatureCapture" Content="Visibility:Visible">
	<META HTTP-Equiv="SignatureCapture" Content="PenColor:#FF00FF">
	<META HTTP-Equiv="SignatureCapture" Content="PenWidth:4">
	<META HTTP-Equiv="SignatureCapture" Content="VectorEvent:url('JavaScript:onVectors(%s);')">
	  
	<script type="text/javascript">
	function onVectors(data)
	{
	  var VectorAsHTML = "<TABLE><TR><TH>X</TH><TH>Y</TH><TH>X</TH><TH>Y</TH><TH>X</TH><TH>Y</TH></TR>";
	  for (var i=0; i<data.length; i = i + 6)
	  {
	    VectorAsHTML = VectorAsHTML + "<TR>"
	    VectorAsHTML = VectorAsHTML + "<TD>" + data[i] + "</TD><TD>" + data[i+1] + "</TD>";
	    VectorAsHTML = VectorAsHTML + "<TD>" + data[i+2] + "</TD><TD>" + data[i+3] + "</TD>";
	    VectorAsHTML = VectorAsHTML + "<TD>" + data[i+4] + "</TD><TD>" + data[i+5] + "</TD>";
	    VectorAsHTML = VectorAsHTML + "</TR>"
	  }
	  VectorAsHTML + "</TABLE>"
	  vectorOut.innerHTML = VectorAsHTML;
	}
	</script>
	  
	</HEAD>
	  <BODY>
	  <BR><BR><BR><BR>
	  <BR><BR><BR><BR><BR>
	  <DIV id="vectorOut">Vectors Will Appear Here:</div>
	  </BODY>  
	


