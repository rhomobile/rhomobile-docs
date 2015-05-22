# Supported Platforms
## Supported Operating Systems
* iOS 6.0 or greater (iPhone, iPod Touch, iPad)
* Android 2.3 and greater (Gingerbread, Ice Cream Sandwich, JellyBean) - Both ARM and x86
* Windows Mobile 6.x Professional, 6.0 Standard, Windows CE 5, Windows CE 6, Windows CE 7, Windows XPe
* Latest Windows Phone 8 mobile devices
* Windows Desktop (Windows 7, 8, 8.1)

NOTE: Please review release notes that accompany the software for further remarks on supported devices and operating systems.

## Validated Zebra Hardware
### Mobile Computers
ET1 (Gingerbread/JellyBean), ES400, MC3000, MC3090, MC3190-Z (RFID), MC3100(R/S), MC3190(R/S/G), MC40 (Gingerbread/JellyBean), MC45, MC5574, MC5590, MC55A0, MC55N0, MC659B, MC67, MC7004, MC7090, MC7094, MC7095, MC7506, MC7508, MC7596, MC7598, MC75A0, MC75A6, MC75A8, MC9090, MC9097, MC9094, MC9190-G, MC9190-Z (RFID) MC92N0, MC9590, MC9596, MC9598, MC959B (WM 6.1), TC55.

| Model 		| Platform | OS
|:--------------:|:--------:|:--:
| MC32NO  | MPA 3 | Android JB
| MC92NO  | MPA 3 | WM 6.5, CE 7
| MC67  | MPA 3 | WM 6.5 
| MK3100  | ADC | CE 7 
| VC70  | MPA 3 | CE 7 
| MC75A  | MPA 2 | WM 6.5
| MC3190  | MPA 2 | CE 6, WM 6.5 
| MC959B  | MPA 2 | WM 6.1, WM 6.5
| ES400  | MPA 3 | WM 6.5
| MC9190  | MPA 2 | CE 6
| MC45  | ODM | WM 6.5
| MC32NO  | MPA 3 | CE 7
| MC55  | MPA 2 | CE6
| WT4190  | MPA 3 | CE 7
| MC67  | MPA 3 | WM 6.5
| ET1  | TI | Android JB
| MC40  | TI | Android JB
| TC55  | Qualcomm | Android JB
| TC70  | Qualcomm | Android KitKat
| MC67  | Qualcomm | Android JB
| WAP4  | TI | CE 6

## Validated Non-Zebra Hardware

| Model 		| Manufacturer  | Platform | OS
|:-------------:|:-------------:|:--------:|:--:
| iPhone 5 | Apple | A7 | iOS 7, iOS 8
| iPhone 6 | Apple | A8 | iOS 8
| Nexus 4 | Google | Qualcomm | Android JB
| Note 3 | Samsung | Qualcomm | Android JB
| Lumia 920 | Nokia | Qualcomm | WP8
| FonePad | ASUS | x86 | Android JB (x86)



**NOTE: The TC55 supports [4.0 APIs](apiusage#api-migration-table) and a subset of [2.2 APIs](apiusage#using-22-apirsquos). Applications that have been developed using some 2.2 APIs like [Scanner](../../2.2.0/rhoelements/scanner) will need to be modified to use the 5.0 APIs, for example [Barcode](../api/barcode). Please consult the [migration table](apiusage#api-migration-table) for more information.**

**NOTE: MC3190-Z and MC9190Z RFID Devices are supported [via a RFID plugin](../../2.2.0/rhoelements/rfid) that must be installed separately. This plug-in was developed for RhoElements version 2.2 but is still supported.**

### Vehicle Terminals
VC5090, VC6000, VC6096, VC70

### Micro Kiosks
MK3000, MK3090, MK3100, MK3190, MK4000, MK4090

> Note: While we support building apps for MK devices locally, using [cloud build](../../hosted/guide/remote-build-guide) for MK device apps is not supported. For these devices, [Enterprise Browser](http://goo.gl/V9zMxD) is also available as an app building solution alternative.

### Wearable
WT4070, WT4090, WT41N0

## Memory Considerations
RhoElements 5.0 has support for our older device families such as the MC9000 and MK4000. The devices supported by RhoElements span the entire range of the performance spectrum and therefore care should be taken when developing applications, especially for these older devices. Please have the capabilities of your target device in mind when developing your application, the following points will help with this.

* Devices must have a minimum of 128MB of physical RAM to support RhoElements
* JavaScript libraries such as Sencha touch or JQuery Mobile can use a significant amount of memory at runtime. The more JavaScript libraries loaded into the DOM then the greater the RAM footprint of the web page will be.
* Out of the box you will find JQueryMobile will not be included automatically in your views on Windows Mobile / CE devices, this is to give the best possible performance.
* There are APIs available in the product to monitor the memory including memory logs and a Memory API. You can use these tools to get a handle on the requirements of your application.
* Resources are available on developer.motorolasolutions.com to help create great looking, streamlined apps including blogs and webinars.
* On-line performance tests for JavaScript and CSS, particularly those involving DOM manipulation will often be written to target desktop computers and may not run on all supported devices.
* On some of our lower end CE devices you may find you need to increase the program memory available to install RhoElements and you can do this from the Control Panel. Out of the box you will have sufficient memory on your device but if you have already installed a lot of programs you may need to allocate more program memory or delete your existing files.
* The more RhoElements applications you run on your device the greater the required memory will be. Consider using the TabBar in a single application rather than multiple separate applications.
* Windows Mobile 5.0 is not supported in this release, devices should be updated to Windows Mobile 6.x where possible.

### JQM Transitions
When using JQM transitions on Windows Mobile or Windows CE devices, you may notice that the transition animations do not occur. Investigation into this shows that the device hardware is just not capable to rendering the animations; the transition jumps from the old page to the new page without any fancy animation, dropping all the frames.