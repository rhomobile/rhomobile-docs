# Bluetooth

Bluetooth API provide access to Bluetooth serial port connection between phone and another phone, phone and PC, phone and external Bluetooth device (for example external Bluetooth GPS device).

To allow Bluetooth enable the bluetooth capability. This is done by adding the following lines to build.yml:

	:::yaml
	capabilities:
	  - bluetooth

Currently Bluetooth support has the following limitations:

* On Apple device (iPhone, iPad etc.), you can connect only to another Apple device.
* On any platform, except iPhone, you should pair your devices before making connection.
* You can change local device name for display on another device only on iOS and Android platform - for WM use system settings for change local device name.
* Only one connection session can be created and used on any device. You should close your current session before making another session.
* One-to-few peers connection scheme is unsupported.

There are two steps to make connection and start using of Bluetooth :

* Make connection session: execute `Rho::BluetoothManager.create_session` and setup callback where you receive result of connection. That callback will get events related to making connection(connect ok, canceled by user, error). Connection provided by platform specific UI.
* For make connection without UI, you should execute `Rho::BluetoothManager.create_server_and_wait_for_connection` on server and `Rho::BluetoothManager.create_client_connection_to_device` on client. On client you should specify server name(display name - not Bluetooth ID!) for connect. Specify callback - callback have the same parameters with `Rho::BluetoothManager.create_session`.  You can cancel connection process by `Rho::BluetoothManager.stop_current_connection_process`
* After receiving successful result and name of connected device in create_session_callback you should setup session_callback by `Rho::BluetoothSession.set_callback` to process incoming session events from connected device (data received) or event related to this session connection(disconnect, errors).

**NOTE: Connection without UI worked only on iOS and Android platforms!**

### Bluetooth API

You can use the [BluetoothManager API](../rhodesapi/bluetoothmanager-api) to make a connection between your Bluetooth-equipped device and another Bluetooth-equipped device.

 * [is_bluetooth_available](../rhodesapi/bluetoothmanager-api#isbluetoothavailable) - Returns true if Bluetooth is available on the device, false otherwise.
 * [off_bluetooth](../rhodesapi/bluetoothmanager-api#offbluetooth) - Turn Bluetooth off.
 * [set_device_name](../rhodesapi/bluetoothmanager-api#setdevicename) - Change the local device name.
 * [get_device_name](../rhodesapi/bluetoothmanager-api#getdevicename) - Get local device name for current device.
 * [get_last_error](../rhodesapi/bluetoothmanager-api#getlasterror) - Returns the last error: OK or ERROR or CANCEL.
 * [create_session](../rhodesapi/bluetoothmanager-api#createsession) - Creates a Bluetooth session.
 * [create_server_and_wait_for_connection](../rhodesapi/bluetoothmanager-api#createserverandwaitforconnection) - Connect without a user interface. Makes the current device discoverable for another device, and waits for the client connection from the other device.
 * [create_client_connection_to_device](../rhodesapi/bluetoothmanager-api#createclientconnectiontodevice) - Connect without user interface. Make the client connection to another device.
 * [stop_current_connection_process](../rhodesapi/bluetoothmanager-api#stopcurrentconnectionprocess) - When connecting without user interface (`create_server_and_wait_for_connection`), cancel the current connection.

You can use the [BluetoothSession API](../rhodesapi/bluetoothsession-api) to manage a connection session between your Bluetooth-equipped device and another Bluetooth-equipped device.

 * [set_callback](../rhodesapi/bluetoothsession-api#setcallback) - Set the Bluetooth session callback.
 * [disconnect](../rhodesapi/bluetoothsession-api#disconnect) - Disconnect from the device.
 * [get_status](../rhodesapi/bluetoothsession-api#getstatus) - Get the session status.
 * [read](../rhodesapi/bluetoothsession-api#read) - Read data from the connected device.
 * [write](../rhodesapi/bluetoothsession-api#write) - Write data to the connected device.
 * [read_string](../rhodesapi/bluetoothsession-api#readstring) - Read string from the connected device.
 * [write_string](../rhodesapi/bluetoothsession-api#writestring) - Write string to the connected device.

### Example of Controller with using Bluetooth API

This is not a complete example (for a link to a complete example, see the link below this example). This code just shows how you can make a connection and send/receive strings.<a id="bluetooth-ex" />

	:::ruby
	require 'rho/rhocontroller'
	require 'rho/rhobluetooth'

	class BluetoothController < Rho::RhoController
	  @layout = :simplelayout
	  $connected_device = nil
  
	  def index
	    render
	  end

	  def start_bluetooth
	    if Rho::BluetoothManager.is_bluetooth_available()
	      Rho::BluetoothManager.create_session(Rho::BluetoothManager::ROLE_CLIENT, url_for( :action => :connection_callback))
	    end
	  end

	  def send_string(str)
	    Rho::BluetoothSession.write_string($connected_device, str)
	  end

	  def connection_callback 
	    if @params['status'] == Rho::BluetoothManager::OK
	       $connected_device = @params['connected_device_name']
	       Rho::BluetoothSession.set_callback($connected_device, url_for( :action => :session_callback))
	       send_string('Hello friend !')
	    end
	  end 

	  def session_callback
	     if @params['event_type'] == Rho::BluetoothSession::SESSION_INPUT_DATA_RECEIVED
	        while Rho::BluetoothSession.get_status($connected_device) > 0
	          str = Rho::BluetoothSession.read_string($connected_device)
        
	          # use received string
           
	        end
	     end
	  end

	  def close_all
	    Rho::BluetoothSession.disconnect($connected_device)
	    Rho::BluetoothManager.off_bluetooth()
	  end
      
	end

### Example of chat application using Bluetooth connection

You can find a complete example of using Bluetooth API in [Rhodes-System-Api-Samples](http://github.com/rhomobile/rhodes-system-api-samples). See Bluetooth Chat Demo page - [BluetoothChat](http://github.com/rhomobile/rhodes-system-api-samples/tree/master/app/BluetoothChat/). In this example you can see how to exchange text messages between two different devices. You also can use this example for connect to external Bluetooth device (external GPS device for example) or PC or Mac (use terminal to see and send messages).
