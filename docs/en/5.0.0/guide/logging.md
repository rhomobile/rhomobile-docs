# Logging
There are two methods to log messages.

From any controller you can log using the methods app_info and app_error. These methods take a string and will write that to rholog.txt with the category of your controllers name.

Call app_info and app_error from a method in your controller:

    :::ruby
    def index
        app_info "My info message"
        app_error "My error message"
    end

There also is a logging Ruby class called RhoLog. This class has methods info and error which take 2 strings. The first string is the category, the second string is the message.

The [Rho.Log API](../api/Log) has methods to print error messages. Click the links below for detailed information about the methods.

 * [info](../api/Log#minfo) - Print an information message in the rholog.txt file.
 * [error](../api/Log#merror) - Print an error message in the rholog.txt file. The message will have an “ERROR” prefix.

Call the RhoLog error or info methods from a method in your Rhodes app:

Ruby

    :::ruby
    def index
        Rho::Log.error("Some error message", "Some Category")
        Rho::Log.info("Some info message", "Some Category")
    end

JavaScript

    :::javascripr
    Rho.Log.error("Some error message", "Some Category");
    Rho.Log.info("Some info message", "Some Category");

Additionally all common ruby output routines (like puts, print) are redirected to rhodes log with INFO level.

In rholog.txt the lines appear as follows:

    <Timestamp> <message> | <category>

To enable remote logging just add the line to `rhoconfig.txt`:

    rhologurl = 'http://<host>:<port>[/path]'

Then all log messages will be sent to the specified URL via POST HTTP-requests.

You can also send log to remote server manually: Log server address where log will be posted by using RhoConf.send_log or from the log view. Log server source code is open and available at <http://github.com/rhomobile/rhologs>, so you can deploy your own logserver.

Add the lines to `rhoconfig.txt`:

    logserver = 'http://rhologs.heroku.com'
    logname='helloworld'

Then call RhoConf.send_log:

    :::ruby
    def index
        Rho::RhoConf.send_log()
    end


See [Log Configuration](runtime_config#rhoconfigtxt) for all Logging configuration parameters.

## How see log messages from iOS device.

You have next ways for get log from iOS device :

1. See full console output

* open XCode
* open Organizer ("window" submenu in top menu)
* select "Devices" tab
* select your connected device in left panel
* select "Console"

2. Get the rholog.txt file from device

* open XCode
* open Organizer ("window" submenu in top menu)
* select "Devices" tab
* select your connected device in left panel
* select "Applications"
* select your application and wait few seconds
* you can select local file in your application's local folder and download it to computer - use "Download" button in bottom panel

3. Send log to server from application