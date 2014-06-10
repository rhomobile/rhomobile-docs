
#EmmlProfile Module

<b>
The EmmlProfile Module is used to manage EMML profile pages.
</b>

##Syntax

<table class="re-table"><tr><th class="tableHeading">emmlProfile (Module) &lt;META&gt; Syntax
</th></tr><tr><td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="EMMLProfile" content="parameter:value"&gt;</p></td></tr></table>
<table class="re-table"><tr><th class="tableHeading">EmmlProfile JavaScript Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the JavaScript Object <b>'emmlProfile'</b> will exist on the current page and can be used to interact directly with the emmlProfile.
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Set emmlProfile parameters via JavaScript use the following syntax: emmlprofile.parameter = 'value'; remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>emmlProfile</b>.name = 'value';
</td></tr><tr><td class="clsSyntaxCells clsOddRow">							
To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: emmlprofile.setEMML("[Your EMML Tags]");
<P />
e.g. <b>emmlProfile</b>.setEMML("name:<i>value</i>");							
</td></tr></table>

<table class="re-table"><tr><th class="tableHeading">EmmlProfile Ruby Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the Ruby Object <b>'EmmlProfile'</b> will exist on the current page and can be used to interact directly with the EmmlProfile. All Methods, Parameters and Events are the same as JavaScript, however, notice <b>'EmmlProfile'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b></td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Set EmmlProfile parameters via Ruby use the following syntax: EmmlProfile.parameter = 'value' remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>EmmlProfile</b>.name = 'value'
</td></tr><tr><td class="clsSyntaxCells clsOddRow" /></tr></table>




##Parameters


Items listed in this section indicate parameters, or attributes which can be set.
<table class="re-table"><col width="20%" /><col width="20%" /><col width="38%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Possible Values</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>name:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">[optional name] (see remarks below)</td><td class="clsSyntaxCells clsOddRow">Imports the EMML profile page stored at the local specified by "importProfile". Nb. This parameter should come before the related import profile method.</td><td class="clsSyntaxCells clsOddRow">N/A</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>importProfile:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">url('URI')</td><td class="clsSyntaxCells clsEvenRow">http or file location of the .emmp file containing the EMML profiles to be imported.</td><td class="clsSyntaxCells clsEvenRow">N/A</td></tr><tr><td class="clsSyntaxCells clsOddRow"><b>clear:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">[optional name] (see remarks below)</td><td class="clsSyntaxCells clsOddRow">Clears the currently loaded EMML profiles.</td><td class="clsSyntaxCells clsOddRow">N/A</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>apply:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">[profile class name]</td><td class="clsSyntaxCells clsEvenRow">Applies the EMML profile with the class name specified. </td><td class="clsSyntaxCells clsEvenRow">N/A</td></tr></table>
<table class="re-table"><col width="78%" /><col width="8%" /><col width="1%" /><col width="5%" /><col width="1%" /><col width="5%" /><col width="2%" /></table>




##Remarks


###Named Profile Pages
Normally, when importing a profile page, the imported profiles will be cleared from memory when the page is navigated away from. If you provide a name when importing a profile page, the imported profiles will not be cleared on page navigation and you will be able to reference them until you manually clear the profiles. To reference a named imported profile, prefix the profile class name with the name you supplied when importing the profile page (see example above). Naming profile pages can improve performance. If you include many profiles for your application within the profile page, it will only have to be downloaded, parsed and imported the once. It is often also preferable to maintain a central location for all your EMML.


###Importing Local Profiles
Importing profiles from a file:// location will cause the profile to be moved from its previous location, not copied.




##Requirements

<table class="re-table"><tr><th class="tableHeading">RhoElements Version</th><td class="clsSyntaxCell clsEvenRow">1.0.0 or above
</td></tr><tr><th class="tableHeading">Supported Devices</th><td class="clsSyntaxCell clsOddRow">All supported devices.</td></tr><tr><th class="tableHeading">Minimum Requirements</th><td class="clsSyntaxCell clsOddRow" /></tr><tr><th class="tableHeading">Persistence</th><td class="clsSyntaxCell clsEvenRow">Partially Transient - any changes made by changing parameters will be lost when navigating to a new page with the exception of when a named EMML profile set is imported.</td></tr></table>


##HTML/JavaScript Examples

The following example imports an EMML profile page into the temporary, unnamed space.
<META HTTP-Equiv="EMMLProfile" Content="importProfile:url('http://myserver/scannerparams.emmp');">
The following example imports an EMML profile page into a page persistent, named space.
<META HTTP-Equiv="EMMLProfile" Content="name:scanner_params;importProfile:url('http://myserver/scannerparams.emmp');">
The following example applies two profile classes from the temporary, unnamed space.
<META HTTP-Equiv="EMMLProfile" Content="apply:default_decoders;">
	<META HTTP-Equiv="EMMLProfile" Content="apply:inventory_decoders;">
The following example applies two profile classes from page persistent, named space.
<META HTTP-Equiv="EMMLProfile" Content="apply:scanner_params.default_decoders;">
	<META HTTP-Equiv="EMMLProfile" Content="apply:scanner_params.inventory_decoders;">
The following is an example of an EMML Profile page.
.default_decoders
	{
	  scanner-all_decoders: disabled;
	  scanner-code128other128: false;
	  scanner-code128maxlength: 10;
	  scanner-code128minlength: 1;
	  scanner-code128: enabled;
	}
	
	.inventory_decoders
	{
	  scanner-ean13converttocode128: true;
	  scanner-ean13: enabled;
	  scanner-ean8: enabled;
	  scanner-i2of5: enabled;
	  scanner-code128: enabled;
	}


