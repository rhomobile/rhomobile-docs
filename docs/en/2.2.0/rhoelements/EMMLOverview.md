#EMML: Enterprise Mobility Mark-Up Language

##Overview

###EMML

EMML (Enterprise Mobility Mark-Up Language) is an extension of the HTML language. It is less of a strict set of functions and tags, but more a standard for providing developers of web-based mobility applications a means to configure, control and retrieve information from additional input devices and features of EDAs. Though using JavaScript objects to interact with the features of RhoElements is recommended, EMML presents an alternative. Both JavaScript objects and EMML tags can be used simultaneously to call methods and parameters on modules of RhoElements.

###History

EMML was first conceived by Symbol Technologies (now a wholly owned subsidiary of Zebra Inc) in 2001. Part of the first version of PocketBrowser, it was originally a mechanism for providing access to the barcode scanner built into many of Symbol's enterprise mobility devices. It was extended to included features such as WLAN signal indicators, power statistics and access to the communications port to allow for input from custom devices such as magnetic card readers and temperature probes.

PocketBrowser version 1 was well received by developers in the enterprise arena, and the language portion of PocketBrowser (EMML) was duplicated by other hardware companies in the industry.

##EMML in its original form (EMML 1.0)
EMML utilizes the META tag from the HTML language to set properties and specify call-back functions by which the browser returns information. According to the W3C the META Tag is: <i>"an extensible container for use in identifying specialized document meta-information"</i>.

Meta tags have two main parameters, the "HTTP-Equiv" parameter and the "Content" parameter. In EMML, the HTTP-Equiv parameter is primarily used to identify the module of functionality. The Content parameter is used to set properties, associated values, and methods.

There are three main areas of the EMML language:

<ol>
<li>Setting property values</li>
<li>Taking Action: methods</li>
<li>Retrieving information: events</li>
</ol>

Setting properties is simply a case of providing the module and property to set, followed by the value. The following is an example of setting the X position in pixels of the on screen battery indicator in EMML 1.0:

	<meta http-equiv="battery" content="x=100" />


Methods were written in a similar way. Again, the module appears in the http-equiv parameter, and the action in the content. The following would cause the on screen battery indicator to be displayed:

	<meta http-equiv="battery" content="show" />

Retrieving information was carried out by specifying a call-back function for the EMML browser to return information to. Typically, <st1:place u1:st="on">Meta</st1:place> functions which return information were named as the module name followed by the word "navigate". The call-back function could be a URL, where the data is passed as named-value pairs in the querystring, or a JavaScript function or variable. The following is how you would set all of these for the BatteryNavigate function in EMML 1.0:

NOTE: all of these methods would not be included in one document, they are included here as an example.

	<meta http-equiv="batterynavigate" content="http://myserver/mypage.html?ACLineStatus=%s&BatteryLifePercent=%s&BackupBatteryLifePercent=%s" />
	<meta http-equiv="batterynavigate" content="JavaScript:doBattery('%s', '%s', '%s');" />
	<meta http-equiv="batterynavigate" content="JavaScript:var bACLine = '%s'; var iBattPC = '%s'; var iBkUpPC ='%s';" />
		
##EMML 1.1 The Current Standard
Part of the purpose of upping the version of EMML was to co-ordinate it with other standards in the web space most notably CSS, there has also been a clear focus on simplifying the standard and reducing the amount of redundant coding. In doing so the number of bytes required to be downloaded has been reduced and the readability of the tags has been vastly improved.

Previously all parameters had to be supplied to each Meta function individually. This meant that each module might have several Meta tags, each taking up several bytes worth of data each. In EMML 1.1 parameters can be supplied in a semi-colon separated list, much like styles in a css style parameter in HTML.

This is an example of several parameters being applied to the battery module using EMML 1.0:

	<meta http-equiv="battery" content="x=10" />
	<meta http-equiv="battery" content="y=10" />
	<meta http-equiv="battery" content="rgb:ff,00,00" />
	<meta http-equiv="battery" content="show" />
		
In EMML 1.1 this could be written like this:

	<meta http-equiv="battery" content="left:10; top:10; color:#ff0000; visibility:visible;" />

It is immediately apparent in the second example that there is a lot less redundant information. You may have also noticed that the "x" and "y" parameters from EMML 1.0 have been substituted for "left" and "top" parameters which will be familiar to those used to writing CSS; this is also true for the "w" and "h" parameters that have become "width" and "height" in 1.1. The way in which the "color" is described has also changed to be inline "#rrggbb" format of HTML and CSS and that the "show" method from 1.0 has been dropped in favour of the visibility parameter with the visible value ("hide" is now the "hidden" value of the visibility parameter).

NOTE: RhoElements is 100% backward compatible with EMML 1.0.

Finally, the dash sign should be able to be used to concatenate a parameter name to its module as in the following example:

	<meta http-equiv="battery-left" content="10" />
	<meta http-equiv="battery-top" content="10" />
	<meta http-equiv="battery-color" content="#ff0000" />
		

NOTE: this usage does not apply to actions such as "show" as this would leave the content value empty.

As described earlier, in EMML 1.0 "events" or "call back functions" were set using the notable <i>Module</i>Navigate in the HTTP-Equiv parameter of the <st1:place u1:st="on">Meta</st1:place> tag and the URL or JavaScript in the Content parameter. In EMML 1.1 Events have a parameter value for each event and each module can therefore support more than one event.

In EMML 1.0 you would specify the battery event like so:
		
<meta http-equiv="batterynavigate" 
content="http://myserver/mypage.html?ACLineStatus=%s&amp;BatteryLifePercent=%s&amp;BackupBatteryLifePercent=%s" />
		
In EMML 1.1 you now specify the parameter like so:


	<meta http-equiv="battery" 
	content="batteryevent:url('http://myserver/mypage.html?ACLineStatus=%s&amp;BatteryLifePercent=%s&amp;BackupBatteryLifePercent=%s');" />

Or

	<meta http-equiv="battery" content="batteryevent:url('JavaScript:doBatt('%s', '%s');');" />

In EMML 1.0, you specify a place holder for each value you are interested in using a "%s" (percent s). This had the drawback of requiring you to supply a placeholder for perhaps 7 values even if you were only interested in the 1<sup>st</sup> and 8<sup>th</sup> value being provided.

In EMML 1.1, you can substitute the "s" for a numerical value representing the position of the value you are interested in. Therefore if requesting the 1<sup>st</sup> and 8<sup>th</sup> values from the signalevent of the signal module, you might write the tag as follows:

	<meta http-equiv="signal" content="signalevent:url('JavaScript:doWLAN('%1', '%8');');" />

##EMML Profiles (EMMP)
New to EMML 1.1 are EMML Profiles. EMML Profiles are similar to Style Sheets (.CSS files). An EMML Profile allows you to create EMML classes; a common set of EMML meta tags which can be applied to a page or element.
		
Below is an example of an EMML Profile Page:
		
<pre>
.inventoryBarcodes {
scanner-alldecoders:       disabled;
scanner-code128redundancy: true;
scanner-code128minlength:  10;
scanner-code128maxlength:  16;
scanner-code128:           enabled;
scanner-ean13:             enabled;
scanner-i2of5:             enabled;
}
</pre>

<pre>	
.inventoryBattery {
battery-left:				10;
battery-top: 				0;
battery-visibility:        visible;
}
</pre>

This profile page is stored in a ".emmp" file; this can be linked to the HTML document using the import method of the EMMLProfile module. This is an example of how an EMMP file would be linked:
	<META HTTP-Equiv="emmlprofile" Content="source:url('http://myserver/inventoryprofiles.emmp'); import;">

NOTE: Each Meta tag is parsed from left to right applying each component part in turn, therefore in the above example, the source parameter will be set before the import method is called. The same is true for EMML Profiles which are applied from top downward.

With this profile page linked, you can simply reference the class name and with that, apply all the parameters in the profile in one command.
		
	<meta http-equiv="emmlprofile" content="apply:inventoryBarcode; apply:inventoryBattery" />

As you can see from the example above it is possible to set as many profiles as you like, when doing this however, you should be aware of conflicting parameters.

With EMML Profiles your web pages can be simplified further and your EMML centralized. It is also possible to name a profile page so that is persists across pages until explicitly cleared. With this you can load all your EMML tags into memory once and then access them throughout your application.

For more information on how to use the EMML Profiles see the [EMMLProfile section](EMMLProfile).