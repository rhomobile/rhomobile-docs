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
		$(this).find('i').toggleClass('icon-chevron-up').toggleClass('icon-chevron-down');
	});
});
