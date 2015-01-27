# Compatibility Matrix
<div id="toolbar" >
	<button class="btn btn-primary" id="btnFilter"><i class="glyphicon glyphicon-filter"></i> (<span id="condition">Any</span>)</button>
	<select id="engines" multiple="multiple">
	</select>
	<select id="os" multiple="multiple">
	</select>
</div>
The filter option below allows you to change between:

* Filter operator:
	* All : both Engine and Operating System selections must be matched
	* Any : either the Engine or the Operating System selection may be matched
* Engine:
	* IE : Internet Explorer Engine (Windows Mobile / CE)
	* Webkit:
		* Android devices use the stock webkit provided by Android
		* Windows Mobile/CE devices use the Zebra Technologies Webkit
* Operating System:
	* WM : Windows Mobile
	* CE : Windows CE
	* Android : Android


<table id="table" 
	data-search="true"
	data-show-columns="true"
	data-toolbar="#toolbar">
    <thead>
    <tr>
        <th data-field="api">Api</th>
        <th data-field="engines">Engines</th>
        <th data-field="os">Operating System</th>
    </tr>
    </thead>
</table>
