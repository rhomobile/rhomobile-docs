
#Web SQL API Tutorial

This tutorial covers the use of the HTML5 Web SQL API in Enterprise Browser for storing and retrieving data.

##Prerequisites

The following are required to complete this tutorial:

* A background in HTML, CSS and JavaScript coding
* Enterprise Browser installed on a development PC

Because device-specific APIs are not used in this tutorial, it is technically possible to develop and test this application using a desktop browser. To simulate deployment and running on an actual Enterprise Browser instance, you should consider developing and testing using a hardware device. The additional requirements for this are: 

* A Zebra mobile device and USB cable
* Enterprise Browser installed on the Zebra device

##Coding for the Web SQL API

Enterprise Browser includes support for the HTML5 Web SQL API for managing data. The steps shown below are typical for code that uses the API. This tutorial will walk through the creation of a working example application using these steps. 

![img](images/eb_tutorials/WebSQL_API_tutorial_01.png)

The resulting example application looks like this:

![img](images/eb_tutorials/WebSQL_API_tutorial_02.png)

##Creating the App

The following HTML template will be used as a starting point for this tutorial. It includes the following features:

* Back button that returns the user to the Enterprise Browser start page. 
* Quit button that exits Enterprise Browser. 
* Styling to size components in an appropriate manner for use on a device. 

HTML Starter Template:

    :::HTML
    <HTML>
      <HEAD>
        <script type="text/javascript" charset="utf-8" src="./ebapi-modules.js">
        </script>
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


###STEP 1: Create the application file

* **Create a directory** on your development machine for application files. 
* **Copy the file `ebapi-modules.js`** from C:\EnterpriseBrowser\JavaScriptFiles\EnterpriseBrowser to your application directory. The sample app's Quit button relies on code in this JavaScript file. 
* **Create a file named `websql.html`** in your application directory and open it in a text editor.
* **Copy the contents of the starter template** above into the file and save it.

###STEP 2: Add data display area and control buttons

* **In `websql.html`, add a data display area to the `content div` section**:  

Sample HTML: 

    :::HTML
    <div id="data" ><ul class="record-list" id="db-results"></ul>
    </div>


* **Add two input buttons in the bottom of the `content div` section** using the code below. The first button will be used to add records to the database. The second will erase all records from the database. 

Sample HTML: 

    :::HTML
    <input type=button value="Add Record">
    <input type=button value="Reset Database">


###STEP 3: Configure database location

The Enterprise Browser app's `config.xml` file holds several settings that affect WebSQL databases. 

Sample Config.xml:

    :::XML
    <WebDB>
        <WebSQLDBQuota value="5000000"/>
        <WebSQLDBPath value="file://%INSTALLDIR%"/>
    </WebDB>


The WebDB section of the `config.xml` file shown above limits the size of the WebSQL database to 5MB and sets the database location in the root directory of the Enterprise Browser installation. If you choose, you can change the path to another location. For example, if your application is located in **/storage/sdcard1/myapplication**, you might want to locate your database in the same directory. In that case, the setting in the `config.xml` would be as follows: 

Sample Config.xml:

    :::XML 
    <WebSQLDBPath value="file:///storage/sdcard1/myapplication"/>

The path shown here is valid for Android. The path for Windows Mobile/CE will vary slightly. 

####If you choose to change the default location of WebSQLDBPath:
1. **Copy the `config.xml` file** from the Enterprise Browser install directory on the device to a suitable location on the development machine and open it in a text editor. 
2. **Update the WebSQLDBPath setting** to point to the location on the device where you plan to install the application. 
3. **Copy the `config.xml` file back to its original location** on the device. 

###STEP 4: Create a database table

* **In `websql.html`, add the method `fnDBInit()` to the SCRIPT section**, which is between the end BODY and end HTML sections: 

Sample JavaScript: 

    :::JavaScript
    function fnDbInit() {
      if (window.openDatabase) {
        db = openDatabase('webdbtutorial', '1.0', 'ScanItems', 2000);
        db.transaction(function(tx) {
          tx.executeSql("CREATE TABLE Items(ID INTEGER PRIMARY KEY,ScannedData TEXT)",[], function(tx){}, null);});
      }
    }


The first line of code tests to see if the current browser supports WebSQL. The `openDatabase()` method on the next line opens a database and assigns it to a variable for later use. In the lines that follow, a 'SQL table create' statement is executed within a transaction. When this method is finished running, the database will be available to execute additional SQL statements for inserting and deleting records. 

To make the database variable available immediately, we must initialize the database as soon as the page starts up. Here's how: 

* **Modify the BODY start tag** to look like this:

Sample HTML: 

    :::HTML
    <BODY onload="fnOnLoad();" >

* **Add the `fnDbInit()` method as the first function in the SCRIPT section**:

Sample JavaScript: 

    :::JavaScript
    function fnOnLoad(){
      var db = null;
      fnDbInit();
      fnDbDisplayData();
    }

The `fnDbDisplayData()` method used in the code above will be created in a later step. 

###STEP 5: Insert data

* **Add the `fnDbAdd()` method to the end of the SCRIPT section**:

Sample JavaScript:

    :::JavaScript
    function fnDbAdd() {    
      db.transaction( function(tx) {
        tx.executeSql("INSERT INTO Items ( ScannedData) VALUES (?)", [ fnMakeName() ],
        function(tx, result) {}, null);
      });   
      fnDbDisplayData();
    }

This method executes a SQL statement to insert data into the Items table. For demo purposes, the data in this case is being provided by the `fnMakeName()` method, which returns a new randomly generated name each time it is called. In a real application, you might get data from input fields filled out by the user. 

* **Add the `fnMakeName()` method to the end of the SCRIPT section**::

Sample JavaScript:

    :::JavaScript
    function fnMakeName(){
      var fnames = ["John", "Cathy","Steve", "Susan", "Matt"];
      var lnames = ["Smith", "Johnson", "Doe", "Morrison", "Simpson"];
      var idxf = Math.floor((Math.random() * 5));
      var idxl = Math.floor((Math.random() * 5));
      var name = fnames[idxf] + " " + lnames[idxl];
      console.log( name);
      return name;
    }

  
###STEP 6: Delete data

Data can be deleted by individual records or by deleting all records at once and resetting the database. We'll give you both methods. 

####Record by record:
* **Add the method `fnDbDeleteRecord(id)` at the end of the SCRIPT section** to allow deletion of individual records based on the record id: 

Sample JavaScript:

    :::JavaScript
    function fnDbDeleteRecord(id) {
      db.transaction(function(tx) {
      tx.executeSql("DELETE FROM Items WHERE ID=?", [id],
        function(tx, result) { fnDbDisplayData() }, null);
      });
    }

An id gets passed to this method, which it uses to execute a SQL delete statement for the given record. 

####All records at once:
* **Add the method `fnDbReset()` at the end of the SCRIPT section**:

Sample JavaScript:

    :::JavaScript
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

This method executes two SQL statements. The first statement drops the existing table and all its data. The second statement recreates the table.  

###STEP 7: Selecting data and iterating the resultset

You may have noticed that we have been calling `fnDbDisplayData()` after each data operation. This method refreshes the screen with the latest contents of the database table.

* **Add the method `fnDbDisplayData()` at the end of the SCRIPT section**:

Sample JavaScript:

    :::JavaScript
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


The first line of this method deletes the current contents of the db-results display area on the screen. After that a SQL select statement is executed to retrieve the contents of the Items table. The third parameter of the `executeSQL()` method is an anonymous callback function that is executed as soon as the select is complete. The result of the select statement is passed to the callback function, which then iterates through each result and adds it to the db-results display area on the screen. 

Note how the data being inserted into the page includes a delete link for each row that can be used to call `fnDbDeleteRecord` with the record id for that row.

###STEP 8: Hook JavaScript methods to buttons 

Now that the JavaScript functions have been created, we can hook them to the control buttons.

* **Add `onClick` handler code** to the input button tags** we created earlier (or **simply replace the buttons created earlier with the function-appended button code below**): 

Sample HTML:

    :::HTML
    <input type=button value="Add Record" onClick="fnDbAdd()" >
    <input type=button value="Reset Database" onClick="fnDbReset()" >


###STEP 9: Copy files to the device

To test the application, you need to copy the application files to the device and set the StartPage setting in the Enterprise Browser `config.xml` file. Android- and Windows-based devices use different methods for transferring files. Please see the documentation for your device for specific instructions on copying files. 

In general, here's what is required:

1. **Create a directory on your device** for the WebSQL application. Make sure the directory is in an unrestricted location to avoid any permissions issues when Enterprise Browser tries to open the files. We'll place our sample app's files in the device's root directory and show you how to modify the `config.xml` file accordingly.
2. **Copy the `websql.html` and any JavaScript API files** you have included to the directory you created on the device. 
3. **Copy the `config.xml` file to a suitable location on the development machine** from the Enterprise Browser install directory on the device and open it in a text editor. 
4. **Update the StartPage setting in `config.xml` to point to the location on the device** where you placed `websql.html` and save the changes. 
5. **Copy the `config.xml` file back to its original location on the device**.    

Sample `config.xml` showing path to Android app in root directory: 

    :::HTML
        <General>
            <Name value="WebSQL"/>
            <StartPage value="file:///websql.html" name="WebSQL"/>
            <UseRegularExpressions value="1"/>
        </General>
        ...
        <WebDB>
            <WebSQLDBQuota value="5000000"/>
            <WebSQLDBPath value="file:///websql.html"/>
        </WebDB>



###STEP 10: Testing the App

* **Tap the Enterprise Browser icon** on the device. If the device is not yet licensed for Enterprise Browser you will see the following screen:

![img](images/eb_tutorials/WebSQL_API_tutorial_03.png)

* **Click on the cancel button** in the upper right hand corner of the screen to dismiss the message and open the WebSQL application. If you turn the device sideways it should look like this:

![img](images/eb_tutorials/WebSQL_API_tutorial_04.png)

* **Click on the Add Record button** a few times to create and add records.

![img](images/eb_tutorials/WebSQL_API_tutorial_05.png)

* **Press the delete link** for one of the records to delete that record.

![img](images/eb_tutorials/WebSQL_API_tutorial_06.png)

* **Click the Reset Database button** to erase the remaining record. 

![img](images/eb_tutorials/WebSQL_API_tutorial_07.png)

###Conclusion
This completes the Enterprise Browser Web SQL API tutorial. More information about the Web SQL API, please visit [the W3C's Web SQL Database page](http://www.w3.org/TR/webdatabase/).