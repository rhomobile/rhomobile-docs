# NdefMessage API

Convert an NdefMessage into a format from which you can extract data. For code examples, see [Rhodes Webinar Sample: NFC](https://github.com/rhomobile/webinar-samples/blob/master/nfc-rhodes/app/Nfc/nfc_controller.rb) and [Rhodes System API Samples: NFC](https://github.com/rhomobile/rhodes-system-api-samples/blob/master/app/Nfc/controller.rb).

## Enabling NFC

To use the NFC methods, you need to enable NFC on the Android device and ensure that the version is 2.3.3 or later. Do this by adding that capability to the build.yml file:

	:::yaml
	android: 
	  version 2.3.3
	  extensions:
	  - nfc

## get_byte_array

Returns a byte array containing the NdefMessage.

	:::ruby
	Rho::NdefMessage.get_byte_array

## get_records

Returns NdefRecord[], an array containing the records in an NdefMessage. [Click here for an example in the Rhodes Developer Gude under NFC.](../rhodes/nfc#reading-an-nfc-tag)

	:::ruby
	Rho::NdefMessage.get_records