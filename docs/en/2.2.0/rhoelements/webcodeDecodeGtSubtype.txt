
#WebcodeDecodeGtSubtype Decoder Setting

<b>
The WebcodeDecodeGtSubtype Decoder Setting is used to set the webcodeDecodeGtSubtype property.
</b>

##Syntax

<table class="re-table"><tr><th class="tableHeading">webcodeDecodeGtSubtype (Decoder Setting) &lt;META&gt; Syntax
</th></tr><tr><td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="scanner" content="webcodeDecodeGtSubtype:[parameter]"&gt;</p></td></tr></table>
<table class="re-table"><tr><th class="tableHeading">webcodeDecodeGtSubtype JavaScript Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the JavaScript Object <b>'scanner'</b> will exist on the current page and can be used to interact directly with the webcodeDecodeGtSubtype.
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Set webcodeDecodeGtSubtype parameters via JavaScript use the following syntax: scanner.Parameter = Value;
<P />e.g. <b>scanner</b>.webcodeDecodeGtSubtype = Value;
</td></tr></table>
<table class="re-table"><tr><th class="tableHeading">WebcodeDecodeGtSubtype Ruby Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the Ruby Object <b>'Scanner'</b> will exist on the current page and can be used to interact directly with the WebcodeDecodeGtSubtype.
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Set WebcodeDecodeGtSubtype parameters via Ruby use the following syntax: Scanner.Parameter = Value
<P />e.g. <b>Scanner</b>.webcodeDecodeGtSubtype = Value
</td></tr></table>



##Parameters


Items listed in this section indicate parameters, or attributes which can be set.
<table class="re-table"><col width="20%" /><col width="20%" /><col width="38%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Possible Values</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>webcodeDecodeGtSubtype:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">true / false</td><td class="clsSyntaxCells clsOddRow">If true, GT Webcode subtype will be decoded.</td><td class="clsSyntaxCells clsOddRow">Device specific</td></tr></table>
<table class="re-table"><col width="78%" /><col width="8%" /><col width="1%" /><col width="5%" /><col width="1%" /><col width="5%" /><col width="2%" /></table>





##Requirements

<table class="re-table"><tr><th class="tableHeading">RhoElements Version</th><td class="clsSyntaxCell clsEvenRow">1.0.0 or above
</td></tr><tr><th class="tableHeading">Supported Devices</th><td class="clsSyntaxCell clsOddRow">All supported devices.</td></tr><tr><th class="tableHeading">Minimum Requirements</th><td class="clsSyntaxCell clsOddRow">Scanner or Imager module and device that supports Webcode.</td></tr><tr><th class="tableHeading">Persistence</th><td class="clsSyntaxCell clsEvenRow">Transient - Decoder settings are only guaranteed to persist until the Scanner is disabled</td></tr></table>


##HTML/JavaScript Examples

The following example enables the scanner and sets webcodeDecodeGtSubtype property

	<META HTTP-Equiv="scanner" Content="webcode:enabled">
	<META HTTP-Equiv="scanner" Content="webcodeDecodeGtSubtype:true">
	<META HTTP-Equiv="scanner" Content="enabled">
					


