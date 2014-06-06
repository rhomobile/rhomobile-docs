<!-- Launchpad Link id: profilebarcode
	usage <a data-link="id">blah blah</a>
	replace id
-->
<div class="tableofcontents"> </div>
## Overview
In order to get Barcode or MSR data in your application, you must create a profile that has both an Input feature and an Output feature:

* <a data-link="profilebarcode">Barcode</a> / <a data-link="profilemsr">MSR</a> (Input)
* <a data-link="profilekeystroke">Intent</a> or Keystroke (Output)

The `Barcode` feature in the Profile Manager is responsible for reading data from the device's integrated bar code scanner and supports different types of bar code readers including laser, imager and internal camera. It also contains detailed settings for scanner behavior as well as individual barcode symbology settings.

The `Intent` or `Keystroke` feature in the Profile Manager is used to define how the output from the Barcode scanner should be handled

* Intent - The Intent feature, in the Profile Manager, collects and sends data received from the Barcode scanner to your application using the Android Intent mechanism. To use this, you should be familiar with how to register to receive intents in your application as well as handling the data that is passed in. You will have the ability to configure how the intent is sent to your application in the profile itself.

* Keystroke - The Keystroke feature, in the Profile Manager, collects and sends data received from the Barcode scanner to your application by emulating keystrokes. You will have the option to control how the data is sent as well as if it should have any prefix or suffix automatically added using basic data formatting.

## Keystroke Output
Use to configure the Keystroke Output Feature for the profile.

* Enabled - Enables or disables this feature. 
* Action key character - Enabled decoding a special characters embedded within a bar code or MSR data.
	* None - Action key character feature is disabled (default).
	* Tab - Tab character (\t) in a bar code is processed.
	* Line feed - Line feed character (\t) in a bar code is processed.
	* Carriage return - Carriage return character (\t) in a bar code is processed.
* Basic data formatting - Allows the configuration of any data formatting. When disabled, any data is passed on without modification.
	* Enabled - Enables or disables Basic Data Formatting. 
	* Prefix to data - Add characters to the beginning of the data when sent.
	* Suffix to data - Add characters to the end of the data when sent.
	* Send data - Set to transfer the captured data to the foreground application. Disabling this option prevents the actual data from being transmitted. However, the prefix and suffix strings, if present, are still transmitted even when this option is disabled (default - enabled).
	* Send as hex - Set to send the data in hexadecimal format. 
	* Send TAB key - Set to append a tab character to the end of the processed data. 
	* Send ENTER key - Set to append an Enter character to the end of the processed data. 

