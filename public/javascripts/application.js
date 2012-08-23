var totalAttrRange = new Array(5000,25000,50000,125000,250000,500000);
var totalSyncsRange = new Array(1000,10000,100000,500000,1000000,10000000);
var coefficient = 1.2;
var raw_data ={
"5000:10000:0:0" : "2 cores,150 MB redis",
"25000:10000:0:0" : "2 cores,300 MB redis",
"50000:10000:0:0" : "4 cores,750 MB redis",
"125000:10000:0:0" : "4 cores,2 GB redis",
"250000:10000:0:0" : "2 cores,300 MB redis",
"500000:10000:0:0" : "2 cores,300 MB redis",
}

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
		var res;
		var cores;
		var ram;
		var key;
		var arr_res;
		
		var total_attr  = numObj * numAttr;
		var total_syncs = numDvces * syncFreq;
		
		if(total_attr < 1 || total_attr > totalAttrRange[totalAttrRange.length-1] || total_syncs < 1 || total_syncs > totalSyncsRange[totalSyncsRange.length-1]){
			cores = "data not available";
			ram   = "data not available";
			res   = "data not available";
		}
		else{
			key  = get_boundary('totalAttrRange',total_attr) + ":" + get_boundary('totalSyncsRange',total_syncs) + ':0:0';
			res = raw_data[key];
			if(res == undefined){
				cores = "data not available";
				ram   = "data not available";
				res   = "data not available";
			}
			else{
				arr_res  = res.split(',');
				cores    = arr_res[0];
				ram		 = arr_res[1];
			}
		}
		
	
		$("td#cores")[0].innerHTML = cores;
		$("td#ram")[0].innerHTML   = ram;
		$("table#table-res").css("display","block");
		$("input#entry_0").val(numObj);
		$("input#entry_2").val(numAttr);
		$("input#entry_3").val(numDvces);
		$("input#entry_4").val(syncFreq);
		$("input#entry_5").val(key);
		$("input#entry_6").val(res);
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