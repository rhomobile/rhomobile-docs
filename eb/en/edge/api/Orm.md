#ORM


## Overview
<p>This JavaScript API class allows you to interact with the local RHOM database and programatically add models or get references to models.</p>
<h2>Enabling the API</h2>

<p>This API is part of the <code>coreapi</code> extension that is included automatically.</p>

<pre><code>:::ruby
extensions: ["coreapi"]
</code></pre>

<h2>JavaScript Usage</h2>

<p>Be sure to review the <a href="/guide/api_js">JavaScript API Usage</a> guide for important information about using this API in JavaScript.</p>

<p>If you are going to be using the JS ORM API, you&rsquo;ll also need to include this line in any files that will be using it:</p>

<pre><code>:::html
&lt;script type="text/javascript" charset="utf-8" src="/public/api/rhoapi-modules-ORM.js"&gt;&lt;/script&gt;
</code></pre>

<h2>Ruby Usage</h2>

<p>For Ruby access to the RHOM database please see the <a href="/api/rhom-api">Rhom Ruby API guide</a>.</p>



##Methods



### addModel()
Creates an ORM model reference.

### databaseFullReset()
Deletes all records from the property bag and model tables.

### databaseFullResetAndLogout()
Deletes all records from the property bag and model tables. Logout the user from RhoConnectClient. For examples, see Resetting the Database in Using the Local Database with ORM.

### databaseFullResetEx()
Deletes all records from the property bag and model tables for the model names passed in parameters.

### databaseFullclientResetAndLogout()
Deletes all records from the property bag and model tables. Logout the user from RhoConnectClient and erase all RhoConnectClient device information. Equivalent to ORM::ORM.databaseFullReset(true) followed by RhoConnectClient.logout.

### databaseLocalReset()
Reset only local (non-sync-enabled) models.

### export()
Export db.

### getClientId()
Returns the current sync client id.

### getModel()
Returns a model.

### haveLocalChanges()
Returns true if any of the Rhodes model objects have local database changes that need to be synchronized, false otherwise.

### import()
Import db.