
#Generic Preexisting JavaScript Object

<b>
The Generic Preexisting JavaScript Object contains read only properties and methods which do not belong to a specific module. If you have configured 'PreloadLegacyGeneric' to be '1' the JavaScript object 'generic' will be inserted automatically into your page's DOM by RhoElements.
</b>

##Syntax

<table class="re-table"><tr><th class="tableHeading">Generic (Preexisting JavaScript Object) &lt;META&gt; Syntax
</th></tr><tr><td class="clsSyntaxCells clsOddRow"><p>generic.Log('Message to be logged', 1);</p></td></tr><tr><td class="clsSyntaxCells clsEvenRow"><p>var myOEM = generic.OEMInfo;</p></td></tr></table>




##Methods

<table class="re-table"><col width="40%" /><col width="40%" /><col width="20%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Parameters</th><th class="tableHeading">Returns</th></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>InvokeMETAFunction<br /></b>Invokes the specified meta function immediately.</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>Name: </b>Module Name, 
<b>Values: </b>String<br /><b>Description: </b>Module on which to perform the method or apply the property.  This would be placed in the 'HTTP-Equiv' part of the Meta tag if it was being parsed on a page.<P /><b>Name: </b>Content, 
<b>Values: </b>Method or Property<br /><b>Description: </b>The method or Property to be applied to the module.<P /></td><td style="text-align:left;" valign="top" class="clsSyntaxCells clsOddRow">N/A</td></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>Log<br /></b>Invokes a user defined type log entry using the standard RhoElements logger component.  With this invocation RhoElements will log to either a text file or HTTP as defined in the configuration settings.</td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>Name: </b>Log Entry, 
<b>Values: </b>String<br /><b>Description: </b>The string to log.<P /><b>Name: </b>Severity, 
<b>Values: </b>1, 2 or 3<br /><b>Description: </b>1 is low severity, 2 is medium severity, 3 is high priority<P /></td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;" valign="top">A boolean value to indicate success or failure or the log operation</td></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>LaunchProcess<br /></b>Launches a new process which blocks execution until the process terminates. (Not supported on ET1)</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>Name: </b>FileName to launch, 
<b>Values: </b>String<br /><b>Description: </b>Filename of the application to execute<P /><b>Name: </b>Commandline, 
<b>Values: </b>String<br /><b>Description: </b>Optional command line parameters<P /></td><td style="text-align:left;" valign="top" class="clsSyntaxCells clsOddRow">The return code of the launched process</td></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>LaunchProcessNonBlocking<br /></b>Launches a new process which does not block execution. (Not supported on ET1)</td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>Name: </b>FileName to launch, 
<b>Values: </b>String<br /><b>Description: </b>Filename of the application to execute<P /><b>Name: </b>Commandline, 
<b>Values: </b>String<br /><b>Description: </b>Optional command line parameters<P /></td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;" valign="top">The launched process handle</td></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>CloseProcess<br /></b>Closes the handle opened by LaunchProcessNonBlocking. (Not supported on ET1)</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>Name: </b>Handle To close, 
<b>Values: </b>object<br /><b>Description: </b>Handle returned by LaunchProcessNonBlocking<P /></td><td style="text-align:left;" valign="top" class="clsSyntaxCells clsOddRow">N/A</td></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>GetProcessExitCode<br /></b>Retrieves the exit code of a previously run LaunchProcessNonBlocking call. (Not supported on ET1)</td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>Name: </b>Handle to Get, 
<b>Values: </b>object<br /><b>Description: </b>Process handle returned by previously called LaunchProcessNonBlocking<P /></td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;" valign="top">Return value of the process specified by the process handle</td></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>WaitProcess<br /></b>Waits for the process started by LaunchProcessNonBlocking to terminate or it times out. (Not supported on ET1)</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>Name: </b>Process Handle, 
<b>Values: </b>object<br /><b>Description: </b>Handle returned by LaunchProcessNonBlocking<P /><b>Name: </b>Timeout Value, 
<b>Values: </b>Seconds<br /><b>Description: </b>Time to wait before method times out.  A value of 0 will return immediately and can be used to determine if the process has completed or not.<P /></td><td style="text-align:left;" valign="top" class="clsSyntaxCells clsOddRow">True if the process terminated or False if the timeout expired</td></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>SetRegistrySetting<br /></b>Configures the specified registry setting on the device. (Not supported on ET1)</td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>Name: </b>Hive, 
<b>Values: </b>String<br /><b>Description: </b>The Hive name (HKEY_CLASSES_ROOT = 0, HKEY_CURRENT_USER = 1, HKEY_LOCAL_MACHINE = 2, HKEY_USERS = 3) <P /><b>Name: </b>Type, 
<b>Values: </b>String<br /><b>Description: </b>The type of registry entry (REG_SZ = 1, REG_BINARY = 3, REG_DWORD = 4, REG_MULTI_SZ = 7)<P /><b>Name: </b>Key, 
<b>Values: </b>String<br /><b>Description: </b>The Name of the key to set<P /><b>Name: </b>Setting, 
<b>Values: </b>String<br /><b>Description: </b>The name of the sub key to be set<P /><b>Name: </b>Setting, 
<b>Values: </b>String<br /><b>Description: </b>The string value to be set<P /></td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;" valign="top">N/A</td></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>GetRegistrySetting<br /></b>Retrieves the specified registry setting. (Not supported on ET1)</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>Name: </b>Hive, 
<b>Values: </b>Number<br /><b>Description: </b>The hive name (HKEY_CLASSES_ROOT = 0, HKEY_CURRENT_USER = 1, HKEY_LOCAL_MACHINE = 2, HKEY_USERS = 3)<P /><b>Name: </b>SubKey, 
<b>Values: </b>String<br /><b>Description: </b>The name of the sub key to be retrieved<P /><b>Name: </b>Setting, 
<b>Values: </b>String<br /><b>Description: </b>The name of the setting within the sub key<P /></td><td style="text-align:left;" valign="top" class="clsSyntaxCells clsOddRow">The data held in the specified registry setting</td></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>PlayWave<br /></b>plays the specified WAV file.</td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>Name: </b>Filename, 
<b>Values: </b>String<br /><b>Description: </b>The name of the WAV file to play.  If the specified file does not exist the default sound will be played unless specified by the flags.<P /><b>Name: </b>Flags, 
<b>Values: </b>Number<br /><b>Description: </b>Flags for playing the file.  The flags can be combined, see remarks<P /></td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;" valign="top">A boolean value to indicate success or failure of the operation.  Note that synchronous sounds will block until they have finished playing.</td></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>ReadConfigSetting<br /></b>reads a setting from the configuration file. (Not supported on ET1)</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>Name: </b>Setting, 
<b>Values: </b>See Configuration Settings Help Page<br /><b>Description: </b>A setting identifier<P /><b>Name: </b>Application Name, 
<b>Values: </b>String<br /><b>Description: </b>The name of the RhoElements application as specified in config.xml.  When writing to a global setting this should be omitted or 'GLOBAL' used.<P /></td><td style="text-align:left;" valign="top" class="clsSyntaxCells clsOddRow">A string which when evaluated creates an array of returned strings.</td></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>WriteConfigSetting<br /></b>Writes a setting to the configuration file.  Configuration changes will only take effect after RhoElements is re-started. (Not supported on ET1)</td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>Name: </b>Setting, 
<b>Values: </b>See Configuration Settings Help Page<br /><b>Description: </b>A setting identifier<P /><b>Name: </b>Value, 
<b>Values: </b>String<br /><b>Description: </b>The value to set.<P /><b>Name: </b>Application Name, 
<b>Values: </b>String<br /><b>Description: </b>The name of the RhoElements application as specified in config.xml.  When writing to a global setting this should be omitted or 'GLOBAL' used.<P /></td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;" valign="top">A boolean value to indicate whether or not the write was successful</td></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>ReadUserSetting<br /></b>Reads a custom setting stored in the configuration file. (Not supported on ET1)</td><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>Name: </b>Setting, 
<b>Values: </b>String<br /><b>Description: </b>The name of the setting to be read<P /></td><td style="text-align:left;" valign="top" class="clsSyntaxCells clsOddRow">The read value as a string or 'Undefined if the setting can not be found</td></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>WriteUserSetting<br /></b>Writes a custom setting to the configuration file.  Configuration changes will only take effect after RhoElements is re-started. (Not supported on ET1)</td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>Name: </b>Setting, 
<b>Values: </b>String<br /><b>Description: </b>The name of the setting to be stored<P /><b>Name: </b>Value, 
<b>Values: </b>String<br /><b>Description: </b>The value to write<P /></td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;" valign="top">A boolean value to indicate success or failure of the operation</td></tr></table>

##Properties

<table class="re-table"><col width="20%" /><col width="80%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Description</th></tr><tr><td style="text-align:left;" class="clsSyntaxCells clsOddRow"><b>OEMInfo</b></td><td style="text-align:left;" class="clsSyntaxCells clsOddRow">The OEM Information string for the terminal</td></tr><tr><td class="clsSyntaxCells clsEvenRow" style="text-align:left;"><b>UUID</b></td><td class="clsSyntaxCells clsEvenRow" style="text-align:left;">The Unique Unit IDentifier for the terminal</td></tr></table>




##Remarks


###Play Flags
Flags are as follows:

<pre>

0x00000000 = Play synchronously (default all but ET1).  The function returns after the sound event completes. (Not supported on ET1)
0x00000001 = The sound is played asynchronously (default on ET1 device).  To terminate an asynchronously played waveform 
             sound, call PlayWave with strSound set to null.
0x00000002 = No default sound event is used. If the sound cannot be found, PlayWave returns 
             silently without playing the default sound. (Not applicable on ET1)
0x00000008 = The sound plays repeatedly until PlayWave is called again with the strSound parameter 
             set to null. You must also specify the 0x00000001 flag to indicate an asynchronous 
             sound event.
0x00000010 = The specified sound event will yield to another sound event that is already playing. 
             If a sound cannot be played because the resource needed to generate that sound is 
             busy playing another sound, the function immediately returns without playing the 
             requested sound.  If this flag is not specified, PlaySound attempts to stop the 
             currently playing sound so that the device can be used to play the new sound.
</pre>


###Backwards Compatibility
The Generic Preexisting JavaScript Object provides backwards compatibility with code written for PocketBrowser and also supports the syntax below. Because RhoElements inserts the object 'generic' on the page automatically when 'PreloadLegacyGeneric' is configured to be '1' you can not create your own objects by this name, see below:

<pre>

&lt;script&gt;
  //  Old PocketBrowser syntax supported by the Generic Object
  var gen = new ActiveXObject("PocketBrowser.Generic"); 
  
  //  Note: var generic = new ... will fail because the object already exists on the page.
  gen.Log('My Log Data', 1);
&lt;/script&gt;
</pre>




##Requirements

<table class="re-table"><tr><th class="tableHeading">RhoElements Version</th><td class="clsSyntaxCell clsEvenRow">1.0.0 or above
</td></tr><tr><th class="tableHeading">Supported Devices</th><td class="clsSyntaxCell clsOddRow">All supported devices</td></tr><tr><th class="tableHeading">Minimum Requirements</th><td class="clsSyntaxCell clsOddRow">None.</td></tr><tr><th class="tableHeading">Persistence</th><td class="clsSyntaxCell clsEvenRow">Immediate - These methods are actioned immediately.</td></tr></table>


##HTML/JavaScript Examples

The Following example shows usage of the Generic object:

	<script>
	   //  Log some data as low severity
	   generic.Log('Scanner data successfully received',1);
	   //  Retrieve the type of terminal
	   var myTerminal = generic.OEMInfo;
	   //  Retrieve the UUID of the terminal
	   var myUUID = generic.UUID;
	   //  Play a wave file
	   generic.PlayWave('\\windows\\alarm1.wav', 1);
	</script>
	
The Following example shows usage of Invoke Meta Function:

	<script>
	   //  Enable the scanner
	   generic.InvokeMETAFunction('Scanner', 'Enable');
	   //  Configure the Scanner
	   generic.InvokeMETAFunction('Scanner', 'all_decoders:disabled; ean8:enabled; Enabled');
	   //  Show the signature capture window
	   generic.InvokeMETAFunction('SignatureCapture', 'Visibility:Visible');
	   //  Show and configure the battery icon
	   generic.InvokeMETAFunction('Battery', 'Left:50; Top:50; IconPosition:Bottom; color:#FF0000; visibility:visible');
	</script>
	
The Following example shows usage of the Generic object when controlling processes:

	<script>
	   //  Launch CtlPanel (blocking)
	   var exitCode1 = generic.LaunchProcess('\\application\\ctlpanel.exe', '');
	   
	   //  Launch CtlPanel and see if the user closes it before 5 seconds
	   var hProcess = generic.LaunchProcessNonBlocking('\\application\\ctlpanel.exe', '');
	   var bRetVal = generic.WaitProcess(hProcess, 5);
	   if (bRetVal)
	   {
	      var exitCode2 = generic.GetProcessExitCode(hProcess);
	      alert('Process Ended by User: ' + exitCode2);
	   }
	   else
	      alert('Process Still Running');
	   generic.CloseProcess(hProcess);
	</script>
	
The Following example shows usage of the Generic object for interfacing with the registry:

	<script>
	   //  Write a registry setting
	   var REG_SZ = 1;
	   var HKEY_LOCAL_MACHINE = 2;
	   var szWrittenData = "Fred";
	   generic.SetRegistrySetting(HKEY_LOCAL_MACHINE, REG_SZ, "Software\\Motorola\\MySettings", "Name", szWrittenData);
	   
	   //  Read back the previously written setting
	   var szReadData = generic.GetRegistrySetting(HKEY_LOCAL_MACHINE, "Software\\Motorola\\MySettings",  "Name");
	</script>
	
The Following example shows usage of the Generic object for reading / writing configuration settings:

	<script>
	   //  Read the FULLSCREEN setting and alert it to the user.
	   var Ret = generic.ReadConfigSetting("FULLSCREEN");
	   eval("var arrRet = "+Ret);
	   if(arrRet.length){
	    alert(arrRet[0]);
	   }
	   
	   //  Show an alert with the scrollbar setting for an application named "Menu".
	   var Ret = generic.ReadConfigSetting("SCROLLBARSENABLED","Menu");
	   eval("var arrRet = "+Ret);
	   if(arrRet.length){
	    alert(arrRet[0]);
	   }
	   
	   //  Show an alert for each preload in the application named "Menu".
	   var loop;
	   var Ret = generic.ReadConfigSetting("PRELOAD","Menu");
	   eval("var arrRet = "+Ret);
	   for(loop=0;loop < arrRet.length;loop++){
	      alert(arrRet[loop]);
	   }
	   
	   //  Set fullscreen off in the configuration file.
	   var Ret = generic.WriteConfigSetting("FULLSCREEN","0");
	   if(Ret=='true'){
	    alert("Setting saved and will take place on the next RhoElements re-start");
	   }
	   
	   //  Turn the scrollbars setting off for the application named "Menu".
	   var Ret = generic.WriteConfigSetting("SCROLLBARSENABLED","0","Menu");
	   if(Ret=='true'){
	    alert("Setting saved and will take place on the next RhoElements re-start");
	   }
	</script>
	
The Following example shows usage of the Generic object for reading / writing user settings:

	<script>
	   //  Write the string 'red' to the custom setting 'bgcolor'
	   var Ret = generic.WriteUserSetting("BgColor","red");
	   if(Ret=='true'){
	    alert("Custom setting saved");
	   }
	
	   //  Retrieve the value we have just written
	   var Ret = generic.ReadUserSetting("BgColor");
	   alert("background color is "+Ret);
	</script>
	


