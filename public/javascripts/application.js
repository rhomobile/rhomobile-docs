var totalAttrRange = new Array(5000,25000,50000,125000,250000,500000);
var totalSyncsRange = new Array(1000,10000,100000,500000,1000000,10000000);
var coefficient = 1.2;
var raw_data ={
"5000:1000:0:0" : "3,500",
"5000:10000:0:0" : "4,5000",
"5000:100000:0:0" : "5,50000",
"5000:50000:0:0" : "6,500000",
"5000:1000000:0:0" : "7,5000000",
"5000:10000000:0:0" : "8,50000000"}

$(document).ready(function() {
	$(".js-pjax").pjax({
		container: "#t_content",
		fragment: "#rendered_topic",
		timeout: 4000,
	});
	// Update the current topic
	$("#t_content").live('pjax:end', function(e, xhr, err) {
		// Enable previous anchor
		var prevAnchor = $('li.current a');
		prevAnchor.removeAttr('onclick');
		prevAnchor.attr('class', 'js-pjax');
		
		// Remove style of previous topic
		$('li.current').removeClass('current');
		
		// Update style of current topic
		var cur = $('a[href$="' + $(location).attr("pathname") + '"]');
		cur.attr('onclick', 'return false');
		cur.parent().attr('class', 'current');
		$(window).scrollTop(0);
	});
	$('.accordion-heading > a').live('click',function(){
	  $(this).find('i').toggleClass('icon-minus').toggleClass('icon-plus');
	});
	$('#calc-submit').live('click',function(e){
		e.preventDefault();
		var numObj   = $("#num_obj").val();
		var numAttr  = $("#num_attr").val();
		var numDvces = $("#num_devices").val();
		var avgResp  = $("#avg_resp").val();
		var syncFreq = $("#sync_freq").val();
		var numObj   = $("#num_obj").val();
		var numUp    = $("#num_up").val();
		var hash_res;
		var key;
		
		var total_attr  = numObj * numAttr;
		var total_syncs = numDvces * syncFreq;
		
		if(total_attr < 1 || total_attr > totalAttrRange[totalAttrRange.length-1] || total_syncs < 1 || total_syncs > totalSyncsRange[totalSyncsRange.length-1]){
			hash_res = "Data out of boundaries";
		}
		else{
			key  = get_boundary('totalAttrRange',total_attr) + ":" + get_boundary('totalSyncsRange',total_syncs) + ':0:0'
			hash_res = raw_data[key];;
		}
		
		//var cores = 5;
		//var ram   = 2000;
		//var units = 'MB';
		//if(ram > 1024){
		//	ram     = ram/1024;
		//	ram_res = Math.round(ram*100)/100
		//	units   = 'GB';
	   //	}
		$("td#cores")[0].innerHTML = hash_res;
		//$("td#ram")[0].innerHTML = ram_res;
		//$("td#ram_units")[0].innerHTML = units;
		$("table#table-res").css("display","block");
		$("input#entry_0").val(numObj);
		$("input#entry_2").val(numAttr);
		$("input#entry_3").val(numDvces);
		$("input#entry_4").val(syncFreq);
		$("input#entry_5").val(key);
		$("input#entry_6").val(hash_res);
		$("input#entry_8").val(navigator.userAgent);
		$.getJSON("http://jsonip.appspot.com?callback=?",
		    function(data){
		       	$("input#entry_7").val(data.ip);
				$('#submitme')[0].click();
		 });
		
	});
});

function get_boundary(name,value){
	var result = undefined;
	value = parseInt(value);
	arr   = eval(name);
	
    for(var i=0;i < arr.length;i++){
		if(value < arr[i+1] * coefficient){
			result = arr[i];
			break;
		}
	}
	
	return result;
}