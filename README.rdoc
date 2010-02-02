= Heroku Docs App

Ultrasimple CMS and content for documentation of the Heroku platform.  The production site is at: http://docs.heroku.com

If you'd like to propose an edit to the Heroku docs, fork this repo, then send us a pull request.

You can also use this as a basis for your own docs CMS.  Please don't use our colorscheme or images (which are not part of this repo).  A fresh checkout will run with a generic black-on-white scheme, which should serve as a good base for you to customize the look and feel.  The notes.png included in this repo is one exception, it was taken from the excellent AsciiDoc [http://www.methods.co.nz/asciidoc/] project.

== Details

Required gems:

* Sinatra
* RDiscount

The app loads content from the docs subdirectory.  Pages are served with a 1 hour cache setting.

== Meta

Written by Ryan Tomayko and Adam Wiggins

Code is released under the MIT License: http://www.opensource.org/licenses/mit-license.php

All rights reserved on the content (text files in the docs subdirectory), although you're welcome to modify these for the purpose of suggesting edits.

http://docs.heroku.com

http://github.com/heroku/heroku-docs


