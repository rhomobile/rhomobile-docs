# Hello EB Tutorial
This guide will walk you through step by step to build a simple app from scratch.

### Types of Enterprise Browser Apps
The Enterprise Browser will usually be used in one of three different but, related, scenarios:

1. Hosted Web App - You already have a web app hosted somewhere and you want the Enterprise Browser to render it on your mobile device.
2. Local Web App - You have all your assets stored on your mobile device and want the Enterprise Browser to render these pages for use on your mobile device.
3. Hybrid local / hosted App - You have a web app hosted somewhere but some of the assets that your web app uses are stored locally on your device. You want the Enterprise Browser to render these pages for use on your mobile device.

With any of these three scenarios, you will need to be able to edit the config.xml file that comes with the Enterprise Browser. The config.xml resides on the device in a directory which is dependent on your device's OS:

* **Android** - /Android/data/com.symbol.enterprisebrowser/Config.xml
* **Windows Mobile / Windows CE** - \Program Files\EnterpriseBrowser\Config\Config.xml

NOTE: It is worth noting that, with most Windows Mobile / CE devices, you will have to copy the config.xml file to a location that is not on your device in order to modify it. Once your modifications are done, copy it back to your device and overwrite the old one.

### Setting Your App's Start Page
Whether your app is hosted, local, or both, you'll need to edit the line in the config.xml file that controls the start path of the Enterprise Browser. in the config.xml you'll find the startPage value and this is what you'll need to change in order for your app to start where you want it to. For example, if I wanted my app to start at yahoo.com for some reason I would edit the startPage to look like this:

	:::xml
	<General>
		<Name value="Menu"/>
		<StartPage value="http://www.yahoo.com" name="Yahoo"/>
		<UseRegularExpressions value="1"/>
	</General>

If I were starting my app from a local page I would need to prepend the file path with file://. For instance:

	:::xml
	<General>
		<Name value="Menu"/>
		<StartPage value="file:///index.html" name="Menu"/>
		<UseRegularExpressions value="1"/>
	</General>

This address will cause the Enterprise Browser to start my app at the index.html file located in my device's root directory.

NOTE: Notice that there are three forward-slashes in that address; the first two are for the file: protocol and the third specifies the root directory of the device.

## Your First Enterprise Browser App
### Create Your Start Page
So let's create a very basic index page that we can launch from our Enterprise Browser app. Create a new file called index.html and use the contents below.

	:::html
	<body>
		<h1>My First Enterprise Browser App</h1>

		<p>This is my first app and all it does right now is point to Google's homepage.</p>

		<a href="http://www.google.com">Click here to go to Google's homepage</a>
	</body>

Place this newly created file in your device's root directory.

### Set Your Start Page
Now change the startPage in your config.xml to:

	:::xml
	<StartPage value="file:///index.html" name="Menu"/>

### Start Your Enterprise Browser App
<table>
	<tr>
		<td>Now start your Enterprise Browser app and you should see something like this:</td>
		<td>
			<p>
			And when you click on the link (assuming you have an active<br>
			internet connection), you'll be navigated to Google's homepage.
			</p>
		</td>
	</tr>
	<tr>
		<td><img src="images/getting-started/helloeb/helloeb-first-app-index.png"></td>
		<td><img src="images/getting-started/helloeb/helloeb-first-app-google.png"></td>
	</tr>
</table>

But we don't want to just link to some other page, we want to use some of the APIs at our disposal! Let's make an app that uses the Barcode API to scan an barcode and displays the barcode we scanned on the screen.

## A More Useful App
Create a new file called helloeb.html and use these contents:

	:::html
	<html>
		<head>
			<script type="text/javascript" charset="utf-8" src="ebapi-modules.js"></script>
			<script type="text/javascript">
				function scanReceived(params){
					if(params['data']== "" || params['time']==""){
						document.getElementById('display').innerHTML = "Failed!";
						return;
					}

					var displayStr = "Barcode Data: " +params['data']+"<br>Time: "+params['time'];
					document.getElementById("display").innerHTML = displayStr;
				}

				function loadEvent(){
					EB.Barcode.enable({allDecoders:true}, scanReceived);
				}

				function unloadEvent(){
					 EB.Barcode.disable();
				}

				window.addEventListener('DOMContentLoaded', loadEvent);
				window.addEventListener('unload',unloadEvent);
			</script>
		</head>

		<body onload="Javascript:loadEvent()" onunload="Javascript:unloadEvent()">
			<h1>Scan Common API (EB)</h1>
			Scan a barcode.<br><br><br>
			<div id="display">
			Barcode Data: <br>
			Time: 
			</div><br>
		</body>
	</html>

This code will enable the default device scanner and print out the scanned barcode data once a barcode is scanned. Here is what we see when the app is started.

### JS Libraries
You may have noticed one of the lines in the above code is loading a JavaScript file that we have not talked about yet.

	:::html
	<script type="text/javascript" charset="utf-8" src="ebapi-modules.js"></script>

This file is necessary for using the EB JavaScript APIs and is found in the JavaScript Files folder in the Enterprise Browser directory that was installed along with the Enterprise Browser MSI file installation. This file in particular is located in `<path-to-eb-installation>\EnterpriseBrowser\JavaScript Files\EnterpriseBrowser`

Simply add the line above to add the libraries into your app and copy the file from the aforementioned location to your device.

> Note: If you copy the file somewhere besides the folder in which your html pages also reside, you'll need to modify the src path accordingly.

### Set the StartPage
To make your Enterprise Browser app start on this page, change your config.xml to point to this helloeb.html as the start page. I am going to put my helloeb.html file in my device's root directory, so my config.xml will show:

	:::xml
	<General>
		<Name value="Menu"/>
		<StartPage value="file:///helloeb.html" name="Menu"/>
		<UseRegularExpressions value="1"/>
	</General>

### Start the App
The barcode I am using to test this is this one:

<a href="http://www.barcodesinc.com/generator/"><img src="http://www.barcodesinc.com/generator/image.php?code=EB.Barcode Test&style=197&type=C128B&width=200&height=50&xres=1&font=3" alt="the barcode printer: free barcode generator" border="0"></a>

Here is what we will see after starting the app and going through the initial splash screen(s).

<img style="width:500px;" src="images/getting-started/helloeb/helloeb-app-start-page.png">

And here is the app after scanning a barcode.

<img style="width:500px;" src="images/getting-started/helloeb/helloeb-app-barcode-scanned.png">

You can also opt to add only the APIs that you plan on using if you want to minimize the amount of device storage you use. We discuss strategies like this in the [Optimization](#guide-optimization) guide.