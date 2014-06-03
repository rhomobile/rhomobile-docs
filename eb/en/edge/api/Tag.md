#Tag


## Overview
<p>NFC Tag</p>
<p>This class representative NFC Tag object</p>

<h1>Enabling the API</h1>

<p>In order to use this API you must include the following extension in your <code>build.yml</code></p>

<pre><code>:::ruby
extensions: ["nfc"]
</code></pre>

<p>NOTE: If you are building a Windows Mobile or Windows CE app with this API, you must set your app_type as &ldquo;rhoelements&rdquo; in your build.yml as shown <a href="../guide/build_config#other-build-time-settings">here</a>.</p>



##Methods



### close()
release resources, close connection

### exchangeData()
This function exchanges raw data with Tag

### formatNDEF()
format Tag to NDEF type

### getTagById()
This function returns Tag object

### makeReadOnly()
make Tag read only

### writeMessage()
write messages on Tag. On the current moment only 1 message is supported.