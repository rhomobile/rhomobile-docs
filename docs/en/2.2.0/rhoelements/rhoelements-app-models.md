# RhoElements Application Models

<!-- PLACEHOLDER - Blurb and diagram explaining choices have for native and hybrid approached] -->

## Native Application Approach

Native applications are written using HTML, CSS and JavaScript, and the Rhodes-style Ruby framework for the application logic. Like a Rhodes app, you deploy and run a RhoElements native application on the mobile device. As with all RhoElements applications, native applications are platform agnostic.

[Build A RhoElements Native application.](rhoelements2-native)

### Native Application Development and Distribution

To develop a RhoElements Native application, you use RhoStudio, as you would for a Rhodes app. And as with a Rhodes app, RhoElements native applications are built and deployed to a mobile device via a CAB file (Windows Mobile or Windows CE), APK file (Android), or whatever file the mobile platform uses.

### Using Native Applications over Hybrid Applications

You may decide to create RhoElements native apps over hybrid apps when the network reliability is undetermined. An example might be a despatch driver who will need to collect data and process information even when there is no Wi-Fi or cellular data network available. Other uses cases might be where it is unacceptable for a network delivered page to fail to be delivered or if significant business logic should be processed on the device.

## Hybrid Web App Approach

Applications that are running in a more traditional web app model are typically written purely with HTML, CSS, and JavaScript or running from any web server application technology (.NET, Java, etc). They may include some form of server logic (local or remote). These hybrid apps have their application logic on the backend web application, whereas native apps have the application logic on the device itself. The hybrid apps perform device capabilities with both HTML tags (EMML tags and more), and JavaScript calls.

[RhoElements Enable A Web App](rhoelements2-webapps)

### Hybrid Application Development and Distribution

To develop a RhoElements Hybrid application, use a web development environment, such as Eclipse or Visual Studio. You install the RhoElements Runtime on your mobile device; the runtime is a precompiled RhoElements native application written by Zebra Technologies. This application is responsible for reading your application's config.xml and directing the view to the URL specified as the "Start Page" in your application's config.xml.

**NOTE: This RhoElements runtime application works in the same way and will be 100% backwards compatible with RhoElements Version 1.x **

Hybrid applications are distributed to the client in a mostly thin client nature, that is to say that RhoElements will be pointed to a URL and the logic and content of the application will be delivered in the same way that any website would be delivered to the client.

### Using Hybrid Applications over Native Applications

Primarily, hybrid apps operate in a mostly web-connected environment. These apps can be compared to RhoElements 1, PocketBrowser applications. These applications can easily be modified and distributed to the user each time they are accessed: a hybrid app lets you change and update app functionality on the web, without pushing out an update to the mobile device (as is the case with native apps). 

