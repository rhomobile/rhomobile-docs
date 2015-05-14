# Device Sensors

## Prerequisite

Before you can make use of any sensors on the device, you need to include the `sensor` extension in your `build.yml`

    :::yaml
    extensions: ["sensor"]

## General procedure

The `Sensor` API supports many different types of sensors but, irrespective of the type, there is a common sequence of steps that you must follow in your code.

### Create a sensor instance

To retrieve values from a sensor, first you must create an instance of the sensor by using `makeSensorByType` passing it the sensor type as parameter

Ruby syntax:
    :::ruby
    # create an instance of an accelerometer sensor
    sensor = Rho::Sensor.makeSensorByType(Rho::Sensor::SENSOR_TYPE_ACCELEROMETER)
    if @sensor != nil
        # start data collection
    else
        # the sensor is not present, show error message
    end

JavaScript syntax:
    :::javascript
    // create an instance of an accelerometer sensor
    var sensor = Rho.Sensor.makeSensorByType(Rho.Sensor.SENSOR_TYPE_ACCELEROMETER);
    if (sensor != null) {
        // start data collection
    } else {
        // the sensor is not present, show error message
    }

### Reading the sensor data periodically

#### Setting sensor time period

Set `minimumGap` to the minimum amount of time (specified in milliseconds) between two sensor update events.

Ruby syntax:
    :::ruby
    # set to 500 milliseconds
    sensor.minimumGap = 500

JavaScript syntax:
    :::javascript
    // set to 500 milliseconds
    sensor.minimumGap = 500;
    
#### Start data collection

Call `start` on the instance returned from `makeSensorByType` to initiate data retrieval.

Your callback method will be invoked with a `hash` containing several [sensor callback parameters](http://edgedocs.rhomobile.com/api/sensor#mstart).

Ruby syntax:
    :::ruby
    sensor.start(url_for(:action => :my_sensor_callback))

    def my_sensor_callback
        # @params["status"] contains either "ok" or "error" depending on whether the sensor could be accessed or not
        # In an error occurred, @params["message"] contains an informative message
        # The rest of the hash depends on the type of sensor. For example, the accelerometer will have
        # @params["accelerometer_x"]
        # @params["accelerometer_y"]
        # @params["accelerometer_z"]
        #
        # while a tempterature sensor provides instead
        # @params["temperature_value"]
    end

JavaScript syntax:
    :::javascript
    sensor.start(my_sensor_callback);

    function my_sensor_callback(params) {
        // params.status contains either "ok" or "error" depending on whether the sensor could be accessed or not
        // In an error occurred, @params.message contains an informative message
        // The rest of the hash depends on the type of sensor. For example, the accelerometer will have
        // params.accelerometer_x
        // params.accelerometer_y
        // params.accelerometer_z
        //
        // while a tempterature sensor provides instead
        // params.temperature_value
    }

#### Stop data collection

Once you are done using a sensor, you must stop listening for updates. Call `stop` on the sensor instance to stop the callbacks.

Ruby syntax:
    :::ruby
    sensor.stop

JavaScript syntax:
    :::javascript
    sensor.stop();

### Reading the instantaneous sensor data

To get the instantaneous value from an sensor, use the `readData` method.

The return value is a `hash` containing [Callback Returning Parameters](http://edgedocs.rhomobile.com/api/sensor#mstart).

Ruby syntax:
    :::ruby
    data = sensor.readData

JavaScript syntax:
    :::javascript
    var data = sensor.readData();

### Checking sensor status

The `hash` returned from `readData` or `start` method callback, contains two values that you can use to check the status of the sensor.

* `status` contains the string `ok` or `error`
* `message` contains the error message, only if status=error

Ruby syntax:
    :::ruby
    data = sensor.readData
    if data['status'] == 'error'
        # process the error: log it or inform the user
        puts data['message']
    end

JavaScript syntax:
    :::javascript
    var data = sensor.readData();
    if (data['status'] === 'error') {
        // process the error: log it or inform the user
        console.log(data['message']);
    }

## Accelerometer

The accelerometer sensor returns data about the acceleration forces on the device. This can be motion, gestures, even rotate and tilt movements.

The output of the `Accelerometer`, `Gravity` and `Linear Acceleration` sensors must obey the following relation:

    acceleration = gravity + linear_acceleration

Usage Examples:

* Gesture based UI interactions, for example: shake to reload
* Motion driven games

Ruby syntax:
    :::ruby
    def make_sensor
        @sensor = Rho::Sensor.makeSensorByType(Rho::Sensor::SENSOR_TYPE_ACCELEROMETER)
        if @sensor == nil
            # do something if the sensor is not present, for example: show error message
        end
    end
    
    def read_sensor
        if @sensor != nil
            data = @sensor.readData
            print_data(data)
        end
    end

    def start_sensor
        if @sensor != nil
            @sensor.minimumGap = 500
            @sensor.start(url_for(:action => :sensor_callback))
        end
    end

    def stop_sensor
        if @sensor != nil
            @sensor.stop
        end
    end

    def sensor_callback
        print_data(@params)
    end
    
    def print_data(data)
        puts "The accelerometer detects the following forces along the three spatial axes:"
        puts "X is #{data['accelerometer_x']} m/s^2"
        puts "Y is #{data['accelerometer_y']} m/s^2"
        puts "Z is #{data['accelerometer_z']} m/s^2"
    end

JavaScript syntax:
    :::javascript
    function make_sensor() {
        sensor = Rho.Sensor.makeSensorByType(Rho.Sensor.SENSOR_TYPE_ACCELEROMETER);
        if (sensor == null) {
            // do something if the sensor is not present, for example: show error message
        }
    }
    
    function read_sensor() {
        if (sensor != null) {
            var data = sensor.readData();
            print_data(data);
        }
    }

    function start_sensor() {
        if (sensor != null) {
            sensor.minimumGap = 500;
            sensor.start(sensor_callback);
        }
    }

    function stop_sensor() {
        if (sensor != null) {
            sensor.stop();
        }
    }

    function sensor_callback(data) {
        print_data(data);
    }
    
    function print_data(data) {
        console.log("The accelerometer detects the following forces along the three spatial axes:");
        console.log("X is " + data['accelerometer_x']+" m/s^2");
        console.log("Y is " + data['accelerometer_y']+" m/s^2");
        console.log("Z is " + data['accelerometer_z']+" m/s^2");
    }

## Tilt Angle Sensor

The tilt sensor can measure the tilting of the device.

Usage Examples:

* 3D display which adjusts the view based on the tilt angle, for example: maps with buildings
* Input for games

Ruby syntax:
    :::ruby
    def make_sensor
        @sensor = Rho::Sensor.makeSensorByType(Rho::Sensor::SENSOR_TYPE_TILT_ANGLE)
        if @sensor == nil
            # do something if the sensor is not present, for example: show error message
        end
    end
    
    def read_sensor
        if @sensor != nil
            data = @sensor.readData
            print_data(data)
        end
    end

    def start_sensor
        if @sensor != nil
            @sensor.minimumGap = 500
            @sensor.start(url_for(:action => :sensor_callback))
        end
    end

    def stop_sensor
        if @sensor != nil
            @sensor.stop
        end
    end

    def sensor_callback
        print_data(@params)
    end

    def print_data(data)
        puts "The tilt sensor detects the following orientation of the device in space:"
        puts "X is #{data['tiltangle_x']} degrees"
        puts "Y is #{data['tiltangle_y']} degrees"
        puts "Z is #{data['tiltangle_z']} degrees"
    end

JavaScript syntax:
    :::javascript
    function make_sensor() {
        sensor = Rho.Sensor.makeSensorByType(Rho.Sensor.SENSOR_TYPE_TILT_ANGLE);
        if (sensor == null) {
            // do something if the sensor is not present, for example: show error message
        }
    }
    
    function read_sensor() {
        if (sensor != null) {
            var data = sensor.readData();
            print_data(data);
        }
    }

    function start_sensor() {
        if (sensor != null) {
            sensor.minimumGap = 500;
            sensor.start(sensor_callback);
        }
    }

    function stop_sensor() {
        if (sensor != null) {
            sensor.stop();
        }
    }

    function sensor_callback(data) {
        print_data(data);
    }

    function print_data(data) {
        console.log("The tilt sensor detects the following orientation of the device in space:");
        console.log("X is " + data['tiltangle_x']+" degrees");
        console.log("Y is " + data['tiltangle_y']+" degrees");
        console.log("Z is " + data['tiltangle_z']+" degrees");
    }

## Device Orientation Sensor

The device orientation sensor returns the orientation of the device in string form, "vertical" or "horizontal". This is different from the `Orientation Sensor` which returns the orientation along each axis in degrees.

Usage Examples:

* Handle screen rotation

Ruby syntax:
    :::ruby
    def make_sensor
        @sensor = Rho::Sensor.makeSensorByType(Rho::Sensor::SENSOR_TYPE_DEVICE_ORIENTATION)
        if @sensor == nil
            # do something if the sensor is not present, for example: show error message
        end
    end
    
    def read_sensor
        if @sensor != nil
            data = @sensor.readData
            print_data(data)
        end
    end

    def start_sensor
        if @sensor != nil
            @sensor.minimumGap = 500
            @sensor.start(url_for(:action => :sensor_callback))
        end
    end

    def stop_sensor
        if @sensor != nil
            @sensor.stop
        end
    end

    def sensor_callback
        print_data(@params)
    end

    def print_data(data)
        puts "Device orientation is #{data['deviceorientation_value']}" # either "horizontal" or "vertical"
    end

JavaScript syntax:
    :::javascript
    function make_sensor() {
        sensor = Rho.Sensor.makeSensorByType(Rho.Sensor.SENSOR_TYPE_DEVICE_ORIENTATION);
        if (sensor == null) {
            // do something if the sensor is not present, for example: show error message
        }
    }
    
    function read_sensor() {
        if (sensor != null) {
            var data = sensor.readData();
            print_data(data);
        }
    }

    function start_sensor() {
        if (sensor != null) {
            sensor.minimumGap = 500;
            sensor.start(sensor_callback);
        }
    }

    function stop_sensor() {
        if (sensor != null) {
            sensor.stop();
        }
    }

    function sensor_callback(data) {
        print_data(data);
    }

    function print_data(data) {
        console.log("Device orientation is " + data['deviceorientation_value']); // either "horizontal" or "vertical"
    }

## Motion Sensor

The motion sensor returns data about the motion of the device. In most devices the motion sensor is the same as the accelerometer.

Usage Examples:

* Gesture based UI interactions, for example: wave to navigate back or forward in browser
* Input for games

Ruby syntax:
    :::ruby
    def make_sensor
        @sensor = Rho::Sensor.makeSensorByType(Rho::Sensor::SENSOR_TYPE_MOTION)
        if @sensor == nil
            # do something if the sensor is not present, for example: show error message
        end
    end
    
    def read_sensor
        if @sensor != nil
            data = @sensor.readData
            print_data(data)
        end
    end

    def start_sensor
        if @sensor != nil
            @sensor.minimumGap = 500
            @sensor.start(url_for(:action => :sensor_callback))
        end
    end

    def stop_sensor
        if @sensor != nil
            @sensor.stop
        end
    end

    def sensor_callback
        print_data(@params)
    end

    def print_data(data)
        puts "Motion detected: #{data['motion_value']}"
    end

JavaScript syntax:
    :::javascript
    function make_sensor() {
        sensor = Rho.Sensor.makeSensorByType(Rho.Sensor.SENSOR_TYPE_MOTION);
        if (sensor == null) {
            // do something if the sensor is not present, for example: show error message
        }
    }
    
    function read_sensor() {
        if (sensor != null) {
            var data = sensor.readData();
            print_data(data);
        }
    }

    function start_sensor() {
        if (sensor != null) {
            sensor.minimumGap = 500;
            sensor.start(sensor_callback);
        }
    }

    function stop_sensor() {
        if (sensor != null) {
            sensor.stop();
        }
    }

    function sensor_callback(data) {
        print_data(data);
    }

    function print_data(data) {
        console.log("Motion detected: " + data['motion_value']);
    }

## eCompass

The Zebra eCompass is a tilt compensated electronic compass utilizing an accelerometer and a magnetometer. It returns data about the orientation of the device in relation to the magnetic north of the Earth.

Usage Examples:

* Maps / navigation application
* Real estate - obtain the orientation of a property

Ruby syntax:
    :::ruby
    def make_sensor
        @sensor = Rho::Sensor.makeSensorByType(Rho::Sensor::SENSOR_TYPE_ECOMPASS)
        if @sensor == nil
            # do something if the sensor is not present, for example: show error message
        end
    end
    
    def read_sensor
        if @sensor != nil
            data = @sensor.readData
            print_data(data)
        end
    end

    def start_sensor
        if @sensor != nil
            @sensor.minimumGap = 500
            @sensor.start(url_for(:action => :sensor_callback))
        end
    end

    def stop_sensor
        if @sensor != nil
            @sensor.stop
        end
    end

    def sensor_callback
        print_data(@params)
    end

    def print_data(data)
        puts "Compass reading is #{data['ecompass_value']}"
    end

JavaScript syntax:
    :::javascript
    function make_sensor() {
        sensor = Rho.Sensor.makeSensorByType(Rho.Sensor.SENSOR_TYPE_ECOMPASS);
        if (sensor == null) {
            // do something if the sensor is not present, for example: show error message
        }
    }
    
    function read_sensor() {
        if (sensor != null) {
            var data = sensor.readData();
            print_data(data);
        }
    }

    function start_sensor() {
        if (sensor != null) {
            sensor.minimumGap = 500;
            sensor.start(sensor_callback);
        }
    }

    function stop_sensor() {
        if (sensor != null) {
            sensor.stop();
        }
    }

    function sensor_callback(data) {
        print_data(data);
    }

    function print_data(data) {
        console.log("Compass reading is " + data['ecompass_value']);
    }

## Magnetometer

The magnetometer returns data about the compass direction.

Usage Examples:

* Maps / navigation application
* Real estate - obtain the orientation of a property

Ruby syntax:
    :::ruby
    def make_sensor
        @sensor = Rho::Sensor.makeSensorByType(Rho::Sensor::SENSOR_TYPE_MAGNETOMETER)
        if @sensor == nil
            # do something if the sensor is not present, for example: show error message
        end
    end
    
    def read_sensor
        if @sensor != nil
            data = @sensor.readData
            print_data(data)
        end
    end

    def start_sensor
        if @sensor != nil
            @sensor.minimumGap = 500
            @sensor.start(url_for(:action => :sensor_callback))
        end
    end

    def stop_sensor
        if @sensor != nil
            @sensor.stop
        end
    end

    def sensor_callback
        print_data(@params)
    end

    def print_data(data)
        puts "The magnetometer detects the following magnetic fields in space:"
        puts "X is #{data['magnetometer_x']} microTesla"
        puts "Y is #{data['magnetometer_y']} microTesla"
        puts "Z is #{data['magnetometer_z']} microTesla"
    end

JavaScript syntax:
    :::javascript
    function make_sensor() {
        sensor = Rho.Sensor.makeSensorByType(Rho.Sensor.SENSOR_TYPE_MAGNETOMETER);
        if (sensor == null) {
            // do something if the sensor is not present, for example: show error message
        }
    }
    
    function read_sensor() {
        if (sensor != null) {
            var data = sensor.readData();
            print_data(data);
        }
    }

    function start_sensor() {
        if (sensor != null) {
            sensor.minimumGap = 500;
            sensor.start(sensor_callback);
        }
    }

    function stop_sensor() {
        if (sensor != null) {
            sensor.stop();
        }
    }

    function sensor_callback(data) {
        print_data(data);
    }

    function print_data(data) {
        console.log("The magnetometer detects the following magnetic fields in space:");
        console.log("X is " + data['magnetometer_x']+" microTesla");
        console.log("Y is " + data['magnetometer_y']+" microTesla");
        console.log("Z is " + data['magnetometer_z']+" microTesla");
    }
    
## Gyroscope

The gyroscope returns data about the motion of the device. In most devices the gyroscope is the same as the accelerometer.

Usage Examples:

* UI interactions, for example: even if the device is rotated, keep the view constant
* Input for games

Ruby syntax:
    :::ruby
    def make_sensor
        @sensor = Rho::Sensor.makeSensorByType(Rho::Sensor::SENSOR_TYPE_GYROSCOPE)
        if @sensor == nil
            # do something if the sensor is not present, for example: show error message
        end
    end
    
    def read_sensor
        if @sensor != nil
            data = @sensor.readData
            print_data(data)
        end
    end

    def start_sensor
        if @sensor != nil
            @sensor.minimumGap = 500
            @sensor.start(url_for(:action => :sensor_callback))
        end
    end

    def stop_sensor
        if @sensor != nil
            @sensor.stop
        end
    end

    def sensor_callback
        print_data(@params)
    end
    
    def print_data(data)
        puts "The gyroscope detects the following movement"
        puts "X is #{data['gyroscope_x']} radians/second"
        puts "Y is #{data['gyroscope_y']} radians/second"
        puts "Z is #{data['gyroscope_z']} radians/second"
    end

JavaScript syntax:
    :::javascript
    function make_sensor() {
        sensor = Rho.Sensor.makeSensorByType(Rho.Sensor.SENSOR_TYPE_GYROSCOPE);
        if (sensor == null) {
            // do something if the sensor is not present, for example: show error message
        }
    }
    
    function read_sensor() {
        if (sensor != null) {
            var data = sensor.readData();
            print_data(data);
        }
    }

    function start_sensor() {
        if (sensor != null) {
            sensor.minimumGap = 500;
            sensor.start(sensor_callback);
        }
    }

    function stop_sensor() {
        if (sensor != null) {
            sensor.stop();
        }
    }

    function sensor_callback(data) {
        print_data(data);
    }

    function print_data(data) {
        console.log("The gyroscope detects the following movement");
        console.log("X is " + data['gyroscope_x']+" radians/second");
        console.log("Y is " + data['gyroscope_y']+" radians/second");
        console.log("Z is " + data['gyroscope_z']+" radians/second");
    }

## Ambient Light Sensor

The ambient light sensor returns data about the light level around the device.

Usage Examples:

* Automatic screen dimming

Ruby syntax:
    :::ruby
    def make_sensor
        @sensor = Rho::Sensor.makeSensorByType(Rho::Sensor::SENSOR_TYPE_AMBIENT_LIGHT)
        if @sensor == nil
            # do something if the sensor is not present, for example: show error message
        end
    end
    
    def read_sensor
        if @sensor != nil
            data = @sensor.readData
            print_data(data)
        end
    end

    def start_sensor
        if @sensor != nil
            @sensor.minimumGap = 500
            @sensor.start(url_for(:action => :sensor_callback))
        end
    end

    def stop_sensor
        if @sensor != nil
            @sensor.stop
        end
    end

    def sensor_callback
        print_data(@params)
    end

    def print_data(data)
        puts "Ambient light is #{data['ambientlight_value']}"
    end

JavaScript syntax:
    :::javascript
    function make_sensor() {
        sensor = Rho.Sensor.makeSensorByType(Rho.Sensor.SENSOR_TYPE_AMBIENT_LIGHT);
        if (sensor == null) {
            // do something if the sensor is not present, for example: show error message
        }
    }
    
    function read_sensor() {
        if (sensor != null) {
            var data = sensor.readData();
            print_data(data);
        }
    }

    function start_sensor() {
        if (sensor != null) {
            sensor.minimumGap = 500;
            sensor.start(sensor_callback);
        }
    }

    function stop_sensor() {
        if (sensor != null) {
            sensor.stop();
        }
    }

    function sensor_callback(data) {
        print_data(data);
    }

    function print_data(data) {
        console.log("Ambient light is " + data['ambientlight_value']);
    }

## Proximity Sensor

The proximity sensor returns data about the presence of objects close to the device.

Usage Examples:

* Turn off phone screen during calls if user holds it near the ear

Ruby syntax:
    :::ruby
    def make_sensor
        @sensor = Rho::Sensor.makeSensorByType(Rho::Sensor::SENSOR_TYPE_PROXIMITY)
        if @sensor == nil
            # do something if the sensor is not present, for example: show error message
        end
    end
    
    def read_sensor
        if @sensor != nil
            data = @sensor.readData
            print_data(data)
        end
    end

    def start_sensor
        if @sensor != nil
            @sensor.minimumGap = 500
            @sensor.start(url_for(:action => :sensor_callback))
        end
    end

    def stop_sensor
        if @sensor != nil
            @sensor.stop
        end
    end

    def sensor_callback
        print_data(@params)
    end

    def print_data(data)
        puts "The proximity sensor reports: #{data['proximity_value']}"
    end

JavaScript syntax:
    :::javascript
    function make_sensor() {
        sensor = Rho.Sensor.makeSensorByType(Rho.Sensor.SENSOR_TYPE_PROXIMITY);
        if (sensor == null) {
            // do something if the sensor is not present, for example: show error message
        }
    }
    
    function read_sensor() {
        if (sensor != null) {
            var data = sensor.readData();
            print_data(data);
        }
    }

    function start_sensor() {
        if (sensor != null) {
            sensor.minimumGap = 500;
            sensor.start(sensor_callback);
        }
    }

    function stop_sensor() {
        if (sensor != null) {
            sensor.stop();
        }
    }

    function sensor_callback(data) {
        print_data(data);
    }

    function print_data(data) {
        console.log("The proximity sensor reports: " + data['proximity_value']);
    }

## Proximity Long Range Sensor

The long range proximity sensor returns data about the presence of objects close to the device, but at a range beyond that of the Proximity Sensor.

Usage Examples:

* As a mechanism to turn on the camera in response to an approaching object

Ruby syntax:
    :::ruby
    def make_sensor
        @sensor = Rho::Sensor.makeSensorByType(Rho::Sensor::SENSOR_TYPE_PROXIMITY_LONG_RANGE)
        if @sensor == nil
            # do something if the sensor is not present, for example: show error message
        end
    end
    
    def read_sensor
        if @sensor != nil
            data = @sensor.readData
            print_data(data)
        end
    end

    def start_sensor
        if @sensor != nil
            @sensor.minimumGap = 500
            @sensor.start(url_for(:action => :sensor_callback))
        end
    end

    def stop_sensor
        if @sensor != nil
            @sensor.stop
        end
    end

    def sensor_callback
        print_data(@params)
    end

    def print_data(data)
        puts "The long-range proximity sensor reports: #{data['proximitylongrange_value']}"
    end

JavaScript syntax:
    :::javascript
    function make_sensor() {
        sensor = Rho.Sensor.makeSensorByType(Rho.Sensor.SENSOR_TYPE_PROXIMITY_LONG_RANGE);
        if (sensor == null) {
            // do something if the sensor is not present, for example: show error message
        }
    }
    
    function read_sensor() {
        if (sensor != null) {
            var data = sensor.readData();
            print_data(data);
        }
    }

    function start_sensor() {
        if (sensor != null) {
            sensor.minimumGap = 500;
            sensor.start(sensor_callback);
        }
    }

    function stop_sensor() {
        if (sensor != null) {
            sensor.stop();
        }
    }

    function sensor_callback(data) {
        print_data(data);
    }

    function print_data(data) {
        console.log("The long-range proximity sensor reports: " + data['proximitylongrange_value']);
    }

## Pressure Sensor

The pressure sensor returns data about the barometric or atmospheric pressure around the device.

Usage Examples:

* Weather application

Ruby syntax:
    :::ruby
    def make_sensor
        @sensor = Rho::Sensor.makeSensorByType(Rho::Sensor::SENSOR_TYPE_PRESSURE)
        if @sensor == nil
            # do something if the sensor is not present, for example: show error message
        end
    end
    
    def read_sensor
        if @sensor != nil
            data = @sensor.readData
            print_data(data)
        end
    end

    def start_sensor
        if @sensor != nil
            @sensor.minimumGap = 500
            @sensor.start(url_for(:action => :sensor_callback))
        end
    end

    def stop_sensor
        if @sensor != nil
            @sensor.stop
        end
    end

    def sensor_callback
        print_data(@params)
    end

    def print_data(data)
        puts "The atmospheric pressure is #{data['pressure_value']}"
    end

JavaScript syntax:
    :::javascript
    function make_sensor() {
        sensor = Rho.Sensor.makeSensorByType(Rho.Sensor.SENSOR_TYPE_PRESSURE);
        if (sensor == null) {
            // do something if the sensor is not present, for example: show error message
        }
    }
    
    function read_sensor() {
        if (sensor != null) {
            var data = sensor.readData();
            print_data(data);
        }
    }

    function start_sensor() {
        if (sensor != null) {
            sensor.minimumGap = 500;
            sensor.start(sensor_callback);
        }
    }

    function stop_sensor() {
        if (sensor != null) {
            sensor.stop();
        }
    }

    function sensor_callback(data) {
        print_data(data);
    }

    function print_data(data) {
        console.log("The atmospheric pressure is " + data['pressure_value']);
    }

## Temperature Sensor

The temperature sensor returns data about the atmospheric temperature around the device. In general, readings from sensors should be understood as approximations, but the temperature sensor in particular is prone to additional inaccuracies in several scenarios: some devices get warm while charging, and their temperature may tend to approximate that of the human body after being held or carried in a pocket for a period of time.

Usage Examples:

* Weather application

Ruby syntax:
    :::ruby
    def make_sensor
        @sensor = Rho::Sensor.makeSensorByType(Rho::Sensor::SENSOR_TYPE_TEMPERATURE)
        if @sensor == nil
            # do something if the sensor is not present, for example: show error message
        end
    end
    
    def read_sensor
        if @sensor != nil
            data = @sensor.readData
            print_data(data)
        end
    end

    def start_sensor
        if @sensor != nil
            @sensor.minimumGap = 500
            @sensor.start(url_for(:action => :sensor_callback))
        end
    end

    def stop_sensor
        if @sensor != nil
            @sensor.stop
        end
    end

    def sensor_callback
        print_data(@params)
    end

    def print_data(data)
        puts "Temperature is #{data['temperature_value']} degrees Celsius"
    end

JavaScript syntax:
    :::javascript
    function make_sensor() {
        sensor = Rho.Sensor.makeSensorByType(Rho.Sensor.SENSOR_TYPE_TEMPERATURE);
        if (sensor == null) {
            // do something if the sensor is not present, for example: show error message
        }
    }
    
    function read_sensor() {
        if (sensor != null) {
            var data = sensor.readData();
            print_data(data);
        }
    }

    function start_sensor() {
        if (sensor != null) {
            sensor.minimumGap = 500;
            sensor.start(sensor_callback);
        }
    }

    function stop_sensor() {
        if (sensor != null) {
            sensor.stop();
        }
    }

    function sensor_callback(data) {
        print_data(data);
    }

    function print_data(data) {
        console.log("Temperature is " + data['temperature_value']+" degrees Celsius");
    }

## Humidity Sensor

The humidity sensor returns data about the atmospheric humidity level around the device.

Usage Examples:

* Weather application

Ruby syntax:
    :::ruby
    def make_sensor
        @sensor = Rho::Sensor.makeSensorByType(Rho::Sensor::SENSOR_TYPE_HUMIDITY)
        if @sensor == nil
            # do something if the sensor is not present, for example: show error message
        end
    end
    
    def read_sensor
        if @sensor != nil
            data = @sensor.readData
            print_data(data)
        end
    end

    def start_sensor
        if @sensor != nil
            @sensor.minimumGap = 500
            @sensor.start(url_for(:action => :sensor_callback))
        end
    end

    def stop_sensor
        if @sensor != nil
            @sensor.stop
        end
    end

    def sensor_callback
        print_data(@params)
    end

    def print_data(data)
        puts "Humidity is #{data['humidity_value']}"
    end

JavaScript syntax:
    :::javascript
    function make_sensor() {
        sensor = Rho.Sensor.makeSensorByType(Rho.Sensor.SENSOR_TYPE_HUMIDITY);
        if (sensor == null) {
            // do something if the sensor is not present, for example: show error message
        }
    }
    
    function read_sensor() {
        if (sensor != null) {
            var data = sensor.readData();
            print_data(data);
        }
    }

    function start_sensor() {
        if (sensor != null) {
            sensor.minimumGap = 500;
            sensor.start(sensor_callback);
        }
    }

    function stop_sensor() {
        if (sensor != null) {
            sensor.stop();
        }
    }

    function sensor_callback(data) {
        print_data(data);
    }

    function print_data(data) {
        console.log("Humidity is " + data['humidity_value']);
    }

## Gravity Sensor

The gravity sensor returns data about the acceleration due to gravity when the device is at rest or moving slowly.

The output of the `Accelerometer`, `Gravity` and `Linear Acceleration` sensors must obey the following relation:

    acceleration = gravity + linear_acceleration

Usage Examples:

* Orientating application UI
* Input for games

Ruby syntax:
    :::ruby
    def make_sensor
        @sensor = Rho::Sensor.makeSensorByType(Rho::Sensor::SENSOR_TYPE_GRAVITY)
        if @sensor == nil
            # do something if the sensor is not present, for example: show error message
        end
    end
    
    def read_sensor
        if @sensor != nil
            data = @sensor.readData
            print_data(data)
        end
    end

    def start_sensor
        if @sensor != nil
            @sensor.minimumGap = 500
            @sensor.start(url_for(:action => :sensor_callback))
        end
    end

    def stop_sensor
        if @sensor != nil
            @sensor.stop
        end
    end

    def sensor_callback
        print_data(@params)
    end

    def print_data(data)
        puts "The gravity sensor detects the following acceleration:"
        puts "X is #{data['gravity_x']} m/s^2"
        puts "Y is #{data['gravity_y']} m/s^2"
        puts "Z is #{data['gravity_z']} m/s^2"
    end

JavaScript syntax:
    :::javascript
    function make_sensor() {
        sensor = Rho.Sensor.makeSensorByType(Rho.Sensor.SENSOR_TYPE_GRAVITY);
        if (sensor == null) {
            // do something if the sensor is not present, for example: show error message
        }
    }
    
    function read_sensor() {
        if (sensor != null) {
            var data = sensor.readData();
            print_data(data);
        }
    }

    function start_sensor() {
        if (sensor != null) {
            sensor.minimumGap = 500;
            sensor.start(sensor_callback);
        }
    }

    function stop_sensor() {
        if (sensor != null) {
            sensor.stop();
        }
    }

    function sensor_callback(data) {
        print_data(data);
    }

    function print_data(data) {
        console.log("The gravity sensor detects the following acceleration:");
        console.log("X is " + data['gravity_x']+" m/s^2");
        console.log("Y is " + data['gravity_y']+" m/s^2");
        console.log("Z is " + data['gravity_z']+" m/s^2");
    }

## Linear Acceleration Sensor

The linear acceleration sensor returns data about acceleration on the device due to motion (excluding the effect of gravity).

The output of the `Accelerometer`, `Gravity` and `Linear Acceleration` sensors must obey the following relation:

    acceleration = gravity + linear_acceleration

Usage Examples:

* Input for UI interactions, for example: wave phone to go back or forward in a browser
* Input for games

Ruby syntax:
    :::ruby
    def make_sensor
        @sensor = Rho::Sensor.makeSensorByType(Rho::Sensor::SENSOR_TYPE_LINEAR_ACCELERATION)
        if @sensor == nil
            # do something if the sensor is not present, for example: show error message
        end
    end
    
    def read_sensor
        if @sensor != nil
            data = @sensor.readData
            print_data(data)
        end
    end

    def start_sensor
        if @sensor != nil
            @sensor.minimumGap = 500
            @sensor.start(url_for(:action => :sensor_callback))
        end
    end

    def stop_sensor
        if @sensor != nil
            @sensor.stop
        end
    end

    def sensor_callback
        print_data(@params)
    end

    def print_data(data)
        puts "The linear accelerator sensor detects the following forces:"
        puts "X is #{data['linearacceleration_x']} m/s^2"
        puts "Y is #{data['linearacceleration_y']} m/s^2"
        puts "Z is #{data['linearacceleration_z']} m/s^2"
    end

JavaScript syntax:
    :::javascript
    function make_sensor() {
        sensor = Rho.Sensor.makeSensorByType(Rho.Sensor.SENSOR_TYPE_LINEAR_ACCELERATION);
        if (sensor == null) {
            // do something if the sensor is not present, for example: show error message
        }
    }
    
    function read_sensor() {
        if (sensor != null) {
            var data = sensor.readData();
            print_data(data);
        }
    }

    function start_sensor() {
        if (sensor != null) {
            sensor.minimumGap = 500;
            sensor.start(sensor_callback);
        }
    }

    function stop_sensor() {
        if (sensor != null) {
            sensor.stop();
        }
    }

    function sensor_callback(data) {
        print_data(data);
    }

    function print_data(data) {
        console.log("The linear accelerator sensor detects the following forces:");
        console.log("X is " + data['linearacceleration_x']+" m/s^2");
        console.log("Y is " + data['linearacceleration_y']+" m/s^2");
        console.log("Z is " + data['linearacceleration_z']+" m/s^2");
    }

## Rotation Sensor

The rotation sensor returns data about the rotation of the device along the three dimensional axes.

Usage Examples:

* Input for UI interactions
* Input for games

Ruby syntax:
    :::ruby
    def make_sensor
        @sensor = Rho::Sensor.makeSensorByType(Rho::Sensor::SENSOR_TYPE_ROTATION)
        if @sensor == nil
            # do something if the sensor is not present, for example: show error message
        end
    end
    
    def read_sensor
        if @sensor != nil
            data = @sensor.readData
            print_data(data)
        end
    end

    def start_sensor
        if @sensor != nil
            @sensor.minimumGap = 500
            @sensor.start(url_for(:action => :sensor_callback))
        end
    end

    def stop_sensor
        if @sensor != nil
            @sensor.stop
        end
    end

    def sensor_callback
        print_data(@params)
    end

    def print_data(data)
        puts "The rotation sensor detects the following rotation on each axis:"
        puts "X is #{data['rotation_x']} degrees"
        puts "Y is #{data['rotation_y']} degrees"
        puts "Z is #{data['rotation_z']} degrees"
    end

JavaScript syntax:
    :::javascript
    function make_sensor() {
        sensor = Rho.Sensor.makeSensorByType(Rho.Sensor.SENSOR_TYPE_ROTATION);
        if (sensor == null) {
            // do something if the sensor is not present, for example: show error message
        }
    }
    
    function read_sensor() {
        if (sensor != null) {
            var data = sensor.readData();
            print_data(data);
        }
    }

    function start_sensor() {
        if (sensor != null) {
            sensor.minimumGap = 500;
            sensor.start(sensor_callback);
        }
    }

    function stop_sensor() {
        if (sensor != null) {
            sensor.stop();
        }
    }

    function sensor_callback(data) {
        print_data(data);
    }

    function print_data(data) {
        console.log("The rotation sensor detects the following rotation on each axis:");
        console.log("X is " + data['rotation_x']+" degrees");
        console.log("Y is " + data['rotation_y']+" degrees");
        console.log("Z is " + data['rotation_z']+" degrees");
    }

## Orientation Sensor

The orientation sensor returns the orientation of the device in 3D space. It is different from the Device Orientation Sensor in that it returns a value for each axis, instead of only the strings `"horizontal"` or `"vertical"`

Usage Examples:

* Input for UI interactions
* Input for games

Ruby syntax:
    :::ruby
    def make_sensor
        @sensor = Rho::Sensor.makeSensorByType(Rho::Sensor::SENSOR_TYPE_ORIENTATION)
        if @sensor == nil
            # do something if the sensor is not present, for example: show error message
        end
    end
    
    def read_sensor
        if @sensor != nil
            data = @sensor.readData
            print_data(data)
        end
    end

    def start_sensor
        if @sensor != nil
            @sensor.minimumGap = 500
            @sensor.start(url_for(:action => :sensor_callback))
        end
    end

    def stop_sensor
        if @sensor != nil
            @sensor.stop
        end
    end

    def sensor_callback
        print_data(@params)
    end

    def print_data(data)
        puts "The orientation sensor detects the following values for each axis:"
        puts "X is #{data['orientation_x']} degrees"
        puts "Y is #{data['orientation_y']} degrees"
        puts "Z is #{data['orientation_z']} degrees"
    end

JavaScript syntax:
    :::javascript
    function make_sensor() {
        sensor = Rho.Sensor.makeSensorByType(Rho.Sensor.SENSOR_TYPE_ORIENTATION);
        if (sensor == null) {
            // do something if the sensor is not present, for example: show error message
        }
    }
    
    function read_sensor() {
        if (sensor != null) {
            var data = sensor.readData();
            print_data(data);
        }
    }

    function start_sensor() {
        if (sensor != null) {
            sensor.minimumGap = 500;
            sensor.start(sensor_callback);
        }
    }

    function stop_sensor() {
        if (sensor != null) {
            sensor.stop();
        }
    }

    function sensor_callback(data) {
        print_data(data);
    }

    function print_data(data) {
        console.log("The orientation sensor detects the following values for each axis:");
        console.log("X is " + data['orientation_x']+" degrees");
        console.log("Y is " + data['orientation_y']+" degrees");
        console.log("Z is " + data['orientation_z']+" degrees");
    }

## Related reading

* The [Sensor API reference](../api/sensor) contains more details about device sensors
