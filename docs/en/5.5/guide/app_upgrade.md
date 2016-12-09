# Upgrading a RhoMobile Application

RhoMobile supports application upgrades for iPhone (non AppStore distribution), Android, and Windows Mobile. You can do a total upgrade or partial upgrade.

## Total Upgrade

You can replace the total application bundle with a new bundle packed in an update bundle archive file.

### Prepare Total Application Package

To prepare the upgrade package for iPhone, run this command in your application folder:

	:::term
    $ rake build:iphone:upgrade_package

The application package will be placed in `<app_root>/bin/target/iphone`.

To prepare the upgrade package for Android, run this command in your application folder:

	:::term
    $ rake build:android:upgrade_package
    
The application package will be placed in `<app_root>/bin/target/android`.

To prepare the upgrade package for Windows Mobile, run this command in your application folder:

	:::term
    $ rake build:wm:upgrade_package
    
The application package will be placed in `<app_root>/bin/target/wmp6`.

### Download Bundle Package and Replace Application Current Bundle

Download package:
    :::ruby
    if !::Rho::RhoSupport.rhobundle_download(url_to_package, url_for(:action => :httpdownload_callback))
        render :action =>:error    
    else
        render :action => :wait_download, :back => '/app'
    end    

Unzip and replace package:
    :::ruby
    if System.unzip_file(::Rho::RhoSupport.rhobundle_getfilename())==0
        System.replace_current_bundle( File.dirname(::Rho::RhoSupport.rhobundle_getfilename()) )
        render :action => :wait_replace, :back => '/app'
    else
        WebView.navigate url_for :action => :error    
    end

The application will restart automatically.

NOTE: On iPhone and Android, the application has to be started manually.

NOTE: When using Rho::RhoSupport.rhobundle_download method on a network that has proxies, you may need to configure a proxy exception on the device, if your  HTTP server is also on that same network. Example: local network has an IP subnet of 192.168 and it uses a proxy. On the Windows Mobile device, go into System >> Settings >> Connections >> Advanced and add 192.168.* to the proxy exception list. 

NOTE: The URL parameter for rhobundle_download must be a HTTP URL - FTP is not supported.

## Partial Upgrade

You can add new files or replace old files with new ones and create an updated bundle packed in an update bundle archive file.

### Prepare Partial Application Package

To add new files or replace old files with new ones in your current application's bundle content, make a list of the files in a file named `upgrade_package_add_files.txt`. Here is an example of upgrade_package_add_files.txt.

	app/index.erb
	app/Bundle/controller.rb
	app/Bundle/error.erb

In the same way, you can also remove files with an `upgrade_package_remove_files.txt` file. Here is an example of upgrade_package_remove_files.txt.

	app/Bundle/wait.erb
	app/Model2

Execute the rake commands in your application folder to perform the partial upgrade.

To prepare partial upgrade package for iPhone run in application folder:

	:::term
	$ rake build:iphone:upgrade_package_partial

Application package will be placed to /bin/target/iphone

To prepare partial upgrade package for Android run in application folder:

	:::term
	$ rake build:android:upgrade_package_partial

Application package will be placed to /bin/target/android

To prepare partial upgrade package for Windows Mobile run in application folder:

	:::term
	$ rake build:wm:upgrade_package_partial

Application package will be placed to /bin/target/wmp6.

### Download Bundle Package and Replace Application Current Bundle

You then unzip, upload and replace the application package. 

Download package:
    :::ruby
    if !::Rho::RhoSupport.rhobundle_download(url_to_package, url_for(:action => :httpdownload_callback))
        render :action =>:error    
    else
        render :action => :wait_download, :back => '/app'
    end   

Upload and Replace Package:
	:::ruby
	if System.unzip_file(::Rho::RhoSupport.rhobundle_getfilename())==0
	   System.replace_current_bundle( File.dirname(::Rho::RhoSupport.rhobundle_getfilename()),  { :callback => url_for(:action => :update_finished_callback), :do_not_restart_app => true } )
	   render :action => :wait_replace, :back => '/app'
	else
	   WebView.navigate url_for :action => :error    
	end

With the System.replace_current_bundle method, you can supply a params hash with the following options.

`:callback` - url with callback. Called when upgrade bundle procedure is finished.
`:do_not_restart_app` - bool, if true your application will not automatically restart after the procedure is finished.

One of the callback parameters should be `status`: `"ok"` or `"error"`.

NOTE: Use :do_not_restart_app very carefully. You can disable the restart of your application after a bundle update only if you change only images, JavaScript, and other similar types of files, but if you change files such as Ruby code, models, etc. In general, we recommend you do not use this parameter if you do not understand how your application works on your particular platform. Restarting your application after an update is safe.

## Sample Upgrade Bundle Package

See [Reload bundle demo](http://github.com/rhomobile/ReloadBundleDemo) for more information.
