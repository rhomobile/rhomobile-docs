#Configreadwrite


## Overview
The Configreadwrite API provides access to read and write to temporary config files in Android platform. It also provides capabilities to update the user configured attribute value in actual config file.
## Enabling the API
In order to use this API you must include the following extension in your `build.yml`.
    :::ruby
    extensions: ["configreadwrite"]

The `configreadwrite` extension is also included automatically if you specify the following in your `build.yml`
    :::ruby
    app_type: "rhoelements"

NOTE: If you are building a Windows Mobile or Windows CE app with this API, you must set your app_type as "rhoelements" in your build.yml as shown [here](../guide/build_config#other-build-time-settings).

## JavaScript Usage
Be sure to review the [JavaScript API Usage](/guide/api_js) guide for important information about using this API in JavaScript.

## Ruby Usage
Be sure to review the [Ruby API Usage](/guide/api_ruby) guide for important information about using this API in Ruby.
        
