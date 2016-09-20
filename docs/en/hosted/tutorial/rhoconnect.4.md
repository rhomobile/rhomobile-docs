# RhoConnect Tutorial
## RhoConnect Apps in the Cloud
One option to think about when making your RhoConnect app, creating your app in the cloud on [rms.rhomobile.com](https://rms.rhomobile.com/). The benefit of this is not having to worry about hosting your app yourself and it is a free service (up to a certain amount of usage) provided by RhoMobile.

What you'll need to do to get cloud hosted RhoConnect setup is:

1. Create your RC app repo in the cloud.
2. Create your RC app locally.
3. Initialize and add the remote repo to your local repo.

## Create Your RC App in the Cloud
To create your app in the cloud on rms.rhomobile.com you'll first need to [create a rhomobile.com account](http://rhomobile.com/rhopricing.html). If you already have an account, [simply sign in](https://rms.rhomobile.com/).

Once you have signed up or signed in, all you need to do is create your app by clicking the big green "Create App" button. When you do, it will ask you what kind of app you are making and to give it a name. Click "RhoConnect" and choose a name for it. For this tutorial I'll be using "my_rc_app" as the name for my RhoConnect app.

[!img](https://s3.amazonaws.com/rhodocs/rhoconnect-tutorial/rhoconnect-remote-create-app.png)

Once you click the "create" button, you'll be brought to a page that has all the info you'll need for your RhoConnect app including the Git URL which we will need in order to associate your local RC app to your remote RC app (Step 3).

With this done, let's go to step 2.

## Create Your RC App Locally.
We have already gone over this in this tutorial so I'll cover it quickly here. To create your RC app locally:

* Create your app using the `rhoconnect app <appname>` command.
* Change into the directory and edit the settings to fit your needs.
* Add any source adapters you'll need for synchronization.

Exactly as we did earlier in this tutorial.

## Connect Your Remote Repo and Your Local Repo
To connect your local repo to your RC app repo in the cloud, follow these steps.

From inside your RC app directory

1. Initialize your RC app as a git repo using the `git init` command.
2. Add the remote end-point to your local repo using the command `git remote add origin <Git URL>`. This is the Git URL that we saw earlier on rms.rhomobile.com.
3. Install all the necessary gems for your app using the command `bundle install`.
4. Self-contain your app and keep all the gems you need contained in it by using the `bundle package` command.
5. Add all the code in your app using the `git add .` command. What this does is tells git which files are to be included in the next commit (next step).
6. Commit your code using the following command `git commit -m 'Initial Commit'`.

> Note: Whenever you commit changes to your repo, you should add a message using the -m option so that you can tell yourself or others on your project what was done in the commit. This is not necessarily required but is a good practice to get into the habit of.

7. Lastly, push your code up to your remote repo with `git push -u origin master`.

> Note: The -u command sets the remote repo as the default remote for pushes so that in the future you only need to type `git push` instead of `git push origin master`. You may omit it if you wish.

Now that you have associated the remote repo with your local repo, you are ready to deploy your RC app in the cloud.

## Deploy Your RC App in the Cloud
Back over at rms.rhomobile.com, on the page concerning your RC app you should see a green "deploy" button. Simply click this button to deploy your app and make it live by clicking the "".

[!img](https://s3.amazonaws.com/rhodocs/rhoconnect-tutorial/rhoconnect-remote-deploy-and-make-live.png)

At this point you simply need to apply this as the sync server in your client-side app in your rhoconfig.txt file as we did earlier in this tutorial. After doing this, you're ready to sync just as you did before but now your app is hosted for you in the cloud.