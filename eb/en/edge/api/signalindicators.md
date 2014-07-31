#SignalIndicators


## Overview
The Signal API is used to notify the user of the strength of the WLAN signal.  For Windows Mobile / CE, only Motorola Solutions' devices are supported and it is also possible to display a small indicator showing the available signal.  The WLAN signal strength is not available on Windows Phone 8 and therefore this API is not supported on that platform.
## Enabling the API
In order to use this API you must include the following extension in your `build.yml`.
    :::ruby
    extensions: ["indicators"]

The `indicators` extension is also included automatically if you specify the following in your `build.yml`.
    :::ruby
    app_type: "rhoelements"

NOTE: If you are building a Windows Mobile or Windows CE app with this API, you must set your app_type as "rhoelements" in your build.yml as shown [here](../guide/build_config#other-build-time-settings).

## JavaScript Usage
Be sure to review the [JavaScript API Usage](/guide/api_js) guide for important information about using this API in JavaScript.

## Ruby Usage
Be sure to review the [Ruby API Usage](/guide/api_ruby) guide for important information about using this API in Ruby.
        


##Methods



### hideIcon()
Hide the icon if it has been previously set by the 'showIcon' call.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.SignalIndicators.hideIcon()</code> </li></ul></li></ul>

### showIcon(<span class="text-info">HASH</span> propertyMap)
Overlays a small signal icon on top of the view indicating the remaining signal strength.  This is particularly useful in full screen applications which cover the system signal level indicator.

####Parameters
<ul><li>propertyMap : <span class='text-info'>HASH</span><p>
The properties associated with the indicator, its position and colour. </p></li><ul><li>left : <span class='text-info'>INTEGER</span><span class='label '> Default: [Top right of the screen]</span><p>
The absolute horizontal position of the indicator in pixels.  This value is relative to the screen and not the view, so non-fullscreen applications should take care not to display the indicator off screen. </p></li><li>top : <span class='text-info'>INTEGER</span><span class='label '> Default: [Top right of the screen]</span><p>
The absolute vertical position of the indicator in pixels.  Positive numbers go towards the bottom of the screen.  The value is relative to the screen and not the view, so non-fullscreen applications should take care not to display the indicator off screen. </p></li><li>layout : <span class='text-info'>STRING</span><span class='label '> Default: [Right]</span><p>
Sets the orientation of the icon, see the remarks section for illustrations. </p><p><strong>Possible Values</strong> :</p> <dl  ><dt>Constant: EB.SignalIndicators.SIGNAL_LAYOUT_LEFT <br/> String:left</dt><dd>
See the remarks section for illustrations of icon layout</dd><dt>Constant: EB.SignalIndicators.SIGNAL_LAYOUT_RIGHT <br/> String:right</dt><dd>
See the remarks section for illustrations of icon layout</dd><dt>Constant: EB.SignalIndicators.SIGNAL_LAYOUT_UP <br/> String:up</dt><dd>
See the remarks section for illustrations of icon layout</dd><dt>Constant: EB.SignalIndicators.SIGNAL_LAYOUT_DOWN <br/> String:down</dt><dd>
See the remarks section for illustrations of icon layout</dd></dl></li><li>color : <span class='text-info'>STRING</span><span class='label '> Default: #000000</span><p>
The color of the icon.  This value must be specified as a Hex value in the format #000000 to #FFFFFF.  Alpha values are not supported, i.e. you can only use the component parts RRGGBB. </p></li></ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE
* Motorola Solutions Devices Only

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.SignalIndicators.showIcon(<span class="text-info">HASH</span> propertyMap)</code> </li></ul></li></ul>

### stopWlanStatus()
If the signal is being retrieved via callback, by a previously invoked call to wlanStatus, this method will stop the callback from firing.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Returns
Synchronous Return:<ul><li>Void</li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.SignalIndicators.stopWlanStatus()</code> </li></ul></li></ul>

### wlanStatus()
Retrieve the current signal status.  If a callback is provided to retrieve the signal then it will be called periodically at the specified refreshInterval. On Android, instead of being called periodically, the callback will be called when one of the below values changes.

####Parameters
<ul><li>callback : <span class='text-info'>CallBackHandler</span></li></ul>

####Callback
Async Callback Returning Parameters: <span class='text-info'>HASH</span></p><ul><ul><li>signalStrength : <span class='text-info'>INTEGER</span><p>
The signal strength as a value between 0 and 100. Not supported on iOS Platforms:
WM, Android </p></li><li>essid : <span class='text-info'>STRING</span><p>
The current ESSID </p></li><li>macAddress : <span class='text-info'>STRING</span><p>
The Device's MAC address </p></li><li>adapterName : <span class='text-info'>STRING</span><p>
The Device's adapter name </p></li><li>dhcpServer : <span class='text-info'>STRING</span><p>
The current DHCP server's address.  Always populated on Android, even on static IP configurations. Not supported on iOS  Platforms:
WM, Android </p></li><li>dhcpStatic : <span class='text-info'>STRING</span><p>
Whether the unit hsa a static or DHCP address.  Not available on Android and iOS. Platforms:
WM </p></li><li>gateway : <span class='text-info'>STRING</span><p>
The current gateway IP address </p></li><li>ipAddress : <span class='text-info'>STRING</span><p>
The device's IP address </p></li><li>rssi : <span class='text-info'>STRING</span><p>
Signal strength in RSSI terms. Not supported on iOS. Platforms:
WM, Android </p></li><li>subnetMask : <span class='text-info'>STRING</span><p>
The current subnet mask </p></li><li>wins : <span class='text-info'>STRING</span><p>
The current WINs server IP address.  Not available on Android and iOS. Platforms:
WM </p></li></ul></ul>

####Returns
Synchronous Return:<ul><li>HASH<ul><li>signalStrength : <span class='text-info'>INTEGER</span><p>
The signal strength as a value between 0 and 100. Not supported on iOS Platforms:
WM, Android </p></li><li>essid : <span class='text-info'>STRING</span><p>
The current ESSID </p></li><li>macAddress : <span class='text-info'>STRING</span><p>
The Device's MAC address </p></li><li>adapterName : <span class='text-info'>STRING</span><p>
The Device's adapter name </p></li><li>dhcpServer : <span class='text-info'>STRING</span><p>
The current DHCP server's address.  Always populated on Android, even on static IP configurations. Not supported on iOS  Platforms:
WM, Android </p></li><li>dhcpStatic : <span class='text-info'>STRING</span><p>
Whether the unit hsa a static or DHCP address.  Not available on Android and iOS. Platforms:
WM </p></li><li>gateway : <span class='text-info'>STRING</span><p>
The current gateway IP address </p></li><li>ipAddress : <span class='text-info'>STRING</span><p>
The device's IP address </p></li><li>rssi : <span class='text-info'>STRING</span><p>
Signal strength in RSSI terms. Not supported on iOS. Platforms:
WM, Android </p></li><li>subnetMask : <span class='text-info'>STRING</span><p>
The current subnet mask </p></li><li>wins : <span class='text-info'>STRING</span><p>
The current WINs server IP address.  Not available on Android and iOS. Platforms:
WM </p></li></ul></li></ul>

####Platforms

* Android
* Windows Mobile/CE

####Method Access:
<ul><li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul><li><code>EB.SignalIndicators.wlanStatus()</code> </li></ul></li></ul>

##Properties



###refreshInterval

####Type
<span class='text-info'>INTEGER</span> 
####Description

A callback to retrieve the signal strength can be specified to occur periodically with the wlanStatus method.  This value specifies the periodicity of the callback as well as the update frequency of the indicator icon, if shown. On Android this value is not used as the signal icon will be updated as soon as the signal strength changes.
####Params
<p><strong>Default:</strong> 5000</p>
####Access
<ul><li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul><li><code>EB.SignalIndicators.refreshInterval</code> </li></ul></li></ul>


####Platforms

* Windows Mobile/CE

##Remarks



###Icon Layout

Windows Mobile / CE and Handheld devices support the display of a small signal icon, this section explains the layout parameter which can be provided to showIcon(...).

Layout:Left
-----------
![Left Layout Signal Indicator](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAI4AAABjCAIAAADCRa8DAAAAAXNSR0IArs4c6QAAAAZiS0dEAAAAAAAA+UO7fwAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB9sIBQsDMysrIIsAAAOXSURBVHja7ZztceIwEEDFDb8ZV5BJBQkdABUkVJDQAVTgpALTQZwKSAcmHXhSAelAQwPcDzIgryzjT87KvTf+E4/ONvvYXVn2MTgcDurKfH+r3U5BRYb/4JxxrF5eCH1V/hACVAGqUAWogrZmgGmqlsumh1mv1XhMNDtWpbX6/Gx6GK0JJQXwiqxWar/PbLe3/TkFqjwqgIIwLPtPX187vK75XL2/Z/ZEkfPaVit5MWGoosh52atVZs/NTYUCvt/X+Th3d83X0ixV5Zd8OlWVJEprFQTnPbOZU5U9oymY48xmmT/T1JdG29cCqLVKEhl909yJIFDz+QUf5mBhcbNhWtGYNC0lIHenrcQ12PxCRJEajTJb608AGpyix6pEVrnKmqvW5SoUg7XO+UJU4u1Nhj53a0N5v7NKfMLyWXWcmFwcbH8bKIA1EY3EbleuQldy8HYrRYqbntZpcIp+q7rYrhYLWY4KBtv558+coveqLrYr80+tpSoxeDr1dJrugyp7yl6QKJuNjL4YLLqXV41KebCwJNqJ2YFENzqONAUUDLaPXI/FQvYesX19+aAqTdV2e97qTYvt7/4pV3Kncx8fpQbb+dp7unxjabnMPF6ZTutE51jTzIQYj3+mA2ZBO5U+cYrHx5/Bom/55kn5sbIu5mnH/BAz71PoxV2tK6sa3vn+tqxqsV2Zk/Jj1ykIfZKcLZ6MikbVVlYliXp4IKsK25WYppuZZ9/Y2l49zCofVNkrdeNxJvrC5fEBijnY/0alvHkKLNrVfJ6Jvp0ipozcrELVlWqgeB/BzhJTRhB01ahQ5ZyylyyPqnBxb7Px9P0qf16DcaVCrpXdzlnl/Kx+XqlyrQO59rvU+ln9vFLlqmmu0OdmT/PHvqiqM2Uv7mG5Cr16QOWtqtzoF1QzcV9cXC1R1Xm7Kq5mxfdbvjH0LKtGowrjo8j5jm3t41e6gOYfwdes+r9BFaoAVagCVNmEoToc2KpuZBX3Vbk3pK7/CuDi/l6t1zn7qx7H5ulJPT+jyoHWldd1XL+q1nx9aDKhVwGqUEUIUAWoQhWgClCFKkAVoApV0CuGhOBMHKs4bnqQzl41RJXBbtfCz/hSAAFVqAJUoQpQBahCFaAKUIUqQBXUguXaq9D816eDAFVXQfw2bA0mEwogvQpQhSpAFaAKVYAqQBWqAFWAKlQBqgBVqAJUAapQBagCN9ZrMIMBQSGrAFWogl7xF92qR0MwnLlVAAAAAElFTkSuQmCC "Signal Indicator")

Layout:Right
------------
![Right Layout Signal Indicator](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAI4AAABjCAIAAADCRa8DAAAAAXNSR0IArs4c6QAAAAZiS0dEAAAAAAAA+UO7fwAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB9sIBQsDEIlMUfkAAAOXSURBVHja7Z3dbeowFIDdKx4jlAl6O0HFBvRO0LIBbAATABOkG7SdgG4QukHaCTJChHjnPlBR5zg2+XNo2u+TXxpZCfjLOcd2gF6lafo3TRVUZTzu+oqH1eqgFK1y65w/hEdfQBWqAFWogu/OgCHwzT5Jgvm86UkeH1HlnSDL1Ntb85N84wS4WKjdLtdubvp3CWoVtcrCZKJeXnJHokgtl9Zbdb3OHVkuVRQVd16v1WKRO3J9rbKs7Mvf7eq86dtbdcG9NNu4FQ5OZVVxrLJMheHXkX//rJccjc4f0c+jkyQVPPWU1aqeqnIJMMtUHMvR182dCEM1mZzxoXcWFjcbEl3jWpUkpQQUHjSV2DrrN0QUqeEw11rPWh1c4gKqRFTZ0pot1xUqFJ2zrOCGqMTTkxz6wtbPhz5Vokq8w/JRdZyYnO1s3g1Qc7IuColZrmyJrmTn7VaKFIue1ungEpdRdbZczWYyHTk6m/HHnKI1VWfLlf5nlklVovPd3a+bpnenypyyOwJls5GjLzqL6kWhalOVWU70CiSq0bGnLsDR2TxzPWYzWXtE+/j4NarMe/8UK4XTudfXUp3NeO0J+yRR2+2p7RsuNpxUfAhyzGl6QIxGn9MBPaGdUp8Q8PDw2VnUrd5mv2Cx0PNBMB63kx5aiCpznnaMDzHzPg29WNXaosrnzfhjqP5ocbvNTcqPVccx9HH8ZfFkVBSqtqIqjtX9PdMKZ7kS03Q98syFremVqPKiytypG41yoy9cHh+g6J1/SqH69qrMcjWZ5EbfDBFdRmFUgS9VIg7E5xHMKNFlhKGvQoUq65S9ZHpUzs29zYb9JJ+qHKFQaCVNrVmO7OddlW2hZztuU0v2867KltNsQ18YPc0f+6KqzpTdXcMKFfKAqgtVhaPvyGZiXezOltCyKnOg3dnMvd6CcwwaRdVwWKF/FFk/Y1v7/JVeQPO30NeoAlQBqlAFqIK8quVSHQ60yo2oAg/rqkvx/Cy/QtnKVotSaj5X7+/VztPhHmYPVaWprx2pJGn+VXgSIKAKVYAqVAGqAFWoAlQBqlAFqIJ6+NyuFb9MUYPpVE2nSPKvqvkudXPZJEBAFaAKVYAqQBWqAFWAKlQBqlAFPWGwT5Kg2U/n7MMwcPyDFmhLVTCfN9wC9/oroEACRBWgClCFKkAVqgBVgCpUAaoAVagCVAGqUAWoAlShClAFJRgwBF1zdUVUkQABVVCJ/62iI55gpej+AAAAAElFTkSuQmCC "Signal Indicator")

Layout:Up
---------
![Up Layout Signal Indicator](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGMAAACOCAIAAACqgyGeAAAAAXNSR0IArs4c6QAAAAZiS0dEAAAAAAAA+UO7fwAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB9sIBQsCFnk0xY0AAANcSURBVHja7Z3bbatAEIaXozxHlEAFCR2AG4hCB04FkStIUkHSgUsgqcCkA5fgElAaIA9Y+IZhl90c9vL9QpZMJJt8mpmdmR1D1Gw2Ah0rjkWa9pxvOM6OLGv69A8bkhSkIPW3pJom0OPlBZvC+yAFKUhBCkEKUpCCFKQgBSkkpZuTd1EEEWwKUpCyL06xi3WmOO49HTVNAxy8D1KQghSkQlLUZJn//+XHR//4ilo+9f3tP6m6xvuIU5Byue6zvwrTDsbXSjm/SKWpJTU83ueNTXV6e5vz25dL6yd583w/uzvvZVQV3kecghSkIAUpSCFIQQpSkLJNcSyKwqMK2bjSVCwW+9c4FmU5RsryvZn7e8Pm09IpCpEkil2XqgrFfPJcLBaTP8Nf72vNJ89FUYTRHZ5mPkVhoPvuIal28Wqda4L5bLcyrXqXSXWhZ4L5tHTaV7kdZpdJfX39NZ2Q8ik9OqekLJ/Wz3Pl/b7dTpSlETq+21SSHPImc7A89b40PYT57VaU5d4HNRTZPmPded9llGiTJvm1r673vNZrZUOrKpdJ6aTjqpHeE1IDHQIZteH//T0wUpPd8/Y2YFJK7jlGKoyeZ12LshTPz+LhQazXZAmDBvX4OLF+9p+UTv3sP6kkOURxSfPpkiz/SXWtcSXzUU/cXSa1Wu33Dui6jEhm8rN1rs9PE10XL3OCznb0quJjsYccQi/h5+f/2Zfb1YwMqctMvaqmxCy3SensfYbbdenyKfmk4Yza8A11PewlTEtEpbouEjcnnrlAWS4ndl2UunrjpFy5W4nmbttowQypHvfsHWKA1Lh7tu0HSMka2nCuwK/WDkkpdZ8p3YjX1znXfs3lbLK6qZDV6uT89V2/mTLPLFOexNWv+3pzgrMPuRbXiVPyghSkIDXf2ueuhrNqSd3dBUDKiHY7vI84BSlIsfbNLp1qRn0lxabwPkhBioj+d5L5jdZxt+9yavjpSf7bXO7kqa6Pl6vb8F+PRSePOAUpSLmw9vG8GWwKUpCCFNWMC5LeUAielPQmlQSpPDd2WSYegGMtR6NP5jF3ExULfZOIHkKccnjSbLMxGfXOr5RJMzJPSEEKebv2MWlmZ/KJ9xGnIAUpSEEKUghSkIIUpFytkA0+mcfEw0qs1S9R7tiZjYt9FQAAAABJRU5ErkJggg== "Signal Indicator")

Layout:Down
-----------
![Down Layout Signal Indicator](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGMAAACOCAIAAACqgyGeAAAAAXNSR0IArs4c6QAAAAZiS0dEAAAAAAAA+UO7fwAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB9sIBQsED0sFyssAAAOESURBVHja7Z3RcYJAEIaXDM8ZSqCCDB2AHeQ60BKoIEkF2oElkFQgSQWWYAmMDVweIChE5DgW4e7+fxgf1DDyze7e7t4GPBnHxKXdjqKIJtLHB82o9dqTjKc7HChJpvqtnjcnqTx/IkhNIAVSIAVSIAVSIAWBFEiB1KMUBCRE77d8dwFFEa1W1WsQUJaBVNN8SjpCUBgO+lPfIfNJElqttM/hW24+SUJCUBCMP59vp/kIwd5T9C0xHyEq59Iwn+ORDgerSdWhR8N8Sjrla1HYblNfX1PTcWntG0enSYpxb4ZjiWHQ6URZxkKnSSrPbbOjMLzkTXywPCmlGdf/fxfrfFZ1wCyrfFBbeW4yqTJpUl/7iqLitd8PNjSzSY1Jx4dGektI3ekQqKgM/9utY6S03fP52WFSg9yzn9Qslx3Hg7MTlgmOKKLNhjYbDVIO9KdKg3p91ayf7a9mxtTP9pMKw0sUVzSfOsmyn1TdGh9kPsMTd5NJpWm1d4CuS49UJj9L5/r85Oi62Kc69IysipvCHrJ618XczFOl68JlX2bn6Ir9qWtqWUZ5rhOzzCY1Zu9Tp+tiR91X51PqSUOL2tubYxWyXiLqei9hUFfP6V7C8XhZ70YXzI71p6h7iKHPpkjSHEccy6Ga4mdEkUxT+fMjz+eeb7pOqj6CoJcUqpm/pBR1H5cMn5/SVj1alqaN97t3/Tx5PzedSGFI6/Wj676b2VPrJF0roNn7fY8lhTiFTh5IYe0bEWvG6OXFAVIsOp2USb2/L/pKNPKJiSQXfiTJI+q+3gNZAtY+rH1cOfrwlRQ2Be8DKZBCRJ9OCv/o2ej27fftT28OEXfIW3p3KkkqInq7WNfr4//V7f6n10LmiTgFUiAFUiAFUhBIgRSqGR4pbyg4T0p5k8p5UnwcfTJlgmNu30REd8H7Hj1phvmpm++3hP4U4hRIzRnRp3tCDIuiiHa7ZZD6/jYskPdG32mST0yaqSafiFOI6CAFUiAFUiAFgRRIgRRIgZTdMqdCnruLDZtS1eInYoOA4Sav2+34kyze+4qC4UkTHI9ygPeBFEjNlyUwPplnycsCw9rn8qwLvA+kQAqkQMrNLMG+p9JNVGlKHGp30IT3IU6B1DJISenooXCrTtgUvA+kQAqkQAqkIJACKZACKZACKYioPevC9UQl2BRIQSDFGadU7h/qlDoGY34BQ9/qdocP8aYAAAAASUVORK5CYII= "Signal Indicator")
                
                

###Overlapping Indicators
The position of the signal and battery indicators should not be set to overlap

###Screen Orientation
The indicator positions are absolute and so when rotating the screen you should also move the indicator positions accordingly to accommodate the new screen layout.