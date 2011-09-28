Device Authentication in RhoSync
===

The generated RhoSync application code includes a file at the root called "application.rb" which contains an "authenticate" hook.  This method is called when a device first connects to the RhoSync application and provides username/password credentials.

## Authentication Workflow
	
The following diagram shows how this authenticate method is called:

<img src="https://img.skitch.com/20110111-g2ujk785gak2kfgfrspq1w8u8j.png"/>

## Example
If your backend service requires authentication, simply add code to the authenticate method and return true if authentication was successful or false to deny access to the application from this device.  For example:

	:::ruby
	def authenticate(username, password, session)
	  success = false 
	  # ... connect to backend using API and authenticate ... 
	  result = do_custom_authentication(username,password) 
	  if result.code == 200
	    # save the data for later use in the source adapter
	    Store.put_value("username:#{username}:token",result.body)
		success = true
	  end
	  return success
	end

## LDAP Example
The code sample above demonstrates authentication by calling a method you would implement called 'do_custom_authentication' that returns an HTTP response object, however the actual implementation is left as an exercise.  If your application needs to connect to LDAP, you can use the following sample code to perform simple authentication:

	:::ruby
	require 'net/ldap'

    def authenticate(username, password, session)
      success = false 
      ldap = Net::LDAP.new
      ldap.host = "localhost"
      ldap.port = 389
      ldap.auth "cn=#{username},dc=example,dc=com", password

      # we only need to bind to verify successful login
      success = true if ldap.bind

      return success
    end
	
Where the domain component "dc=example,dc=com" is replaced by your domain.  For example, the `ldap.auth` code above using "rhomobile.com" would be:

 	:::ruby
	ldap.auth "cn=#{username},dc=rhomobile,dc=com", password

This example uses the [net-ldap](https://github.com/RoryO/ruby-net-ldap) gem.  To install this gem, run the following:

	:::term
	$ [sudo] gem install net-ldap
	
For more details about LDAP, please visit [http://www.openldap.org/](http://www.openldap.org/).
