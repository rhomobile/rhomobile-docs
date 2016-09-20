RhoConnect Introduction
===

RhoConnect is the first of a new category of “mobile app integration” servers. Using RhoConnect drastically simplifies the development of connectivity to an enterprise backend app. The RhoConnect server and built-in RhoConnect client in the smartphone app perform all the work to get data down to the device. This eliminates 50 to 80 percent of the development effort in enterprise smartphone apps: performing the backend application integration.

RhoConnect also does the ongoing synchronization work: keeping all of the data from backend applications current on the local device.   As information is changed in backend applications it is immediately synchronized down to all devices, and available on devices even when they are offline.  Data changed on the devices is also synchronized by RhoConnect to the backend system.

RhoConnect does not require use of Rhodes for the client app.  It can also be used from apps written in Objective C or even from other frameworks using JavaScript.

RhoConnect consists of the following components:

* Synchronization Framework - The core of RhoConnect, this facilitates data synchronization between the Rhodes / RhoConnect-Client and a 3rd party source (SOAP, REST, etc...). Each source is synchronized by implementing a "source adapter" which consists of model and controller. The client connects with the embedded [sinatra](http://www.sinatrarb.com/) server to interact with the collection of source adapters.  RhoConnect uses [redis](http://redis.io/) to efficiently cache data to be synchronized.

* REST API - RhoConnect exposes a simple REST API for interacting with an application.  See the [REST API docs](rest-api) for more information.

* Administration Web Console - The RhoConnect [web console](web-console) is sinatra server used for manipulating and peeking into a running RhoConnect app. The console uses the [RhoConnect REST API](rest-api) for everything it does.

* Asynchronous Job System - RhoConnect uses the [resque](https://github.com/defunkt/resque) library to provide asynchronous execution of various tasks it needs to perform. These tasks include source adapter execution, sending push messages, preparing bulk data, etc... Resque is dead-simple to use and highly extensible, so it can easily be used for other functionality not described here.

The bulk of the work involved in making RhoConnect work with your smartphone application is writing source adapters. This process is described in the [source adapter section](source-adapters). A longer [tutorial](tutorial) is also available.