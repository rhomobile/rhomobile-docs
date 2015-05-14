# Barcode

The Barcode API class allows you to capture barcode data using your devices camera and/or dedicated scanning component like a 1D laser or 2D imager scanner found on Zebra Technologies devices.

Because RhoMobile Suite is designed to run on both Consumer devices and Zebra Technologies' enterprise devices support for the Barcode API will vary from device to device. In general if you are developing for a consumer device the number of symbologies available to you will be limited to just the most common ones, eg EAN13, UPCA etc and your scanning will be via the device camera. If your application is running on Zebra Technologies' hardware you will have much finer control over a more fully featured Scanner, often with a choice of scanner hardware on the device. In general if you wish to capture a single barcode in a ‘one shot’ use case, eg your App just wants to capture a single barcode to be submitted to a price comparison website then use Barcode.take(callback); if your application is expecting a number of barcodes to be received, common in enterprise scenarios for example a user in a warehouse then use Barcode.enable(callback).

## Default Object and Instance Objects
In RhoMobile 5.0, we have introduced instance objects on certain API classes. For the Barcode API, if you simply access `Rho.Barcode` or `Rho::Barcode` this will invoke the default object which will pick the `best` scan engine on the device. You can also define your own instance of  Barcode object by either using the [Barcode.getDefault()](../api/barcode#mgetDefaultSTATIC) method or by using one of the objects returned in the [Barcode.enumerate()](../api/barcode#menumerateSTATIC) method. If you would like to change the properties of the default scanner so that you do not need to always reset properties or keep a global variable instance available

JavaScript
	:::javascript
	var defaultScanner = Rho.Barcode.getDefault();
	defaultScanner.allDecoders = false;
	defaultScanner.code128 = true;
	Rho.Barcode.setDefault(defaultScanner);

Ruby
	:::ruby
	@defaultScanner = Rho::Barcode.getDefault()
	@defaultScanner.allDecoders = false
	@defaultScanner.code128 = true
	Rho.Barcode.setDefault(@defaultScanner)


## Detecting Barcode Capabilities
To see what barcode scanners are available to use, you can use the `Barcode.enumerate method`. This method will return an array of `Barcode` instance objects. You can then use the Barcode instance methods and properties. 

JavaScript
	:::javascript
	var scanners;
	             
	function choose_scanner(){
	    
	  // Enumerate returns an array of scanner objects 
	  scanners = Rho::Barcode.enumerate();

	  // now the variable scanners contains an array of Barcode objects

	}

	function scan_using_chosen_scanner(scanner_index) {
	    var scanner = scanners[scanner_index];
	    
	    // scanner will now be an instance object of Barcode
	    // so I can use Barcode methods like .take()
	    scanner.take({}, scan_received_callback);
	}

Ruby
	:::ruby
	def choose_scanner
	  # Obtain list of available scanners on the system. 
	  $scanners = Rho::Barcode.enumerate
	  
	end

	def scan_using_chosen_scanner
	  # receive an integer as parameter, which represent the number of the scanner we wish to use
	  scanner = $scanners[@params["scannerIndex"].to_i]
	  scanner.take({}, url_for(:action => :scan_received_callback))
	end

## Scanning Barcodes
There are a few ways to scan a barcode and the options available to you will depend on the type of device you have

### Univeral Method
`Barcode.take` is a universal method for scanning barcodes that will work across all devices and platforms (as long as there are scanning capabilities either through a camera or scan engine). When called, this method immediately invokes either the camera or the 1D Laser/2D Imager scan engines.

When the barcode is scanned, the data will be returned  in the callback return object. This object will contain a `status` and `barcode` attribute with the result. If the user decided to not scan a barcode or a timeout occured, then the status will be `cancel`

JavaScript
	:::javascript
	function scan_using_default_scanner(){
	  // Scan with default options
	  // We could have passed in an object of Barcode.properties 
	  // in the first param
	  Rho.Barcode.take({}, scan_received);
	}
	  
	function scan_received(params)
	  // Did we actually find a barcode ?
	  // If status is not 'ok', the scan was cancelled

	    if (params["status"]=="ok") {
	        alert('Barcode scanning complete. Scanned barcode: '+params["barcode"]);
	    } else {
	        alert('Barcode scanning aborted');
	    }
	    
	}

Ruby
	:::ruby
	def scan_using_default_scanner
	  # Scan with default options 
	  # We could have passed in some Barcode.properties in the first param
	  Rho::Barcode.take({}, url_for(:action => :scan_received))
	end
	  
	def scan_received
	  # Did we actually find a barcode ?
	  # If status is not 'ok', the scan was cancelled
	  if @params["status"] == "ok"
	    Rho::Log.info(@params["barcode"],"Barcode result")
	  else
	    Rho::Log.info("Cancelled", "Barcode result")
	  end
	end

### Dedicated Hardware Trigger
On Zebra Technologies devices there is a dedicated hardware button that is used as a `scanner trigger`. In order to use this feature, you would use [Barcode.enable()](../api/barcode#menable). This will enable the scanner trigger for accepting barcodes. Like with the `take` method, we could optionally pass in a set of properties to use, but must always provide a callback for handling the result.

The `Barcode.enable()` returns a different set of callback parameters:

* **data** : The data decoded by the scanner or imaging device
* **source** : The source device and human readable decoder type of the decoded barcode or symbol
* **type** : Hex value representing the decoder type
* **time** : The time at which the decode occurred (hh:mm:ss)
* **length** : The length of the decoded barcode or symbol
* **direction** : The direction the barcode was scanned, either forward, reverse or unavailable

Once the barcode button is enabled, anytime the user presses the trigger the scanner will be started and upon scanning a barcode the callback method will be called. When you no longer need or want this behavior you should disable the scanner button using [Barcode.disable()](../api/barcode#mdisable)

JavaScript
	:::javascript
	function scan_using_msi_trigger(){
	  // Enable the scan button on MSI device
	  
	  Rho.Barcode.enable({}, scan_received);
	}
	  
	function scan_received(params)
	  	// the enable method returns a different set of callback params
	  	// and only is called when a barcode is scanned
	  	// if the user decides to not scan a barcode this method
	  	// will not be called

	    
	    alert('Barcode scanning complete. Scanned barcode: '+params["data"]);
	    
	    // disable the scan trigger
	    Rho.Barcode.disable();
	}

Ruby
	:::ruby
	def scan_using_msi_trigger
	  // Enable the scan button on MSI device
	  
	  Rho::Barcode.enable {}, url_for(:action => :scan_received)
	end
	  
	def scan_received(params)
	  	// the enable method returns a different set of callback params
	  	// and only is called when a barcode is scanned
	  	// if the user decides to not scan a barcode this method
	  	// will not be called

	    
	    Rho::Log.info(@params["data"],"Barcode result")
	    
	    // disable the scan trigger
	    Rho::Barcode.disable()
	end
