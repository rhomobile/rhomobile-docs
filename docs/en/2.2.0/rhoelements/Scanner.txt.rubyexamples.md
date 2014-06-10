#Examples

The following example lists the available scanners on a device. It first detaches the listeners to 'enumScannerEvent' (if any), then attaches it to a listner and makes a call to 'enumerate' which fires the 'enumScannerEvent'. This piece of code should be placed in the controller

	def registerEnumEvent
		Scanner.enumScannerEvent = ''
		Scanner.enumScannerEvent = url_for(:action => :enumScannerEventListener)
		Scanner.enumerate
	end

To call the this function from HTML, use the following code: 

	<li onclick="enumerateScanner();">Enumerate Scanners</li>

Where 'enumerateScanner()' is a JavaScript function which looks like: 

	function enumerateScanner() {
		$.get('/app/ScannerModule/registerEnumEvent', { });
		return false;
    }

The following piece of code captures the array of scanners returned from the 'enumScannerEvent' and constructs a string to be displayed on an HTML div:
  
	def enumScannerEventListener
		scanners = @params
			  
		String buf = "Available scanners: <BR>"    
		if scanners    
		  scanners['scannerArray'].each {|scanner| buf += '' + scanner["deviceName"] + " : " + scanner["friendlyName"] + "<BR>"}
		  WebView.execute_js("setFieldValue('"+buf+"');")
		else
		  WebView.execute_js("setFieldValue('No Scanners found! ');")
		end    
	end

The following example enables the scanner and attaches a listener to the decode event. This can be called from HTML in a similar fashion to the one described above.
  
	def enableScanner
		Scanner.enable
		Scanner.decodeEvent = url_for(:action => :scannerEventListener)
		WebView.execute_js("setFieldValue('Scanner Enabled');")
	end

The following example populates an HTML div with scanned data upon successful decoding of a barcode:

	def scannerEventListener
		scanResult = @params
		WebView.execute_js("setFieldValue('You scanned: <BR>" + scanResult['data'] +"<BR>');")
	end

The following example disables the scanner and detaches any listeners attached to the decode event. This can be called from HTML in a similar fashion to the one described above.

	def disableScanner
		Scanner.disable
		Scanner.decodeEvent = ''
		WebView.execute_js("setFieldValue('Scanner Disabled.');")
	end 

For all the examples described above, the 'setFieldValue()' JavaScript function looks like: 

	function setFieldValue(returnval){
		document.getElementById("result").innerHTML=returnval;
	}