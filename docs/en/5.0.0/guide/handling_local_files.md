# Handing local files

## Overview

A RhoMobile application typically contains two different sets of files - one comprises the code for the application and another contains assets of different types: images, data files, etc.

Files that are only needed for rendering as-is in the [WebView](../api/webview) (such as images or stylesheets) can be placed anywhere within the `public` folder and referenced in your layout or view files as appropriate.

Data files required by the application at runtime must be accessed in two steps:

* obtain the path to the file
* process the information as required

You should always use the `Application.*Folder` properties and `RhoFile.join` to construct file paths because some platforms will not allow you to access files outside of your application bundle. In particular:

* do not hardcode paths such as `/sdcard/*' even if your application only runs on Android
* do not concatenate strings with `\` or `/` characters manually in order to build paths with several components - use [RhoFile.join](../api/File#mjoin) instead


## Reading other files bundled with your application
The [Application API](../api/Application) allows you to find where each part of your application is stored on the filesystem. Together with [RhoFile.join](../api/File#mjoin) this lets you construct paths to all relevant files of your app.

Ruby:

    :::ruby
    # Get the various app folders
    appFolder = Rho::Application.appBundleFolder
    appsBundleFolder = Rho::Application.appsBundleFolder
    databaseBlobFolder = Rho::Application.databaseBlobFolder
    publicFolder = Rho::Application.publicFolder
    userFolder = Rho::Application.userFolder


JavaScript:

    :::javascript
    // Get the various app folders
    var appFolder = Rho.Application.appBundleFolder;
    var appsBundleFolder = Rho.Application.appsBundleFolder;
    var databaseBlobFolder = Rho.Application.databaseBlobFolder;
    var publicFolder = Rho.Application.publicFolder;
    var userFolder = Rho.Application.userFolder;

Each folder stores a particular type of content:

* `appBundleFolder` points to your application's `app` folder
* `appsBundleFolder` is one level up from `app`
* `databaseBlobFolder` is where database blobs are stored (i.e. images and other binary content)
* `publicFolder` is your `public` folder, every file found here (or in a subfolder) can be accessed directly by [WebView](../api/webview)
* `userFolder` is the only folder where you have write permissions. You are free to create or delete as many files as you need inside `userFolder`


Once you know where a file is stored, you can read it with the [RhoFile API](../api/File), which allows you to work with text files from both Ruby and JavaScript (note that binary files are not supported)

Ruby:
    :::ruby
    filename = Rho::RhoFile.join(Rho::Application.publicFolder, 'sample.txt') # build the path
    contents = Rho::RhoFile.read(filename) # read the file into a variable

JavaScript:
    :::javascript
    filename = Rho.RhoFile.join(Rho.Application.publicFolder, 'sample.txt') // build the path
    contents = Rho.RhoFile.read(filename) // read the file into a variable


## Saving files from the network to the device

**NOTE: the only directory you have write rights to is `userFolder` - other folders may work on some platforms but not others; in particular, iOS restricts writing files to any folder other than `userFolder`.**

You can download files from an external server and store them on your device. The [Network API](../api/Network) lets your application download files using the [Network.downloadFile](../api/Network#mdownloadFile) method:

Ruby:

  	:::ruby 
  	def download_file
      #Download a file to the specified filename.
      downloadfileProps = Hash.new
      downloadfileProps["url"]='http://www.google.com/images/icons/product/chrome-48.png'
      downloadfileProps["filename"] = Rho::RhoFile.join(Rho::Application.userFolder, "sample.png")
      downloadfileProps["overwriteFile"] = true
      Rho::Network.downloadFile(downloadfileProps, url_for(:action => :download_file_callback))
  	end
  
  	def download_file_callback
    	if @params["status"] == "ok"
        	Rho::Notification.showPopup({
        		:message => "Download Success. File saved to " + Rho::RhoFile.join(Rho::Application.userFolder, "sample.png"),
        		:buttons => ["OK"]
      		})
    	else
        	Rho::Notification.showPopup({
        		:message => "Download Failed",
        		:buttons => ["OK"]
      		})
    	end
  	end

JavaScript:
	
  	:::javascript
  	function download_file_callback(params) {
    	if (params["status"] == "ok") {
  			alert("Download Succeeded. File saved to "+Rho.RhoFile.join(Rho.Application.userFolder, "sample.png"));
  		} else {
  			alert("Download Failed");
  		}
    }

    function download_file() {
      	// Download a file to the specified filename. Be careful with the overwriteFile parameter!
      	downloadfileProps = {
        	url: "http://www.google.com/images/icons/product/chrome-48.png",
        	filename: Rho.RhoFile.join(Rho.Application.userFolder, "sample.png"),
        	overwriteFile: true
      	};
      	Rho.Network.downloadFile(downloadfileProps, download_file_callback);
    }

## Exporting the database for backup purposes

The [Database API](../api/Database) allows your application to export the contents of the current database to a zip archive which you can then upload to a server, copy to a memory card or otherwise make available for the user to backup.

Ruby:

    :::ruby
    # open default database
    db = Rho::Database.new(Rho::Application.databaseFilePath("user"),"user")
    # export database
    export_path = db.export
    db.close
    Rho::Notification.showPopup({
      :message => "Export path - #{export_path}",
      :buttons => ["OK"]
    })


JavaScript:

    :::javascript
    // open default database
    var db = new Rho.Database(Rho.Application.databaseFilePath('user'), 'user');
    // export database
    var db = open_db();
    var export_path = db.export();
    db.close();
    alert("Export path - " + export_path);



## Zipping and unzipping files

RhoMobile has built-in support for zip archives. The [System API](../api/System) helps your application to zip or unzip any files. Make sure to observe the restriction that you should not be writing outside `Application.userFolder`.

Ruby:

    :::ruby
    # zip list of files
    local_path_to_zip = Rho::RhoFile.join(Rho::Application.userFolder, "sample.zip")
    local_path_to_file = Rho::RhoFile.join(Rho::Application.publicFolder, "sample.txt")
    Rho::System.zipFile(local_path_to_zip, local_path_to_file)
    
    # unzip a file 
    local_path_to_zip = Rho::RhoFile.join(Rho::Application.userFolder, "sample.zip")
    Rho::System.unzipFile(local_path_to_zip)


JavaScript:

    :::javascript
    // zip list of files
    var local_path_to_zip = Rho.RhoFile.join(Rho.Application.userFolder, "sample.zip");
    var local_path_to_file = Rho.RhoFile.join(Rho.Application.publicFolder, "sample.txt");
    Rho.System.zipFile(local_path_to_zip, local_path_to_file);
    
    // unzip a file 
    var local_path_to_zip = Rho.RhoFile.join(Rho.Application.userFolder, "sample.zip");
    Rho.System.unzipFile(local_path_to_zip);




