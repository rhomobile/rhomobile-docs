#NativeToolbar


## Overview
<p>The NativeToolbar method let you create and remove a toolbar at runtime.</p>
<p> Only a Toolbar or a Tabbar can present in application &ndash; both can not be used at the same time.</p>

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
Removes the current toolbar / tabbar and replaces it with this one.

### remove()
Removes the current toolbar. Does nothing if there is no active toolbar.