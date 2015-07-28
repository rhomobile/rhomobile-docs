# Licensing
Licensing in RMS 5.x has changed considerably. Most significant is the requirement to maintain a subscription to [rhomobile.com](http://www.rhomobile.com) before building any app. While you can still build an unlimited number of local apps for free, pricing models apply for cloud-based builds and for most apps that will use RhoConnect or RhoElements. 

## Subscriptions
Zebra's new subscription licensing model offers three levels: Free, Silver and Gold. The the plans are detailed below.

<img style="border:solid;border-color:#999" src="https://s3.amazonaws.com/rhodocs/cloud/licensing/sub-details.png">

NOTE: The free subscription is limited to local builds using Rhodes and RhoStudio only.

## Applying Your Subscription Plan
Once you have signed up for a subscription on [rhomobile.com](http://www.rhomobile.com/content/rhopricing.html), you'll need to apply your new plan to your copy of RhoStudio. This can be done through the IDE or the command line. Either method allows the registered user to sign into their rhomobile.com account in advance or at build time. Both methods are detailed below. 

### Signing In With the Command Line
<div class="row-fluid">
	<div class="span7">
		<p>To apply your subscription plan using the command line run the command:</p>
			<pre>$ rake cloud:login</pre>

		<p>This will prompt for a username and password, log into the rhomobile.com account and download the API token to the local machine.</p><p>Token storage:</p> <b>On Mac OS X-</b> <code>~/.rhomobile/token</code></p> <p> <b>On Windows-</b> <code>/Users/&lt;username&gt;/.rhomobile/token</code> </p>
	</div>
	<div class="span5">
		<img src="https://s3.amazonaws.com/rhodocs/cloud/licensing/cli-login-dialog.png">
	</div>
</div>

### Signing In Through RhoStudio
<!-- Steps -->
<div class="row-fluid">
	<div class="span7">
		<p>To apply your subscription plan using the RhoStudio IDE:</p>
		<ol>
			<li>Open the preferences pane (<b>&#8984;,</b> on Mac OS, <b>Ctrl+P</b> on Windows)</li>
			<li>Select <b>RhoMobile -> RhoMobile.com</b> and click the "login to rhomobile.com" button</li>
			<li>Enter username and password when prompted</li>
		</ol>
		<p>Once valid credentials are entered, an API token will be downloaded and stored on the local machine. </p><p>Token storage:</p> <b>On Mac OS X-</b> <code>~/.rhomobile/token</code></p> <p> <b>On Windows-</b> <code>/Users/&lt;username&gt;/.rhomobile/token</code></p>
		<p>If you don't have an account while going through these steps, you'll be prompted to sign up on the fly. Just click the "Signup" link in the login prompt and your browser should open and point to <a href="http://rhomobile.com">RhoMobile.com</a>.</p>
	</div>
	<!-- Sign-In Picture -->
	<div class="span5">
		<img src="https://s3.amazonaws.com/rhodocs/cloud/licensing/rs-login-dialog.png">
	</div>
</div>

### Done!
Once you've applied your license you shouldn't be prompted to log in again. You're now free to use the tools as often as you like. **So let's start building**!