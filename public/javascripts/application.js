$(document).ready(function() {
	$(".js-pjax").pjax({
		container: "#t_content",
		fragment: "#rendered_topic",
		timeout: 4000
	});
	// Update the current topic
	$("#t_content").live('pjax:end', function(e, xhr, err) {
		// Enable previous anchor
		var prevAnchor = $('li.active a');
		console.log(prevAnchor);
		prevAnchor.removeAttr('onclick');
		prevAnchor.attr('class', 'js-pjax');
		
		// Remove style of previous topic
		 $('ul.nav-list > li.active').removeClass('active');
		
		// Update style of current topic
		var cur = $('a[href$="' + $(location).attr("pathname") + '"]');
		cur.attr('onclick', 'return false');
		cur.parent().attr('class', 'active');
		$(window).scrollTop(0);
	});
	$('.accordion-heading > li').live('click',function(){
		$(this).find('i').toggleClass('icon-chevron-right').toggleClass('icon-chevron-down');
	});
	//Change url to include version
	$('#version_select').bind('change', function () {
          var ver = $(this).val(); // get selected value
          if (ver) { // require a URL
          	  
      	  		url = '/en/' + ver;
	      	  newurl =window.location.protocol + "//" + window.location.host + url ;//+ window.location.pathname;
	      	  
          }
          else
          {
          	url = '';
          	pathname = window.location.pathname.replace('/en/2.2',''); // need to change to regex
          	newurl = window.location.protocol + "//" + window.location.host + url;// + pathname; // redirect
          }
          // console.log(newurl);
          window.location = newurl;
          return false;
      });

  $('.bxslider').bxSlider({
      video: true,
      useCSS: false
    });

	sizeContent();
	$(".apiCheckbox").bind('change', function() {
		$('.property').hide();
		$('.method').hide();
		$( ".apiCheckbox" ).each(function( index ) {
		  console.log( index + ": " + this.checked + ":" + this.value );
			  var cbClass = '.' + this.value;
			if(this.checked) {
		        $(cbClass).show();
		    }
		});
	});
$(".apiFilter").bind('change', function() {

		// console.log(this);
		if ($(".apiFilter option:selected").text() == "All")
		{
			$("#apiFilterBtn").html('<i class="icon-filter "></i> Show');

		}
		else
		{
			$("#apiFilterBtn").html('<i class="icon-filter "></i>' + $(".apiFilter option:selected").text());

		}
		if (this.value == 'all')
		{
			$('.property').show();
			$('.method').show();

		}
		else
		{
			$('.property').hide();
			$('.method').hide();
			// console.log(this.value);
		  	var cbClass = '.' + this.value;
				
	        $(cbClass).show();

		}
		    

	});

	$(".icon-bug").parent().click(function(){
	    var url = "http://github.com/rhomobile/rhomobile-docs/issues/new?title=Doc Issue:" + document.title + '&body=' + encodeURIComponent('Bad Link: ' + window.location.href + ' came from: ' + document.referrer);
	    window.open(url);

	});


	//search handler for filtering
	$('#facets > .filter').click(function(e){
		var docCatKey = $(this).attr('data-id');
		var docCat = $(this).attr('data-type');
		var sCats = [];
		var sVers = [];
		
		if ($(this).attr('data-selected') == 'true'){
			$(this).attr('data-selected','false');
		}
		else{
			$(this).attr('data-selected','true');
		}
		$('#facets > span[data-selected="true"][data-type="category"]').each(function() {
		    // do something
		    sCats.push($(this).attr('data-id'));
		});
		$('#facets > span[data-selected="true"][data-type="version"]').each(function() {
		    // do something
		    sVers.push($(this).attr('data-id'));
		});
		
		
		window.location=window.location.protocol + '//' + window.location.host + window.location.pathname + '?q=' + $('#facets').attr('data-query') + '&c=' + sCats.join(",") + '&v=' + sVers.join(",");
	});

	$('#facets > span[data-type="all"]').click(function(e){
		window.location=window.location.protocol + '//' + window.location.host + window.location.pathname + '?q=' + $('#facets').attr('data-query');
	});

	$("#searchForm").indextank_Ize('http://rd4f.api.searchify.com', 'rhodocs');
    // let the query box have autocomplete
    $("#query").indextank_Autocomplete();
	
});



//Every resize of window
$(window).resize(sizeContent);

//Dynamically assign height
function sizeContent() {
    var newHeight = $("html").height() - $("#top_navbar").height() - 130;
    $("#apibody").css("height", newHeight);
}
