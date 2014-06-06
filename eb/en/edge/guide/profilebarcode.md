<!-- Launchpad Link id: profilebarcode
	usage <a data-link="id">blah blah</a>
	replace id
-->
<div class="tableofcontents"> </div>
## Overview
In order to get Barcode data in your application, you must create a profile with two profile features selected:

* Barcode
* Intent or Keystroke

The `Barcode` feature in the Profile Manager is responsible for reading data from the device's integrated bar code scanner and supports different types of bar code readers including laser, imager and internal camera. It also contains detailed settings for scanner behavior as well as individual barcode symbology settings.

The `Intent` or `Keystroke` feature in the Profile Manager is used to define how the output from the Barcode scanner should be handled.

* Intent - The Intent feature, in the Profile Manager, collects and sends data received from the Barcode scanner to your application using the Android Intent mechanism. To use this, you should be familiar with how to register to receive intents in your application as well as handling the data that is passed in. You will have the ability to configure how the intent is sent to your application in the profile itself.

* Keystroke - The Keystroke feature, in the Profile Manager, collects and sends data received from the Barcode scanner to your application by emulating keystrokes. You will have the option to control how the data is sent as well as if it should have any prefix or suffix automatically added using basic data formatting.

## Barcode Settings Reference

### Enabled
Enables or disables this feature. Default is enabled.

### Scanner Selection
Configures which scanning device to use for data capture.

* Auto - Automatically determines the best scanning device. If a Scan Module or Scan/MSR Module is installed on the MC40, then the 2D imager is selected. Otherwise the camera is selected.
* Camera Scanner - Scanning is performed with the rear-facing camera.
* 2D Imager - Scanning is performed using the installed Scan or Scan/MSR module.

### Decoders
Configures which bar code decoders are enabled or disabled. For best performance disable all unnecessary decoders. By default the most commonly used decoders are enabled (shown below with an asterisk). The supported decoders are:

* Australian Postal 
* Canadian Postal
* Chinese 2 of 5 
* Codabar*
* Code 11
* Code 39*
* Code 93 
* Code 128* 
* Composite AB
* Composite C 
* Datamatrix* 
* Discrete 2 of 5 
* Dutch Postal MSI
* EAN-8*
* EAN-13*
* GS1 DataBar* 
* GS1 DataBar Expanded*
* GS1 DataBar Limited 
* Japanese Postal 
* Korean 3 of 5
* Interleaved 2 of 5
* Matrix 2 of 5 
* Maxicode*
* MicroPDF
* MicroQR Aztec*
* PDF417*
* QR Code* 
* TLC 39
* Trioptic 39
* UK Postal
* UPC-A*
* UPC-E0* 
* UPC-E1
* US4state FICS 
* USPostnet 
* USPlanet
* Webcode

### UPCA
* Report Check Digit - The check digit is the last character of the symbol used to verify the integrity of the data. Enables or disables this option. 
* Preamble - Preamble characters are part of the UPC symbol consisting of Country Code and System Character. There are three options for transmitting a UPCA preamble:
	* Preamble None - Transmit no preamble.
	* Preamble Sys Char - Transmit System Character only (default).
	* Preamble Country and Sys Char - Transmit System Character and Country Code (“0” for USA). Select the appropriate option to match the host system.

### UPCE0
* Report Check Digit - The check digit is the last character of the symbol used to verify the integrity of the data. Enables or disables this option. 
* Preamble - Preamble characters are part of the UPC symbol consisting of Country Code and System Character. There are three options for transmitting a UPCE0 preamble:
	* Preamble Sys Char - Transmit System Character only.
	* Preamble Country and Sys Char - Transmit System Character and Country Code (“0” for USA).
	* Preamble None - Transmit no preamble (default). Select the appropriate option to match the host system.
* Convert UPCE0 To UPCA - Enable to convert UPCE0 (zero suppressed) decoded data to UPC-A format before transmission. After conversion, the data follows UPC-A format and is affected by UPC-A programming selections. Disable to transmit UPCE0 decoded data as UPCE0 data, without conversion (default - disabled).

### Code128
* Length1 - Use to set decode lengths (default - 0).
* Length2 - Use to set decode lengths (default - 55).
* Redundancy - Sets the reader to read the bar code twice before accepting data. 
* Enable Plain Code 128 - Flag to enable other 128 sub types (besides GS1-128 and ISBT-128).
* Enable GS1-128 - Set the GS1 128 subtype. 
* Enable ISBT128 - Set the ISBT128 subtype. 
* ISBT128 Concatenation Mode - Select an option for concatenating pairs of ISBT code types:
	* Concat Mode Never - Do not concatenate pairs of ISBT codes encountered (default).
	* Concat Mode Always - There must be two ISBT codes in order to decode and perform concatenation. Does not decode single ISBT symbols.
	* Concat Mode Auto - Decodes and concatenates pairs of ISBT codes immediately. If only a single ISBT symbol is present, the device must decode the symbol the number of times set via Redundancy - Code128 before transmitting its data to confirm that there is no additional ISBT symbol.
* Check ISBT Table - The ISBT specification includes a table that lists several types of ISBT bar codes that are commonly used in pairs. If ISBT128 Concat Mode is set, enable Check ISBT Table to concatenate only those pairs found in this table. Other types of ISBT codes are not concatenated. 
* Security Level - The scanner offers four levels of decode security for Code 128 bar codes. Select increasing levels of security for decreasing levels of bar code quality. There is an inverse relationship between security and scanner aggressiveness, so choose only that level of security necessary for any given application.
	* Security Level 0 - This setting allows the scanner to operate in its most aggressive state, while providing sufficient security in decoding most “in-spec” bar codes.
	* Security Level 1 - This setting eliminates most misdecodes.
	* Security Level 2 - Select this option if Security level 1 fails to eliminate misdecodes.
	* Security Level 3 - If Security Level 2 is selected and misdecodes still occur, select this security level. Be advised, selecting this option is an extreme measure against mis-decoding severely out of spec bar codes. Selecting this level of security significantly impairs the decoding ability of the scanner. If this level of security is needed, try to improve the quality of the bar codes.

### Code39
* Length1 - Use to set decode lengths. 
* Length2 - Use to set decode lengths 4.
* Verify Check Digit - Enable this feature to check the integrity of all Code 39 symbols to verify that the data complies with a specified check digit algorithm. The digital scanner decodes only those Code 39 symbols that include a modulo 43 check digit. Enable this feature only if the Code 39 symbols contain a modulo 43 check digit (default - disabled).
* Report Check Digit - Transmit Code 39 data with or without the check digit. 
* Full ASCII - Code 39 Full ASCII is a variant of Code 39 that pairs characters to encode the full ASCII character set. To enable or disable Code 39 Full ASCII,
* Redundancy - Sets the reader to read the bar code twice before accepting data. 
* Convert Code39 To Code32 - Code 32 is a variant of Code 39 used by the Italian pharmaceutical industry. Scan the appropriate bar code below to enable or disable converting Code 39 to Code 32.
* Report Code32 Prefix - Scan the appropriate bar code to enable or disable adding the prefix character “A” to all Code 32 bar codes.
* Security Level - Options: Security level 0, Security Level 1, Security Level 2 and Security Level 3.

### Interleaved 2of5
* Length1 - Use to set decode lengths.
* Length2 - Use to set decode lengths.
* Redundancy - Sets the reader to read the bar code twice before accepting data. 
* Check Digit
	* No Check Digit - A check digit is not used. 
	* USS Check Digit - Select to check the integrity of all Interleaved 2 of 5 symbols to verify the data complies with either the Uniform Symbology Specification (USS) check digit algorithm.
	* OPCC Check Digit - Select to check the integrity of all Interleaved 2 of 5 symbols to verify the data complies with either the Optical Product Code Council (OPCC) check digit algorithm.
* Report Check Digit - Transmit Interleaved 2 of 5 data with or without the check digit. 
* Convert ITF-14 To EAN13 - Convert 14-character Interleaved 2 of 5 bar codes to EAN-13, and transmit as EAN-13. The Interleaved 2 of 5 bar code must be enabled and must have a leading zero and a valid EAN-13 check digit. 

### Composite AB
* UCC Link Mode
	* Link Flag ignored - 1D component is transmitted regardless of whether a 2D component is detected.
	* Always Linked - 1D and the 2D components are transmitted. If 2D is not present, the 1D component is not transmitted.
	* Auto Discriminate - the digital scanner determines if there is a 2D portion, then transmits the 1D component, as well as the 2D portion if present. (default).

### UK Postal
* Report Check Digit - Transmit UK Postal data with or without the check digit. 

### Codabar
* Length1 - Use to set decode lengths.
* Length2 - Use to set decode lengths.
* Redundancy - Sets the reader to read the bar code twice before accepting data. 
* CLSI Editing - Enable this parameter to strip the start and stop characters and insert a space after the first, fifth, and tenth characters of a 14-character Codabar symbol. Enable this feature if the host system requires this data format.
* NOTIS Editing - Enable this parameter to strip the start and stop characters from a decoded Codabar symbol. Enable this feature if the host system requires this data format.
* MSI
* Length 1 - Use to set decode lengths.
* Length 2 - Use to set decode lengths.
* Redundancy - Sets the reader to read the bar code twice before accepting data. 
* Check Digit - With MSI symbols, one check digit is mandatory and always verified by the reader. The second check digit is optional.
	* One Check Digit - Verify one check digit.
	* Two Check Digits - Verify two check digits.
* Check Digit Scheme - Two algorithms are possible for the verification of the second MSI check digit.
Select the algorithm used to encode the check digit.
	* Mod-11-10 - First check digit is MOD 11 and second check digit is MOD 10.
	* Mod-10-10 - Both check digits are MOD 10.
* Report Check Digit - Transmit MSI data with or without the check digit. 

### Code93
* Length1 - Use to set decode lengths.
* Length2 - Use to set decode lengths.
* Redundancy - Sets the reader to read the bar code twice before accepting data. 
* Discrete 2 of 5
* Length1 - Use to set decode lengths.
* Length2 - Use to set decode lengths.
* Redundancy - Sets the reader to read the bar code twice before accepting data. 

### Code11
* Length1 - Use to set decode lengths.
* Length2 - Use to set decode lengths.
* Redundancy - Sets the reader to read the bar code twice before accepting data. 
* Verify Check Digit - Check the integrity of all Code 11 symbols to verify that the data complies with the specified check digit algorithm. This selects the check digit mechanism for the decoded Code 11 bar code.
	* No Check Digit - Do not verify check digit.
	* 1 Check Digit - Bar code contains one check digit.
	* 2 Check Digits - bar code contains two check digits.
* Report Check DIgit - Transmit Code 11 data with or without the check digit. 

### Webcode
* Webcode Subtype - Enables the decoding of the GT Webcode subtype. 
* Matrix 2 of 5
* Length1 - Use to set decode lengths.
* Length2 - Use to set decode lengths.
* Redundancy - Sets the reader to read the bar code twice before accepting data. 
* Report Check Digit - Transmit Matrix 2 of 5 data with or without the check digit. 
* Verify Check Digit - Enable this feature to check the integrity of all Matrix 2 of 5 symbols to verify that the data complies with a specified check digit algorithm.

### UPCE1
* Report Check Digit - The check digit is the last character of the symbol used to verify the integrity of the data. Enables or disables this option. 
* Preamble - Preamble characters are part of the UPC symbol consisting of Country Code and System Character. There are three options for transmitting a UPCE1 preamble:
	* Preamble Sys Char - Transmit System Character only.
	* Preamble Country and Sys Char - Transmit System Character and Country Code (“0” for USA).
	* Preamble None - Transmit no preamble (default). Select the appropriate option to match the host system.
* Convert UPCE1 To UPCA - Enable this to convert UPCE1 decoded data to UPC-A format before transmission. After conversion, the data follows UPC-A format and is affected by UPC-A programming selections. Disable this to transmit UPCE1 decoded data as UPCE1 data, without conversion.

### Decode Lengths
The allowable decode lengths are specified by options Length1 and Length2 as follows: 

* Variable length: Decode symbols containing any number of characters.
	* Set both Length1 and Length2 to 0.
* Range: Decode a symbol with a specific length range (from a to b, including a and b).
	* Set Length1 to a and set Length2 to b.
* Two Discrete Lengths: Decode only symbols containing either of two selected lengths.
	* Set either Length1 or Length2 to the specific lengths.
* One Discrete Length: Decode only symbols containing a specific length.
	* Set both Length1 and Length2 to the specific length.

### UPC EAN Params
Allows the configuration of the parameters that apply to more than one UPC or EAN decoder.

* Security Level - The scanner offers four levels of decode security for UPC/EAN bar codes. Select higher security levels for lower quality bar codes. There is an inverse relationship between security and decode speed, so be sure to choose only that level of security necessary for the application.
	* Level 0 - This default setting allows the scanner to operate fastest, while providing sufficient security in decoding “in-spec” UPC/EAN bar codes.
	* Level 1 - As bar code quality levels diminish, certain characters become prone to misdecodes before others (i.e., 1, 2, 7, 8). If the scanner is misdecoding poorly printed bar codes, and the misdecodes are limited to these characters, select this security level.
	* Level 2 - If the scanner is misdecoding poorly printed bar codes, and the misdecodes are not limited to characters 1, 2, 7, and 8, select this security level.
	* Level 3 - If the scanner is still misdecoding, select this security level. Be advised, selecting this option is an extreme measure against misdecoding severely out of spec bar codes. Selecting this level of security can significantly impair the decoding ability of the scanner. If this level of security is necessary, try to improve the quality of the bar codes.
* Supplemental2 - Enables or disables this option. 
* Supplemental5 - Enables or disables this option. 
* Supplemental Mode
	* No Supplementals - the scanner is presented with a UPC/EAN plus supplemental symbol, the
	scanner decodes UPC/EAN and ignores the supplemental characters.
	* Supplemental Always - the scanner only decodes UPC/EAN symbols with supplemental characters, and ignores symbols without supplementals.
	* Supplements Auto - the scanner decodes UPC/EAN symbols with supplemental characters immediately. If the symbol does not have a supplemental, the scanner must decode the bar code the number of times set via UPC/EAN Supplemental Redundancy before transmitting its data to confirm that there is no supplemental.
	* Supplemental Smart - Enables smart supplementals. In this mode the decoder returns the decoded value of the main block right away if it does not belong to one of the following supplemental types: 378, 379, 977, 978, 979, 414, 419, 434 or 439. If the bar code starts with one of the prefixes it searches the image more aggressively for a supplemental. Tries to scan the supplemental if it is present. If the supplemental scanning failed, then the main bar code is returned.
	* Supplemental 378-379 - Enables (auto-discriminate) supplemental for UPC/EAN codes starting with 378 or 379. Disables reading of supplementals for any other UPC/EAN bar code not starting with 378 or 379. Tries to scan the supplemental if it is present. If the supplemental scanning failed, then the main bar code is returned.
	* Supplemental 978-979 - Enables (auto-discriminate) supplemental for UPC/EAN codes starting with 978 or 979. Disables reading of supplementals for another UPC/EAN bar code not starting with 978 or 979. Tries to scan the supplemental if it is present. If the supplemental scanning failed, then the main barcode is returned.
	* Supplemental 414-419-434-439 - Enables (auto-discriminate) supplemental for UPC/EAN codes starting with 414, 419, 434 or 439. Disables reading of supplementals for another UPC/EAN bar code not starting with 414, 419, 434 or 439. Tries to scan the supplemental if it is present. If the supplemental scanning failed, then the main bar code is returned.
	* Supplemental 977 - Enables (auto-discriminate) supplemental for UPC/EAN codes starting with 977. Disables reading of supplementals for another UPC/EAN barcode not starting with 977. Tries to scan the supplemental if it is present. If the supplemental scanning failed, then the main bar code is returned.
* Retry Count - Retry count for auto-discriminating for supplementals. Possible values are 2 to 20 inclusive. Note that this flag is only considered if Supplemental Mode - UPC EAN is set to one of the following values: Supplementals Auto, Supplementals Smart, Supplementals 378-379, Supplementals 978-979, Supplementals 977 or Supplementals 414-419-434-439 (2 to 20).
* Bookland - Enable or disable this option. 
* Coupon - Enables Coupon code decoding. Note that in order to successfully decode Coupon codes, all
of the correct decoders must be enabled. 
* Convert DataBar To UPC EAN - If this is set it converts DataBar bar codes to UPC/EAN format. For this setting to work UPC/EAN symbologies must be enabled. 

### Reader Params
Allows the configuration of parameters specific to the selected bar code reader.

* Beam Timer - Sets the maximum amount of time that the reader remains on (0 - 60,000 ms in increments of 100 ms). A value of 0 sets the reader to stay on indefinitely.
* Linear Security Level - Sets the number of times a bar code is read to confirm an accurate decode.
	* Security Redundancy and Length - Two times read redundancy based on redundancy flags and
	code length.
	* Security Short or Codabar - Two times read redundancy if short bar code or Codabar.
	* Security All Twice - Two times read redundancy for all bar codes.
	* Security Long and Short - Two times read redundancy for long bar codes, three times for short bar codes.
	* Security All Thrice - Three times read redundancy for all bar codes.
* Picklist - Allows the imager to decode only the bar code that is directly under the cross-hair/reticle (+) part of the pattern. This feature is useful in applications where multiple bar codes may appear in the field of view during a decode session and only one of them is targeted for decode.
	* Disable – Disables Picklist mode. Any bar code within the field of view can be decoded.
	* Centered - Enables the Picklist mode so that only the bar code in the center of the image is decoded. This is most useful when used in conjunction with the static and dynamic reticle viewfinder modes. Note: This mode is only valid for decoder modules that supports a viewfinder. If one tries to set this for a unsupported decoder then the device would issue an error. (Camera scanner only).
	* Reticle - Enables the Picklist mode so that only the bar code that is directly under the cross-hair (reticle) is decoded. This is useful when used in conjunction with the static and dynamic reticle viewfinder modes. (Scan Module Only)
* LCD Mode - Enables or disables LCD mode. LCD mode enhances the ability of the imager to read bar codes from LCD displays such as cellphones (Scan Module Only).
	* Disable - Disables the LCD mode. 
	* Enable - Enables LCD mode.

	NOTE When using the LCD mode, a degradation in performance may be observed and the aiming crosshair may blink until the bar code is decoded.

* Inverse 1D Mode - This parameter allows the user to select decoding on inverse 1D bar codes.
	* Disable - Disables decoding of inverse 1D bar codes.
	* Enable - Enables decoding of only inverse 1D bar codes.
	* Auto - Allows decoding of both positive and inverse 1D bar codes.
* Viewfinder Mode - Configures the Viewfinder modes supported for camera scanning.
	* Viewfinder Enabled - Enables only the viewfinder.
	* Static Reticle - Enables the viewfinder and a red reticle in the center of the screen which helps selecting the bar code.

### Scan Params
Allows the configuration of Code Id and decode feedback options.

* Code ID Type - A Code ID character identifies the code type of a scanned bar code. This is useful when the reader is decoding more than one code type. Select a code ID character to insert between the prefix and the decoded symbol.
	* Code ID Type None - No prefix (default).
	* Code ID Type Aim - A standards based three character prefix.
	* Code ID Type Symbol - A Symbol defined single character prefix.
	
	NOTE Not all ringtones are fully supported as decode tones. Ringtones of longer length may be truncated when used as a decode tone. The recommendation is to test the selected tone for operation before deployment to a customer site.

* Decode Audio Feedback - Select an audio tone to sound upon a good decode.
* Decode Haptic Feedback - Enable the MC40 to vibrate upon a good decode.

## Output Data
In order for your application to receive the barcode data, you must specify one or more Output features. Please  refer to their reference documentation for more information.

* <a data-link="profileintent">Intent</a> 
* <a data-link="profilekeystroke">Keystroke</a>
