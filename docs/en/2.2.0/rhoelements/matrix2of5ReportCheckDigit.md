
#Matrix2of5reportCheckDigit Decoder Setting

<b>
The Matrix2of5reportCheckDigit Decoder Setting is used to set the matrix2of5 ReportCheckDigit property which enables reporting of the bar code check digit(s).
</b>

##Syntax

<table class="re-table"><tr><th class="tableHeading">matrix2of5reportCheckDigit (Decoder Setting) &lt;META&gt; Syntax
</th></tr><tr><td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="scanner" content="matrix2of5ReportCheckDigit:[parameter]"&gt;</p></td></tr></table>
<table class="re-table"><tr><th class="tableHeading">matrix2of5reportCheckDigit JavaScript Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the JavaScript Object <b>'scanner'</b> will exist on the current page and can be used to interact directly with the matrix2of5reportCheckDigit.
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Set matrix2of5reportCheckDigit parameters via JavaScript use the following syntax: scanner.Parameter = Value;
<P />e.g. <b>scanner</b>.matrix2of5reportCheckDigit = Value;
</td></tr></table>
<table class="re-table"><tr><th class="tableHeading">Matrix2of5reportCheckDigit Ruby Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the Ruby Object <b>'Scanner'</b> will exist on the current page and can be used to interact directly with the Matrix2of5reportCheckDigit.
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Set Matrix2of5reportCheckDigit parameters via Ruby use the following syntax: Scanner.Parameter = Value
<P />e.g. <b>Scanner</b>.matrix2of5reportCheckDigit = Value
</td></tr></table>



##Parameters


Items listed in this section indicate parameters, or attributes which can be set.
<table class="re-table"><col width="20%" /><col width="20%" /><col width="38%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Possible Values</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>matrix2of5reportCheckDigit:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">true/false</td><td class="clsSyntaxCells clsOddRow">Enables/Disables reporting of the check digit.  For this property to have any effect matrix2of5verifyCheckDigit needs to be set to true</td><td class="clsSyntaxCells clsOddRow">Device specific</td></tr></table>
<table class="re-table"><col width="78%" /><col width="8%" /><col width="1%" /><col width="5%" /><col width="1%" /><col width="5%" /><col width="2%" /></table>





##Requirements

<table class="re-table"><tr><th class="tableHeading">RhoElements Version</th><td class="clsSyntaxCell clsEvenRow">1.0.0 or above
</td></tr><tr><th class="tableHeading">Supported Devices</th><td class="clsSyntaxCell clsOddRow">All supported devices except: Enterprise Tablet.</td></tr><tr><th class="tableHeading">Minimum Requirements</th><td class="clsSyntaxCell clsOddRow">Scanner or Imager module and device that supports matrix2of5.</td></tr><tr><th class="tableHeading">Persistence</th><td class="clsSyntaxCell clsEvenRow">Transient - Decoder settings are only guaranteed to persist until the Scanner is disabled</td></tr></table>


##HTML/JavaScript Examples

The following example enables the scanner to read only matrix2of5 labels with the ReportCheckDigit property set:

	<META HTTP-Equiv="scanner" Content="matrix2of5:enabled">
	<META HTTP-Equiv="scanner" Content="matrix2of5VerifyCheckDigit:true">
	<META HTTP-Equiv="scanner" Content="matrix2of5ReportCheckDigit:true">
	<META HTTP-Equiv="scanner" Content="enabled">
	


