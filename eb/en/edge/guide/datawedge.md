#DataWedge Usage and Compatibility

The DataWedge app makes it possible to fetch barcode data from within an Enterprise Browser application without using the Enterprise Browser APIs. This guide explains how to configure an EB application to scan and acquire barcode data using DataWedge, which then enters the corresponding keystrokes into an EB input field of your choosing. 

**Important: Control of barcode scanning hardware is exclusive**. When DataWedge is active, the Enterprise Browser Barcode APIs will be inoperable. Likewise, an Enterprise Browser app that uses Barcode APIs will prevent other apps (including DataWedge) from accessing the scanner. This guide explains how to take control of a device's scanner hardware and how to subsequently release it to other apps. 

**See also: [DataWedge User Guide](https://launchpad.motorolasolutions.com/documents/dw_user_guide.html)** 

###Enabling DataWedge

To enable DataWedge from within an Enterprise Browser app, perform the following steps* on the device:

1. Install your Enterprise Browser app. 
2. Start the DataWedge app. 
3. In DataWedge, select **Menu->New Profile**. 
4. Enter a name and tap OK. The new profile will appear in the Profiles list. 
5. Tap on the new profile.
6. Select Associated Apps from the Applications section.
7. Select **Menu->New app/activity**. A list of installed apps will appear. 
8. Select your EB app's package name (scrolling down, if necessary).
9. **Tap the asterisk** (*) to associate all of your app's activities with DataWedge. 
10. Tap the device's Back button until the new Profile's Settings screen appears.
11. Confirm that the 'Profile enabled' checkbox is checked. 
12. **Uncheck the 'Enabled' checkboxes of the Barcode Input, Keystroke Output and Intent Output sections**. 

&#42; *Steps shown for Android; corresponding steps for Windows will vary slightly*.  

>**NOTE: An app configured in this way will not be able to scan using the Enterprise Browser APIs**. If API-based scanning is required, simply disable DataWedge using the steps below. Please refer to the Potential Conflicts section below for additional information. 

###Disabling DataWedge

To disable DataWedge, perform the following steps on the device:

1. Start the DataWedge app.
2. Select **Menu->Settings**.
3. Uncheck 'DataWedge Enabled' checkbox.

###Potential Conflicts
There are two scenarios that could disable scanning with the DataWedge application when Enterprise Browser is running. **This applies to Zebra Android devices only**. They are explained as follows:

1. DataWedge contains a hidden RhoElements profile associated with Enterprise Browser that disables scanner input on some newer Android devices. As a result, the scanner remains disabled when Enterprise Browser comes into the foreground.
2. While initializing Enterprise Browser, a newly created EMDK Barcode Manager instance sends a message that disables DataWedge scanner input.

The following settings correct both of these issues, and will prevent these known scenarios from disabling DataWedge scanning when Enterprise Browser is present on the device. 

####Setting 1: DataWedge Profile

1. **Export the DataWedge Profile0** from the device **(DW Profiles->Settings->Export Profile)**.
2. Move the exported (.db) file to a PC and open in an editor.
3. Make the RhoElements profile visible and **remove the Enterprise Browser association** from Associated/apps section.
4. **Save and move the new profile** to the device. 
5. In DataWedge, **import the new DataWedge profile (DW Profiles->Settings->Import)**.
5. In DataWedge, **create a new Enterprise Browser profile**.
6. **Enable Barcode Input and Keystroke Output** in the new profile.

> **NOTE**: When the profiles above are enabled in DataWedge, Enterprise Browser Barcode 4.x and Scanner 2.x APIs will not function; the scanning hardware will be locked by DataWedge. To return control to EB, disable the DataWedge and Enterprise Browser profiles in the DataWedge app, set the usedwforscanning tag value to 0 (see below) and restart the EB app. 

####Setting 2: DataWedge Tag
Enterprise Browser 1.4 and higher addresses the EMDK issue with a new tag in the `Config.xml` file called `useDWforScanning`. **A tag value of 1 forces scanning through DataWedge**; a value of 0 (the default) will disable DataWedge scanning and revert to Enterprise Browser APIs on devices with EMDK installed. For more information, please refer to the [DataWedge tag section](../guide/configreference?usedwforscanning) of the Config.xml Reference. 

**Note**: An Enterprise Browser app that uses Barcode APIs will prevent DataWedge and other apps from accessing the scanner. To release scanner control, simply quit the EB app.

##Barcode Scanning Options

###Barcode API
The [Barcode API](../api/barcode) is the recommended means of performing barcode scans with Enterprise Browser apps. Enterprise Browser also provides the Scanner API, which provides backward compatibility with PocketBrowser and RhoElements apps. Please refer to those products for more information about the Scanner API. 

* API: Barcode

####Example 

    :::javascript
    EB.Barcode.enable();

###Meta Tags
This API provides backward compatibility for PocketBrowser and RhoElements applications.

* API: Scanner

####Example 

    :::html
    <META HTTP-Equiv="scanner" Content="enabled">

###ActiveXObject
This API provides backward compatibility for PocketBrowser and RhoElements applications.

* API: Scanner

####Example 

    :::javascript
    var scannerObj = new ActiveXObject("PocketBrowser.Generic"); 
    scannerObj.InvokeMETAFunction('Scanner', 'enabled');

###JavaScript Object
This API provides backward compatibility for PocketBrowser and RhoElements applications.

* API: Scanner

####Example 

    :::javascript
    scanner.enable();

**See also: [DataWedge User Guide](https://launchpad.motorolasolutions.com/documents/dw_user_guide.html)** 
