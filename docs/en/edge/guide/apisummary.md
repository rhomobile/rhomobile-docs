# RhoMobile API Summary
Below is a list of the new common APIs for RhoMobile Suite 5.5, which are recommended for all new projects. If you're moving a 2.x app to 5.x, please consult the [2.x migration guide](apiusage). 

## 5.5 APIs
<div class="alert alert-warning">
  <p>
    <span class="icon-check icon-primary icon-inverse"  rel="tooltip" title="Supported"></span>
    - API/platform is supported
  </p>
  <p>
    <img src="/img/zebra-logo.png" style="height:16px;padding-top: 0px;padding-left:3px" rel="tooltip" title="Zebra Devices Only">
    - API is available only on Symbol devices
  </p>
</div>

<table class="table table-condensed table-striped">
  <thead>
    <tr>
      <th></th>
      <th colspan="2" style="border-right:thin solid #cccccc;text-align:center">LANGUAGES</th>
      <th colspan = "6" style="text-align:center">PLATFORMS</th>
    </tr>

    <tr>
      <th>Class</th>
      <th style="text-align:center"><img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript"></th>
      <th style="text-align:center;border-right:thin solid #cccccc;"><img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby"></th>
      <th style="text-align:center"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded"></th>
      <th style="text-align:center"><img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android"></th>
      <th style="text-align:center"><img src="/img/ios.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="iphone, ipod touch, ipad"></th>
      <th style="text-align:center"><img src="/img/wp8.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Phone 8, Windows Embedded 8"></th>
      <th style="text-align:center"><img src="/img/windows.jpg" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Desktop"></th>
    </tr>
  </thead>

  <tbody>
    <!--<tr>
      <td>
        <a href="../../2.2.0/rhoelements/addressbar">Addressbar *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhoelements/alarm">Alarm *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
    </tr>-->

    <tr>
      <td>
        <a href="../api/Application">Application</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
    </tr>

     <tr>
      <td>
        <a href="../api/audiocapture">AudioCapture</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <!--<tr>
      <td>
        <a href="../../2.2.0/rhoelements/backlight">Backlight *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
    </tr>-->

    <tr>
      <td>
        <a href="../api/barcode">Barcode</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></span></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../api/battery">Battery</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhodesapi/bluetoothmanager-api">BluetoothManager *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhodesapi/bluetoothsession-api">BluetoothSession *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
    </tr>

    <!-- <tr>
      <td>
        <a href="../api/camera">Camera</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr> -->

    <tr>
      <td>
        <a href="../api/camera">Camera </a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../api/cardreader">CardReader<img src="/img/zebra-logo.png" style="height: 16px;padding-top: 0px;padding-left:3px" rel="tooltip" title="Zebra Devices Only">
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check-empty icon-primary"  rel="tooltip"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <!--<tr>
      <td>
        <a href="../../2.2.0/rhoelements/comm">Comm </a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>-->
    <tr>
      <td>
        <a href="../api/Config">Config </a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <!-- <tr>
      <td>
        <a href="../../2.2.0/rhoelements/ConfigurationSettings">Config *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr> -->

    <!-- <tr>
      <td>
        <a href="../api/contact">Contact</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr> -->

    <tr>
      <td>
        <a href="../api/Database">Database</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
    </tr>
    <tr>
      <td>
        <a href="../api/device">Device<img src="/img/zebra-logo.png" style="height: 16px;padding-top: 0px;padding-left:3px" rel="tooltip" title="Zebra Devices Only"></a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <!--<tr>
      <td>
        <a href="../api/SimulScan">Document Capture (BETA)</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>-->

    <tr>
      <td>
        <a href="../api/geolocation">Geolocation</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <!--<tr>
      <td>
        <a href="../../2.2.0/rhoelements/Gesture">Gesture *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhoelements/hourglass">Hourglass *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>-->

    <tr>
      <td>
        <a href="../api/Intent">Intent</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../api/keycapture">KeyCapture</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <!--<tr>
      <td>
        <a href="../../2.2.0/rhoelements/Keylight">Keylight *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>-->

    <tr>
      <td>
        <a href="../api/keystate">KeyState<img src="/img/zebra-logo.png" style="height: 16px;padding-top: 0px;padding-left:3px" rel="tooltip" title="Zebra Devices Only"></a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../api/Log">Log</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhodesapi/mapview-api">Mapview *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
    </tr>

    <tr>
      <td>
        <a href="../api/mediaplayer">Mediaplayer</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <!--<tr>
      <td>
        <a href="../../2.2.0/rhoelements/memory">Memory *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>-->

    <tr>
      <td>
        <a href="../api/NativeMenubar">NativeMenubar</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../api/NativeTabbar">NativeTabbar</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
    </tr>

    <tr>
      <td>
        <a href="../api/NativeToolbar">NativeToolbar</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
    </tr>

    <tr>
      <td>
        <a href="../api/Navbar">Navbar</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhodesapi/NdefMessage-api">NdefMessage *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhodesapi/NdefRecord-api">NdefRecord *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../api/Network">Network</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
    </tr>

    <!--<tr>
      <td>
        <a href="../api/Adapter">NFC - Adapter (BETA)</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../api/Message">NFC - Message (BETA)</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../api/Record">NFC - Record (BETA)</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../api/Tag">NFC - Tag (BETA)</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>-->

    <tr>
      <td>
        <a href="../../2.2.0/rhodesapi/NFCManager-api">NFCManager *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhodesapi/NFCTag-api">NFCTag *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhodesapi/NFCTagTechnology_IsoDep-api">NFCTagTechnology_IsoDep *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhodesapi/NFCTagTechnology_MifareClassic-api">NFCTagTechnology_MifareClassic *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhodesapi/NFCTagTechnology_MifareUltralight-api">NFCTagTechnology_MifareUltralight *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhodesapi/NFCTagTechnology_Ndef-api">NFCTagTechnology_Ndef *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhodesapi/NFCTagTechnology_NdefFormatable-api">NFCTagTechnology_NdefFormatable *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhodesapi/NFCTagTechnology_NfcA-api">NFCTagTechnology_NfcA *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhodesapi/NFCTagTechnology_NfcB-api">NFCTagTechnology_NfcB *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhodesapi/NFCTagTechnology_NfcF-api">NFCTagTechnology_NfcF *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhodesapi/NFCTagTechnology_NfcV-api">NFCTagTechnology_NfcV *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhodesapi/NFCTagTechnology-api">NFCTagTechnology *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../api/Notification">Notification</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
    </tr>

    <tr>
      <td>
        <a href="../api/Orm">ORM</a> &amp; <a href="../api/OrmModel">ORMModel</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
    </tr>

    <tr>
      <td>
        <a href="../api/printing">Printer</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../api/printingzebra">Printer Zebra</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../api/push">Push</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <!--<tr>
      <td>
        <a href="../../2.2.0/rhoelements/reboot">Reboot *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhoelements/registry">Registry *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhoelements/rfid">RFID *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>-->


    <tr>
      <td>
        <a href="../api/RhoConnectClient">RhoConnectClient</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhodesapi/rhocontact-api">RhoContact *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhodesapi/rhocontroller-api">RhoController *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhodesapi/rhoerror-api">RhoError *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhodesapi/rhoevent-api">RhoEvent *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../api/File">RhoFile</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhodesapi/rhomsource-api">RhomSource *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhodesapi/rhoprofiler-api">RhoProfiler *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhodesapi/rhoutils-api">RhoUtils *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
    </tr>

    <tr>
      <td>
        <a href="../api/screenorientation">ScreenOrientation</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../api/sensor">Sensor</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../api/signalindicators">SignalIndicators</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../api/signature">Signature</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhodesapi/signaturecapture-api">SignatureCapture (inline) *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>
    <tr>
      <td>
        <a href="../api/smartcradle">SmartCradle<img src="/img/zebra-logo.png" style="height: 16px;padding-top: 0px;padding-left:3px" rel="tooltip" title="Zebra Devices Only"></a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <!--<tr>
      <td>
        <a href="../../2.2.0/rhoelements/stylus">Stylus *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>-->

    <tr>
      <td>
        <a href="../api/system">System</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
    </tr>

    <!--<tr>
      <td>
        <a href="../../2.2.0/rhoelements/systemTime">SystemTime *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
    </tr>-->

    <tr>
      <td>
        <a href="../api/Timer">Timer</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
       <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
    </tr>

    <!-- <tr>
      <td>
        <a href="../api/videocapture">Video Capture</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr> -->

    <!--<tr>
      <td>
        <a href="../../2.2.0/rhoelements/VideoCapture">VideoCapture *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhoelements/volume">Volume *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhoelements/wake">Wake *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>-->

    <tr>
      <td>
        <a href="../api/webview">Webview</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
    </tr>
  </tbody>
</table>

**These API classes are implemented in RhoMobile Suite 2.2 but are not yet included in the new Common API class set for RhoMobile Suite 5.5. They use the older 2.2 format and support Ruby only except as noted.*

**NOTE: When using 2.2 APIs in RhoMobile 5.5, the [2.2 API compatibility matrix](../../2.2.0/rhoelements/apicompatibility) applies.**


### JavaScript APIs
To use the JavaScript APIs in RhoElements 2.2, **you must add the `public/js/rho_javascript_api.js` file to the .html, .erb, or .js file that's calling the JavaScript method**. This file is created at build time as part of the application package  and can coexist with RhoMobile 5.5 JavaScript API file `rhoapi-modules.js`. However, it has been altered from the version built using 2.2, and must be regenerated to allow it to properly coexist with other files of your 5.5 app.


### JavaScript ORM
If you're using the JavaScript ORM API, include this line in any files that will be calling it:
    :::html
    <script type="text/javascript" charset="utf-8" src="/public/api/rhoapi-modules-ORM.js"></script>

### Using older JavaScript APIs
In the event that a pre-4.0 JavaScript API is required to work with one of the new Common JavaScript APIs, it is possible to create a compatibility layer this way:

    :::html
    <!-- required for pre-4.0 JS API: -->
    <script type="text/javascript" src="/public/jquery/jquery-1.6.4.min.js"></script>
    <script type="text/javascript" src="/public/jquery/jquery.json-2.3.min.js"></script>

    <!-- pre-4.0 JS API: -->
    <script type="text/javascript" src="/public/js/rho_javascript_api.js"></script>
    
    <!-- compatibility layer: -->
    <script type="text/javascript" src="/public/js/rho_common_api_noconflict.js"></script>
    
    <!-- new Common JS API: -->
    <script type="text/javascript" charset="utf-8" src="/public/api/rhoapi-modules.js"></script>

NOTE: Important: Modules must be loaded in this order!

##Future Common APIs
Toward the goal of supplying a Common API format for both JavaScript and Ruby, the following API classes will be included in future versions of RhoMobile Suite 5.x.

### RhoElements 2.2 APIs
The 2.2 RhoElement APIs are supported only on Zebra WebKit, which is still available on Windows Mobile/CE and Android platforms. The APIs for 5.x support the stock Android WebKit by default.

### Rhodes 2.2 APIs
2.2 Rhodes APIs that were not replaced by an equivalent RhoMobile 5.5 API (ex: Camera) are supported on all platforms that were supported previously. Ruby APIs will behave exactly as they did before.  Note that some of the Rhodes 2.2 APIs provided JavaScript support  but used a different version of the RhoMobile JavaScript API library: `rho_javascript_api.js`

To generate this file you must enable JavaScript by putting `rho-javascript` into extensions in your build.yml.

    :::yaml
    extensions: ["rho-javascript"]
