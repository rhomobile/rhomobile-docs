# Viewport Configuration

Using the Viewport configuration setting in your app's config.xml, as well as in the HTML source of your app, you can configure the way your app will appear on a device based on either the device's width or a width you otherwise specify. We will go over a few of the less intuitive parts of the viewport configuration here.

## Enabling Viewport Modification
This will enable you to use your stnadard viewport settings within the Zebra Webkit. For more information on the Viewport metatag see the [Mozilla Viewport Docs](https://developer.mozilla.org/en-US/docs/Mozilla/Mobile/Viewport_meta_tag).

Firstly, to enable the viewport in Zebra WebKit on Windows Mobile / CE you need to specify the following configuration option:

`config.xml`
	 
	<ViewportEnabled VALUE="1"/>

## Specifying Device Widths
Specifying `width=device-width` in your meta tag will either:

* Use the value specified at `<ViewportWidth VALUE="320"/>` if one is specified.
* Use the actual physical device width if no configuration option is specified, 480 pixels on an MC75a.

Pages that specify an initial or maximum scale means the width property actually translates into a minimum viewport width. For example, if your layout needs at least 500 pixels of width then you can use the following markup.  When the screen is more than 500 pixels wide, the browser will expand the viewport (rather than zoom in) to fit the screen:

### With Specified initial-scale

The same page rendered on iPhone, Nexus 5 and MC75a will appear as follows:

In your app's html:
    <meta name="viewport" content="width=500, initial-scale=1"/>

<div class="row-fluid">
  <div class="span4" style="text-align:center">
    <p>iPhone 5c iOS 7</p>
    <img src="https://s3.amazonaws.com/rhodocs/guide/viewport_config/ios_viewport_demo.png">
  </div>
  <div class="span4" style="text-align:center">
    <p>Nexus 5 Android 5 (KitKat)</p>
    <img src="https://s3.amazonaws.com/rhodocs/guide/viewport_config/android_viewport_demo.png">
  </div>
  <div class="span4" style="text-align:center">
    <p>MC75A Windows Mobile 6.5</p>
    <img src="https://s3.amazonaws.com/rhodocs/guide/viewport_config/winmo_viewport_demo.png">
  </div>
</div>

* An iPhone will render pages with a device width of 320 pixels, [by design](https://developer.mozilla.org/en-US/docs/Mozilla/Mobile/Viewport_meta_tag), even though the physical screen dimensions are different.
* An Android device's viewport appears similar but is not identical; the screen width is rendered at 360 pixels, presumably because the device resolution is different for Android.
* The MC75a is behaving within the parameters of documented behavior when specifying both device-width and initial-scale, as detailed above, expanding the viewport to fit the contents.

### Without Specified initial-scale

Let us consider the same page without specifying an initial-scale:

In your app's html:
    <meta name="viewport" content="width=320"/>

<div class="row-fluid">
  <div class="span6" style="text-align:center">
    <p>Nexus 5 Android 5 (KitKat)</p>
    <img src="https://s3.amazonaws.com/rhodocs/guide/viewport_config/android_no_initial_scale.png">
  </div>
  <div class="span6" style="text-align:center">
    <p>MC75A Windows Mobile 6.5</p>
    <img src="https://s3.amazonaws.com/rhodocs/guide/viewport_config/winmo_no_initial_scale.png">
  </div>
</div>

Note that without specifying an initial-scale the MC75a will display the page with a viewport width of 320 pixels. This is with a specified device width of 320 pixels in the `config.xml` file, had this been left blank, the page would again render with a width of 480 pixels.The specification of a 320 pixel width is used to match the appearance on the iPhone as closely as possible.

We suggest that you not specify an initial-scale in the viewport if you want the page to be locked to a resolution of 320 pixels on Windows Mobile. You can modify the layout.erb file to have a custom viewport for Windows Mobile if required.
