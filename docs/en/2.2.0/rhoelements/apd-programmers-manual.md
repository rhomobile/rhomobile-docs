# Zebra Adaptive Printer Driver APD Programmer's Manual

This document describes the printing features available to applications running on Zebra hand-held.

The Adaptive Printer Driver manages the physical interface between the terminal and portable printers, and provides:

* A printer- and connection-independent interface to application programs. This means that the host application need have no knowledge of the command language used by the printer, or the way the printer is linked to the hand-held terminal. This also means that a mixed population of printer types is possible – with the host sending the information in a ‘common’ form.
* Support for both ‘wired’ and ‘wireless’ connections.
* The ability to use different protocols for different printers / different connections.
* Application control when using ‘wireless’ connections. This feature is useful where the application needs to switch to another printer in order to produce different- sized labels, or to use different types of media. It also allows terminals to share printers, if required.

Note that the Adaptive Printer Driver is external to the ‘application’ program code. This allows simple driver upgrades, with easier version control and better product support, if additional printing features are added at a later date.

Further details are given in the following sections of this document.

*NOTES:* The APD is available in two forms: the Windows “DLL” form should be used for all new applications, including applications employing Zebra RhoElements. The EXE form is provided to allow earlier applications using this form to be upgraded. Note that the EXE form does no support all of the functions available when using the DLL form of the APD.

## 1. Concept of the Adaptive Printer Driver

The Zebra Adaptive Printer Driver (APD) was originally devised to allow terminal applications to support cordless printing, using an RF protocol devised by Symbol Technologies, called “SPAN” (Symbol Personal Area Network). However, as the APD uses a ‘multiple protocol’ concept, it was easy to add other RF protocols and ‘wired’ operation whilst, as far as the host application is concerned, the APD’s operation appears the same, whatever the connectivity.

The APD was designed to support many different printers, and to allow ‘new’ types of printer to be added freely. This was achieved by defining a simple command interface between the APD and the application that generates the data to be printed.

By using these simple commands, the host application can not only send data to the printer, but can request that the APD encodes ‘raw’ data into the command language and syntax appropriate to the particular type of printer in use. This means that the host application need have no knowledge of the printer’s language. This also means that a mixed population of printers can be employed, in which all of the printers produce correctly formatted labels or receipts. Further, a new type of printer, using a ‘new’ command language, can be introduced without requiring any change to the host application or APD.

The ‘key’ to the Adaptive Printer Driver is the “Printer ID” that identifies the type of printer and method of connection. In many cases, the “Printer ID” is displayed on a label on the printer showing both human-readable and bar-coded forms that may be scanned or keyed into the terminal by the user.

The Printer ID serves three purposes:

* It identifies the type of printer and the command language understood by this printer.
* It defines the connection to the printer, including parameters such as baud rate, or
IP Address.
* It also allows the terminal application, or even a remote server, to command the driver to switch to another printer ‘on the fly’. This can be used where the application produces data for two, or more, different types of label that require different printers to print them (for example, a 50 x 25mm shelf edge label and a 150 x 100mm pallet label). Obviously, this feature can avoid the waste of paper and time resulting from data being sent to the ‘wrong’ printer.

The Adaptive Printer Driver makes use of ‘Formats’ and ‘Templates’ to allow ‘raw’ data from the application is to be converted into the form applicable to a particular printer. In general terms, formats define the layout of a particular label, ticket or receipt; and templates define the printer’s command language applicable in respect of a particular format. Their use provides the flexibility to change printer type or label layout without having to modify the application code. However, where an existing application already produces data in a printer-specific form, the APD will accept and send the data ‘as is’ without requiring templates – although formats can still be used if appropriate.

As formats and templates are similar in concept and, in many cases, one may incorporate the function of the other, it is important to understand what each does and when they may/should be used. Annex B provides a detailed discussion of formats and templates, and gives examples of how to use them to best advantage in different situations.

Although the Adaptive Printer Driver offers some powerful and flexible facilities, the interface to the application software is very simple and there are only two basic operations:

* defining the printer type / connection,
* sending data.

Commands from the application software to the driver all take the same form, which comprises a command identifier followed by a parameter.

The Funtions section gives an overview of all the functions available and Annex A gives a fuller description of these functions, including details of the syntax for the commands and examples.

## 2. Functions

The Zebra Adaptive Printer Driver allows a wide range of printers, and other peripheral devices, to interface to application software operating on Zebra hand-held terminals. The driver provides a number of functions that are accessed directly from the terminal’s application program via a set of software commands.

### 2.1 Connection

The driver controls the physical connection between the terminal and the peripheral device.
The connection (or link) may be:

* ‘Wired’, using a cable between the Zebra hand-held terminal and printer; or
* ‘Cordless’, using a radio-frequency (RF) link between the terminal and printer, or
* ‘Wireless LAN’, where both the terminal and the printer are Mobile Units in a Wireless Local Area Network conforming to the IEEE 802.11 or 802.11b specifications; or
* ‘Bluetooth’ wireless connectivity.

In all four cases, some form of link protocol is required. For a ‘wired’ connection, the protocol sets baud rate and other parameters and ensures that the printer (or other peripheral) is ready to accept, or provide, data. For ‘cordless’, ‘wireless LAN’ and ‘Bluetooth’ links, the relevant protocol transports the data within ‘packets’ that contain additional information needed to route the data to the correct destination and to verify its integrity.

In the three ‘wireless’ cases, Motorola’s Adaptive Printer Driver also establishes and manages the ‘virtual’ connection to the printer, and allows dynamic switching from one printer to another.

The connection is defined by a ‘Peripheral Identifier’ code (also referred to as the “Printer ID” or PID). Printers and other peripheral devices that support wireless operation usually display their PID on a label, or may print a label on request. This PID is shown in both human-readable and barcoded form.

The PID may have a variety of forms, depending on the number of parameters needed, and may comprise one or two barcodes. A full description of the PIDs is given in Annex C to this document.

The connection process (or ‘linking’) is initiated by the application software. This can be either:

* Automatic; for example each time the user ‘logs on’; or
* Manual; by a process defined by the application software.

In either case, the application will usually invite the User to enter the Peripheral Identifier (Printer ID) of the device to which the terminal is linked. The PID is entered, either by scanning the PID barcode (or barcodes), or by entering the PID manually via the terminal’s keypad. The PID is then passed to the APD using command 0105 and the connection is automatically established by the APD.

In cases where the application already knows the PID (e.g. where a ‘wired’ connection is used and all the printers use the same PID), it is possible to omit, or simplify, the user entry stage; but command 0105 is still required.

A second command (0106) can be used to ‘read’ the PID currently in use by the APD, if required.

Note: Where the printer supports both ‘wireless’ and ‘wired’ connectivity, the printer ID displayed on the printer will relate to the ‘wireless’ option (WLAN or Bluetooth). To establish a ‘wired’ connection, the PID is formed by taking the letter and two digits that define the printer type and preceding them with four zeros. For example, if a printer’s ‘normal’ PID is “1234A12”, “A12” defines the printer type, so, to configure the terminal to use a cable to the printer, the ID would be entered as “0000A12”. Similarly, if the PID is contained in two barcodes, the first of which is “WC53”, “C53” defines the printer type, so the ‘wired’ version would be “0000C53”. The second barcode is not required (at present) for ‘wired’ use.

Please refer to Annex A for details of command 0105, and Annex C for further information on PIDs.

Note: “Bluetooth” connectivity is, currently, only supported in conjunction with the Compact Flash Bluetooth Card from Socket Communications Inc. See Annex D for further information.

### 2.2 Printing

Data to be printed can be sent to the printer driver in three ways:

* Using command 0100 “Send Format”. The data contained in the specified file will be sent ‘as is’. This is used to send format files, or other information, directly to the printer without further processing by the driver. This also provides compatibility with the ‘traditional’ printing method where the application provides data already formatted to suit the type of printer in use.
* Using command 0101 “Send Data”. In this case, the data is ‘raw’ (i.e. unformatted, except for a ‘carriage return’ and ‘line feed’ between each variable field). The Adaptive Printer Driver will then encode the data into the language and syntax applicable to the particular type of printer currently in use. To do this, the APD also requires the name of the appropriate format or template (eg. “2” in example 2 below), and the quantity of labels to be printed. Note that, where two or more different types of printer need to produce similar labels, there will need to be a format file and/or template file for each type of printer and each type of label. Formats and templates can be mixed as required (see Annex B).
* Using command 010A “Send String”. This command allows the Adaptive Printer Driver to accept data as a string, rather than as the contents of a file. The string can contain ‘embedded commands’ as well as (or instead of) data to be printed, which means that this one command can be used to implement any of the APD’s other commands. See Annex A for further information.

#### Example 1. Using APD command 0100 (Send Format).

This data was generated by the application in Zebra Technologies’ “ZPL” printer command language.

	^XA^PW300^PRA^LL280^MD0^MMT^LH0,0
	^FO102,21^A0N,61,79^CI13^FR^FD£1.49^FS
	^FO28,87^A0N,25,0^CI13^FR^FDSilvikrin^FS
	^FO28,119^A0N,24,0^CI13^FR^FDSoft and Gentle^FS
	^FO28,151^A0N,21,0^CI13^FR^FDfor thick hair^FS
	^FO290,153^A0N,21,19^CI13^FR^FD100ml^FS
	^BY3,3.0^FO58,184^B2N,48,N,Y,N^FR^FD66897678^FS
	^PQ1,0,0,N^XZ

Notes:
Each of the above lines is terminated by Carriage Return (hex 0d), Line Feed (hex 0a).

The resulting shelf edge label is shown below:

<img src="http://rhodocs.s3.amazonaws.com/moto-adaptive-printer-driver/APD-shelf-edge-label.jpg" alt="APD-shelf-edge-label.jpg" />

#### Example 2.

This shows how the same label can be generated without the application needing to use the “ZPL” printer command language. In this case, command 0101 instructs the APD to encode the data to suit the printer in use (which now may, or may not, be a ‘ZPL’ printer).

	2
	£1.49
	Silvikrin
	Soft and Gentle for thick hair
	100ml
	66897678

Notes:
Each line is terminated by Carriage Return (0D), Line Feed (0A).

The “2” in the first line tells the APD that the data is to be printed using format or template “2”. The quantity of labels to be printed is defined in the print command itself.

From the Printer ID, the APD determines the relevant printer type and looks for template “2” for this printer. If the APD detects a relevant template file, it automatically inserts the data into the ‘template’ and then sends the combined data to the printer.

If no suitable template file is available, and the APD is able to determine from the PID which command language is relevant to this printer (ZPL, CPCL, MPCL etc), the driver will assume that the printer has been loaded with a format file called “2” and will then encode the data into this command language using a built-in set of rules.

### 2.3 Other Functions

#### 2.3.1 “Open Port” and “Close Port” Commands

Normally, the Adaptive Printer Driver will automatically manage the communication port used to exchange data with the printer. However, in some circumstances, printing speed can be improved if the port has already been opened by the application software in readiness for printing, rather than having to wait for the APD to open the port when a ‘print’ command is sent. This is of particular benefit when using Bluetooth connectivity, as it typically takes 3 to 4 seconds to open a Bluetooth connection.

#### 2.3.2 “Hide Progress Bar” and “Show Progress Bar” Commands

It sometimes takes a few seconds to open the required connection to the printer and to send the data. Therefore, to indicate that printing is in progress, the Adaptive Printer Driver normally displays a ‘progress bar’. However, these commands may be used to suppress this if required.

#### 2.3.3 “BT Power On” and “BT Power Off” Commands

Power to the ‘Marlin’ Bluetooth module used in some Zebra devices needs to be enabled to allow Bluetooth communication to take place. When the device initialises after a full reset (cold boot), ‘BT Power’ is set to off. However, the APD will set it to on if Bluetooth printing is requested. These commands are included to allow the application to control the power if required; for example to improve power management.

## ANNEX A: List of APD Functions

The Adaptive Printer Driver is supplied as a ‘Pocket PC’ DLL file (Dynamic Link Library) that resides in the terminal’s “\Windows” folder. There are a number of ways to access the various functions provided by the APD.

Some of the functions can be accessed using commands that interface directly to the APD. These ‘direct’ commands are described in section A.1.
However, there are several functions that cannot be accessed directly and have to be accessed indirectly via the “PSExternal” command. In fact, all of the APD’s functions can be accessed by this method, but some functions require parameters that must be passed in the form of a data file. This is not always convenient, so it is also possible to access the APD’s functions by ‘embedding’ the command and its parameters into a string that can be passed directly without requiring a file.

Sections A.2 and A.3 describe the ‘indirect, and ‘embedded’ methods respectively. Section A.4 provides a complete list of all the functions, in order of their command number. This section also includes examples of how the commands are implemented in ‘direct’, ‘indirect’ and ‘embedded’ forms. There is also an example of how the commands are implemented when using Zebra RhoElements, where the APD is provided as an Active-X object.

### A.1 COMMAND FORMAT for ‘Direct’ Commands

#### A.1.1 “PSExternal” Command

This command provides access to any of the APD’s functions and takes the form:

	int PSExternal(wCmd, szString) 

where:

* wCmd is the command number relevant to the required function.
* szString is a string containing any data or parameters required for this function.

The command numbers are listed in section A.4 of this annex. However, to make the command more ‘understandable’, the command number may be replaced by a command reference. For example “Cmd\_PSClosePort” is more meaningful than “271”.

The header file “prtlib.h” is required to convert the command reference to the appropriate number.

“PSExternal” allows any of the APD’s functions to be used. However, although “PSExternal” itself is a ‘direct’ command, the functions it calls are ’indirect’. This means that data to the APD and responses from the APD cannot be passed directly and have to be passed via a data file unless the data can be passed as part of a parameter string. To avoid the need for files, several of the APD’s functions are also available as ‘direct’ commands.

#### A.1.2 “PSGetLastMessage”

	TCHAR *PSGetLastMessage(void);

This may be used to return a text string relevant to the last error condition that occurred and this may be used to display an appropriate error message when required.

Section A.2 gives an example of how PSGetLastMessage may be combined with a “PSExternal” command to automatically display a message on the terminal’s screen whenever an error occurs.

#### A.1.3 “PSSendData”

	int PSSendData(TCHAR **pcData, int iQty);

This direct command may be used to send data to the printer, without having to put the data into a file.

In the following example, a new function “SendData” is defined, which uses PSSendData to send the data defined by “szDataList” and also uses PSGetLastMessage to display an error message, if required.

	// example using PSSendData() and PSGetLastMessage().
	// sends variable data and print quantity
	// if an error occurs, it displays the error message
	//
	// uses : int PSSendData(TCHAR **szDataList, int iQty);
	//
	// where : szDataList is an NULL terminated array of TCHAR*
	// iQty is the print quantity.
	//
	// returns: error code (0 = no error)
	//
	int SendData(HWND hDlg)
	{
	   TCHAR *szDataList[5] = {TEXT("1"), TEXT("HELLO"), TEXT("12345"), TEXT("12345"), NULL};
	   int iResult;
	   if ((iResult = PSSendData(szDataList,1)) != 0) MessageBox(hDlg,PSGetLastMessage(),TEXT("Print error"),MB_OK | MB_ICONEXCLAMATION);
	   return(iResult);
	}

#### A.1.4 “PSGetVersion”

	TCHAR *PSGetVersion(void);

This direct command may be used to determine the version of the APD in use. The response is returned as a NULL terminated TCHAR* pointer.

#### A.1.5 “PSGetPrinterList”

	TCHAR **PSGetPrinterList(void);

This direct command may be used to determine the identifier for the printer currently set as the ‘current’ device.

The response is returned as a pointer to a NULL terminated TCHAR* array. The list has provision for details of up to four printers. However, it presently only shows the one, ‘current’ printer.

### A.2 COMMAND FORMAT for ‘Indirect’ Commands

All of the Adaptive Printer Driver’s functions are available via the “PSExternal” command.

Generally, ‘indirect’ commands will take the form:

	PSExternal(wCmd, szString)

Where:

* `wCmd` defines the function required.
* `szString` defines any data or parameters required.

For example:

	PSExternal(256, TEXT(“Form2”));
or

	PSExternal(Cmd_SendFormat, szBuff);

Section A.4 lists the APD’s functions in numerical order, showing their command reference and giving examples of the syntax required when the command is used via PSExternal.

However, PSExternal may, itself, be incorporated into other, user-defined functions. In the following example, a new function “SendCommand” is defined. This calls one of the APD’s functions using the “PSExternal” command and then, if there is an error, uses PSGetLastMessage to determine the appropriate text to display as an error message on the terminal’s screen.

	// example using PSExternal() and PSGetLastMessage()
	// sends APD command and optional parameter
	// if an error occurs, it displays the error message
	//
	// uses : int PSExternal(WORD wCmd, TCHAR *szString)
	//
	// where : wCmd is a command number
	// szString is an optional TCHAR* command parameter
	//
	// returns: error code (0 = no error)
	//
	int SendCommand(WORD wCmd, TCHAR *szString, HWND hDlg)
	{
	   int iResult;
	   if ((iResult = PSExternal(wCmd,szString)) != 0)
	   MessageBox(hDlg,PSGetLastMessage(),TEXT("Print error"),MB_OK | MB_ICONEXCLAMATION);
	   return(iResult);
	}

Using the “SendCommand” function just defined, indirect command

	PSExternal(Cmd_SendFormat, szBuff);

would become

	SendCommand(Cmd_PSSendFormat,szBuff,hDlg);

where the difference is that the second example would automatically display an error message, if required; whereas, using the PSExternal command, the application would have to determine and handle errors specifically.

NOTE: In the above example involving “SendCommand”, PSGetLastMessag is used in its ‘direct’ form and the text is returned via a pointer to a NULL terminated string. However, if PSGetLastMessage had been used ‘indirectly’, via PSExternal, the error message would be returned via a file called “PRTDRV.MSG” in the “\Program Files” folder. This would contain a single line of text, such as “Can’t open port”.

### A.3 COMMAND FORMAT for ‘Embedded’ Commands

Any of the Adaptive Printer Driver’s commands (other than “010A”) can be
‘embedded’ into a data string sent to the.APD. Using the DLL version of the APD, commands may embedded into data sent to the APD using the “Send String” command, 010A, or the commands may be embedded into a format file, which is sent using command 0100. In the case of the EXE version of the APD, only the latter option is available.

When an embedded command is used, it is placed into a ‘Command Header’ that takes the form:

	$$[CMD:nnnn,ppp]$$<CR><LF>

where:

* nnnn is a four-digit command number,
* ppp are any parameters required,
* <CR> is a ‘Carriage Return’ (hex 0D),
* <LF> is a ‘Line Feed’ (hex 0A), and 
* all other characters are fixed.

In the case of command 0101 (Send Data), the Command Header precedes the data string to be sent to the printer, i.e.:

	<Command Header><Data>

With all other commands, no data is required.

#### A.3.1 Embedding commands into the ‘Send String’ command

The following line shows how a command (0105 in this case) may be embedded into command 010A (Send String ), which is sent using “PSExternal”:

	PSExternal(266, TEXT("$$[CMD:0105,1234C32]$$"));

Note: that command 010A (Send String) does not support non-printing characters. Thus, when embedding command 0101 (Send Data), the data following the Command Header must not contain ‘carriage return’, ‘line feed’, ‘null’ etc.

See the full description of Commands 0101 and 010A in Section A.4 for further details of how to construct the data string.

#### A.3.2 Embedding commands into Format Files

Any command may be placed in a data file, and then called using the Send Format command (0100):

	PSExternal(256, TEXT(“LabelData.txt”));

In this example, command 0101 and its data are embedded into a file called
“LabelData.txt”. The contents of this file are shown below.:

	$$[CMD:0101,1]$$
	2
	£1.49
	Silvikrin
	Soft and Gentle
	100ml
	66897678

Notes:

Each field of variable data is on a separate line, where each line is terminated by ‘carriage return’ and ‘line feed’ (0d, 0a in hex).

Normally, the Send Format command uses a filename without an extension, i.e. “LabelData”, and the APD would add an extension that corresponds to the type of printer in use. In this case, by including the extension, the APD uses the exact file specified. This can be useful where the data is not specific to one type of printer (as in this example).

#### A.3.3 Embedding commands in “Zebra RhoElements” applications

The following example shows how variable data can be sent using the “Send String” in a Browser application:

	objPrinter.PSExternal(266, “$$[CMD:0101,1]$$\r\n2\r\n£1.49
	\r\nSilvikrin\r\nSoft and Gentle\r\n100ml\r\n66897678\r\n”);

The data in this command is exactly the same as that shown in section A.3.2 above. However, as the Send String command (266) does not permit ‘non printing’ characters, the ‘carriage return’ and ‘line feed’ characters in the data are represented by “\r\n”. More details on this process are given in the notes on the Send String command in Section A.4.

The following example shows how an embedded command may be used to set the printer ID:

	objPrinter.PSExternal(266, “$$[CMD:0105,1234C32]$$”);

In this case, command 0105 (Set Printer ID) sets “1234C32” as the required ID.
Embedded commands that produce a response, such as “Get Version” will return data as a string.

### A.4 COMPLETE LIST OF APD COMMANDS

The following extract from file “prtlib.h” lists the functions provided by the Adaptive Printer Driver.

	#define Cmd_PSSendFormat      0x0100
	#define Cmd_PSSendData        0x0101
	(#define Cmd_PSDisplaySetup   0x0102) Not implemented
	(#define Cmd_PSSetupPrinter   0x0103) Not implemented
	#define Cmd_PSGetVersion      0x0104
	#define Cmd_PSSetPrinter      0x0105
	#define Cmd_PSGetPrinterList  0x0106
	#define Cmd_PSGetLastMessage  0x0107
	(#define Cmd_PSGetResponse    0x0109) Not implemented
	#define Cmd_PSSendString      0x010a
	#define Cmd_PSSetTemplatePath 0x010b
	#define Cmd_PSSetFormatPath   0x010c
	#define Cmd_PSSetIDLabelPath  0x010d
	#define Cmd_PSOpenPort        0x010e
	#define Cmd_PSClosePort       0x010f
	#define Cmd_PSHideProgress    0x0112
	#define Cmd_PSShowProgress    0x0113
	#define Cmd_PSBthPowerOn      0x0114
	#define Cmd_PSBthPowerOff     0x0115

Each of these functions is described in the following pages in the order shown above. The descriptions include examples of the commands used to invoke these functions.

There can be up to four types of example, as follows:

*Direct* shows the command in its ‘direct’ form, if available.
*Indirect* shows the command in its basic form, using “PSExternal”. The syntax for this form is:

	PSExternal(wCmd, szString)

where:

* wCmd is the command number, or command reference.
* szString is a string containing any data or parameters required for this function.

*Embedded* shows the form of the Command Header when this command is
‘embedded’ into another command. The Command Header may form part of the parameter string associated with command 010A (Send String), or the Command Header may be placed in a file that is called by the Send Format command (0100).

*Browser* shows how the command can be used within Zebra RhoElements applications, where PSExternal is supported by creating an Active-X object containing the Adaptive Printer Driver.

The syntax for this form is:

	apd.PSExternal(Cmd, Param);

where:

* Cmd is the command number, or command reference.
* Param is a string containing any data or parameters required for this function.

#### Command 0100(Decimal 256) Send Format

Reference: Cmd\_PSSendFormat

Purpose: Requests that a format file be sent to the printer

Parameters: Filename. 

Examples:

<table>
	<tr>
		<td>Direct</td>
		<td>Not available as a direct command</td>
	</tr>
	<tr>
		<td>Indirect 1</td>
		<td><code>PSExternal(256, TEXT(“\\My Documents\\Form2”));</code></td>
	</tr>
	<tr>
		<td>Indirect 2</td>
		<td><code>PSExternal(Cmd_PSSendFormat, szBuff));</code></td>
	</tr>
	<tr>
		<td>Embedded</td>
		<td><code>$$[CMD:0100,Form2]$$</code><br />
		The above could be embedded into command 266 (Send String). However, there is little reason to embed this command.</td>
	</tr>
	<tr>
		<td>Browser 1</td>
		<td><code>objPrinter.PSExternal(256, “Form2”);</code></td>
	</tr>
	<tr>
		<td>Browser 2</td>
		<td><code>objPrinter.PSExternal(256, strForm);</code></td>
	</tr>
</table>

Notes:

Normally, the file name is given without an ‘extension’ (as in the above examples) and the APD will search the terminal’s ‘format’ folder for a file for which the first part of its name matches that specified and the second part (the ‘extension’) is defined by the type of printer currently connected.

Thus, if the ‘connected’ printer is of type “R60” (say), the driver would search for file “Form2.R60” and send this to the printer. This means that the application can be used with several different types of printer (where each requires its own version of the format file) and, when the Send Format command is used, the application does not need to know which of the format files is required. Typically, this feature is used to allow a new type of printer to be introduced without requiring any change to the application – it would simply require the addition of a new format file for the new printer.

However, there are situations where including the ‘extension’ in the filename may be useful – for example, if the format file can be used with any type of printer. If the extension is given, the APD will use the specific filename, regardless of the ‘current’ printer type.

Normally, when giving the file name, the path is omitted and the file is assumed to be in “\Application\APD\Formats”. However, in example 1, the driver is instructed to look for this file in the “My Documents” folder. It is also possible to redefine the ‘default’ folder using command 010C.

Format files may contain embedded commands, in which case, the APD will implement the command rather than sending the contents of the file to the printer. For example, if the specified file contains $$[CMD:010E]$$, the APD will open the communication port and no data will be sent to the printer.

Similarly, if the specified file is actually a template file (which is for use by the APD and not by the printer) the APD will not send it.

#### Command 0101 (Decimal 257) Send Data

Reference: Cmd\_PSSendData.

Purpose: Takes variable data, encodes it into the command language relevant to the ‘connected’ printer, and then sends it to the printer.

Parameters: Quantity. (i.e. the number of identical labels to be printed; normally one).

Examples:

<table>
	<tr>
		<td>Direct</td>
		<td>See “PSSendData”, described in section A.1.3.</td>
	</tr>
	<tr>
		<td>Indirect</td>
		<td><code>PSExternal(Cmd_PSSendData, 1);</code></td>
	</tr>
	<tr>
		<td>Embedded</td>
		<td><code>Embedded $$[CMD:0101,1]$$\r\n2\r\n£1.49\r\nSilvikrin\r\nSoft and Gentle\r\n100ml\r\n66897678\r\n</code></td>
	</tr>
	<tr>
		<td>Browser</td>
		<td><code>objPrinter.PSExternal(266, “$$[CMD:0101,1]$$\r\n2\r\n£1.49\r\nSilvikrin\r\n Soft and Gentle\r\n100ml\r\n66897678\r\n”);</code></td>
	</tr>
</table>

Notes:

In the above examples, the following data is sent:

	2
	£1.49
	Silvikrin
	Soft and Gentle
	100ml
	66897678

The first line refers to the name of the print template or label format to be used (“2” in this example), followed by the variable data to be inserted into this template.

In the ‘indirect’ case, the data is assumed to be in a file called “PRTDRV.PRN” located in the “\Program Files\” folder.

Each data field must be terminated with <CR><LF> (hex 0D, 0A). However, if the data is sent using ‘Send String’, command 266 (010A), non-printing characters are not allowed, so the ‘carriage return’ and ‘line feed’ characters at the end of each line of text have been replaced by \r and \n respectively. Further information on non- printing characters is provided in the notes relating to Command 010A.

Templates are expected to be in folder “Application\APD\Template” unless a different path has been defined by command 010B. However, if no template is found, the driver will use ‘internal’ rules to encode the data, provided the printer uses one of the command languages recognised by the APD. Failing this, an error message will be returned.

When ‘internal’ rules are used, the template name (“2” in the above example) will be used as the format name. Although many printers support format names of up to 8 characters, some only support single-character identifiers. For the widest compatibility, single-digit names are recommended, e.g. “2”.

If a template is used, there is no specific restriction on template names. Please refer to Annex B for a detailed discussion of the use of templates and formats.

#### Command 0102 (Decimal 258) Display Setup

Reference: Cmd\_PSDisplaySetup.

Purpose: Not implemented on this version.

#### Command 0103 (Decimal 259) Setup Printer

Reference: Cmd\_PSSetupPrinter.

Purpose: Not implemented on this version.

#### Command 0104 (Decimal 260) Get Version

Reference: Cmd\_PSGetVersion.

Purpose: Requests the version number of the Adaptive Printer Driver. 

Parameters: None.

Examples

<table>
	<tr>
		<td>Direct</td>
		<td><code>TCHAR *PSGetVersion(void);</code></td>
	</tr>
	<tr>
		<td>Indirect</td>
		<td><code>PSExternal(260, NULL);</code></td>
	</tr>
	<tr>
		<td>Embedded</td>
		<td><code>$$[CMD:0104]$$</code></td>
	</tr>
	<tr>
		<td>Browser 1</td>
		<td><code>objPrinter.PSExternal(260, “”);</code></td>
	</tr>
	<tr>
		<td>Browser 2</td>
		<td><code>objPrinter.PSExternal(266, “$$[CMD:0104]$$”);</code></td>
	</tr>
</table>

Response: The ‘direct’ and ‘browser’ commands return data via a pointer to a NULL terminated string. In the case of the Browser, the version is automatically displayed when the browser starts. The other commands return data via the “PRTDRV.RSP” file in “\Program Files”.

Example of data: `Symbol APD v2.14` (returned as Unicode characters).

#### Command 0105 (Decimal 261) Set Printer

Reference: Cmd\_PSSetPrinter.

Purpose: Sets the Printer ‘ID’ to be used (i.e. defines the ‘current’ printer).
Parameters: PID.

Examples:

<table>
	<tr>
		<td>Direct</td>
		<td>Not available as a direct command</td>
	</tr>
	<tr>
		<td>Indirect 1</td>
		<td><code>PSExternal(261, “1234C32”);</code></td>
	</tr>
	<tr>
		<td>Indirect 2</td>
		<td><code>SendCommand(Cmd_PSSetPrinter,szPrinterID,hDlg));</code></td>
	</tr>
	<tr>
		<td>Embedded</td>
		<td><code>$$[CMD:0105,1234C32]$$</code></td>
	</tr>
	<tr>
		<td>Browser</td>
		<td><code>objPrinter.PSExternal(261, strPID);</code></td>
	</tr>
	<tr>
		<td>Browser</td>
		<td><code>objPrinter.PSExternal(266, “$$[CMD:0104]$$”);</code></td>
	</tr>
</table>

Notes:
These examples set the PID to 1234C32. No data is sent to the printer.

If the PID were an “extended 4-character PID”, 1234C32 could be replaced by
`WC32:6101|157235010002` (say).

Please refer to Annex C for a fuller description of the various forms of PID.

Where the PID has been read from the barcoded label on the printer, ’Wireless LAN” printers may display the printer’s IP address as “0.0.0.0”. This indicates that the printer is using “DHCP” to obtain a dynamically allocated IP Address. The terminal application must ascertain the actual IP address allocated to this printer, and send this address to the APD. Do not send “0.0.0.0” to the APD.

”Bluetooth” connectivity is provided by the Compact Flash Bluetooth Card manufactured by Socket Communications Inc. This card requires additional software drivers. See Annex D for further details.

“Cabled” connections to printers (using a PID starting with “0000”) will normally use the parameters: 9600 baud, No parity, 8 Data bits, 1 Stop bit. However, if the printer language character is “C” (e.g. “000C53”), the baud rate is set to 19200.

By default, the serial port is set as “COM1”. However, this can be changed to “COM5” to suit the Zebra MC50 terminal by including the file “APD-com5.reg” in the “\Application” folder. Note that this file is only activated during a ‘cold boot’.

#### Command 0106 (Decimal 262) Get Current Printer.

Reference: Cmd\_PSGetPrinterList.

Purpose: Requests the PID of the currently connected printer.

Parameters: None.

Examples:

<table>
	<tr>
		<td>Direct</td>
		<td><code>TCHAR *PSGetPrinterList(void);</code></td>
	</tr>
	<tr>
		<td>Indirect 1</td>
		<td><code>PSExternal(Cmd_PSGetPrinterList,NULL);</code></td>
	</tr>
	<tr>
		<td>Embedded</td>
		<td><code>$$[CMD:0106]$$</code></td>
	</tr>
	<tr>
		<td>Browser 1</td>
		<td><code>objPrinter.PSExternal(262, “”);</code></td>
	</tr>
</table>

Response: The ‘direct’ and ‘browser’ commands return data via a pointer to a NULL terminated array. The other commands return data via the “PRTDRV.RSP” file in “\Program Files”.

Example of data: `1234R60` or `WC53:6101|157235123010`.

Note: The response may contain more than one PID. Only the first entry is currently used. Any further entries should be ignored.

#### Command 0107 (Decimal 263) Get Last Message.

Reference: Cmd\_PSGetLastMessage.

Purpose: Requests the PID of the currently connected printer.

Parameters: None.

Examples:

<table>
	<tr>
		<td>Direct</td>
		<td><code>TCHAR *PSGetLastMessage(void);</code></td>
	</tr>
	<tr>
		<td>Indirect 1</td>
		<td><code>PSExternal(Cmd_PSGetLastMessage,NULL);</code></td>
	</tr>
	<tr>
		<td>Embedded</td>
		<td><code>$$[CMD:0107]$$</code></td>
	</tr>
	<tr>
		<td>Browser 1</td>
		<td><code>objPrinter.PSExternal(263, “”);</code></td>
	</tr>
</table>

Response: The ‘direct’ and ‘browser’ commands return data via a pointer to a NULL terminated array. The other commands return data via the “PRTDRV.RSP” file in “\Program Files”.

Example of data: `Cannot connect: 55.`

Note: The response relates to the last error, not necessarily the status of the most recent command.

#### Command 0109 (Decimal 265) Get Response

Reference: Cmd\_PSGetResponse.

Purpose: Not implemented on this version.

#### Command 010A (Decimal 266) Send String

Reference: Cmd\_PSSendString.

Purpose: This command allows data to be sent directly, without needing to place it in a file first. This command is only supported by the DLL version of the driver (as used in the Zebra Pocket Browser). It is not supported by the EXE version. The string can contain ‘embedded’ commands as well as data.

Parameters: Data to be sent to the printer, or an ‘embedded’ command followed by
data.

Examples:

<table>
	<tr>
		<td>Direct</td>
		<td>Not available as a direct command</td>
	</tr>
	<tr>
		<td>Indirect</td>
		<td><code>PSExternal(Cmd_PSSendString,TEXT(“Hello”));</code></td>
	</tr>
	<tr>
		<td>Embedded</td>
		<td>This command can not be embedded</td>
	</tr>
	<tr>
		<td>Browser</td>
		<td><code>objPrinter.PSExternal(266, "Hello");</code> or<br />
		<code>objPrinter.PSExternal(266, strPrintData);</code></td>
	</tr>
</table>

Notes:

The parameter string must not contain any non-printing characters, such as ‘carriage return’ (0d hex), ‘line feed’ (0a hex) or “null” (00 hex). These characters can be represented using the “\” notation as listed below. The APD will then replace the representation with the character to be sent to the printer.

“\” notations used to represent ‘non printable’ characters:

<table>
	<tr>
		<th>Notation</th>
		<th>Character inserted</th>
		<th>‘Hex’ equivalent</th>
	</tr>
	<tr>
		<td>\0</td>
		<td>Null</td>
		<td>00</td>
	</tr>
	<tr>
		<td>\a</td>
		<td>Bell</td>
		<td>07</td>
	</tr>
	<tr>
		<td>\b</td>
		<td>Backspace</td>
		<td>08</td>
	</tr>
	<tr>
		<td>\f</td>
		<td>Form Feed</td>
		<td>0C</td>
	</tr>
	<tr>
		<td>\n</td>
		<td>Line Feed</td>
		<td>0A</td>
	</tr>
	<tr>
		<td>\r</td>
		<td>Carriage Return</td>
		<td>0D</td>
	</tr>
	<tr>
		<td>\t</td>
		<td>Tab</td>
		<td>09</td>
	</tr>
	<tr>
		<td>\\</td>
		<td>Backslash ( \ )</td>
		<td>5C</td>
	</tr>
	<tr>
		<td>\xhh</td>
		<td>Free entry, where</td>
		<td>hh = the hex equivalent for the required character e.g \1b inserts an “Escape” character</td>
	</tr>
</table>

For example: the string “\x1bHello\n\0” would be converted to “Hello” preceded by an ‘Escape’ character and followed by ‘line feed’, ‘null’.

Note that this restriction does not apply to any format or template files called by ‘embedded’ commands in the parameter string and such files may contain any characters.

#### Command 010B (Decimal 267) Set ‘Template’ Path

Reference: Cmd\_PSSetTemplatePath or Cmd\_PSetTemplatePath.

Purpose: The default path for template files is “Application\APD\Template”.
However, this may be changed using this command.

Parameters: Path.

Examples:

<table>
	<tr>
		<td>Direct</td>
		<td>Not available as a direct command</td>
	</tr>
	<tr>
		<td>Indirect</td>
		<td><code>PSExternal(Cmd_PSSetTemplatePath, TEXT(“\\My Documents”));</code></td>
	</tr>
	<tr>
		<td>Embedded</td>
		<td><code>$$[CMD:010B,\My Documents]$$</code></td>
	</tr>
	<tr>
		<td>Browser</td>
		<td><code>objPrinter.PSExternal(267, strTemplatePath);</code><br />
		In this example, <code>strTemplatePath</code> defines the folder location.</td>
	</tr>
	<tr>
		<td>Browser</td>
		<td><code>objPrinter.PSExternal(266, “$$[CMD:010B,\My Documents]$$”);</code></td>
	</tr>
</table>

Note: Although ‘format’ files and ‘template’ files may be placed in the same folder, separate folders are recommended to avoid possible confusion.

#### Command 010C (Decimal 268) Set ‘Format’ Path

Reference: Cmd\_PSSetFormatPath or Cmd\_PSetFormatPath.

Purpose: Changes the default path for format files, normally “Application\APD\Formats”.

Examples: The forms of this command are as those used for Command 010B.

#### Command 010D (Decimal 269) Set ‘ID’ Path

Reference: Cmd\_PSSetIDLabelPath or Cmd\_PSetIDLabelPath.

Purpose: Changes the default path for ID files, normally “Application\APD\ID\_Label”.

Examples: The forms of this command are as those used for Command 010B.

#### Command 010E (Decimal 270) Open Port

Reference: Cmd\_PSOpenPort.

Purpose: Opens the previously-defined communication port.
Parameters: None.

Examples:

<table>
	<tr>
		<td>Direct</td>
		<td>Not available as a direct command</td>
	</tr>
	<tr>
		<td>Indirect</td>
		<td><code>PSExternal(Cmd_PSOpenPort,NULL);</code></td>
	</tr>
	<tr>
		<td>Embedded</td>
		<td><code>$$[CMD:010E]$$</code></td>
	</tr>
	<tr>
		<td>Browser</td>
		<td><code>objPrinter.PSExternal(270, “”);</code></td>
	</tr>
</table>

Notes: The port must have previously been defined using the ’Set Printer’
command (0105).

This command may be used with Bluetooth, ‘wired’ or WLAN
connections. However, if used with a WLAN connection, data may be
‘lost’ without any error indication if the printer is switched off while the port is ‘open’.

The port closes if either the hand-held or printer is switched off. However, if the port was open at the time the power was removed, the APD will automatically reopen the port and leave it open after the next print command.

The ‘Set Printer’ command (0105) closes the port automatically.

#### Command 010F (Decimal 271) Close Port

Reference: Cmd\_PSClosePort.

Purpose: Closes the communication port opened by command 010E. 

Examples: The forms of this command are as those used for Command 010E.

#### Command 0112 (Decimal 274) Hide Progress Bar

Reference: Cmd\_PSHideProgress.

Purpose: Prevents the APD’s ‘progress bar’ from being displayed.

Parameters: None.

Examples:

<table>
	<tr>
		<td>Direct</td>
		<td>Not available as a direct command</td>
	</tr>
	<tr>
		<td>Indirect</td>
		<td><code>PSExternal(Cmd_PSHideProgress,NULL);</code></td>
	</tr>
	<tr>
		<td>Embedded</td>
		<td><code>$$[CMD:0112]$$</code></td>
	</tr>
	<tr>
		<td>Browser</td>
		<td><code>objPrinter.PSExternal(274, “”);</code></td>
	</tr>
</table>

Note: This command remains in effect until command 0113 is used, or the APD DLL is unloaded, or the terminal is rebooted. The default state of the progress bar is enabled.

#### Command 0113 (Decimal 275) Show Progress Bar

Reference: Cmd\_PSShowProgress.

Purpose: Allows the APD to display the progress bar.

Examples: The forms of this command are similar to those used for Command
0112.

Note: This command is enabled by default and remains in effect until command 0112 is used.

#### Command 0114 (Decimal 276) Bluetooth Radio Power On

Reference: Cmd\_PSBthPowerOn.

Purpose: Switches Bluetooth Radio Power ‘on’.

Parameters: None.

Examples:

<table>
	<tr>
		<td>Direct</td>
		<td>Not available as a direct command</td>
	</tr>
	<tr>
		<td>Indirect</td>
		<td><code>PSExternal(Cmd_PSBthPowerOn,NULL);</code></td>
	</tr>
	<tr>
		<td>Embedded</td>
		<td><code>$$[CMD:0114]$$</code></td>
	</tr>
	<tr>
		<td>Browser</td>
		<td><code>objPrinter.PSExternal(276, “”);</code></td>
	</tr>
</table>

Notes: This command switches on the power to the Bluetooth radio hardware and remains in effect until the Bluetooth power is switched off using command 0115, or by another application, or via the Control Panel (Settings, System, Radio Power).

The default state of Bluetooth Radio Power after a cold boot is ‘off’.

If the Bluetooth Radio Power is ‘off’ when a ‘Send Data’, ‘Send Format’,
‘Send String’ or ‘Open Port’ command is given, command 0114 will be invoked automatically.

The Bluetooth radio takes approximately 10 seconds to activate when command 0114 is issued. During this time a ‘pop up’ window will display the text “Bluetooth Power, Powering On”.

#### Command 0115 (Decimal 277) Bluetooth Radio Power Off

Reference: Cmd\_PSBthPowerOff.

Purpose: Switches Bluetooth Radio Power ‘off’.

Examples: The forms of this command are similar to those used for Command
0114.

Note: Commands 0114 and 0115 will only work with the Microsoft stack implementations of Bluetooth (not Socket’s Drakar library).

The Bluetooth radio takes approximately 5 seconds to deactivate when command 0115 is issued. During this time a ‘pop up’ window will display the text “Bluetooth Power, Powering Off”.

## ANNEX B: The Use of Formats and Templates

### B.1 Label Formats and Print Templates - Introduction

Printers from different suppliers use different ‘languages’ to define the commands that control how information will appear when printed. (i.e. commands will define text font style, barcode symbology, the size and position of each field, etc.). The Zebra Printer Driver is able to encode data from an application into the ‘language’ suitable for the particular printer used. To do this, the essential elements of a particular printer’s language are defined either within the printer driver, or by a text file. This means that the application can easily use different types of printer, including ‘new’ printers, without needing any change to the driver itself or to the host application.

Note that, for the driver to perform encoding, the data from the application must be presented in its ‘raw’ form, i.e. just the data variables, separated by ‘carriage return’, ‘line feed’. This implies that all the details of the presentation of the data, i.e. text font type, size and position on label; barcode symbology, size and position; and details of any lines or graphics used, must be defined elsewhere.

This is done using a ‘label format’ and/or a ‘print template’. How, when and why to use these requires not only an understanding of the concept of formats and templates, but also an understanding of the capabilities of individual printers.

### B.2 Formats

Formats define the size and layout of a label or tag. Most printers allow format information to be stored in the printer by downloading a ‘format file’ prior to printing the first label or tag. These printers can store several formats and a simple identifier is included with the data to specify which format applies to the data being sent.

Separating the variable and fixed elements of the label has a number of advantages:

* The application does not have to repeat all the ‘fixed’ parameters for every label.
* If the format is stored in the printer, the number of characters sent to the printer each time a label is requested is reduced. This makes serial data communication faster and, in the case of communication using a radio link (RF), it makes the link more efficient.
* The application becomes much less dependent on the type of printer in use, making it much easier to produce the same label on two printers that use different command languages. This is particularly useful where the user purchases printers from more than one supplier.

There are three ways to provide the format file to the printer:

* Download from the serial port of a PC (using a cable) prior to using the printer. This method is simple, but only works if the printer stores the format file in non- volatile memory. It also poses support issues if a faulty printer is replaced with a new printer and no PC is available.
* Download from the hand-held terminal. This is done using host command 0100 (which includes a parameter to identify the file to be downloaded). This method can be used to overcome the ‘non-volatile’ and ‘support’ issues associated with the PC download method. However, if the format file is stored in permanent memory in terminal, there may be issues if the user wishes to change the layout of the label.
* Download from the system host (in ‘Spectrum 24’ Wireless Network systems). A format file, obtained from the host, is sent via the Spectrum 24 link. As far as the driver is concerned, this method is exactly the same as the second but, from a system point of view, it allows format files to be added or changed from a central point.

When using command 0100, the printer driver will pass the format file to the printer, without attempting to process the format file. This does, of course, mean that the file must be encoded in the printer language appropriate to the type of printer in use so, if more than one type of printer is to be used to print the same label, there will need to be corresponding format files for each permutation.

Note that the host also does not need to process format files so, as for the data, it needs have no knowledge of the printer or its language. It simply takes the entire file and sends it out when required.

There is an important point to consider regarding formats. Some types of printer lose their format information when they are turned off, so it is necessary to reload the formats every time the printer is switched on (say, at the start of a working day or shift). However, other types of printer store formats in non-volatile ‘flash’ memory, which often has a limit on the number of ‘write’ cycles; so formats should not be repeatedly downloaded as a ‘matter of course’. The strategy for downloading formats needs to be matched to the way the printer operates.

### B.3 Templates

Templates differ from formats in that templates are used by the printer driver, rather than by the printer.

There are several reasons why templates are useful:

* Some printers do not allow formats to be stored in the printer and have to have fully formatted data sent for each label printed. However, by using a template as a ‘virtual’ format, printers that do not store formats to be used as if they did, thus allowing a common approach for the host.
* There may be cases where the application programmer cannot, or does not wish to, use a stored format. For example, formats cannot normally be used when printing receipts (because receipts vary in length). However templates can be used.
* In some circumstances, the set of rules ‘built in’ to the printer driver to encode data into the more popular printer command languages may not be appropriate. In such cases, a template can be used to redefine the rules.
* Templates are particularly useful when a new type of printer is introduced and the driver needs to know how to encode the data for an unfamiliar printer.

A template can be also be used in conjunction with a format. In this case, the template will tell the driver how to encode the data for use with the relevant format. Note that, because ‘templates’ can not be used directly by the printer, the ‘PC download’ described for formats does not apply to templates. However, templates can be downloaded and updated via ‘Spectrum 24’ as for formats.

Examples of the use of ‘formats’ and ‘templates’ are given in the following sections of this document.

### B.4 Use of “Data”, “ Templates” and “Formats” to print labels

The following examples are based on the need to produce a simple ‘price reduction’ label for a retail application:

<img src="http://rhodocs.s3.amazonaws.com/moto-adaptive-printer-driver/APD-reduced.jpg" alt="APD-reduced.jpg" />

Not all printers have the same capabilities – yet the driver needs to make them all appear the same as far as the application is concerned. This section illustrates how this can be achieved for four printers with different capabilities.

#### B.4.1 Zebra “Encore 2” Printer (Type “C32”)

This is an example of a printer that does support stored formats, but does not have to use them. Thus there are two examples of Template.

Printers using “MPCL”, “ZPL” and several other command languages may be treated similarly.

##### B.4.1.1 Data produced by the application (raw data). Comments in ( ) brackets:

<table>
	<tr>
		<td><code>2</code></td>
		<td>(Template number)</td>
	</tr>
	<tr>
		<td><code>REDUCED!</code></td>
		<td>(Variable 1, text)</td>
	</tr>
	<tr>
		<td><code>Now only $1.99</code></td>
		<td>(Variable 2, text)</td>
	</tr>
	<tr>
		<td><code>5010092008001</code></td>
		<td>(Variable 3, barcode)</td>
	</tr>
</table>

##### B.4.1.2 Contents of Template “2.C32” for use with stored format “F2”:

! UF F2.FMT (Command to use Form “F2”)
$$[Q]$$ (Quantity)
$$[1]$$ (Variable 1)
$$[2]$$ (Variable 2)
$$[3]$$ (Variable 3)

<table>
	<tr>
		<td><code>! UF F2.FMT</code></td>
		<td>(Command to use Form “F2”)</td>
	</tr>
	<tr>
		<td><code>$$[Q]$$</code></td>
		<td>(Quantity)</td>
	</tr>
	<tr>
		<td><code>$$[1]$$</code></td>
		<td>(Variable 1)</td>
	</tr>
	<tr>
		<td><code>$$[2]$$</code></td>
		<td>(Variable 2)</td>
	</tr>
	<tr>
		<td><code>$$[3]$$</code></td>
		<td>(Variable 3)</td>
	</tr>
</table>

The ‘’$$’ markers in this will be replaced by data from B.4.1.1 (plus the quantity, “1”) to form the following set of print commands to be sent to the printer:

	! UF F2.FMT
	1
	REDUCED!
	Now only $1.99
	5010092008001

Note that, with CPCL, the quantity field forms part of the format file. Unless the quantity will always be the same, it is recommended that this be set as a variable field (see below).

##### B.4.1.3 Format File (“Form2.C32”) for use with the above Print Template.

This would have been loaded previously into the printer, either directly from a
PC, or from the Zebra terminal using the “Send Format” command:

	! DF F2.FMT (Define Form “F2”)
	! 0 200 200 300 \\ (Header, variable = qty.)
	CENTER 360
	TEXT 5 3 0 0 \\ (Variable field 1) 
	TEXT 4 0 0 80 \\ (Variable field 2) 
	LEFT
	B EAN13 1 2 80 20 140 \\ (Variable field 3)
	PRINT (End of data)
	! UF F2.FMT (Test using Form “F2”)
1 (Quantity field) 
Format 2 (Variable 1) 
Loaded (Variable 2)
0012345678905 (Variable 3)

<table>
	<tr>
		<td><code>! DF F2.FMT</code></td>
		<td>(Define Form “F2”)</td>
	</tr>
	<tr>
		<td><code>! 0 200 200 300 \\</code></td>
		<td>(Header, variable = qty.)</td>
	</tr>
	<tr>
		<td><code>CENTER 360</code></td>
		<td> </td>
	</tr>
	<tr>
		<td><code>TEXT 5 3 0 0 \\</code></td>
		<td>(Variable field 1)</td>
	</tr>
	<tr>
		<td><code>TEXT 4 0 0 80 \\</code></td>
		<td>(Variable field 2)</td>
	</tr>
	<tr>
		<td><code>LEFT</code></td>
		<td> </td>
	</tr>
	<tr>
		<td><code>B EAN13 1 2 80 20 140 \\</code></td>
		<td>(Variable field 3)</td>
	</tr>
	<tr>
		<td><code>PRINT</code></td>
		<td>(End of data)</td>
	</tr>
	<tr>
		<td><code>! UF F2.FMT</code></td>
		<td>(Test using Form “F2”)</td>
	</tr>
	<tr>
		<td><code>1</code></td>
		<td>(Quantity field)</td>
	</tr>
	<tr>
		<td><code>FORMAT 2</code></td>
		<td>(Variable 1)</td>
	</tr>
	<tr>
		<td><code>LOADED</code></td>
		<td>(Variable 2)</td>
	</tr>
	<tr>
		<td><code>0012345678905</code></td>
		<td>(Variable 3)</td>
	</tr>
</table>

The last five lines are not strictly part of the format, but are included so that the printer prints a confirming label when the format file is loaded.

The printer will combine the ‘format’ section of the above (i.e. from “! DF F2.FMT” to “PRINT”) with data extracted from B.4.1.2 to form the following print command set:

	! 0 200 200 300 1
	CENTER 360
	TEXT 5 3 0 0 REDUCED!
	TEXT 4 0 0 80 Now only $1.99
	LEFT
	B EAN13 1 2 80 20 140 5010092008001
	PRINT

##### B.4.1.4 Alternative Template “2.C32” where there is no stored format:

! 0 200 200 300 $$[Q]$$ (Header, variable = qty.)
CENTER 360
TEXT 5 3 0 0 $$[1]$$ (Variable field 1) TEXT 4 0 0 80 $$[2]$$ (Variable field 2) LEFT
B EAN13 1 2 80 20 140 $$[3]$$ (Variable field 3)
PRINT (End of data)

<table>
	<tr>
		<td><code>! 0 200 200 300 $$[Q]$$</code></td>
		<td>(Header, variable = qty.)</td>
	</tr>
	<tr>
		<td><code>CENTER 360</code></td>
		<td> </td>
	</tr>
	<tr>
		<td><code>TEXT 5 3 0 0 $$[1]$$</code></td>
		<td>(Variable field 1)</td>
	</tr>
	<tr>
		<td><code>TEXT 4 0 0 80 $$[2]$$</code></td>
		<td>(Variable field 2)</td>
	</tr>
	<tr>
		<td><code>LEFT</code></td>
		<td> </td>
	</tr>
	<tr>
		<td><code>B EAN13 1 2 80 20 140 $$[3]$$</code></td>
		<td>(Variable field 3)</td>
	</tr>
	<tr>
		<td><code>PRINT</code></td>
		<td>(End of data)</td>
	</tr>
</table>

In this case, the terminal will insert the data from B.4.1.1 into this template
(including the quantity, 1) and send the following commands to the printer:

	! 0 200 200 300 1
	CENTER 360
	TEXT 5 3 0 0 REDUCED!
	TEXT 4 0 0 80 Now only $1.99
	LEFT
	B EAN13 1 2 80 20 140 5010092008001
	PRINT

As can be seen, this gives exactly the same result as for B.4.1.3.

##### B.4.1.5 A note on ‘backward compatibility’

The ‘template’ file will normally be found in the ‘template’ folder. However,
where the APD is replacing an older version, and no template file is found, the driver will encode the data using its ‘in-built’ set of rules for “CPCL”. In this case, the template number specified by the SendData command will be used to generate the format name sent to the printer.

This means that for the example data given in paragraph B.4.1.1 the output would be:

	! UF 2.FMT
	1    <-------- Template number inserted here
	REDUCED!
	Now only $1.99
	5010092008001

Note that this is the same as before, except that the format name is “2.FMT”
not “F2.FMT”.

However, this is not a problem, as the ‘older’ style format file would have used this name.

With the ‘old’ scheme, the format name had to directly relate to the name
used by the printer. This meant that, to ensure compatibility with a wide range of printers, the name had to be one digit, i.e. 1 to 9. It is suggested that template names be similarly restricted, if possible; although, with the ‘new’ scheme, template and format names may comprise up to 8 characters
(e.g. “Label1”, “Tag06”, etc), as they do not have to be the same name used by the printer.

#### B.4.2 Paxar “9460” Printer with RCL option (Type “R60”)

This printer can only work using stored formats. Thus, there is only one form of Print Template.

##### B.4.2.1 Data produced by the application (raw data). Comments in ( ) brackets:

This is the same data used in Section B.4.1.

	2 (Template number) 
	REDUCED! (Variable 1, text) 
	Now only $1.99 (Variable 2, text)
	5010092008001 (Variable 3, barcode)

##### B.4.2.2 Contents of Template “2.R60” for use with stored format “2”:

<table>
	<tr>
		<td><code>^P|2|$$[Q]$$|$$[1]$$|$$[2]$$|$$[3]$$|^</code></td>
		<td>(Print using Form “2”)</td>
	</tr>
</table>

The above data would be inserted into this (plus the quantity, 1) to form the following set of data to be sent to the printer:

	^P|2|1|REDUCED!|Now only $1.99|5010092008001|^

##### B.4.2.3 Format File (“Form2.R60”) for use with the above Print Template.

This would have been loaded previously into the printer, either directly from a
PC, or from the Zebra terminal using the “Send Format” command:

	^C|^
	^R|$|DR|^
	^R|1|R|20|0|340|70|0|0|1|3|2|2|0|0||^
	^R|2|R|20|75|340|60|0|0|1|2|2|2|0|0||^
	^R|3|R|80|140|300|100|0|0|0|h|3|0|60|0||^
	^T|2|R|380|200|1|2|3|^
	^P|2|1|Format 2|Loaded|0012345678905|^

The last line is not strictly part of the format, but is included so that the printer prints a confirming label when the format file is loaded.

The printer will combine this with data from B.4.2.2 to form the required print commands.

#### B.4.3 Cognitive “Code Courier” Printer (Type “D10”)

This printer does not support stored formats. Thus there is only one form of Print Template.

##### B.4.3.1 Data produced by the application (raw data). Comments in ( ) brackets:

This is the same data used in Sections B.4.1 and B.4.2.

<table>
	<tr>
		<td><code>2</code></td>
		<td>(Template number)</td>
	</tr>
	<tr>
		<td><code>REDUCED!</code></td>
		<td>(Variable 1, text)</td>
	</tr>
	<tr>
		<td><code>Now only $1.99</code></td>
		<td>(Variable 2, text)</td>
	</tr>
	<tr>
		<td><code>5010092008001</code></td>
		<td>(Variable 3, barcode)</td>
	</tr>
</table>

##### B.4.3.2 Template (“2.D10”):

	! 0 100 470 $$[Q]$$ (Quantity) 
	WIDTH 224
	NOINDEX
	STRING 18X23(1,1,2,2) 125 25 Code (Fixed text) 
	STRING 18X23(1,1,2,2) 80 80 Ranger (Fixed text) 
	FILL_BOX 10 10 370 130
	DRAW_BOX 10 10 370 320 8
	STRING 18X23(1,1,1,1) 50 155 $$[1]$$ 
	STRING 18X23 50 190 $$[2]$$
	BARCODE EAN13(2:3) 95 295 70 135$$[3]$$ 
	END

The ‘’$$’ markers in this will be replaced by data from B.4.3.1 (plus the quantity, “1”) to form the following set of print commands to be sent to the printer:

	! 0 100 470 1
	WIDTH 224
	NOINDEX
	STRING 18X23(1,1,2,2) 125 25 Code 
	STRING 18X23(1,1,2,2) 80 80 Ranger 
	FILL_BOX 10 10 370 130
	DRAW_BOX 10 10 370 320 8
	STRING 18X23(1,1,1,1) 50 155 REDUCED! 
	STRING 18X23 50 190 Now only $1.99
	BARCODE EAN13(2:3) 95 295 70 1355010092008001
	END

Note that this example contains some additional, fixed text and graphics, so the label produced will not look exactly the same as with the two printers already discussed. However, as far as the application is concerned, there is no difference.

##### B.4.3.3 Format File (“Form2.D10”) - optional.

To avoid a “File not found” error if command “Send Format Form2” is issued when this printer is selected, a ‘dummy’ file may be used so that a confirming label is printed when the format file is loaded:

	! 0 100 470 1
	WIDTH 224
	NOINDEX
	STRING 18X23(1,1,2,2) 125 25 Code 
	STRING 18X23(1,1,2,2) 80 80 Ranger 
	FILL_BOX 10 10 370 130
	DRAW_BOX 10 10 370 320 8
	STRING 18X23(1,1,1,1) 50 155 FORMAT 2
	STRING 18X23 50 190 LOADED
	BARCODE EAN13(2:3) 95 295 70 1350012345678905
	END

#### B.4.4 Toshiba-TEC “B-211” Printer with RF option (Type “T21”)

This printer can only work using stored formats. However, this printer is has some ‘quirks’ that require several different forms of Print Template in different circumstances.

For example, when using 'wired' communication, the data syntax requires an ‘escape’ character (1Bh) at the start of each command line, and a ‘line feed’ (0Ah) and ‘null’ (00h) at the end of each line. There are no ‘carriage return’ characters. However, when data is sent using ‘RF’ communication (433MHz), these characters are omitted. Format information can not be sent via ‘RF’.

Furthermore, variable length data fields are separated by a ‘line feed’ character (0A), whereas there is no separator following fixed length fields. A mixture of fixed length and variable length fields can get confusing!

Another complication with this printer is that its ID (used for RF communication) is shown on a configuration print out in decimal form, whereas the ID actually used by the RF protocol is in hex.

Thus, the printer driver in the terminal has to translate the ID from decimal to hex. It then assumes a "T" for the printer type. Thus an ID of 00134 would become 0086T.

To account for the different syntax between ‘wired’ and ‘RF’ modes, two template files could be used:

"2.T" for RF communication (ID = "0086T") and
"2.T21" for wired communication (ID entered as "0000T21", the “21” denoting model B-211).

The new SP2 printer will have Bluetooth and WLAN communication options. However, although these are 'RF' links, the 'wired' syntax will be used. This should not pose a problem as the ID will be "BT12" or "WT12" and file "2.T12" can use the same syntax as file "2.T21" below.

##### B.4.4.1 Data produced by the application (raw data). Comments in ( ) brackets:

This is the same data used in Sections B.4.1 to B.4.3.

	2              (Template number) 
	REDUCED!       (Variable 1, text) 
	Now only $1.99 (Variable 2, text)
	5010092008001  (Variable 3, barcode)

##### B.4.4.2 Print Template (“2.T”) for use with stored format “2” and ‘RF’ communication:

	X<02><01>$$[Q:%c]$$$$[1]$$<0A>$$[2]$$<0A>$$[3]$$<0A>

Note: Non-printing characters are shown thus:

<table>
	<tr>
		<td><code><1B></code></td>
		<td>= escape</td>
	</tr>
	<tr>
		<td><code><0A></code></td>
		<td>= line feed</td>
	</tr>
	<tr>
		<td><code><00></code></td>
		<td>= null</td>
	</tr>
</table>

There are no carriage return characters in the actual data.

The above data would be inserted into this (plus the quantity, 1) to form the following set of data to be sent to the printer:

	X<02><01><01>REDUCED!<0A>Now only $1.99<0A>5010092008001<0A>

A complication of this printer is that the quantity field is in binary form, not ASCII. This is indicated by the “:%c” after the “Q”. See section B.6 for a list of applicable “%” functions.

Note: If the variable fields were of fixed length, the ‘line feed’ characters after each field would be omitted from the Print Template.

Note also that, unlike other printers where the media sensing method is defined either by a configuration command or in the format file, this information is included in the print command. In this case, the first “<01>” denotes “transmissive sensor enabled”.

##### B.4.4.3 Template (“2.T21”) for use with stored format “2” and ‘wired’ communication:

	<1B>X<02><01>$$[Q:%c]$$$$[1]$$<0A>$$[2]$$<0A>$$[3]$$<0A><0A><00>

This is as B.4.4.2 but has the ‘escape’, ‘line feed’ and ‘null’ characters added.

##### B.4.4.4 Either of the above Print Templates would use the following format file (“Form2.T21”):

	<1B>XO;02,4<0A><00>
	<1B>D0400,0480,0350<0A><00>
	<1B>AY;+00,1<0A><00><1B>AX;+030<0A><00>
	<1B>PC00;0240,0060,2,2,F,00,B,00,1,0,P1<0A><00>
	<1B>PC01;0240,0150,2,2,G,00,B,00,1,0,P1<0A><00>
	<1B>XB02;0125,0190,5,3,02,0,0080,020,1,00,1,0<0A><00>
	<1B>XP<0A><00>
	<1B>X<02><01><01>Format 2<0A>Loaded<0A>0012345678905<0A><00>

As in previous examples, the last line is actually a print command to force the printer to produce a label confirming that the format has loaded.

Note that this file cannot be sent to the printer via RF communication.

The example format file uses variable length data fields. If any, or all of the fields were defined as fixed length fields, the relevant ‘line feeds’ <0A> would be omitted in both the last line of the format file and the corresponding templates.

### B.5 Using Print Templates for Receipts

Several printers, including the Zebra “CPCL” printers and the Toshiba-TEC printers can operate in a “Receipt” mode. This allows data to be output line-by-line, as required, until the total number of items has been printed. This mode is used as it is not appropriate to use stored formats in which the number of variable fields has to be pre- defined.

In the case of the CPCL printers (such as the Zebra “Cameo” printers), the printer can automatically switch between ‘label’ and ‘receipt’ modes as required. In other words, unless the data is preceded by a ‘header’ line (starting with “!”), the printer assumes ‘receipt’ mode and prints line by line – each line end being denoted by a ‘carriage return’ character <0D>.

In the case of the Toshiba-TEC printer, a special command has to be sent to select the desired mode (’label’ or ‘receipt’). Once in ‘receipt’ mode the Toshiba-TEC printers use a different command set to that used for ‘label’ mode. This isn’t too much of an issue, although line ends are denoted by ‘line feed’ characters <0A>, not ‘carriage return’ <0D>.

Because of the differences between the various printers that offer a ‘receipt’ mode, some form of Print Template is required to define how the data should be presented. Normally, the template would need to have a fixed number of variable fields and would thus suffer the same limitation as for format files.

However, this is dealt with by designating a ‘repeatable’ line in the template.

This is designated using a special marker “$$[N”, where the “N” denotes that this line is used as many times as required. The problem of determining how many times to use this line is dealt with by sending all the data relating to the $$N marker at the end of the file. This means the data may need to be in a different order to that in which it is to be printed. In the following example, the ‘header’ data is sent first (corresponding to variables $$[1]$$ to $$[3]$$), then the ‘footer’ information is sent (variables $$[4]$$ and $$[5]$$), and then the ‘repeated’ section (the item list) is sent – even though they are not printed in this order.

There is a need to define the start and end of the repeated section contained in the marker as neither ‘carriage returns’ nor ‘line feeds’ can be guaranteed to be present in the template.

Hence in the example overleaf, the repeated section is shown as
$$[N6:\x1bA%s\r\n]$$ where $$[N6: indicates a ‘repeated’ section, in this case using variables 6 onwards. Each ‘repeat’ comprises the variable data, represented by %s, together with fixed ‘start of line’ and ‘end of line’ characters relevant to the particular printer language involved. ‘Non-printing’ characters are represented using ‘C programming style’ notations, as defined in Section B.6.

Thus, in this example, the data (%s) is preceded by an ‘escape’ character (1b) and an “A”, and followed by ‘carriage return’ (\r = 0d) and ‘line feed’ (\n = 0a). The end of the repeated section is indicated by ]$$.

Example of a Template for printing receipts (template “3”):

<table>
	<tr>
		<td><code>! 0 200 200 300 1</code></td>
		<td>-</td>
	</tr>
	<tr>
		<td><code>CENTER 360</code></td>
		<td>|</td>
	</tr>
	<tr>
		<td><code>TEXT 5 3 0 0 Al’s Restaurant</code></td>
		<td>|</td>
	</tr>
	<tr>
		<td><code>LEFT</code></td>
		<td>|   (Header, ‘label’ mode)</td>
	</tr>
	<tr>
		<td><code>TEXT 4 0 0 50 Date $$[1]$$</code></td>
		<td>|</td>
	</tr>
	<tr>
		<td><code>TEXT 4 0 0 90 Waiter $$[2]$$</code></td>
		<td>|</td>
	</tr>
	<tr>
		<td><code>TEXT 4 0 0 120 Table $$[3]$$</code></td>
		<td>|</td>
	</tr>
	<tr>
		<td><code>PRINT</code></td>
		<td>-</td>
	</tr>
	<tr>
		<td><code>$$[N6:\x1bA%s\r\n]$$</code></td>
		<td>(Repeated ‘receipt’ section)</td>
	</tr>
	<tr>
		<td><code>! 0 200 200 300 1</code></td>
		<td>-</td>
	</tr>
	<tr>
		<td><code>LEFT</code></td>
		<td>|</td>
	</tr>
	<tr>
		<td><code>TEXT 3 0 100 20 Total $$[4]$$</code></td>
		<td>|    (Footer, ‘label’ mode)</td>
	</tr>
	<tr>
		<td><code>TEXT 3 0 80 50 Includes $$[5]$$ VAT</code></td>
		<td>|</td>
	</tr>
	<tr>
		<td><code>TEXT 4 0 50 100 Thank you</code></td>
		<td>|</td>
	</tr>
	<tr>
		<td><code>PRINT</code></td>
		<td>-</td>
	</tr>
</table>

The corresponding data generated by the application would be:-

<table>
	<tr>
		<td><code>3</code></td>
		<td>(Template number)</td>
	</tr>
	<tr>
		<td><code>24 April 2003</code></td>
		<td>(Variable 1, date)</td>
	</tr>
	<tr>
		<td><code>Fred</code></td>
		<td>(Variable 2, waiter)</td>
	</tr>
	<tr>
		<td><code>12</code></td>
		<td>(Variable 3, table)</td>
	</tr>
	<tr>
		<td><code>£ 44.75</code></td>
		<td>(Variable 4, total)</td>
	</tr>
	<tr>
		<td><code>£  6.66</code></td>
		<td>(Variable 5, VAT)</td>
	</tr>
	<tr>
		<td><code>Ch. Soup        £  2.50</code></td>
		<td>-</td>
	</tr>
	<tr>
		<td><code>Melon           £  2.00</code></td>
		<td>|</td>
	</tr>
	<tr>
		<td><code>Beef Strog      £ 12.50</code></td>
		<td>|   (Variables 6 onwards)</td>
	</tr>
	<tr>
		<td><code>Lasagne         £ 10.50</code></td>
		<td>|</td>
	</tr>
	<tr>
		<td><code>Gn Salad        £  2.25</code></td>
		<td>|</td>
	</tr>
	<tr>
		<td><code>Gn Salad        £  2.25</code></td>
		<td>|</td>
	</tr>
	<tr>
		<td><code>Banana del      £  3.25</code></td>
		<td>|</td>
	</tr>
	<tr>
		<td><code>Tiramisu        £  3.50</code></td>
		<td>|</td>
	</tr>
	<tr>
		<td><code>Coffee x2       £  4.00</code></td>
		<td>|</td>
	</tr>
	<tr>
		<td><code>Liqueur         £  2.00</code></td>
		<td>|</td>
	</tr>
</table>

By placing the data relating to the $$[N marker at the end of the file (variables 6 onwards in the above example), the number of item lines is not important and the driver does not need to count back from the end to work out where the ‘repeated’ section ends. However, the application also has to comply with the requirement that the ‘variable’ data comes at the end of the file. Also, the template cannot contain more than one repeated section. Two or more templates could be used if a more complex receipt is required.

Alternatively, the application can send the data using the “SendFormat” command. This has no format restrictions. However, the application then has to format the data itself and the data becomes limited to one type of printer.

In the above example, the ‘escape’ A is not actually required for this printer, but is included to show how such a ‘start of line’ string could be included if required.

The example also shows how, within the same template the printer can be made to switch between modes if required. In this example, the header and footer are sent using label mode. This could be useful if graphics (e.g. a company logo) are to be included.

### B.6 “\” and “%” Notations used within Template Markers

Previous sections show how markers may be used to indicate points at which variable parameters or data are to be added by the Adaptive Printer Driver. Although ‘template’ files may contain both ‘printable’ (ASCII) and ‘non printable’ characters, markers within the template may only contain ‘printable’ characters. Thus, the following notations are used to allow ‘non-printable’ characters to be added, or to insert a parameter in a format other than ASCII.

Examples of such notations have been given in the earlier sections. However, the list below gives a complete list of the notations that may be used within the “$$” markers.

#### B.6.1 “\” notations used to insert ‘non printable’ characters:

<table>
	<tr>
		<th><code>Notation</code></th>
		<th>Character inserted</th>
		<th>‘Hex’ equivalent</th>
	</tr>
	<tr>
		<td><code>\0</code></td>
		<td>Null</td>
		<td>00</td>
	</tr>
	<tr>
		<td><code>\a</code></td>
		<td>Bell</td>
		<td>07</td>
	</tr>
	<tr>
		<td><code>\b</code></td>
		<td>Backspace</td>
		<td>08</td>
	</tr>
	<tr>
		<td><code>\f</code></td>
		<td>Form feed Line</td>
		<td>0C</td>
	</tr>
	<tr>
		<td><code>\n</code></td>
		<td>feed Carriage</td>
		<td>0A</td>
	</tr>
	<tr>
		<td><code>\r</code></td>
		<td>Return</td>
		<td>0D</td>
	</tr>
	<tr>
		<td><code>\t</code></td>
		<td>Tab</td>
		<td>09</td>
	</tr>
	<tr>
		<td><code>\\</code></td>
		<td>Backslash ( \ )</td>
		<td>5C</td>
	</tr>
	<tr>
		<td><code>\xhh</code></td>
		<td>Free entry, where</td>
		<td>hh = the hex equivalent for the required character e.g \1b inserts an “Escape” character</td>
	</tr>
</table>

For example: \x1bHello\n\0 would insert the string “Hello” preceded by an ‘Escape’ character and followed by ‘line feed’, ‘null’.

#### B.6.2 “%” notations used to define format of inserted variable parameters:

<table>
	<tr>
		<th><code>Notation</code></th>
		<th>Format</th>
		<th>Example</th>
	</tr>
	<tr>
		<td>%c</td>
		<td>Inserts parameter as a binary character</td>
		<td>e.g. “15” is added as 0Eh.</td>
	</tr>
	<tr>
		<td>%d</td>
		<td>Inserts parameter as a decimal character</td>
		<td>e.g. “15” is added as “15” (31h 35h)</td>
	</tr>
	<tr>
		<td>%s</td>
		<td>Inserts parameter as an ASCII string</td>
		<td>e.g. “15” is added as 0Eh.</td>
	</tr>
	<tr>
		<td>%x</td>
		<td>Inserts parameter in hexadecimal form</td>
		<td>e.g. “15” is added as “e” (65h)</td>
	</tr>
</table>

Where the format is not defined, parameters will be added as ASCII characters.

For example: $$[Q]$$ inserts ‘quantity’ as an ASCII string, but $$[Q:%c]$$ inserts ‘quantity’ as a binary character (‘quantity’ must be less than 255).

## ANNEX C: Form of Peripheral Identifiers (PRINTER ID)

### C.1 5-CHARACTER PERIPHERAL IDENTIFIERS

Peripheral Identifiers (PIDs) with 5 characters use the following forms:

#### 0000A Where “A” may be any letter.

The four zeros indicate a ‘wired’ connection to a printer using command language “A”. The baud rate, and other parameters for the wired serial data connection are defined from a list containing the following entries.

0000C Zebra “CPCL” Printer. 19200 baud, 8 bits, no parity.
0000D Cognitive (Axiohm) Printer, 9600 baud, 8 bits, no parity.
0000E Zebra “EPL” Printer, 9600 baud, 8 bits, no parity.
0000M Paxar “MPCL” Printer, 9600 baud, 8 bits, no parity.
0000R Paxar “RCL” Printer, 9600 baud, 8 bits, no parity.
0000S Sato Printer, 9600 baud, 8 bits, no parity.
0000T Toshiba-TEC Printer, 9600 baud, 8 bits, even parity.
0000Z Zebra “ZPL” Printer, 9600 baud, 8 bits, no parity.

Any other PIDs of this form, not shown above, will use the parameters:
9600, N, 8, 1.

NOTE: The ‘default’ serial communication port is “COM1”, which is used by most Zebra devices. However, the Zebra MC50 Mobile Computer uses “COM5”. To change the port used by the APD to “COM5”, add the file “APD-com5.reg” to the files placed in the terminal’s “\Application” folder. Note that this file only takes effect after a ‘cold boot’.

#### 12345 Where “12345” may be any 5-digit number, except 00000.

This defines an RF connection to a Toshiba-TEC portable printer.
The PID, which is ‘unique’ to each printer, may be determined by printing a configuration label. Often the PID corresponds to the last five digits of the printer’s serial number – but not always.

### C.2 7-CHARACTER PERIPHERAL IDENTIFIERS

Peripheral Identifiers (PIDs) with 7 characters consist of four hexadecimal characters that define the connection to the printer, followed by a letter and a two-digit number. The first five characters are the same as those used in 5-character PIDs, but the two additional digits allow the printer type to be defined more fully.

The following forms are used:

#### 0000A12 Where “A” may be any letter and “12” may be any 2-digit number from 00 to 99.

The four zeros indicate a ‘wired’ connection to the printer. The connection parameters are the same as given above for the 5-character PID.

In both forms, the central letter defines the command language understood by the printer and, together with the last two digits, defines the exact model. For example, C53 defines a Zebra “QL320” printer and R60 defines a Paxar “9460” printer with RCL option.

The command language letters assigned to date are shown on the following list. Note that not all entries share the same level of functionality. This may be a result of different levels of implementation in the driver software, or because of variations in printer capability.

#### 1111M or 3B87M or A5B3M91, or any other PID with an “M” as the fifth character

C.2.1 Printer Command Language Identifiers (assigned as of July 2004).
See Document CPR576 for a full list of printer type codes.

<table border="1">
	<tr>
		<th>Identifier</th>
		<th>Language</th>
		<th>Notes</th>
	</tr>
	<tr>
		<td>A</td>
		<td>“Escape P”</td>
		<td>Used by various printers. Template required.</td>
	</tr>
	<tr>
		<td>C</td>
		<td>CPCL (Zebra)</td>
		<td>Supports Formats</td>
	</tr>
	<tr>
		<td>D</td>
		<td>Cognitive (Axiohm)</td>
		<td>Template required</td>
	</tr>
	<tr>
		<td>E</td>
		<td>EPL (Zebra)</td>
		<td>Supports Formats</td>
	</tr>
	<tr>
		<td>I</td>
		<td>Do not use</td>
		<td>May be confused with ‘one’</td>
	</tr>
	<tr>
		<td>M</td>
		<td>MPCL (Paxar)</td>
		<td>Supports Formats</td>
	</tr>
	<tr>
		<td>N</td>
		<td>O’Neil</td>
		<td>Template required</td>
	</tr>
	<tr>
		<td>O</td>
		<td>Do not use</td>
		<td>May be confused with ‘zero’</td>
	</tr>
	<tr>
		<td>P</td>
		<td>Printronix</td>
		<td>Template required</td>
	</tr>
	<tr>
		<td>R</td>
		<td>RCL (Paxar)</td>
		<td>Supports Formats</td>
	</tr>
	<tr>
		<td>S</td>
		<td>Sato</td>
		<td>Supports Formats</td>
	</tr>
	<tr>
		<td>T</td>
		<td>Toshiba-TEC</td>
		<td>Supports Formats (within capability of printer)</td>
	</tr>
	<tr>
		<td>U</td>
		<td>Any</td>
		<td>Free for user-defined printer type (template required)</td>
	</tr>
	<tr>
		<td>Z</td>
		<td>Sato</td>
		<td>ZPL (Zebra)</td>
	</tr>
</table>


Letters not listed in the “Identifier” column are reserved for future use. Use “U” for printers not listed above. A complete, up-to-date list is available: ref. CPR576.

‘Template required’ indicates that a ‘command template’ file must be present in the terminal if the “Send Data” command (command 0101) is used. Formats may be used, if the printer supports them, provided a template is also used.

‘Supports Formats’ means that ‘in-built’ rules are available for this printer type. A Template must be used if this printer is not using stored formats.

See Annexes A and B for further information.

### C.3 “4-CHARACTER” PERIPHERAL IDENTIFIERS

“4-character” Peripheral Identifiers (PIDs) have 4 basic characters, but may be extended to include additional parameters, such as an IP Address. Thus, they can be quite long and often require two barcodes to accommodate all the required information.

“4-character” PIDs are based on the 7-character PID form, but a single character that indicates the type of connection to the printer now replaces the first four characters.

The second character, “A” in the following examples, defines the printer’s command language; and the third and fourth characters define the printer model in the same way as for characters 6 and 7 of the 7-character PID.

The following forms are used:

#### BA12 Where the “B” indicates a ‘Bluetooth’ connection.

“A” may be any letter and “12” may be any 2-digit number from 00 to 99.
In this case a suffix is added to define the “Bluetooth Channel Number” used. A second barcode, giving the printer’s 12-character “Bluetooth Address” also forms part of the PID. By scanning this barcode, the user can link directly to the printer without having to go via the Bluetooth “discovery” process.

#### WA12 The “W” indicates a ‘WLAN’ connection.

In this case a suffix is added to define the “TCP Port Number” used.
A second barcode, giving the printer’s “IP Address”, also forms part of the
PID.

#### 0A12 The single zero indicates a ‘wired’ connection to the printer. 

In this case, the PID is extended with a suffix that fully defines the connection parameters (baud rate, type of parity, etc). However, this form is not yet implemented, so details are not published.

#### nA12 Where “n” is a digit between 1 and 9.

This indicates a ‘wired’ connection, where “n” defines a preset combination of parameters, such that no suffix is required. This will satisfy the majority of ‘wired’ connection options and simplify manual entry of the PID. However, this form is also not yet implemented, so no details are given.

Further details of “Extended 4-character PIDs” are given in the following sections.

#### C.3.1 “Extended 4-Character Peripheral Identifiers” for Wireless LAN connectivity

In order to accommodate additional parameters, the basic PID is extended as follows: 

	WA12:<parameter 1>|<parameter 2>

The first additional parameter (Port Number) is prefixed by a ‘colon’ character (3A hex) and the second additional parameter (IP Address) is prefixed by a ‘bar’ character (7C hex). If either, or both, additional parameters are omitted, the driver will assume ‘default’ values.

The method by which the PID is passed to the driver, is given in Annex A.

The following example shows an “Extended 4-character” PID for a WLAN connection.
WC53:6101|157.235.10.2.

This defines a Zebra QL320 printer, with Port Number 6101 and IP Address
157.235.10.2.

Because the total number of characters in the PID would produce a very long barcode, the information is split into two barcodes, using ‘Code 128’ symbology:

<img src="http://rhodocs.s3.amazonaws.com/moto-adaptive-printer-driver/APD-Printer-ID-code-128.jpg" alt="APD-Printer-ID-code-128.jpg" />

The first barcode contains “WC53:6101” and the second contains “157235010002”. The latter has been ‘standardised’ to its 12-digit form with the ‘dots’ removed and leading zeros added as required. This produces a more compact barcode, with a uniform length. However, the ‘human readable’ characters under the second barcode retain the original form as this is more recognisable as an IP address to most users.

Notes:  When passing the PID to the driver using the “Set Printer” command (command 0105), the following forms of PID are acceptable:

	WA12:6101|157.235.10.2   Port = 6101   IP address including ‘dots’
	WA12:6101|1572350100002  Port = 6101   IP address without ‘dots’
	WA12|1572350100002       Port set to default value of 515

The printer may display an IP Address of 0.0.0.0. This is NOT a valid address, but is used to indicate that the printer has been configured to obtain its IP Address from a DHCP server. The driver can only accept the ‘real’ IP Address as passing the value of 0.0.0.0 to the driver would result in invalid network operation. Therefore, it is up to the application to determine the actual IP Address being used by the printer and then insert this address into the PID string that it sends to the driver using the “Set Printer” command. Some printers have a small LCD screen that can display the current IP address, which the user can then enter manually into the hand-held terminal. In other cases, where the printer uses DHCP, IP Address determination will have to be more sophisticated.

Wireless networks require an “ESSID” parameter and, possibly, an encryption key. For security, these parameters are not included in the printer’s PID and will need to be configured via other means.

#### C.3.2 “Extended 4-Character Peripheral Identifiers” for Bluetooth connectivity

In order to accommodate additional parameters, the basic PID is extended as follows.

	BA12:<parameter 1>|<parameter 2>

The first additional parameter (Channel Number) is prefixed by a ‘colon’ character (3A hex) and the second additional parameter (Bluetooth Address) is prefixed by a ‘bar’ character (7C hex). If parameter 1 is omitted, the driver will assume a ‘default’ value of “1”.

The method by which the PID is passed to the driver, is given in Annex A.

The following example shows an “Extended 4-character” PID for a “Bluetooth”
connection.

	BT12:1|0001CC402A51

This defines a Toshiba-TEC “SP2” printer, with Channel Number “1” and Bluetooth
Address ”00:01:CC:40:2A:51”.

Because the total number of characters in the PID would produce a very long barcode, the information is split into two barcodes, using ‘Code 128’ symbology:

<img src="http://rhodocs.s3.amazonaws.com/moto-adaptive-printer-driver/APD-Printer-ID-code-128-2.jpg" alt="APD-Printer-ID-code-128-2.jpg" />

The first barcode contains “BT12:1” and the second contains “0001CC402A51”. The latter has the ‘colons’ removed to produce a more compact barcode. However, the
‘human readable’ characters under the second barcode retain the original form, as this is more recognisable as a Bluetooth address to most users.

Notes:
When passing the PID to the driver using the “Set Printer” command (command
0105), the following forms of PID are acceptable:

	BA12:1|00:01:CC:40:2A:51   Channel = 1   Address includes ‘colons’
	BA12:2|0001CC402A51        Channel = 2   Address without ‘colons’
	BA12|0001CC402A51          Channel set to default value of 1

Bluetooth connectivity is, currently, only supported by using the Compact Flash Bluetooth Card manufactured by Socket Communications Inc. See Annex D for further information. Other Bluetooth connectivity hardware may be supported by future releases of the APD, but this will not affect the printer’s PID.

In some Bluetooth networks, an authentication number (PIN) and/or encryption key are required. For security, these parameters are not included in the printer’s PID and will need to be configured via other means. See Annex D for further details.

#### C.3.3 “Extended 4-Character Peripheral Identifiers” for Wired connectivity

Not yet implemented: Details to follow.

Wired connections currently use a 5- or 7-character Peripheral Identifier.

Motorola, Moto, Zebra Technologies and the Stylized M Logo are trademarks or registered trademarks of Zebra Trademark Holdings, LLC and are used under license. All other trademarks are the property of their respective owners.

©2011 Zebra Technologies, Inc. All Rights Reserved.


