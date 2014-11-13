# Gesture
> Note: This feature is not supported on Windows CE if [debug buttons](../guide/configreference?DebugButtons) are enabled in the [Config.xml](../guide/configreference).

## Overview
The Enterprise Browser is capable of capturing gestures from the touch screen if the appropriate hardware is installed. You can define multiple gestures on the same page but to avoid performance issues it is recommended you do not create more than 5 per page. 

There are three types of screen gesture: 

* Linear – detects straight line movements on the screen 
* Circle – detects full or partial circular movements on the screen 
* Hold – detects when the screen is touched and held 

## Enabling the API
In order to use this API you must include reference to the following JavaScript file that is included with the Enterprise Browser installation:

* elements.js 

> Note - this file either needs to be on the device in a relative folder from where your HTML page is, or it must be copied to your web server appropriately.

	:::html
    <script type="text/javascript" charset="utf-8" src="elements.js"></script>;


### API Usage
This API does not use the `EB` namespace. It is simply referenced using the API name:

	:::javascript
	gesture.create();


### Linear Gesture
A linear gesture is defined by its Start and End points, and values called Tolerance, Sensitivity, Skew and Deviation. Start, End and Tolerance (all expressed in pixels) define a rectangle which is the active gesture area; this area is divided into smaller rectangles. The region-width parameter specifies the width of the rectangles. 

![img](images/gestures/linear1.gif)

Enterprise Browser detects how many rectangles the mouse passes through as the cursor is swept across the screen. If the track passes through the rectangles in the wrong order at any point then the gesture is not detected. 

The Sensitivity parameter is the percentage of the rectangles which the track must pass through, e.g. if sensitivity is 50 and the track passes through less than 50% of the rectangles then a gesture is not detected. 

Enterprise Browser then calculates the difference between the tracked line and the line defined by the gesture; the angle must be less than the Skew parameter (expressed in degrees) for the gesture to be detected. The deviation parameter gives the tolerance that the tracked line can deviate from being straight, there are no particular units for this parameter and it should be treated as an abstract value. 

![img](images/gestures/linear2.gif)

### Circle Gesture
Circle gestures operate in a similar way to linear gestures but cover the gesture region with circles instead of rectangles: 

The Start and End angles (in degrees) specify the start and end of the gesture region, measuring clockwise from the 3 o’clock position. The example above uses a Start of 0° and an End of 180°. The End angle can be less than the Start, in which case the gesture must be performed in an anti-clockwise direction. Angles greater than 360° are supported. 

The Tolerance specifies the radius of the overlapping circles which cover the gesture region. 

Detection of the gesture from the mouse point track is done in a similar way to the linear gesture: the function counts the number of small circles crossed in the correct order and compares this to the Sensitivity threshold.

![img](images/gestures/circle.gif)

### Hold Gesture
Hold gestures implement the press-and-hold functionality. The circular gesture region is defined by the Center point and the Radius (in pixels). There are also Delay and Interval parameters (in milliseconds). 

The gesture is detected if the stylus is held down within the region for 'Delay' milliseconds. The gesture is further detected every Interval milliseconds thereafter as long as the stylus remains held down within the region. When the stylus is raised or moved out of the region the gesture is detected a final time. 

If the Interval is set to zero only the initial gesture will be detected. 

![img](images/gestures/hold.gif)

### Tilt Gesture
> Note: On Windows platforms, this gesture is supported for use on MPA3 devices only.

Tilt gestures detect if the device is placed in the specified angular positions according to the horizontal plane. The user can specify the angle for each axis X, Y and Z or can select some predefined values like face-up etc.

The tilt tolerance parameter can be used to specify the tolerance level for the specified angles and the hysteresis parameter can be used to avoid detecting the same gesture continuously.

### Shake Gesture
> Note: On Windows platforms, this gesture is supported for use on MPA3 devices only.

Shake gestures detect if the device is shaken as per the specified threshold values. This can detect the shake in all the three axis X, Y and Z.

The threshold parameter can be used to define the shake intensity and the quiet parameter can be used to avoid detecting the same gesture continuously.

## Events
To handle events, you assign a string value to the event name that represents a function name or javascript statement to execute.

### detected 
This event will be triggered each time an gesture event is detected for created active gestures. 

#### Callback Parameters

* id - The ID string of the detected gesture.
* count - The number of times a hold gesture has been detected for a single press of the screen. Returns zero when the screen touch stops. Only applies to hold gestures.


#### Usage  
	:::javascript
	gesture.type = 'Shake';
	gesture.id = "Device_Shake"
	gesture.detected = "url('JavaScript:gestureCallback(%json);')";
	gesture.create();

	function gestureCallback(params){
		alert('Received the following gesture:\n' + params['id']);
	}

## Methods
### create()
Creates the previously defined gesture. Properties must be set prior to calling this method.Make sure to specify the detected callback handler function as well as the required properties per the type of gesture being defined.

#### Returns
* Void

#### Platforms

* Android
* Windows Mobile

### delete()
Deletes the gesture last defined by the ID property.

#### Returns
* Void

#### Platforms

* Android
* Windows Mobile

## Properties
### type
#### Type
<span class='text-info'>STRING</span>

#### Description
Specifies the type of gesture being created. Must be the first tag when creating a gesture.

#### Possible Values

* Linear
* Circle
* Hold
* Tilt
* Shake

#### Platforms

* Android
* Windows Mobile

> Tilt and Shake are only available om devices that have an accelerometer.

### id
#### Type
<span class='text-info'>STRING</span> 

#### Description
ID used to identify gesture when detected.	

#### Default Value
Depends on gesture type and preset used, if any. See remarks.

#### Platforms

* Android
* Windows Mobile

### preset
#### Type
<span class='text-info'>STRING</span> 

#### Description
The ‘preset’ tag is used to specify one of the preset values below. When a gesture definition is started using the ‘type’ tag its parameters are initially set to the preset shown as default. When a preset is specified for a gesture, including when it is first created, its ID is set to [gesture name]–[default preset name]. E.g. a new linear gesture will have the ID ‘linear-left-right’. This can be replaced (as can any preset value) by a subsequent parameter tag.

#### Possible Values
Dependant on the Gesture Type, the following present names are available, default values are in bold.

* linear
	* **left-right**
	* right-left
	* top-bottom
	* bottom-top
* circle
	* **happy** : a 180 degree semi-circle, clockwise from the 3 o'clock position. 
	* sad : a 180 degree semi-circle, clockwise from the 9 o'clock position.
* hold
	* **center**
* tilt
	* **face-up**  : (0, 0, 90)
	* face-down : (0, 0, -90)
	* upright : (0, 90, 0)
	* turn-down : (0, -90, 0)
  * turn-left : (90, 0, 0)
  * turn-right : (-90, 0, 0)
* shake
	* **normal**

#### Platforms

* Android
* Windows Mobile

### diagnostics
#### Type
<span class='text-info'>STRING</span> 

#### Description
Enables drawing of diagnostic information to provide guidance showing whether or not the gesture will be detected. Note that by their very nature Diagnostics are not designed to be seen by the user.

#### Possible Values
* TRUE
* FALSE

#### Platforms

* Android
* Windows Mobile

### startX
#### Type
<span class='text-info'>STRING</span> 

#### Description
Linear Gestures: Starting point of gesture.

#### Possible Values
* 0 to 10000

#### Default Value
* 10% of screen width.

#### Platforms

* Android
* Windows Mobile

### startY
#### Type
<span class='text-info'>STRING</span> 

#### Description
Linear Gestures: Starting point of gesture.

#### Possible Values
* 0 to 10000

#### Default Value
* 50% of screen height.

#### Platforms

* Android
* Windows Mobile

### endX
#### Type
<span class='text-info'>STRING</span> 

#### Description
Linear Gestures: End point of gesture.

#### Possible Values
* 0 to 10000

#### Default Values
* 90% of screen width.

#### Platforms

* Android
* Windows Mobile

### endY
#### Type
<span class='text-info'>STRING</span> 

#### Description
Linear Gestures: End point of gesture.
#### Possible Values
* 0 to 10000

#### Default Values
* 50% of screen height.

#### Platforms

* Android
* Windows Mobile

### skew
#### Type
<span class='text-info'>STRING</span> 

#### Description
Linear Gestures: Maximum angle which straight line through mouse track can make to the gesture path.

#### Possible Values
* 0 to 90

#### Default Values
* 20.

#### Platforms

* Android
* Windows Mobile

### deviation
#### Type
<span class='text-info'>STRING</span> 

#### Description
Linear Gestures: Maximum deviation of mouse track from a straight line.
#### Possible Values
* 0 to 100

#### Default Values
* 20

#### Platforms

* Android
* Windows Mobile

### regionWidth
#### Type
<span class='text-info'>STRING</span> 

#### Description
Linear Gestures: Width of regions into which gesture path is divided. Setting very small (e.g. 1) or large (e.g. equal to the gesture line length) values is allowed but may lead to unexpected results.

#### Possible Values
* 10% of screen width.

#### Default Values
50% of screen height.

#### Platforms

* Android
* Windows Mobile

### centerX
#### Type
<span class='text-info'>STRING</span> 

#### Description
Circle & Hold Gestures: Center of gesture.
#### Possible Values
* -10000 to 10000

#### Default Values
Center of screen.

#### Platforms

* Android
* Windows Mobile

### centerY
#### Type
<span class='text-info'>STRING</span> 

#### Description
Circle & Hold Gestures: Center of gesture.
#### Possible Values
* -10000 to 10000

#### Default Values
Center of screen.

#### Platforms

* Android
* Windows Mobile

### radius
#### Type
<span class='text-info'>STRING</span> 

#### Description
Circle & Hold Gestures: Radius (in pixels) of gesture.

#### Possible Values
* 1 to 10000

#### Default Values
33% of screen width or height, whichever is smaller.

#### Platforms

* Android
* Windows Mobile

### start
#### Type
<span class='text-info'>STRING</span> 

#### Description
Circle Gestures: Starting angle of gesture in degrees. Angles are measured clockwise from 3 o'clock position.

#### Possible Values
* 0 to 10000

#### Default Values
0

#### Platforms

* Android
* Windows Mobile

### end
#### Type
<span class='text-info'>STRING</span> 

#### Description
Circle Gestures: Ending angle of gesture in degrees. Angles are measured clockwise from 3 o'clock position.

#### Possible Values
* 0 to 10000

#### Default Values
180

#### Platforms

* Android
* Windows Mobile

### tolerance
#### Type
<span class='text-info'>STRING</span> 

#### Description
Linear & Circle Gestures: How far (in pixels) the mouse track can vary from the gesture path.

#### Possible Values
* 0 to 10000

#### Default Values
* Linear: 25% of screen height. 
* Circle: 16% of screen width.

#### Platforms

* Android
* Windows Mobile

### sensitivity
#### Type
<span class='text-info'>STRING</span> 

#### Description
Linear & Circle Gestures: Percentage of gesture path which mouse track must cover. Rounds down if this results in a non-whole number of regions.

#### Possible Values
* 0 to 100

#### Default Values
50

#### Platforms

* Android
* Windows Mobile

### delay
#### Type
<span class='text-info'>STRING</span> 

#### Description
Hold Gestures: Time (in milliseconds) that screen must be touched within gesture before first detected.

#### Possible Values
* >=0

#### Default Values
1000

#### Platforms

* Android
* Windows Mobile

### interval
#### Type
<span class='text-info'>STRING</span> 

#### Description
Hold Gestures: Time (in milliseconds) between subsequent detections while screen continues to be touched. Zero means no further detections. This parameter is ignored if the detection event is not set to navigate to a new page.

#### Possible Values
* >=0

#### Default Values
0

#### Platforms

* Android
* Windows Mobile

### TargetX
#### Type
<span class='text-info'>STRING</span> 

#### Description
Tilt Gestures: Target orientation of device on X-axis.

#### Possible Values
* -90 to 90

#### Default Values
0

#### Platforms

* Android
* Windows Mobile

### TargetY
#### Type
<span class='text-info'>STRING</span> 

#### Description
Tilt Gestures: Target orientation of device on Y-axis.

#### Possible Values
* -90 to 90

#### Default Values
0

#### Platforms

* Android
* Windows Mobile

### TargetZ
#### Type
<span class='text-info'>STRING</span> 

#### Description
Tilt Gestures: Target orientation of device on Z-axis.

#### Possible Values
* -90 to 90

#### Default Values
90

#### Platforms

* Android
* Windows Mobile

### TiltTolerance
#### Type
<span class='text-info'>STRING</span> 

#### Description
Tilt Gestures: How close the device must be to the target orientation.

#### Possible Values
* 0 to 90

#### Default Values
10

#### Platforms

* Android
* Windows Mobile

### Hysteresis
#### Type
<span class='text-info'>STRING</span> 

#### Description
Tilt Gestures: How far the device must move away from the target orientation before the gesture can be detected again.

#### Possible Values
* 0 to 90

#### Default Values
10

#### Platforms

* Android
* Windows Mobile

### Threshold
#### Type
<span class='text-info'>STRING</span> 

#### Description
Shake Gestures: How vigorously the device must be shaken. The smaller the value the more vigorous.

#### Possible Values
* 0 to 1000

#### Default Values
500

#### Platforms

* Android
* Windows Mobile

### Quiet
#### Type
<span class='text-info'>STRING</span> 

#### Description
Shake Gestures: Time (in milliseconds) that the device must be still before another shake gesture can be detected.

#### Possible Values
* >=0	

#### Default Values
1000

#### Platforms

* Android
* Windows Mobile

## Examples
### Creating Gestures
In this example, you'll see how to set the properties for and create a gesture using the gesture API. Once the gesture is created, you'll see an alert showing the ID of the gesture. This example assumes that the elements.js files resides in the same folder as the HTML file that is invoking it.

	:::html
	<head>
		<script type="text/javascript" charset="utf-8" src="elements.js"></script>

		<title>Gesture API Example</title>

		<script>
			var gestureProps = null;

			// Set the 'detected' event callback.
			gesture.detected = "url('JavaScript:gestureCallback(%json);')";

			function gestureCallback(params){
				alert('Received the following gesture:\n' + params['id']);

				// Remove gesture and clear gesture properties.
				gesture.delete();
				clearGesture();
			}

			function linearGesture(){
				// Setting the preset will override any id that may have been set, therefore to have a custom id, the id must be set AFTER the preset.
				gesture.type        = 'linear';
				gesture.preset      = 'right-left';
				gesture.id          = 'Swipe Left';
				gesture.diagnostics = true;
				gesture.create();
			}

			function halfCircularGesture(){
				gesture.type        = 'circle';
				gesture.preset      = 'sad';
				gesture.id          = 'Upsidedown Semi-Circle';
				gesture.diagnostics = true;
				gesture.create();
			}

			function tiltGesture(){
				gesture.type          = 'tilt';
				gesture.preset        = 'face-up';
				gesture.TiltTolerance = 90;
				gesture.id            = 'Tilt Back';
				gesture.diagnostics   = true;
				gesture.create();
			}

			function holdGesture(){
				gesture.type        = 'hold';
				gesture.preset      = 'center';
				gesture.delay       = 3000;
				gesture.id          = 'Long Tap';
				gesture.diagnostics = true;
				gesture.create();
			}

			function clearGesture(){
				gesture.type        = '';
				gesture.preset      = '';
				gesture.id          = '';
				gesture.diagnostics = false;
				gesture.create();
			}

			function setProperties(gestureType){
				// This function will set properties to a pre-determined set to make the example easier to understand
				switch(gestureType){
					case 'linear':
						linearGesture();
						break;
					case 'half-circular':
						halfCircularGesture();
						break;
					case 'tilt':
						tiltGesture();
						break;
					case 'hold':
						holdGesture();
						break;
					default:
						console.log("No such type!");
				}
			}
		</script>
	</head>
	<body>
		<h1>Gestures</h1>
		<p>Choose a gesture type below to create a gesture.</p><br/>
		<br/><br/>
		<br/><br/>
		<br/><br/>
		<br/><br/>
		<br/><br/>
		<br/><br/>
		<br/><br/>
		<button onclick="setProperties('linear')">Linear</button>
		<button onclick="setProperties('half-circular')">Half-Circular</button>
		<button onclick="setProperties('tilt')">Tilt</button>
		<button onclick="setProperties('hold')">Hold</button>
	</body>

## Remarks
### Maximum Gesture Size
There is no formal maximum size for a gesture, for example a circle gesture could require the user to move several times round the circle. However if the user draws such a gesture very slowly it’s possible that too many stylus move points could be generated, and the gesture wouldn't be detected. The Gesture API has been tested with a circle gesture from 0 to 720 degrees and taking approximately 6 seconds to draw without problem.

### Finger Scrolling
Gestures are not compatible with when the rendering engine has finger scrolling capabilities enabled.

### Common Pitfalls
Do not use alert boxes within the Gesture-Detected Callback, doing so will steal focus from the gesture region.

### Out-of-range Values
Any parameter values out of the allowed range will be limited to the nearest allowed value. E.g. giving a sensitivity greater than 100 will use 100. Numeric parameters given as text will be treated as zero.

### Diagnostics
Note that diagnostics exist only for the purpose of understanding and evaluating the various parameters. They should not be enabled in the release version of the code. They may also not display correctly in every circumstance, e.g. when scrolling, or for certain sets of parameters, e.g. for nearly vertical linear gestures. Diagnostics are not available for Tilt and Shake gestures.