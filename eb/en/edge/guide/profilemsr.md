<!-- Launchpad Link id: profilemsr
	usage <a data-link="id">blah blah</a>
	replace id
-->
<div class="tableofcontents"> </div>
## Overview
In order to get MagStripe (MSR) data in your application, you must create a profile with two profile features selected:

* MSR
* Intent or Keystroke

The `MSR` feature in the Profile Manager is responsible for reading data from the device's integrated mag-stripe reader (if one such exists).

The `Intent` or `Keystroke` feature in the Profile Manager is used to define how the output from the Barcode scanner should be handled.

* Intent - The Intent feature, in the Profile Manager, collects and sends data received from the Barcode scanner to your application using the Android Intent mechanism. To use this, you should be familiar with how to register to receive intents in your application as well as handling the data that is passed in. You will have the ability to configure how the intent is sent to your application in the profile itself.

* Keystroke - The Keystroke feature, in the Profile Manager, collects and sends data received from the Barcode scanner to your application by emulating keystrokes. You will have the option to control how the data is sent as well as if it should have any prefix or suffix automatically added using basic data formatting.

## MSR Settings Reference

### Enabled
Enables or disables this feature. Default is disabled.

## Output Data
In order for your application to receive the barcode data, you must specify one or more Output features. Please  refer to their reference documentation for more information.

* <a data-link="profileintent">Intent</a> 
* <a data-link="profilekeystroke">Keystroke</a>
