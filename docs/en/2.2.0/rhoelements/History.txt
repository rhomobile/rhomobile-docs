
#History META Tag

<b>
The History META Tag is an action tag used to navigate forward or backward through the page history.
</b>

##Syntax

<table class="re-table"><tr><th class="tableHeading">history (META Tag) &lt;META&gt; Syntax
</th></tr><tr><td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="History" content="Back:1"&gt;</p></td></tr><tr><td class="clsSyntaxCells clsEvenRow"><p>&lt;META HTTP-Equiv="History-Back" contents="1"&gt;</p></td></tr></table>
<table class="re-table"><tr><th class="tableHeading">History JavaScript Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the JavaScript Object <b>'history'</b> will exist on the current page and can be used to interact directly with the history.
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Invoke history methods via JavaScript use the following syntax: history.method();
<P />e.g. <b>history</b>.back();
</td></tr><tr><td class="clsSyntaxCells clsOddRow">
To Set history parameters via JavaScript use the following syntax: history.parameter = 'value'; remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>history</b>.back = 'value';
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">							
To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: history.setEMML("[Your EMML Tags]");
<P />
e.g. <b>history</b>.setEMML("back:<i>value</i>back");							
</td></tr></table>

<table class="re-table"><tr><th class="tableHeading">History Ruby Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the Ruby Object <b>'History'</b> will exist on the current page and can be used to interact directly with the History. All Methods, Parameters and Events are the same as JavaScript, however, notice <b>'History'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b></td></tr><tr><td class="clsSyntaxCells clsEvenRow">
To Invoke History methods via Ruby use the following syntax: History.method()
<P />e.g. <b>History</b>.back</td></tr><tr><td class="clsSyntaxCells clsOddRow">
To Set History parameters via Ruby use the following syntax: History.parameter = 'value' remembering to enclose your value in quotes where appropriate.  
<P />e.g. <b>History</b>.back = 'value'
</td></tr><tr><td class="clsSyntaxCells clsEvenRow" /></tr></table>


	

##Methods


Items listed in this section indicate methods or, in some cases, indicate parameters which will be retrieved.

<table class="re-table"><col width="10%" /><col width="68%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>back</b></td><td class="clsSyntaxCells clsOddRow">Navigates back one page in the browser history.  This tag will have no effect if there is no browser history.</td><td class="clsSyntaxCells clsOddRow">
N/A
</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>forward</b></td><td class="clsSyntaxCells clsEvenRow">Navigates forward one page in the browser history.  This tag will have no effect if not predicated by a 'Back' command.</td><td class="clsSyntaxCells clsEvenRow">
N/A
</td></tr></table>
<table class="re-table"><col width="78%" /><col width="8%" /><col width="1%" /><col width="5%" /><col width="1%" /><col width="5%" /><col width="2%" /></table>

##Parameters


Items listed in this section indicate parameters, or attributes which can be set.
<table class="re-table"><col width="20%" /><col width="20%" /><col width="38%" /><col width="22%" /><tr><th class="tableHeading">Name</th><th class="tableHeading">Possible Values</th><th class="tableHeading">Description</th><th class="tableHeading">Default Value</th></tr><tr><td class="clsSyntaxCells clsOddRow"><b>back:[Value]
</b></td><td class="clsSyntaxCells clsOddRow">Positive Integer specifying the number of pages to navigate back</td><td class="clsSyntaxCells clsOddRow">
                    Navigates back the specified number of pages in the browser history.  This tag will have no effect if there is no browser history.
                </td><td class="clsSyntaxCells clsOddRow">1.  See parameters without attributes section.</td></tr><tr><td class="clsSyntaxCells clsEvenRow"><b>forward:[Value]
</b></td><td class="clsSyntaxCells clsEvenRow">Positive Integer specifying the number of pages to navigate forward</td><td class="clsSyntaxCells clsEvenRow">
                    Navigates forward the specified number of pages in the browser history.  This tag will have no effect if there is no browser history.
                </td><td class="clsSyntaxCells clsEvenRow">1.  See parameters without attributes section.</td></tr></table>
<table class="re-table"><col width="78%" /><col width="8%" /><col width="1%" /><col width="5%" /><col width="1%" /><col width="5%" /><col width="2%" /></table>




##Remarks


###Deprecation
This tag deprecates the history:back URL




##Requirements

<table class="re-table"><tr><th class="tableHeading">RhoElements Version</th><td class="clsSyntaxCell clsEvenRow">N/A or above
</td></tr><tr><th class="tableHeading">Supported Devices</th><td class="clsSyntaxCell clsOddRow">Windows CE, Windows Mobile, Windows Mobile SE</td></tr><tr><th class="tableHeading">Minimum Requirements</th><td class="clsSyntaxCell clsOddRow">RhoElements</td></tr><tr><th class="tableHeading">Persistence</th><td class="clsSyntaxCell clsEvenRow">This tag is page specific and is actioned immediately.</td></tr></table>


##HTML/JavaScript Examples

The following example navigates back one page when the delete key is pressed (regardless of the Accelerate Key mode)

	<META HTTP-Equiv="AccelerateKey" Content="OFF">
	<META HTTP-Equiv="OnKey0x09" Content="onBackspacePressed">
	<script>
	    function onBackspacePressed()
	    {
	        history.back = 1;
	    }
	</script>
	


