# Rho::RhoConfig API

The RhoConfig API allow access to the configuration properties. Refer to [Run time configuration](../rhodes/configuration#run-time-configuration) for a listing of the configuration properties, and [some examples](../rhodes/configuration#rhoconfig-api-ex).

## configuration property methods

The properties in the rhoconfig.txt file for a Rhodes application are available through the RhoConfig API. To access the property, use the name of the property as the method name. For example, the following method returns the start path for your Rhodes application:

	:::ruby
	Rho::RhoConfig.start_path

For a list of the configuration properties, [click here](../rhodes/configuration#run-time-configuration)

## exists?

Checks to see if a configuration property exists for this Rhodes application.

	:::ruby
	Rho::RhoConfig.exists?(configuration-property)

<table border="1">
<tr>
	<td><code>configuration-property</code></td>
	<td>String. A configuration property, such as 'start_path'.</td>
</tr>
</table>