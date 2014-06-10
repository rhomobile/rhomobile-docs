
#ODAX Preexisting JavaScript Object

<b>
The ODAX Preexisting JavaScript Object contains read methods to provide offline data access. ODAX uses either a CSV or XML file on the device to provide rudimentary offline capabilities and should only be used to provide backward compatibility with legacy applications. RhoElements supports Application cache and Web SQL implementations which should be used in preference to ODAX in new applications. If you have configured 'PreloadLegacyODAX' to be '1' the JavaScript object 'odax' will be inserted automatically into your page's DOM by RhoElements. The result set is stored internally in the 'odax' object and is created and manipulated using the exposed methods below
</b>

##Syntax

<table class="re-table"><tr><th class="tableHeading">ODAX (Preexisting JavaScript Object) &lt;META&gt; Syntax
</th></tr><tr><td class="clsSyntaxCells clsOddRow"><p>odax.Select('SELECT * FROM \'\\application\\test.xml\';', ',', false);</p></td></tr></table>




##Methods

<table class="re-table"><col width="40%" /><col width="40%" /><col width="20%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Parameters</th><th class="tableHeading">Returns</th></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>Clear<br /></b>Clears the result set.</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow" /><td style="text-align:left;" valign="top" class="clsSyntaxCells clsOddRow" /></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>Copy<br /></b>Copies the specified source filename to the destination filename.</td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>Name: </b>Source, 
<b>Values: </b>String<br /><b>Description: </b>Full path of the source file name that is to be copied.<P /><b>Name: </b>Destination, 
<b>Values: </b>String<br /><b>Description: </b>Full path of the destination file name.<P /></td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;" valign="top">0 if no error is received.  If an error occurs the value from Windows API call GetLastError() is returned, if appropriate.</td></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>Delete<br /></b>Deletes the specified file.</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>Name: </b>FileName, 
<b>Values: </b>String<br /><b>Description: </b>Full path of the file name that is to be deleted.<P /></td><td style="text-align:left;" valign="top" class="clsSyntaxCells clsOddRow">0 if no error is received.  If an error occurs the value from Windows API call GetLastError() is returned, if appropriate.</td></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>FileExists<br /></b>Checks to see whether the specified file exists.</td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>Name: </b>FileName, 
<b>Values: </b>String<br /><b>Description: </b>Full path of the file name that is to be checked.<P /></td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;" valign="top">True if the specified file exists, else False if it does not.</td></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>Execute<br /></b>performs INSERT, UPDATE and DELETE statements on the specified file.  The file can be either XML or CSV.</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>Name: </b>SQL Statement, 
<b>Values: </b>String<br /><b>Description: </b>String representing the INSERT, UPDATE and DELETE SQL statement to be executed.<P /><b>Name: </b>Format, 
<b>Values: </b>0 or 1<br /><b>Description: </b> If no extension is supplied the format parameter is used to determine file format (0 = XML, 1 = CSV).<P /><b>Name: </b>Delimiter, 
<b>Values: </b>Character<br /><b>Description: </b>Delimiter which is used in CSV files as a column separator. Even though there is no special use for this in XML files you cannot leave this blank, hence you need to provide a valid value.<P /><b>Name: </b>First Row, 
<b>Values: </b>'True' or 'False'<br /><b>Description: </b>This denotes that the first row of a CSV file contain the Column Names. If set to false in CSV mode it will retrieve columns as column1, column2 etc.<P /></td><td style="text-align:left;" valign="top" class="clsSyntaxCells clsOddRow">The count of records affected by the operation or 0 if no records were affected.</td></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>Get<br /></b>Retrieves the column value specified, from the current result set.  There must a valid result set in order to successfully execute this command, otherwise the operation will result in an error. In a CSV file, if the firstrow is set to true then strFieldName should have the field name else if firstrow is set to false then Column1 ... ColumnN literals should be used to retrieve the appropriate filed values.</td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>Name: </b>Field Name, 
<b>Values: </b>String<br /><b>Description: </b>Field Name to be retrieved.<P /></td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;" valign="top">The value from the specified field in the current result set record or a negative value if an error occurs.</td></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>GetLastErrorString<br /></b>Returns a string containing an error message relating to the last error that occurred.</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow" /><td style="text-align:left;" valign="top" class="clsSyntaxCells clsOddRow">String containing the last error message.</td></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>Move<br /></b>Moves the specified source filename to the destination filename.</td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>Name: </b>Source, 
<b>Values: </b>String<br /><b>Description: </b>Full path of the source file name that is to be moved.<P /><b>Name: </b>Destination, 
<b>Values: </b>String<br /><b>Description: </b>Full file name and path where the file will be moved to.<P /></td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;" valign="top">0 if no error occurs or an error code (see GetLastErrorString).</td></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>MoveFirst<br /></b>Moves the row pointer to the first record of the result set.  There must a valid result set in order to successfully execute this command, otherwise the operation will result in an error.</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow" /><td style="text-align:left;" valign="top" class="clsSyntaxCells clsOddRow">0 if no error occurs or an error code (see GetLastErrorString).</td></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>MoveLast<br /></b>Moves the row pointer to the last record of the result set.  There must a valid result set in order to successfully execute this command, otherwise the operation will result in an error.</td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;" /><td class="clsSyntaxCells clsEvenRow" style="text-align:left;" valign="top">0 if no error occurs or an error code (see GetLastErrorString).</td></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>MoveNext<br /></b>Moves the row pointer to the next record of the result set.  There must a valid result set in order to successfully execute this command, otherwise the operation will result in an error.</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow" /><td style="text-align:left;" valign="top" class="clsSyntaxCells clsOddRow">0 if no error occurs or an error code (see GetLastErrorString).</td></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>MovePrev<br /></b>Moves the row pointer to the previous record of the result set.  There must a valid result set in order to successfully execute this command, otherwise the operation will result in an error.</td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;" /><td class="clsSyntaxCells clsEvenRow" style="text-align:left;" valign="top">0 if no error occurs or an error code (see GetLastErrorString).</td></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>Select<br /></b>Queries XML or CSV based database files.  This method performs the SQL SELECT statement on the specified file and populates the object's result set.</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>Name: </b>SQL Statement, 
<b>Values: </b>String<br /><b>Description: </b>String representing the SELECT SQL statement to be executed.<P /><b>Name: </b>Delimiter, 
<b>Values: </b>Character<br /><b>Description: </b>Delimiter which is used in CSV files as a column separator. Even though there is no special use for this in XML files you cannot leave this blank, hence you need to provide a valid value.<P /><b>Name: </b>First Row, 
<b>Values: </b>'True' or 'False'<br /><b>Description: </b>This denotes that the first row of a CSV file contain the Column Names. If set to false in CSV mode it will retrieve columns as column1, column2 etc.<P /></td><td style="text-align:left;" valign="top" class="clsSyntaxCells clsOddRow">The number of records in the result set or a negative number to indicate an error (see GetLastErrorString).</td></tr></table>




##Remarks


###Good Practise
It's good practice to check if the file exists before copying it. To do this use FileExists() method. This will support any file extension and will work as per normal file copy command. If file already exists with the same name in the destination folder/path it would be overwritten.


###First Row
The delimiter and firstrow are a Select. If firstrow is set to true when creating a table with INSERT, then the field names are written to the first row as column names.


###Query needed after Execute
The current result set becomes invalid after any Execute (INSERT, UPDATE, DELETE) and arbitrary values will be returned by MoveFirst etc. A new SELECT query must be performed to get valid results.


###Backwards Compatibility
The ODAX Preexisting JavaScript Object provides backwards compatibility with code written for PocketBrowser and also supports the syntax below. Because RhoElements inserts the object 'odax' on the page automatically when 'PreloadLegacyODAX' is configured to be '1' you can not create your own objects by this name, see below:

<pre>

&lt;script&gt;
  //  Old PocketBrowser syntax supported by ODAX
  var myObj = new ActiveXObject("CeODAX.ODAX"); 
  
  //  Note: var odax = new ... will fail because the object already exists on the page.
  myObj.Delete('\\windows\\crazy_frog.wav');
&lt;/script&gt;
</pre>




##Requirements

<table class="re-table"><tr><th class="tableHeading">RhoElements Version</th><td class="clsSyntaxCell clsEvenRow">1.0.0 or above
</td></tr><tr><th class="tableHeading">Supported Devices</th><td class="clsSyntaxCell clsOddRow">All supported devices except: Enterprise Tablet</td></tr><tr><th class="tableHeading">Minimum Requirements</th><td class="clsSyntaxCell clsOddRow">None.</td></tr><tr><th class="tableHeading">Persistence</th><td class="clsSyntaxCell clsEvenRow">Immediate - These methods are actioned immediately.</td></tr></table>


##HTML/JavaScript Examples

The Following example shows usage of the odax object to manipulate files on the device:

	<script>
	   //  Copy a file
	   var srcFileName = '\\application\\test.xml';
	   var destFileName = '\\windows\\test.xml';
	   var status1 = odax.Copy(srcFileName, destFileName);
	
	   //  Move a file
	   var status2 = odax.Move(srcFileName, destFileName);
	
	   //  Check if a file exists
	   if( true == odax.FileExists(destFileName))
	   {
	      alert("File: "+ destFileName + " Exists!");
	   }
	      
	   //  Delete a file
	   var status3 = odax.Delete(destFileName);
	
	</script>
	
The following example inserts records to a XML file:

	<script>
	   var FieldValue1 = 'Red';
	   var FieldValue2 =  Green';
	   var FieldValue3 = 'Blue';
	
	   var QueryString = 'INSERT INTO \'\\application\\test.xml\' (field1,field2,field3) VALUES (';
	   QueryString += '\''+FieldValue1+'\',';
	   QueryString += '\''+FieldValue2+'\',';
	   QueryString += '\''+FieldValue3+'\');';
	   var count = odax.Execute(QueryString,0,',',false);
	</script>
	
The following example inserts records to a CSV file:

	<script>
	   var QueryString = 'INSERT INTO \'\\application\\test.csv\' (field1,field2,field3) VALUES (';
	   QueryString += '\''+FieldValue1+'\',';
	   QueryString += '\''+FieldValue2+'\',';
	   QueryString += '\''+FieldValue3+'\');';
	   var count = odax.Execute(QueryString,1,',',true);
	</script>
	
The following example updates records in a XML file

	<script>
	   var fieldValue = 'Orange';
	   var conditionField = 'Red';
	
	   var QueryString = 'UPDATE \'\\application\\test.xml\' SET field1=';
	   QueryString += '\''+ fieldValue +'\'';
	   QueryString += ' WHERE field1=\'';
	   QueryString += conditionField +"\';"
	   var count = odax.Execute(QueryString,0,',',false);
	</script>
	
The following example deletes records in a XML file

	<script>
	   var conditionField = 'Red';
	
	   var QueryString = 'DELETE FROM \'\\application\\test.xml\' WHERE field1=';
	   QueryString += '\''+ conditionField +'\';';
	   var count = odax.Execute(QueryString,0,',',false);
	</script>
	
The following example clears the resultset after a query is executed:

	<script>
	   var count = odax.Select('SELECT * FROM \'\\application\\test.xml\';', ',', false);
	   odax.Clear();
	</script>
	
The following JavaScript gets the column 'field1' from the resultset:

	<script>
	   var count = odax.Select('SELECT * FROM \'\\application\\test.xml\';', ',', false);
	   var colval = odax.Get("field1");
	</script>
	
The following JavaScript moves the row pointer to the first record of the resultset:

	<script>
	   var count = odax.Select('SELECT * FROM \'\\application\\test.xml\';', ',', false);
	   var result = odax.MoveFirst();
	</script>
	
The following JavaScript moves the row pointer to the next record in the resultset:

	<script>
	   var count = odax.Select('SELECT * FROM \'\\application\\test.xml\';', ',', false);
	   var result = odax.movenext();
	</script>
	
The following JavaScript moves the row pointer to the previous record in the resultset:

	<script>
	   var count = odax.Select('SELECT * FROM \'\\application\\test.xml\';', ',', false);
	   var result = odax.moveprev();
	</script>
	
The following JavaScript moves the row pointer to the last record of the resultset

	<script>
	   var count = odax.Select('SELECT * FROM \'\\application\\test.xml\';', ',', false);
	   var result = odax.movelast();
	</script>
	
The following JavaScript selects all records from a XML file:

	<script>
	   var count = odax.Select('SELECT * FROM \'\\application\\test.xml\';', ',', false);
	</script>
	


