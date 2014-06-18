Remote Build Tutorial
=====================

## Introduction
This tutorial shows you how to build a simple product inventory application that allows users to create, retrieve and edit local data without requiring a connection to the Internet.

## Support Matrix
The following is a table showing the versions of Rhodes that are supported for which platforms concerning cloud builds. Note that the end of life date is simply an estimate and will not necessarily be exact to the day.

<table class="table table-condensed table-striped">
  <thead>
    <tr>
      <th style="width:10%;text-align:left;border-right:thin solid #cccccc">Rhodes Version</th>
      <th style="width:20%;text-align:center;border-right:thin solid #cccccc">Estimated End of Life</th>
      <th colspan="6 "style="text-align:center">Platforms</th>
    </tr>

    <tr>
      <th style="width:20%;text-align:center;" colspan="2"></th>
      <th style="text-align:center"><img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile"></th>
      <th style="text-align:center"><img src="/img/windows.jpg"       style="height: 20px;padding-top: 8px" rel="tooltip" title="Win 32 Desktop" style="height: 30px"></th>
      <th style="text-align:center"><img src="/img/wince.png"         style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows CE" style="height: 30px"></th>
      <th style="text-align:center"><img src="/img/wp8.png"           style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Phone 8, Windows Embedded 8"></th>
      <th style="text-align:center"><img src="/img/android.png"       style="height: 20px;padding-top: 8px" rel="tooltip" title="Android"></th>
      <th style="text-align:center"><img src="/img/ios.png"           style="height: 20px;padding-top: 8px" rel="tooltip" title="iOS"></th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td><a href="/en/2.2.0/rhodes/introduction">3.4.2.1</a></td>
      <td style="width:20%;text-align:center;">June 31, 2014</th>
      <td style="text-align:center"><span class="icon-shopping-cart icon-primary" rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center"><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center"><span class="icon-remove icon-warning"></span></td>
      <td style="text-align:center"><span class="icon-remove icon-warning"></span></td>
      <td style="text-align:center"><span class="icon-remove icon-warning"></span></td>
      <td style="text-align:center"><span class="icon-remove icon-warning"></span></td>
    </tr>

    <tr>
      <td><a href="/en/2.2.0/rhodes/introduction">3.5.1.14</a></td>
      <td style="width:20%;text-align:center;">July 7, 2014</th>
      <td style="text-align:center"><span class="icon-shopping-cart icon-primary" rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center"><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center"><span class="icon-remove icon-warning"></span></td>
      <td style="text-align:center"><span class="icon-remove icon-warning"></span></td>
      <td style="text-align:center"><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center"><span class="icon-check icon-primary"></span></td>
    </tr>

    <tr>
      <td><a href="/en/4.0.0/guide/welcome">4.0.9</a></td>
      <td style="width:20%;text-align:center;">Q1 - Q2 2015</th>
      <td style="text-align:center"><span class="icon-shopping-cart icon-primary" rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center"><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center"><span class="icon-remove icon-warning"></span></td>
      <td style="text-align:center"><span class="icon-remove icon-warning"></span></td>
      <td style="text-align:center"><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center"><span class="icon-check icon-primary"></span></td>
    </tr>

    <tr>
      <td><a href="/en/4.1.0/guide/welcome">4.1.6</a></td>
      <td style="width:20%;text-align:center;">Q3 - Q4, 2015</th>
      <td style="text-align:center"><span class="icon-shopping-cart icon-primary" rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center"><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center"><span class="icon-remove icon-warning"></span></td>
      <td style="text-align:center"><span class="icon-remove icon-warning"></span></td>
      <td style="text-align:center"><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center"><span class="icon-check icon-primary"></span></td>
    </tr>

    <tr>
      <td><a href="/en/4.1.0/guide/welcome">4.2.x</a></td>
      <td style="width:20%;text-align:center;">Q1 - Q2, 2016</th>
      <td style="text-align:center"><span class="icon-shopping-cart icon-primary" rel="tooltip" title="Requires License"></span></td>
      <td style="text-align:center"><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center"><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center"><span class="icon-remove icon-warning"></span></td>
      <td style="text-align:center"><span class="icon-check icon-primary"></span></td>
      <td style="text-align:center"><span class="icon-check icon-primary"></span></td>
    </tr>
  </tbody>
</table>

NOTE: Dates for estimated End of Life are subject to change as release dates of next versions change.

## Setup
Before building remotely, you'll need to sign up for a [subscription plan](http://www.rhomobile.com/pricing.html) of either silver or gold; only paid subscription plans allow the use of the remote build feature. Refer to the [licensing](../../edge/guide/licensing) doc for assistance on signing up and applying your remote build token.

## Generating an App
Using RhoMobile's product suite, apps can be built using either the command line interface, or with our eclipse based IDE, RhoStudio. All steps will be shown using both methods.

### App structure
RhoMobile makes the entire app creation process extremely quick by auto-generating common files for you so that you can get into coding your specific app as soon as possible. During either of these processes you'll see the framework create all the necessary files.

#### Generate Using CLI
To generate the app's structure using the command line, simply run the following command:

		:::term
		$ rhodes app <appanme>

#### Generate in RhoStudio
To generate the app's structure using RhoStudio, follow these steps:

1. Select new app creation File > New > Project.
2. Select RhoMobile Application and click Next.
3. Type in a name for your app, choose whether or not to make a RhoElements app, and click Finish.

At this point, you can actually build the app for the platform of your choice and you'll have a fully functioning, bare-bones app. It currently does nothing but you have created the structure of a running app in just about a minute, with no coding necessary on your part. but how do we get this app to build in the cloud?

## Remotely Building Your App


