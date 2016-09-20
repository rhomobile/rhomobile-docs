# Device information and abilities

When creating applications that need to run on a varied range of device hardware and software versions, you might want to enable or disable features based on the presence of certain abilities in the device. You can do that by making use of the [System API](../api/system) to query for device information and various capabilities

## Platform and version

Your RhoMobile application can run without modifications on multiple platforms, but you may still want to add some platform specific enhancements or have to interact with the OS directly for certain functionality. In these circumstances, you can check which platform the application is running on and act accordingly.

Ruby syntax:
    :::ruby
    platform = Rho::System.platform

JavaScript syntax:
    :::javascript
    var platform = Rho.System.platform;

The platform can be one of the following string values:


* WINDOWS
* ANDROID
* APPLE
* WP8
* WINDOWS_DESKTOP

In addition to getting the platform, it is also possible to retrieve the Operating System version. For example, you can get back version strings like ‘5.0’ (iPhone), ‘2.2’ (Android)

Ruby syntax:
    :::ruby
    os_version = Rho::System.osVersion

JavaScript syntax:
    :::javascript
    var os_version = Rho.System.osVersion;

## Screen information

### Touch screen

If the application is running on a touch screen device, you can selectively activate some features or show some UI elements (for example: buttons).

Ruby syntax:
    :::ruby
    touch_screen = Rho::System.hasTouchscreen
    if touch_screen
        # show some buttons for the user to directly trigger some actions
    end

JavaScript syntax:
    :::javascript
    var touch_screen = Rho.System.hasTouchscreen;
    if (touch_screen) {
        // show some buttons for the user to directly trigger some actions
    }

### Screen dimensions

The size of the device screen is typically used to customize the application UI for a better user experience instead of a fixed one-size-fits-all approach. Knowing the screen width and height can also be useful when using the [Keystate](../api/keystate) and [Battery](../api/battery) APIs, which can set a visible icon on the screen at a particular position. CSS media queries can often result in a more maintainable solution than manually altering the UI in code, but the capability is there if you need it.

There are two sets of sizes for a device screen:

* logical pixels size - use this measure for setting coordinates on screen
* real pixels size - actual number of pixels in the screen

Ruby syntax:
    :::ruby
    screen_width = Rho::System.screenWidth
    screen_height = Rho::System.screenHeight
    real_screen_width = Rho::System.realScreenWidth
    real_screen_height = Rho::System.realScreenHeight
    
JavaScript syntax:
    :::javascript
    var screen_width = Rho.System.screenWidth;
    var screen_height = Rho.System.screenHeight;
    var real_screen_width = Rho.System.realScreenWidth;
    var real_screen_height = Rho.System.realScreenHeight;

It is also possible to calculate the physical size of the screen by querying for the PPI (Pixels Per Inch) value.
    
Ruby syntax:
    :::ruby
    real_screen_width = Rho::System.realScreenWidth
    real_screen_height = Rho::System.realScreenHeight
    physical_screen_width = real_screen_width / Rho::System.ppiY
    physical_screen_height = real_screen_height / Rho::System.ppiX

JavaScript syntax:
    :::javascript
    var real_screen_width = Rho.System.realScreenWidth;
    var real_screen_height = Rho.System.realScreenHeight;
    var physical_screen_width = real_screen_width / Rho.System.ppiY;
    var physical_screen_height = real_screen_height / Rho.System.ppiX;

### Screen orientation

The orientation of the device screen can be used to change the UI layout programmatically (although it is also possible to use CSS media queries to do this)

The platform can be one of the following strings:

* portrait
* landscape

Ruby syntax:
    :::ruby
    screen_orientation = Rho::System.screenOrientation

JavaScript syntax:
    :::javascript
    var screen_orientation = Rho.System.screenOrientation;

### Screen auto rotate

You can check if auto rotation is enabled on the device.

Ruby syntax:
    :::ruby
    auto_rotate = Rho::System.screenAutoRotate

JavaScript syntax:
    :::javascript
    var auto_rotate = Rho.System.screenAutoRotate;

## Device Identification

There are certain properties of the device that your application can use to uniquely identify the device even across reinstalls.

* phoneId – returns hardware based id. It depends on capabilities configured for an application and has to remain same even across application uninstall/install.
* deviceOwnerEmail – primary email of phone owner (works only on Android)
* deviceOwnerName – name(account name) of phone owner (works only on Android)

Ruby syntax:
    :::ruby
    phone_id = Rho::System.phoneId
    device_owner_email = Rho::System.deviceOwnerEmail
    device_owner_name = Rho::System.deviceOwnerName

JavaScript syntax:
    :::javascript
    var phone_id = Rho.System.phoneId;
    var device_owner_email = Rho.System.deviceOwnerEmail;
    var device_owner_name = Rho.System.deviceOwnerName;

## Detecting the presence of hardware features

### Camera

If you want to detect the presence of a camera, your application needs to enable the `camera` capability. Do this by adding that capability to the build.yml file:

    :::yaml
    capabilities:
        - camera

Then you can check if the device has a camera:

Ruby syntax:
    :::ruby
    has_camera = Rho::System.hasCamera
    if has_camera
        # do something with camera
    end

JavaScript syntax:
    :::javascript
    var has_camera = Rho.System.hasCamera;
    if (has_camera) {
        // do something with camera
    }

### Cell network / Wifi

The device running your application may be offline or connected to a cellular, Wifi or other network. You can query the network status by using the [Network API](../api/Network)

Ruby syntax:
    :::ruby
    has_network = Rho::Network.hasNetwork
    if has_network
        has_cell_network = Rho::Network.hasCellNetwork
        has_wifi_network = Rho::Network.hasWifiNetwork
    end

JavaScript syntax:
    :::javascript
    var has_network = Rho.Network.hasNetwork;
    if (has_network) {
        var has_cell_network = Rho.Network.hasCellNetwork;
        var has_wifi_network = Rho.Network.hasWifiNetwork;
    }

### Sensors

The device might provide sensors from the types listed below:
    
* accelerometer
* tilt angle
* device orientation
* motion
* eCompass
* mangetometer
* gyroscope
* ambient light
* proximity
* proximity long range
* pressure
* temperature
* humidity
* gravity
* linear acceleration
* rotation
* orientation

To check if a particular sensor is supported by the device, try creating an instance of the sensor using the [Sensor API](../api/sensor); if the sensor exists in the device, the return value will not be `nil`.

For example:

Ruby syntax:
    :::ruby
    
    sensor = Rho::Sensor.makeSensorByType(Rho::Sensor::SENSOR_TYPE_ACCELEROMETER)
    if sensor != nil
       # do something with the sensor
       
       sensor.stop
    end       

JavaScript syntax:

    var sensor = Rho.Sensor.makeSensorByType(Rho.Sensor.SENSOR_TYPE_ACCELEROMETER);
    if (sensor) {
        // do something with the sensor

        sensor.stop();
    }
    
### Barcode

You can use the camera or dedicated barcode scanner in the device to scan barcodes.

In order to use this API you must include the following extension in your `build.yml`
    :::ruby
    extensions: ["barcode"]

The `barcode` extension is also included automatically if you specify the following in your `build.yml`
    :::ruby
    app_type: "rhoelements"

Then you can use the [Barcode API](../api/barcode) `enumerate` method to get a list of barcode scanners on the device

Ruby syntax:
    :::ruby
    Rho::Barcode.enumerate(url_for(:action => :enumerate_callback))

JavaScript syntax:
    :::javascript
    Rho.Barcode.enumerate(enumerate_callback)

### CardReader

RhoMobile supports integrated and add-on magnetic stipe card readers on Zebra Technologies devices. The [CardReader API](../api/cardreader) `enumerate` method allows you to get a list of the available card readers.

Ruby syntax:
    :::ruby
    Rho::CardReader.enumerate(url_for(:action => :enumerate_callback))

JavaScript syntax:
    :::javascript
    Rho.CardReader.enumerate(enumerate_callback)

### Bluetooth

Bluetooth allows you to create short-range wireless connections between the device your application is running on and another bluetooth enabled device like phone, tablet, PC, or external Bluetooth device (for example external Bluetooth GPS device).

To access bluetooth functions in your application, you need to enable the bluetooth capability in your build.yml file:

    :::yaml
    capabilities:
        - bluetooth

Then you can use the [BluetoothManager API](../rhodesapi/bluetoothmanager-api) `is_bluetooth_available` method to check if Bluetooth is available on the device

Ruby syntax:
    :::ruby
    Rho::BluetoothManager.is_bluetooth_available

JavaScript syntax:
    :::javascript
    Rho.BluetoothManager.is_bluetooth_available()

**NOTE: on iOS, Bluetooth connectivity is only allowed with another device also running iOS or an accessory that has been officially approved by Apple**

### Zebra Device

You can check if the device running the application is a Zebra device which has additional device capabilities such as hardware barcode scanner, magnetic stripe reader, etc.

Ruby syntax:
    :::ruby
    is_motorola_device = Rho::System.isMotorolaDevice
    if is_motorola_device
        # do something with Zebra device specific capabilities
    end

JavaScript syntax:
    :::javascript
    var is_motorola_device = Rho.System.isMotorolaDevice;
    if (is_motorola_device) {
        // do something with Zebra device specific capabilities
    }
           
### RhoSimulator

You can check if the application is running on the RhoSimulator and enable certain code during developement (for example, you can show extra alerts to help with debugging only inside the simulator but not on a real device or avoid showing a login screen).

Ruby syntax:
    :::ruby
    is_rho_simulator = Rho::System.isRhoSimulator
    if is_rho_simulator
        # do something special for the simulator
    end

JavaScript syntax:
    :::javascript
    var is_rho_simulator = Rho.System.isRhoSimulator;
    if (is_rho_simulator) {
        // do something special for the simulator
    }
           
### Emulator

It is also possible to check if the application is running on the platform emulator.

Ruby syntax:
    :::ruby
    is_emulator = Rho::System.isEmulator
    if is_emulator
        # do something special for the emulator
    end

JavaScript syntax:
    :::javascript
    var is_emulator = Rho.System.isEmulator;
    if (is_emulator) {
        // do something special for the emulator
    }
