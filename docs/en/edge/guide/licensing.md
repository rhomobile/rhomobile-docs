# Licensing
Licensing in 5.0 has changed quite a lot, the most significant of these changes being the requirement that building any app what-so-ever requires that you have a subscription from our [rhomobile.com](http://www.rhomobile.com) site. This does not meant that you are required to pay in order to build an app as we have a free subscription level to use for local app builds. Let's go over what is involved in subscribing and building an app locally.

## Subscriptions
New to 5.0 we are introducing a subscription model for licensing for our products. The new licensing structure has three levels: Free, Silver, and Gold. The details of these plans are listed below.

<img style="border:solid;border-color:#999" src="https://s3.amazonaws.com/rhodocs/cloud/licensing/sub-details.png">

NOTE: This <b>does</b> mean that without a paid subscription your usage of RhoMobile products is limited to Rhodes and RhoStudio for local builds only.

## Applying Your Subscription Plan
Once you have signed up for a subscription on [rhomobile.com](http://www.rhomobile.com/content/rhopricing.html), you'll need to apply your new plan to your copy of RhoStudio or through the command line. There are two ways to do this using either method, you can either manually sign-in (detailed below) or you can attempt to build an app, which will ask for a valid username and password before it will build the app.

### Signing In With the Command Line
<div class="row-fluid">
	<div class="span7">
		<p>To apply your subscription plan using the command line run the command:</p>
			<pre>$ rake cloud:login</pre>

		<p>This will ask for your username and password, logging you into your rhomobile.com account and downloading the API token to your machine and stored in the <code>~/.rhomobile/token</code> directory on Mac OS and the <code>/Users/&lt;username&gt;/.rhomobile/token</code> directory on Windows.</p>
	</div>
	<div class="span5">
		<img src="https://s3.amazonaws.com/rhodocs/cloud/licensing/cli-login-dialog.png">
	</div>
</div>

### Signing In Through RhoStudio
<!-- Steps -->
<div class="row-fluid">
	<div class="span7">
		<p>To apply your subscription plan using RhoStudio:</p>
		<ul>
			<li>Open the preferences pane (<b>&#8984;,</b> on Mac OS, <b>Ctrl+P</b> on Windows).</li>
			<li>Select <b>RhoMobile -> RhoMobile.com</b> and click the "login to rhomobile.com" button.</li>
			<li>You will be prompted for your username and password.</li>
		</ul>
		<p>Once you enter valid credentials, your API token will be downloaded to your machine and stored in the <code>~/.rhomobile/token</code> directory on Mac OS and the <code>/Users/&lt;username&gt;/.rhomobile/token</code> directory on Windows.</p>
		<p>If you do not have an account when you are going through these steps, you will be able to sign-up by clicking the "signup" link in the login prompt.</p>
	</div>
	<!-- Sign-In Picture -->
	<div class="span5">
		<img src="https://s3.amazonaws.com/rhodocs/cloud/licensing/rs-login-dialog.png">
	</div>
</div>

### Done!
Once you have applied your license you are free to build apps. It's **that** easy!