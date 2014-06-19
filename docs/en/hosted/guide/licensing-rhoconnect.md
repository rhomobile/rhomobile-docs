# Licensing Your RhoConnect Application

## Hosted License
If you plan to deploy your RhoConnect application using RhoMobile.com under a subscription plan, just click on the **"Live app ON/OFF"** button on the deployment page for that RhoConnect app to make your app live. Refer to your subscription plan for limitations on the number of devices allotted to you and memory allowance.

**NOTE: Toggling this button will re-deploy your RhoConnect application to a new redis database.  Make sure you __backup all critical data__ before doing this!**

## On-Premise License
Your RhoConnect application was generated with a default license which supports up to 10 devices.  After [signing up](http://www.rhomobile.com/pricing.html) for a plan, you can opt to deploy your RhoConnect app on-premise instead. To do this, go to [rhomobile.com]() and click the "On-Premise License" to retrieve your license. The license will also be available on your profile page.

NOTE: Requesting an on-premise license will switch any live apps you have currently deployed to off. Each subscription is limited to 1 live OR 1 on-premise RhoConnect app at a time.

### On-Premise License Limitations
Your on-premise license is tied to your RhoConnect application name, therefore you'll need to keep the name the same when deploying on-premise.

Your license is set to expire when your subscription plan comes up for renewal. For example if you pay monthly, your license will expire at the end of your month subscription. If you pay yearly, your license will expire at the end of your year subscription. Once your license expires, it will need to be renewed manually on rhomobile.com.

### Applying Your On-Premise License
Once you get your license key, you'll need to save it to a file and tell your RhoConnect app where the license key is. Add the license file path to your settings/settings.yml file as such:

	:::yaml
    :development:
      :licensefile: settings/license.key
      :redis: localhost:6379