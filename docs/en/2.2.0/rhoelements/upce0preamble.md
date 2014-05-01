
#Upce0preamble Decoder Setting

<b>
The Upce0preamble Decoder Setting is to set the upce0-preamble property which controls the preamble applied to the bar code.
</b>

##Syntax

<table class="re-table"><tr><th class="tableHeading">upce0preamble (Decoder Setting) &lt;META&gt; Syntax
</th></tr><tr><td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="scanner" content="upce0preamble:[parameter]"&gt;</p></td></tr></table>
<table class="re-table"><tr><th class="tableHeading">upce0preamble JavaScript Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the JavaScript Object <b>'scanner'</b> will exist on the current page and can be used to interact directly with the upce0preamble.
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Set upce0preamble parameters via JavaScript use the following syntax: scanner.Parameter = Value;
<P />e.g. <b>scanner</b>.upce0preamble = Value;
</td></tr></table>
<table class="re-table"><tr><th class="tableHeading">Upce0preamble Ruby Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the Ruby Object <b>'Scanner'</b> will exist on the current page and can be used to interact directly with the Upce0preamble.
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Set Upce0preamble parameters via Ruby use the following syntax: Scanner.Parameter = Value
<P />e.g. <b>Scanner</b>.upce0preamble = Value
</td></tr></table>



##Parameters


Items listed in this section indicate parameters, or attributes which can be set.
<table class="re-table"><col width="20%" /><col width="20%" /><col width="38%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Possible Values</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>upce0preamble:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">none / systemChar / countryAndSystemChars</td><td class="clsSyntaxCells clsOddRow">if none Applies no preamble to the bar code.if systemChar Applies system character preamble to the bar code.if countryAndSystemChars Applies both system and country code preamble to the bar code.</td><td class="clsSyntaxCells clsOddRow">Device specific</td></tr></table>
<table class="re-table"><col width="78%" /><col width="8%" /><col width="1%" /><col width="5%" /><col width="1%" /><col width="5%" /><col width="2%" /></table>





##Requirements

<table class="re-table"><tr><th class="tableHeading">RhoElements Version</th><td class="clsSyntaxCell clsEvenRow">1.0.0 or above
</td></tr><tr><th class="tableHeading">Supported Devices</th><td class="clsSyntaxCell clsOddRow">All supported devices.</td></tr><tr><th class="tableHeading">Minimum Requirements</th><td class="clsSyntaxCell clsOddRow">Scanner or Imager module and device that supports upce0.</td></tr><tr><th class="tableHeading">Persistence</th><td class="clsSyntaxCell clsEvenRow">Transient - Decoder settings are only guaranteed to persist until the Scanner is disabled</td></tr></table>


##HTML/JavaScript Examples

The following example enables the scanner to read only upce0 labels with the preamble property set to both system and country code preamble:

	<META HTTP-Equiv="scanner" Content="upce0:enabled">
	<META HTTP-Equiv="scanner" Content="upce0preamble:countryAndSystemChars">
	<META HTTP-Equiv="scanner" Content="enabled">
	
Above example can also be written as shown below:

	<META HTTP-Equiv="scanner" Content="upce0:enabled;upce0preamble:countryAndSystemChars;enabled">
	
or

	<META HTTP-Equiv="scanner-upce0" Content="enabled">
	<META HTTP-Equiv="scanner-upce0preamble" Content="countryAndSystemChars">
	<META HTTP-Equiv="scanner-enabled" Content="SCN1">
	


