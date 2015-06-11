# Launch a RhoMobile application from a URL Scheme

Android and iOS support ways to launch your appication from a custom URL scheme. For example opening the following url in an iOS device will launch the Twitter application:

    :::html
    twitter://user?screen_name=rhomobile


By properly configuring your build.yml, you can also take advantage of being able to launch your application from a URL scheme. This is useful for use on your application's website as well as for interapp communication.

## Android
On Android it is possible to start RhoMobile app from a browser by a http link or a redirect response. It is also possible to register a custom URI scheme for the app.
The URI must strictly follow standard URI rules. Additionally Android makes and additional restriction that the the host part of the URI must be resolvable.
By default the http://rhomobile.com/com.vendor.appname URI format is used by RhoMobile. 

`vendor` and `appname` are parameters that are found in your build.yml

It is possible to customize the URI with build.yml settings. By default a custom RhoMobile URI Scheme contains four parts:
- scheme
- host name
- path prefix
- optional path and query
    :::html
    http://rhomobile.com/com.vendor.appname/Product/new

You can customize the scheme and host name parts with following build.yml parameters:
    :::ruby
    android:
        URIScheme: myapp
        URIHost: www.myhost.com
If the URIHost is specified no path prefix will be used. If no custom URIHost is specified then the default one is used (rhomobile.com) and the path prefix must contain java package name of your application used in your build.yml.
The optional path and query parameters are not needed in the build.yml but are just passed to your application for further processing.

**NOTE: Google recommends to always use common scheme such as 'http', 'https', 'ftp', etc.**

http scheme example:
    :::html
    <a href="http://rhomobile.com/com.rhomobile.rhodessystemapisamples">Open System API Samples</a>
build.yml:
    :::ruby
    vendor: "rhomobile"
    name: "rhodessystemapisamples"

Custom scheme examples:
    :::ruby
    android:
        URIScheme: rho

    :::html
    <a href="rho://rhomobile.com/com.rhomobile.rhodessystemapisamples">Open System API Samples</a>


    :::ruby
    android:
        URIScheme: rho-sas
        URIHost: rhomobile.com

    :::html
    <a href="rho-sas://rhomobile.com">Open System API Samples</a>

## iPhone
On iOS devices it is possible to start your RhoMobile app by link with a special registered URI scheme. You should register your custom URI scheme for the app by setting it up in the build.yml.

Custom scheme example:
    :::ruby
    iphone:
        BundleURLScheme: myapp

    :::html
    <a href="myapp:string_with_params">Open MyApp application</a>

In your application you can get start params by 
    :::ruby
    System.get_start_params()

For the previous example the start params will be "string_with_params".

From another RhoMobile application use can use the [System.openUrl](../api/system#mopenUrl) api:
	:::ruby
	System.openUrl('myapp:string_with_params')

