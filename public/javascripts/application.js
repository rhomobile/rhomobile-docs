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
          	  
      	  		url = '/v/' + ver;
	      	  
	      	  window.location = url; // redirect
          }
          else
          {
          	url = '/';
          	window.location = url; // redirect
          }
          return false;
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
		if (this.value == 'all')
		{
			$('.property').show();
			$('.method').show();

		}
		else
		{
			$('.property').hide();
			$('.method').hide();
			console.log(this.value);
		  	var cbClass = '.' + this.value;
				
	        $(cbClass).show();

		}
		    

	});
});

//Every resize of window
$(window).resize(sizeContent);

//Dynamically assign height
function sizeContent() {
    var newHeight = $("html").height() - $("#top_navbar").height() - 60;
    $("#rendered_topic_container").css("height", newHeight);
}
