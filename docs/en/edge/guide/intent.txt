# Intent API Guide

The Intent API class allows your app to communicate with other apps on the device. With this API, you'll be able to communicate between two RhoMobile applications as well as between RhoMobile and a native application.

**NOTE: To us this class, you should first read up on the [Intent API](../api/Intent) in our API docs so that the concepts mentioned here are more familiar.**

## What are Intents?
Before we start sending or receiving intents, we first need to answer the question, "What are intents?". Intents are a mechanism setup and used by the Android operating system that allow application components to request functionality from other Android components. Intents allow you to interact with components from the same application as well as with components contributed by other applications. 

On other platforms, like iOS, there are concepts like [URL Schemes](https://developer.apple.com/library/ios/featuredarticles/iPhoneURLScheme_Reference/Introduction/Introduction.html). Although [URL Schemes](urlschemes) have been supported by RhoMobile, this approach practically only allows launching of other applications and services and has some limitations. Intents, however, allow for a more robust cross-application communication that allows passing of data objects as well as two-way communication.


### Why Do I Want to Send or Receive Intents?
When we talk about "sending" or "receiving" an intent, we are referring to the action of sending an object to the OS that can be interpreted by the OS and turned into a native device command. For instance, if we send an intent with the "uri" of **"geo:37.422, -122.084"**, the Android OS knows to launch it's default maps app (since we did not specify an appName), and pinpoint Google's Mountain View headquarters. This is useful since we don't want to have to write our own mapping program that may not be as good as Google's provided mapping app.

Another example, may be where you want something returned by the secondary application like when you want to take a picture or choose one from the gallery. This allows the application developer some freedom in not having to write code to handle this task.  It is possible that the device has multiple applications with different abilities to take pictures and in that case the user would be presented with a choice to pick one. 

When it comes to having multiple RhoMobile applications running on a device, you may want to write a core service apps that listens for intents from secondary apps. This approach may be more efficient in managing your applications instead of replicating this code in all of the applications. 

You can also read up on intents on Google's [Android docs regarding intents](http://developer.android.com/guide/components/intents-filters.html).

## Constructing an Intent
As you may have gleaned from our [Intent API docs](../api/Intent), there are only three methods available:

* send
* startListening
* stopListening

This is basically because you are either sending an intent or receiving one. Since Intents involve multiple applications, you need to first decide what role your RhoMobile application is going to participate as. Does your application need to send an Intent to another RhoMobile application? Does it need to send an Intent to a common Android native application? Does it expect any information back from the Intent or are you trying to just launch an application or service? Maybe you want your application to enable listening in order to respond to Intents from other applications. Understanding the required configuration between the two sides is crucial in getting the expected behavior you are looking for.

Applications register for receiving events typically by a combination of multiple parameters:

* action - A string that specifies the generic action to perform (such as view or select).
* categories - A array of strings containing additional information about the kind of component that should handle the intent
* uri - A string that may be needed to launch a particular application (such as tel://5551212)
* mime_type - A string representing the type of data being passed (such as textr/plain)
* data - A set of Key,Value pairs that allow for sending data to the Intent (Android calls these `EXTRAS`)

If you don't know the right combination of parameters, then your Intent will never be received. Let's use a simple example, the one listed above regarding sending a GeoLocation coordinate to the maps app. For Android, I would check the [Android docs](http://developer.android.com/guide/components/intents-common.html#Maps) to see that an `action` and `data-uri` are the only components that are required. 

***NOTE: When the Android docs reference a constant, we will need to use the actual string that it refers. For example, when the Android docs show ["ACTION_VIEW"](http://developer.android.com/reference/android/content/Intent.html#ACTION_VIEW), we need to instead use `"android.intent.action.VIEW"`, which can be retrieved by clicking on the constant name in the Android docs.***

## Sending Intents
### Assemble the Parameters
Now that we know the different pieces we'll need, let's put the intent together. These are the parameters that we need to send to open the maps app and plot the location of Google's Mountain View HQ.

* action     => "android.intent.action.VIEW"
* intentType => Rho::Intent::START_ACTIVITY (RUBY)
* intentType => Rho.Intent.START_ACTIVITY (JS)
* uri        => "geo:37.422, -122.084"

### Send the Intent
Now that we have these, we simply need to put them into a hash and use the Rho [Intent API method](../api/Intent#msend) `Intent.send()` to send the intent. This api takes two parameters. The first one is an object that represents the intent options that the intent receiver application is expecting. The second optional parameter is a callbackhandler for Intent call. In our example, we have chosen to not handle a callback.

<ul class="nav nav-tabs">
    <li class="active"><a href="#ruby_send" data-toggle="tab">Ruby</a></li>
    <li><a href="#javascriptSend" data-toggle="tab">JavaScript</a></li>
</ul>

<div class="tab-content">
    <div class="tab-pane fade in active" id="ruby_send">
        <pre class='CodeRay'><code>:::ruby
def send_geo
  intent_params = { :action     => "android.intent.action.VIEW",
                    :intentType => Rho::Intent::START_ACTIVITY,
                    :uri        => "geo:37.422, -122.084" }

  Rho::Intent.send intent_params
end</code></pre>
    </div>
    <div class="tab-pane fade" id="javascriptSend">
    <pre class='CodeRay'><code>:::javascript
function sendGeo(){
  var intentParams = {action    : "android.intent.action.VIEW",
                     intentType : Rho.Intent.START_ACTIVITY,
                     uri        : "geo:37.422, -122.084"};

  Rho.Intent.send(intentParams);
}</code></pre>
    </div>
</div>

This intent will send the string "geo:37.422, -122.084" to the Android OS and request that it start the activity that handles geolocation coordinates. If there are multiple different apps on the device that provide geolocation services, an app chooser will pop up asking the user to choose which app they want to open the coordinates in.

### Handling Intent Response
The response that will be sent from the intent will be the same as the data that was sent from the intent that is sent. For instance, if you send intent Parameters that contain an extra called dataFromSender defined as such `{ data => { dataFromSender => "Example Data" } }`, you would access this data using the following syntax:

<ul class="nav nav-tabs">
    <li class="active"><a href="#ruby_send" data-toggle="tab">Ruby</a></li>
    <li><a href="#javascriptSend" data-toggle="tab">JavaScript</a></li>
</ul>

<div class="tab-content">
    <div class="tab-pane fade in active" id="ruby_send">
        <pre class='CodeRay'><code>:::ruby
def callback
  Alert.popup @params['data']['dataFromSender']
end</code></pre>
    </div>
    <div class="tab-pane fade" id="javascriptSend">
    <pre class='CodeRay'><code>:::javascript
function callback(){
  alert(params['data']['dataFromSender']);
}</code></pre>
    </div>
</div>

## Receiving Intents
Ok, we can send intents, great! But what if what you want to do is send an intent to another one of your apps, or receive an intent from another app? We can also use the Rho Intent API for this but it requires a bit more work than the sending did.

There are a few things we need to do to receive an intent:

* Add an intent receiver to the AndroidManifest.erb (Android Only)
* Add the code to start listening for incoming intents.
* Add a callback handler to handle the data coming in from an intent.

### Add an Intent Receiver to the AndroidManifest.erb
When an app is installed on an Android device, it's Android manifest gets registered with the OS so that the OS knows whether or not the app is going to accept incoming intents. We need to make sure that our app's Android manifest is formatted correctly to let our app receive intents. The AndroidManifest.erb is held in the root directory of your app's project.

NOTE: This was handled differently prior to version 4.1 - Any application project that was created prior to 4.1, should manually add a file called `AndroidManifext.erb` in the root of the project as well as add an entry to your `build.yml` file `android: manifest_template: 'AndroidManifest.erb'`. If you create a new project using RhoStudio's application wizard, you will see this performed automatically.


This is what our intent-filter will look like to receive a simple, plain text, intent from another app:

`<app_root/AndroidManifest.erb>`
    :::xml
    <manifest>
      ...
      <receiver android:name='com.rho.intent.IntentReceiver'>
        <intent-filter>
          <action android:name="android.intent.action.SEND"/>
          <category android:name="<%=@appPackageName%>"/>
          <data android:mimeType="text/plain"/>
        </intent-filter>
      </receiver> 
      ...
    </manifest>

Let's explain a few of the items here:

`receiver android:name` 

This should always say `com.rho.intent.IntentReceiver`. For Android, we are basically setting up a [Broadcast Receiver](http://developer.android.com/reference/android/content/BroadcastReceiver.html) that will receive any intents that are sent as a `broadcast`.

`intent-filter`

* `action android:name`   - This is the intent action that our app will expect from intents the it receives. 
* `category android:name` - This is the category of intents that our app will expect. A value of default will accept all categories
* `data android:mimeType` - This is the data type that our app will be expecting to handle in intents that it receives.

***NOTE: For Android, this is common syntax for an [intent-filter element].(http://developer.android.com/guide/topics/manifest/intent-filter-element.html). Also, We could have easily used any custom string that we wanted for our `action` and `category` fields. By using standard Android strings, our application will be presented as a choice when another app uses the same signature for sending an intent.***

### Add Code to Start Listening for Intents
Now, before we can start sending intents to this app, we need to add some code that will allow us to tell the app to start listening for intents. We do this with the Rho [Intent API method](../api/Intent#mstartListening) `Intent.startListening()`.

<ul class="nav nav-tabs">
    <li class="active"><a href="#ruby_callback" data-toggle="tab">Ruby</a></li>
    <li><a href="#javascriptCallback" data-toggle="tab">JavaScript</a></li>
</ul>

<div class="tab-content">
    <div class="tab-pane fade in active" id="ruby_callback">
        <pre class='CodeRay'><code>:::ruby
def start_listening
  Rho::Intent.startListening "/app/Intent/listening_for_intent_callback"
end</code></pre>
        <p>You can see here that we have specified a callback handler but we have not yet defined the callback handler, we'll do that next.</p>
    </div>
    <div class="tab-pane fade" id="javascriptCallback">
        <pre class='CodeRay'><code>:::javascript
Rho.Intent.startListening(function(params){
  // Your callback code here
  console.log(params.responseCode);
});</code>
        </pre>
        <p>You can see here that we have specified a callback handler and defined the callback handler in an anonymous function. All that's left is to fill in the code to handle the callback, we'll do that next.</p>
    </div>
</div>

### Add a Callback Handler
We can now receive intents but, without a callback handler, receiving an intent is meaningless.

<ul class="nav nav-tabs">
    <li class="active"><a href="#ruby_handle_callback" data-toggle="tab">Ruby</a></li>
    <li><a href="#javascriptHandleCallback" data-toggle="tab">JavaScript</a></li>
</ul>

<div class="tab-content">
    <div class="tab-pane fade in active" id="ruby_handle_callback">
        <pre class='CodeRay'><code>:::ruby
def listening_for_intent_callback
  Rho::Notification.showPopup({ :message => @params['data']['dataFromSender'],
                                :title => "Alert!",
                                :buttons => ["ok"] })
  puts @params.responseCode
end</code></pre>
    </div>
    <div class="tab-pane fade" id="javascriptHandleCallback">
    <pre class='CodeRay'><code>:::javascript
Rho.Intent.startListening(function(params){
    alert(params['data']['dataFromSender']);
    
    console.log(params.responseCode);
});</code></pre>
    </div>
</div>

All we are doing with the received data is showing a pop-up with the data that is passed in through the `uri` parameter.

With these pieces complete, we should be able to compile an intent to send to this app and display the data that we send.

### Construct Intent to be Received
From whatever other app you want to send an intent to this app, you must construct an intent to send to it. When creating the intent to send to the intent receiver, you must make sure the sent intent's parameters match the parameters that the intent receiver is looking for. In our case, we need to make sure we use a SEND action, some data with the text/plain mimeType, and use the DEFAULT category. We will also use a BROADCAST intentType.

<ul class="nav nav-tabs">
    <li class="active"><a href="#ruby_send_2" data-toggle="tab">Ruby</a></li>
    <li><a href="#javascriptSend2" data-toggle="tab">JavaScript</a></li>
    <li><a href="#androidSend2" data-toggle="tab">Android Java</a></li>
</ul>

<div class="tab-content">
    <div class="tab-pane fade in active" id="ruby_send_2">
        <pre class='CodeRay'><code>:::ruby
def send_intent
  intent_params = { :action      => "android.intent.action.SEND",
                    :intentType  => Rho::Intent::BROADCAST,
                    :data        => { "android.intent.extra.TEXT" => "Text to send to receiving app." },
                    :mimeType    => "text/plain",
                    :categories  => "android.intent.category.DEFAULT" }

  Rho::Intent.send intent_params
end</code></pre>
    </div>
    <div class="tab-pane fade" id="javascriptSend2">
    <pre class='CodeRay'>
        <code>:::javascript
function sendIntent(){
  var intentParams = {action      : "android.intent.action.SEND",
                      intentType  : Rho.Intent.BROADCAST,
                      data        : { "android.intent.extra.TEXT" : "Text to send to receiving app." },
                      mimeType     : "text/plain",
                      categories  : "android.intent.category.DEFAULT"}

  Rho.Intent.send(intentParams);
}</code>
    </pre>
    </div>
    <div class="tab-pane fade" id="androidSend2">
    <pre class='CodeRay'><code>:::java
public void sendIntent() {
    Intent intentRho = new Intent("android.intent.action.SEND");
    intentRho.addCategory("android.intent.category.DEFAULT");
    intentRho.setType("text/plain");
    intentRho.putExtra("android.intent.extra.TEXT": "Text to send to receiving app.");

    sendBroadcast(intentRho);
}</code></pre>
    </div>
</div>