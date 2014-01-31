# EmberJS Tutorial

Let's get started by resetting our environment to the starting point of our project. As you go through the steps in this tutorial you will easily be able to reset your environment by typing in a special git command that will change the file contents to be equal to what the code should look like when you are done with this step. You will also be able to easily see the differences between each step that was made.

1) In your `rhotut-emberjs` directory, type the following command:

    git checkout -f step-0

2) Now take the `index.html` file that is found in the `public` folder and drag it into your browser


Not very exciting, but if you type in the input box you will see the Hello message change automatically. 
![](https://s3.amazonaws.com/rhodocs-images/rhotut-emberjs/Screen+Shot+2013-11-18+at+10.35.12+AM.jpg)

## The HTML
Let's explain what is going on here by first taking a look at `index.html`

    :::js
    <!DOCTYPE html>
    <html>
    <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
    <title>RhoMobile Ember</title>
      <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
      <link href="css/font-awesome.min.css" rel="stylesheet">
     
    </head>
    <body>
    <script type="text/x-handlebars" >
    <H1>RhoTut Ember JS Example</H1>
    <p>{{input type="text" value=username}}</p>  
    <p>Hello, {{username}}</p>  
    </script>




    <script src="js/libs/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="js/libs/bootstrap.min.js"></script>
    <script src="js/libs/handlebars-1.0.0.js"></script>
    <script src="js/libs/ember-1.0.0.js"></script>
    <script src="js/libs/ember-data.js"></script>
    <script src="js/app.js"></script>


    </body>
    </html>

## The JavaScript
Since this is a JavaScript based application let's first take a look at the JavaScript Files we are referencing.

To use EmberJS, we will be including the following libraries. 
    :::js
    <script src="js/libs/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="js/libs/handlebars-1.0.0.js"></script>
    <script src="js/libs/ember-1.0.0.js"></script>
    <script src="js/libs/ember-data.js"></script>

* jquery - is being used by Ember and our app for DOM access
* handlebars - is required by Ember JS as it's templating engine
* ember - is the core Ember JS library
* ember-data - is being will be used for our data models and to tie in with Rhom (this is actually not required at this stage and will be explained later) 

Bootstrap is not required but is just being used for layout control and styling
    :::js
    <script src="js/libs/bootstrap.min.js"></script>

Then we will be using a file to hold some of our application specific code
    :::js
    <script src="js/app.js"></script>

And inside of `app.js` we see one very simple line of code.
    :::js
    App = Ember.Application.create();

## The CSS
We have included two styling libraries that we will be using to make this app a bit more appealing. These are non-impactful to this tutorial and you could have easily chosen to use your own CSS or styling libraries

    :::js
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="css/font-awesome.min.css" rel="stylesheet">

## The App
There is much more to an Ember application then what we have produced so far but let's explain the first fundamental thing going on here:

    :::js
    <script type="text/x-handlebars" >
    <H1>RhoTut Ember JS Example</H1>
    <p>{{input type="text" value=username}}</p>  
    <p>Hello, {{username}}</p>  
    </script>

The `<script type="text/x-handlebars" >` tag indicates to the browser that the following lines of code are a Handlebars Template. This is regular HTML with the special curly bracket `{{ }}` notation which represents [Handlebars.js](http://handlebarsjs.com/). Handlebars will replace the content of the curly brackets with real HTML when the browser renders the page. Ember JS recognizes this and attaches special handling as well to these controls. In the simple example above it performs data binding of the inputs value to text that is displayed in the `<p>` tag. So when you type in the input box, it will automatically update the `username` variable text. This is all handled for you without writing a line of JavaScript.

## Chrome Ember Inspector
Ember has built a Chrome Inspector, which is very useful tool for debugging and inspecting your Ember application components. It is highly recommended that you install it. Simple visit [the Chrome Web Store](https://chrome.google.com/webstore/category/apps) and search for [Ember JS](https://chrome.google.com/webstore/detail/ember-inspector/bmdblncegkenkacieihfhpjfppoconhi)

![](https://s3.amazonaws.com/rhodocs-images/rhotut-emberjs/Screen+Shot+2013-11-18+at+10.50.58+AM.jpg)

Then since we are viewing files locally you will need to change the permissions of Chrome for the Ember JS inspector by first:

chrome://extensions/

And then enabling the ` Allow access to file URLs` setting.

![](https://s3.amazonaws.com/rhodocs-images/rhotut-emberjs/Screen+Shot+2013-11-18+at+10.56.27+AM.jpg)

You will then be able to use this tab to inspect the Ember app as we go through the tutorial.
![](https://s3.amazonaws.com/rhodocs-images/rhotut-emberjs/Screen+Shot+2013-11-18+at+10.59.24+AM.jpg)

## Summary
So far we just introduced a simple Ember JS application and started to provide the framework for the rest of the application. In the next section of the tutorial we will introduce other Ember JS concepts like models, routing and views. 

Click the Next button below to go to the next step.