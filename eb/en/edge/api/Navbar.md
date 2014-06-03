#Navbar


## Overview
<p>The NavBar API supports a native navigation bar for iOS devices.</p>
<h2>Enabling the API</h2>

<p>This API is part of the <code>coreapi</code> extension that is included automatically.</p>

<pre><code>:::ruby
extensions: ["coreapi"]
</code></pre>

<h2>JavaScript Usage</h2>

<p>Be sure to review the <a href="/guide/api_js">JavaScript API Usage</a> guide for important information about using this API in JavaScript.</p>

<h2>Ruby Usage</h2>

<p>Be sure to review the <a href="/guide/api_ruby">Ruby API Usage</a> guide for important information about using this API in Ruby.</p>



##Methods



### create()
Removes the current NavBar and replaces it with this one.

### remove()
Removes the current navigation bar. Does nothing if there is no active navigation bar.

### started()
Return true is navbar is started (used only for automatic tests)