# Camera API
Use the camera on a device. See the controller and view in the /app/Image folder of the [System API Samples application](https://github.com/rhomobile/rhodes-system-api-samples/blob/master/app/Image/controller.rb) for an example.

## Using JavaScript API
You can call the Camera methods from JavaScript as well as Ruby. To use the JavaScript API, add the `public/js/rho_javascript_api.js` file -- created at build time as part of the application package -- to the .html, .erb, or .js file calling the JavaScript method.

The JavaScript API methods with a return value can pass it as a parameter in jQuery-compatible continuation (deferred object, a kind of callback). Possible continuations to handle are done, fail, and complete.

	:::js
	Rho.Class.method(params).done(function(handler) { /* handler... */ })

You must enable JavaScript by putting `rho-javascript` into extensions in your build.yml.

	:::yaml
	extensions: ["rho-javascript"]

You must have a [RhoElements license](../rhoelements/licensing) to use the JavaScript API.

## Enabling the Camera
To use the camera API, you need to enable the camera on the device. Do this by adding that capability to the build.yml file:

	:::yaml
	capabilities:
	  - camera

## get_camera_info
Get camera information. Returns max_resolution: a hash with width and height numeric values (returns NIL if the camera_type is not supported). iOS and Android only.

Ruby syntax:

	:::ruby
	Camera::get_camera_info(camera_type)

JavaScript syntax:

	:::js
	Rho.Camera.get_camera_info(camera_type)

<table border="1">
	<tr>
		<td><code>camera_type</code></td>
		<td>String. "main" or "front". Default = "main".</td>
	</tr>
</table>

## choose_picture
Choose a picture from an album. `options_hash` is only used with iOS.

	:::ruby
	Camera::choose_picture(callback_url, options_hash)

JavaScript syntax:

	:::js
	Rho.Camera.choose_picture(callback_function, options_hash)

<table border="1">
	<tr>
		<td><code>callback_url</code></td>
		<td>url to the callback method, such as '/app/model/camera_callback'. </td>
	</tr>
	<tr>
		<td><code>options_hash</code></td>
		<td>(iOS only) a hash of additional parameters.</td>
	</tr>
</table>

The callback is a POST message; the body of the message contains the return status and image_uri.

<table border="1">
	<tr>
		<td><code>status</code></td>
		<td>"ok", "cancel", "error".</td>
	</tr>
	<tr>
		<td><code>image_uri</code></td>
		<td>uri to the chosen image stored in the /public/db-files folder; the image file has an auto-generated name.</td>
	</tr>
</table>

## take_picture
Take a picture. `options_hash` is used with iOS, Android, and RhoElements Zebra devices.

> Note: On low memory devices, the `take_picture` method may not work. As a workaround, you can use the `Imager` API's [`capture()`](../rhoelements/imager#methods) method.

Ruby syntax:

	:::ruby
	Camera::take_picture(callback_url, options_hash)

JavaScript syntax:

	:::js
	Rho.Camera.take_picture(callback_function, options_hash)

<table border="1">
	<tr>
		<td><code>callback_url</code></td>
		<td>url to the callback method, such as '/app/model/camera_callback'.</td>
	</tr>
	<tr>
		<td><code>options_hash</code></td>
		<td>(Android, iOS, Zebra devices only) a hash of additional parameters.</td>
	</tr>
</table>

## save_image_to_device_gallery
Save an image to the device gallery.

Ruby syntax:

	:::ruby
	Camera::save_image_to_device_gallery(path_to_image)

<table border="1">
	<tr>
		<td><code>path_to_image</code></td>
		<td>The real path to the image that is to be saved in the device gallery. You need to use the RhoApplication method get_blob_path to have the real path, such as Rho::RhoApplication::get_blob_path(img.image_uri).</td>
	</tr>
</table>

## Callback Parameters
Once the user has taken/chosen a picture (`take_picture`, `choose_picture`), the callback URL you specified will be called. The callback is a POST message; the body of the message contains the following parameters.

<table border="1">
	<tr>
		<td><code>status</code></td>
		<td>"ok", "cancel", "error".</td>
	</tr>
	<tr>
		<td><code>image_uri</code></td>
		<td>uri to the taken image stored in the /public/db-files folder; the image file has an auto-generated name.</td>
	</tr>
	<tr>
		<td><code>message</code></td>
		<td>(Android and iOS only) if status = "error", a string containing an error message.</td>
	</tr>
	<tr>
		<td><code>image_width</code></td>
		<td>(Android and iOS only) image width in pixels.</td>
	</tr>
	<tr>
		<td><code>image_height</code></td>
		<td>(Android and iOS only) image height in pixels.</td>
	</tr>
	<tr>
		<td><code>image_format</code></td>
		<td>(Android and iOS only) "png" or "jpg".</td>
	</tr>
</table>

## options_hash for iOS and Android Devices
`options_hash` is a hash used with `take_picture` and `choose_picture` on iOS and Android.

<table border="1">
	<tr>
		<td><code>camera_type</code></td>
		<td>"main" or "front". Default = "main".</td>
	</tr>
	<tr>
		<td><code>desired_width</code></td>
		<td>desired width in pixels. Default = max camera width.</td>
	</tr>
	<tr>
		<td><code>desired_height</code></td>
		<td>desired height in pixels. Default = max camera height.</td>
	</tr>
	<tr>
		<td><code>color_model</code></td>
		<td>"RGB" or "Grayscale". Default = "RGB".</td>
	</tr>
	<tr>
		<td><code>format</code></td>
		<td>"png" or "jpg". Default = "jpg". If you do not define this property when you use choose_picture with iOS, the type of image in Gallery will be recognized, and the same format will be used for saving the image to applications data.</td>
	</tr>
	<tr>
		<td><code>enable_editing</code></td>
		<td>(iPhone only) boolean. Enables post photo capture image customizing; image will captured reduced to screen size (not full size). Default = true.</td>
	</tr>
	<tr>
		<td><code>flash_mode</code></td>
		<td>(Android only) String. "off", "on", "auto", "red-eye", "torch".</td>
	</tr>
	<tr>
		<td><code>save_to_shared_gallery</code></td>
		<td>(iOS only) if true, picture you take will be added to the camera roll. Default value = false.</td>
	</tr>
</table>

## options_hash for RhoElements Zebra Devices
`options_hash` is a hash used with `take_picture` on RhoElements Zebra devices, 

<table border="1">
	<tr>
		<td><code>left</code></td>
		<td>camera left position in pixels. Default value = 0.</td>
	</tr>
	<tr>
		<td><code>top</code></td>
		<td>camera top position in pixels. Default value = 0.</td>
	</tr>
	<tr>
		<td><code>desired_width</code></td>
		<td>desired width in pixels. Default value = max camera width.</td>
	</tr>
	<tr>
		<td><code>desired_height</code></td>
		<td>desired width in pixels. Default value = max camera height.</td>
	</tr>
</table>

##Devices lacking support
Due to platform limitation devices such as ES400, MC65 and MC67 does not support camera API. Preferred Imager APIs in that case.
