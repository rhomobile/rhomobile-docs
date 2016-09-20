# Device Hardware Key Handling

**NOTE: This guide covers the keyboard backlight and other notification capabilities such as vibration and LEDs. If you are looking for information on capturing or recognizing keypresses, look at [KeyCapture API](../api/keycapture)**

## Notification

### What is a Notification

A [Notification](../api/Notification) is the means of informing the user that some event has occurred that requires their attention. For example, it could be the arrival of an Email/SMS or an alarm clock going off. A notification could be in the form of a popup, a sound played over the device speaker, using a hardware capability of the device (i.e., vibration) or a combination of these.

### The types of Notification

#### Audio file

You can playback an MP3 or WAV audio file if the device supports it.

Ruby syntax:
    :::ruby
    Rho::Notification.playFile('/sdcard/media/ringtone.mp3')
    
JavaScript syntax:
    :::javascript
    Rho.Notification.playFile("/sdcard/media/ringtone.mp3");

#### Beep

If the device is equipped with a hardware beeper, it can be made to sound at a specified frequency, volume and duration

Ruby syntax:
    :::ruby
    Rho::Notification.beep({ :frequency => 4000, :volume => 3, :duration => 1000 })
    
JavaScript syntax:
    :::javascript
    Rho.Notification.beep({ frequency: 4000, volume: 3, duration: 1000 });

#### Vibrate

The device can be made to vibrate for a specified duration

Ruby syntax:
    :::ruby
    Rho::Notification.vibrate(1000)
    
JavaScript syntax:
    :::javascript
    Rho.Notification.vibrate(1000);

#### LED

A device might have one or more LEDs on it; these can be controlled with the [LED](../api/Notification.Led) API

##### LED On/Off

A LED on the device can be turned "On" or "Off" as required

Ruby syntax:
    :::ruby
    # get the list of LEDs available on the device
    leds = Rho::Notification::Led.enumerate
    
    # turn one of the LEDs on
    led = leds[0]
    led.illuminate
    
JavaScript syntax:
    :::javascript
    // get the list of LEDs available on the device
    var leds = Rho.Notification.Led.enumerate();
    
    // turn one of the LEDs on
    var led = leds[0];
    led.illuminate();

##### LED Flashing

A LED on the device can be made to cycle "On" and "Off" a specified number of times

Ruby syntax:
    :::ruby
    # get the list of LEDs available on the device
    leds = Rho::Notification::Led.enumerate
    
    # flash one of the LEDs
    leds[0].flash({ :onDuration => 1000, :offDuration => 500, :numberOfCycles => 10 })
    
JavaScript syntax:
    :::javascript
    // get the list of LEDs available on the device
    var leds = Rho.Notification.Led.enumerate();
    
    // flash one of the LEDs
    leds[0].flash({ onDuration: 1000, offDuration: 500, numberOfCycles: 10 });

#### Popup

You can bring the application to the foreground and show a message in a popup window. The message can be passed as a string or a hash. The popup window closes after you click on the button or you can close it by using the `hidePopup` method

Ruby syntax:
    :::ruby
    # simple message string
    Rho::Notification.showPopup("Hello!")
    
    # custom tite and icon with the message string
    Rho::Notification.showPopup({ :title => "Greeting", :message => "Hello!", :icon => "/sdcard/images/icon.png" })
    
    # hide the current popup
    Rho::Notification.hidePopup()
    
JavaScript syntax:
    :::javascript
    // simple message string
    Rho.Notification.showPopup("Hello!");
    
    // custom tite and icon with the message string
    Rho.Notification.showPopup({ title: "Greeting", message: "Hello!", icon: "/sdcard/images/icon.png" });
    
    // hide the current popup
    Rho.Notification.hidePopup();

#### Status message

You can display a window containing a status message. The window closes after the user clicks on its hide button.

Ruby syntax:
    :::ruby
    Rho::Notification.showStatus("The Title", "This is the status message", "Close")
    
JavaScript syntax:
    :::javascript
    Rho.Notification.showStatus("The Title", "This is the status message", "Close");

### Example scenarios for using Notification

Your approach to notifications should correspond to the importance of the event you are notifying. For example, an incoming e-mail may be well served with a single beep or vibration, while a pager alert may have a high severity and warrant periodic notifications until the user acknowledges the message. Here are some high-level guidelines, make sure to adapt them to your situation:

#### In an email/messaging/newsfeed/twitter or similar type of application

* Use the `Beep` and/or `Vibrate` only once for notifying the user immediately on the arrival of a new message.
* Use a flashing `LED` to serve as a reminder to the user about the message after the initial `Beep`/`Vibrate` notification till the user views/acknowledges the message.

#### Alarm clock or countdown timer

* Use a long `Beep` and/or `Vibrate` till user stops/cancels the alarm/timer.

### Best practices

* `Popup` notifications can be annoying to the user if used frequently. Try not to interrupt the user's operational flow if you can help it.
* The `Beep` and `Vibrate` notifications can be annoying to the user and others around them if used frequently or for prolonged durations but for that same reason, they can be very effective if the message deserves it.
* `LED` notification can be made to blink for a reasonably long time (even hours after the event initially happens) with little disturbance. They are very popular for information that is good to know but does not require immediate action.


## Related reading

* The [Notification API reference](../api/Notification) has all the details on the parameters applicable to each notification type.
* The [LED Notification API reference](../api/Notification.Led) contains the documentation about using device LEDs.
