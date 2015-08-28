#KeyCapture API Tutorial

This tutorial covers the use of the Enterprise Browser KeyCapture API to remap hardware keys and assign actions to the device hardware trigger.

##Prerequisites
The following are required to complete this tutorial:
* A background in HTML, CSS and JavaScript coding
* Enterprise Browser installed on a development PC 
* A Zebra mobile device and USB cable
* Enterprise Browser installed on the Zebra device 

##Coding for the KeyCapture API

Enterprise Browser includes an API for remapping key codes and assigning functions to hardware keys. The steps shown below are typical for code that uses this API. The following tutorial will walk through creating a working example application using these steps. 

![KeyCapture API tutorial image 1](https://github.com/rhomobile/rhomobile-docs/blob/master/public/images/EB_tutorials/KeyCapture_API_tutorial_01.png?raw=true)

The resulting example application will look like this:

![KeyCapture API tutorial image 2](https://github.com/rhomobile/rhomobile-docs/blob/master/public/images/EB_tutorials/KeyCapture_API_tutorial_02.png?raw=true)

##Creating the App

The following HTML template will be used as a starting point for this tutorial. It includes the following features:
* Home button that returns the user to the Enterprise Browser start page. 
* Quit button that exits Enterprise Browser. 
* Styling to size components in an appropriate manner for use on a device. 
* Buttons to turn trigger and key capture on and off. 

HTML Starter Template:

  ::HTML
  <HTML>
  <HEAD>
  <style>
  h1{font-size:2.5em;background-color:lightgray;margin:5px;padding:5px;}
  button{font-size:.5em;}
  input{font-size:1.3em;}
  #content{width=120px;border:black 1px solid;min-height:35px;padding:10px;}
  </style>
  <script>
  </script>
  </HEAD>
  <BODY>
  <h1>Key Capture
  <button onclick="window.location.href='./index.html'">Home</button>
  <button onclick="EB.Application.quit();">Quit</button>
  </h1>
  <div id=controls >
   <input type=button value="KeyMap On" >
   <input type=button value="KeyMap Off" >
   <span id=keymap>KeyMap is Off</span>
   </div>
  <div id=content >
    <span id=keyvalue />
  </div>
   <div>
   <input type=button value="TrigCap On" >
   <input type=button value="TrigCap Off" >
   <span id=trigcap>TrigCap is Off</span>
  </div>
  <div id=content >
    <span id=triggervalue />
  </div>
  </BODY>
  <SCRIPT>
  </SCRIPT>
  </HTML>

##Create the application file:
1. Create a directory on your development machine for application files. 
2. Create a file named keycap.html in your application directory and open it in a text editor.
3. Copy the contents of the starter template above into the file and save it.

Include the API JavaScript file:
4. The KeyCapture API requires the Enterprise Browser API JavaScript file. Copy the ebapi-modules.js file from `C:\EnterpriseBrowser\JavaScriptFiles\EnterpriseBrowser` to your application directory. 
 
5. Open `keycap.html` for editing and add the following as the first line in the HEAD section. 

  :::HTML
  <script type="text/javascript" charset="utf-8" src="./ebapi-modules.js"></script>

Capture and display key values:
In order to make sure that key mappings are functioning properly we need a way to identify keys that are being pressed and their key codes. To do this we will run code on startup that captures the keys and sends their value to an element for display. 
6. Open keycap.html in a text editor.
7. Add the following code to the script section at the top of the file in the HEAD section; 

  :::JavaScript
  function keycapOn(){
      EB.KeyCapture.captureKey(false,'all', function(param){
          document.getElementById('keyvalue').innerHTML = JSON.stringify(param);
      });
  }


8. Modify the starting body tag to add an onload statement as shown here. 

  :::HTML
  <BODY onload="keycapOn();">


Set key mappings on: 
9. In the script section between the end body tag and the end html tag add the method fnKeyMapOn(). 

  :::JavaScript
  function fnKeyMapOn() {
    EB.KeyCapture.remapKey(24, 64);
    EB.KeyCapture.remapKey(25, 65);
    EB.KeyCapture.remapKey(82, 66);
    document.getElementById('keymap').innerHTML = "KeyMap is On";
    document.getElementById('keymap').style.color = "red";
  }


The first three lines of code remaps three keys. After that we set a text indicator letting the user know that key mapping has been turned on.  The keys mapped here are the up and down volume keys and the menu softkey on a TC55. If you are working with another device you will be able to adjust which keys are mapped in a later step.

Setting key mappings off:
10. We also need a method to reset the key mappings. Add the following after the key map on method:

function fnKeyMapOff() {
  EB.KeyCapture.remapKey(24, '');
  EB.KeyCapture.remapKey(25, '');
  EB.KeyCapture.remapKey(82, '');
  document.getElementById('keymap').innerHTML = "KeyMap is Off";
  document.getElementById('keymap').style.color = "black";
}

In this method we reset the key mappings by calling the same rempaKey() method and setting the second parameter to an empty string.  After resetting the keys the method modifies the text indicator to show the user that the mapping has been turned off.

Set capture trigger on:
The KeyCapture API also lets us map a custom function onto the device's trigger key.  
11. Add a method called `fnTrigCaptureOn()` at the end of the second script section after fnKeyMapOff():

  :::JavaScript
  function fnTrigCaptureOn()  { 
    EB.KeyCapture.captureTrigger(onCaptureTrigger);
    document.getElementById('trigcap').innerHTML = "TrigCap is On";
    document.getElementById('trigcap').style.color = "red";
  }

This method calls the `captureTrigger()` method and passes a function that will then be called whenever the hardware trigger key is pressed. A text indicator is set so that the user knows that the trigger capture is in effect. 

Respond to the trigger:
12. Add the trigger callback method fnImgCaptureDisable() at the end of the second script section:


function onCaptureTrigger(parms){
  document.getElementById('triggervalue').innerHTML = JSON.stringify(parms);
}


The callback simply echoes the callback parameters to a display area on the screen. In a real application you might use this callback function to open a screen or begin a process.  


Set capture trigger off:
13. Add this method to reset the capture trigger at the end of the second script section:

  :::JavaScript
  function fnTrigCaptureOff() { 
    EB.KeyCapture.captureTrigger();
    document.getElementById('trigcap').innerHTML = "TrigCap is Off";  
    document.getElementById('trigcap').style.color = "black";
  }

This method removes the callback function from the trigger key by calling the same captureTrigger() method without a callback function.

Hook up JavaScript method to buttons:
14. Now that the JavaScript functions have been created we can hook them up to the control buttons.  Open `keycap.html` and add `onClick` handlers to the input button tags as shown here:

  :::HTML
  <div id=controls >
   <input type=button value="KeyMap On"   onClick="fnKeyMapOn();"  >
   <input type=button value="KeyMap Off"  onClick="fnKeyMapOff();" >
   <span id=keymap>KeyMap is Off</span>
   </div>


  <div>
   <input type=button value="TrigCap On"  onClick="fnTrigCaptureOn();" >
   <input type=button value="TrigCap Off" onClick="fnTrigCaptureOff();">
   <span id=trigcap>KeyTrap is Off</span>
  </div>


Copy Files to the Device
In order to test the application you need to copy the application files to the device and set the StartPage setting in the Enterprise Browser config.xml file. Android- and Windows-based devices use different methods for transferring files. Please see the documentation for your device for specific instructions on copying files. 

In general, here's what is required:

1. Create a directory on your device for the KeyCapture application. Make sure the directory is in an unrestricted location to avoid any permissions issues when Enterprise Browser tries to open the files. 
2. Copy the keycap.html and any JavaScript API files you have included to the directory you created on the device. 
3. Copy the config.xml file from the Enterprise Browser install directory on the device to a suitable location on the development machine and open it in a text editor. 
4. Update the StartPage setting in config.xml to point to the location on the device where you placed keycap.html and then save the changes. 
5. Copy the config.xml file back to its original location on the device.  

##Testing the App
1. Tap the Enterprise Browser icon on the device. If the device is not yet licensed for Enterprise Browser you will see the following screen:

![KeyCapture API tutorial image 3](https://github.com/rhomobile/rhomobile-docs/blob/master/public/images/EB_tutorials/KeyCapture_API_tutorial_03.png?raw=true)

2. Click on the cancel button in the upper right hand corner of the screen to dismiss the message and open the Key Capture app. If you turn the device sideways it should look like this:

![KeyCapture API tutorial image 4](https://github.com/rhomobile/rhomobile-docs/blob/master/public/images/EB_tutorials/KeyCapture_API_tutorial_04.png?raw=true)

3. We will test the trigger capture first. Click the trigger button on the device. Nothing should happen. If something happens at this point there may be something attached to the trigger via DataWedge. Find the DataWedge application, make sure that any profiles have been deactivated then return to the key capture app. Now click on the TrigCap On button. The text indicator "TrigCap is on" will be displayed  in red. Try clicking the trigger button on the device again. This time it should activate the callback and you should see evidence of the action in the display area like this:

![KeyCapture API tutorial image 5](https://github.com/rhomobile/rhomobile-docs/blob/master/public/images/EB_tutorials/KeyCapture_API_tutorial_05.png?raw=true)

4. Click the TrigCap Off button. The text indicator "TrigCap is off" should appear in black. Pressing the device's hardware trigger will no longer activate the callback function.

5. Now we will test the key mapping functions. Try clicking on a few of the device's hardware buttons or a soft button like the Menu button (soft key) on the TC55. You should see the key value appear in the key mapping display area. Since we have not yet turned on the mapping what you see here will be the true unmapped value of the key. In this case we've clicked on the up volume key which has an unmapped value of 24 on the TC55 device. The value on your device may be different.

![KeyCapture API tutorial image 6](https://github.com/rhomobile/rhomobile-docs/blob/master/public/images/EB_tutorials/KeyCapture_API_tutorial_06.png?raw=true)

6. Now click the KeyMap On button. The text indicator "KeyMap is on" should appear in red. Try pressing the up volume key again. If the up volume value before was 24 it will now show as the remapped value of 64. 

![KeyCapture API tutorial image 7](https://github.com/rhomobile/rhomobile-docs/blob/master/public/images/EB_tutorials/KeyCapture_API_tutorial_07.png?raw=true)

7.  If the key values on your device differ you will need to go back to the fnKeyMapOn() and modify the mappings. For each of the remapKey()  methods set the first parameter to match the actual unmapped value of one of the hardware keys on your device. Set the second parameter to be the value you want to map it to.  

![KeyCapture API tutorial image 8](https://github.com/rhomobile/rhomobile-docs/blob/master/public/images/EB_tutorials/KeyCapture_API_tutorial_08.png?raw=true)


	

  :::JavaScript
  function fnKeyMapOn() {
    EB.KeyCapture.remapKey(24, 64);
    EB.KeyCapture.remapKey(25, 65);
    EB.KeyCapture.remapKey(82, 66);
    document.getElementById('keymap').innerHTML = "KeyMap is On";
    document.getElementById('keymap').style.color = "red";
  }

8. Any changes to the key mapping method should also be applied to the fnKeyMapOff() method except that the second parameter should always be an empty string.

  :::JavaScript
  function fnKeyMapOff() {
    EB.KeyCapture.remapKey(24, '');
    EB.KeyCapture.remapKey(25, '');
    EB.KeyCapture.remapKey(82, '');
    document.getElementById('keymap').innerHTML = "KeyMap is Off";
    document.getElementById('keymap').style.color = "black";
  }


9. After making the changes copy the app files over to the device and open the application. Try pressing the mapped hardware keys to show their unmapped values. Then press the KeyMap On button and try the hardware keys again. You should now see the mapped value. 


Conclusion
This completes the Enterprise Browser KeyCapture API tutorial. For more information on the KeyCapture API see the Enterprise Browser API documentation on LaunchPad.