# Printing With Enterprise Browser
## Overview
Enterprise Browser permits printing via Bluetooth, USB and Wi-Fi from mobile devices running Android and Windows Mobile/CE. To facilite USB printing, the Enterprise Browser 1.3 printing API now includes the `CONNECTION_TYPE_USB` parameter. The API is otherwise unchanged, and operates in the same way as in prior editions. 

**Printing via USB requires a USB "On-The-Go" (OTG) cable or adapter and one of [Zebra's printers with USB printing support](../?Printers)** or a compatible third-party printer. Android and Windows Mobile/CE printing is supported via direct USB OTG connection or through a cradle with OTG adapter. Windows Mobile/CE devices also must be in 'Host Mode,' which is found under USB Config in the Settings panel. Connecting an OTG cable to an Android device invokes host mode automatically.

This guide is designed to provide an overview of the steps necessary to enable printing in an Enterprise Browser application. Where appropriate, it contains links to details for the calls, methods, parameters, constants and other specifics necessary to build an application using JavaScript and the Zebra printing APIs. 

For more information, please refer to the [Printing Tutorial](../guide-tutorial-printing) and to the Platform Notes section later in this guide. **All code samples are JavaScript**. 

## Platform Notes
### Windows Mobile/CE
Windows Mobile and Windows CE require that the `PrintingService` application is installed and always running whenever the [Printing](../api/printing) and [PrintingZebra](../api/printingzebra) APIs are to be used. This service (`PrintingService.cab`) is included with the Enterprise Browser installation, but requires the following Microsoft software to be on the device before the service can be deployed: 

* **For Windows Mobile/CE devices**, the [.NET Compact Framework](http://www.microsoft.com/en-us/download/details.aspx?id=65) must be present before installing the PrintingService app. Before downloading .NET CF, it might already be present on the build machine in `C:\Program Files (x86)\Microsoft.NET\SDK\CompactFramework\v3.5\WindowsCE\NETCFv35.wm.armv4i.cab`. 

* In addition, **Windows CE devices** also require the messaging framework, which can be found on the build machine in `C:\Program Files (x86)\Microsoft.NET\SDK\CompactFramework\v3.5\WindowsCE\Diagnostics\NETCFv35.Messages.EN.cab`.

###PrintingService App Installation
* **The PrintingService installer (.cab) file** can be found in `C:\<path to Enterprise Browser>\Printing-Service\PrintingService.cab`.

#### Limitations
* The PrintingService app currently supports a single client at a time.
* The method [`Printer.requestState()`](../api/printing#mrequestState) is not compatible with Bluetooth printers.
* The method [`Printer.stopSearch()`](../api/printing#mstopSearchSTATIC) is disabled.

###USB Compatibility Notes

* A USB On-the-Go (OTG) cable or adapter permits a mobile device to act as 'host' to client peripherals such as flash drives, keyboards and printers. 

* **On Android devices**, connecting an OTG cable invokes host mode automatically.

* **On Windows Mobile/CE devices** 'Host Mode' must be invoked manually (under USB Config in the Settings panel). 

* Some [Zebra TC7X single/dual slot cradles](https://www.zebra.com/us/en/products/accessories/mobile-computer/cradles/sharecradle-system.html) present a USB micro "AB" receptacle that allows the TC7X to act as host or client, depending on the cable.

* The Zebra OTG implementation lacks Session Request Protocol (SRP) and Host Negotiation Protocol (HNP), portions of the spec that allow connected devices to control power consumption and switch dynamically between host and client modes. 

* Printing via USB from a cradled device is possible by inserting an OTG Micro Type A connector to the cradle and connecting the USB-B (or Mini-B) end to the printer.

* OTG supports direct USB connections only; the use of USB hubs is not supported by the OTG spec. 


## 1- Enable Print APIs
Enterprise Browser provides two APIs for printing. The [Printer API](../api/printing) is a parent class that defines common class attributes that specific printer-type APIs will inherit. The [PrinterZebra API](../api/printingzebra) is the printer-type API for Zebra printers. 

There are two methods of enabling the Printer API:

* Include all 'ebapi' modules
* Include only the API required modules

Both methods are explained below. 

Either way, the included files can be found in: 
`/Enterprise Browser/JavaScript Files/Enterprise Browser`,
a directory on the computer that contains the Enterprise Browser installation.

### Include all JS API modules
To include all JavaScript APIs, copy the `ebapi-modules.js` file to a location accessible by an app's files and include the JavaScript modules file in the app. For instance, to include the modules file in `index.html`, copy the file to the same directory as index.html and add the following line to the HEAD section of that index.html file:

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi-modules.js"></script>

> This will define the EB class within the page. **Note that the path for this file is relative to the current page** (index.html). Any page on which the modules are required will need to have the required .js file(s) included in this fashion.

### Include only the required modules
To include individual APIs, first include the `ebapi.js` in the HTML, and then the additional required API file(s). For instance, to use the Printer API, add the following code to the HTML file(s). Again, this assumes that relevant API files have been copied to the same directory as the HTML.

    :::html
    <script type="text/javascript" charset="utf-8" src="ebapi.js"></script>
    <script type="text/javascript" charset="utf-8" src="eb.printer.js"></script>

> In the code lines above, notice that `ebapi.js` is included first, followed by `eb.printer.js`, which is the Printer API for Enterprise Browser. **This coding is required on each HTML page whenever an individual API will be called from that page**.

## 2- Find a Printer
Before an app can print, it must first discover and connect to a printer. There are a few ways to discover printers, but all use the [searchPrinters method](../api/printing?searchPrinters(HASH options)).

###Finding via Bluetooth
Printing via Bluetooth is supported for Android and Windows Mobile/CE apps. During Bluetooth discovery, the printer must be set to "discoverable." 

**Look for any 'discoverable' Zebra printer via Bluetooth by specifying the `connectionType` and `printerType` in the `options` parameter**:

	:::javascript
	var printers = [];

	EB.Printer.searchPrinters({ 
		connectionType:EB.Printer.CONNECTION_TYPE_BLUETOOTH,  
		printerType: EB.Printer.PRINTER_TYPE_ZEBRA
		 }, function (cb){
			if(cb.status == 'PRINTER_STATUS_SUCCESS')
			{
				if (typeof cb.printerID != "undefined")
				{
					console.log('Found: ' + cb.printerID)
					// > Found ZEBRA_PRINTER_1

					printers.push(cb.printerID);
				}
				else
				{
					console.log('Done Searching');
				}
			}
			else
			{
				console.log(cb.status);
			}
		});

**TIP: To minimize search time, code should provide as many search parameters as possible**.

The Bluetooth MAC address consists of six pairs of hexadecimal digits separated by colons. 

**Specify the Bluetooth MAC address (if known) as a `deviceAddress` using the `options` parameter**: 

	:::javascript
	EB.PrinterZebra.searchPrinters({ 
		connectionType:EB.Printer.CONNECTION_TYPE_BLUETOOTH,  
		deviceAddress: '00:03:7A:4C:F2:DB'
		... 

**NOTE**: When pairing with a Bluetooth device for the first time, a prompt might appear for a pairing PIN. Commonly used PINs: 0000, 1111 and 1234. Check the printer manufacturer's specifications.

###Finding via Wi-Fi
**Quickly identify known Wi-Fi printers, search using the `deviceAddress` and `devicePort` parameters**:

	:::javascript
	EB.Printer.searchPrinters({ 
		connectionType:EB.Printer.CONNECTION_TYPE_TCP,  
		deviceAddress: '192.168.1.121',
		devicePort: 6101
		...

**NOTE**: When attepting to connect via Bluetooth or Wi-Fi, be sure the device's corresponding radio is turned on. If using Bluetooth, the printer should be set to "discoverable."

###Finding via USB
Printing via USB is supported from Zebra enterprise mobile computers only to [Zebra's supported printers](../?Printers), which must be connected **using an OTG cable or adapter.**  Windows Mobile/CE devices also must be in 'Host Mode,' which is found under USB Config in the Settings panel.

**Use the `search.Printers` method and the `CONNECTION_TYPE_USB` parameter to search for printer(s) connected to the mobile device's USB port**:

	:::javascript
	var printers = [];

	EB.Printer.searchPrinters({ 
		connectionType:EB.Printer.CONNECTION_TYPE_USB,  
		printerType: EB.Printer.PRINTER_TYPE_ZEBRA
		 }, function (cb){
			if(cb.status == 'PRINTER_STATUS_SUCCESS')
			{
				if (typeof cb.printerID != "undefined")
				{
					console.log('Found: ' + cb.printerID)
					// > Found ZEBRA_PRINTER_1

					printers.push(cb.printerID);
				}
				else
				{
					console.log('Done Searching');
				}
			}
			else
			{
				console.log(cb.status);
			}
		});


For more information about USB connections, please refer to the Platform Notes section later in this guide. 

## 3- Connect to a Printer

The script in STEP 2 executes the callback function of the [searchPrinters method](../api/printing?searchPrinters(HASH options)), which returns a unique printerID property for each printer found and places them in the `printers` array variable. These IDs will be used to establish a connection with the desired printer. After the last printer is found, an additional callback will be triggered that contains no printerID, signaling that the app has found all available printers and can begin the selection process.

**NOTE**: This `printerID` is a unique identifier that is tracked by the Enterprise Browser framework. It has no relation to ID numbers that a printer manufacturer might be using.

**Select a `printerID` value from the `printers` array variable by creating an instance of the Printer class. Then call the [getPrinterByID method](../api/printingzebra?getPrinterByID(STRING printerId)) and pass the `printerID` as a string to the vairable `myPrinter`**:

	:::javascript
	// Ex: printers[0] = 'ZEBRA_PRINTER_1'

	var myPrinter = EB.Printer.getPrinterByID(printers[0]);

	// myPrinter is now an instance class of Printer
	// and can use the Instance Methods and properties 
	// associated with that class

**Next, connect to the instantiated printer using the [connect method](../api/printingzebra?connect())**: 

	:::javascript
	myPrinter.connect(function (cb){
		
		console.log(cb);
		// > PRINTER_STATUS_SUCCESS
		//cb = PRINTER_STATUS... constant
		
		console.log(myPrinter.deviceName);
		// > 'XXXX09-10-5799'
		// deviceName will be Zebra's 'Friendly Name'
		
		console.log(myPrinter.deviceAddress);
		// > '00:03:7A:4C:F2:DB'
		// deviceAddress will equal the Bluetooth Address
		
	});

The `callback` object in the [connect method](../api/printingzebra?connect()) will be a `string` containing a [PRINTER_STATUS...](../api/printingzebra?Constants) constant such as: 

- PRINTER_STATUS_SUCCESS
- PRINTER_STATUS_ERR_NETWORK
- PRINTER_STATUS_ERR_TIMEOUT

## 4- Retrieve Printer State
The first parameter of the [requestState method](../api/printingzebra?requestState(ARRAY listOfParameters)) is an array that lists the items available to find. 

**Use the [requestState method](../api/printingzebra?requestState(ARRAY listOfParameters)) check the printer state**: 

	:::javascript
	// Assumes you have created the instance 'myPrinter'
	// from previous methods described above

	myPrinter.requestState(['PRINTER_STATE_IS_READY_TO_PRINT',
	'PRINTER_STATE_IS_PAPER_OUT'],function (cb){
		console.log(cb.status);
		console.log(cb.PRINTER_STATE_IS_PAPER_OUT);
		console.log(cb.PRINTER_STATE_IS_READY_TO_PRINT);

		});

The returned [PRINTER_STATE...](../api/printing?Constants) callback objects are constants such as: 

- PRINTER_STATE_IS_COVER_OPENED
- PRINTER_STATE_IS_DRAWER_OPENED
- PRINTER_STATE_IS_PAPER_OUT

## 5- Retrieve Supported Printer Languages
The printer languages supported by the printer must be known before sending commands. Languages supported by Zebra printers include ZPL, CPCL and EPS.

**To retrieve a list of supported languages, use the [enumerateSupportedControlLanguages](../api/printing?enumerateSupportedControlLanguages()) method**: 

		:::javascript
	//assumes a printer instance from previous instructions:

	myPrinter.enumerateSupportedControlLanguages(function(cb){

		// cb = Array of strings 
		// PRINTER_LANGUAGE_ZPL
		// PRINTER_LANGUAGE_CPCL
		// PRINTER_LANGUAGE_EPS
	});

The callback will be an array of [PRINTER_LANGUAGE...](../api/printing?Constants) constants such as: 

- PRINTER_LANGUAGE_ZPL
- PRINTER_LANGUAGE_CPCL
- PRINTER_LANGUAGE_EPS

**WARNING**: Ruby is NOT supported for use with the CPCL printer language.  

## 6- Send Printer Commands
Once the app finds and connects to a printer, it can begin sending commands. Printer behavior will vary depending on printer make, model and current state. Consult your printer's technical documentation for printer-specific commands and syntax.

In general, there are two fundamental ways to send commands:

* In a string that includes raw printer commands
* In a series of commands stored in a file (i.e. ZPL, CPCL)

### Sending a Raw String
**To send a string to the printer, use the [printRawString](../api/printingzebra?printRawString(STRING command, HASH options)) method**: 

	:::javascript
	// If printer is in line mode, this text would be printed:

	myPrinter.printRawString('This is a test print');

	// To sendi a Zebra CPCL command 
	// and change from line mode to ZPL mode:
	
	myPrinter.printRawString('! U1 setvar "device.languages" "ZPL"\r\n');

### Sending a Series of Commands
When a series of commands is used repeatedly by an app--for example, to print an address label--the commands can be stored in a file (i.e. ZPL, CPCL) and called and/or modified programatically to perform the task. Command files can be generated manually or made using a tool provided by Zebra. They can be created in advance and delivered with the application. 

For example, let's say a file called `address.cpcl` is stored in the application's `public` folder and contains some CPCL commands that are used to print an address. Such a file might look something like the one below, which is a sample terminal script file with embedded CPCL commands: 

	:::term
	! U1 SETLP 5 2 46
	AURORA'S FABRIC SHOP
	! U1 SETLP 7 0 24
	123 Castle Drive, Kingston, RI 02881
	(401) 555-4CUT


To access the `address.cpcl` file, use the [RhoFile.join](../api/File?join) helper function and the [Application.publicFolder property](../api/Application?publicFolder) to create a fully qualified path to the file. 

**Pass the fully qualified path created above to the [sendFileContents method](../api/printingzebra?sendFileContents(STRING path))**: 

	:::javascript
	var addressFile = EB.RhoFile.join(EB.Application.publicFolder, 'address.cpcl');

	//assuming you made an instance and connected per the previous instructions

	myPrinter.sendFileContents(addressFile,function(e){
		console.log(e);

		// Will return a PRINTER_STATUS... CONSTANT String
		
		});

## 7- Disconnect
Whenever an app is finished printing, it's important to disconnect from the printer. This is especially important for Bluetooth connections. 

**To disconnect, use the [disconnect method](../api/printingzebra?disconnect())**:

	:::javacript
	//assumes you already created an instance object from previous instructions

	myPrinter.disconnect();

## Using Files Stored On The Printer
Some printers have the ability to store command-file templates or other files useful for performaing print operations. 

**Retrieve a list of files that exist on the printer using the [retrieveFileNames method](../api/printingzebra?retrieveFileNames())**: 

	:::javascript
	myPrinter.retrieveFileNames(function (e){

		// e.status : PRINTER_STATUS_SUCCESS, PRINTER_STATUS_ERROR
		// e.fileNames : ARRAY of file names
	
	});

Once the file names are known, your app can print with them, passing variables as specified within the ZPL or CPCL files themselves. This is done using either the [printStoredFormatWithArray method](../api/printingzebra?printStoredFormatWithArray(STRING formatPathOnPrinter, Array vars)) or the [printStoredFormatWithHash method](../api/printingzebra?printStoredFormatWithHash(STRING formatPathOnPrinter, HASH vars)). 

Both methods above include the three parameters below. 

###Parameter 1- formatPathOnPrinter
This will be **'E:&lt;filename&gt;'** where 'filename' is the name of one of the files found using the steps above or another file on the device (assuming the file is stored in the printer's 'E' partition). 

###Parameter 2- vars 
This represents the data to be passed to the label, and uses `printStoredFormatWithArray`, an array of strings representing the data to fill into the format. For ZPL formats, index 0 of the array corresponds to field number 2 (^FN2). For CPCL, the variables are passed in the order that they are found in the format. 

**Pass some address data to the array**:

	:::javascript
	myPrinter.printStoredFormatWithArray('E:LABEL.ZPL',['John Doe','123 East Main St','Smalltown, NY 11766'],function (e){

			// Will return a PRINTER_STATUS... CONSTANT String
		});

Supported by ZPL only is `printStoredFormatWithHash`, a hash that contains the key/value pairs for the stored format. For ZPL formats, the key number should correspond directly to the number of the field in the format. Number keys should be passed as strings (i.e.'1':'field1', '2':'field2', etc). 

**Pass some address data to the hash**:

	:::javascript 
	myPrinter.printStoredFormatWithHash('E:LABEL.ZPL',{ '1':'John Doe','2': '123 East Main St','3': Smalltown, NY 11766'},function (e){

		// e = PRINTER_STATUS... CONSTANT String

		if(e == 'PRINTER_STATUS_SUCCESS')
			{
			
			}
		});


###Parameter 3- callback
This parameter will return a [PRINTER_STATUS...](../api/printingzebra?Constants) constant as a string.

## Printing Images
For printers with graphics support, images are printed using the [printImageFromFile method](../api/printingzebra?printImageFromFile(STRING filePathOnDevice, INTEGER x, INTEGER y, HASH options)). For example, an image called `myImage.jpg` in your application's `public` folder could use the same [RhoFile.join](../api/File#mjoinSTATIC) helper function and [Application.publicFolder property](../api/Application?publicFolder) described above to create a fully qualified path to the `myImage.jpg` file. 

**After creating the fully qualified path, pass the file to the [printImageFromFile method](../api/printingzebra?printImageFromFile(STRING filePathOnDevice, INTEGER x, INTEGER y, HASH options))**:

	:::javascript
	var imagefile = EB.RhoFile.join(EB.Application.publicFolder, 'myImage.jpg');

	//assuming you made an instance and connected per the previous instructions

	myPrinter.printImageFromFile(imagefile,0,0,{},function(e){

		// e = PRINTER_STATUS... CONSTANT String

		if(e == 'PRINTER_STATUS_SUCCESS')
			{
			
			}
		});

A callback for the [PRINTER_STATUS](../api/printingzebra?Constants) constant would return a string indicating whether the operation was successful.

**NOTE**: Images larger than 1024x768 might take a long time or print incorrectly. Consult the printer manufacturer's documentation for image printing parameters. 

### Storing Images
For Zebra printers that support the storage of images, this can be done by creating a ZPL or CPL command set or by using the [storeImage method](../api/printingzebra?storeImage(STRING printerDriveAndFileName, STRING imageFilePathOnDevice, INTEGER width, INTEGER height)). 

**To store an image on the printer using the [storeImage method](../api/printingzebra?storeImage(STRING printerDriveAndFileName, STRING imageFilePathOnDevice, INTEGER width, INTEGER height))**: 

	:::javascript
	//location of image on device:

	var imagefile = EB.RhoFile.join(EB.Application.publicFolder, 'myImage.jpg');

	//destination of image on the printer. Must have partion specified:

	var destination = "E:LOGO.GRF"

	//assuming you made an instance and connected per the previous instructions:

	myPrinter.storeImageFromFile(destination,imagefile,0,0,{},function(e){
		
		// e = PRINTER_STATUS... CONSTANT String
		if(e == 'PRINTER_STATUS_SUCCESS')
			{

			}
		});


