# Printing API Tutorial

This tutorial covers the use of the Enterprise Browser [Printer API](#api-printing) and [PrinterZebra API](#api-printingzebra), as well as some of the typical considerations when working with USB and wireless printers. 

The level of instruction in this tutorial is higher than that of other EB tutorials. Completion of the main training module and several additional EB tutorials is recommended (see below). This tutorial enables the sample app from the MBS1018 lesson to print a ticket with a barcode that contains a summary of error data to a printer attached directly to the mobile device.

**Note: The code in this tutorial does not implement barcode printing**.

##Prerequisites

The following are **required** to complete this tutorial:

* A background in HTML, CSS and JavaScript coding 
* Enterprise Browser installed on a development PC 
* A Zebra mobile device and USB cable
* Enterprise Browser installed on the Zebra device
* A supported Zebra or third-party printer 
* Appropriate printer drivers installed on the mobile device


The following are **strongly recommended**:

* Completion of the [MBS1018 Enterprise Browser Development Fundamentals](https://www.youtube.com/watch?v=7llcPIWazkU) training (or equivalent knowledge)
* Completion of sample application from the MBS1018 training
* Completion of one or more EB API tutorials ([Barcode API Tutorial](#guide-tutorial-barcode) at minimum)

##Coding for the Printing API

Those who've completed the Barcode tutorial will find the Printer tutorial quite similar. All calls are callback-based and the process follows the Search → Connect → Initialize → Act formula used by other Zebra APIs that work with peripherals. 


###Overview

Condensed into its basic steps, the printing process involves: 

####1-Search and Connect:

* Find and enumerate all visible devices (consider USB, BT and Wi-Fi connections)
* Identify the desired output device 
* Connect/pair with the device

####2-Initialize:

* Check for printer readiness (connection, media, open doors, etc.)
* Initialize printer
* Configure parameters, invoke template, etc.

####3-Print:

* Send raw ZPL data, text, images, templates
* Check results and status

###Sample app

The starting point for this tutorial is the sample app from the MBS1018 lesson. If you have not completed that training or didn't save the app, please [download the sample app]() now. 

To this app, we will add:

* A 'Print' button
* The code required to find, connect and print

At the end of this tutorial, the resulting application will look like the one below: 

<img style="height:400px" src="images/eb_tutorials/Printing_API_tutorial_02.png"/>


###Preparation

--------->>>>>>> NUMBER THESE STEPS <<<<<<<----------

First, let’s add the Print button to our main HTML form. We will also add a placeholder for print status to hold various log messages and alerts during the print. This is very useful to let the user know of printing progress, potential connection errors, lack of paper, etc, when you don’t want to bombard them with alerts and popups. We will add all this right after the quit button. 

		:::JavaScript
		<button onClick="EB.Application.quit()">Quit</button>
	<!-- insert the following after the line above -->
		<button id=”PrintBtn” onClick="print_ticket()">Print</button>
		<div><span id="print_status"></span></div>
	<!-- insert the above before the line below -->
		</BODY>


The Print APIs requires individual print `modules eb.printer.js` and `eb.printerzebra.js`, which are part of the `ebapi-modules.js` library. This latter library should should already have been included in the app's HTML file:

	:::JavaScript
	<script type="text/javascript" charset="utf-8" src="ebapi-modules.js"></script>

For more information about how to include API modules, please refer to the [Printing API](#api-printing). 

###The main flow
The key printing process flow fits in four lines of code and can be generally described like this:

		:::JavaScript
	// some prep here, then search all the printers,
	// this can take some time – must use callback:

		EB.PrinterZebra.searchPrinters (<search params>, search_callback)

	// to select a printer, consider what was found: 0 or >1,
	// potentially displaying UI to pick and pair with the right one:

		var myPrinter = EB.PrinterZebra.getPrinterByID()

	// actually connect, might take time, so has async callback:

		myPrinter.connect(connect_callback)

	// finally print, also takes time – use callback
	// prints text, barcodes, images, templates, raw ZPL 
	// other command languages, etc.: 

		myPrinter.print...(<data>) //printFromFile, printStoredFormat, printRawString, etc

This is the minimal logic required. Let’s implement it and later see what additional features we might need.

Since all the code is callback-based, the actual code structure may be presented as follows (note the nested inline functions). The comments show additional work that logically should be there, but isn’t strictly necessary for the proof-of-concept code:

		:::JavaScript
	function print_ticket() {
	/* 
	some prep here, discussed later
	...
	then search all the printers 
	*/
			EB.PrinterZebra.searchPrinters (<search params here>, function(cb) {	
		/* 
		do some prep here, such as checking if we have actually found any printers
		... 
		then decide if this is the right one and connect
		note that this callback will be called individually for every printer found this simple code expects just one printer
		*/
			var myPrinter = EB.PrinterZebra.getPrinterByID(cb.printerID)
			myPrinter.connect(function(cb){
		/*
		check if connection is success 
		check printer state and set any options and parameters
		upload any images and format files
		check if the printer is ready, then print
		...
		*/
		// Assumung printer is in ZPL mode, ready and many other addumptinons

			myPrinter.printRawString('^XA^FO20,20^AD^FDTest^XZ',{},function(cb) {

		// update status, display "please wait ", error processing, etc
		// can be ignored for PoC code, but a bad idea in production
				})	
			})
		})
	}

This is the key “skeleton” code. Even without everything mentioned in comments, this code will actually print something. Just add the search parameters based on the printer connection type here are the sample search parameter hashes:

TCP/IP (wired or Wi-Fi) with specific address and port:

		:::JavaScript
	{"deviceAddress":"1.2.3.4","devicePort":6101,"connectionType":EB.Printer.CONNECTION_TYPE_TCP}

If the IP address is not specified, the device will sweep the entire /8 (255.0.0.0) subnet, and generally cause a long delay. 

Bluetooth with specific MAC Address:

		:::JavaScript
	{"deviceAddress":"00225898D8CB","connectionType":EB.Printer.CONNECTION_TYPE_BLUETOOTH}

If no BlueTooth MAC address is specified, all devices within range--headsets, laptops, TVs and printers-–will be returned. EB cannot identify a printing device until after it has paired with one.

Android OS security model does not allow for easy programmatic pairing, so currently user will have to do it manually.

USB: 

		:::JavaScript
	{"connectionType":EB.Printer.CONNECTION_TYPE_USB}
	USB Port must be in Host mode before you have started the app.
	Later, check more defaults and parameters in the API Reference and see why you can even use just {}!

More considerations for each connection type are present in the “Remarks” section of API reference. 

Here you go! Try it! Chances are – it will print. But chances are, it would not. Why?
This code relies on numerous dangerous assumptions, which may be ok for a carefully prepared PoC, but not for real life. Some of these assumptions include: 

* Only a single printer is connected
* Printer is accessible (paired over BT, etc)
* Printer connection is always successful
* Printer is loaded with media and ready to print
* Media is of the right type, length etc
* Printer is correctly pre-configured to work with the data we want to print (all the settings and options, correct command language and mode used)

In addition, this code has more problems, which we will deal with in the next section. Making a pause now would be a good thing.

###Adding flesh to the bones

In the previous section we have created the “skeleton” code for printing PoC. However, this code has numerous problems, which can be grouped in three categories.

* Numerous dangerous assumptions
* Does not reflect the real-life logic and flow 
* Hard to manage and inflexible with all the nested inline functions

Let’s deal with these problems two and three first. Currently, we have three inline callbacks. This code is not very easy to read, not very flexible and also has a fatal flaw.

		:::JavaScript
	function print_ticket() {
		EB.PrinterZebra.searchPrinters (<search params here>, function(cb) {	
			var myPrinter = EB.PrinterZebra.getPrinterByID(cb.printerID)
			myPrinter.connect(function(cb){
				myPrinter.printRawString('^XA^FO20,20^AD^FDTest^XZ',{},function(cb) {
				})	
			})
		})
	}


The first callback (for searchPrinters) will be called for every printer. If left as is, it will work nicely for a single printer, but how many times will it attempt to connect and print if more than one printer was found? Let’s disentangle everything:

		:::JavaScript
	function print_ticket() {
		EB.PrinterZebra.searchPrinters (<search params here>, search_callback)
	}

	function search_callback(cb) {	
		var myPrinter = EB.PrinterZebra.getPrinterByID(cb.printerID)
		myPrinter.connect(connect_callback)
	}

	function connect_callback(cb) {
		myPrinter.printRawString(<string>,{},print_callback)
	}

	function print_callback(cb) {
	}

Now, let’s think logically and pose a few questions you’ll want to answer when adding printing to your app:

* Does it make sense to begin searching for printers only after user had pressed “Print”? Isn’t it a bit too late?

* How long will the search take? How will it affect the user experience?
Shouldn’t I have disabled the Print button when no printers are found (or have done something else, such as displayed an error message or prompted user to select the right printer?)

In case of a single printer connected via USB cable – none of this is a serious issue. In case of Wi-Fi, Bluetooth or a more universal app, you might want to pause and think.

How can we address these? Probably, a good idea would be to search for printers as soon as the app loads, see how many we found (0, 1, >1) and take action based on this. The action may be disabling the print functionality (if the business process allows it), prompting user to connect a printer, prompting user the select the printer when more than one is found. 

In our example we decided to disable the Print button upon page load and only enable it if a suitable printer is found. Here’s what sample code may look like:

		:::JavaScript
	// will hold all the printers found, if we expect more than one
	// global var for simplicity sake

		var printers_array = [] 

		function onLoad () { // called by our sample app when the page loads
		
		// ... other app init code here ...

		EB.PrinterZebra.searchPrinters (<search params>, search_callback)
		
		// ... other app init code here ...
	}

	function search_callback(cb) {	// this is triggered for EVERY device found
		if(cb.status == 'PRINTER_STATUS_SUCCESS' && cb.printerID != undefined) {
			v_out('#print_status', "Found printer: " + cb.printerID)			
			var p = EB.PrinterZebra.getPrinterByID(cb.printerID)

			// Only add a device if it has supported printer type. 
			// Here we choose zebra.Check the API reference for more supported types.
			// of course, this code can do more complex checks
			if (p.printerType == PRINTER_TYPE_ZEBRA) printers_array.push(p)
		}
		else {
			v_out('#print_status', "Printer search error: " + cb.status + “:” + cb.message)
		}
	}


This code will find all the printers and populate the printers_array with the Printer instances that we need. Now, how would we actually know that the search is over and choose the printer to use? Since the code is async, we will need to specify search timeout as part of parameters, and then trigger an async timed function (using JS standard SetTimeout() call). The default timeout is 30 seconds. We’ll reduce it to 10.

		:::JavaScript
	var printers_array = [] 	// will hold all the printers found, if we expect more than one
	var myPrinter = null 	// this will be the printer to use by the app

	function onLoad () { // called by our sample app when the page loads
		// ... other app init code here ...
		$('#PrintBtn').disabled = true
		v_out('#print_status', "Searching for printers")
		EB.PrinterZebra.searchPrinters ({"timeout":10000, <other params>}, search_callback)
		var PrinterTimeout = setTimeout(process_found_printers, 10500)
	}

	function process_found_printers() {

		// first, stop the search if it's still on
		// ideally, the code below should be within the callback of stopSearch()
		EB.PrinterZebra.stopSearch()
		// but we want it simple

		if (printers_array.length < 1 ) { // no printers found
			v_out('#print_status', "No printers found")
			do_something_when_no_printers_found() // your own logic here
			return
		}	

		if (printers_array.length > 1) { // multiple printers found
			v_out('#print_status', "Multiple printers found")
			myPrinter = choose_one_printer_somehow() // ex. let user choose from menu
		} else { // exactly one printer found
			v_out('#print_status', "Printer found")
			myPrinter = printers_array[0]
		}
		$('#PrintBtn').disabled = false // enable print button
		v_out('#print_status', "Connecting to printer " + myPrinter.ID) 	// could specify name or IP instead of ID based on your use case 
		myPrinter.connect(connect_callback)
	}

Now our code actually can search for printers and connect to the chosen one. Once the connection is made (successfully) we can actually enabling printing functionality. Then our print_ticket() function will be simplified to this, which makes a lot more sense:

	:::JavaScript
	function print_ticket() { myPrinter.printRawString(<string>,{},print_callback) }

Now we can connect to printer once and print different information from many different parts of our app without any overhead. But is this good enough? We still have a lot of assumptions about the printer state and configuration. We’ll deal with those next.

###Working with the printer

Now that we have printer found and connected, we want to ensure it’s properly set up and ready to print. Typical tasks and checks here are as follows:

Is printer correctly configured (control language, printer settings, media settings, etc)?

		:::JavaScript
	getAllProperties(),getProperties(),getProperty()
	setProperties(),setProperty()
	enumerateSupportedControlLanguages()
	If printing images or ZPL templates (called “formats”), are those present in the printer? Do we need to push them?
	retrieveFileNames(),retrieveFileNamesWithExtensions()
	storeImage(), <store format?>

Once printer is all set up and configured, is it ready to print (i.e. door not open, media is there, etc)?

		:::JavaScript
	requestState()

Is the print attempt successful (print callback)?

Which of these operations do you need to perform just once, and which every time before you print? Most likely, the first two are one-time (unless you actually have to reconfigure the printer for different print tasks), but the state request and status check should be done for every attempt.

		:::JavaScript
	[put the code here one I figure it out]

[WIP] Additional considerations

We decided to leave these out to keep the example simple, but here are some things and tips for you to consider

While working with wireless printers, can you guarantee the connection? Should you use isConnected property and requestState() before every print attempt and reconnect when required?

If deciding to support only one printer, can you guarantee, that you will only find just one?

You can’t pair to BT printer using EB APIs, printer must be paired before (manually, or by other means).

You can check for supported printer types on a specific device via 

		:::JavaScript
	enumerateSupportedTypes()

Never assume that printer is set up and ready for work:

Check/set printer mode, operational and media parameters via `getProperties()` and `getProperty()`, always set the ones you need.

Check if your templates and images are there via `retrieveFileNames()`, `retrieveFileNamesWithExtensions()`, 

Can you trust those files (especially, when using highly generic names such as ‘background.png’)? Or should you always send yours (sendFileContents

Are you the only app using the printer? Do you need to disconnect from it?

[WIP] Testing the App
Tap the Enterprise Browser icon on the device. If the device is not yet licensed for Enterprise Browser you will see the following screen:

		:::JavaScript
	  [put the flow here once done]

###Conclusion
This completes the Enterprise Browser Printing tutorial. For more information, please refer to the [Enterprise Browser Printer API documentation](#api-printing). 
