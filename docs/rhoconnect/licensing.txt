Licensing Your RhoConnect Application
===

## RhoHub License
If you plan to deploy your RhoConnect application on RhoHub under a premium or enterprise plan, just click on the **"Live app ON/OFF"** button on the RhoHub page for that RhoConnect app to enable your paid-level license.

**NOTE: Toggling this button will re-deploy your RhoConnect application to a new redis database.  Make sure you __backup all critical data__ before doing this!**

## On-Premise License
Your RhoConnect application was generated with a default license which supports up to 10 devices.  After [purchasing](http://rhomobile.com/products/rhoconnect/) a license, you can save the new license text in settings/license.key.  Just restart the application and it will pick up the new license automatically.  

If you want to load the license file in a different location, you can edit `:licensefile:` in settings/settings.yml:

	:::yaml
    :development:
      :licensefile: settings/license.key
      :redis: localhost:6379
      :syncserver: http://localhost:9292/application/
