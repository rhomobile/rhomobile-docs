# Printing
## Overview
RhoMobile Suite 5.3 permits printing via Bluetooth and Wi-Fi from mobile devices running Android, iOS and Windows Mobile/CE. **New in version 5.3 is the ability to print via USB to Windows Mobile/CE devices**, building on similar support for Android devices introduced in 5.1.  

To facilite USB printing, the RhoMobile printing API now includes the `CONNECTION_TYPE_USB` parameter. The API is otherwise unchanged, and operates in the same way as in prior editions. To print via USB, the Zebra device must be connected with a USB "On-The-Go" (OTG) cable or adapter to one of [Zebra's supported printers](#zebra-printers-with-usb-printing). Android and Windows Mobile/CE printing is supported via direct USB OTG connection or through a cradle with OTG adapter. Windows Mobile/CE devices also must be in 'Host Mode,' which is found under USB Config in the Settings panel.

This guide is designed to provide an overview of the steps necessary to enable printing in a RhoMobile application. Where appropriate, it contains links to details for the calls, methods, parameters, constants and other specifics necessary to build your application using the Zebra printing APIs. 

## 1- Enable Print APIs
The [RhoMobile APIs](apisummary) provide two APIs for printing. The [Printing](../api/printing) API is a parent class that defines common class attributes that specific printer-type APIs will inherit. The [PrintingZebra](../api/printingzebra) API is the printer-type API for Zebra printers. 

**To enable printing in your application, your `build.yml` must include both of these extensions**. 

Example `build.yml` command: 

    :::ruby
    ...
    extensions: ["printing","printing_zebra",...]
    ...


## 2- Find a Printer
Before your app can print, it must first discover and connect to a printer. There are a few ways to discover printers, but all use the [searchPrinters](../api/printing#msearchPrintersSTATIC) method.

###Finding via Bluetooth
Printing via Bluetooth is supported for Android, iOS and Windows Mobile apps. **During Bluetooth discovery, the printer must be set to "discoverable."** The following JavaScript code looks for any Zebra printers discoverable via Bluetooth by specifying the `connectionType` and `printerType` in the `options` parameter:

Sample JavaScript code: 

	:::javascript
	var printers = [];

	Rho.Printer.searchPrinters({ 
		connectionType:Rho.Printer.CONNECTION_TYPE_BLUETOOTH,  
		printerType: Rho.Printer.PRINTER_TYPE_ZEBRA
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

NOTE: TIP: To minimize search time, code should provide as many search parameters as possible.

The Bluetooth MAC address consists of six groups of two hexadecimal digits separated by colons. If a printer's Bluetooth MAC address is known, it can be specified as a `deviceAddress` using the `options` parameter: 

Sample JavaScript code: 
	:::javascript
	Rho.PrinterZebra.searchPrinters({ 
		connectionType:Rho.Printer.CONNECTION_TYPE_BLUETOOTH,  
		deviceAddress: '00:03:7A:4C:F2:DB'
		... 

NOTE: When pairing with a Bluetooth device for the first time, a prompt might appear for a pairing PIN. Commonly used PINs: 0000, 1111 and 1234. Check the printer manufacturer's specifications.

###Finding via Wi-Fi
Printing via Wi-Fi is supported for Android, iOS and Windows Mobile apps. For Wi-Fi printer searching, the `deviceAddress` and `devicePort` parameters can be used to quickly identify known devices:

Sample JavaScript code:
	:::javascript
	Rho.Printer.searchPrinters({ 
		connectionType:Rho.Printer.CONNECTION_TYPE_TCP,  
		deviceAddress: '192.168.1.121',
		devicePort: 6101
		...

NOTE: When attepting to connect via Bluetooth or Wi-Fi, be sure the device's corresponding radio is turned on. If using Bluetooth, the printer should be set to "discoverable."

###Finding via USB
Printing via USB is supported on Android and Windows Mobile/CE devices. To print from a Zebra enterprise mobile computer, it must be connected to one of [Zebra's supported printers](#zebra-printers-with-usb-printing) **using an OTG cable or adapter.**  Windows Mobile/CE devices also must be in 'Host Mode,' which is found under USB Config in the Settings panel.

Sample JavaScript code: 

	:::javascript
	var printers = [];

	Rho.Printer.searchPrinters({ 
		connectionType:Rho.Printer.CONNECTION_TYPE_USB,  
		printerType: Rho.Printer.PRINTER_TYPE_ZEBRA
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

Use the `search.Printers` method  and the connecionType as `CONNECTION_TYPE_USB` parameter to search for printer(s) connected to the mobile device via USB. **This parameter is new in RMS 5.1.**
<br>

####USB Compatibility Alerts

* **A USB On-the-Go (OTG) cable or adapter permits a mobile device to act as 'host' to client peripherals** such as flash drives, keyboards and printers. 

* **Some [Zebra TC7X single/dual slot cradles](https://www.zebra.com/us/en/products/accessories/mobile-computer/cradles/sharecradle-system.html) present a USB micro "AB" receptacle** that allows the TC7X to act as host or client depending on the cable.

* **The Zebra OTG implementation lacks Session Request Protocol (SRP) and Host Negotiation Protocol (HNP)**, portions of the spec that allow connected devices to control power consumption and switch dynamically between host and client modes. 

* **Printing via USB from a cradled device is possible by inserting an OTG micro A connector to the cradle** and connecting the USB-B (or mini-B) end to the printer.

* **OTG supports direct USB connections only**; the use of USB hubs is not supported by the OTG spec. 
<br>  


## 3- Connect to a Printer

The script in STEP 2 executes the callback function of the [searchPrinters](../api/printing#msearchPrintersSTATIC) method, which returns a unique printerID property for each printer found. This ID will be used to establish a connection with the desired printer. After the last printer is found, an additional callback will be triggered and will contain no printerID, signaling the end of search and that it's safe to connect to a printer.

NOTE: This `printerID` is a unique identifier that is tracked by the RhoMobile framework. It has no relation to ID numbers that a printer manufacturer might be using.

At this time there should be one or more `printerID` values in the `printers` array variable. To access one, create an instance of the Printer class by calling the [getPrinterByID](../api//printingzebra#mgetPrinterByIDSTATIC) method and passing a `printerID` as a string to the vairable `myPrinter`:

Sample JavaScript code:
	:::javascript
	// Ex: printers[0] = 'ZEBRA_PRINTER_1'
	var myPrinter = Rho.Printer.getPrinterByID(printers[0]);

	// myPrinter is now an instance class of Printer
	// and can use the Instance Methods and properties associated 
	// with that class


Once you've instantiated a specific printer, your app can connect to it using the [connect](../api/printingzebra#mconnect) method: 

Sample JavaScript code: 
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

The `callback` object in the [connect](../api/printingzebra#mconnect) method will be a `string` containing one of the [PRINTER_STATUS...](../api/printingzebra#Constants) constants. For example: 

- PRINTER_STATUS_SUCCESS
- PRINTER_STATUS_ERR_NETWORK
- PRINTER_STATUS_ERR_TIMEOUT

## 4- Retrieve Printer State
You can also check information about the printer using the [requestState](../api/printingzebra#mrequestState) method, which returns the information in a callback object. The first parameter of this method is an array that lists the items to find. These are [PRINTER_STATE...](../api/printing#Constants) constants. For example: 

- PRINTER_STATE_IS_COVER_OPENED
- PRINTER_STATE_IS_DRAWER_OPENED
- PRINTER_STATE_IS_PAPER_OUT

Sample JavaScript code: 

	:::javascript
	// Assumes you have created the instance 'myPrinter'
	// from previous methods described above
	myPrinter.requestState(['PRINTER_STATE_IS_READY_TO_PRINT',
	'PRINTER_STATE_IS_PAPER_OUT'],function (cb){
		console.log(cb.status);
		console.log(cb.PRINTER_STATE_IS_PAPER_OUT);
		console.log(cb.PRINTER_STATE_IS_READY_TO_PRINT);

		});

## 5- Retrieve Supported Printer Languages
Before sending commands to the printer, you must be aware of which printer languages are supported. For Zebra printers these might include ZPL, CPCL and EPS. To retrieve a list of supported languages, use the [enumerateSupportedControlLanguages](../api/printing#menumerateSupportedControlLanguages) method. 

The callback will be an array of [PRINTER_LANGUAGE...](../api/printing#Constants) constants. For example: 

- PRINTER_LANGUAGE_ZPL
- PRINTER_LANGUAGE_CPCL
- PRINTER_LANGUAGE_EPS

Sample JavaScript code:
		:::javascript
	//assumes you created a printer instance from previous instructions
	myPrinter.enumerateSupportedControlLanguages(function(cb){
		// cb = Array of strings 
		// PRINTER_LANGUAGE_ZPL
		// PRINTER_LANGUAGE_CPCL
		// PRINTER_LANGUAGE_EPS
	});

NOTE: WARNING: Ruby is NOT supported with the CPCL printer language.  

## 6- Begin Sending Printer Commands
Once your app finds and connects to a printer, it can begin sending commands. Printer behavior will vary depending on printer make, model and its current state. Consult your printer's technical documentation for printer-specific commands and syntax.

In general, there are two fundamental ways to send commands:

* In a string that includes raw printer commands
* In a series of commands stored in a file (i.e. ZPL, CPCL)

### Sending a Raw String
To send a string to the printer, you use the [printRawString](../api//printingzebra#mprintRawString) method: 

	:::javascript
	// If my printer was in line mode I would see this text printed
	myPrinter.printRawString('This is a test print');

	// Example of sending a Zebra CPCL Command
	// changing from line mode to ZPL mode
	myPrinter.printRawString('! U1 setvar "device.languages" "ZPL"\r\n');

### Sending a Series of Commands
When a series of commands is used repeatedly by an app, they can be stored in a file (i.e. ZPL, CPCL) and modified programatically to perform a task, for example to print an address label. Command files can be generated manually or made using a tool provided by Zebra. They can be created in advance and delivered with the application. 

For example, let's say we created a file called `address.cpcl` that's stored in the application's `public` folder. This file will contain CPCL commands that will be used to print an address, and might look something like the one below.  

Sample terminal script file with embedded CPCL commands: 
	:::term
	! U1 SETLP 5 2 46
	AURORA'S FABRIC SHOP
	! U1 SETLP 7 0 24
	123 Castle Drive, Kingston, RI 02881
	(401) 555-4CUT

You can use the [RhoFile.join](../api/File#mjoinSTATIC) helper function and the [Application.publicFolder](../api/Application#ppublicFolder) property to create a fully qualified path to the `address.cpcl` file. This file path would then be passed to the [sendFileContents](../api/printingzebra#msendFileContents) method: 


Sample JavaScript code:
	:::javascript
	var addressFile = Rho.RhoFile.join(Rho.Application.publicFolder, 'address.cpcl');

	//assuming you made an instance and connected per the previous instructions
	myPrinter.sendFileContents(addressFile,function(e){
		console.log(e);
		// Will return a PRINTER_STATUS... CONSTANT String
		});

## 7- Disconnect
Whenever your app is finished printing, it's important to disconnect from the printer. This is especially important for Bluetooth connections. To disconnect, use the [disconnect](../api/printingzebra#mdisconnect) method:

	:::javacript
	//assumes you already created an instance object from previous instructions
	myPrinter.disconnect();

## Using Files Stored On The Printer
Some printers have the ability to store command-file templates or other files useful for performaing print operations. To retrieve a list of files that exist on the printer, use the [retrieveFileNames](../api/printingzebra#mretrieveFileNames) method: 

Sample JavaScript code: 
	:::javascript
	myPrinter.retrieveFileNames(function (e){
		// e.status : PRINTER_STATUS_SUCCESS, PRINTER_STATUS_ERROR
		// e.fileNames : ARRAY of file names
		//
	});

Once the file names are known, your app can print to them, passing variables as specified within the ZPL or CPCL files themselves. This is done using either the [printStoredFormatWithArray](../api/printingzebra#mprintStoredFormatWithArray) method or the [printStoredFormatWithHash](../api/printingzebra#mprintStoredFormatWithHash) method. Both include three parameters:

###Parameter 1- formatPathOnPrinter
This will be 'E:filename' where 'filename' is the name of the file that we sent in the previous step, or one that existed on the device (assuming the file is on the printer's 'E' partition)

###Parameter 2- vars 
This represents the data we want to pass to the label. 

`printStoredFormatWithArray` - An array of strings representing the data to fill into the format. For ZPL formats, index 0 of the array corresponds to field number 2 (^FN2). For CPCL, the variables are passed in the order that they are found in the format 

Sample JavaScript code:
	:::javascript
	myPrinter.printStoredFormatWithArray('E:LABEL.ZPL',['John Doe','123 East Main St','Smalltown, NY 11766'],function (e){
			// Will return a PRINTER_STATUS... CONSTANT String
		});

`printStoredFormatWithHash` (supported by ZPL only) - A hash which contains the key/value pairs for the stored format. For ZPL formats, the key number should correspond directly to the number of the field in the format. Number keys should be passed as string ex: '1':'field1', '2':'field2' etc. 

Sample JavaScript code:
	:::javascript 
	myPrinter.printStoredFormatWithHash('E:LABEL.ZPL',{ '1':'John Doe','2': '123 East Main St','3': Smalltown, NY 11766'},function (e){

		// e = PRINTER_STATUS... CONSTANT String
		if(e == 'PRINTER_STATUS_SUCCESS')
			{
			
			}
		});


###Parameter 3- callback
This will return a [PRINTER_STATUS...](../api/printingzebra#Constants) constant as a string.

## Printing Images
For printers with graphics support, images are printed using the [printImageFromFile](../api/printingzebra#mprintImageFromFile) method. For example, an image called `myImage.jpg` in your application's `public` folder could use the same [RhoFile.join](../api/File#mjoinSTATIC) helper function and [Application.publicFolder](../api/Application#ppublicFolder) property described above to create a fully qualified path to the `myImage.jpg` file. The file could then be passed to the [printImageFromFile](../api/printingzebra#mprintImageFromFile) method:

Sample JavaScript code:
	:::javascript
	var imagefile = Rho.RhoFile.join(Rho.Application.publicFolder, 'myImage.jpg');

	//assuming you made an instance and connected per the previous instructions
	myPrinter.printImageFromFile(imagefile,0,0,{},function(e){

		// e = PRINTER_STATUS... CONSTANT String
		if(e == 'PRINTER_STATUS_SUCCESS')
			{
			
			}
		});

A callback for the [PRINTER_STATUS](../api/printingzebra#Constants) constant would return a string indicating whether the operation was successful.

NOTE: Images larger than 1024x768 might take a long time or print incorrectly. Consult the printer manufacturer's documentation for image printing parameters. 

### Storing Images
Some Zebra printers support the storage of images. You can accomplish this by creating your own ZPL or CPL command set, or use the [storeImage](../api/printingzebra#mstoreImage) method: 

Sample JavaScript code:
	:::javascript
	//location of image on device
	var imagefile = Rho.RhoFile.join(Rho.Application.publicFolder, 'myImage.jpg');

	//destination of image on the printer. Must have partion specified
	var destination = "E:LOGO.GRF"

	//assuming you made an instance and connected per the previous instructions
	myPrinter.storeImageFromFile(destination,imagefile,0,0,{},function(e){
		
		// e = PRINTER_STATUS... CONSTANT String
		if(e == 'PRINTER_STATUS_SUCCESS')
			{

			}
		});


## Platform Notes
### Windows Mobile / Windows CE
#### Requirements
Windows Mobile/CE require that a provided `printing-service` application is installed and always running in order to use the [Printing](../api/printing) and [PrintingZebra](../api/printingzebra) APIs.

* Before installing the printing service on Windows Mobile devices, you first need to install the [.NET compact framework](http://www.microsoft.com/en-us/download/details.aspx?id=65) on your device. You may find the device installation package on your build machine at `C:\Program Files (x86)\Microsoft.NET\SDK\CompactFramework\v3.5\WindowsCE\NETCFv35.wm.armv4i.cab`
* Windows CE only - You'll also need to install the messaging framework found on your build machine at `C:\Program Files (x86)\Microsoft.NET\SDK\CompactFramework\v3.5\WindowsCE\Diagnostics\NETCFv35.Messages.EN.cab` on Windows 7.

#### Printing-Service Installation
* The .cab file for the printing service is held inside the `printing-service` folder inside your RhoMobile Suite installation directory located at `C:\<path to your rhomobile suite installation>\printing-service\PrintingService.cab`

#### Limitations
* The printing service currently supports a single client at a time. Multi-client printing will be introduced in a future version of RMS.
* The method [`Printer.requestState()`](../api/printing#mrequestState) does not work with Bluetooth printers.
* The method [`Printer.stopSearch()`](../api/printing#mstopSearchSTATIC) currently does not work.

##Zebra Printers With USB Printing

<P>
<table class="table table-striped">
<tr>
<th class="text-centered">Device</th>
<th class="text-centered"><nobr>Device family</nobr></th>
<th class="text-centered">Device model(s)</th>
<th class="text-centered">Operating System(s)</th>
</tr>
<tr>
<td class="clsSyntaxCells clsOddRow"><img id="mz220pic" src="https://www.zebra.com/content/zebra1/us/en/support-downloads/mobile/mz-220/_jcr_content/mainpar/twocol/leftpar/image.img.jpg/x1426279604956.jpg.pagespeed.ic.F9pw8Srpwb.jpg" height="75"></img></td>
<td class="clsSyntaxCells clsOddRow"><b>MZ</b></td>
<td class="clsSyntaxCells clsOddRow">MZ 220, MZ 320</td>
<td class="clsSyntaxCells clsOddRow">Android, Mac OS X, Windows Mobile, CE, x86</td>
</tr>
<tr>
<td class="clsSyntaxCells clsOddRow"><img id="imz220pic" src="https://www.zebra.com/content/zebra1/us/en/products/printers/mobile/mz-series/_jcr_content/mainpar/tabscontainer/overview/content/productmodel_1d2c/image.img.png/x1426276854144.png.pagespeed.ic.OndlAqm5W1.png" height="75"></img></td>
<td class="clsSyntaxCells clsOddRow"><b>iMZ</b></td>
<td class="clsSyntaxCells clsOddRow">iMZ 220, iMZ 320</td>
<td class="clsSyntaxCells clsOddRow">Android, Mac OS X, Windows Mobile, CE, x86</td>
</tr>
<tr>
<td class="clsSyntaxCells clsOddRow"><img id="rw420pic" src="https://www.zebra.com/content/zebra1/us/en/products/printers/mobile/rw-series/_jcr_content/mainpar/tabscontainer/overview/content/productmodel/image.img.jpg/1426276849211.jpg" height="75"></img></td>
<td class="clsSyntaxCells clsOddRow"><b>RW</b></td>
<td class="clsSyntaxCells clsOddRow">RW 220, RW 420, RW 420 Print Station</td>
<td class="clsSyntaxCells usb comp">Android, Mac OS X, Windows Mobile, CE, x86</td>
</tr>
<tr>
<td class="clsSyntaxCells clsOddRow"><img id="rp4tpic" src="https://www.zebra.com/content/zebra1/us/en/support-downloads/passive-rfid/rp4t/_jcr_content/mainpar/twocol/leftpar/image.img.jpg/1426279500551.jpg" height="75"></img></td>
<td class="clsSyntaxCells clsOddRow"><b>P4T</b></td>
<td class="clsSyntaxCells clsOddRow">P4T, RP4T Passive RFID Printer</td>
<td class="clsSyntaxCells clsOddRow">Android, Mac OS X, Windows Mobile, CE, x86</td>
</tr>
<tr>
<td class="clsSyntaxCells clsOddRow"><img id="zd500rpic" src="https://www.zebra.com/content/zebra1/us/en/products/printers/rfid/zd500r/_jcr_content/mainpar/tabscontainer/detailed-specs/content/subtabscontainer_540/zd500r/content/twocol_83b/leftpar/image_236a.img.png/1433356327246.png" height="75"></img></td>
<td class="clsSyntaxCells clsOddRow"><b>ZD500R</b></td>
<td class="clsSyntaxCells clsOddRow">ZD500R RFID Printer</td>
<td class="clsSyntaxCells clsOddRow">Android, Mac OS X, Windows Mobile, CE, x86</td>
</tr>
<td class="clsSyntaxCells clsOddRow"><b></b></td>
<td class="clsSyntaxCells clsOddRow">NOTE: Printing via USB is NOT supported on iOS devices.</td>
<td class="clsSyntaxCells clsOddRow"><b></b></td>
<td class="clsSyntaxCells clsOddRow">NOTE: Zebra's QL Plus and QLn series printers DO NOT support Android USB printing.</td>
</tr>
</table>

