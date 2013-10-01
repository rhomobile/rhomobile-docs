# Screen Orientation

You can use the `ScreenOrientation` module to control the screen orientation and to set a callback to receive orientation change events.

## Prerequisite

Before you can make use of the `ScreenOrientation` API, you need to include the `screenorientation` extension in your `build.yml`

    :::yaml
    extensions: ["screenorientation"]

## Get current screen orientation

You can get the current orientation of the device by using the `System.screenOrientation` property.

Ruby syntax:
    :::ruby
    screen_orientation = Rho::System.screenOrientation
    if screen_orientation == "portrait"
        # do something specific to portrait mode
    elsif screen_orientation == "landscape"
        # do something specific to landscape mode
    end

JavaScript syntax:
    :::javascript
    var screen_orientation = Rho.System.screenOrientation;
    if (screen_orientation === "portrait") {
        // do something specific to portrait mode
    } else if (screen_orientation === "landscape") { 
        // do something specific to landscape mode
    }
    
## Control screen orientation

### Locking the orientation

In some applications, it may be necessary to force the display to always be locked to an orientation. You can do this by setting the `disable_screen_rotation` in `rhoconfig.txt`

    :::ruby
    #disable screen rotation (enabled by default)
    disable_screen_rotation = 1 

### Enable / disable auto-rotation

You can enable or disable the autorotation of the display when the device is rotated by setting the `autoRotate` property

Ruby syntax:
    :::ruby
    # enable auto-rotate
    Rho::ScreenOrientation.autoRotate = true

    # disable auto-rotate
    Rho::ScreenOrientation.autoRotate = false

JavaScript syntax:
    :::javascript
    // enable auto-rotate
    Rho.ScreenOrientation.autoRotate = true;

    // disable auto-rotate
    Rho.ScreenOrientation.autoRotate = false;

### Changing to default orientation

Set the screen to the default orientation of the device using the `normal` method.

Ruby syntax:
    :::ruby
    Rho::ScreenOrientation.normal

JavaScript syntax:
    :::javascript
    Rho.ScreenOrientation.normal();

### Changing to right-handed orientation

Set the screen to right-handed orientation using the `rightHanded` method.

Ruby syntax:
    :::ruby
    Rho::ScreenOrientation.rightHanded

JavaScript syntax:
    :::javascript
    Rho.ScreenOrientation.rightHanded();

### Changing to left-handed orientation

Set the screen to left-handed orientation using the `leftHanded` method.

Ruby syntax:
    :::ruby
    Rho::ScreenOrientation.leftHanded

JavaScript syntax:
    :::javascript
    Rho.ScreenOrientation.leftHanded();

### Changing to upside-down orientation

Set the screen to upside-down orientation using the `upsideDown` method. This can be useful, for example, when the user offers the device to a customer to obtain a signature. If you set the orientation to `upsideDown`, the application's user interface will be in the correct position from the customer's point of view, without them having to physically rotate the device. This streamlines the capture process, avoids cumbersome manual operations and reduces the risk of the device being dropped.

Ruby syntax:
    :::ruby
    Rho::ScreenOrientation.upsideDown

JavaScript syntax:
    :::javascript
    Rho.ScreenOrientation.upsideDown();

## Responding to screen orientation change

When the device is rotated, it is sometimes necessary to update your application's UI layout to better suit the new orientation. There are two different approaches, depending on where the logic for change is placed: The first is to handle UI adaptations yourself (with code) and the second is to use responsive design.

### Handling rotation in code

If you want to respond to the device being rotated by running some code, there are two steps that must be completed. 
The first is to set a callback in order to be notified of orientation change events and the second is to update the UI layout accordingly.

Set the callback for screen orientation events by using the `setScreenOrientationEvent` method.

Ruby syntax:
    :::ruby
    def set_callback
        Rho::ScreenOrientation.setScreenOrientationEvent(url_for(:action => :screen_orientation_callback))
    end

    def unset_callback
        Rho::ScreenOrientation.setScreenOrientationEvent(nil)
    end

    def screen_orientation_callback
        puts "Screen Rotated. New orientation: #{@params["result"]}"
    end

JavaScript syntax:
    :::javascript
    function set_callback() {
        Rho.ScreenOrientation.setScreenOrientationEvent(screen_orientation_callback);
    }

    function unset_callback() {
        Rho.ScreenOrientation.setScreenOrientationEvent(null);
    }

    function screen_orientation_callback(params) {
        console.log("Screen Rotated. New orientation: "+params.result);
    }

### Updating the UI on screen orientation change

You can make your application handle different screen orientations by creating two different screen layouts for portrait and landscape orientation.

In your ERB files, You can write `if ... else` code in your layout using the `System.screenOrientation` property to change the layout of elements.

    :::ruby
    <% if System.screenOrientation == 'portrait' %>
        <!-- HTML for portrait layout -->
    <% else %>
        <!-- HTML for landscape layout -->
    <% end %>   
    
While this method works, there is a better solution: responsive design.

## Responsive design

The easiest way to show different UI layouts to the user based on the orientation and even automatically adjust to various device sizes is by using [responsive design](http://en.wikipedia.org/wiki/Responsive_web_design).

Using responsive design helps avoid creating entirely different versions of the same content for different orientations and sizes. This technique makes use of [CSS3 Media queries](http://en.wikipedia.org/wiki/Media_queries) to allow content to adapt to conditions such as screen size or aspect ratio.

For example, you can make the layout on your UI show content stacked in portrait mode and side-by-side in landscape mode.

    :::html
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <style type="text/css">
        .block {
          float: left;
          height: 200px;
          width: 100%;
        }
        @media screen and (min-aspect-ratio: 1/1) {
          /* these styles will only be applied when the viewing area is square or landscape */
          .block {
            width: 50%;
          }
        }
        .box {
          border: 1px solid red;
          width: 100%;
          height: 100%;
        }
      </style>
    </head>
    <body>
      <div class="block"><div class="box">Block 1</div></div>
      <div class="block"><div class="box">Block 2</div></div>
      <div class="block"><div class="box">Block 3</div></div>
    </body>
    </html>
    
Here is how the layout looks in portrait...

![Portrait](http://rhodocs-images.s3.amazonaws.com/guide/screen_orientation/portrait_layout.png)

...and here is how it adapts to landscape

![Landscape](http://rhodocs-images.s3.amazonaws.com/guide/screen_orientation/landscape_layout.png)

##### Responsive design frameworks

There are some CSS frameworks available that are designed to make it easier to use responsive design in your applications. Two of the most popular are:

* [Twitter Bootstrap](http://getbootstrap.com/)
* [Zurb Foundation](http://foundation.zurb.com/)

Both are modern frameworks, designed to take advantage of the latest capabilities of today's mobile browsers. They provide a number of features to shorten your development time while simultaneously making your code more maintainable and future-proof. Particularly if you are developing for more than one screen size, using a responsive framework is highly recommended.

## Related reading

* The [CSS3 Media Queries specification](http://www.w3.org/TR/css3-mediaqueries/) is the formal specification for media queries. 
* [ScreenOrientation API](../api/screenorientation) documentation
* [System API](../api/system) documentation

