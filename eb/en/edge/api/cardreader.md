#CardReader


## Overview
<p>The Card Reader module decodes the card data when read through a card reader attachment. Currently this is available only on Motorola Solutions devices.</p>
<p>Only the foreground RhoElements application is given access to the card reader hardware, when an application is sent to the background its state will be saved and it will automatically relinquish control of the card reader. When brought back to the foreground, an application previously using the card reader will have its previous configuration (eg. pinTimeout) reapplied to the card reader automatically.</p>

<h2>Enabling the API</h2>

<p>In order to use this API you must include the following extension in your <code>build.yml</code>.</p>

<pre><code>:::ruby
extensions: ["cardreader"]
</code></pre>

<p>The <code>cardreader</code> extension is also included automatically if you specify the following in your <code>build.yml</code>.</p>

<pre><code>:::ruby
app_type: "rhoelements"
</code></pre>

<p>NOTE: If you are building a Windows Mobile or Windows CE app with this API, you must set your app_type as &ldquo;rhoelements&rdquo; in your build.yml as shown <a href="../guide/build_config#other-build-time-settings">here</a>.</p>

<h2>JavaScript Usage</h2>

<p>Be sure to review the <a href="/guide/api_js">JavaScript API Usage</a> guide for important information about using this API in JavaScript.</p>

<h2>Ruby Usage</h2>

<p>Be sure to review the <a href="/guide/api_ruby">Ruby API Usage</a> guide for important information about using this API in Ruby.</p>



##Methods



### close()
Closes the card reader.

### enumerate()
Enumerates all the available card readers.

### getAllProperties()
This method will return all of object/value pairs for the propertyNames of the API class.

### getDefault()
This method will return an object that represents the default instance of the API Class. For example Camera.getDefault will return a Camera object that represents the default camera.

### getProperties()
This method will return a set of object/value pairs for the list of the propertyName that is passed in. The propertyNames must be a valid property of the API class.

### getProperty()
This method will return the value of the propertyName that is passed in. The propertyName must be a valid property of the API class.

### open()
Opens the card reader.

### setDefault()
This method allows you to set the attributes of the default object instance by passing in an object of the same class.

### setProperties()
This method will set the values of a list of properties for the API class. The propertyName must be a valid property for the class and must also not be read only.

### setProperty()
This method will set the value of a property for the API class. The propertyName must be a valid property for the class and must also not be read only.