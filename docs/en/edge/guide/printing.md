# Printing
## Overview
RhoMobile Suite 5.1 permits printing via Bluetooth and Wi-Fi from mobile devices running Android, iOS and Windows Mobile. It also supports printing via USB from Android devices, which is **new in version 5.1**. To print via USB, the Zebra Android device must be connected to one of [Zebra's supported printers](http://127.0.0.1:9393/en/edge/guide/printing#supported-printers) using a USB adapter or cradle. 

To facilitate USB printing, the RhoMobile Printing API now incldues the `CONNECTION_TYPE_USB` parameter. The API is otherwise unchanged, and operates in exactly the same way as in prior editions.

This guide is designed to provide an overview of the steps necessary to enable printing in a RhoMobile application. Where appropriate, it contains links to details for the calls, methods, parameters, constants and other specifics necessary to build your application using the Zebra printing APIs. 

## 1) Enable Print APIs
In the [API reference](apisummary) contains two APIs. The [Printing](../api/printing) API is a parent class that defines common class attributes that specific printer-type APIs will inherit. The [PrintingZebra](../api/printingzebra) is the printer-type API for Zebra printers. 

**To enable printing in your application, your `build.yml` must include both of these extensions**. 

Sample Ruby code: 

    :::ruby
    extensions: ["printing","printing_zebra"]

## 2) Find a Printer
Before your app can print, it must first discover and connect to a printer. There are a few ways to discover printers, but all use the [searchPrinters](../api/printing#msearchPrintersSTATIC) method.

###Finding via Bluetooth
Printing via Bluetooth is supported by Android, iOS and Windows Mobile apps. **During Bluetooth discovery, the printer must be in "discoverable" mode.** The following JavaScript code looks for any Zebra printers discoverable via Bluetooth by specifying the `connectionType` and `printerType` in the `options` parameter:

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

NOTE: TIP: To minimize search time, your script should provide as many search parameters as possible.

The Bluetooth MAC address consists of six groups of two hexadecimal digits separated by colons. If a printer's Bluetooth MAC address is known, it can be specified as a `deviceAddress` using the `options` parameter, as below. 

Sample JavaScript code: 
	:::javascript
	Rho.PrinterZebra.searchPrinters({ 
		connectionType:Rho.Printer.CONNECTION_TYPE_BLUETOOTH,  
		deviceAddress: '00:03:7A:4C:F2:DB'
		... 

NOTE: When pairing with a Bluetooth device for the first time, a prompt might appear for a pairing PIN. Commonly used PINs include `0000`, `1111` and `1234`. Check the printer manufacturer's specifications.

###Finding via Wi-Fi
Printing via Wi-Fi is supported by Android, iOS and Windows Mobile apps. For Wi-Fi printer searching, the `deviceAddress` and `devicePort` parameters can be used to quickly identify known devices, as below.

Sample JavaScript code:
	:::javascript
	Rho.Printer.searchPrinters({ 
		connectionType:Rho.Printer.CONNECTION_TYPE_TCP,  
		deviceAddress: '192.168.1.121',
		devicePort: 8080
		...

NOTE: When attepting to connect via Bluetooth or Wi-Fi, be sure the apprporiate radio is turned on in the device. If using Bluetooth, the printer should be in discover mode.

###Finding via USB
In the current version, printing via USB is supported for Android apps only. To print from one of Zebra's Android devices, the device must be connected to one of the [supported Zebra printers](http://127.0.0.1:9393/en/edge/guide/printing#supported-printers) **using an OTG cable, adapter or cradle.**

NOTE: Printing via USB from a mobile device requires a USB On-the-Go (OTG) cable, which permits the device to act as a host to the client printer. 

Use the `search.Printers` method  and the `CONNECTION_TYPE_USB` parameter to search for printer(s) connected to the mobile device via USB. **This parameter is new in RMS 5.1; it is not present in prior versions.**

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

## 3) Connect to the Printer

>> The scripts in STEP 2 repeat the `searchPrinters` callback function until no more printers are found. The callback's `printerID` property will be used to establish a connection with the desired printer. When a search is complete, `searchPrinters` will issue one additional callback with a success status but the result will contain no `printerID`. You would use this as an indication that the search process is complete and it is safe to connect to one of the found printers.

NOTE: This ID is a unique identifier that is tracked by the RhoMobile framework. It is different from any ID that the printer manufacturer might be using.

Now that we found the printers using the `searchPrinters` method, we should have a `printerID` in our `printers array variable`. We create an instance of Printer class by calling the [getPrinterByID](../api//printingzebra#mgetPrinterByIDSTATIC) method and pass in a string that is the printerID that was returned in the `searchPrinters` call.

	:::javascript
	// Ex: printers[0] = 'ZEBRA_PRINTER_1'
	var myPrinter = Rho.Printer.getPrinterByID(printers[0]);

	// myPrinter is now an instance class of Printer
	// and can use the Instance Methods and properties associated 
	// with that class


Once we have an instance to a specific printer we now must make a connection, using the [connect method](../api/printingzebra#mconnect), before executing any additional commands:
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

The callback object in the `connect` method will be a `string` containing one of the [PRINTER_STATUS...](../api/printingzebra#Constants) constants.

## Getting Printer State
You can also check some information about the printer using the [requestState method](../api/printingzebra#mrequestState). This method sends a message to the printer to retrieve the current status and returns the information in a callback. The first parameter of this method is an array that lists the items to find. These are [Printer Constants](../api/printing#Constants) that start with `PRINTER_STATE`. Each state you specify will be returned as a property of the callback object.

	:::javascript
	// Assumes you have created an instance 'myPrinter'
	// from previous methods described
	myPrinter.requestState(['PRINTER_STATE_IS_READY_TO_PRINT',
		'PRINTER_STATE_IS_PAPER_OUT'],function (cb){
			console.log(cb.status);
			console.log(cb.PRINTER_STATE_IS_PAPER_OUT);
			console.log(cb.PRINTER_STATE_IS_READY_TO_PRINT);

		});

## Getting Supported Printer Languages
Before sending commands to the printer, you should be aware of which languages are supported. For Zebra printers these might include ZPL, CPCL, EPS, etc. 

To retrieve a list of supported languages, use the method: [enumerateSupportedControlLanguages](../api/printing#menumerateSupportedControlLanguages). 

The callback will be an array of [PRINTER_LANGUAGE... Constants](../api/printing#Constants):

	:::javascript
	//assumes you created a printer instance from previous instructions
	myPrinter.enumerateSupportedControlLanguages(function(cb){
		// cb = Array of strings 
		// PRINTER_LANGUAGE_ZPL
		// PRINTER_LANGUAGE_CPCL
		// PRINTER_LANGUAGE_EPS
	});

## Sending Printer Commands
Once found and connected, the printer can begin to receive commands. Printer behavior will vary depending on the make, model and current state of the printer. Consult your printer's technical documentation for printer-specific commands and syntax. 

In general, there are two fundamental ways for sending commands:

* Sending a string that includes raw printer commands
* Sending a series of commands stored in a file (i.e. ZPL, CPCL)

### Sending a Raw String
To send a string to the printer, you use the [printRawString method](../api//printingzebra#mprintRawString)

	:::javascript
	// If my printer was in line mode I would see this text printed
	myPrinter.printRawString('This is a test print');

	// Example of sending a Zebra CPCL Command
	// changing from line mode to ZPL mode
	myPrinter.printRawString('! U1 setvar "device.languages" "ZPL"\r\n');

### Sending a Series of Commands
Typically, there will be a series of commands that need to be executed. These command files(ex; ZPL, CPCL) can be generated by hand or from a tool provided by Zebra. You can include these files in your application, so that they can be used.

Assuming we have a file `address.cpcl` stored in the application's `public` folder, which has CPCL commands to print an address:
	:::term
	! U1 SETLP 5 2 46
	AURORA'S FABRIC SHOP
	! U1 SETLP 7 0 24
	123 Castle Drive, Kingston, RI 02881
	(401) 555-4CUT

You can use the [RhoFile.join](../api/File#mjoinSTATIC) helper function and [Application.publicFolder](../api/Application#ppublicFolder) property to create a fully qualified path to the `address.cpcl` file. This file path is passed to the [sendFileContents method](../api/printingzebra#msendFileContents):

	:::javascript
	var addressFile = Rho.RhoFile.join(Rho.Application.publicFolder, 'address.cpcl');

	//assuming you made an instance and connected per the previous instructions
	myPrinter.sendFileContents(addressFile,function(e){
		console.log(e);
		// Will return a PRINTER_STATUS... CONSTANT String
		});

## Using Files Already Stored On The Printer
You may have already stored files on the printer or have been included through some other means. You can retrieve a list of files that exists on the printer by using the [retrieveFileNames method](../api/printingzebra#mretrieveFileNames)

	:::javascript
	myPrinter.retrieveFileNames(function (e){
		// e.status : PRINTER_STATUS_SUCCESS, PRINTER_STATUS_ERROR
		// e.fileNames : ARRAY of file names
		//
	});

Now that we have the names of the files stored on the printer, we can print to them and pass in variables that the file is expecting (specified in the ZPL or CPCL file). We do this either using the [printStoredFormatWithArray method](../api/printingzebra#mprintStoredFormatWithArray) or the [printStoredFormatWithHash method](../api/printingzebra#mprintStoredFormatWithHash). Both of these include three parameters:

*formatPathOnPrinter - this will be 'E:filename' where 'filename' is the name of the file that we sent in the previous step, or one that existed on the device (assuming the file is on the printers 'E' partition)

*vars - This represents the data we want to pass to the label. 

`printStoredFormatWithArray` - An array of strings representing the data to fill into the format. For ZPL formats, index 0 of the array corresponds to field number 2 (^FN2). For CPCL, the variables are passed in the order that they are found in the format 

`printStoredFormatWithHash` (Only ZPL Support) - An hash which contains the key/value pairs for the stored format. For ZPL formats, the key number should correspond directly to the number of the field in the format. Number keys should be passed as string ex: '1':'field1', '2':'field2' etc. 

*callback - Will return a PRINTER_STATUS... CONSTANT String

Example using `printStoredFormatWithArray`
	:::javascript
	myPrinter.printStoredFormatWithArray('E:LABEL.ZPL',['John Doe','123 East Main St','Smalltown, NY 11766'],function (e){
			// Will return a PRINTER_STATUS... CONSTANT String
		});

Example using `printStoredFormatWithHash`
	:::javascript 
	myPrinter.printStoredFormatWithHash('E:LABEL.ZPL',{ '1':'John Doe','2': '123 East Main St','3': Smalltown, NY 11766'},function (e){

		// e = PRINTER_STATUS... CONSTANT String
		if(e == 'PRINTER_STATUS_SUCCESS')
			{
			
			}
		});


## Printing Images
You can also print images using the [printImageFromFile method](../api/printingzebra#mprintImageFromFile) (as long as your printer supports images). Say for example, you had included an image called `myImage.jpg` in the `public` folder of your application. You can use the [RhoFile.join](../api/File#mjoinSTATIC) helper function and [Application.publicFolder](../api/Application#ppublicFolder) property to create a fully qualified path to the `myImage.jpg` file. This file path is passed to the `printImageFromFile` method:

	:::javascript
	var imagefile = Rho.RhoFile.join(Rho.Application.publicFolder, 'myImage.jpg');

	//assuming you made an instance and connected per the previous instructions
	myPrinter.printImageFromFile(imagefile,0,0,{},function(e){

		// e = PRINTER_STATUS... CONSTANT String
		if(e == 'PRINTER_STATUS_SUCCESS')
			{
			
			}
		});

The callback will be a [PRINTER_STATUS constant string](../api/printingzebra#Constants) indicating if the operation was successful or not.

NOTE: If the image resolution is large (e.g. 1024x768) this method may take a long time to execute. It is not guaranteed that files larger than 1024x1024 could be printed correctly. You should also consult the manufacturers' documentation on image support for your printer. The image may need to be of a certain size and color depth before sending to the printer.

### Storing Images
Some Zebra printers support storing images. You can accomplish this by creating  your own ZPL or CPL command set, or use the [storeImage method](../api/printingzebra#mstoreImage)

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


## Disconnecting
Be sure to disconnect the printer when not in use. This is especially important for Bluetooth connections. To do this you will use the [disconnect method](../api/printingzebra#mdisconnect)

	:::javacript
	//assumes you already created an instance object from previous instructions
	myPrinter.disconnect();

## Platform Notes
### Windows Mobile / Windows CE
#### Requirements
Windows Mobile/CE require that a provided `printing-service` application is installed and always running in order to use the [Printing API](../api/printing) or [PrintingZebra API](../api/printingzebra).

* Before installing the printing service on Windows Mobile devices, you first need to install the [.NET compact framework](http://www.microsoft.com/en-us/download/details.aspx?id=65) on your device. You may find the device installation package on your build machine at `C:\Program Files (x86)\Microsoft.NET\SDK\CompactFramework\v3.5\WindowsCE\NETCFv35.wm.armv4i.cab`
* Windows CE only - You'll need to also install the messaging framework found on your build machine at `C:\Program Files (x86)\Microsoft.NET\SDK\CompactFramework\v3.5\WindowsCE\Diagnostics\NETCFv35.Messages.EN.cab` on Windows 7.

#### Printing-Service Installation
* The .cab file for the printing service is held inside the `printing-service` folder inside your RhoMobile Suite installation directory located at `C:\<path to your rhomobile suite installation>\printing-service\PrintingService.cab`

#### Limitations
* Currently, the printing service only works with one client at a time but, this will be changed in RE 5.0 to include a multi-client mode.
* The method [`Printer.requestState()`](../api/printing#mrequestState) does not work with Bluetooth printers.
* The method [`Printer.stopSearch()`](../api/printing#mstopSearchSTATIC) currently does not work.

##Supported Printers

<P>
<table class="table table-striped">
<tr>
<th class="text-centered"></th>
<th class="text-centered"><nobr>Device family</nobr></th>
<th class="text-centered">Device model(s)</th>
<th class="text-centered">Operating System(s)</th>
</tr>
<tr>
<td class="clsSyntaxCells clsOddRow"><img id="mz220pic" src="https://www.zebra.com/content/zebra1/us/en/support-downloads/mobile/mz-220/_jcr_content/mainpar/twocol/leftpar/image.img.jpg/x1426279604956.jpg.pagespeed.ic.F9pw8Srpwb.jpg" height="75"></img></td>
<td class="clsSyntaxCells clsOddRow"><b>MZ</b></td>
<td class="clsSyntaxCells clsOddRow">MZ 220, MZ 320</td>
<td class="clsSyntaxCells clsOddRow">Android, iOS, WM</td>
</tr>
<tr>
<td class="clsSyntaxCells clsOddRow"><img id="imz220pic" src="https://www.zebra.com/content/zebra1/us/en/products/printers/mobile/mz-series/_jcr_content/mainpar/tabscontainer/overview/content/productmodel_1d2c/image.img.png/x1426276854144.png.pagespeed.ic.OndlAqm5W1.png" height="75"></img></td>
<td class="clsSyntaxCells clsOddRow"><b>iMZ</b></td>
<td class="clsSyntaxCells clsOddRow">iMZ 220, iMZ 320</td>
<td class="clsSyntaxCells clsOddRow">Android, iOS, WM</td>
</tr>
<tr>
<td class="clsSyntaxCells clsOddRow"><img id="rw420pic" src="https://www.zebra.com/content/zebra1/us/en/products/printers/mobile/rw-series/_jcr_content/mainpar/tabscontainer/overview/content/productmodel/image.img.jpg/1426276849211.jpg" height="75"></img></td>
<td class="clsSyntaxCells clsOddRow"><b>RW</b></td>
<td class="clsSyntaxCells clsOddRow">RW 220, RW 420, RW 420 Print Station</td>
<td class="clsSyntaxCells clsOddRow">Android, iOS, WM</td>
</tr>
<tr>
<td class="clsSyntaxCells clsOddRow"><img id="rp4tpic" src="https://www.zebra.com/content/zebra1/us/en/support-downloads/passive-rfid/rp4t/_jcr_content/mainpar/twocol/leftpar/image.img.jpg/1426279500551.jpg" height="75"></img></td>
<td class="clsSyntaxCells clsOddRow"><b>P4T</b></td>
<td class="clsSyntaxCells clsOddRow">P4T, RP4T Passive RFID Printer</td>
<td class="clsSyntaxCells clsOddRow">Android, iOS, WM</td>
</tr>
<td class="clsSyntaxCells clsOddRow"><b></b></td>
<td class="clsSyntaxCells clsOddRow">NOTE: Printing via USB is supported from Android devices only.</td>
<td class="clsSyntaxCells clsOddRow"><b></b></td>
<td class="clsSyntaxCells clsOddRow">NOTE: Zebra's QL Plus and QLn series printers DO NOT support USB printing.</td>
</tr>
</table>

