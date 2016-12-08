<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>

<script type='text/javascript'>
$(function(){
	var fileRef = document.createElement('script');
	fileRef.setAttribute("type","text/javascript");
	fileRef.setAttribute("src", "https://s3.amazonaws.com/rhoconnect-calc/raw_data.js");
	document.body.appendChild(fileRef);
});

var totalAttrRange = new Array(5000,25000,50000,125000,250000,500000);
var totalSyncsRange = new Array(1000,10000,100000,500000,1000000,10000000);
var coefficient = 1.2;

$('#calc-submit').live('click',function(e){
	e.preventDefault();
	var numObj   = $("#num_obj").val();
	var numAttr  = $("#num_attr").val();
	var numDvces = $("#num_devices").val();
	var avgResp  = $("#avg_resp").val();
	var syncFreq = $("#sync_freq").val();
	var numObj   = $("#num_obj").val();
	var numUp    = $("#num_up").val();
	var res;
	var cores;
	var ram;
	var key;
	
	var total_attr  = numObj * numAttr;
	var total_syncs = numDvces * syncFreq;
	
	key = get_boundary('totalAttrRange',total_attr) + ":" + get_boundary('totalSyncsRange',total_syncs) + ':0:0';
	res = raw_data[key];
	ram = (total_attr/10000) * numDvces * 1.2* 0.001;
	ram = Math.round(ram * 100)/100;
	ram += " GB"; 
	if(res == undefined){
		cores = "data not available";
		result   = ram + ",data not available";
	}
	else{
		cores  = res;
		result = ram + ", " + cores; 
	}
	
	$("td#cores")[0].innerHTML = cores;
	$("td#ram")[0].innerHTML   = ram;
	$("#output").css("display","block");
	$("#table-res").effect("highlight", {}, 1000);
	$("input#entry_0").val(numObj);
	$("input#entry_2").val(numAttr);
	$("input#entry_3").val(numDvces);
	$("input#entry_4").val(syncFreq);
	$("input#entry_5").val(key);
	$("input#entry_6").val(result);
	$("input#entry_8").val(navigator.userAgent);
	$.getJSON("http://h3manth.com/ip.php?callback=?",
	    function(data){
	       	$("input#entry_7").val(data.ip);
			$('#submitme')[0].click();
	 });
	$.ajax({
	  url: "http://h3manth.com/ip.php?callback=?",
	  dataType: 'json',
	  success: function(data){
		$("input#entry_7").val(data.ip);
		$('#submitme')[0].click();
	  },
	  error: function(){
		$("input#entry_7").val("error getting ip");
		$('#submitme')[0].click();
	  }
	});
});
function get_boundary(name,value){
	var result = undefined;
	value = parseInt(value);
	arr   = eval(name);
	
    for(var i=0;i < arr.length;i++){
		if(value < arr[i] * coefficient){
			result = arr[i];
			break;
		}
	}
	
	return result;
}
</script>
RhoConnect Calculator
==========
The RhoConnect Calculator helps you estimate the number of processor cores and redis server RAM required to deploy a RhoConnect Production environment.

1 core equals 1 processor (at 2 GHz) running two thin processes.

<div id='output' class='pull-right' style='padding:25px 25px 0 0;display:none'>
	Result:
	<table id='table-res' class='table table=bordered'>
	<tr>
		<td>Number of Cores:</td><td id='cores'></td><td></td>
	</tr>
	<tr>
		<td>Redis RAM:</td><td id='ram'></td><td id='ram_units'></td>
	</tr>
	</table>
</div>
<form id='calc-form' class='well form'>
<label>Number of Objects</label>
<input id='num_obj' type='number' class='input-xlarge' />
<label>Number of Attributes per Object</label>
<input id='num_attr' type='number' class='input-xlarge' />
<label>Number of Devices</label>
<input id='num_devices' type='number' class='input-xlarge' />
<label>Sync Frequency</label>
<div class='input-append'>
<input id='sync_freq' id='appendInput' type='number' class='span2' size='16'/>
<span class='add-on' style='margin-top:2px'>syncs per day</span>
</div>
<div style='display:none'>
<label>Your Average Web Service Response Time</label>
<input id='avg_resp' type='number' class='input-xlarge' value='0' disabled="disabled"/>
<label>Number of Updates per Day</label>
<input id='num_up' type='number' class='input-xlarge' disabled="disabled" value='0' /><br/>
</div>
<button id='calc-submit' type'submit' class='btn btn-primary'>Submit</button>
</form>

**NOTE: High Availability (HA) is not included into these numbers.  So if your environment must provide HA, you will need to include enough extra storage and processor capacity in case of hardware failure.**

### Calculator Fields
<ul>
<li><b>Number of Objects</b> - The number of objects across all of your models.  If you have 10 models with 10 objects for each model, you would enter 100.</li>
<li><b>Number of Attributes per Object</b> - The average number of attributes per object. E.g. if you have 2 objects, 1 with 10 attributes and 1 with 12 attributes, you would enter 11.</li>
<li><b>Number of devices</b> - The total number of devices that will be using RhoConnect.</li>
<li><b>Sync Frequency</b> - The average sync frequency per device. E.g if you have 2 devices where one syncs 10 times per day and one sync 12 times per day, you would enter 11.</li>
</ul>

### Result
<ul>
<li><b>Number of Cores</b> - The number of processor cores required (could be distributed across N number of servers).</li>
<li><b>Redis RAM</b> – RAM required for the master Redis instance.  Currently only one master Redis instance can be defined.  A typical deployment involves one master Redis instance (with no disk persistence) and N number of read-slaves (with persistence).  Slave disk persistence would need at least 2X disk capacity where X is the master instance RAM requirement.</li>
</ul>



<script type="text/javascript">var submitted=false;</script>
<iframe name="hidden_iframe" id="hidden_iframe" style="display:none;" onload="if(submitted){}"></iframe>
<div style='display:none'>
  <form id='gform' action="https://docs.google.com/a/rhomobile.com/spreadsheet/formResponse?formkey=dDBJeUVBQnNnTW1tWGZOSWNRbG84OFE6MQ&amp;ifq" method="post" target="hidden_iframe" onsubmit="submitted=true;" style='display:block'>
  <br>
  <div class="errorbox-good">
    <div class="ss-item  ss-text">
 	  <div class="ss-form-entry">
	    <label class="ss-q-title" for="entry_0">Number of Objects</label>
  		<label class="ss-q-help" for="entry_0"></label>
  		<input type="text" name="entry.0.single" value="" class="ss-q-short" id="entry_0">
 	  </div>
     </div>
  </div>
  <br>
  <div class="errorbox-good">
    <div class="ss-item  ss-text">
      <div class="ss-form-entry">
        <label class="ss-q-title" for="entry_2">Number of Attributes</label>
  	    <label class="ss-q-help" for="entry_2"></label>
        <input type="text" name="entry.2.single" value="" class="ss-q-short" id="entry_2">
      </div>
    </div>
  </div>
  <br>
  <div class="errorbox-good">
    <div class="ss-item  ss-text">
      <div class="ss-form-entry">
        <label class="ss-q-title" for="entry_3">Number of Devices</label>
  	    <label class="ss-q-help" for="entry_3"></label>
        <input type="text" name="entry.3.single" value="" class="ss-q-short" id="entry_3">
      </div>
    </div>
  </div>
  <br>
  <div class="errorbox-good">
    <div class="ss-item  ss-text">
      <div class="ss-form-entry">
        <label class="ss-q-title" for="entry_4">Sync Freq</label>
  	    <label class="ss-q-help" for="entry_4"></label>
        <input type="text" name="entry.4.single" value="" class="ss-q-short" id="entry_4">
      </div>
    </div>
  </div>
  <br>
  <div class="errorbox-good">
    <div class="ss-item  ss-text">
      <div class="ss-form-entry">
        <label class="ss-q-title" for="entry_5">key</label>
  	    <label class="ss-q-help" for="entry_5"></label>
        <input type="text" name="entry.5.single" value="" class="ss-q-short" id="entry_5">
      </div>
    </div>
  </div>
  <br>
  <div class="errorbox-good">
    <div class="ss-item  ss-text">
      <div class="ss-form-entry">
        <label class="ss-q-title" for="entry_6">value</label>
  	    <label class="ss-q-help" for="entry_6"></label>
        <input type="text" name="entry.6.single" value="" class="ss-q-short" id="entry_6">
      </div>
    </div>
  </div>
  <br>
  <div class="errorbox-good">
    <div class="ss-item  ss-text">
      <div class="ss-form-entry">
        <label class="ss-q-title" for="entry_7">ip</label>
  	    <label class="ss-q-help" for="entry_7"></label>
        <input type="text" name="entry.7.single" value="" class="ss-q-short" id="entry_7">
      </div>
    </div>
  </div>
  <div class="errorbox-good">
    <div class="ss-item  ss-text">
      <div class="ss-form-entry">
        <label class="ss-q-title" for="entry_8">User Agent</label>
  	    <label class="ss-q-help" for="entry_8"></label>
        <input type="text" name="entry.8.single" value="" class="ss-q-short" id="entry_8">
      </div>
    </div>
  </div>
  <input type="hidden" name="pageNumber" value="0">
  <input type="hidden" name="backupCache" value="">
  <div class="ss-item ss-navigate">
	<div class="ss-form-entry">
		<input type="submit" name="submit" value="Submit" id='submitme'>
	</div>
  </div>
</form>
</div>