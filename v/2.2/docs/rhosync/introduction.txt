RhoSync Introduction
===

RhoSync is a data synchronization server and client library which keeps enterprise app data current and available on users’ smartphones. The information is stored locally on a user’s device and available even when disconnected and offline.

The RhoSync server handles the job of connecting to backend applications, keeping track of multiple devices and what information they need, and sending them just those updates. RhoSync can also be used to register its interest in changing information from the backend. It then efficiently "pushes" the changes to the phones via the native smartphone push SDKs.

Synchronization servers for mobile apps have existing for a long time. The differentiators of RhoSync versus other sync servers are: very high scalability via NoSQL caching, easy sync source adapter development, and support of native smartphone push APIs.

RhoSync consists of the following components:

* Synchronization Framework - The core of RhoSync, this facilitates data synchronization between the Rhodes / RhoSync-Client and a 3rd party source (SOAP, REST, etc...). Each source is synchronized by implementing a simple "source adapter" class. The client connects with the embedded [sinatra](http://www.sinatrarb.com/) server to interact with the collection of source adapters.  RhoSync uses [redis](http://redis.io/) to efficiently cache data to be synchronized.

* REST API - RhoSync exposes a simple REST API for interacting with an application.  See the [REST API docs](rest-api) for more information.

* Administration Web Console - The RhoSync [web console](web-console) is sinatra server used for manipulating and peeking into a running RhoSync app. The console uses the [RhoSync REST API](rest-api) for everything it does.

* Asynchronous Job System - RhoSync uses the [resque](https://github.com/defunkt/resque) library to provide asynchronous execution of various tasks it needs to perform. These tasks include source adapter execution, sending push messages, preparing bulk data, etc... Resque is dead-simple to use and highly extensible, so it can easily be used for other functionality not described here.

The bulk of the work involved in making RhoSync work with your smartphone application is writing source adapters. This process is described in the [source adapter section](source-adapters). A longer [tutorial](tutorial) is also available.