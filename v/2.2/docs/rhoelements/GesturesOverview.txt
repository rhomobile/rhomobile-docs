#Gesturing in RhoElements: An Overview
<b>RhoElements is capable of capturing gestures from the touch screen if the appropriate hardware is installed.  You can define multiple gestures on the same page but to avoid performance issues it is recommended you do not create more than 5 per page.</b>
 
There are three types of screen gesture:
<ul>
	<li>Linear: detects straight line movements on the screen
	<li>Circle: detects full or partial circular movements on the screen
	<li>Hold: detects when the screen is touched and held
</ul>
And there are two types of device gesture:
<ul>
	<li>Tilt: detects if the device is oriented according to the specified angles
	<li>Shake: detects if the device is shaken according to the specified threshold
</ul>
    
##Linear Gesture
A linear gesture is defined by its Start and End points, and values called Tolerance, Sensitivity, Skew and Deviation. Start, End and Tolerance (all expressed in pixels) define a rectangle which is the active gesture area; this area is divided into smaller rectangles. The region-width parameter specifies the width of the rectangles.

<center><img src="/images/gestures/linear1.gif"></center>

RhoElements detects how many rectangles the mouse passes through as the cursor is swept across the screen. If the track passes through the rectangles in the wrong order at any point then the gesture is not detected.

The Sensitivity parameter is the percentage of the rectangles which the track must pass through, e.g. if sensitivity is 50 and the track passes through less than 50% of the rectangles then a gesture is not detected.

RhoElements then calculates the difference between the tracked line and the line defined by the gesture; the angle must be less than the Skew parameter (expressed in degrees) for the gesture to be detected.  The deviation parameter gives the tolerance that the tracked line can deviate from being straight, there are no particular units for this parameter and it should be treated as an abstract value.
<center><img src="/images/gestures/linear2.gif"></center>

##Circle Gesture

Circle gestures operate in a similar way to linear gestures but cover the gesture region with circles instead of rectangles:
<center><img src="/images/gestures/circle.gif"></center>

The Start and End angles (in degrees) specify the start and end of the gesture region, measuring clockwise from the 3 o&#39;clock position. The example above uses a Start of 0 degrees and an End of 180 degrees. The End angle can be less than the Start, in which case the gesture must be performed in an anti-clockwise direction. Angles greater than 360 degrees are supported.

The Tolerance specifies the radius of the overlapping circles which cover the gesture region.

Detection of the gesture from the mouse point track is done in a similar way to the linear gesture: the function counts the number of small circles crossed in the correct order and compares this to the Sensitivity threshold.

##Hold Gesture
Hold gestures implement the press-and-hold functionality. The circular gesture region is defined by the Centre point and the Radius (in pixels). There are also Delay and Interval parameters (in milliseconds).

The gesture is detected if the stylus is held down within the region for 'Delay' milliseconds. The gesture is further detected every Interval milliseconds thereafter as long as the stylus remains held down within the region. When the stylus is raised or moved out of the region the gesture is detected a final time.

If the Interval is set to zero only the initial gesture will be detected.
<center><img src="/images/gestures/hold.gif"></center>

##Tilt Gesture
Tilt gestures detect if the device is placed in the specified angular positions according to the horizontal plane. The user can specify the angle for each axis X, Y and Z or can select some predefined values like face-up etc.

<center><img src="/images/gestures/tilt.gif"></center>

The three axis are defined as below:

<center><img src="/images/gestures/angles.gif"></center>

The tilt tolerance parameter can be used to specify the tolerance level for the specified angles and the hysteresis parameter can be used to avoid detecting the same gesture continuously.

##Shake Gesture
Shake gestures detect if the device is shaken as per the specified threshold values. This can detect the shake in all the three axis X, Y and Z. 

<center><img src="/images/gestures/shake.gif"></center>

The threshold parameter can be used to define the shake intensity and the quiet parameter can be used to avoid detecting the same gesture continuously.
