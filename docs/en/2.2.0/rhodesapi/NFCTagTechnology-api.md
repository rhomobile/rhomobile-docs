# NFCTagTechnology Class API

Use the NFCTagTechnology to connect to NFC tags and to determine their type. 

**NOTE: As of Rhodes version 3.3.3, the [Barcode](barcode-api), [NFC](../rhodes/device-caps#nfc), and [Signature Capture](../rhodes/device-caps#signature-capture) APIs, as well as [Rhom data encryption](../rhodes/rhom#database-encryption) are removed from Rhodes. These features are only supported in Zebra RhoMobile Suite. If you wish to use these features, you will need to [upgrade to RhoMobile Suite](../rhomobile-install). Your application's build.yml will also need to be modified to [indicate the application type is 'Rhoelements'](../rhoelements/rhoelements2-native#enabling-motorola-device-capabilities). Additionally, a [RhoElements license](../rhoelements/licensing) is required.**

## Enabling NFC

To use the NFC methods, you need to enable NFC on the Android device and ensure that the version is 2.3.3 or later. Do this by adding that capability to the build.yml file:

	:::yaml
	android: 
	  version 2.3.3
	  extensions:
	  - nfc

## Properties

The NFCTagTechnology class has several properties to determine the type of the NFC tag.

	ISODEP = 'IsoDep'
	MIFARE_CLASSIC = 'MifareClassic'
	MIFARE_ULTRALIGHT = 'MifareUltralight'
	NDEF = 'Ndef'
	NDEF_FORMATABLE = 'NdefFormatable'
	NFCA = 'NfcA'
	NFCB = 'NfcB'
	NFCF = 'NfcF'
	NFCV = 'NfcV'

## get_name

Returns string - the name of the NFC tag.

	:::ruby
	Rho::NFCTagTechnology.get_name

## connect

Connects to an NFC tag.

## close

Closes a connection with an NFC tag.

	:::ruby
	Rho::NFCTagTechnology.close

## is_connected

Returns true if the application is connected with an NFC tag, false otherwise.

	:::ruby
	Rho::NFCTagTechnology.is_connected
