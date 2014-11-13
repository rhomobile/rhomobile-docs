# Backlight
## Overview
The Backlight API is used to illuminate / extinguish the display backlight as well as setting the intensity of the backlight.

## Enabling the API
In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* elements.js 

> Note - this file either needs to be on the device in a relative folder from where your HTML page is, or it must be copied to your web server appropriately.

	:::html
    <script type="text/javascript" charset="utf-8" src="elements.js"></script>;

### API Usage
This API does not use the `EB` namespace. It is simply referenced using the API name:

	:::javascript
	backlight.on();

## Events
To handle events, you assign a string value to the event name that represents a function name or javascript statement to execute.

### backlightSettingsEvent 
Triggered after executing the `getBacklightSettings` method. Make sure to include the %json notation in order to get the callback parameters.

#### Callback Parameters

* intensity - The current backlight intensity value E.g. 2. On Android a negative value indicates the default system value.
* intensityRange - A JavaScript array of integers containing the valid range of intensity values. e.g. ['0','1','2']
* state - The current backlight state "on" or "off" or "timeout"

#### Usage  
	:::javascript
	backlight.backlightSettingsEvent = "url('JavaScript:backlightCallback(%json)')";
	backlight.getBacklightSettings();

	function backlightCallback(params){
		alert('The backlight is' + params['state'] + ' with intensity of' + params['intensity']);
	}

## Methods
### on()
Turn on the screen backlight. N/A for Android devices, please use the [Wake API](../api/Wake) to keep the screen ON.

#### Returns
* Void

#### Platforms

* Windows Mobile/CE

### off()
Turn off the screen backlight.

#### Returns
* Void

#### Platforms

* Android
* Windows Mobile/CE

### getBacklightSettings()
Returns the backlight settings via a `backlightSettingsEvent`.

#### Returns
* Void

#### Platforms

* Android
* Windows Mobile/CE

## Properties
### intensity
#### Type
<span class='text-info'>INTEGER</span> - Positive Number, see remarks for range

#### Description
Sets the screen backlight to the specified intensity.

>Note: The intensity tag will only have an observable effect if the screen backlight is turned on, setting the intensity by its self is insufficient to illuminate the backlight.

#### Platforms

* Android
* Windows Mobile/CE

## Examples
### Backlight Manipulation
In this example, you'll see how to use the backlight API to manipulate the state and intensity of the backlight on your device. This example assumes that your elements.js file is in the same folder as the html invoking it.

	:::html
	<head>
		<script type="text/javascript" charset="utf-8" src="elements.js"></script>

		<title>Backlight API Example</title>

		<script>
		var backlightOn = false;
		var intensity = 100;

		backlight.backlightSettingsEvent = "url('JavaScript:backlightCallback(%json)')";
		backlight.intensity = intensity;
		getSettings();

		function toggleBacklight(){
			if(backlightOn){
				backlight.off();
				backlightOn = false;
			}
			else{
				backlight.on();
				backlightOn = true;
			}
		}

		function backlightCallback(params){
			info.innerHTML = "Brightness: " + params['intensity'];
		}

		function changeIntensity(){
			if(intensity == 100){
				intensity = 75;
				backlight.intensity = intensity;
				getSettings();
			}
			else if(intensity == 75){
				intensity = 50;
				backlight.intensity = intensity;
				getSettings();
			}
			else if(intensity == 50){
				intensity = 25;
				backlight.intensity = intensity;
				getSettings();
			}
			else if(intensity == 25){
				intensity = 100;
				backlight.intensity = intensity;
				getSettings();
			}
		}

		function getSettings(){
			backlight.getBacklightSettings();
		}

		</script>
	</head>
	<h1>Backlight API</h1>
	<div id='info'>
	</div>
	<body>
		<div>
			<button onclick='toggleBacklight()'>Toggle Backlight</button>
			</br>
			</br>
			<button onclick='getSettings()'>Get Backlight Intensity</button>
			</br>
			</br>
			<p>Note: If your device is set to automatically set the brightness, you will not be able to change the intensity through this API.</p>
			</br>
			<button onclick='changeIntensity()'>Change Intensity</button>
		</div>
	</body>

## Remarks
### Multi Instance
When multiple Enterprise Browser applications are running the following considerations should be made: The backlight settings are application specific. Switching to another application which uses the backlight module will cause the screen illumination settings to change to those of the application with focus. Only the application with Focus will have the ability to change the backlight settings.

### Device Limits
The levels of supported screen backlight intensity are device dependent. You can determine the levels on your device using the backlightSettingsEvent and getBacklightSettings method.

### 'Auto' and 'Manual' Backlight Intensity
Windows Mobile 6.5 Devices with a light sensor, such as the ES400 will support two modes for the Backlight: Auto Mode (default) where the light sensor input affects the backlight intensity and Manual Mode where the user sets the backlight manually. In order to use the Intensity setting in Enterprise Browser, the device must be put into Manual Mode, most easily achieved via the 'Backlight & Keylight' applet accessed via Start->Settings->System.

### Android
Unlike all other devices, changes made to the backlight intensity are made only to Enterprise Browser. Switching native applications or quitting Enterprise Browser will revert the backlight intensity to the system's default level until Enterprise Browser is resumed. Also the method `on` does not work as the backlight settings are application specific, please use the [Wake API](../api/Wake) to keep the screen on.