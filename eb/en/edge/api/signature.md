#Signature


## Overview
<p>creates a rectangular box within which the user can draw by using a finger or the device&rsquo;s stylus to record handwritten data. Common usages for this tag include the capture of client/customer signatures and the input of handwritten text/notations.</p>
<h2>Enabling the API</h2>

<p>In order to use this API you must include the following extension in your <code>build.yml</code></p>

<pre><code>:::ruby
extensions: ["signature"]
</code></pre>

<p>The <code>signature</code> extension is also included automatically if you specify the following in your <code>build.yml</code></p>

<pre><code>:::ruby
app_type: "rhoelements"
</code></pre>

<p>NOTE: If you are building a Windows Mobile or Windows CE app with this API, you must set your app_type as &ldquo;rhoelements&rdquo; in your build.yml as shown <a href="../guide/build_config#other-build-time-settings">here</a>.</p>

<h2>JavaScript Usage</h2>

<p>Be sure to review the <a href="/guide/api_js">JavaScript API Usage</a> guide for important information about using this API in JavaScript.</p>

<h2>Ruby Usage</h2>

<p>Be sure to review the <a href="/guide/api_ruby">Ruby API Usage</a> guide for important information about using this API in Ruby.</p>



##Methods



### capture()
Captures the in-line signature area as an image. This function works with a non-modal signature capture area shown inside browser window. All in-line signature capture functions (like this) do not has affect the capture area shown in takeFullScreen (modal full screen capture area).

### clear()
Clears an in-line capture area. This function works with a non-modal signature capture area shown inside browser window. All in-line signature capture functions (like this) do not has affect to capture area shown in takeFullScreen (modal full screen capture area) 

### hide()
Hides an in-line capture area from view. It clears the inputed signature for in-line signature areas. In a hidden state, a user cannot interact with the signature capture area. This function work with non-modal signature capture area showed inside browser window. All in-line signature capture functions (like this) do not has affect to capture area showed in takeFullScreen (modal full screen capture area) 

### setVectorCallback()
Signature data is formatted into a series of vectors and returned to the application via this callback function. The received data may not represent the entire signature as the vectors will be sent in batches if the signature is large. A single vector (array entry) contains an X, Y coordinate and the beginning / end of the signature is defined by (65535, 65535). This callback is independent of the callback of the capture method, when specified the callback will be called whenever a 'pen up' occurs in the signature box.

### show()
Show in-line signature window. This function works witha non-modal signature capture area shown inside browser window. All in-line signature capture functions (like this) do not has affect the capture area shown in takeFullScreen (modal full screen capture area).

### takeFullScreen()
Shows a modal window with signature capture area and UI (toolbar with buttons) for cancel / capture and return to main application window. The callback is fired when the signature is closed (when in fullscreen) or when capture is called. In WM/CE, the signature area has visible buttons for 'clear', 'capture' and 'cancel'. In Android / iOS, the signature area has images which will behave as buttons for 'clear', 'capture' and 'cancel'. This function open modal full screen window, therefore other functions related to in-line signature capture (work with inside browser window area) do not affect the capture window shown by this function.