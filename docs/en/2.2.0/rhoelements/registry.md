
#Registry Module

<b>
The Registry Module is used to write and delete registry settings, and create corresponding merge files.
</b>

##Syntax

<table class="re-table"><tr><th class="tableHeading">registry (Module) &lt;META&gt; Syntax
</th></tr><tr><td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="registry" content="[parameter]"&gt;</p></td></tr><tr><td class="clsSyntaxCells clsEvenRow"><p>&lt;META HTTP-Equiv="registry" content="[parameter:attribute]"&gt;</p></td></tr></table>
<table class="re-table"><tr><th class="tableHeading">Registry JavaScript Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the JavaScript Object <b>'registry'</b> will exist on the current page and can be used to interact directly with the registry.
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Invoke registry methods via JavaScript use the following syntax: registry.method();
<P />e.g. <b>registry</b>.delete();
</td></tr><tr><td class="clsSyntaxCells clsOddRow">
To Set registry parameters via JavaScript use the following syntax: registry.parameter = 'value'; remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>registry</b>.hive = 'value';
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">							
To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: registry.setEMML("[Your EMML Tags]");
<P />
e.g. <b>registry</b>.setEMML("hive:<i>value</i>delete");							
</td></tr></table>

<table class="re-table"><tr><th class="tableHeading">Registry Ruby Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the Ruby Object <b>'Registry'</b> will exist on the current page and can be used to interact directly with the Registry. All Methods, Parameters and Events are the same as JavaScript, however, notice <b>'Registry'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b></td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Invoke Registry methods via Ruby use the following syntax: Registry.method()
<P />e.g. <b>Registry</b>.delete</td></tr><tr><td class="clsSyntaxCells clsOddRow">
To Set Registry parameters via Ruby use the following syntax: Registry.parameter = 'value' remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>Registry</b>.hive = 'value'
</td></tr><tr><td class="clsSyntaxCells clsEvenRow" /></tr></table>


	

##Methods


Items listed in this section indicate methods or, in some cases, indicate parameters which will be retrieved.

<table class="re-table"><col width="10%" /><col width="68%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>delete</b></td><td class="clsSyntaxCells clsOddRow">Deletes the setting.</td><td class="clsSyntaxCells clsOddRow">
N/A
</td></tr></table>


##Parameters


Items listed in this section indicate parameters, or attributes which can be set.
<table class="re-table"><col width="20%" /><col width="20%" /><col width="38%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Possible Values</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>hive:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">HKLM, HKCU, HKCR or HKU</td><td class="clsSyntaxCells clsOddRow">Name of the root hive.</td><td class="clsSyntaxCells clsOddRow">None</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>key:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Any string</td><td class="clsSyntaxCells clsEvenRow">Full path of the key, including '\' separators as required.  Remember to use '\\' in JavaScript to specify backslash whereas just a single '\' should be used in META tags.</td><td class="clsSyntaxCells clsEvenRow">None</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>setting:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Any string</td><td class="clsSyntaxCells clsOddRow">Name of the setting.</td><td class="clsSyntaxCells clsOddRow">None</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>type:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">DWORD, STRING, BINARY or MULTISZ</td><td class="clsSyntaxCells clsEvenRow">Data type of the setting.</td><td class="clsSyntaxCells clsEvenRow">None</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>persistent:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">TRUE or FALSE</td><td class="clsSyntaxCells clsOddRow">Whether to create the corresponding merge file.</td><td class="clsSyntaxCells clsOddRow">FALSE</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>value:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Valid string for the setting type specified - see remarks</td><td class="clsSyntaxCells clsEvenRow">Value for the setting.</td><td class="clsSyntaxCells clsEvenRow">None</td></tr></table>
<table class="re-table"><col width="78%" /><col width="8%" /><col width="1%" /><col width="5%" /><col width="1%" /><col width="5%" /><col width="2%" /></table>




##Remarks


###Hive values
The values HKLM, HKCU, HKCR and HKU correspond to HKEY_LOCAL_MACHINE, HKEY_CURRENT_USER, HKEY_CLASSES_ROOT and HKEY_USERS.


###Data types
The value is formatted for each data type as follows.

<pre>

DATA TYPE    VALUE FORMAT
dword        A decimal number.
string       Any string of characters.
binary       A string of hexadecimal digits (0-9, A-F).
             There must be an even number of digits.
multisz      Multiple strings of characters, separated by \n.
             To include a backslash (\) in a string write a double backslash (\\).
      </pre>


###Merge files
When the persistent tag is given the module will write a .reg file to the \Application folder on the device, which will add the setting to the registry when merged by Windows CE/WM, e.g. during a cold boot. When the persistent tag is given when deleting a setting, the module deletes any existing .reg file created above, and creates a new .reg file which will delete the setting when merged - this is in addition to deleting the registry setting itself.


###Deprecation
The Registry module has been deprecated. It is advised to use the SetRegistrySetting/GetRegistrySetting/ReadConfigSetting/WriteConfigSetting methods in the Generic module instead.




##Requirements

<table class="re-table"><tr><th class="tableHeading">RhoElements Version</th><td class="clsSyntaxCell clsEvenRow">1.0.0 or above
</td></tr><tr><th class="tableHeading">Supported Devices</th><td class="clsSyntaxCell clsOddRow">All supported devices except: Enterprise Tablet.</td></tr><tr><th class="tableHeading">Minimum Requirements</th><td class="clsSyntaxCell clsOddRow">None.</td></tr><tr><th class="tableHeading">Persistence</th><td class="clsSyntaxCell clsEvenRow">Persistent - Changes to this module will persist when navigating to a new page.</td></tr></table>


##HTML/JavaScript Examples

The tags below add a registry setting called 'RhoElements' in the 'Software' key of the HKEY_LOCAL_MACHINE hive. The setting is of type 'multisz' and has the values 'hello' and 'world'. The corresponding .reg merge file will be created in the \Application folder.

	        <META HTTP-Equiv="registry" Content="hive:hklm">
	        <META HTTP-Equiv="registry" Content="key:Software">
	        <META HTTP-Equiv="registry" Content="setting:RhoElements">
	        <META HTTP-Equiv="registry" Content="type:multisz">
	        <META HTTP-Equiv="registry" Content="persistent:true">
	        <META HTTP-Equiv="registry" Content="value:hello\nworld">
	      
The tags below delete the above setting.

	        <META HTTP-Equiv="registry" Content="hive:hklm">
	        <META HTTP-Equiv="registry" Content="key:Software">
	        <META HTTP-Equiv="registry" Content="setting:RhoElements">
	        <META HTTP-Equiv="registry" Content="delete">
	      


