# SignatureTool API

Allows the device to take a signature and save it as an image with the method take_signature. See the controller and view in the /app/SignatureUtil folder of the [System API Samples application](https://github.com/rhomobile/rhodes-system-api-samples/blob/master/app/SignatureUtil/controller.rb) for an example.

**NOTE: As of Rhodes version 3.3.3, the [Barcode](barcode-api), [NFC](../rhodes/device-caps#nfc), and [Signature Capture](../rhodes/device-caps#signature-capture) APIs, as well as [Rhom data encryption](../rhodes/rhom#database-encryption) are removed from Rhodes. These features are only supported in Zebra RhoMobile Suite. If you wish to use these features, you will need to [upgrade to RhoMobile Suite](../rhomobile-install). Your application's build.yml will also need to be modified to [indicate the application type is 'Rhoelements'](../rhoelements/rhoelements2-native#enabling-motorola-device-capabilities). Additionally, a [RhoElements license](../rhoelements/licensing) is required.**

## take_signature(callback_url, image_format)

Opens a window on the device where user draws his signature. Saves the  signature as an image.

	:::ruby
	SignatureTool::take_signature(callback_url, image_format)

<table border="1">
<tr>
	<td><code>callback_url</code></td>
	<td>url to callback method called after the user enters a signature.</td>
</tr>
<tr>
	<td><code>image_format</code></td>
	<td>The image format: "jpg" or "png".</td>
</tr>
</table>

Callback method parameters:

<table border="1">
<tr>
	<td><code>status</code></td>
	<td>OK or CANCEL.</td>
</tr>
<tr>
	<td><code>signature_uri</code></td>
	<td>path to the signature image.</td>
</tr>
</table>
