# Camera

You need to enable the Camera capability. This is done by adding the following lines to build.yml:

	:::yaml
	capabilities:
	  - camera

Check if the device [has a camera](../api/system#phasCamera):
	:::ruby
	System::hasCamera

### Camera API

Refer to the [Camera API](../rhodesapi/camera-api) methods to perform the following functionality.

 * [get_camera_info](../rhodesapi/camera-api#getcamerainfo) - Get camera information.
 * [choose_picture](../rhodesapi/camera-api#choosepicture) - Choose a picture from an album.
 * [take_picture](../rhodesapi/camera-api#takepicture) - Take a picture.

You can set [extended options for take_picture on iOS and Android, for choose_picture on iPhone](../rhodesapi/camera-api#optionshashforiosandandroiddevices), and for [RhoElements Motorola devices](../rhodesapi/camera-api#optionshashforrhoelementsmotoroladevices).

### Sample

See controller and view in the /app/Image folder of the [ System API Samples application](http://github.com/rhomobile/rhodes-system-api-samples/tree/master/app/Image/controller.rb) for more information.

Here is an example call from the System API Samples application.

	:::ruby
	settings = { :camera_type => @params['camera_type'], 
	  :color_model => @params['color_model'], :enable_editing => en_ed, 
	  :desired_width => width, :desired_height => height, :flash_mode => 'auto' }
    Camera::take_picture(url_for(:action => :camera_callback), settings)
