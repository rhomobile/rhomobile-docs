# Folder Structure

* language - 'en'
* version - will be the Enterprise Browser version number

Under Language / version 
* api - will hold XML for the API reference. This will contain copies of the XML from the Rho docs/version folder that is used. This XMl will be used to convert to HTML for the export folder
* guide - hand written developer guides in MD format. These will be used to convert to HTMl to the export folder
* export - Will contain folders that contain the converted HTML files

Under export
* launchpad - will contain html files to be used to import into Launchpad
* offline - will contain HTMl files/folder structure used for offline CHM help generation

## API Reference docs template

* Overview H2
	* Summary Text
* Methods H2
	* Name H3
		* Usage H4
		* Description H4
		* Parameters H4
		* Callback H4 
		* Return H4
		* Access H4
		* Platforms H4
		* Version H4
* Properties H2
	* Name H3
		* Description H4
		* Values H4
		* Access H4
		* Platforms H4
		* Version H4
* Constants H2
	* Name H3
		* Description H4
* Examples H2
	* Title H3
	* Description
* Remarks H2
	* Title H3
	* Description	




