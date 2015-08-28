Signature API Tutorial
This tutorial covers the use of the Enterprise Browser Signature API for capturing signatures on touch screen devices.


Prerequisites
The following are required to complete this tutorial:
* A background in HTML, CSS and JavaScript coding. 
* Enterprise Browser installed on a development PC. 
* A Zebra mobile device and USB cable.
* Enterprise Browser installed on the Zebra device. 
Coding for the Signature API
Enterprise Browser includes an API for capturing signatures. The steps shown below are typical for code that uses this API. The following tutorial will walk through creating a working example application using these steps. 


  C:\Users\Mark\SkyDrive\Documents\Zebra-Enterprise-Browser\EB Developer Fundamentals\Working Copy\Tutorials\images\signature-api-steps.png 


The resulting example application will look like this:


     


Creating the App


The following HTML template will be used as a starting point for this tutorial. It includes the following features:
* Home button that returns the user to the Enterprise Browser start page. 
* Quit button that exits Enterprise Browser. 
* Styling to size components in an appropriate manner for use on a device. 




HTML Starter Template:


<HTML>
<HEAD>
<style>
h1{font-size:2.5em;background-color:lightgray;margin:5px;padding:5px;}
button{font-size:.5em;}
input{font-size:1.3em;}
#content{width:90%;border:black 1px solid;min-height:100px;}
#SigData{margin:10px;width:66%;}
</style>
</HEAD>
<BODY>
<h1>Signature Capture
<button onclick="window.location.href='./index.html'">Home</button>
<button onclick="EB.Application.quit();">Quit</button>
</h1>
<div id=controls >
</div>
<div id=content >
</div>
</BODY>
<SCRIPT>
</SCRIPT>
</HTML>




Create the application file:
1. Create a directory on your development machine for application files. 
2. Create a file named sigcap.html in your application directory and open it in a text editor.
3. Copy the contents of the starter template above into the file and save it.


Add data display area and control buttons:
1. Open sigcap.html in a text editor.
2. Add two input buttons to the controls div. The first button will be used to initiate signature capture the other will be used to clear a captured signature.


<input type=button value="Capture Signature">
<input type=button value="Clear Signature">


1. Add an img element to the content div that can be used to display captured signatures. 


<img src="" id="SigData" alt="Waiting for capture..." />


Include the API JavaScript file:
1. The Signature API requires the Enterprise Browser API JavaScript file. Copy the ebapi-modules.js file from C:\EnterpriseBrowser\JavaScriptFiles\EnterpriseBrowser to your application directory. 
 
1. Open sigcap.html for editing and add the following as the first line in the HEAD section. 



<script type="text/javascript" charset="utf-8" src="./ebapi-modules.js"></script> 


Initialize capture settings and display capture area: 
1. In the script section between the end body tag and the end html tag add a method called fnScanEnable() to the script section. 


function fnSigCaptureStart() {
  EB.ScreenOrientation.autoRotate=false;
  EB.Signature.penWidth=10;
  EB.Signature.bgColor = "#90ee90";
  var params_hash = {'outputFormat': EB.Signature.OUTPUT_FORMAT_DATAURI};
  EB.Signature.takeFullScreen(params_hash,onSigCapture);
}


This method sets up and displays the capture area. The first few lines of code set parameters that will be used by the API. The settings disable auto screen rotation for the duration of the capture, set the width of the line that users will draw with in the capture area and set the background color for the capture area. Another way to initialize settings is to add them to a parameters hash. When the takeFullScreen() method is called the settings passed in the parameter hash are applied before the capture area is displayed. In the code above sets the outputFormat in the parameter hash so that the data returned from the capture includes the actual image data and not just a URI pointing to a stored file. The last parameter sent to the takeFullScreen() method is a callback method, onSigCapture(). The callback method is used to process the captured data. It will be created in a later step.  


Capture the signature:
1. In our demo application the takeFullScreen() method will open a capture area that includes three buttons: cancel, clear and capture. The capture button when pressed will trigger the capture of the signature and the execution of the callback function. An alternate method, show(), is available which allows you to designate a specific location on the existing screen as a capture area. When using show() you have to provide your own cancel, clear and capture buttons. In that case your capture button also needs to execute code that includes the capture() method to explicitly capture the signature. For more details on using show() and capture() see the Enterprise Browser API documentation.


Display the signature:
1. Add a method called onSigCapture(capData) at the end of  the script section:


function onSigCapture(capData){
  console.log(JSON.stringify(capData));
  document.getElementById("SigData").src = capData.imageUri;
}


onSigCapture(capData)is the callback function we passed to the takeFullScreen() method earlier. It is executed when the user clicks on the capture button in the signature capture area. The capData variable passed to the function here is a JSON object that contains data representing the captured image. The console.log() debug statement will display a long base64 string of image data in the JavaScript console. The log statement is strictly for debugging purposes and should be commented out for production builds.  The last line assigns the image data to the src attribute of the img element which causes the signature to be displayed. 


Clear the signature:
1. Add a method called onSigCaptureClear() at the end of  the script section:


function fnSigCaptureClear() { 
    document.getElementById("content").innerHTML = "<img src='' id=SigData alt='Waiting for capture...' />";
}




This method will be called by the Clear Signature button to reset the signature display area. 


Hook up JavaScript method to buttons: 
1. Now that the JavaScript functions have been created we can hook them up to the control buttons.  Open sigcap.html and add onClick handlers to the input button tags as shown here:


<input type=button value="Capture Signature" onClick="fnSigCaptureStart();">
<input type=button value="Clear Signature"   onClick="fnSigCaptureClear()" >


Copy Files to the Device
In order to test the application you need to copy the application files to the device and set the StartPage setting in the Enterprise Browser config.xml file. Android and Windows based devices use different methods for transferring files. Please see the documentation for your device for specific instructions on copying files:
1. Create a directory on your device for the Signature application. Make sure the directory is in an unrestricted location to avoid any permissions issues when Enterprise Browser tries to open the files. 
2. Copy the sigcap.html and any JavaScript API files you have included to the directory you created on the device. 
3. Copy the config.xml file from the Enterprise Browser install directory on the device to a suitable location on the development machine and open it in a text editor. 
4. Update the StartPage setting in config.xml to point to the location on the device where you placed sigcap.html and then save the changes. 
5. Copy the config.xml file back to its original location on the device.  


Testing the App
1. Tap the Enterprise Browser icon on the device. If the device is not yet licensed for Enterprise Browser you will see the following Product Registration screen:


  
  



1. Click on the cancel button in the upper right hand corner of the Product Registration screen to dismiss the screen and open the Signature app. If you turn the device sideways it should look like this:


  [a]   [b]


1. Click on the Capture Signature button to open the capture area.
    


1. Use your finger to draw a signature on the screen.


    




1. Click the checkmark-capture button to capture the signature and display the signature in the application. 


  



1. Clicking Clear Signature resets the application display
 [c][d]
  





Conclusion
This completes the Enterprise Browser Signature API tutorial.  For more information on the Signature API see the Enterprise Browser API documentation on LaunchPad. 


[a]This screen shows the app as it appears before a signature is captured. The empty img is populated in a later step by a signature image. alt text is provided in the img element.
[b]Missing image here
[c]Signature has been reset. This screen shows the app as it appears before a signature is captured. Alt text shows in place of empty image.
[d]Missing image here