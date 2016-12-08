# Geolocation API

<div>
  <div class="btn-group">
    <a href="#methods" class="btn"><i class="icon-cog"></i> Methods<sup>&nbsp;11</sup></a>
    <a class="btn dropdown-toggle" data-toggle="dropdown" data-target="#" href="#methods">
      <span class="caret"></span>&nbsp;
    </a>
    <ul class="dropdown-menu" style="max-height: 500px;overflow: auto;">
      <li><a href="#accuracy">accuracy</a></li>
      <li><a href="#altitude">altitude</a></li>
      <li><a href="#haversinedistance">haversine_distance</a></li>
      <li><a href="#knownposition-isknownposition">known_position?, is_known_position</a></li>
      <li><a href="#latitude">latitude</a></li>
      <li><a href="#longitude">longitude</a></li>
      <li><a href="#satellites">satellites</a></li>
      <li><a href="#setnotification">set_notification</a></li>
      <li><a href="#setnotificationex">set_notification_ex</a></li>
      <li><a href="#speed">speed</a></li>
      <li><a href="#turnoff">turnoff</a></li>
    </ul>
  </div>
</div>

Access geolocation information from your device.

Refer to our [Geolocation guide](../guide/geolocation) for more discussion of Geolocation, and for examples.

## Enabling Geolocation

To use the geolocation API, you need to enable geolocation on the device. Do this by adding that capability to the build.yml file:

    :::yaml
    capabilities:
      - gps

**NOTE: We do not have a timeout parameter to automatically turn off the GPS system. If you want to turn off the GPS system, call Geolocation.turnoff.**

## Using JavaScript API

You can call the Geolocation methods from JavaScript as well as Ruby. To use the JavaScript API, add the `public/js/rho_javascript_api.js` file -- created at build time as part of the application package -- to the .html, .erb, or .js file calling the JavaScript method.

The JavaScript API methods with a return value can pass it as a parameter in jQuery-compatible continuation (deferred object, a kind of callback). Possible continuations to handle are done, fail, and complete.

  Rho.Class.method(params).done(function(handler) { /* handler... */ })

You must enable JavaScript by putting `rho-javascript` into extensions in your build.yml.

    :::yaml
    extensions: ["rho-javascript"]

<a name="methods"></a>
<h2><i class="icon-cog"></i>Methods</h2>
<a name="accuracy"></a>
<div id="accuracy"><h3>accuracy()</h3></div>
<ul class="nav nav-tabs">
  <li class="active"><a href="#accuracyDescription" data-toggle="tab">Description</a></li>
  <li><a href="#accuracyReturn" data-toggle="tab">Return</a></li>
  <li><a href="#accuracyAccess" data-toggle="tab">Access</a></li>
  <li><a href="#accuracyExamples" data-toggle="tab">Examples</a></li>
</ul>

<div class="tab-content">
  <!-- accuracyDescription Tab -->
  <div class="tab-pane fade in active" id="accuracyDescription">
    Returns the estimated accuracy of the fix.
    Units: Horizontal radius in Meters.
    <p></p>
    <div>
      <p>
        <img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Javascript">
        <img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby">
        <img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android">
        <img src="/img/ios.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="iphone, ipod touch, ipad">
      </p>
    </div>
  </div>

  <!-- accuracyReturn Tab -->
  <div class="tab-pane fade" id="accuracyReturn">
    Float
  </div>

  <!-- accuracyAccess Tab -->
  <div class="tab-pane fade" id="accuracyAccess">
    <p>Ruby: <code>Geolocation.accuracy</code></p>
    <p>JavaScript: <code>Rho.Geolocation.accuracy();</code></p>
  </div>

  <!-- accuracyExamples Tab -->
  <div class="tab-pane fade" id="accuracyExamples">
    Ruby
    <pre class='CodeRay'>
      <code>:::ruby
def get_accuracy
  accuracy = Geolocation.accuracy
  Alert.show_popup accuracy
end</code>
    </pre>
    JavaScript
    <pre class='CodeRay'>
      <code>:::javascript
function getAccuracy(){
  var accuracy = Rho.Geolocation.accuracy;
  alert(accuracy);
}</code>
    </pre>
  </div>
</div>

<a name="altitude"></a>
<div id="altitude"><h3>altitude()</h3></div>
<ul class="nav nav-tabs">
  <li class="active"><a href="#altitudeDescription" data-toggle="tab">Description</a></li>
  <li><a href="#altitudeReturn" data-toggle="tab">Return</a></li>
  <li><a href="#altitudeAccess" data-toggle="tab">Access</a></li>
  <li><a href="#altitudeExamples" data-toggle="tab">Examples</a></li>
</ul>

<div class="tab-content">
  <!-- Description -->
  <div class="tab-pane fade in active" id="altitudeDescription">
    Returns the altitude if available, if not available 0 is returned.
    Units: Meters above sea level.
    <p></p>
    <div>
      <p>
        <img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Javascript">
        <img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby">
        <img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android">
        <img src="/img/ios.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="iphone, ipod touch, ipad">
        <img src="/img/windowsmobile.png" style="height: 20px; padding-top: 8px;" rel="tooltip" title="">
      </p>
    </div>
  </div>

  <!-- Return -->
  <div class="tab-pane fade" id="altitudeReturn">
    Double
  </div>

  <!-- Access -->
  <div class="tab-pane fade" id="altitudeAccess">
    <p>Ruby: <code>Geolocation.altitude</code></p>
    <p>JavaScript: <code>Rho.Geolocation.altitude();</code></p>
  </div>

    <!-- altitudeExamples Tab -->
  <div class="tab-pane fade" id="altitudeExamples">
    Ruby
    <pre class='CodeRay'>
      <code>:::ruby
def get_altitude
  altitude = Geolocation.altitude
  Alert.show_popup.altitude
end</code>
    </pre>
    JavaScript
    <pre class='CodeRay'>
      <code>:::javascript
function getAltitude(){
  var altitude = Rho.Geolocation.altitude;
  alert(altitude);
}</code>
    </pre>
  </div>
</div>

<a name="haversinedistance"></a>
<div id="haversinedistance"><h3>haversine_distance<span style="font-size:.7em;font-weight:normal;">(
<span class="text-info">FLOAT</span> latitude1,
<span class="text-info">FLOAT</span> longitude1,
<span class="text-info">FLOAT</span> latitude2,
<span class="text-info">FLOAT</span> longitude2
)</span></h3></div>
<ul class="nav nav-tabs">
    <li class="active"><a href="#haversinedistanceDescription" data-toggle="tab">Description</a></li>
    <li><a href="#haversinedistanceParams" data-toggle="tab">Parameters</a></li>
    <li><a href="#haversinedistanceAccess" data-toggle="tab">Access</a></li>
</ul>

<div class="tab-content">
  <!-- haversinedistanceDescription Tab -->
  <div class="tab-pane fade in active" id="haversinedistanceDescription">
    Returns the distance between two points in miles.
  </div>

  <!-- haversinedistanceParams Tab -->
  <div class="tab-pane fade" id="haversinedistanceParams">
    <ul>
      <li><code>latitude1</code> - Latitude of the first point in degrees.</li>
      <li><code>longitude1</code> - Longitude of the first point in degrees.</li>
      <li><code>latitude2</code> - Latitude of the second point in degrees.</li>
      <li><code>longitude2</code> - Longitude of the second point in degrees.</tr>
    </ul>
  </div>

  <!-- haversinedistanceExamples Tab -->
  <div class="tab-pane fade" id="haversinedistanceAccess">
    <p>Ruby: <code>Geolocation.haversine_distance(latitude1, longitude1, latitude2, longitude2)</code></p>
    <p>JavaScript: <code>Rho.Geolocation.haversine_distance(latitude1, longitude1, latitude2, longitude2);</code></p>
  </div>
</div>

<a name="knownposition-isknownposition"></a>
<div id="knownposition-isknownposition"><h3>known_position?, is_known_position()</h3></div>
<ul class="nav nav-tabs">
  <li class="active"><a href="#knownposition-isknownpositionDescription" data-toggle="tab">Description</a></li>
  <li><a href="#knownposition-isknownpositionAccess" data-toggle="tab">Access</a></li>
  <li><a href="#knownposition-isknownpositionReturn" data-toggle="tab">Return</a></li>
</ul>

<div class="tab-content">
  <!-- knownposition-isknownpositionDescription Tab -->
  <div class="tab-pane fade in active" id="knownposition-isknownpositionDescription">
    Returns true if the location system is up and running, false otherwise. is_known_position returns null if this feature is not supported on the device platform.
  </div>

  <!-- knownposition-isknownpositionAccess Tab -->
  <div class="tab-pane fade" id="knownposition-isknownpositionAccess">
    <p>Ruby: <code>Geolocation.known_position?</code></p>
    <p>JavaScript: <code>Rho.Geolocation.is_known_position();</code></p>
  </div>

  <!-- knownposition-isknownpositionReturn Tab -->
  <div class="tab-pane fade" id="knownposition-isknownpositionReturn">
    Boolean
  </div>
</div>

<a name="latitude"></a>
<div id="latitude"><h3>latitude()</h3></div>
<ul class="nav nav-tabs">
    <li class="active"><a href="#latitudeDescription" data-toggle="tab">Description</a></li>
    <li><a href="#latitudeAccess" data-toggle="tab">Access</a></li>
    <li><a href="#latitudeReturn" data-toggle="tab">Return</a></li>
</ul>

<div class="tab-content">
  <!-- latitudeDescription Tab -->
  <div class="tab-pane fade in active" id="latitudeDescription">
    Returns current latitude in degrees.
  </div>

  <!-- latitudeAccess Tab -->
  <div class="tab-pane fade" id="latitudeAccess">
    <p>Ruby: <code>Geolocation.latitude</code></p>
    <p>JavaScript: <code>Rho.Geolocation.latitude();</code></p>
  </div>

  <!-- latitudeReturn Tab -->
  <div class="tab-pane fade" id="latitudeReturn">
    Float
  </div>
</div>

<a name="longitude"></a>
<div id="longitude"><h3>longitude()</h3></div>
<ul class="nav nav-tabs">
    <li class="active"><a href="#longitudeDescription" data-toggle="tab">Description</a></li>
    <li><a href="#longitudeAccess" data-toggle="tab">Access</a></li>
    <li><a href="#longitudeReturn" data-toggle="tab">Return</a></li>
</ul>

<div class="tab-content">
  <!-- longitudeDescription Tab -->
  <div class="tab-pane fade in active" id="longitudeDescription">
    Returns current longitude in degrees.
  </div>

  <!-- longitudeAccess Tab -->
  <div class="tab-pane fade" id="longitudeAccess">
    <p>Ruby: <code>Geolocation.longitude</code></p>
    <p>JavaScript: <code>Rho.Geolocation.longitude();</code></p>
  </div>

  <!-- longitudeReturn Tab -->
  <div class="tab-pane fade" id="longitudeReturn">
    Float
  </div>
</div>

<a name="satellites"></a>
<div id="satellites"><h3>satellites()</h3></div>
<ul class="nav nav-tabs">
    <li class="active"><a href="#satellitesDescription" data-toggle="tab">Description</a></li>
    <li><a href="#satellitesReturn" data-toggle="tab">Return</a></li>
    <li><a href="#satellitesAccess" data-toggle="tab">Access</a></li>
    <li><a href="#satellitesExamples" data-toggle="tab">Examples</a></li>
</ul>

<div class="tab-content">
  <!-- Description -->
  <div class="tab-pane fade in active" id="satellitesDescription">
    Returns the number of satellites used to determine the fix. If this information isn't available, null is returned.
    <p></p>
    <div>
      <p>
        <img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Javascript">
        <img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby">
        <img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android">
        <img src="/img/windowsmobile.png" style="height: 20px; padding-top: 8px;" rel="tooltip" title="">
      </p>
    </div>
  </div>

  <!-- Return -->
  <div class="tab-pane fade" id="satellitesReturn">
    Integer
  </div>

  <!-- ruby_satellites Tab -->
  <div class="tab-pane fade" id="satellitesExamples">
    Ruby
    <pre class='CodeRay'>
      <code>:::ruby
def get_satellites
  satellites = Geolocation.satellites
  Alert.show_popup.satellites
end</code>
    </pre>
    JavaScript
    <pre class='CodeRay'>
      <code>:::javascript
function getSatellites(){
  var satellites = Rho.Geolocation.satellites;
  alert(satellites);
}</code>
    </pre>
  </div>

  <!-- jsSatellites Tab -->
  <div class="tab-pane fade" id="satellitesAccess">
    <p>Ruby: <code>Geolocation.satellites</code></p>
    <p>JavaScript: <code>Rho.Geolocation.satellites();</code></p>
  </div>
</div>

<a name="setnotification"></a>
<div id="setnotification"><h3>set_notification<span style="font-size:.7em;font-weight:normal;">(
<span class="text-info">CALLBACK</span> callback_url,
<span class="text-info">STRING</span> callback_params,
<span class="text-info">INT</span> ping_gpssystem_interval
)</span></h3></div>
<ul class="nav nav-tabs">
  <li class="active"><a href="#setnotificationDescription" data-toggle="tab">Description</a></li>
  <li><a href="#setnotificationParams" data-toggle="tab">Parameters</a></li>
  <li><a href="#setnotificationAccess" data-toggle="tab">Access</a></li>
  <li><a href="#setnotificationCallback" data-toggle="tab">Callback</a></li>
</ul>

<div class="tab-content">
  <!-- setnotificationDescription Tab -->
  <div class="tab-pane fade in active" id="setnotificationDescription">
    <p>Set callback to track location changes.</p>
NOTE: You only need to call Geolocation.set_notification once. The current behavior of the callback is that it will be called forever until it is stopped; you need to call <code>Geolocation.turnoff</code> to stop it. The previous behavior was that the callback was called once and needed to be reset.
  </div>

  <!-- setnotificationAccess Tab -->
  <div class="tab-pane fade" id="setnotificationAccess">
    NOTE: The callback_url parameter must be set in order for Geolocation to function.
    <p>Ruby: <code>Geolocation.set_notification(callback_url, callback_params, ping_gpssystem_interval)</code></p>
    <p>JavaScript: <code>Rho.Geolocation.set_notification(callback, callback_params, ping_gpssystem_interval);</code></p>
  </div>

  <!-- setnotificationParams -->
  <div class="tab-pane fade" id="setnotificationParams">
    <ul>
      <li><code>callback_url</code> - url for the callback method called upon a location change notification or for the interval set by ping_gpssystem_interval.</li>
      <li><code>callback_params</code> - a string added to the body of the callback url. You can use it to identity who is setting up the callback, such as "my_tag=55". In general you do not set callback_param (leave it blank as in "").</li>
      <li><code>ping_gpssystem_interval</code> - (optional) If 0, the system interval is used; the callback is executed when the GPS system processes a location update (dependent on the mobile platform). If set to a number (such as 3), the callback is executed at an interval of this number of seconds (such as every three seconds).</li>
    </ul>
  </div>

  <!-- setnotificationCallback -->
  <div class="tab-pane fade" id="setnotificationCallback">
    <p>When the Geolocation.set_notification callback is called, it will receive a variable called @params, just like a normal Rhodes controller action. Here are the parameters included in the @params variable.</p>
      <ul>
        <li><code>known_position</code> - 1 or 0. Return from known_position? method.</li>
        <li><code>latitude</code> - Return from call to latitude method.</li>
        <li><code>longitude</code> - Return from call to longitude method.</li>
        <li><code>available</code> - 1 if geolocation is available, 0 otherwise. For 1, not only does the hardware exist, but also the user can turn GPS off in phone settings, or not allow GPS activity on iPhone, etc.</li>
        <li><code>status</code> - "ok" or "error"</li>
        <li><code>error_code</code> - error code from <a href="rhoerror">RhoError</a>.</li>
        <li><code>accuracy</code> - horizontal radius in meters; iOS and Android.</li>
      </ul>
  </div>
</div>

<a name="setnotificationex"></a>
<div id="setnotificationex"><h3>set_notification_ex<span style="font-size:.7em;font-weight:normal;">(
<span class="text-info">CALLBACK</span> url,
<span class="text-info">STRING</span> callbackParams,
<span class="text-info">HASH</span> options
)</span></h3></div>
<ul class="nav nav-tabs">
  <li class="active"><a href="#setnotificationexDescription" data-toggle="tab">Description</a></li>
  <li><a href="#setnotificationexParams" data-toggle="tab">Parameters</a></li>
  <li><a href="#setnotificationexAccess" data-toggle="tab">Access</a></li>
  <li><a href="#setnotificationexCallback" data-toggle="tab">Callback</a></li>
</ul>

<div class="tab-content">
  <!-- setnotificationexDescription Tab -->
  <div class="tab-pane fade in active" id="setnotificationexDescription">
    Extended notification which encompasses the recently added features.

NOTE: There is no valid data related to distance, which the Geolocation API exposes in WM and hence there is no support for extended notification in WM.
  </div>

  <!-- setnotificationexParams -->
  <div class="tab-pane fade" id="setnotificationexParams">
    NOTE: minDistance and minTimeout values are optional; if nothing is provided, whenever a location update is processed by the underlying system, it is sent to the application. It is supported only on Android devices.
    <ul>
      <li><code>url</code> - Callback method to be invoked on any notification.</li>
      <li><code>callbackParams</code> - To be used when callback is invoked. It is generally used to know the source of the callback. This is optional.</li>
      <li><code>options</code> - This is a hash and can consist of the following two keys:</li>
        <ul>
          <li><code>minDistance</code> - Minimum moving distance(in meters) to invoke the callback again.</li>
          <li><code>minTimeout</code> - Minimum timeout for next callback invocation.</li>
        </ul>
    </ul>
  </div>

  <!-- setnotificationexAccess Tab -->
  <div class="tab-pane fade" id="setnotificationexAccess">
    <p>Ruby: <code>Geolocation.set_notification_ex(callback url, string callbackParams, options hash)</code></p>
    <p>JavaScript: <code>Rho.Geolocation.set_notification_ex(callback url, string callbackParams, options hash);</code></p>
  </div>

  <!-- setNotificationExCallback -->
  <div class="tab-pane fade" id="setnotificationexCallback">
    <p>When the callback happens, it will provide the following parameters:</p>
      <ul>
        <li><code>known_position</code> - 1 or 0. Return from known_position? method.</li>
        <li><code>latitude</code> - Value returned by <code>Geolocation.latitude()</code> method.</li>
        <li><code>longitude</code> - Value returned by <code>Geolocation.longitude()</code> method.</li>
        <li><code>altitude</code> - Value returned by <code>Geolocation.altitude()</code> method.</li>
        <li><code>speed</code> - Value returned by <code>Geolocation.speed()</code> method.</li>
        <li><code>accuracy</code> - Value returned by <code>Geolocation.accuracy()</code> method.</li>
        <li><code>satellites</code> - Value returned by <code>Geolocation.satellites()</code> method.</li>
        <li><code>available</code> - 1 if geolocation is available, 0 otherwise. For 1, not only does the hardware exist, but also the user can turn GPS off in phone settings, or not allow GPS activity on iPhone, etc.</li>
        <li><code>status</code> - "ok" or "error"</li>
        <li><code>error_code</code> - error code from <a href="rhoerror">RhoError</a>.</li>
      </ul>
  </div>
</div>

<a name="speed"></a>
<div id="speed"><h3>speed()</h3></div>
<ul class="nav nav-tabs">
    <li class="active"><a href="#speedDescription" data-toggle="tab">Description</a></li>
    <li><a href="#speedReturn" data-toggle="tab">Return</a></li>
    <li><a href="#speedAccess" data-toggle="tab">Access</a></li>
    <li><a href="#speedExamples" data-toggle="tab">Examples</a></li>
</ul>

<div class="tab-content">
  <!-- Description -->
  <div class="tab-pane fade in active" id="speedDescription">
    Returns the speed if it is available. If the speed is not available, 0.0 is returned. On iOS it will return a negative speed when it can not calculate it - for example when device detects location not by GPS but by 3G or Wi-Fi triangulation (also in the case where accuracy is too large - about 50 and more meters).
    <p>Units: Meters/sec over ground</p>
    <p></p>
    <div>
      <p>
        <img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Javascript">
        <img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby">
        <img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android">
        <img src="/img/ios.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="iphone, ipod touch, ipad">
        <img src="/img/windowsmobile.png" style="height: 20px; padding-top: 8px;" rel="tooltip" title="">
      </p>
    </div>
  </div>

  <!-- speedReturn Tab -->
  <div class="tab-pane fade" id="speedReturn">
    Float
  </div>

  <!-- speedAccess Tab -->
  <div class="tab-pane fade" id="speedAccess">
    <p>Ruby: <code>Geolocation.speed</code></p>
    <p>JavaScript: <code>Rho.Geolocation.speed();</code></p>
  </div>

  <!-- speedExamples Tab -->
  <div class="tab-pane fade" id="speedExamples">
    <pre class='CodeRay'>
      <code>:::ruby
def get_speed
  speed = Geolocation.speed
  Alert.show_popup speed
end</code>
    </pre>
    <pre class='CodeRay'>
      <code>:::javascript
function getSpeed(){
  var speed = Rho.Geolocation.speed;
  alert(speed);
}</code>
    </pre>
  </div>
</div>

<a name="turnoff"></a>
<div id="turnoff"><h3>turnoff()</h3></div>
<ul class="nav nav-tabs">
    <li class="active"><a href="#turnoffDescription" data-toggle="tab">Description</a></li>
    <li><a href="#turnoffExamples" data-toggle="tab">Examples</a></li>
</ul>

<div class="tab-content">
  <!-- turnoffDescription Tab -->
  <div class="tab-pane fade in active" id="turnoffDescription">
    Turn off Geolocation.

NOTE: When you call <code>Geolocation.turnoff()</code>, after the GPS is switched off, you might still receive a few callbacks (this depends on the platform; iOS and Android does not receive callbacks after turnoff).
  </div>

  <!-- turnoffExamples Tab -->
  <div class="tab-pane fade" id="turnoffExamples">
    Ruby
    <pre class='CodeRay'>
      <code>:::ruby
Geolocation.turnoff</code>
    </pre>
    JavaScript
    <pre class='CodeRay'>
      <code>:::javascript
Rho.Geolocation.turnoff();</code>
    </pre>
  </div>
</div>