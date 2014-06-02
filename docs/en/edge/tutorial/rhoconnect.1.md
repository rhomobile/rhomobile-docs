#Rhoconnect Tutorial

Currently there are two different types of RhoConnect apps that can be generated, Ruby and JavaScript:

<div>
  <ul class="nav nav-tabs" style="margin-bottom:0">
    <li class="active"><a href="#js_app_gen" data-toggle="tab">JavaScript</a></li>
    <li><a href="#ruby_app_gen" data-toggle="tab">Ruby</a></li>
  </ul>
</div>
<div class="tab-content" id="tc-app_gen" style="border-left: 1px solid #ddd; border-right: 1px solid #ddd; border-bottom: 1px solid #ddd; padding: 10px">
  <div class="tab-pane fade active in" id="js_app_gen">
    <p>Generating a JavaScript RhoConnect app. Change `app_name` to what you would like to call your application.</p>
    <pre><code class="term">$ rhoconnect app app_name --js</code></pre>
  </div>
  <div class="tab-pane fade" id="ruby_app_gen">
    <p>Generating a Ruby RhoConnect app. Change `app_name` to what you would like to call your application.</p>
    <pre><code class="term">$ rhoconnect app app_name</code></pre>
  </div>
</div>


Ruby RhoConnect apps can also be generated using RhoStudio. To use this method, see [Generating a RhoConnect app with RhoStudio](../../rhoconnect/command-line#generating-a-rhoconnect-app-with-rhostudio)

After code generation, the bundle install command will be run for the first time automatically.

NOTE: It is required to have a connection to the internet to create an application. There are certain Ruby gems that RhoConnect is dependent on.

## Starting Your RhoConnect App

Once you have generated your app code, you'll need to start your redis server and the RhoConnect app in order to ensure that everything is working properly. 

<div>
  <ul class="nav nav-tabs" style="margin-bottom:0">
    <li class="active"><a href="#mac_rc_start" data-toggle="tab">Mac</a></li>
    <li><a href="#win_rc_start" data-toggle="tab">Windows</a></li>
  </ul>
</div>
<div class="tab-content" id="tc-app_gen" style="border-left: 1px solid #ddd; border-right: 1px solid #ddd; border-bottom: 1px solid #ddd; padding: 10px">
  <div class="tab-pane fade active in" id="mac_rc_start">
    <p>Before starting your RhoConnect app on your Mac you’ll first need to install Dtach</p>
    <pre>
      <code class="term">$ rhoconnect dtach-install</code>
    </pre>
    <p>Once Dtach is installed, any app on your machine that runs in the terminal (if started with Dtach) will be able to be detached from the current terminal activity and be put into the background. In our case, redis and the RhoConnect service itself run using Dtach which lets us run them all in the same terminal window</p>
    <p>Starting RhoConnect is a two-step command process: Start redis, then start the RhoConnect app. Both commands must be run from within the RhoConnect app's directory.</p>
    <pre>
      <code class="term">$ rhoconnect redis-start</code>
    </pre>
    <pre>
      <code class="term">$ rhoconnect start</code>
    </pre>
  </div>
  <div class="tab-pane fade" id="win_rc_start">
    <p>On Windows there is no need to start the redis server because starting RhoConnect will start the redis server automatically.</p>
    <pre>
      <code class="term">C:\rc_app>rhoconnect start</code>
    </pre>
  </div>
</div>

If all went well, you should see:

    :::term
    Listening on 0.0.0.0:9292, CTRL+C to stop

This means that your RhoConnect app is up and running on localhost:9292. If you go to this address in your browser you will see the RhoConnect Console, pictured below.

<img src="https://s3.amazonaws.com/rhodocs/rhoconnect-tutorial/rhoconnect-console-4.0.png">

