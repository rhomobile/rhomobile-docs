RhoConnect Source Adapters
===

## What is RhoConnect Source Adapter?

A RhoConnect Source Adapter is a software entity which encapsulates:

* Source's business logic implementation (via a Model)
* Source's run-time management and HTTP route handling (via a Controller)

## Source Adapter Controller

From a web developer's point of view - each RhoConnect application is a collection of unique HTTP route handlers grouped logically into a Source Adapter Controller.
Each Source Adapter Controller defines a serviceable end point relative to the root of the application and represents itself as a stand-alone [Sinatra](http://www.sinatrarb.com/) app.
As a Sinatra app - Source Adapter Controller defines the available routes and handles the incoming requests.
Typically, you will just re-use the default implementation of the Controller. However, in some cases, you may customize it by adding your own routes or altering the default route's behaviour. In this sense, Controller is still a Sinatra app - and you can re-use any of the available Sinatra tools and techniques.

## Source Adapter Model

By default, each RhoConnect Source Adapter Controller defines SYNC routes to be called by the RhoConnect client's application.
At run-time, the Source Adapter controller prepares the context of the request (for example, parses and prepares the query parameters, etc.), then instantiates the corresponding RhoConnect Source Adapter Model and calls its methods.

As a developer - you will need to implement the business logic inside of the RhoConnect Source Adapter Model class.
Connecting to a backend service with RhoConnect means that you will be required to write a small amount of code for the query, create, update and delete operations of your particular enterprise backend. In this way - the RhoConnect Source Adapter model is a collection of Ruby code to access and process the data from your enterprise backend.

## Source Adapter API

Starting with RhoConnect 4, Source Adapters can be developed in Ruby or JavaScript.  The next sections describe the Source Adapter API available for each of these languages.