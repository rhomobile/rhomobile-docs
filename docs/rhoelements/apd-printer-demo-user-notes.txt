# Motorola Adaptive Printer Driver - Printing Demo User Notes

The Motorola Adaptive Printer Driver (APD) provides a simple way to interface application software to virtually any portable printer. This simple demonstration application is intended to show the main functions of the Adaptive Printer Driver, and may also be used for test purposes. A variety of types of printer are supported and the user can add new data files to provide support for further printer types as required.

The demonstration comprises three simple steps.

* Start the program and switch on the printer.
* Scan the bar-coded “Printer ID” label on the printer. This defines the type of printer and sets up communication parameters.
* Print.

The first sections (Terminal, Printer, Demonstration) provide a summary of the operating procedure. More detailed instructions, including how to load the demonstration software, start with the Introduction section.

## Terminal

This demonstration works on Motorola Windows Mobile and Windows CE devices.

Load the software onto the terminal as described in Annex A. Switch on the terminal and ‘click’ on the Start bar at the top of the screen. Then, depending on terminal type, either select APD Print Demo from the drop-down menu, or select Programs and then APD Print Demo. A small screen should be displayed, with the title “APD DLL Demo V2.xx”.

The terminal needs to be set to work with a particular printer by entering the correct “Printer ID”. The printer should have a bar-coded label showing its Printer ID. Press one of the yellow buttons on the terminal to activate the barcode scanner and scan the bar-coded “Printer ID” label on the printer. If the printer uses a “Bluetooth” or “Wireless LAN” (RF) connection, its ‘address’ also needs to be entered into the “IP Address” box by scanning the second barcode.

The above information can also be entered manually using the terminal’s pop up
‘virtual’ keyboard.

If there is no “Printer ID” label on the printer, Motorola document CPR576 should be used to determine the correct Printer ID. The ‘address’, if used can usually be determined from a status print-out (usually obtained by switching the printer on whilst holding the FEED button).

## Printer

Ensure that the printer has a charged battery, and that a roll of labels or other suitable media is fitted. Choose media that fits the full width of the print head. The printer may need to be configured to suit the type of material, e.g., direct thermal or thermal transfer; pre-cut labels or continuous media, etc.

Press the ON key to activate the printer. Depending on the type of printer, the printer’s ‘power’ LED may remain on, or may extinguish after a short period, leaving the printer in a ‘standby’ state.

## Demonstration

The Main Screen offers eight ‘buttons’. Click on the desired option.

<table>
	<tr>
		<td width="20%">Format 1</td>
		<td>prints something simple (varies according to printer type). It is best to start with this option.</td>
	</tr>
	<tr>
		<td width="20%">Format 2</td>
		<td>prints a “Reduced” price label, or a receipt. Depending on printer type, this may also load a format file into the printer that is used when Variable data is selected.</td>
	</tr>
	<tr>
		<td width="20%">Format 3</td>
		<td>performs a more complex print function, generally involving the use of a print “template”.</td>
	</tr>
	<tr>
		<td width="20%">Format 3</td>
		<td>performs a more complex print function, generally involving the use of a print “template”.</td>
	</tr>
	<tr>
		<td width="20%">Power</td>
		<td>switches PGP1000 and TR220 ‘clip on’ printers on or off.</td>
	</tr>
	<tr>
		<td width="20%">Print ID</td>
		<td>commands the printer to print out its “Printer ID”. This only applies to printers using a “SPAN” cordless connection.</td>
	</tr>
	<tr>
		<td width="20%">Variable data</td>
		<td>passes “Hello 12345 12345” to the APD as ‘variable data’ to show how the same data may be printed using any printer, without the application knowing the printer type.</td>
	</tr>
	<tr>
		<td width="20%">Open port</td>
		<td>Optional manual control of the communication port. Can be used to reduce print times when using Bluetooth connectivity. (This function is not available on MIPS version of demo).</td>
	</tr>
	<tr>
		<td width="20%">Close port</td>
		<td>Optional manual control of the communication port.</td>
	</tr>
</table>

NOTES: Toshiba-TEC B-211 and B-415 printers require configuration via a cable connection before they can support ‘cordless’ operation.

More detailed information on the above is given in the following sections.

## Introduction

This document relates to the Adaptive Printer Driver Printing Demonstration Software for Motorola mobile computers, version 2-18.

This software is provided as a set of files suitable for use in mobile devices (terminals). It is intended to provide a simple demonstration of the Adaptive Printer Driver, in conjunction with almost any portable printer. Wired, and ‘cordless’ connections are supported, as well as directly-connected printers, such as the Zebra TR220 and O’Neil PrintPad.

Where a “Bluetooth” or “Wireless LAN” ‘cordless’ connection is used, both terminal and printer must be fitted with the appropriate interface hardware to support this connection.

## Concept

Communication of data from an application running on the Motorola hand-held terminal, or running on a remote host to which the hand-held terminal has a ‘virtual’ connection, can be handled via Motorola’s Adaptive Printer Driver (APD). The APD controls the hardware providing the connection to the printer and deals with the associated data transport protocol. A further function of the APD is that it can remove the variation in the command languages used by the various printer types. This allows the application to pass data to the APD in a ‘raw’ form, where the application need have no knowledge of the type of printer, or the method of connection to the printer. This is particularly useful where several different printers are used, or when an application needs to be transferred to a new type of printer. However, the APD may also be used in the traditional scenario where the application encodes data into the command language used by a specific printer. In this case, the APD simply transports the data to the printer ‘as is’.

There are three elements to printing.

* Configuration; allowing the user to ‘link’ the terminal to a particular printer
* Formatting; which defines the size and layout of labels or receipts to be printed.
* Printing; sending data to be printed using pre-defined formats or templates; or sending data ‘as is’.

All three elements are included in this demonstration software.

## Software Element 1 (Configuration)

The user needs to be able to set parameters that define the type of printer to be used, and define the ‘connection’ to that printer.

Linking a terminal to a specific printer involves three parameters.

* a 3-character code to identify the ‘printer type’.
* a unique ‘address’ to identify this particular printer (only required for cordless connections).
* a number, or code, defining any additional communication channel settings (such as port number).

These parameters are defined by the “Printer ID”, which is ideally shown on a bar- coded ID label affixed to the printer.

The printer type code comprises a letter followed by two numbers (“M60” in the above examples). The APD will expect any data files associated with this printer type to have a filename ‘extension’ of “M60”.

The data files supplied with the demonstration software support the following printer types. The relevant printer command language is shown in [ ] brackets.

<table border="1">
	<tr>
		<td>Zebra “Cameo 2” and “Cameo 3”</td>
		<td>Type = C12, C13 [ CPCL ]</td>
	</tr>
	<tr>
		<td>Zebra “QL220” and “QL320”</td>
		<td>Type = C52, C53 [ CPCL ]</td>
	</tr>
	<tr>
		<td>Zebra “TR220” ‘Clip on’ printer</td>
		<td>Type = E10 [ EPL ]</td>
	</tr>
	<tr>
		<td>Paxar “9460”</td>
		<td>Type = M60 [ MPCL ]</td>
	</tr>
	<tr>
		<td>O’Neil “microFlash” series</td>
		<td>Type = N21 [ EZ Print ]</td>
	</tr>
	<tr>
		<td>Sato MB400</td>
		<td>Type = S40 [ Sato ]</td>
	</tr>
	<tr>
		<td>Toshiba-TEC “SP2”</td>
		<td>Type = T12 [ TEC ]</td>
	</tr>
	<tr>
		<td>Toshiba-TEC “SP2”</td>
		<td>Type = T12 [ TEC ]</td>
	</tr>
	<tr>
		<td>Toshiba-TEC “B-211” (cabled)</td>
		<td>Type = T21 [ TEC; standard syntax ]</td>
	</tr>
	<tr>
		<td>Zebra “PA/PT400” series</td>
		<td>Type = Z40 (uses ‘ZPL’commands)</td>
	</tr>
</table>

In cases where the printer type is not listed above, and no ID label is fitted to the printer, the user should refer to the “APD Printer Type Codes” document to determine the printer type code.

To modify the demonstration so it can be used with other printers, the user has two options.

* If the ‘new’ printer uses the same command language as one of the printers listed above, changing the numeric part of the extension will usually work. E.g. changing the name of file “Format1.C12” to “Format1.C33” would allow it to be used with a Zebra Encore 3 printer instead of a Cameo 2 printer.
* However, to use a completely different printer type, the user may add data files with new filename extensions. See documents CPR361 and CPR576.

As well as identifying the printer type, the Printer ID incorporates parameters necessary to define the communication path. With a cabled connection these could define baud rate etc. However, in a ‘cordless’ environment it is also necessary to use some form of unique address to ensure that the data is only received by the intended printer. In a wireless network, each device will be given its own “IP Address”.

Similarly, “Bluetooth” and Toshiba-TEC “RF” systems also use addresses to route data to the correct printer. However, because the form of these addresses varies (and because a cabled connection does not require an address), the form of the complete “Printer ID” (i.e. type identifier plus address) also varies.

The Printer ID has two basic forms:

* where the address precedes the printer type code. For example, “298AM60”. “M60” identifies the printer type as a Paxar 9460 printer and “298A” is the address relevant to a “SPAN” connection.
* where the printer type code is preceded by a single character and the address and other communication parameters follow. E.g. “WM60:9100|157.235.246.123”. The “W” indicates a ‘Wireless TCP/IP’ connection, “9100” is the TCP port number and the IP address is at the end.

At present ‘wired’ connections take the first form, with the printer type being preceded by four zeros; e.g. “0000C53”. However, they will transfer to the second form in the future to allow greater flexibility in parameter settings.

### Set up the printer ID in the terminal.

The Printer ID is displayed in two ‘boxes’ at the top of the “APD DLL demo” screen. The upper one displays the printer type identifier and certain other parameters. The lower box (labelled “IP Address”) is used when the full Printer ID contains enough characters to require a second barcode.

To change the ID, scan the printer’s ID label by pressing one of the yellow ‘scan’ buttons, or by keying in the ID. Where there are two barcodes, and both are scanned, the terminal will automatically determine the correct ‘box’ for the scanned data.

To manually enter the ID, first ‘click’ within the Printer ID window (using the terminal’s stylus) to display a cursor. Then ‘click’ on the keyboard icon at the bottom of the terminal’s screen to display the ‘pop up’ keyboard. Note: this icon will not be present if the print demo was opened from the “Today” screen.
Use the ‘backspace’ and other keys to edit the displayed Printer ID.

### The ‘Print ID’ Command.

Another configuration feature of the terminal allows identification of an unknown printer (e.g. if the printer’s label is missing or damaged) when the printer is using a “SPAN” connection (Symbol Personal Area Network based on short-range radio communication at 433MHz).

This command is initiated by clicking the “Print ID Label” button. The terminal will briefly display a ‘progress bar’ and (provided it is switched on), the printer will print a new ID label (as will any other printers nearby!). Note: Toshiba-TEC printers do not support this function.

Note 1: the ID of the ‘current’ printer must use a ‘printer type’ character that matches the unknown printer. If necessary, enter a ‘dummy’ ID of “1234xxx” where “xxx” is the relevant printer type.

### Selecting a ‘wired’, or ‘clip on’ printer connection.

This application supports ‘wired’ and direct connections by entering the Printer ID as 0000xxx, where ‘xxx’ is the ‘printer type’ identifier. Use a serial cable appropriate to the type of terminal and printer.

For example, use “0000E10” for the Zebra TR220 printer, or “0000C22” for the Zebra Cameo 2.

## Software Element 2 (Label Formatting)

Before a label can be printed, the printer needs to know the size and layout of the label and details of individual fields, such as font size, barcode symbology, etc. This information may be sent with the data, or may be sent to the printer in a ‘format’ file before sending the actual label data. Many types of printer can store a number of label formats. Then, using a simple identifier (often just a single character in the print command) to identify which format is required, the format is recalled from the printer’s memory and the data inserted. In this way, much less data needs to be sent each time that a label is printed.

Motorola’s Adaptive Printer Driver allows format files to be sent to the printer prior to printing, or can itself use format files (called ‘templates’ in this case as they are stored in the terminal) into which variable data is inserted. This allows applications that expect the printer to store formats, to work with printers that do not store formats (and vice versa).

## Software Element 3 (Printing)

Whenever a label, tag, or receipt, is required, the terminal issues a print command. This includes the variable data, ie. text and barcode data, along with format information or a command to recall format information from memory. The print command may also state the number of copies to be printed.

## Setting Up The Terminal

Ensure that the terminal has a charged battery. Instructions on how to fit or charge the battery are provided in the User Guide for the terminal.

The terminal needs to have the program and data files for this demonstration loaded into memory. These files are loaded using the ActiveSync utility. Instructions for this are given in Annex A.

The application software can be loaded in two ways:

* Copy all the files to the terminal’s “application” area of memory and then ‘cold boot’ the terminal to copy the program files to the correct working folders.
* Copy the data files to the “application” area of memory and copy the program files directly to their working folders. This avoids the need to cold boot the terminal, which may result in other application programs being erased.

Note: With the MC50 terminal, if you intend to use a serial connection, the file “APD- com5.reg” needs to be loaded. This changes the default serial port setting from “COM1” to “COM5”, but only runs when the terminal is cold booted. In this case, the first option above must be used. In other cases, either method may be used.

## Setting Up The Printer

Ensure that the printer has a charged battery and a roll of label stock or receipt media, as required. The demonstration software generally produces an output suitable for printing on all widths of a particular printer type. In other words, if a particular printer is available in 2 inch and 4 inch versions, the output will be 2 inches wide. However, if the printer is only available in one width, the output will use the full width.

Various length labels can be used, but labels shorter than about 30mm should be avoided. ‘Continuous’ media may also be used.

Note that this demonstration program assumes that the printer has been configured for the particular type of medium in use. For example, direct thermal or thermal transfer; black-mark indexing, gap-indexing or continuous. Such configuration will normally involve sending an appropriate command to the printer using a wired connection from the serial port on a personal computer. Refer to the printer’s user manual for further details of this.

Toshiba-TEC B-211 and B-415 printers need to have the relevant format files loaded into the printer via a cable before ‘cordless’ operation will run correctly. To do this, follow the process described in Section 8.1.

For ‘SPAN’ operation, Paxar printers’ communications parameters must be set to
9600, N, 8, 1. These are the default settings, but details of how to check and set these are given in the user manual supplied with the printer, or in a programmer’s manual available from the printer’s supplier. For most other printers the parameters for cordless operation are set automatically. For ‘wired’ operation this demonstration assumes the printer is using its ‘default’ communication settings.

## Running The Demonstration

Configure the terminal and printer as described earlier.
Switch on the terminal using the red PWR key. To start the demo, ‘click’ on the Start bar at the top of the screen. Then, depending on terminal type, either select APD Print Demo from the drop-down menu, or select Programs and then APD Print Demo. A small screen should be displayed, with the title “APD DLL Demo V2.xx”.

The “Printer ID” and “IP Address” parameters now need to be set to suit the particular printer to be used. Follow the instructions in the “Terminal” section.

The program is now ready to run.

Note: during the demonstration some printers will switch on and off automatically. Others stay ‘on’ all the time. Some may switch off after a preset period to conserve battery life and need to be switched on again manually. This is dependent both on the type of printer and the way it is configured. It may also vary with the particular connection method in use.

If the terminal switches itself off after a period of inactivity, simply press the red PWR key to return it to its previous state.

The Main Menu on the terminal provides five options that allow demonstration of printing operations. Another three options show specific additional features of the APD. To select an option, simply ‘click’ on it using the plastic stylus supplied with the terminal. For each printing option, the terminal will briefly display a ‘progress bar’ whilst sending data to the printer. Some options may not be applicable to certain printer types and may generate a “File not found” or similar error message. Click on OK to clear these messages.

Details of the data files used with this demonstration may vary. The ‘general’ operation is given below. However, a full list of the files, giving a more detailed description of what they do, is given in the “ReadMe.txt” file in the APD Kit.

**Option 1 “Format 1”**

This prints a simple, fixed test label or receipt. It is best to start with this option.

**Option 2 “Format 2”**

This normally prints a “Reduced” label or ticket and will often also download a format file to the printer for use with the “Variable Data” option.

**Option 3 “Format 3”**

This option (which may not be provided for all printer types) prints something that displays more complex print capability, or demonstrates a more complex method of converting data to a form that can be used by the printer. For example, “Format 3” may use an ‘embedded command’ to instruct the APD to insert data into a ‘template’ containing commands applicable to a particular type of printer, so that a receipt can be produced from a simple text string generated by (say) a web browser application.

**Option 4 “Variable Data”**

This is intended to show how the same application data can be printed on different printers, using different communication methods. In this case the application merely generates the text “Hello” and the number “12345”. The application has no knowledge of the type of printer, its command language, or means of connection. The APD deals with all of these factors automatically to produce the required printed output.

Note that the ‘variable’ data is actually coded into the application software and cannot be changed. It is only for demonstrating that the same data can be sent to, and printed by, a variety of different printers.

**Option 5 “Print ID Label”**

This forces a printer using “SPAN” connectivity to identify itself by printing a label showing is ‘unique’ Printer ID. See section 3.2 for further details.

**Option 6 “Power On” or “Power off”**

This allows the application to control power supplied to a device connected to the terminal, such as the Zebra TR220 ‘clip on’ printer. By powering the device prior to printing, print commands can be implemented immediately, rather than being delayed while the attached device goes through its power up procedure.

**Option 7 “Open port”**

This allows the user to manually control the communication port linking the hand-held terminal and the printer. Where communication is via a “Bluetooth” connection, there is normally a delay of around 4 seconds each time a print request is issued while the terminal waits for the Bluetooth connection to be established. However, if the communication port has already been opened, the printer responds immediately when data needs to be printed.

**Option 8 “Close port”**

This closes the port after using Option 7. Note: selecting a different printer ID will automatically close the connection to the previous printer.

**NOTES:**

Depending on printer type, the label commands produced by Options 4 (Variable Data) may rely on having a format file that has already been sent to the printer using option 2. Since the format is stored in the printer, it only needs to be sent once for any number of subsequent labels, although some printers do not store formats after they have been switched off.

CPCL printers use a wired connection operating at 19200 baud. Most other printers should be set for 9600 baud, No parity, 8 data bits, 1 stop bit.

Options 7 (Open port) and 8 (Close port) are not provided on the MIPS version of the printing demonstration application software. However, the APD itself does support these functions on both ARM and MIPS versions.


### Cordless operation of Toshiba-TEC B-211 and B-415 printers

Toshiba-TEC printers require format files to be loaded into the printer before printing can take place. However, these formats cannot be loaded using the “TEC-RF” protocol.

Thus, before attempting to demonstrate printing with Toshiba-TEC B-211 and B-415 via a ‘cordless’ (RF) connection, the formats must be loaded via a cable, as follows:

* Connect the printer to the Motorola terminal via the appropriate serial cable
* Start the program on the terminal and set the ‘Printer ID’ to “0000T21”.
* Then print each of the following using the terminal’s demonstration program as detailed in Section 8:- Formats 1, 2 and 3 and ‘Variable Data’
* Now switch the printer off, disconnect the cable, then switch the printer on again.
* Set the “Printer ID” by manually entering the 5-digit “ID” number shown on a ‘self test’ print out from the printer. This is obtained by pressing and holding the “REPRINT” button on the printer while switching the printer on. The “ID” normally corresponds to the last 5 digits of the printer’s serial number – but not always!
* Now, with the appropriate ‘cordless adapter’ attached to the terminal, the ‘Format’ and ‘Variable Data’ print buttons should work correctly.

Note that the “Print ID” function is not supported by Toshiba-TEC printers.

## Troubleshooting

This demonstration is very simple. Assuming all batteries are adequately charged, the most likely problem is that the “Printer ID” or “IP Address” are not set correctly.

The following list should identify this or other errors.

Terminal displays “Print error” or “Unable to open port”: Incorrect printer connection selected.
No “Printer ID” entries. Refer to section 3 above.
Another application still has control of the terminal’s serial port.

Terminal inoperative:
Flat or defective battery.
Reboot terminal. Refer to section 6 above.

Terminal displays “File not found”:
This function is not supported by this type of printer, or. No file is available for the selected printer type.

Terminal displays the ‘progress bar’ but no response from printer: Incorrect Printer ID selected
Printer not active. Press ON key.
No Cordless Adapter fitted to terminal.
Printer error. Reset the printer and try sending ‘Format 1’ again. Printer communications parameters incorrect. See section 7.

Printer LED flashing:
Reset printer. Try sending ‘Format 1’ again.
No format file in printer (For Toshiba-TEC printers, see section 8.1)

Options 1 and 2 OK, but ‘Variable Data’ doesn’t work: Format not loaded first (send ‘Format 2’ again).

Still no luck?
Try fresh batteries and / or rebooting the terminal Try a different terminal and / or different printer. Try the printer with a wired connection to a PC etc.
Check terminal and printer have compatible Cordless Adapters (SPAN only)

## Annex A: Loading Software

### A1 Method 1 – This involves ‘cold booting’ the terminal.

NOTE: ‘Cold booting’ erases all files not stored in 'non-volatile' memory, so you may lose other programs and data currently installed on the terminal if you choose this option. Method 2 may be used to load the data and program files without the need to ‘cold boot’ the terminal – see Section A2.

TO LOAD THE DEMO SOFTWARE INTO THE TERMINAL:

You will need a Personal Computer running Microsoft’s 'ActiveSync' software and either a cradle, USB cable, or serial cable, to connect the terminal to the PC.

All the required files stated below are supplied in the Adaptive Printer Driver Software Developer’s Kit and are contained in the folders called “apd\_dll”, “data” and “demo\_app”.

1. Connect the terminal to PC running ActiveSync and establish a “Guest” connection.
2. Create a folder called "APD" in the "Application" folder.
3. Copy the “Format”, “ID\_Label” and “Template” folders in the “DATA” folder into "\Application\APD". Note: “ID\_Label” is only required if you wish to use “SPAN”.
4. Copy file “demo\_dll.exe” and the “APD Print Demo” shortcut from the “\demo\_app\MIPS” folder to the terminals "\Application\APD" folder.
5. Copy “prtlib.dll” from either the ARMrel folder within “apd\_dll” to the terminal’s “\Application\APD” folder.
6. Copy “APD-demo.cpy” from the “\demo\_app” folder to the terminal’s "\Application" folder.
7. In the case of the MC50 terminal, if serial communication is required, copy
“APD-com5.reg” from “apd\_dll\ARMrel” to the “\Application\APD” folder.
8. Ignore files “prtlib.lib” and “prtlib.h”. These are not required for this application.

Now disconnect the ActiveSync connection and ‘cold boot’ the terminal according to the procedure given in the terminal’s Product Reference Guide.

Calibrate the screen, and set the date, time and regional settings as required. Return to Section 6 of this manual.

### A2 Method 2 – This does not involve ‘cold booting’ the terminal

NOTE: This method may be used for a ‘temporary’ installation, where the program does not need to survive a ‘cold boot’ and where other applications would be ‘lost’ if the terminal were ‘cold booted’. However, it cannot be used on the MC50 terminal if the registry-setting file “APD-com5.reg” needs to be loaded. In this case, use Method 1 described in Section A1.

TO LOAD THE DEMO SOFTWARE INTO THE TERMINAL:

You will need a Personal Computer running Microsoft’s 'ActiveSync' software and either a cradle, USB cable, or serial cable, to connect the terminal to the PC.

1. Connect terminal to PC running ActiveSync and establish a “Guest” connection.
2. Create a folder called "APD" in the "Application" folder.
3. Copy the “Format”, “ID\_Label” and “Template” folders in the DATA folder into "\Application\APD". Note: “ID\_Label” is only required if you wish to use “SPAN”.
4. Copy the “demo\_DLL.exe” file from the “\demo\_app\ ARMRel” folder to the terminal’s "\Program Files" folder. Also, copy the “APD Print Demo” shortcut to the “\Wndows\Start Menu” folder.
5. Also copy “prtlib.dll” from the ARMrel folder within “apd\_dll” to the terminal’s “\Windows” folder.
6. Ignore files “prtlib.lib”, “prtlib.h”, “APD-demo.cpy” and “APD-com5.reg”. These are not required for this application and loading method.

Now disconnect the ActiveSync connection and ‘cold boot’ the terminal according to the procedure given in the terminal’s Product Reference Guide.

Calibrate the screen, and set the date, time and regional settings as required.
Return to Section 6 of this manual.

Motorola, Moto, Motorola Solutions and the Stylized M Logo are trademarks or registered trademarks of Motorola Trademark Holdings, LLC and are used under license. All other trademarks are the property of their respective owners.

©2011 Motorola Solutions, Inc. All Rights Reserved.


