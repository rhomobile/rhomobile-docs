# Ruby Native Extensions

This doc will explain extensions to the Rhodes framework using Ruby and how to add them to your Rhodes app, including the handling of JSON and XML data with regards to your app's data.

## Extensions

In order to strike a balance between functionality and size, some Ruby libraries are available as extensions instead of being compiled into your application by default. Available extensions are located within the rhodes-4.x.x gem in `lib/extensions`. To use any of them in your application, all you need to do is add its name to the `extensions` section in `build.yml`. For example:

    :::yaml
    extensions: ["pdf-writer"]

If you are adding more than one, separate them with commas:

    extensions: ["pdf-writer", "json", "net-http"]

Some extensions are specific to a particular platform. If an extension has an `ext.yml` file, open it and look for a `platforms` line listing the supported platforms. For example, the `serialport` extension is only available for Windows Mobile and desktop Windows.

## JSON library support

For parsing use Rho::JSON.parse, no extension required.

Ruby code example:
	:::ruby
	parsed = Rho::JSON.parse("[{\"count\":10}]")

If you need to generate (not parse) JSON, add the `json` extension.
  
Add to build.yml:

	extensions: ["json"]

Ruby code example:
	:::ruby
	require 'json'
	json_data = ::JSON.generate(some_object)

See JSON tests in [Rhodes System API Samples application](http://github.com/rhomobile/rhodes-system-api-samples/tree/master/app/JsonTest/controller.rb) as an example.

## XML handling
There are two ways of handling XML directly in Rhodes. The Rexml library and the much faster RhoXML library.

### Rexml

Add to build.yml:

	extensions: ["rexml", "set"]

Ruby code example:
    :::ruby
	require 'rexml/document'
    file = File.new("bibliography.xml")
    doc = REXML::Document.new(file)
    puts doc

### RhoXML
This is a reduced version of rexml. Rhoxml has the same syntax as rexml, but smaller in size and faster.

Change rexml to rhoxml in build.yml:
	
	extensions: ["rhoxml"]

No more changes required.

Rhoxml limitations:

1. Decoding xml text is not fully implemented. See document.rb line 503 (Text::unnormalize). Need to implement non regular expression decoding.
2. No DTD, validation and formatters support
3. Support only elements and attributes. No cdata, comments, etc.

### XML Stream parser

To process xml faster (without building DOM xml tree in memory) you can use StreamParser:
	:::ruby
    class MyStreamListener

        def initialize(events)
            @events = events
        end

        def tag_start name, attrs
            #puts "tag_start: #{name}; #{attrs}"
            @events << attrs if name == 'event'
        end
        def tag_end name
            #puts "tag_end: #{name}"
        end
        def text text
            #puts "text: #{text}"
        end
        def instruction name, instruction
        end
        def comment comment
        end
        def doctype name, pub_sys, long_name, uri
        end
        def doctype_end
        end
        def attlistdecl element_name, attributes, raw_content
        end
        def elementdecl content
        end
        def entitydecl content
        end
        def notationdecl content
        end
        def entity content
        end
        def cdata content
            #puts "cdata: #{content}"
        end
        def xmldecl version, encoding, standalone
        end
    end

	def parse_xml(str_xml)
        @events = []
        list = MyStreamListener.new(@events)
        REXML::Document.parse_stream(str_xml, list)
		...
		
It supported in RhoXml and Rexml extensions. For example see : [`<rhodes>\spec\phone_spec\app\spec\xml_spec.rb`](https://github.com/rhomobile/rhodes/blob/master/spec/phone_spec/app/spec/xml_spec.rb) ("should stream parse" spec) and rexml stream parser documentation

## net/http

Add to build.yml:
	
	extensions: ["net-http", "thread", "timeout", "uri"]

## hmac

Add to build.yml:
	
	extensions: ["hmac", "digest", "digest-sha1"]

Example:
	:::ruby	
    require 'base64'
    require 'hmac-sha1'

    def test_hmac
      key = '1234'
      signature = 'abcdef'
      hmac = HMAC::SHA1.new(key)
      hmac.update(signature)
   
      puts Rho::RhoSupport.url_encode(Base64.encode64("#{hmac.digest}\n"))
    end
    
## FileUtils

Add to build.yml:
	
	extensions: ["fileutils"]

DryRun, NoWrite and Verbose are commented out modules since they use the `eval` function, which is not available in RhoMobile.

Before adding the FileUtils extension, consider using the built-in Ruby class `Dir` whenever possible.

## Adding Ruby Extension Libraries to Your Rhodes Application

Create folder 'extensions' under application root if it does not exist already.

Copy the folder with the Ruby library to the 'extensions' folder. This will work for "pure ruby" extensions. Extensions which are implemented in c/c++ or such, you will have to compile as [native extensions](native_extensions) for the target platform.

Add extension with folder library name to build.yml:
	
	extensions: ["myext"]

This library will be available for require:
	:::ruby
	require 'myext'

Using this technique you can easily remove extension from application or include some extension for particular platform:

	iphone:
	  extensions: ["mspec", "fileutils"]

	wm:
	  extensions: ["json"]
  
## Adding Libraries to Your Rhodes Application

During the course of your app development you might need to add an external ruby library with extra features that the Rhodes framework doesn't provide.  While we don't guarantee that all ruby libraries will work on the mobile device, you can follow the steps below to add and test libraries as needed.

In RhoMobile, the require path is relative to the "app" subdirectory, since this is what gets bundled with the application.

Assuming your application is called "mynewapp", create a directory called `lib` (if it does not exist already) and, within it, a directory to store the library:

	:::term
	$ cd mynewapp
	$ mkdir lib
    $ mkdir lib/my_lib

Add your ruby files to this directory:
	:::term
 	$ cp /path/to/my_lib.rb lib/my_lib/my_lib.rb


Now, in your application (controller.rb for example), you can load this library with a simple `require` statement:

	:::ruby
	require 'rho/rhocontroller'
	require 'lib/my_lib'

	class TicketController < Rho::RhoController
	  def use_lib
	    @a = MyLib.new
	    ...
	  end
	end

Please note that "rubygems" are not loaded on the device Ruby VM because of size constraints, see the next section "Adding an external gem" for instructions therefore all third-party ruby library source files must be put into the extensions directory as described above.

## Adding 3rd party gems

Although other gems in your computer are not available within a RhoMobile application by default, some gems can be added and used:

* download the gem from [RubyGems](http://www.rubygems.org) and save it to your machine
* gems are actually zip files with a different extension: rename the .gem file to .zip and unzip it
* the zip file will contain two other files, data.tar.gz and metadata.gz . Uncompress data.tar.gz
* although there is no hard requirement for this, most gems follow the pattern of having their code inside a directory called `lib` or, in some cases, a directory with the same name as the gem. This is the directory we are interested in

Once you locate the directory with the library, copy it to your application following the procedure outlined above in "Adding Libraries to Your Rhodes Application". 

**NOTE: Many gems will not work out of the box in a RhoMobile application because gems are often developed with desktop/server computers in mind, not mobile devices and tend to use features that are simply not available within RhoMobile. In particular, gems requiring access to external libraries (.so/.dll) or platform-specific features will not work. You have a better chance of success if the gem is simple and has few or no dependencies; the more complex the code, the higher the possibility that it uses a module that is not available on a mobile device. Some gems with platform-native (C) code can be made to work if you convert them into a [native extension](native_extensions).**


## Adding Libraries to Rhodes Framework

If you find yourself using the same library in most of your applications, you can add it directly to the base framework so that it is available by default when building any application.

There are two ways to add Ruby libraries to the RhoMobile framework:

* If you are using Rhodes via the RubyGems installation, you must add external Ruby libraries to your RubyGems installation directory for the 'rhodes-4.x.x' gem. Your RubyGems installation directory can be found with `gem env` in a terminal.

For example, a user on Linux might place additional libraries in the following directory:

	/usr/local/lib/ruby/gems/1.9/gems/rhodes-x.x.x/lib/framework

Similarly, a user on Mac OSX running the recommended RVM setup might place them here:

	~/.rvm/gems/ruby-1.9.x-pxxx/gems/rhodes-x.x.x/lib/framework

For Windows, this location might be:

 C:/ruby/lib/ruby/gems/1.9/gems/rhodes-x.x.x/lib/framework


If you are using a clone of the Rhodes Git repository, you can put additional libraries in the following directory (preferably on your own github fork):

	<rhodes-clone>/lib/framework

Including the library into your application is simple once the library is in the proper directory.

Assuming the library has been added to the correct location, require the library from a controller in your Rhodes application:
	:::ruby
	require 'libname'

You can now use the added library to access additional functionality not provided by the RhoMobile framework.

**NOTE: The same notice applies no matter the location. Some libraries will simply not work on a RhoMobile application due to assumptions they make about the environment/operating system.**

If you follow this procedure, remember that you will have to redo the steps whenever you upgrade to a new version of RhoMobile


## Encryption libraries
### digest - based extensions

digest, digest-sha1, digest-md5

Add to build.yml:
	
	extensions: ["digest", "digest-sha1", "digest-md5"]

NOTE: digest should be included in extensions list to use digest-base libraries

### OpenSSL - based libraries

openssl, ezcrypto

Add to build.yml:
	
	extensions: ["openssl.so", "openssl", "digest-sha2", "ezcrypto"]

digest-sha2

Add to build.yml:
	
	extensions: ["openssl.so", "openssl", "digest", "digest-sha2" ]

NOTE: openssl.so is native c-library and should be included in extensions list to use openssl-base libraries