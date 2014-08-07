#RhoMobile Migration guide

Enterprise Browser supports applications that were using RhoElements 4.x Shared Runtime on Windows Mobile/CE and Android. In RhoElements 4.x, access to the features were made available through JavaScript objects under the `Rho.` namespace:

	:::javascript
	// Scan with default options
	Rho.Barcode.take({}, scan_received);

To use the `Rho.` namespace, you must replace the `rhoapi-modules.js` file that came with RhoMobile Suite 4.x with the file `rhoapi-modules.js` that came with Enterprise Browser found in the Enterprise Browser installation folder

TBD Insert Screen Shot	
