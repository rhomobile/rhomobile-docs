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
});