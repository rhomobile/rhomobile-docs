# Zebra Adaptive Printer Driver - Print Type Codes

The Zebra Adaptive Printer Driver (APD) provides a simple, yet powerful, interface between your applications and virtually any portable printer.

## Overview

By means of simple commands that are independent of printer type and connection, the host application can print labels, receipts, or tags, without knowledge of the command language used by the printer, or the way the printer is linked to the hand- held terminal. Thus, printer types can be mixed, or a new type can be added – with the host sending the information in the same simple, ‘unified’ form.

The ‘key’ to the Adaptive Printer Driver is the “Printer ID” (PID) that identifies the type of printer, its command language, means of connection and other parameters, such as IP Address. Normally, the “Printer ID” is displayed in bar-coded form on a small label on the printer so that the user can transfer all the required parameters to the Zebra terminal, simply by scanning this label.

An example of the PID for a printer for use in a Wireless Local Area Network is shown below.

<img src="http://rhodocs.s3.amazonaws.com/moto-adaptive-printer-driver/APD-Printer-ID-1.jpg" alt="APD-Printer-ID-1.jpg" />

In this case, two barcodes, using “Code 128” symbology, are used to define the full PID.

The printer type is identified by characters 2, 3 and 4 in the upper barcode: in this example “C53”, which indicates a Zebra QL320 printer.

The first character “W” identifies the connection type as “Wireless Local Area Network” and “6101” indicates the TCP Port Number for this printer, preceded by a colon.

The IP address is encoded as 157235010002 to make the barcode more compact, but the APD will also accept the form containing ‘dots’. An address of “0.0.0.0” indicates that the printer uses a dynamically assigned address issued by a DHCP server.

The second example, below, is also based on the Zebra QL320 printer, but uses “Bluetooth” connectivity, which is indicated by the leading “B”.

<img src="http://rhodocs.s3.amazonaws.com/moto-adaptive-printer-driver/APD-Printer-ID-2.jpg" alt="APD-Printer-ID-2.jpg" />

“:1” indicates that the Bluetooth Channel Number is “1”.

The Bluetooth address, in the second barcode, is encoded as “0080371ABD79” to minimise the size of the barcode, but the APD will also accept the address with or without the ‘colons’.

<table border="1">
	<tr>
		<th>Type Code</th>
		<th>Printer</th>
	</tr>
	<tr>
		<td>A</td>
		<td>Printers using “Escape P” or similar command set</td>
	</tr>
	<tr>
		<td>A10</td>
		<td>Citizen CMP-10</td>
	</tr>
	<tr>
		<td>A12</td>
		<td>Brother MW-120</td>
	</tr>
	<tr>
		<td>A22</td>
		<td>Citizen PD-22</td>
	</tr>
	<tr>
		<td>B</td>
		<td>Not assigned yet</td>
	</tr>
	<tr>
		<td>A</td>
		<td>Printers using “Escape P” or similar command set</td>
	</tr>
	<tr>
		<td>C</td>
		<td>Printers using “CPCL” command language</td>
	</tr>
	<tr>
		<td>C12</td>
		<td>Zebra Cameo 2</td>
	</tr>
	<tr>
		<td>C13</td>
		<td>Zebra Cameo 3</td>
	</tr>
	<tr>
		<td>C22</td>
		<td>Zebra Cameo 2 with card reader</td>
	</tr>
	<tr>
		<td>C23</td>
		<td>Zebra Cameo 3 with card reader</td>
	</tr>
	<tr>
		<td>C32</td>
		<td>Zebra Encore 2</td>
	</tr>
	<tr>
		<td>C33</td>
		<td>Zebra Encore 3</td>
	</tr>
	<tr>
		<td>C34</td>
		<td>Zebra Encore 4</td>
	</tr>
	<tr>
		<td>C44</td>
		<td>Zebra Encore 4 with linerless option</td>
	</tr>
	<tr>
		<td>C52</td>
		<td>Zebra QL220</td>
	</tr>
	<tr>
		<td>C53</td>
		<td>Zebra QL320</td>
	</tr>
	<tr>
		<td>C54</td>
		<td>Zebra QL420</td>
	</tr>
	<tr>
		<td>C64</td>
		<td>Zebra RW420</td>
	</tr>
	<tr>
		<td>D</td>
		<td>“Cognitive” printers; Individual codes not yet assigned</td>
	</tr>
	<tr>
		<td>E</td>
		<td>Printers using “EPL” command language</td>
	</tr>
	<tr>
		<td>E10</td>
		<td>Zebra TR220; Also sold as Zebra PGP1000</td>
	</tr>
	<tr>
		<td>F</td>
		<td>Not assigned yet</td>
	</tr>
	<tr>
		<td>G</td>
		<td>Not assigned yet</td>
	</tr>
	<tr>
		<td>H</td>
		<td>Not assigned yet</td>
	</tr>
	<tr>
		<td>I</td>
		<td>Only to be used for test purposes (“I” can be confused with “1”)</td>
	</tr>
	<tr>
		<td>J</td>
		<td>Not assigned yet</td>
	</tr>
		<tr>
		<td>K</td>
		<td>Not assigned yet</td>
	</tr>
		<tr>
		<td>L</td>
		<td>Not assigned yet</td>
	</tr>
	<tr>
		<td>M</td>
		<td>Printers using “MPCL” command language</td>
	</tr>
	<tr>
		<td>M60</td>
		<td>Paxar 9460</td>
	</tr>
	<tr>
		<td>M60</td>
		<td>Paxar 9460; Direct thermal</td>
	</tr>
	<tr>
		<td>M60</td>
		<td>Paxar 9460; Thermal transfer</td>
	</tr>
	<tr>
		<td>N</td>
		<td>“O’Neil” printers</td>
	</tr>
	<tr>
		<td>N21</td>
		<td>MicroFlash 2T</td>
	</tr>
	<tr>
		<td>N41</td>
		<td>MicroFlash 4T</td>
	</tr>
	<tr>
		<td>O</td>
		<td>Not to be used (“O” can be confused with “0”)</td>
	</tr>
	<tr>
		<td>P</td>
		<td>“Printronix” printers; Individual codes not yet assigned</td>
	</tr>
	<tr>
		<td>Q</td>
		<td>Not assigned yet</td>
	</tr>
	<tr>
		<td>R</td>
		<td>Printers using “RCL” command language</td>
	</tr>
	<tr>
		<td>R50</td>
		<td>Paxar (Monarch) 9450; “Rascal” printer</td>
	</tr>
	<tr>
		<td>R60</td>
		<td>Paxar 9460 with ‘RCL’ option (MPCL is the standard language)</td>
	</tr>
	<tr>
		<td>S</td>
		<td>“Sato” printers</td>
	</tr>
	<tr>
		<td>S40</td>
		<td>Sato MB400</td>
	</tr>
	<tr>
		<td>T</td>
		<td>Printers using “TEC” command language. See Note 1, below.</td>
	</tr>
	<tr>
		<td>T12</td>
		<td>Toshiba-TEC SP2</td>
	</tr>
	<tr>
		<td>T21</td>
		<td>Toshiba-TEC B-211</td>
	</tr>
	<tr>
		<td>T41</td>
		<td>Toshiba-TEC B-415</td>
	</tr>
	<tr>
		<td>Uxx</td>
		<td>User defined printer types</td>
	</tr>
	<tr>
		<td>U01 – U99</td>
		<td>Free choice</td>
	</tr>
	<tr>
		<td>V</td>
		<td>Not assigned yet</td>
	</tr>
	<tr>
		<td>W</td>
		<td>Not assigned yet</td>
	</tr>
	<tr>
		<td>W</td>
		<td>Not assigned yet</td>
	</tr>
	<tr>
		<td>X</td>
		<td>“Extech” printers; Individual codes not yet assigned</td>
	</tr>
	<tr>
		<td>Y</td>
		<td>“Motorola” printers; Individual codes not yet assigned</td>
	</tr>
	<tr>
		<td>Z</td>
		<td>Printers using “ZPL” command language</td>
	</tr>
	<tr>
		<td>Z40</td>
		<td>Zebra PA400 Direct thermal</td>
	</tr>
	<tr>
		<td>Z41</td>
		<td>Zebra PT400 Thermal transfer</td>
	</tr>
	<tr>
		<td>Z43</td>
		<td>Zebra PA403 Direct thermal</td>
	</tr>
	<tr>
		<td>Z44</td>
		<td>Zebra PT403 Thermal transfer</td>
	</tr>
	<tr>
		<td>Z64</td>
		<td>Zebra RW420 Version with ZPL emulation</td>
	</tr>
</table>

Note 1: The APD will also accept the 5 digit ‘ID’ used by Toshiba-TEC printers. When this is entered, the APD will convert the 5 digit number to a 4 character hexadecimal code and assume “T” as the type code. This identifies the command language to be used, allowing data to be printed correctly. However, it does not allow the APD to determine the exact model of printer, so care needs to be taken in the naming of template and format files for these printers.

Motorola, Moto, Zebra Technologies and the Stylized M Logo are trademarks or registered trademarks of Zebra Trademark Holdings, LLC and are used under license. All other trademarks are the property of their respective owners. ©2011 Zebra Technologies, Inc. All Rights Reserved.