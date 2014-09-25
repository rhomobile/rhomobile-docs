# Using OS Emulators

## Overview

There are three ways to run your RhoMobile application:

* On a device
* On RhoSimulator
* On a platform-specific emulator

This guide covers the last option, platform-specific emulators.

Most mobile platforms provide a way to emulate a device on a regular PC for development purposes; this allows you to test on a variety of simulated hardware (different screen sizes, different amounts of RAM, etc.) without the need to have every type of device on hand.

iOS provides a simulator instead of an emulator. The difference lies in that, while an emulator virtualizes the target hardware and runs the same code as the real device, a simulator, as the name imples, merely simulates the device, but the code running underneath is not the same as what a real device would execute. Technically, an emulator is a more faithful representation of the device, but in practice, both options work sufficiently well to be able to develop and test applications.


## What to expect. Differences between emulators and a real device

Due to several key differences, testing on an emulator / simulator is unfortunately not a substitute for testing on actual hardware. You should expect to test on real hardware often and, at a minimum, before releasing your application to end users.

Some differences between the emulated / simulated environment and real devices are outlined below.

* Speed: Emulators tend to be slower than a real device, while the iOS simulator is typically faster than a hardware iPhone/iPad.

* Hardware access: Emulators do not attempt to replicate the functionality of peripherals such as a magnetic card reader or barcode scanner.

* Network: By default, mulators use the host computer's network connectivity as-is. This usually provides the application with much better network speed and reliability than it will have on a mobile device.

* Battery: Emulators do not provide a way to measure battery usage.


## Android

The Android SDK includes an Android Virtual Device (AVD) manager with which you can create as many different configurations as you need and run each independently. Once an AVD is running, load your application on it from the command line with

	:::term
	rake run:android:emulator

or from RhoStudio by editing your run configuration and selecting Android - Emulator as the target.

Refer to [Google's documentation on using the Android emulator](http://developer.android.com/tools/devices/emulator.html) for a detailed overview of all the possibilities. Be aware, however, that while some features can only be invoked from the command line, other tasks like reviewing logs in real time, taking screenshots or setting fake GPS coordinates for geolocation apps can be performed from [Google's Android Developer Tools Eclipse plugin](http://developer.android.com/sdk/index.html). Use the DDMS perspective and select a device or emulator from the left, then use the "Emulator Control" tab and scroll down to set device coordinates or load them from a previously saved file.

<img src="http://rhodocs-images.s3.amazonaws.com/guide/using_emulators/ddms.png" alt="Android DDMS perspective" />


## iOS

The iOS simulator is integrated with XCode. Unlike trying to deploy an application on a real iPhone/iPad, running on the simulator does not require a paid developer account or provisioning certificate.

Refer to the section [Running your application](creating_a_project#running-your-application) and select "Simulator" instead of "RhoSimulator" to use the iOS simulator. Alternatively, you can also invoke the iOS simulator from the commad line with:

	:::term
	rake run:iphone

Once running, use the `Hardware` menu to simulate rotating or shaking the device, or the `Debug / Location` option if your application uses geolocation and you want to test that feature.

The complete documentation for all iOS Simulator features can be found at [Interacting with iOS Simulator](http://developer.apple.com/library/ios/documentation/IDEs/Conceptual/iOS_Simulator_Guide/InteractingwiththeiOSSimulator/InteractingwiththeiOSSimulator.html#//apple_ref/doc/uid/TP40012848-CH3-SW1)

## Windows Phone 8

The Windows Phone 8 SDK can be [freely downloaded](https://dev.windowsphone.com/en-us/downloadsdk) and will integrate with Visual Studio 2013 automatically.

**NOTE: If you are running Windows on a virtual machine, the emulator may fail to start and the system will show an error message like "xde.exe has stopped working". Running the WP8 emulator on a virtual machine is not officially supported by Microsoft, but it is possible to make it work if you enable "Nested VT" (Parallels) / "Virtualize Intel VT-x/EPT or AMD-V/RVI" (VMWare) on your virtualization host software. At the time of this writing, VirtualBox does not support nested virtualization.**

When the emulator is running, locate the toolbar:

<img src="http://rhodocs-images.s3.amazonaws.com/guide/using_emulators/toolbar.png" alt="Windows Phone 8 emulator toolbar" />

and click the icon with the double arrow pointing to the right to reveal an additional set of tools, where you can simulate

* moving the device in 3D space, to [test the accelerometer](http://msdn.microsoft.com/en-us/library/windowsphone/develop/hh202936(v=vs.105).aspx)

<img src="http://rhodocs-images.s3.amazonaws.com/guide/using_emulators/accelerometer.png" alt="Windows Phone 8 emulator accelerometer test" />

* [Test location data](http://msdn.microsoft.com/en-us/library/windowsphone/develop/hh202933(v=vs.105).aspx)

<img src="http://rhodocs-images.s3.amazonaws.com/guide/using_emulators/location.png" alt="Windows Phone 8 emulator fake GPS coordinates" />