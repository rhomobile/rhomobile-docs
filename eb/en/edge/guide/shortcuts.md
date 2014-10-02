# Using Shortcuts
<!-- TBD - This guide will tell how the customer how to use shortcuts to launch an application -->

## Windows Mobile/CE
You can setup Windows Mobile shortcut files to launch the Enterprise Browser runtime with different startup options that will override the default settings. You set these parameters in a shortcut (.lnk) file for Windows Mobile/CE; you must create this shortcut file. You can use a text editor such as Notepad on Windows CE, or use the File menu in Platform Builder (New Project or File, Text File type). Edit the file for command line parameters and save it to \Windows\Start Menu (Windows Mobile) and \Windows\Programs (Windows CE). This will put the shortcut at the top level in your Start Menu.

The Enterprise Browser installation path on Windows CE/Mobile devices is `\Program Files\Enterprise Browser` and the path to the executable is `\Program Files\Enterprise Browser\EnterpriseBrowser.exe`.

The shortcut file supports the following command line parameters.

`/C:` specifies the location of the configuration file for the Enterprise Browser application. This will override all default configuration settings. If the full file name contains spaces, surround URL with single or double quotes, e.g.:

        /C:file://\application\config.xml
        /C:'file://\Program Files\application\Config.xml'
        /C:"file://\Program Files\My Application\config.xml"
        
`/S:` specifies the start page of the Enterprise Browser application. Other configuration parameters will be used from the default config.xml file. If the full file name contains spaces, surround URL with single or double quotes, e.g.:

        /S:"file://\HTML\index.html"
        /S:"file://\RE App\index.html"
        /S:"file://\Program Files\MyApp\index.html"
        /S:"http://www.google.com"

If neither the `/S` nor `/C` parameters are specified in the shortcut file, then the default values for the location of the configuration file and the start page of the Enterprise Browser application will be used. 

> Note: URLs that contain query string parameters (?name=value) can not be used within a shortcut on Windows Mobile / CE. This is a limitation on Windows Mobile/CE for creating shortcuts.

The format in the .lnk file is:

	:::xml
	<line-length>#<runtime-exe> <command-line-parameter> <app-folder>

For example, this code in the .lnk file will change the startup page to be a local HTML file.

	:::bash
	70#"\Program Files\Enterprise Browser\EnterpriseBrowser.exe" /S:file://\helloscan.html

## Running Multiple Web Apps
If you have multiple web apps that you would like to point Enterprise Browser to, you can create multiple shortcuts as described above. For example, one startup file could be:

	:::bash
	68#\Program Files\Enterprise Browser\EnterpriseBrowser.exe /S:file://\helloscan.html

And another could be:

	:::bash
	66#\Program Files\Enterprise Browser\EnterpriseBrowser.exe /S:file://\helloscan.html

> Note: The last application will launch using the same runtime container. Only one application will be running at a time. When launching the second application the runtime simply changes the starting URL.