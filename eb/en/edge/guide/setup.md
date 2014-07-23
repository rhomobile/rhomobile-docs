#Installation

## Desktop Installation
Installing Enteprise Browser on your desktop will provide you will all you need to get started.

1. Download the Enterprise Browser MSI.
2. Install the MSI. 
> TBD Insert UI snapshots of MSI installer
3. You should see the following Start Menu Entries after MSI installation is complete.

* MotorolaSolution_Enterprise Browser
	* Runtime
	* Installer
	* Documentation

> TBD Insert screen shot

## Device Deployment
To install the Enterprise Browser runtime onto your device, follow the steps below:

1. Connect your device to you PC via the USB cable and wait for Microsoft ActiveSync/Device Center to connect. 
2. From your Start Menu browse to the "Motorola Enterprise Browser \ Enterprise Browser Runtime" and select it.
3. The user will be presented with options to choose which variant of Enterprise Browser they wants to install on the device.
4. Information pertaining to each of these options is available on the screen so the user can select the appropriate Runtime.
5. Depening on the device operating system, you will different steps. See below for your device specific operating system.

### Windows Mobile/Windows CE Devices
1. The ActiveSync installer will now install the selected Enterprise Browser runtime files to your device. 
> Note if you are given a choice of which directory to install to select the default option, regardless of what you select, Enterprise Browser will install into the default location.

2. If you have chosen to install the Persistent Runtime for Windows then you are required to Cold Boot/Clean PS the device after installation.

### Android Devices

1. Connect your device to you PC via the USB cable.
2. Ensure that you have ADB environment installed on your PC and that your Android device is detectable via "adb devices" command.
3. The ADB installer will install the Enterprise Browser runtime to your device.

##Manual Deployment
The Enterprise Browser runtime can also be installed manually by the user. Please follow the following steps to carry out manual installation.

1. Download the Enterprise Browser MSI.
2. Install the MSI. 
> TBD Insert UI snapshots of MSI installer
3. You should see the following Start Menu Entries after MSI installation is complete.
	* MotorolaSolution_Enterprise Browser
		* Runtime
		* Installer
		* Documentation
4. Click on Runtime Start Menu item. This will open up Windows Explorer and point to a folder where all the Runtimes are available.
5. Choose the appropriate Runtime.
6. Copy and Paste to your connected device.
7. Open the File location where you have copied the Runtime and click to install.
8. If you are installing a Persistent Runtime then you are required to Coldboot/CleanPS the device after installation. 

Once the installation is completed on your device, you can start Enterprise Browser on your device by clicking the associated icon form the programs group/Apps.