# Building a native extension

## Introduction

RhoMobile provides you with access to a wide variety of features offered by the device your application runs on, such as [sensors](../api/sensor) or [barcode scanners](../api/barcode). If you need to interact with the native platform in a way that the public RhoMobile APIs do not address, it is time to build a native extension.

**NOTE: Native extensions are used only when strictly necessary. If you need to add functionality to your application and a compatible Ruby gem or JavaScript library is available, these are usually preferable.**

## Overview

The process of building a native extension involves

* Using a code generator to build an XML descriptor that contains the structure of your new API
* Updating the template to add the names and features of the methods your API will provide
* Running the code generator to create stub implementations for the different platforms
* Implementing your API on the platform(s) you intend to support in native code.
* Adding the new extension to your build.yml so that it is available in your application


## Getting started - Basic extension walkthrough

**NOTE: This guide contains a walkthrough of creating the simplest possible extension, and then progressively adding more features to it. If you need to build an extension for your application and have not done so before, it is recommended that you do not skip ahead but instead read the whole guide in order, as each section builds on the steps and knowledge acquired in the sections that came earlier.**


We will begin by creating a sample "Greeting" extension. Our target is to have a new API available as `Rho::Greeting` (Ruby) or `Rho.Greeting` (JavaScript) with the following methods:

* welcome(username)
* farewell(username)

These methods will be `static`, that is, they can be called directly on the Greeting class in the same way you can call methods on [Rho::Log](../api/Log)

Ruby:
	:::ruby
	greeting = Rho::Greeting.welcome("John Doe") # <= "Welcome, John Doe"
	farewell = Rho::Greeting.farewell("Jane Doe") # <= "Farewell, Jane Doe"

JavaScript:
	:::javascript
	var greeting = Rho.Greeting.welcome("John Doe") // <= "Welcome, John Doe"
	var farewell = Rho.Greeting.farewell("Jane Doe") // <= "Farewell, Jane Doe"


From the console, change into your application's directory and run:

	:::console
	rhodes extension greeting

this will create the initial set of files for the new extension. Open the new `extensions/greeting` folder and you will find:

* ext.yml - you do not normally need to modify this file
* public/api/generated/Rho.Greeting.js - automatically generated JavaScript bindings
* ext/platform - one folder for each supported platform (android, iphone, wm, wp8)
* ext/shared/generated - automatically generated glue code
* ext/greeting.xml - API descriptor. This is where you define which methods your API provides, the parameters they expect and the result they return, as well as provide user documentation.

**NOTE: Whenever you see a directory named `generated`, keep in mind that everything it contains can be overwritten by the code generator on subsequent runs. Consider these directories as "read-only", do not modify any of these files because your changes will be lost.**

## Adding an extension to your application

Merely creating an extension does not automatically include it in an application: you still need to edit the `build.yml` file and add it:

	:::yaml
	extensions:
		- greeting

## Overview of the API descriptor (XML) file

The API descriptor (`extensions/<extension name>/ext/<extension name>.xml`) contains all the information required by the `rhodes` code generator to build a basic template that you can then implement for each platform. The default descriptor that is generated contains some sample methods that serve as documentation and starting point for your own. The structure of the API descriptor is as follows:

	:::xml
	<API> <!-- Root container for all elements -->
		<MODULE>
			<ALIASES></ALIASES> <!-- optional -->

			<HELP_OVERVIEW> <!-- documentation -->
			</HELP_OVERVIEW>

			<MORE_HELP> <!-- documentation -->
			</MORE_HELP>

			<TEMPLATES> <!-- include common features automatically in your API -->
			</TEMPLATES>

			<PROPERTIES> <!-- supported properties of this extension -->
				<PROPERTY>
				</PROPERTY>
			</PROPERTIES>

			<METHODS>	<!-- supported methods of this extension -->
				<METHOD>
				</METHOD>
			</METHODS>

			<USER_OVERVIEW> <!-- documentation -->
			</USER_OVERVIEW>

			<VER_INTRODUCED> <!-- documentation -->
			</VER_INTRODUCED>
		</MODULE>
	</API>

Sections marked "documentation" are meant to be user-readable, while `<MODULE>`, `<ALIASES>`, `<TEMPLATES>`, `<PROPERTIES>` and `<METHODS>` drive the code generation and implementation of the extension.

**NOTE: The set of attributes supported by each of these tags is fully documented in [Reference: the API descriptor in depth](#reference-the-api-descriptor-in-depth). The basic extension shown in this guide does not make use of every feature.**

The default descriptor already contains a set of methods and includes some templates. For simplicity, instead of using the default, we will start from the smallest possible descriptor and add features to our extension gradually. This will let you see how all the pieces fits together and what each change provides; once you start to build a real extension, you will know what you can save from the default and what has to be removed for your particular case.

Keep a mental note of the methods that the default descriptor includes (`getPlatformName`, `calcSumm`, `joinStrings`) and
replace the contents of your greeting.xml file with the following:

	:::xml
	<?xml version = "1.0"?>
	<?xml-stylesheet type="text/xsl" href="pb_help.xsl"?>
	<API>
	    <MODULE name="Greeting" parent="Rho">
	        <HELP_OVERVIEW>Example extension api</HELP_OVERVIEW>
	        <MORE_HELP>This is example of API. Implementation contain in extension.</MORE_HELP>
	    
	        <TEMPLATES>
	        </TEMPLATES>

	        <PROPERTIES>
	        </PROPERTIES>

	        <METHODS>
	        	<METHOD name="welcome" access="STATIC">
	        		<PARAMS>
	                    <PARAM name="user" type="STRING"/>
	                </PARAMS>

	                <RETURN type="STRING">
	                    <DESC>Warm welcome for the user</DESC>
	                </RETURN>
				</METHOD>	        			
	        </METHODS>
	        
	        <USER_OVERVIEW>
	        </USER_OVERVIEW>

	        <VER_INTRODUCED>1.0.0</VER_INTRODUCED>
	        <PLATFORM>
	        </PLATFORM>
	    </MODULE>
	</API>    


From the command line, switch to the `extensions/greeting/ext` folder and run

	:::console
	rhodes api greeting.xml

**NOTE: Every time you make changes to the API descriptor and regenerate files, run the appropriate rake clean task (i.e., `rake clean:android` or `rake clean:iphone`) before building your application, otherwise you may sometimes experience compilation errors.**

This command processes the descriptor and rebuilds the auto-generated files. You are now ready to start adding your implementation.

## High-level structure of extensions

The `rhodes` command builds a set of files for each platform, divided in two sets:

* Base classes and interfaces to use in your own implementation. These are regenerated automatically.
* Implementation classes. These contain your custom code. They must implement / extend the autogenerated base classes and are generated only the first time: when you make changes to the API descriptor and re-run the `rhodes` command, you will also need to make the appropriate changes to these files manually.


Depending on the platform you are working on, complete one of the following sections:

### Android

Android extensions place their generated base classes and interfaces in `<extension name>/ext/platform/android/generated` and your implementation in `<extension name>/ext/platform/android/src`

Open `extensions/greeting/ext/platform/android/generated/src/com/rho/greeting/IGreetingSingleton.java` and you will see it declares a very simple interface with a single method, `welcome`, that takes a `String` parameter called `user`, like you specified in the API descriptor.

However, instead of returning `String` like you would expect from the declaration, it is `void` and instead takes a second parameter called `result` of type `IMethodResult`. All methods in your extension will follow this pattern: they will be declared `void` and the `result` parameter is what allows you to return a value.

Now open `extensions/greeting/ext/platform/android/src/com/rho/greeting/GreetingSingleton.java`. This class is declared to implement the `IGreetingSingleton` interface we just saw in the previous step but it will not compile in its present form. This is an implementation class, which means it was autogenerated the first time but it is now up to you to make the relevant changes to implement the API correctly.

In order to do that:

* remove all existing methods
* add the missing method:

		:::java
	    @Override 
	    public void welcome(String user, IMethodResult result) {
	    	result.set("Welcome, "+user);
	    }

Remember that the API descriptor initially had some methods (`getPlatformName`, `calcSumm`, `joinStrings`) that are no longer present. For the extension to build cleanly, you must remove these methods from `android/src/com/rho/greeting/Greeting.java`


### iOS

iOS extensions place their generated base classes and interfaces in:

* `<extension name>/ext/platform/iphone/generated/base_impl`
* `<extension name>/ext/platform/iphone/generated/stub_impl`

Your code must be located in `<extension name>/ext/platform/iphone/impl`

Open `stub_impl/GreetingSingleton.h` and copy the `welcome` method to `impl/GreetingSingleton.h`, removing the other methods that are present. Do the same between `stub_impl/GreetingSingleton.m` and `impl/GreetingSingleton.m`, fleshing out the method like this:

	-(void) welcome:(NSString*)user methodResult:(id<IMethodResult>)methodResult {
		[methodResult setResult:[@"Welcome, " stringByAppendingString:user]];
	}

You will have noticed that, although the API descriptor declared that the `welcome` method takes a single parameter (`user`)and returns a `String`, the generated method takes two parameters (`user` and `methodResult`) and returns void. All extension methods will follow this pattern of being void and receiving an extra parameter of type `IMethodResult` to return a value.

However, instead of returning `String` like you would expect from the declaration, it is `void` and instead takes a second parameter called `result` of type `IMethodResult`. All methods in your extension will follow this pattern: they will be declared `void` and the `result` parameter is what allows you to return a value.

### Windows Mobile

The `rhodes` tool creates a Visual Studio solution project in `extensions/greeting/ext/platform/wm/Greeting.sln`. When you open it in VS 2008, you will see it contains `Greeting_impl.cpp", which is where implementation code is added for any methods declared in the API descriptor, and `shared/generated/cpp` which contains the base classes and interfaces that your implementation must extend. 

Open `shared/generated/cpp/IGreeting.h` and you will find that `IGreetingSingleton` declares the `welcome` method defined in the API descriptor, with some differences: it is `void` instead of returning a `String` and it has an extra parameter of type `rho::apiGenerator::CMethodResult&` called oResult. Extension methods will follow this pattern of being `void` and taking an extra CMethodResult parameter which lets you return a value to the caller.

In `Greeting_impl.cpp`, update class `CGreetingSingleton` to match the following:

	:::cplusplus
	class CGreetingSingleton: public CGreetingSingletonBase
	{
	    ~CGreetingSingleton(){}

	public:
		void welcome( const rho::String& user, rho::apiGenerator::CMethodResult& oResult) {
			oResult.set("Welcome, "+user);
		}
	};

All you need to do is remove the methods called `getInitialDefaultID` and `enumerate` (these were generated automatically but they do not apply to our extension) and add an implementation of `welcome` with the signature found in `shared/generated/cpp/IGreeting.h`


## Invoking the new extension

Now that the native part of the extension is implemented, you can start to use it in your application. Open `app/index.erb` and edit the `content` div to match the following:

	:::html
	<div data-role="content">
		<%= Rho::Greeting.welcome("John doe") %>
	</div>

Make sure you [added the extension to build.yml](#Adding-an-extension-to-your-application) and run your application. You will see the extension in action, returning the value as you would expect, exactly like any other API call.

The build system creates all the initialization and glue code so that your extensions are available from both Ruby and JavaScript code automatically. The following code will also work:

	:::javascript
	alert(Rho.Greeting.welcome("John doe"));


## A deeper look into the two approaches to developing extensions. Singleton and Factory

Now that you have a good overview of how to build a simple extension, you can expand your knowledge with more advanced concepts.

The basic extension you just developed followed the "singleton" pattern, which means you don't create instances of the `Greeting` class but instead just call methods on it. This is how `Rho.Log` works and is appropriate when it does not make sense to have more than one instance of a particular object.

Another approach is also supported, the "factory" pattern. This is how many other RhoMobile APIs work like [Barcode](../api/barcode) and [Camera](../api/Camera) are implemented: there may be more than one barcode scanner or camera present in a device, so you can enumerate them and get a different instance representing each of them.

Which pattern you use depends on what exactly your extension needs to achieve and is a decision that must be taken early.

In order to create a `Factory`-style extension, you will typically:

* Keep `<DEFAULT_INSTANCE/>` inside the `<TEMPLATES>` section of the API descriptor
* Keep the `enumerate` method
* Implement a set of `instance` methods and add the same methods as `static` also, with the implementation delegating to a default instance.

The starter API descriptor builds Factory-style extensions by default. Now that you know what each piece of the puzzle means, you are ready to understand how the generated implementation works and use it as a base for your own extension.

## Using callbacks

There are many methods in the RhoMobile standard APIs that, instead of returning a value immediately, receive a callback parameter and invoke it when the value is available. For example, [Barcode.take](../api/barcode#mtake) receives a `hash` of properties to configure the scanner and a `callback` that will be executed when the scanner reads a barcode or times out.

The `<METHOD>` tag in the API descriptor accepts a `hasCallback` attribute with one of the following values: `none`, `optional`, `mandatory`. See the documentation for the `<METHOD>` tag for reference


## Returning values

The implementations of all native methods in an extension follow the same pattern:

- they are declared as `void`
- their last parameter is a special `MethodResult` object, used as a conduit to return values

If your return value is a primitive or simple type (number, string), you can call `methodResult.set` directly as in the examples above. If you need to return a composite object such as a `hash` or an `array`, there are some special type mappings to take into account.

<table class="re-table" style="width: 100%">
	<thead>
		<tr>
			<th>
				In order to return
			</th>
			<th>
				On
			</th>
			<th>
				Use
			</th>
			<th>
				Example
			</th>
		</tr>
	</thead>
	<tbody>
		<tr class="clsOddRow">
			<td>Primitive types, strings
			</td>
			<td>All platforms
			</td>
			<td>the raw value
			</td>
			<td>
				<br/>				
				Java:
				<br/>
				<code>methodResult.set(42);</code>
				<br/>
				<code>methodResult.set("Welcome");</code>
				<br/>
				<br/>
				Objective-C:
				<br/>
				<code>[methodResult setResult:42];</code>
				<br/>
				<code>[methodResult setResult:@"Welcome"];</code>
				<br/>
				<br/>
				C++:
				<br/>
				<code>oResult.set(42);</code>
				<br/>
				<code>oResult.set("Welcome");</code>
				<br/>
				<br/>
			</td>
		</tr>

		<tr class="clsEvenRow">
			<td>Array
			</td>
			<td>Android
			</td>
			<td>
				<code>java.util.List</code>
			</td>
			<td>
				<br/>
				<code>
				List myList = new LinkedList();<br>
				myList.add(42);<br>
				myList.add(7);<br>
				methodResult.set(myList);<br>
				</code>
			</td>
		</tr>

		<tr class="clsOddRow">
			<td>Array
			</td>
			<td>iOS
			</td>
			<td><code>NSArray</code>
			</td>
			<td>
				<br/>
				<code>
				NSArray* array = [NSArray arrayWithObjects:<br/>
					@"String1",<br/>
					@"String2",<br/>
					nil];<br/>
				[methodResult setResult:array];<br/>
				</code>
			</td>
		</tr>

		<tr class="clsEvenRow">
			<td>Hash
			</td>
			<td>Android
			</td>
			<td><code>java.util.Map<String,Object></code>
			</td>
			<td>
				<br/>
				<code>
					Map<String,Object> map = new java.util.HashMap<String,Object>();<br/>
					map.put("key1", "value1");<br/>
					map.put("key2", "value2");<br/>
					methodResult.set(map);<br/>
				</code>
			</td>
		</tr>

		<tr class="clsOddRow">
			<td>Hash
			</td>
			<td>iOS
			</td>
			<td>NSDictionary
			</td>
			<td>
				<br/>
				<code>
					NSDictionary* dict = [NSDictionary dictionaryWithObjectsAndKeys:<br/>
					@"value1", @"key1", @"value2", @"key2", nil];<br/>
					[methodResult setResult:dict];<br/>
				</code>
			</td>
		</tr>
	</tbody>
</table>


## Reference: The API descriptor in depth

### MODULE

The `<MODULE>` tag describes the API class you are building

Attributes:

* `name`. Mandatory. Contains the name of the generated API
* `parent`. Optional. If present, the generated API will created inside the specified namespace.
* `generateUnderscoreRubyNames`. Optional, default is `false`. If true, ruby method names will be created with underscores between words instead of camel case
* `generateDoc`. Optional, default is `true`. If false, the module is considered to be internal and will not be documented. 

Examples:

	:::xml
	<MODULE name="Greeting" parent="Rho">

	<!-- You are not limited to using "Rho" as the parent -->
	<MODULE name="VisualFX" parent="MyCompany">

	<!-- parent can be multi-level -->
	<MODULE name="VisualFX" parent="MyCompany.Graphics">


### ALIAS

The `<ALIAS>` tag registers alternative names for a module, property or method

Examples:

	:::xml
	<METHOD name="getProperty">
			<ALIAS new="get_property"/>
	</METHOD>


### TEMPLATES

Templates add default behavior to modules, based on the templates present [here](https://github.com/rhomobile/rhodes/tree/master/res/generators/templates/api/xml_templates).


#### DEFAULT_INSTANCE

The `DEFAULT_INSTANCE` template is appropriate for factory-style modules. It provides static methods in your module class that delegate to the instance returned by `getDefault` (and which can be changed with `setDefault`). For example, the [Camera API](../api/camera) lets you enumerate cameras and use one in particular to take an image but you can also call static methods directly on the `Camera` class and it will use the default camera on the device. This template provides an implementation of

* `getDefault`
* `setDefault`

Example:

	:::xml
	<TEMPLATE>
		<DEFAULT_INSTANCE/>
	</TEMPLATE>

#### PROPERTY_BAG

The `PROPERTY_BAG` template allows your module to get and set its properties in a generic way in addition to specific property getters and setters. It provides:

* `getProperty(name)` - get the value of a single property
* `getProperties(names)` - return a hash with the values of an array of properties
* `setProperty(name,value)` - set a single property
* `setProperties(hash)` - set multiple properties in a single call

Example:
	:::xml
	<TEMPLATES>
		<PROPERTY_BAG/>
	</TEMPLATES>

### CONSTANTS

Container for `<CONSTANT>` elements

#### CONSTANT

Defines a Ruby and JavaScript constant in a module

	:::xml
	<CONSTANT name="SUNDAY" value="Sun" type="STRING"/>
	<CONSTANT name="MONDAY" value="Mon" type="STRING"/>
	<CONSTANT name="DAYS_PER_WEEK" value="2" type="INTEGER"/>


### PROPERTIES

Declare properties of your module, either on instances or for static access, with the `<PROPERTY>` tag

#### PROPERTY


	:::xml
	<MODULE name="Example" parent="Rho">
		<PROPERTIES>
			<!-- STATIC properties are accessed directly from the module class, "Example" in this case -->
			<PROPERTY access="STATIC" name="customProperty" type="STRING"/>
			<!-- INSTANCE properties need a specific instance object - see example below-->
			<PROPERTY access="INSTANCE" name="color" type="STRING"/>
		</PROPERTIES>
	</MODULE>

The above results in the following properties being accessible:

	:::javascript
	// JavaScript code
	Rho.Example.customProperty="exampleValue"; // static access
	Rho.Example.getDefault().color="#FF0000"; // instance access

The `<PROPERTY>` tag accepts several attributes apart from `name`:

* `access` : either `"STATIC"` or `"INSTANCE"`, describes how the property is accessed
* `usePropertyBag` : one of
	- `none` : any generated property bag code will not integrate this property
	- `accessorsViaPropertyBag` : `get<name>` and `set<name>` will delegate to `getProperty` and `setProperty`
	- `propertyBagViaAccessors` : `getProperty` and `setProperty` will delegate to `get<name>` and `set<name>`
* `nativeName` : the actual name used for the `get` and `set` methods. Example:

		:::xml
		<PROPERTY name="color" nativeName="redgreenblue"/>

	Will be used like:
	
		:::javascript
		var color = Rho.Example.getredgreenblue();
		Rho.Example.setProperty("color","#FF0000");

* `generateAccessors` : defaults to true, set to false if you do not need the `get<name>` and `set<name>` methods
* `type` : the type of the property (`"STRING"`, `"INTEGER"`, etc.)
* `readOnly` : defaults to false, determines whether the `set<name>` method will be generated and makes `setProperty` throw an exception
* `default` : the default value for the property
* `generateAPI` : defaults to true; if set to false the generator will not create `get<name>` and `set<name>` methods, you will have to implement them in Ruby and JavaScript yourself
* `runInThread` : affects the thread that the `set<name>` method runs in:
  - `none` : no special threading
  - `module` : the method runs in a per-module thread
  - `separate` : a new thread is launched for each method invocation
  - `ui` : the method runs on the UI thread


### VALUES

If a property (`<PROPERTY>`) only accepts a predefined set of values, use the `<VALUES>` and `<VALUE>` tags:

	:::xml
    <VALUES>
        <VALUE value="WIDE" constName="WIDTH_WIDE" type="STRING"/>
        <VALUE value="NARROW" constName="WIDTH_NARROW" type="STRING"/>
    </VALUES>

The accepted attributes of the `<VALUE>` tag are:

* `value` : mandatory
* `type` : optional, defaults to `"STRING"`. Any basic type (`STRING`, `INTEGER`, `BOOLEAN`, `FLOAT`) can be used
* `constName` : optional; if specified, the generator will create static constants in the module file

The above snippet will produce the following code for Android:

	:::java
	public interface IGreetingSingleton
	{

	    static final String WIDTH_WIDE = "WIDE";
	    static final String WIDTH_NARROW = "NARROW";
	}	

iOS:
	:::c
	#define WIDTH_WIDE @"WIDE"
	#define WIDTH_NARROW @"NARROW"


### METHODS

The `<METHODS>` tag contains one `<METHOD>` subtag for each method you implement in your extension

`<METHOD>` recognizes the following attributes:

* `name` : mandatory, the name of the method in Ruby / JavaScript
* `nativeName` : if present it will override `name` as the name of the native method. Otherwise, the name will be generated by removing invalid symbols from `name` for each platform.
* `hasCallback` : defaults to `"none"`
  - `hasCallback="none"` (the default): the method will return a result value synchronously
  - `hasCallback="mandatory"` : the method will never return a value and will always invoke its callback
  - `hasCallback="optional"` : if a callback is present, it will be used, otherwise, the method will return its result synchronously

* `runInThread` : affects the thread that the method runs in. Defaults to `"module"` if a callback is present
  - `none` : no special threading, the method runs in the current thread even if a callback is present
  - `module` : the method runs in a per-module queue thread
  - `separate` : a new thread is launched for each method invocation
  - `ui` : the method runs on the UI thread

If the method runs in a thread (any value other than `"none"`, it can only return a result via callback. If the callback is absten, the return value will be lost)

* `deprecated` : defaults to `false`. Document the method as deprecated
* `generateAPI` : defaults to `true`. If `false`, no native code will be generated for the method and you will need to implement it in Ruby and JavaScript yourself.
* `generateDoc`: defaults to `true`. If `false`, the module is considered to be internal and will not be documented.
* `access`: defaults to `"INSTANCE"`. If set to `"STATIC"`, the method will be available for static calls via the module class.
* `generateNativeAPI`: defaults to `true`. If `false`, native C wrappers for Ruby and JavaScript will not be created.
* `constructor`: defaults to `false`. If `true`, the method will be called from the constructor when an object is instantiated
* `destructor`: defaults to `false`. If `true`, the method will be called from the destructor when an object is released

#### PARAMS

The `<PARAMS>` tag declares the parameters that a `<METHOD>` accepts

	:::xml
    <METHOD name="welcome" access="STATIC">
        <PARAMS>
            <PARAM name="user" type="STRING"/>
        </PARAMS>
	</METHOD>	

    <METHOD name="welcome" access="STATIC">
        <PARAMS>
            <PARAM name="user" type="STRING"/>
        </PARAMS>
	</METHOD>	

`<PARAM>` accepts these attributes and subtags:

* `name`: determines the name of the parameter in the native implementations
* `type`: defaults to `STRING`, can be any of: `STRING`, `INTEGER`, `BOOLEAN`, `FLOAT`, `HASH`, `ARRAY`
* `propertyHash`: defaults to `false`, only valid for `type="HASH"`. If `true`, the hash will be converted internally to use values declared in `<PROPERTY>` tags
* `default`: specify the default value of the parameter if none is provided

`<CAN_BE_NIL>` declares that a parameter is optional and can be omitted

#### RETURN

A `<METHOD>` declaration may include a `<RETURN>` tag to specify that the method returns a value.

Example:

	:::xml
	<METHOD name="welcome">
		<RETURN type="STRING">
			<DESC>description of the return value</DESC>
		</RETURN>
	</METHOD>

Methods that return a hash can describe which keys will be present using `<PARAMS>` with the same syntax seen above for method parameters

	:::xml
	<METHOD name="getStatus">
		<RETURN type="HASH">
			<DESC>description of the return value</DESC>
			<PARAMS>
				<PARAM name="total" type="INTEGER"/>
				<PARAM name="synchronized" type="INTEGER"/>
				<PARAM name="pending" type="INTEGER"/>
				<PARAM name="error" type="INTEGER"/>
			</PARAMS>
		</RETURN>
	</METHOD>

This also declares constants in the native implementation with the prefix HK (Hash Key):

Android:
	:::java
    static final String HK_ERROR = "error"; 
    static final String HK_PENDING = "pending"; 
    static final String HK_SYNCHRONIZED = "synchronized"; 
    static final String HK_TOTAL = "total"; 

C++:

	:::cplusplus
    static const char HK_ERROR[] = "error"; 
    static const char HK_PENDING[] = "pending"; 
    static const char HK_SYNCHRONIZED[] = "synchronized"; 
    static const char HK_TOTAL[] = "total"; 


#### CALLBACK

Whenever a method accepts a callback, it must be documented with the `<CALLBACK>` tag:

	:::xml
	<METHOD name="getProperties">
		<RETURN type="HASH">
		...
		</RETURN>
		<CALLBACK type="HASH">
			<PARAMS>
				<PARAM name="total" type="INTEGER"/>
				<PARAM name="synchronized" type="INTEGER"/>
				<PARAM name="pending" type="INTEGER"/>
				<PARAM name="error" type="INTEGER"/>
			</PARAMS>
		</CALLBACK>

The `<CALLBACK>` tag uses exactly the same syntax as `<RETURN>`.

## Platform-specific notes

### Android

* `ext/platform/android/ext_java.files` contains a list of the files that are required for an extension to build. If you add new Java files to your extension, you must add them to this list also or they will not be found at compile-time.

* Making changes to application AndroidManifest.xml

You can specify changes to AndroidManifest.xml in the ext.yml file as a list of paths to the files containing change instructions. There are three formats recognized by the build system, depending on the file extension:

* .xml - xml file with common AndroidManifest.xml format; its tags will be merged into the final manifest.
* .erb - ruby templates which will be injected into the final manifest.
* .rb - ruby script which will run by the manifest erb generator.

	android:
	  manifest_changes:
	  - ext/yourextension/platform/android/AndroidManifestAdds.xml
	  - ext/yourextension/platform/android/ApplicationTagAdds1.erb
	  - ext/yourextension/platform/android/ApplicationTagAdds2.erb
	  - ext/yourextension/platform/android/ManifestTagAdds.erb
	  - ext/yourextension/platform/android/AndroidManifestScript.rb

#### XML

This is the simplest way, if you know how your manifest has to look. Add the final AndroidManifest.xml to the extension and specify it in ext.yml.
The build system will try to merge all the tags from the file into the final AndroidManifest.xml. If a particular tag exists both in the default Rhodes manifest as well as in the extension, the extension manifest takes priority and will overwrite the default.

	android:
	  manifest_changes: ext/yourextension/platform/android/AndroidManifest.xml

#### ERB template

There are two common levels where additional definitions can be injected into AndroidManifest.xml.

* Application tag
* Manifest tag

To add additional definitions to the Application tag, the template name must fit the file name mask of `Application*.erb`, such as `ApplicationManifestAdds.erb`.

To add additional definitions to Manifest tag, the template name must fit the file name mask of `Manifest*.erb`.

There may be a number of templates of each type.
In the template, you may access manifest generator fields which hold values that are frequently-used in manifest generation. The list of available values is documented below, under the heading "ERB Manifest Generator".

Below is example of a broadcast receiver definition added to 'application' tag by rhoconnect-push extension:

	:::xml
	<receiver android:name="com.motsolutions.rhomobile.services.ans.test3.ANSBroadcastReceiver"
	          android:permission="com.motsolutions.cto.services.ans.permission.RECEIVE"
	          android:enabled="true">
	    <!-- Receive actual messages -->
	    <intent-filter>
	        <action android:name="com.motsolutions.cto.services.ans.action.RECEIVE" />
	        <category android:name='<%=@appPackageName%>' />
	    </intent-filter>
	    <!-- Receive registration ids -->
	    <intent-filter>
	        <action android:name="com.motsolutions.cto.services.ans.action.REGISTRATION" />
	        <category android:name='<%=@appPackageName%>' />
	    </intent-filter>
	</receiver>


#### RB script

In case the methods listed above are not enough, you can write your own script that will change the values used to generate the manifest.
You can have a single script per extension.

In the script, you may access the ERB generator instance as a local variable.

	:::ruby
	generator.permissions["#{generator.appPackageName}.permission.ANS"] = 'signature'
	generator.usesPermissions << "#{generator.appPackageName}.permission.ANS"
	generator.usesPermissions << 'com.motsolutions.cto.services.ans.permission.REGISTER'

#### ERB Manifest Generator

The following generator fields may be accessed from erb templates or scripts.

* javaPackageName - read-only string
* appPackageName - read-only string
* versionName - read-write string
* versionCode - read-write string
* installLocation - read-write string
* minSdkVer - read-write string
* maxSdkVer - read-write string
* permissions - hash of permission name/protectionLevel pairs
* usesPermissions - array of permission names
* usesLibraries - hash of library name/isRequired pairs
* screenOrientation - read-write string
* debuggable - read-write string (allows two values: 'true' or 'false')
* rhodesActivityIntentFilters - array of hashes with filter values. Each hash can contain next keys:
** :act - string, intent action name
** :cat - array of strings with category names
** :data - hash with data tag attributes (name/value pairs)
* manifestManifestAdds - array of strings with full paths to erb templates for 'manifest' tag
* applicationManifestAdds - array of strings with full paths to erb templates for 'application' tag

For more details about the values for the generator fields, refer to [Android Developer Documentation](http://developer.android.com/guide/topics/manifest/manifest-intro.html).

You may also look in your Rhodes installation under /platform/android/Rhodes/AndroidManifest.xml.erb to study how these values are used.

## Platform Notes

### Using Resources

If you want to use any resources in your code, use com.rhomobile.rhodes.R instead of just R. This will make all resources (include your additonal resources) accessible from this R file.

### Calling JNI Functions at Android

If you need to call JNI functions from your native code, you need to retrieve the `JNIEnv *env` variable. To get it, include the file `RHO_ROOT/platform/android/Rhodes/jni/include/rhodes.h` in your C/C++ files. The global function `JNIEnv *jnienv()` is defined in this file, so use it anywhere when `JNIEnv *`is needed.

### Using Prebuilt Libraries (jars)

If your native extension uses prebuilt libraries (jars), your build script must copy all such jar files to the TARGET_TEMP_DIR. The jar files must have the extension '.jar'; RhoMobile will include these files automatically in the final build.

### Creating Native Threads

If your native extension creates a native thread (using pthread_create, for example), this thread should be attached to the JVM so that it can call Java methods from its context. Do this by using the rho_nativethread_start/rho_nativethread_end functions, called at the start/end of your thread routine. 

Example:

	:::cpp
	void *thread_routine(void *arg)
	{
	  void *q = rho_nativethread_start();
	  .....
	  rho_nativethread_end(q);
	  return NULL;
	}

Otherwise, if the thread is not attached to the JVM, no JNI calls should be performed in its context (otherwise it will cause your application to crash).

### Providing Additional DLLs for Windows Mobile

If your application needs additional DLLs, put them in the TARGET_TEMP_DIR. The Rhodes build scripts will detect them and include them in the final binary automatically.

