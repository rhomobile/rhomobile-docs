# Device Authentication in RhoConnect
The generated RhoConnect application code includes a file called "application_controller.rb" which contains an implementation for the "login" route.  This route is called when a device first connects to the RhoConnect application and provides username/password credentials.

## Authentication Workflow
The following diagram shows how this authenticate method is called:

<img src="https://s3.amazonaws.com/rhodocs/rhoconnect/authentication/rhoconnect-auth-flow.png"/>

## Example
If your back-end service requires authentication, simply add code to the login route and return true if authentication was successful or false to deny access to the application from this device.  For example:

    :::ruby
    post "/login", :rc_handler => :authenticate do
      username = params[:login]
      password = params[:password]
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

## Changing Login
If your actual user name is different than the username that is input into the client, you can change the username by returning a string instead of true if authentication was successful.

    :::ruby
    post "/login", :rc_handler => :authenticate do
      username = params[:login]
      password = params[:password]
      success = false
      # ... connect to backend using API and authenticate ...
      result = do_custom_authentication(username,password)
      if result.code == 200
        new_user = custom_user_mapping(username)
        # save the data for later use in the source adapter
        Store.put_value("username:#{new_user}:token",result.body)
          success = new_user
      end
      return success
    end

## LDAP Example
The code sample above demonstrates authentication by calling a method you would implement called 'do_custom_authentication' that returns an HTTP response object, however the actual implementation is left as an exercise.  If your application needs to connect to LDAP, you can use the following sample code to perform simple authentication:

    :::ruby
    require 'net/ldap'

    post "/login", :rc_handler => :authenticate do
      username = params[:login]
      password = params[:password]
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

## X509 Example
The code sample below demonstrates using an X509 certificate for authentication.  See <a href='http://wiki.pentaho.com/display/ServerDoc2x/Authentication+via+X.509+Client+Certificate' target='_blank'>X509 certificate generation</a> for more information about generating a cert. You can also view a <a href='https://github.com/rhomobile/x509-auth-sample' target='_blank'>sample project</a> of the code below.

Inside of your RhoConnect app you can replace the password parameter with a pem file parameter.  This parameter is expecting a string formatted for .pem with your certificate followed by your private key.

    :::ruby

    require 'socket'
    require 'openssl'

    post "/login", :rc_handler => :authenticate do
      username = params[:login]
      pem = params[:password]
      #assuming pem file has certificate and then private key below in pem format
      pem_arr = pem.split("-----END CERTIFICATE-----")
      pem_arr[0] << "-----END CERTIFICATE-----"

      socket = TCPSocket.new('my.secureserver.com', 4567)

      ssl_context = OpenSSL::SSL::SSLContext.new

      ssl_context.cert = OpenSSL::X509::Certificate.new(pem_arr[0].strip)
      ssl_context.key = OpenSSL::PKey::RSA.new(pem_arr[1].strip)

      ssl_socket = OpenSSL::SSL::SSLSocket.new(socket, ssl_context)
      ssl_socket.sync_close = true

      ca_cert = OpenSSL::X509::Certificate.new(File.open("CA.crt"))

      if ssl_socket.connect
        puts "socket connected correctly"
        return true
      else
        puts "socket failed to connect"
        return false
      end

    end

A simple Sinatra app listening on port 4567 for connections might look something like this.

    :::ruby
    require 'rubygems'
    require 'socket'
    require 'openssl'

    socket = TCPServer.new('my.secureserver.com', 4567)

    ssl_context = OpenSSL::SSL::SSLContext.new()
    ssl_context.cert = OpenSSL::X509::Certificate.new(File.open("server.crt"))
    ssl_context.key = OpenSSL::PKey::RSA.new(File.open("server.key"))

    ca_cert = OpenSSL::X509::Certificate.new(File.open("CA.crt"))

    ssl_socket = OpenSSL::SSL::SSLServer.new(socket, ssl_context)


    loop do
      connection = ssl_socket.accept
      Thread.new {
        begin
          #do something
        rescue
          $stderr.puts $!
        end
      }
    end