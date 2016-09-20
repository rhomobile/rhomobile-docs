# Hardware Acceleration

Hardware accleration is available on devices that have a dedicted CPU for handling graphics. This will come into play when generally for rendering application interfaces as well as when using certain CSS3 attributes typically for animation or transitions.

## Android 

Support android:hardwareAccelerated attribute at AndroidManifest.xml for main Rhodes activity.

To set android:hardwareAccelerated='true' at Androidmanifest.xml for RhodesActivity enable the hardware_acceleration capability. This is done by adding the following lines to build.yml:

	:::yaml
	android:
	  capabilities:
	    - hardware_acceleration

## Windows Mobile/CE
Windows Mobile or Windows CE devices do not have the capability of running applications with dedicated CPU processing for graphics. This is due to both platform and hardware constraints. Running graphic intensive operations will still run without failure, but performance may not be acceptable.

## iOS

RhoMobile applications running on iOS run inside of the stock Webkit (Safari) for that particular version of iOS. You should consult Apple's website for support of hardware accleration for particular OS versions. There may also be other techniques for using specific CSS attributes to force hardware acceleration like `-webkit-transform: translateZ(0);` and `-webkit-transform: translate3d(0, 0, 0);`  
