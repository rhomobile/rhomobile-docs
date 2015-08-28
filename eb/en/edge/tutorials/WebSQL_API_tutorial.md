Web SQL API Tutorial
This tutorial covers the use of the HTML5 Web SQL API in Enterprise Browser for storing and retrieving data.


Prerequisites
The following are required to complete this tutorial:
* A background in HTML, CSS and JavaScript coding. 
* Enterprise Browser installed on a development PC. 


Because device specific APIs are not used in this tutorial it is technically possible to develop and test this application using a desktop browser. To simulate deployment and running on an actual Enterprise Browser instance you should consider developing and testing using a hardware device. The additional requirements for this are: 
* A Zebra mobile device and USB cable.
* Enterprise Browser installed on the Zebra device. 
Coding for the Web SQL API
Enterprise Browser includes support for the HTML5 Web SQL API for managing data. The steps shown below are typical for code that uses the API. This tutorial will walk through creating a working example application using these steps. 


 C:\Users\Mark\SkyDrive\Documents\Zebra-Enterprise-Browser\EB Developer Fundamentals\Working Copy\Tutorials\images\websql-api-steps.png 



The resulting example application looks like this:


   


Creating the App


The following HTML template will be used as a starting point for this tutorial. It includes the following features:
* Back button that returns the user to the Enterprise Browser start page. 
* Quit button that exits Enterprise Browser. 
* Styling to size components in an appropriate manner for use on a device. 


HTML Starter Template:


<HTML>
<HEAD>
<script type="text/javascript" charset="utf-8" src="./ebapi-modules.js"></script>
<style>
h1{font-size:2.5em;background-color:lightgray;margin:5px;padding:5px;}
button{font-size:.5em;}
input{font-size:1.3em;}
#scanData{width:90%;margin:10px;}
</style>
</HEAD>
<BODY>
<h1>WebSQL<br/>
<button onclick="window.location.href='./index.html'">Home</button>
<button onclick="EB.Application.quit();">Quit</button>
</h1>
<div id=content>
</div>
</BODY>
<SCRIPT>
</SCRIPT>
</HTML>




Create the application file:
1. Create a directory on your development machine for application files. 
2. The Quit button relies on code in the ebapi-modules.js JavaScript file. Copy this file from C:\EnterpriseBrowser\JavaScriptFiles\EnterpriseBrowser to your application directory.  
3. Create a file named websql.html in your application directory and open it in a text editor.
4. Copy the contents of the starter template above into the file and save it.


Add data display area and control buttons:
1. Open websql.html in a text editor.
2. Add a data display area to the content div. 


<div id="data" ><ul class="record-list" id="db-results"></ul></div>


1. After the data display area add two input buttons. The first button will be used to add records to the database and the second to erase all records from the database. 


<input type=button value="Add Record">
<input type=button value="Reset Database">


Configure Database Location
The config.xml file holds several settings that affect WebSQL databases. 


<WebDB>
    <WebSQLDBQuota value="5000000"/>
    <WebSQLDBPath value="file://%INSTALLDIR%"/>
</WebDB>




The WebDB section of the config.xml file shown above limits the size of the WebSQL database to 5 megabytes and sets the database's location to be in the root of the directory where Enterprise Browser's is installed. If you choose to you can change the path to point to another location. For example if your application is located in /storage/sdcard1/myapplication you might want to change the config.xml setting to place the data in that directory. 
 
<WebSQLDBPath value="file:///storage/sdcard1/myapplication"/>


The path shown here is valid for the Android OS. If you are using Windows Mobile or CE your path will be slightly different. 


1. Choose to keep the default WebSQLDBPath or change it to match the location where your app will be installed. If you choose to change it you will need to:
   1. Copy the config.xml file from the Enterprise Browser install directory on the device to a suitable location on the development machine and open it in a text editor. 
   2. Update the WebSQLDBPath setting to point to the location on the device where you plan to install the application. 
   3. Copy the config.xml file back to its original location on the device. 


Open the database and create a table:
1. Add a method called fnDBInit()  to the script section that appears near the end of websql.html. 


function fnDbInit() {
  if (window.openDatabase) {
    db = openDatabase('webdbtutorial', '1.0', 'ScanItems', 2000);
    db.transaction(function(tx) {
      tx.executeSql("CREATE TABLE Items(ID INTEGER PRIMARY KEY,ScannedData TEXT)",[], function(tx){}, null);});
  }
}


The first line of code tests to see if the current browser supports WebSQL. The openDatabase() method on the next line opens a database and assigns it to a variable for later use. In the lines that follow a SQL table create statement is executed within a transaction. When this method is finished running the database will be available to execute additional SQL statements for inserting and deleting records. 


1. We need to have the database initialization code run as soon as the page starts up to make the database variable available. To do that we need to do two things:
   1. Modify the body start tag to look like this:


<BODY onload="fnOnLoad();" >




<BODY onload="fnOnLoad();" >


   1. Add the following method at the beginning of the script section above fnDbInit():


function fnOnLoad(){
  var db = null;
  fnDbInit();
  fnDbDisplayData();
}


The fnDbDisplayData() method used in the above code will be created in a later step. 
 


Insert data:
1. Add a method called fnDbAdd() to the script section after fnDbInit():


function fnDbAdd() {    
  db.transaction( function(tx) {
    tx.executeSql("INSERT INTO Items ( ScannedData) VALUES (?)", [ fnMakeName() ],
    function(tx, result) {}, null);
  });   
  fnDbDisplayData();
}


This method executes a SQL statement to insert data into the Items table. For demo purposes the data in this case is being provided by the fnMakeName() method which returns a new randomly generated name each time it is called. In a real application you might get data from input fields filled out by the user. Add the fnMakeName() method after fnDbAdd():


function fnMakeName(){
  var fnames = ["John", "Cathy","Steve", "Susan", "Matt"];
  var lnames = ["Smith", "Johnson", "Doe", "Morrison", "Simpson"];
  var idxf = Math.floor((Math.random() * 5));
  var idxl = Math.floor((Math.random() * 5));
  var name = fnames[idxf] + " " + lnames[idxl];
  console.log( name);
  return name;
}


  
Delete data:
This application deletes data in two ways. First is an option to delete individual records. The second allows the user to delete all records and resetting the database.


1. Add a method fnDbDeleteRecord(id) at the end of the script section to allow deletion of individual records based on their id.


function fnDbDeleteRecord(id) {
  db.transaction(function(tx) {
  tx.executeSql("DELETE FROM Items WHERE ID=?", [id],
    function(tx, result) { fnDbDisplayData() }, null);
  });
}


This method gets passed an id and uses it to execute a SQL delete statement. 




1. Add a method fnDbReset()  at the end of the script section:


function fnDbReset() {
  db.transaction(function (tx) {
    tx.executeSql('DROP TABLE Items');
  });
  db.transaction(function(tx) {
    tx.executeSql("CREATE TABLE Items (ID INTEGER PRIMARY KEY,ScannedData TEXT)", 
                   [], function(tx){}, null);
  });     
  fnDbDisplayData();
}


This method executes two SQL statements. The first statement drops the existing table and all its data. The second one recreates the table.  


1. Make sure to save the file periodically as you edit. 


Selecting data and iterating the resultset:
You may have noticed that we have been calling fnDbDisplayData() after each data operation. This method refreshes the screen with the latest contents of the database table.


1. Add the method fnDbDisplayData() at the end of the script section.


function fnDbDisplayData() {
document.getElementById('db-results').innerHTML = '';
  db.transaction(function(tx) {
    tx.executeSql("SELECT * FROM Items", [], function(tx, result) {
      for (var i = 0, item = null; i < result.rows.length; i++) {
        item = result.rows.item(i);
        document.getElementById('db-results').innerHTML += 
        '<li>' +  
        '<a href="#" onclick="fnDbDeleteRecord('+item['ID']+')">[Delete]</a>' +
        '&nbsp;' + item['ScannedData'] +
        '</li>';
      }
    });
  });
}


The first line of this method deletes the current contents of the db-results display area on the screen. After that a SQL select statement is executed to retrieve the contents of the Items table. The third parameter of the executeSQL() ,method is an anonymous callback function that is executed as soon as the select is complete. The result of the select statement is passed to the callback function which then iterates through each result and adds it to the db-results display area on the screen.  
Note how the data being inserted into the page includes a delete link for each row that can be used to call fnDbDeleteRecord with the record id for that row.


Hook up JavaScript methods to buttons: 
1. Now that the JavaScript functions have been created we can hook them up to the control buttons.  Open websql.html and add onClick handlers to the input button tags as shown here:


<input type=button value="Add Record" onClick="fnDbAdd();">

<input type=button value="Reset Database" onClick="fnDbReset();">         


Copy Files to the Device
In order to test the application you need to copy the application files to the device and set the StartPage setting in the Enterprise Browser config.xml file. Android and Windows based devices use different methods for transferring files. Please see the documentation for your device for specific instructions on copying files:
1. Create a directory on your device for the Web SQL application. Make sure the directory is in an unrestricted location to avoid any permissions issues when Enterprise Browser tries to open the files. 
2. Copy the websql.html to the directory you have created on the device. 
3. Copy the config.xml file from the Enterprise Browser install directory on the device to a suitable location on the development machine and open it in a text editor. 
4. Update the StartPage setting in config.xml to point to the location on the device where you placed websql.html and then save the changes. 
5. Copy the config.xml file back to its original location on the device.  


Testing the App
1. Tap the Enterprise Browser icon on the device. If the device is not yet licensed for Enterprise Browser you will see the following screen:


  
  



1. Click on the cancel button in the upper right hand corner of the screen to dismiss the message and open the WebSQL application. If you turn the device sideways it should look like this:


   


1. Click on the Add Record button a few times to create and add records.
   


1. Press the delete link for one of the records to delete that record.


   




1. Click the Reset Database button to erase the remaining record. 


  





Conclusion
This completes the Enterprise Browser Web SQL API tutorial. More information on the Web SQL API is available at: http://www.w3.org/TR/webdatabase/.