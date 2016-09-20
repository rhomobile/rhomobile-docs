# NdefRecord API

Get data from near field communications Ndef tag records. For code examples, see [Rhodes Webinar Sample: NFC](https://github.com/rhomobile/webinar-samples/blob/master/nfc-rhodes/app/Nfc/nfc_controller.rb) and [Rhodes System API Samples: NFC](https://github.com/rhomobile/rhodes-system-api-samples/blob/master/app/Nfc/controller.rb).

## Enabling NFC

To use the NFC methods, you need to enable NFC on the Android device and ensure that the version is 2.3.3 or later. Do this by adding that capability to the build.yml file:

	:::yaml
	android: 
	  version 2.3.3
	  extensions:
	  - nfc

## NFC Record Hash

An Ndef record consists of a hash.

	:::ruby
	ID = 'id'
	TNF = 'tnf'
	TYPE = 'type'
	PAYLOAD = 'payload'


The Type Name Format (TNF part of the hash) is a 3-bit field that indicates how you interprete the type field (TYPE). Here is a list of the TNF values.

	:::ruby
	TNF_ABSOLUTE_URI = 3
	TNF_EMPTY = 0
	TNF_EXTERNAL_TYPE = 4
	TNF_MIME_MEDIA = 2
	TNF_UNCHANGED = 6
	TNF_UNKNOWN = 5
	TNF_WELL_KNOWN = 1

The RTD text type (TYPE part of the hash) is used with the TNF_WELL_KNOWN value.

	:::ruby
	RTD_TEXT = [0x54]   # "T"
	RTD_URI = [0x55] # "U"
	RTD_SMART_POSTER = [0x53, 0x70] # "Sp"
	RTD_ALTERNATIVE_CARRIER = [0x61, 0x63]   # "ac"
	RTD_HANDOVER_CARRIER = [0x48, 0x63] # "Hc"
	RTD_HANDOVER_REQUEST = [0x48, 0x72] # "Hr"
	RTD_HANDOVER_SELECT = [0x48, 0x73] # "Hs"

This example creates a hash for an NdefRecord, which will be part of an NFCMessage to be pushed to an NFC-capable mobile device.

	:::ruby
	hash = { 'id' => [0], 'type' => Rho::NdefRecord::RTD_URI, 'tnf' => Rho::NdefRecord::TNF_WELL_KNOWN, 'payload' => payload}

## NdefRecord get methods

You can extract data from an Ndef record with the following methods:

	:::ruby
	Rho::NdefRecord.get_id                   # returns byte[] 
	Rho::NdefRecord.get_tnf                  # returns int
	Rho::NdefRecord.get_type                 # returns byte[]
	Rho::NdefRecord.get_payload              # returns byte[]
	Rho::NdefRecord.get_payload_as_string    # returns string
	Rho::NdefRecord.get_byte_array           # returns byte[]

## make_hash

Returns a hash from an Ndef record, from which you can then extract data with the NdefRecord get methods. [Click here for an example in the Rhodes developer guide under NFC.](../rhodes/nfc#reading-an-nfc-tag)

	:::ruby
	Rho::NdefRecord.make_hash

The hash has the following format:

<table border="1">
<tr>
	<td><code>id</code></td>
	<td>Array of bytes. The tag ID.</td>
</tr>
<tr>
	<td><code>tnf</code></td>
	<td>int. The Type Name Format.</td>
</tr>
<tr>
	<td><code>type</code></td>
	<td>array of bytes</td>
</tr>
<tr>
	<td><code>payload</code></td>
	<td>Array of bytes. The tag payload.</td>
</tr>
<tr>
	<td><code>payload_as_string</code></td>
	<td>String. The message payload in a string (support special formats for URI, TEXT).</td>
</tr>
</table>

## convert_Tnf_to_string

Returns a string that is a text description of the Type Name Format.

	:::ruby
	Rho::NdefRecord.convert_Tnf_to_string(tnf)

<table border="1">
<tr>
	<td><code>tnf</code></td>
	<td>Int. The Type Name Format (TNF) from an Ndef record hash.</td>
</tr>
</table>

## convert_RTD_to_string

Returns a string that is a text description of the rtd (type part of the NdefRecord hash).

	:::ruby
	Rho::NdefRecord.convert_RTD_to_string(rtd)

<table border="1">
<tr>
	<td><code>rtd</code></td>
	<td>A byte array. The rtd (type) from an NdefRecord hash.</td>
</tr>
</table>
