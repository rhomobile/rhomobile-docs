# Interfacing with the network

The network is usually a core part of every RhoMobile application, as it is used for data transfer. However, mobile devices have very different constaints than traditional desktop systems; for example, we cannot assume that the network will always be available or reliable. To provide a good user experience, your application should detect the state of the network connection before attempting to use it

## Detecting network availability and changes in it

The [Network API](../api/Network) allows your application to be notified when the connection becomes available or unavailable, as well as to query whether there is a Wi-Fi or cell connection. `startStatusNotify` lets you install a callback that will be invoked whenever a change in network availability is detected:

Ruby:

	:::ruby
	def install_network_callback
		# Request the system to check every 3 seconds and call us back if there is a change in network connectivity
		Rho::Network.startStatusNotify(3000, url_for(:action => :status_notify_callback))
	end
	
	def status_notify_callback
		connection_status = @params["current_status"] # either "connected" or "disconnected"
		previous_status = @params["prev_status"]

		if (connection_status == "connected")
			# We have a network connection! Now we can transfer data 
		else
			# The device lost the connection
		end
	end

JavaScript:
	:::javascript
	function install_network_callback() {
		Rho.Network.startStatusNotify(3000, status_notify_callback);
	}

	function status_notify_callback(params) {
		var connection_status = params.current_status // either "connected", "disconnected" or "unknown"
		var previous_status = params.prev_status;
		alert("Connection status changed from "+previous_status+" to "+connection_status);
	}

## Triggering synchronization only when the network is likely to be reliable

If your device has a Wi-Fi connection available, you can use the [SignalIndicators API](../api/signalindicators) on some platforms to find out the strength of the signal:

Ruby:
	:::ruby
	wlan_status = Rho::SignalIndicators.wlanStatus
	
	signal_strength = wlan_status["signalStrength"] # returns a value between 0 and 100
	
	if signal_strength > 30
		# The network should be reliable enough for data transfer. We can trigger synchronization or download large files
		Rho::RhoConnectClient.doSync
	else
		# We may encounter some connectivity issues. It may not be a good time to start a large download now
	end

JavaScript:
	:::javascript
	var wlan_status = Rho.SignalIndicators.wlanStatus();
	var signal_strength = wlan_status.signalStrength;
	if (signal_strength > 30) {
		// The network should be reliable enough for data transfer. We can trigger synchronization or download large files
	} else {
		// We may encounter some connectivity issues. It may not be a good time to start a large download now
	} 


If your application is heavily dependant on synchronization or external data sources, you can leverage this knowledge of the network to make sophisticated decisions about the best moment to start transmitting data. There is of course no guarantee that the network conditions will remain the same during use; however, you will improve the way your users perceive your application if your network-heavy operations are performed when they are more likely to succeed.

## Connecting to known networks

Your application may need to access a server that is only available through a WAN connection, either through the Internet or via a VPN tunnel. The [Network API](../api/Network) provides you with the `connectWan` method, which lets your application request that a named connection be established.

You can request that the default Internet connection of the device be brought up:
Ruby:
	:::ruby
	# Connect to the Internet
	Rho::Network.connectWan("Internet", :wan_connection_callback)

JavaScript:
	:::javascript
	// Connect to the Internet
	Rho.Network.connectWan("Internet", wan_connection_callback);

Or you can also ask for a particular network connection by name, as long as it has been previously configured in the Connection Manager:

Ruby:
	:::ruby
	# Connect to a particular VPN
	Rho::Network.connectWan("Work VPN", :wan_connection_callback)
	
	def wan_connection_callback
		# At this point, the connection to the VPN has been attempted, but we need to check if it succeeded
		# See the next section called "Detecting remote server availability"
	end
JavaScript:
	:::javascript
	// Connect to a particular VPN
	Rho.Network.connectWan("Work VPN", wan_connection_callback);

	function wan_connection_callback(params) {
		// At this point, the connection to the VPN has been attempted, but we need to check if it succeeded
		// See the next section called "Detecting remote server availability"
	}

**NOTE: This feature is a convenience method for your users to connect to the appropriate network with little or no interaction from their side. If you are dealing with sensitive data, do not use it as a substitute for SSL encryption**


## Detecting remote server availability

If your server is not normally reachable with the default configuration of the device (for example, because you need to establish a VPN tunnel first) or the connection can be expected to be unreliable (devices in remote locations with spotty coverage), you can check whether a server can be accessed by invoking `detectConnection`. This lets you test connectivity between your application and a particular port of a server:

Ruby:
	:::ruby
	Rho::Network.detectConnection( {
		:host => "www.example.com"
		:port => 443
	}, :detect_connection_callback)

	def detect_connection_callback
		if @params["connectionInformation"]=="Connected"
			# the server can be reached on port 443, trigger synchronization
			Rho::RhoConnectClient.doSync
		else
			# the server is unavailable
		end
	end

JavaScript:
	:::javascript
	Rho.Network.detectConnection( {
		host : "www.example.com",
		port : 443
	}, detect_connection_callback);

	function detect_connection_callback(params) {
		if (params.connectionInformation == "Connected") {
			// the server can be reached on port 443, trigger synchronization
			Rho.RhoConnectClient.doSync();
		} else {
			// the server is unavailable
		}
	}

Once you have determined that the server is reachable, you can be reasonably sure that a connection will succeed and you can either notify the user that synchronization is available or even start it automatically.

## Related reading

* The [Network API](../api/Network) and [SignalIndicators API](../api/signalindicators) documentation pages provide all the details on detecting the status of the network.

* [RhoConnect Client](../api/RhoConnectClient) is the new API to call when you want to synchronize data between your application and a remote RhoConnect server.
