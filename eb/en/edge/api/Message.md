#Message


## Overview
<p>NFC Message</p>
<p>This class representative NFC Message object</p>

<h1>Enabling the API</h1>

<p>In order to use this API you must include the following extension in your <code>build.yml</code></p>

<pre><code>:::ruby
extensions: ["nfc"]
</code></pre>

<p>NOTE: If you are building a Windows Mobile or Windows CE app with this API, you must set your app_type as &ldquo;rhoelements&rdquo; in your build.yml as shown <a href="../guide/build_config#other-build-time-settings">here</a>.</p>



##Methods



### addMessage()
Add new Smart Poster message to the message.

### addRecord()
Add new Record to Message.

### close()
Release NFC resources.

### create()
Creates message object.

### getContent()
Returns Message as byte array.

### getMessageById()
This function returns Message object.

### getMessages()
Return array of Smart Poster Message objects.

### getRecords()
Return array of Record objects.