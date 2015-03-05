Push Synchronization
===

Use push synchronization when you want to automatically detect changes on the RhoConnect side, and you want to push those changes to your client without having to tell your client to sync.

RhoConnect has a simple ruby API for sending push notifications (a ping call) to a user's devices. This API can be called directly, queued as a resque job, or called remotely via the [RhoConnect REST API](rest-api). The push message can trigger the following actions in the Rhodes application: alert with a message, sync one or more sources, vibrate, display a badge, and play a sound file.

The following sections show how to use the RhoConnect application to deliver push messages to each client platform and how you can handle the push notification in your Rhodes application.

## Setting up Server and Client

You will need to perform one of the following set of instructions on the RhoConnect server and your mobile device for your specific platform.

* [Set up RhoConnect Push Service on client and server for Rhodes Android and Windows Mobile/CE Devices](push-client-setup-rps).
* [Set up Google Cloud Messaging on client and server for Rhodes Android Device](push-client-setup-android).
* [Set up Apple Push Notification Service on client and server for Rhodes iOS Device](push-client-setup-ios).
Then you will need to [perform the final set up on your client](push-client-setup).

## Executing a Ping Call

RhoConnect has a simple ruby API for sending push notifications (a ping call) to a user's devices. You can [execute a ping call from your RhoConnect source adapter or from your backend application that uses a RhoConnect plugin](push-backend-setup).

## Testing Push

You can [test push from the RhoConnect console](push-testing).


