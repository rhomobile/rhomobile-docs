


# Signature API Tutorial

This tutorial covers the use of the Enterprise Browser Signature API for capturing signatures on touch screen devices.

##Prerequisites

The following are required to complete this tutorial:

* A background in HTML, CSS and JavaScript coding 
* Enterprise Browser installed on a development PC
* A Zebra mobile device and USB cable
* Enterprise Browser installed on the Zebra device

##Coding for the Signature API

Enterprise Browser includes an API for capturing signatures. The steps shown below are typical for code that uses this API. The following tutorial will walk through creating a working example application using these steps. 

![img](images/eb_tutorials/Signature_API_tutorial_01.png)

The resulting example application will look like this:

![img](images/eb_tutorials/Signature_API_tutorial_02.png)

##Creating the App

The following HTML template will be used as a starting point for this tutorial. It includes the following features:

* Home button that returns the user to the Enterprise Browser start page. 
* Quit button that exits Enterprise Browser. 
* Styling to size components in an appropriate manner for use on a device. 

HTML Starter Template:

    :::HTML
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



###STEP 1: Create the application file

* **Create a directory** on your development machine for application files. 
* **Create a file named `sigcap.html`** in your application directory and open it in a text editor.
* **Copy the contents of the starter template** above into the file and save it.

###STEP 2: Add data display area and control buttons

* **Open `sigcap.html`** in a text editor.
* **Add two input buttons to the controls div**. The first button will be used to initiate signature capture the second will clear a captured signature.

Sample HTML:

    :::HTML
    <input type=button value="Capture Signature">
    <input type=button value="Clear Signature">


* **Add an img element to the content div** that can be used to display captured signatures: 

Sample HTML:

    :::HTML
    <img src="" id="SigData" alt="Waiting for capture..." />



###STEP 3: Include the API JavaScript file

* **Copy the `ebapi-modules.js` file** from<br> 
`C:\EnterpriseBrowser\JavaScriptFiles\EnterpriseBrowser` to your application directory. 
 
* Open `sigcap.html` for editing and **add the following as the first line in the HEAD section**: 

Sample HTML: 

    :::HTML
    <script type="text/javascript" charset="utf-8" src="./ebapi-modules.js">
    </script> 


###STEP 4: Initialize capture settings, display capture area

* **Add the method `fnScanEnable()`** to the SCRIPT section **between the end BODY tag and the end HTML tag**: 

Sample JavaScript:

    :::JavaScript
    function fnSigCaptureStart() {
      EB.ScreenOrientation.autoRotate=false;
      EB.Signature.penWidth=10;
      EB.Signature.bgColor = "#90ee90";
      var params_hash = {'outputFormat': EB.Signature.OUTPUT_FORMAT_DATAURI};
      EB.Signature.takeFullScreen(params_hash,onSigCapture);
    }



This method sets up and displays the capture area. The first few lines of code set parameters that will be used by the API. The settings disable automatic screen rotation for the duration of the capture, set the width of the line that users will draw with in the capture area, and set the background color for the capture area. 

Another way to initialize settings is to add them to a parameters hash. When the `takeFullScreen()` method is called, the settings passed in the parameter hash are applied before the capture area is displayed. The code above sets the `outputFormat` in the parameter hash so that the data returned from the capture includes the actual image data and not just a URI pointing to a stored file. The last parameter sent to the `takeFullScreen()` method is the callback method `onSigCapture()`, and is used to process the captured data. It will be created in a later step.  

###STEP 5: Capture the signature

In our demo application, the `takeFullScreen()` method will open a capture area that includes three buttons: Cancel, Clear and Capture. The Capture button when pressed will trigger the capture of the signature and the execution of the callback function. 

An alternate method, `show()`, allows you to designate a specific location on the existing screen as a capture area. When using `show()` you'll have to provide your own Cancel, Clear and Capture buttons. In that case your Capture button also must execute code that includes the `capture()` method to explicitly capture the signature. For more details on using `show()` and `capture()`, please refer to the [Enterprise Browser API documentation](../api/signature).

###STEP 6: Display the signature

* **Add a method called `onSigCapture(capData)`** at the end of the SCRIPT section:

In the SCRIPT section between the end body tag and the end html tag

Sample JavaScript: 

    :::JavaScript
    function onSigCapture(capData){
      console.log(JSON.stringify(capData));
      document.getElementById("SigData").src = capData.imageUri;
    }


`onSigCapture(capData)` is the callback function we passed to the `takeFullScreen()` method earlier. It is executed when the user clicks on the Capture button in the signature capture area. The capData variable passed to the function here is a JSON object that contains data representing the captured image. The `console.log()` debug statement will display a long base64 string of image data in the JavaScript console. The log statement is strictly for debugging purposes and should be commented out for production builds. The last line assigns the image data to the src attribute of the img element, which causes the signature to be displayed. 

###STEP 7: Clear the signature

* **Add the method `onSigCaptureClear()`** at the end of the SCRIPT section:

Sample JavaScript:

    :::JavaScript
    function fnSigCaptureClear() { 
        document.getElementById("content").innerHTML = "<img src='' id=SigData alt='Waiting for capture...' />";
    }


This method will be called by the Clear Signature button to reset the signature display area. 

###STEP 8: Hook JavaScript method to buttons

Now that the JavaScript functions have been created, we can hook them to the control buttons. 

* **Add `onClick` handler code to the input button tags** we created earlier (or **simply replace the buttons created earlier with the function-appended button code below**): 

Sample HTML:

    :::HTML
    <input type=button value="Capture Signature" onClick="fnSigCaptureStart()" >
    <input type=button value="Clear Signature"   onClick="fnSigCaptureClear()" >


###STEP 9: Copy files to the device

To test the application, you need to copy the application files to the device and set the StartPage setting in the Enterprise Browser `config.xml` file. Android- and Windows-based devices use different methods for transferring files. Please see the documentation for your device for specific instructions on copying files. 

In general, here's what is required:

1. **Create a directory on your device** for the Signature application. Make sure the directory is in an unrestricted location to avoid any permissions issues when Enterprise Browser tries to open the files. We'll place our sample app's files in the device's root directory and show you how to modify the `config.xml` file accordingly.
2. **Copy the `signature.html` and any JavaScript API files** you have included to the directory you created on the device. 
3. **Copy the `config.xml` file to a suitable location on the development machine** from the Enterprise Browser install directory on the device and open it in a text editor. 
4. **Update the StartPage setting in `config.xml` to point to the location on the device** where you placed `signature.html` and save the changes. 
5. **Copy the `config.xml` file back to its original location on the device**.    

Sample `config.xml` showing path to Android app in root directory: 

    :::HTML
        <General>
            <Name value="Signature"/>
            <StartPage value="file:///sigcap.html" name="Signature"/>
            <UseRegularExpressions value="1"/>
        </General>



###STEP 10: Testing the App

* **Tap the Enterprise Browser icon** on the device. If the device is not yet licensed for Enterprise Browser you will see the following Product Registration screen:

![img](images/eb_tutorials/Signature_API_tutorial_03.png)

* **Click on the cancel button** in the upper right hand corner of the Product Registration screen to dismiss the screen and open the Signature app. If you turn the device sideways it should look like this:

![img](images/eb_tutorials/Signature_API_tutorial_04.png)


  [a]   [b]


* **Click on the Capture Signature button** to open the capture area.
    
![img](images/eb_tutorials/Signature_API_tutorial_05.png)

* **Use your finger to draw a signature** on the screen.

![img](images/eb_tutorials/Signature_API_tutorial_06.png)

* **Click the checkmark-capture button** to capture the signature and display the signature in the application. 

![img](images/eb_tutorials/Signature_API_tutorial_07.png)

* **Click Clear Signature to reset** the application display

 [c][d]
  
![img](images/eb_tutorials/Signature_API_tutorial_08.png)

###Conclusion
This completes the Enterprise Browser Signature API tutorial. For more information on the Signature API, please refer to the [Enterprise Browser API documentation](../api/signature). 


[a]This screen shows the app as it appears before a signature is captured. The empty img is populated in a later step by a signature image. alt text is provided in the img element.

[b]Missing image here

[c]Signature has been reset. This screen shows the app as it appears before a signature is captured. Alt text shows in place of empty image.

[d]Missing image here