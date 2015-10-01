# RhoMobile API Summary

Below is a list of the new common api's for RhoMobile Suite 4.1. Please consult the [2.x migration guide](apiusage) if you are moving a 2.x application to 4.1. If you are starting a new project, it is advised to the use 4.x API's going forward, however the 2.x APIs are still currently supported.

## 4.1 API's
<div class="alert alert-warning">
  <p>
    <span class="icon-check icon-primary icon-inverse"  rel="tooltip" title="Supported and does NOT requires a license"></span>
    : Indicates this API/Platform is supported and does not require a license.
  </p>
  <p>
    <span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span>
    : Indicates this API/Platform requires a license for production use.
  </p>
  <p>
    <img src="/img/zebra-logo.png" style="height: 16px;padding-top: 0px;padding-left:3px" rel="tooltip" title="Zebra Devices Only"> 
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
        <a href="../api/Application">Application</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></span></td>
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
        <a href="../api/cardreader">CardReader<img src="/img/zebra-logo.png" style="height: 16px;padding-top: 0px;padding-left:3px" rel="tooltip" title="Zebra Devices Only">
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

    <!--<tr>
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
    </tr>-->

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
        <a href="../api/Intent">Intent</a>
      </td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center;border-right:thin solid #cccccc;" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center" class=" "></td>
      <td style="text-align:center" class=" "><span class="icon-check-empty icon-primary"></span></td>
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
        <a href="../api/keystate">KeyState<img src="/img/zebra-logo.png" style="height: 16px;padding-top: 0px;padding-left:3px" rel="tooltip" title="Zebra Devices Only"></a>
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
        <a href="../api/signature">Signature Capture</a>
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

## Licensing 
The items listed above that are indicated with a <span class="icon-shopping-cart icon-primary"  rel="tooltip" title="Requires License"></span> require a license. Please review the [Licensing Guide](licensing) for more details regarding licensing.

## Using 2.2 API's in a 4.0 Application
Some API classes that may have been available in RhoMobile Suite 2.2 and have not yet have been incorporated in the new Common API class set for RhoMobile Suite 4.0. However these APIs are still available in the 2.2 format. The following API classes will soon be incorporated in future versions of RhoMobile Suite 4.x in order to supply both a Common API format in both JavaScript and Ruby.

* [Mapview](../../2.2.0/rhodesapi/mapview-api)
* [Camera](../../2.2.0/rhodesapi/camera-api/)
* [Contacts](../../2.2.0/rhodesapi/rhocontact-api)
* Calendar
* System.Process
* [Registry](../../2.2.0/rhoelements/registry)
* [AudioCapture](../../2.2.0/rhoelements/AudioCapture)
* [Config](../../2.2.0/rhodesapi/rhoconfig-api)
* [Gesture](../../2.2.0/rhoelements/Gesture)
* Printing
* Signature Capture - [RhoElements API](../../2.2.0/rhoelements/SignatureCapture) &  [Rhodes API](../../2.2.0/rhodesapi/signaturecapture-api)
* [Systemtime](../../2.2.0/rhoelements/systemTime)
* [Comm](../../2.2.0/rhoelements/comm)
* [Addressbar](../../2.2.0/rhoelements/addressbar)
* [Alarm](../../2.2.0/rhoelements/alarm)
* [Bluetooth](../../2.2.0/rhodesapi/bluetoothmanager-api)
* [NFC](../../2.2.0/rhodesapi/NFCManager-api)
* [Timer](../../2.2.0/rhodesapi/timer-api)
* [Backlight](../../2.2.0/rhoelements/backlight)
* [Keylight](../../2.2.0/rhoelements/Keylight)
* [Memory](../../2.2.0/rhoelements/memory)
* [Reboot](../../2.2.0/rhoelements/reboot)

**NOTE: When using 2.2 API's in RhoMobile 4.0, the [2.2 API compatibility matrix](../../2.2.0/rhoelements/apicompatibility) still applies.**

### RhoElements 2.2 APIs
The 2.2 RhoElement APIS are only supported on Zebra Webkit. This webkit is still available on Windows Mobile/CE and Android platforms, however on Android the default webkit that is used is the stock Android Webkit.

### Rhodes 2.2 APIs
2.2 Rhodes APIs that were not replaced by an equivalent RhoMobile 4.0 API (ex: Camera) are supported on all platforms that were supported previously. Ruby API's will behave exactly as they did before.  Note that some of the Rhodes 2.2 API's provided JavaScript support  but used a different version of the RhoMobile JavaScript API library: `rho_javascript_api.js`

To generate this file you must enable JavaScript by putting `rho-javascript` into extensions in your build.yml.

	:::yaml
	extensions: ["rho-javascript"]
  
### JavaScript APIs
To use the JavaScript APIs in RE 2.2, add the `public/js/rho_javascript_api.js` file -- created at build time as part of the application package -- to the .html, .erb, or .js file calling the JavaScript method. This file can coexist with RhoMobile 4.0 JavaScript API file: `rhoapi-modules.js` however it has been altered from the version that was built using 2.2. You must re-generate the `rho_javascript_api.js` file to properly coexist.

### JavaScript ORM
If you are going to be using the JS ORM API, you'll also need to include this line in any files that will be using it:

    :::html
    <script type="text/javascript" charset="utf-8" src="/public/api/rhoapi-modules-ORM.js"></script>