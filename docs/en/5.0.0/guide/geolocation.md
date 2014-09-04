# Geolocation

## Overview
Geolocation information is available in two ways: as an asynchronous service through Ajax calls to a predefined local URL, or in a controller using Ruby calls to the Geolocation class.

You need to enable the GPS capability to use Geolocation. This is done by adding the following line to build.yml:

	:::yaml
	capabilities:
	  - gps

See the [Configuration](build_config) section for more details.

The GPS receiver consumes a significant amount of energy, and should be switched off most of the time in order to preserve the device's battery life.
Any call to Geolocation method or notification call back will power up the GPS receiver.
The GPS receiver will be switched off automatically after some time (see [Configuration](build_config) for parameters) or explicitly by Geolocation.turnoff.
Also note that it usually takes a while to acquire the device's current position; in some cases, it may take several minutes and may not work at all indoors.

Note that in old rhodes versions (up to 2.3.1) this feature uses only GPS location provider. In more recent rhodes, it also uses network based location determination. Network based location
is not as precise as GPS, but in most cases it consumes less power and returns results faster than GPS.
Rhodes will update location using network data until the GPS signal has been received; then only GPS will be used for more precise data.

There are two ways to use Geolocation:

 * Synchronous call to Geolocation module for particular value.
 * Set Geolocation notification (geoLocation.set_notification) and track location by the notification callback. In this case all location values are passed to notification as parameters in a @param variable.

Note that Geolocation is switched off automatically when the application goes into the background, and is switched on as the application goes back to foreground.
However it is possible to switch on location services as usual while the application is in background.

## Asynchronous Ajax calls

The Rhodes framework provides a simple HTML tag for accessing Geolocation information. To use it, include the appropriate JavaScript library on your page:

* For iPhone, Android: `/public/jquery/jquery-1.6.2.min.js` and `/public/js/rhogeolocation.js`
* For Windows Mobile: `/public/js/rhogeolocation-wm.js`

Then add one of the following tags in the appropriate location in your HTML: `<geolocation/>`, `<geolatitude/>` or `<geolongitude/>`. The included JavaScript will query a predefined URL and fill these tags with location information.

`<geolocation/>` - returns a string in the form `[formatted position];[latitude];[longitude]`. 

For example: 37.3317° North, 122.0307° West;37.331689;-122.030731

`<geolatitude/>` - returns just the latitude <br/>
`<geolongitude/>` - returns just the longitude

## Geolocation API

Refer to the [Geolocation API](../api/geolocation) for the methods to access geolocation information from your device.

* [accuracy](../api/geolocation#accuracy) - Returns the estimated accuracy of the fix.
* [altitude](../api/geolocation#altitude) - Returns the altitude if available, if not available 0 is returned.
* [haversine_distance](../api/geolocation#haversinedistance) - Returns the distance between two points in miles.
* [known_position?, is_known_position](../api/geolocation#knownposition-isknownposition) - Returns true if the location system is up and running, false otherwise, null if this feature is not supported on the device platform.
* [latitude](../api/geolocation#latitude) - Returns current latitude in degrees.
* [longitude](../api/geolocation#longitude) - Returns current longitude in degrees.
* [satellites](../api/geolocation#satellites) - Returns the number of satellites used to determine the fix. If this information isn't available, null is returned.
* [set_notification](../api/geolocation#setnotification) - Set callback to track location changes.
* [set_notification_ex](../api/geolocation#setnotificationex) - Extended notification which encompasses the recently added features.
* [speed](../api/geolocation#speed) - Returns the speed if it is available. If the speed is not available, 0.0 is returned.
* [turnoff](../api/geolocation#turnoff) - Turn off Geolocation.

**NOTE: On iOS and Android, real GPS starts working after the first access to the Geolocation module. Real GPS hardware is switched off after a call to Geolocation.turnoff. But keep in mind - any call to Geolocation, such as getting latitude, starts the hardware GPS again!**

## Testing Geolocation

While developing your application on Windows Mobile emulator, you may find the [FakeGPS](http://msdn.microsoft.com/en-us/library/bb158722.aspx) utility useful.

To provide Mock Location Data on Android, see [here](http://developer.android.com/guide/topics/location/index.html)

## Samples

Here are some examples of Geolocation Ruby code.<a id="geolocation-setnotification-ex" />

### Tracking location all the time
You may decide to keep track of your position right after application starts. To do that, add following to your application.rb:

	:::ruby
    class AppApplication < Rho::RhoApplication
      def on_activate_app
        #start geolocation
        Geolocation.set_notification("/app/Settings/geo_callback", "", 3)
      end
    end

Callback points to the `geo_callback` in the Settings controller.rb:
    
	:::ruby
    class SettingsController < Rho::RhoController
      def geo_callback
        puts "geo_callback : #{@params}"
		# do something on position changes
		#...
      end
    end

### Requiring location only on a specific view

	:::ruby
    def show_location
	  # check if we know our position	
      if !Geolocation.known_position?
		# wait till GPS receiver acquire position
        Geolocation.set_notification( url_for(:action => :geo_callback), "")
        redirect url_for(:action => :wait)
      else
		# show position
        render
      end
    end
    
    def geo_callback
      # navigate to `show_location` page if GPS receiver acquire position  
	  if @params['known_position'].to_i != 0 && @params['status'] =='ok'
	  
	  	Geolocation.set_notification '', '', 2
	  	WebView.navigate url_for(:action => :map_all)
	  end
    end

### Turning off Geolocation as soon as the app goes off the device front page

In this code sample, /Geolocation/ has to be replaced with an appropriate regular expression to detect the controller. This code is called from geo_callback. This decision allows you to switch off Geolocation from a single code point in case geo_callback is set.

	:::ruby
	def geo_callback
	  puts "geo_callback : #{@params}"

	  if WebView.current_location !~ /Geolocation/
	    puts "Stopping geo location since we are away of geo page: " + WebView.current_location
	    Geolocation.turnoff
	    return
	  end
	end

If the app does not need location updates, and Geolocation should still remain active, you can send an empty notification.

	:::ruby
	Geolocation.set_notification "", "", 30