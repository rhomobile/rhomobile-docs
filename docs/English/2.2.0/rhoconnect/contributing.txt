Contributing to RhoConnect
===
Want to add features to RhoConnect?  Found a bug that you want report or fix?  Please follow the steps below to help with the RhoConnect project.  Thanks to developers like you, RhoConnect continues to be the best and fastest open-source mobile sync server!

## Report RhoConnect Issues
Please first report bugs/features/enhancements to the [google group](http://groups.google.com/group/rhomobile).  Someone may already be working on the issue!

## Run RhoConnect Specs
First run the rhoconnect specs to make sure your environment is up-to-date for development:

1. [Fork](http://help.github.com/forking/) the [RhoConnect repository](http://github.com/rhomobile/rhoconnect).

2. Clone your new repo: 
		
		$ git clone git://github.com/<yourhandle>/rhoconnect.git
		$ cd rhoconnect

3. Install [Bundler](http://gembundler.com/):
		
		$ [sudo] gem install bundler

4. Install all of the required gems. If any of the needed gems are already installed, Bundler will use them:
		
		$ [sudo] bundle install

5. Install [hsqldata](http://github.com/rhomobile/hsqldata):
		
		$ git clone git://github.com/rhomobile/hsqldata.git
		$ cd hsqldata
		$ ant
		$ mkdir -p <path-to-rhoconnect>/vendor/
		$ cp bin/hsqldata.jar <path-to-rhoconnect>/vendor/

6. Run the RhoConnect specs:

 		$ rake   #=> runs all rhoconnect specs by default


If everything passes (pending specs are OK), then your environment is ready for development.  If you have trouble installing a particular gem or the specs just won't run properly, please feel free to ping the [rhomobile google group](mailto:rhomobile@googlegroups.com) or [hop on IRC](http://webchat.freenode.net/?channels=rhomobile) to chat with other RhoConnect developers.

## Contributing your Patch
Now that you're environment is ready, make your changes!

1. Create a topic branch:
		
		$ git checkout -b cool_new_feature

2. Write tests ([example](http://github.com/rhomobile/rhoconnect/commit/f95cfdbf3f53d64c3957499906c77d7127b7c3db#diff-2))

3. Make changes...

4. Add relevant documentation(RDoc, update the README if relevant)

5. Push to your branch:
		
		$ git push origin cool_new_feature

6. Send a note to the [google group](http://groups.google.com/group/rhomobile)

That's it!  Please follow [these ruby style guidelines](http://github.com/chneukirchen/styleguide/blob/master/RUBY-STYLE) when coding.