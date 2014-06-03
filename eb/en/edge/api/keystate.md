#KeyState


## Overview
<p>The KeyState API is used to display small icons to the user indicating the current shifted state of the hardware keyboard. The KeyState indicator will display icons for Shift, Alt, Control, Function, Caps, Num lock and Orange key states, growing from the right as necessry if more than one key state is set at once. This API is only supported on a subset of Motorola Solutions' Windows Mobile / CE / Embedded handheld devices (see remarks).</p>
<h2>Enabling the API</h2>

<p>In order to use this API you must include the following extension in your <code>build.yml</code>.</p>

<pre><code>:::ruby
extensions: ["indicators"]
</code></pre>

<p>The <code>indicators</code> extension is also included automatically if you specify the following in your <code>build.yml</code>.</p>

<pre><code>:::ruby
app_type: "rhoelements"
</code></pre>

<p>NOTE: If you are building a Windows Mobile or Windows CE app with this API, you must set your app_type as &ldquo;rhoelements&rdquo; in your build.yml as shown <a href="../guide/build_config#other-build-time-settings">here</a>.</p>

<h2>JavaScript Usage</h2>

<p>Be sure to review the <a href="/guide/api_js">JavaScript API Usage</a> guide for important information about using this API in JavaScript.</p>

<h2>Ruby Usage</h2>

<p>Be sure to review the <a href="/guide/api_ruby">Ruby API Usage</a> guide for important information about using this API in Ruby.</p>



##Methods



### hideStates()
Stops showing keystate icons representing the shifted state of the hardware keyboard.

### showStates()
Display keystate icons representing the shifted state of the hardware keyboard.