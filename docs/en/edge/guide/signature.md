# Signature Capture

The [Signature Capture API](../../2.2.0/rhodesapi/signaturecapture-api) allows your device to take a signature and save it as an image.

Click [here for information about the SignatureCapture.take method](../../2.2.0/rhodesapi/signaturecapture-api#take). This method opens a window for hand writing, where the user draws his signature. Signature is saved to an image file.

Example:
	:::ruby
	Rho::SignatureCapture.take(url_for( :action => :signature_callback), { :imageFormat => "jpg", :penColor => 0xff0000, :penWidth=>3, :bgColor => 0x00ff00 })

**NOTE: To take signature on Blackberry devices, press the Menu button, then select 'Capture'.**

### Inline Signature Capture
**NOTE: As of Rhodes version 3.3.3, the Inline Signature API is removed from Rhodes.**

Windows Mobile and Windows CE devices support signature capture started in window, which you can show over the current page (scrolling is not supported in this case). 

Refer to the [Inline Signature API](../../2.2.0/rhodesapi/signaturecapture-api#inline-signature-api) for the inline signature capture methods.

* [visible](../../2.2.0/rhodesapi/signaturecapture-api#visible) - Display a window for hand writing, where the user draws his signature.
* [capture](../../2.2.0/rhodesapi/signaturecapture-api#capture) - Save the signature to an image file and call a callback.
* [clear](../../2.2.0/rhodesapi/signaturecapture-api#clear) - Clear the signature in the window.

Example of visible method:<a id="inline-signature-ex" />

	:::ruby
	Rho::SignatureCapture.visible(true, { :imageFormat => "jpg", :penColor => 0xff0000, :penWidth=>3, :bgColor => 0x00ff00 })

To save Signature to an image file and call callback:
	:::ruby
	Rho::SignatureCapture.capture(callback_url)

Example of capture method:

	:::ruby
	Rho::SignatureCapture.capture(url_for( :action => :signature_callback))

Example of clear method:

	:::ruby
	Rho::SignatureCapture.clear()

### Sample
See controller and view in the /app/SignatureUtil folder of the [System API Samples application](http://github.com/rhomobile/rhodes-system-api-samples/tree/master/app/SignatureUtil/controller.rb) for more information.

