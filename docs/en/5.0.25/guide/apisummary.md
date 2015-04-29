# RhoMobile API Summary
Below is a list of the new common api's for RhoMobile Suite 5.0.25. Please consult the [2.x migration guide](apiusage) if you are moving a 2.x application to 5.0.25. If you are starting a new project, it is advised to the use 5.x API's going forward, however the 2.x APIs are still currently supported.

## 5.0.25 API's
<div class="alert alert-warning">
  <p>
    <span class="icon-check icon-primary icon-inverse"  rel="tooltip" title="Supported and does NOT requires a license"></span>
    : Indicates this API/Platform is supported and does not require a license.
  </p>
  <p>
    <span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span>
    : Indicates this API/Platform requires a paid subscription for production use.
  </p>
  <p>
    <img src="/img/zebra-logo.png" style="height:16px;padding-top: 0px;padding-left:3px" rel="tooltip" title="Motorola Devices Only">
    : Indicates this API is only available on Symbol devices.
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
    <tr>
      <td>
        <a href="../../2.2.0/rhoelements/addressbar">Addressbar *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
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
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
    </tr>

    <tr>
      <td>
        <a href="../api/Application">Application</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
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
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhoelements/backlight">Backlight *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
    </tr>

    <tr>
      <td>
        <a href="../api/barcode">Barcode</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "></span></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../api/battery">Battery</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhodesapi/bluetoothmanager-api">BluetoothManager *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
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
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
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
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr> -->

    <tr>
      <td>
        <a href="../../2.2.0/rhodesapi/camera-api">Camera *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
    </tr>

    <tr>
      <td>
        <a href="../api/cardreader">CardReader<img src="/img/zebra-logo.png" style="height: 16px;padding-top: 0px;padding-left:3px" rel="tooltip" title="Motorola Devices Only">
      </td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhoelements/comm">Comm *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <!-- <tr>
      <td>
        <a href="../../2.2.0/rhoelements/ConfigurationSettings">Config *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr> -->

    <!-- <tr>
      <td>
        <a href="../api/contact">Contact</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
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
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
    </tr>

    <tr>
      <td>
        <a href="../api/SimulScan">Document Capture (BETA)</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../api/geolocation">Geolocation</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhoelements/Gesture">Gesture *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
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
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../api/Intent">Intent</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
    </tr>

    <tr>
      <td>
        <a href="../api/keycapture">KeyCapture</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhoelements/Keylight">Keylight *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../api/keystate">KeyState<img src="/img/zebra-logo.png" style="height: 16px;padding-top: 0px;padding-left:3px" rel="tooltip" title="Motorola Devices Only"></a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
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
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
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
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
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
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhoelements/memory">Memory *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../api/NativeMenubar">NativeMenubar</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
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
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
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
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
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
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
    </tr>

    <tr>
      <td>
        <a href="../api/Adapter">NFC - Adapter (BETA)</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../api/Message">NFC - Message (BETA)</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../api/Record">NFC - Record (BETA)</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../api/Tag">NFC - Tag (BETA)</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

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
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
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
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
    </tr>

    <tr>
      <td>
        <a href="../api/printing">Printer</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../api/printingzebra">Printer Zebra</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
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
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhoelements/reboot">Reboot *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
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
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
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
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhodesapi/rhoconfig-api">RhoConfig *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../api/RhoConnectClient">RhoConnectClient</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
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
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
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
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
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
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
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
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
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
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
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
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
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
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
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
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
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
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
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
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../api/signalindicators">SignalIndicators</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../api/signature">Signature</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhodesapi/signaturecapture-api">SignatureCapture (inline) *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhoelements/stylus">Stylus *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../api/system">System</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhoelements/systemTime">SystemTime *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
    </tr>

    <tr>
      <td>
        <a href="../../2.2.0/rhodesapi/timer-api">Timer *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
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
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr> -->

    <tr>
      <td>
        <a href="../../2.2.0/rhoelements/VideoCapture">VideoCapture *</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
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
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
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
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "></td>
    </tr>

    <tr>
      <td>
        <a href="../api/webview">Webview</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
    </tr>
  </tbody>
</table>

Some API classes that may have been available in RhoMobile Suite 2.2 and have not yet have been incorporated in the new Common API class set for RhoMobile Suite 5.0.25, here these APIs are marked with an asterisk (*). However these APIs are still available in the 2.2 format but only in Ruby. The following API classes will soon be incorporated in future versions of RhoMobile Suite 5.x in order to supply both a Common API format in both JavaScript and Ruby.

**NOTE: When using 2.2 API's in RhoMobile 5.0.25, the [2.2 API compatibility matrix](../../2.2.0/rhoelements/apicompatibility) still applies.**

### RhoElements 2.2 APIs
The 2.2 RhoElement APIS are only supported on Motorola Webkit. This webkit is still available on Windows Mobile/CE and Android platforms, however on Android the default webkit that is used is the stock Android Webkit.

### Rhodes 2.2 APIs
2.2 Rhodes APIs that were not replaced by an equivalent RhoMobile 5.0.25 API (ex: Camera) are supported on all platforms that were supported previously. Ruby API's will behave exactly as they did before.  Note that some of the Rhodes 2.2 API's provided JavaScript support  but used a different version of the RhoMobile JavaScript API library: `rho_javascript_api.js`

To generate this file you must enable JavaScript by putting `rho-javascript` into extensions in your build.yml.

    :::yaml
    extensions: ["rho-javascript"]

## Licensing
The items listed above that are indicated with a <span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span> require a either a silver or gold level license. Please review the [Licensing Guide](licensing) for more details regarding licensing.

### JavaScript APIs
To use the JavaScript APIs in RE 2.2, add the `public/js/rho_javascript_api.js` file -- created at build time as part of the application package -- to the .html, .erb, or .js file calling the JavaScript method. This file can coexist with RhoMobile 5.0.25 JavaScript API file: `rhoapi-modules.js` however it has been altered from the version that was built using 2.2. You must re-generate the `rho_javascript_api.js` file to properly coexist.

### JavaScript ORM
If you are going to be using the JS ORM API, you'll also need to include this line in any files that will be using it:

    :::html
    <script type="text/javascript" charset="utf-8" src="/public/api/rhoapi-modules-ORM.js"></script>