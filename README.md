Rhomobile Documentation Project
==================

This is a simple CMS and documentation for the Rhomobile platform: [http://docs.rhomobile.com](http://docs.rhomobile.com)

Edge changes to this repository are tracked realtime on [http://edgedocs.rhomobile.com](http://edgedocs.rhomobile.com)

If you'd like to propose an edit to the Rhomobile docs, fork this repo, then send us a pull request.

This tool is based off the excellent [heroku-docs project!](https://github.com/heroku/heroku-docs)

Setup
-----
* On Windows? [Install](https://github.com/oneclick/rubyinstaller/wiki/Development-Kit) the [Development Kit](http://rubyinstaller.org/downloads/). Then run:

		$ gem install rdiscount --platform=ruby -v=1.6.8

* Run the following commands:

		# install prereqs and shotgun the docs server
		$ cd rhomobile-docs
		$ sudo gem install bundler (if you don't have it already)
		$ bundle install
		$ rake start #=> this will start the server and load the docs home page in your browser
	
Rebuilding & Publishing
-----------------------
This app loads content from sub-directories located in config.yml.  


This will copy all content from the sub-directories into docs/.  Then push to heroku:

	$ git add docs/
	$ git commit -m "adding new docs"
	$ git push heroku master

The app loads content from the docs subdirectory.  Pages are served with a 1 hour cache setting.

**NOTE: Do NOT checkin changes to docs/(subdirectory) (i.e. docs/rhodes/).  The content in docs/(subdirectory) are managed by the separate repositories.  For example, content in docs/rhodes/ is maintained in the rhodes repo [https://github.com/rhomobile/rhodes](https://github.com/rhomobile/rhodes).**

About
----

Originally written by Ryan Tomayko and Adam Wiggins.  This application is maintained by Rhomobile Dev.

Code is released under the [MIT License](http://www.opensource.org/licenses/mit-license.php)

All rights reserved on the content (text files in the docs subdirectory), although you're welcome to modify these for the purpose of suggesting edits.