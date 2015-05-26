# Printing

## Overview
In RhoMobile Suite 4.1, we introduced a simplified method for printing. In this release we are currently supporting printing to Zebra printers only (via WiFi and Bluetooth
  ), but in subsequent releases we will be adding different printer types. 

## Enabling the APIs
In the [API reference](apisummary), you will see two new APIs: [Printing](../api/printing) and [PrintingZebra](../api/printingzebra). The `Printing` API is a parent class that is defined to easily define common class attributes that specific printer type APIs like [PrintingZebra](../api/printingzebra) will inherit. To enable this functionality in your application, your must include both of these extensions in you build.yml

    :::ruby
    extensions: ["printing","printing_zebra"]

## Finding Printers
In order to print you must first find and connect to a printer. There are a few different ways to do this, but they all use the [searchPrinters Method](../api/printing#msearchPrintersSTATIC). 

For example, in the following code snippet, we are looking for any Zebra printers over Bluetooth
   only, by specifying `connectionType` and `printerType` in the `options` parameter:

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

NOTE: It is recommended to provide as many parameters as possible to reduce the search time.

If we knew the printer's Bluetooth address we could have specified the `deviceAddress` in the `options` parameter. When you are connecting for the first time to your device, you may be prompted for the devices Bluetooth secure pairing PIN. usually by default manufacturers use `0000`, `1111` or `1234`.

	:::javascript
	Rho.PrinterZebra.searchPrinters({ 
		connectionType:Rho.Printer.CONNECTION_TYPE_BLUETOOTH,  
		deviceAddress: '00:03:7A:4C:F2:DB'
		...

NOTE: The deviceAddress for a Bluetooth device must include the ':' like ##:##:##:##:##:##. The discovery process may take several seconds to complete.

Likewise, if we were searching for a printer over WiFi, we could have also used the `deviceAddress` & `devicePort` parameters.
	:::javascript
	Rho.Printer.searchPrinters({ 
		connectionType:Rho.Printer.CONNECTION_TYPE_TCP,  
		deviceAddress: '192.168.1.121',
		devicePort: 8080
		...

NOTE: Be sure that your Bluetooth or WiFi radios are turned on in your device. Your printer should also be in Bluetooth discover mode

The searchPrinters `callback function` will be executed for each printer found. The callback will include a `printerID` property, which will be used to establish a connection with the printer. When the search is complete, it will issue one more callback with a success status, but will not contain a printerID. You would use this as an indication that the search process is complete and it is safe to connect to the printer.

NOTE: This ID is a unique ID that the RhoMobile framework keeps track of. It is not an ID that the printer manufacturer may be using.

## Connecting to the Printer
Now that we found the printers using the `searchPrinters` method, we should have a `printerID` in our `printers array variable`. We create an instance of Printer class by calling the [getPrinterByID method](../api//printingzebra#mgetPrinterByIDSTATIC) and pass in a string that is the printerID that was returned in the `searchPrinters` call

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
Before you should send any commands to the printer, you should know what languages the printer supports. In the case of Zebra these may be ZPL, CPCL, EPS, etc. You can do this by using the [enumerateSupportedControlLanguages method](../api/printing#menumerateSupportedControlLanguages). The callback will be an array of [PRINTER_LANGUAGE... Constants](../api/printing#Constants):

	:::javascript
	//assumes you created a printer instance from previous instructions
	myPrinter.enumerateSupportedControlLanguages(function(cb){
		// cb = Array of strings 
		// PRINTER_LANGUAGE_ZPL
		// PRINTER_LANGUAGE_CPCL
		// PRINTER_LANGUAGE_EPS
	});

## Sending Printer Commands
Now that we found and connected to the printer, we can send commands to the printer. Depending on your printer model and the current state it is in, you may see different behavior. Commands for each printer will not be discussed here, you should consult the manufacturers' technical documentation. There are two fundamental ways for sending commands

* Sending a string that includes raw printer commands
* Sending a series of commands that are stored in a file ex: ZPL,CPCL

### Sending a Raw String
To send a string to the printer, you use the [printRawString method](../api//printingzebra#mprintRawString)

	:::javascript
	// If my printer was in line mode I would see this text printed
	myPrinter.printRawString('This is a test print');

	// Example of sending a Zebra CPCL Command
	// changing from linemode to ZPL mode
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
Be sure to disconnect from the printer when not in use. This is especially true for BoueTooth connections. To do this you will use the [disconnect method](../api/printingzebra#mdisconnect)

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
* The method [`Printer.requestState()`](../api/printing#mrequestState) does not work with bluetooth printers.
* The method [`Printer.stopSearch()`](../api/printing#mstopSearchSTATIC) currently does not work.