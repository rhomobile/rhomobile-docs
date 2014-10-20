# BluetoothManager API
Makes a connection between your Bluetooth-equipped device and another Bluetooth-equipped device. [Click for a short example of using bluetooth](../rhodes/device-caps#bluetooth-ex), or here for [Rhodes-System-Api-Samples – BluetoothChat](https://github.com/rhomobile/rhodes-system-api-samples/tree/master/app/BluetoothChat/).

## Enabling Bluetooth
You need to enable Bluetooth on the device. Do this by adding that capability to the build.yml file:

	:::yaml
	capabilities:
	  - bluetooth

## is_bluetooth_available
Returns true if Bluetooth is available on the device, false otherwise.

	:::ruby
	Rho::BluetoothManager.is_bluetooth_available

## off_bluetooth
Turn Bluetooth off for existing Bluetooth session instance. It DOES NOT turn off the BT adapter. 

	:::ruby
	Rho::BluetoothManager.off_bluetooth

## set_device_name
Change the local device name.

	:::ruby
	Rho::BluetoothManager.set_device_name(name)

<table border="1">
	<tr>
		<td><code>name</code></td>
		<td>String. The new name for the device.</td>
	</tr>
</table>

## get_device_name
Get local device name for current device (the name displayed on another device).

	:::ruby
	Rho::BluetoothManager.get_device_name

## get_last_error
Returns the last error: OK or ERROR or CANCEL.

	:::ruby
	Rho::BluetoothManager.get_last_error

## create_session
Creates a Bluetooth session. Returns OK or ERROR.

	:::ruby
	Rho::BluetoothManager.create_session(role, callback_url)

<table border="1">
	<tr>
		<td><code>role</code></td>
		<td>ROLE_SERVER or ROLE_CLIENT</td>
	</tr>
	<tr>
		<td><code>callback_url</code></td>
		<td>
			url to a callback method called after the Bluetooth session is created or canceled. Parameters received in the callback: <code>status</code> of OK or ERROR or CANCEL; and <code>connected_device_name</code>, the name of the device connected via Bluetooth.
		</td>
	</tr>
</table>

## create_server_and_wait_for_connection
Connect without a user interface. Makes the current device discoverable for another device, and waits for the client connection from the other device.

	:::ruby
	Rho::BluetoothManager.create_server_and_wait_for_connection(callback_url)

<table border="1">
	<tr>
		<td><code>callback_url</code></td>
		<td>url to a callback method called after the Bluetooth session is created or canceled. Parameters received in the callback: <code>status</code> of OK or ERROR or CANCEL; and <code>connected_device_name</code>, the name of the device connected via Bluetooth.
		</td>
	</tr>
</table>

## create_client_connection_to_device
Connect without user interface. Make the client connection to another device.

	:::ruby
	Rho::BluetoothManager.create_client_connection_to_device(server_name, callback_url)

<table border="1">
	<tr>
		<td><code>server_name</code></td>
		<td>The name of the other device. If you connect with user interface, you receive this name as connected_device_name.</td>
	</tr>
	<tr>
		<td><code>callback_url</code></td>
		<td>url to a callback method called after the Bluetooth session is created or canceled. Parameters received in the callback: <code>status</code>, OK or ERROR or CANCEL, and <code>connected_device_name</code>, the name of the Bluetooth connected device.
		</td>
	</tr>
</table>

## stop_current_connection_process
When connecting without user interface (`create_server_and_wait_for_connection`), cancel the current connection.

	:::ruby
	Rho::BluetoothManager.stop_current_connection_process