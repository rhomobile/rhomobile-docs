# RhoConnect.js Introduction
There is a JavaScript client library for the [RhoConnect](http://rhomobile.com/rhoconnect.html) App Integration Server.

Using rhoconnect.js, your application's model data will transparently synchronize with a mobile application built using the [RhoElements framework](http://rhomobile.com/rhoelements.html), or any of the available [RhoConnect clients](http://rhomobile.com/rhoconnect.html). This client includes built-in support for the [SenchaTouch](http://www.sencha.com/) data API and [Persistence.js](http://persistencejs.org/) models.

Rhoconnect.js is a completely UI-agnostic framework, so feel free to use any type of UI JavaScript library.

Due to the CORS support in [RhoConnect](http://rhomobile.com/rhoconnect.html) server, you are able to create cross-domain applications and standalone mobile applications using the [PhoneGap](http://www.phonegap.com/) framework.

It depends on the following jQuery libraries and plugins.
* [jQuery](http://jquery.com/) library.
* jQuery [Base64](http://github.com/carlo/jquery-base64) plugin.
* jQuery [JSON](https://sites.google.com/site/jollytoad/json.js?attredirects=0) plugin.

Rhoconnect.js actively uses *deferred/promise* objects from jQuery API. All asynchronous results are returned as parameter values of the *done(..)* method call of the returned *promise* object.

#### About
Created and maintained by Dmitry Prokhorov. Released under the [MIT License](http://www.opensource.org/licenses/mit-license.php).