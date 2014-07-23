var toc = null;
var spanHighlights  = null;
var spanLoc = 0;
var spanHolder = null;
var searchResults = null;

$(document).ready(function(){
	// HTML markup implementation, overlap mode
	$( '#menu' ).multilevelpushmenu({
		menu:menuStrcture,
		containersToPush: [$( '#pushobj' )],
		overlapWidth: 32,
		//Setup the look of the menu
		wrapperClass: 'mlpm_w',
		menuInactiveClass: 'mlpm_inactive',
		menuHeight: '100%',
		menuWidth:'200px',
		
		
		//Get links to work
		onItemClick: function() {
			// Get Anchor href
			$item = arguments[2]
			var itemHref = $item.find( 'a:first' ).attr( 'href' );
			// Redirecting the page
			location.href = itemHref;
			 if (itemHref.indexOf("#api-") == 0){
				//don't collapse API links in menu
			 }
			 else{
				// $('#menu').multilevelpushmenu('collapse');
			 }
		},
		onGroupItemClick: function() {
			// Get Anchor href
			$item = arguments[2]
			var itemHref = $item.find( 'a:first' ).attr( 'href' );
			//console.log(itemHref);
			// Redirecting the page
			if (itemHref != '#'){
			 location.href = itemHref;
			 if (itemHref.indexOf("#api-") == 0){
				//don't collapse API links in menu
			 }
			 else{
				// $('#menu').multilevelpushmenu('collapse');
			 }
			}
		},
		onExpandMenuEnd: function(){
			shouldSync();
		}
	});
	
	//Cutom ToC siszing
	sizeTOC();
	
	//Clear Search
	$("#searchBox").val("");

	//Bind Search
	$("#searchBox").keyup(function() {
		search();
	});
	
	//Search popover
	$("#searchBox").popover();
	
	//Verson popover
	$("#versions").popover();
	var popover = $("#versions").data('bs.popover');
	var html = "";
	
	for(var i = 0; i<versionsList.length; i++)
	{
		html += '<li><div class="versionLink" data-link="' + versionsList[i].page + '">' + versionsList[i].Number + '</div></li>';
	}
	
	popover.options.content = '<div><ul class="nav nav-list">' + html + '</ul></div>';
	
	$("#versions").click(function() {
		$(".versionLink").click(function() {
			var newLink = $(this).attr("data-link");
			newLink += location.hash;
			window.location = newLink;
		});
	});
	
	//Check for url change
	$(window).on('hashchange', function(e)
	{
		loadHash();
	});
	
	//Check for page re size
	$(window).resize(function() {
		$("#menu").multilevelpushmenu('redraw');
		sizeTOC();
	});
	
	//Load doc
	loadHash();
	
	//Check for placeholder
	if (document.createElement("input").placeholder == undefined) {
		$("#searchBox").val("Search");
		$("#searchBox").css("color", "#999999");
		
		$("#searchBox").blur(function() {
			if($("#searchBox").val() == "")
			{
				$("#searchBox").val("Search");
				$("#searchBox").css("color", "#999999");
			}
		});
		
		$("#searchBox").focus(function() {
			if($("#searchBox").val() == "Search")
			{
				$("#searchBox").val("");
				$("#searchBox").css("color", "#555555");
			}
		});
	}
	
	//Open search?
	$("#searchBox").focus(function() {
		if($("#searchBox").val() != "")
		{
			//Do we have results? 
			if(searchResults.length > 0)
			{
				//Show results
				$("#searchBox").popover("show");
			}
		}
	});
});

//Load document based on hash
function loadHash()
{
	var hash = location.hash.replace("#","");
	loadDoc(hash);
}

//Custom function for resizing TOC to allow for scrollable list
function sizeTOC()	
{
	var newHeight = $(window).height();
	newHeight -= $("#docsHeader").outerHeight(true);
	newHeight -=  $(".levelHolderClass h2").outerHeight(true);
	
	var uls = $(".levelHolderClass ul");
	
	for(var i = 0; i<uls.size(); i++)
	{
		if($($(uls[i]).parent()).children().size() == 2)
		{
			$(uls[i]).css("height", newHeight + 'px' );
		}
		else if($($(uls[i]).parent()).children().size() > 2)
		{
			var offset = $($($(uls[i]).parent()).children()[1]).outerHeight(true);
			$(uls[i]).css("height", (newHeight -  offset)+ 'px' );
		}
	}
}

//Should we sync the menue? 
var shouldOpen = true;
function shouldSync()
{
	if(shouldOpen)
	{
		if($('#menu').multilevelpushmenu('comparepaths', $('#menu').multilevelpushmenu('activemenu'), $('#menu').multilevelpushmenu('findmenusbytitle', 'Help'), false).length == 0)
		{
			shouldOpen = false;
			
			//console.log("Start Find");
			findHash();
			//console.log("Find Done");
		}
	}
	else
	{
		shouldOpen = true;
	}
}

//Find hash in ToC
function findHash()
{
	var hash = location.hash.replace("#","");
	
	if(hash.split("?").length>1)
	{
		hash = hash.split("?")[0];
	}
	
	//console.log("Start");
	if(hash == "")
	{
		//Load root
		$('#menu').multilevelpushmenu('expand' , $('#menu').multilevelpushmenu('findmenusbytitle', 'Help'));
	}
	else
	{	
		syncMenu(hash);
	}
	//console.log("Done");
}

//Opens the menu to match the hash value
function syncMenu(hash){
	//Try to expand the menu to the doc being shown
	var menuMatches = getObjects(menuStrcture, 'link', '#' + hash);
	//console.log("Got List");
	if(menuMatches.length>0){
		var theMenuName = "";
		if(menuMatches.length > 1){
			//Find activemenu
			var act = $('#menu').multilevelpushmenu('activemenu');
			var actPath = $('#menu').multilevelpushmenu('pathtoroot', $(act));
			
			//We are not at root
			if(actPath.length > 0){
				//Lets Search for a match
				var menuMatchArray = getArray(menuStrcture, 'link', '#' + hash);
				
				var x = 0;
				var y = 0;
				var found = false;
				
				serch:
				for(x = 0; x<menuMatchArray.length; x++)
				{
					for(y = 0; y<menuMatchArray[x].length; y++)
					{
						if(menuMatchArray[x][y].link != '#' + hash){
							var item = $('#menu').multilevelpushmenu('finditemsbyname' , menuMatchArray[x][y].name);
							
							if($('#menu').multilevelpushmenu('comparepaths', $(item), $(act), false).length == 1){
								found = true;
								break serch;
							}
						}
					}
				}
				
				if(found){
					//Use the one on this level 
					theMenuName = menuMatchArray[x][y].name;
				}
				else{
					//Jut get the first menu name from link
					theMenuName = menuMatches[0].name;
				}
			}
			else{
				//Jut get the first menu name from link
				theMenuName = menuMatches[0].name;
			}
		}
		else{
			//Get menu name from link
			theMenuName = menuMatches[0].name;
		}
				
		//get the Menu item
		theItem = $('#menu').multilevelpushmenu('finditemsbyname' , theMenuName);
		//console.log("Got Item");
		
		//get parent which should be the menu level
		var pathToRoot = undefined;
		if(theItem.length > 1){
			//Is this level already open? 
			for(var i = 0; i<theItem.length; i++)
			{
				var temp = $('#menu').multilevelpushmenu('pathtoroot', $(theItem[i]));
				
				if($('#menu').multilevelpushmenu('menuexpanded', $(temp[temp.length-2]))){
					pathToRoot = temp;
					break;
				}
			}
			
			//Still can't find? 
			if(pathToRoot == undefined){
				//Get first item
				pathToRoot = $('#menu').multilevelpushmenu('pathtoroot', $(theItem[0]));
			}
		}
		else{
			pathToRoot = $('#menu').multilevelpushmenu('pathtoroot', $(theItem[0]));
		}
		
		if(pathToRoot != false){
			parentItem = pathToRoot[pathToRoot.length-2];
			//console.log("Got Parent Item");
			
			//Check if we need to go to root
			if($('#menu').multilevelpushmenu('comparepaths', $(parentItem), $('#menu').multilevelpushmenu('findmenusbytitle', 'Help'), false).length == 0){
				//Load root
				$('#menu').multilevelpushmenu('expand' , $('#menu').multilevelpushmenu('findmenusbytitle', 'Help'));
			}
			//Check if we are here already
			else if($('#menu').multilevelpushmenu('menuexpanded', $(parentItem))){
				//Don't move
				//console.log("Dont Move");
			}
			else{
				//Expand menu to that level
				//console.log("Start Move");
				$('#menu').multilevelpushmenu( 'expand' , $(parentItem));
				//console.log("Move Done");
			}
		}
	}
}

//Loads a doc by doc Key
function loadDoc(key){
	//Close Search 
	$("#searchBox").popover("hide");

	//Load doc
	var converter = new  Markdown.Converter();
	var key_scrollto = '';
	if(key.split("?").length>1)
	{
		// Get key for scroll to
		key_scrollto = decodeURI(key.split("?")[1]);
		//reset key to be main doc key
		key = key.split("?")[0];
		//console.log(key_scrollto);
	}
	var html = "";
	
	//Check if doc exist
	if(getByKey(key) != undefined)
	{
		html = converter.makeHtml(getByKey(key).md);
	}
	else
	{
		html = converter.makeHtml(getByKey('guide-about').md);
	}

	//change code blocks
	html = html.replace(/<pre><code>(.*)/g,'<pre class="prettyprint"><code>');

	$("#markdownDoc").html(html);
	
	//Clear old ToC
	if(toc != null)
	{
		$("#toc").remove();
		toc = null;
	}
	$("#pushobj").append('<div id="toc" class="panel panel-primary"> <div class="panel-heading">IN THIS DOCUMENT &nbsp;<i class="pull-right cursorPointer fa fa-minus-square"></i><i class="pull-right cursorPointer fa fa-plus-square"></i></div><div id="inThisdoc"><div id="tocList"></div><div id="tocNav"><div id="tocNavText"></div><button type="button" class="btn btn-primary" id="btnPrevious"><i class="fa fa-arrow-circle-left"></i> Previous</button><button type="button" class="btn btn-primary" id="btnNext">Next <i class="fa fa-chevron-circle-right"></i></button></div></div></div>');
	
	//Create new ToC
	toc = $("#tocList").tocify({
		selectors: "h2,h3",
		context: "#markdownDoc",
		history:false,
		scrollTo:52
	}).data("toc-tocify");
	
	//Setup toc
	$('#toc .fa-plus-square').hide()
	$('#toc .fa-minus-square').show()

	$('#toc .fa-plus-square').click(function() {
		$('#toc .fa-plus-square').hide();
		$('#toc .fa-minus-square').show();

		$('#inThisdoc').show();
	});	
	$('#toc .fa-minus-square').click(function() {
		$('#toc .fa-plus-square').show();
		$('#toc .fa-minus-square').hide();

		$('#inThisdoc').hide();
	});	
	
	//Setup toc buttons
	$('#btnNext').click(function() {
		if(spanHolder != null)
		{
			$(spanHolder).removeClass("highlightSelected");
			spanHolder = null;
		}
	
		if(spanLoc + 1 < spanHighlights.length)
		{
			spanLoc++;
			scrollTo(spanHighlights[spanLoc]);
			spanHolder = spanHighlights[spanLoc];
			$(spanHolder).addClass("highlightSelected");
		}
		else
		{
			spanLoc = 0;
			scrollTo(spanHighlights[spanLoc]);
			spanHolder = spanHighlights[spanLoc];
			$(spanHolder).addClass("highlightSelected");
		}
	});
	$('#btnPrevious').click(function() {
		if(spanHolder != null)
		{
			$(spanHolder).removeClass("highlightSelected");
			spanHolder = null;
		}
	
		if(spanLoc > 0)
		{
			spanLoc--;
			scrollTo(spanHighlights[spanLoc]);
			spanHolder = spanHighlights[spanLoc];
			$(spanHolder).addClass("highlightSelected");
		}
		else
		{
			spanLoc = spanHighlights.length - 1;
			scrollTo(spanHighlights[spanLoc]);
			spanHolder = spanHighlights[spanLoc];
			$(spanHolder).addClass("highlightSelected");
		}
	});
	
	//hide if nothing to show
	if ($("#tocList").html() == ''){
		$('#toc').hide();
	}
	else{
		$('#toc').show();
	}
	
	//Scroll to top
	scroll_position = 0;
	if (key_scrollto != ''){
		if($('H3').filter(function() { return $.text([this]) == key_scrollto; }).length>0){
			scroll_position = $('H3').filter(function() { return $.text([this]) == key_scrollto; }).first().offset().top-$('#docsHeader').outerHeight();

		}

	}
	//console.log(scroll_position);
	$("html, body").animate({ scrollTop: scroll_position }, 500);
			!function ($) {
				$(function(){
				  window.prettyPrint && prettyPrint()
				})
	  }(window.jQuery);
	
	//Get H tags
	var hTags = $("#markdownDoc :header");
	for(var i = 0; i<hTags.length; i++)
	{
		//Allow for line wrap on pirod
		$(hTags[i]).html($(hTags[i]).html().replace(/\./g, '.&#8203;'));   
	}	
	
	//Get images
	var imgTags = $("#markdownDoc").find('img');
	for(var i = 0; i<imgTags.length; i++)
	{
		//Image Model		
		$(imgTags[i]).click(function(){
			//Set Image
			$("#modalImg").html( '<a href="' + $(this).attr("src") + '" target="_blank"><img title="" slt="img" src="' + $(this).attr("src") + '"></img></a>');
			
			//Size box
			if(this.naturalWidth  > ($(document).width()- 100))
			{
				$(".modal-dialog").css("width", ($(document).width() - 100) + "px"); 
			}
			else
			{
				$(".modal-dialog").css("width", (this.naturalWidth +44) + "px");
			}
			
			if(this.naturalHeight  > ($(window).height()- 120))
			{
				$(".modal-body").css("height", ($(window).height() - 120) + "px"); 
			}
			else
			{
				$(".modal-body").css("height", (this.naturalHeight+44) + "px");
			}
			
			//Show
			$('#basicModal').modal('show');
			
			setTimeout(function(){
				$("#modalImg").scrollTop(0);
				$("#modalImg").scrollLeft(0);
			},200);
		});
	}
	
	//Get links
	var aTags = $("#markdownDoc").find('a');
	for(var i = 0; i<aTags.length; i++)
	{
		//Check for external link
		if($(aTags[i]).attr("href") != undefined)
		{
			if($(aTags[i]).attr("href").indexOf("http")>-1)
			{
				$(aTags[i]).attr("target", "_blank");
			}
		}
	}
	
	//Highlighttext
	setTimeout(function(){
		highlightText();
	},1000);
	
	//Find hash in ToC
	findHash();
}

//Scroll to the specified item
function scrollTo(item)
{
	$("html, body").animate({ scrollTop: $(item).offset().top -  $("#docsHeader").outerHeight(true)}, 500);
}

function getByKey(key) 
{
	var found = null;

	for (var i = 0; i < docs.length; i++) 
	{
		var element = docs[i];

		if (element.key == key) 
		{
		   found = element;
	    } 
	}
	
	return found;
}

function highlightText()
{
	//Unhighlight any selections 
	$("#markdownDoc").unhighlight();
	
	//Check for placeholder
	if (document.createElement("input").placeholder == undefined) {
		//Check for word "Search"
		if($("#searchBox").val() == "Search"){
			//Don't highlight
			return;
		}
	}
	
	//Highlight for each work in search
	var words = $("#searchBox").val().split(" "); 
	for(var i = 0; i<words.length; i++)
	{
		$("#markdownDoc").highlight(words[i]);
	}		

	//Highlight for each work in search
	spanHighlights = $(".highlight");
	
	//Do we have highlights 
	if(spanHighlights.length > 0)
	{
		//Scroll to first highlight
		spanLoc = 0;
		spanHolder = null;
		scrollTo(spanHighlights[spanLoc]);
		spanHolder = spanHighlights[spanLoc];
		$(spanHolder).addClass("highlightSelected");
		
		//Display in this doc info 
		$("#tocNav").show();
		$("#tocNavText").text('There are ' + spanHighlights.length + ' results in the document.');
	}
	else
	{
		spanLoc = 0;
		spanHolder = null;
		$("#tocNav").hide();
		$("#tocNavText").text("");
	}
}
function search()
{
	highlightText();
		
	var options = {
		caseSensitive: false,
		includeScore: false,
		shouldSort: true,
		threshold: 0.5,
		location: 0,
		distance: 10000,
		maxPatternLength: 32,
		keys: ["md", "name"]
	};
		
	var fuse = new Fuse(docs, options); // "list" is the item array
		
	searchResults = fuse.search($("#searchBox").val());
		
	var html = "";
	for(var i = 0; i<searchResults.length; i++)
	{
		html += '<li><a href="#' + searchResults[i].key + '">' + searchResults[i].name.replace(/\./g, '.&#8203;') + '</a></li>';
	}
	
	if(searchResults.length>0)
	{
		//Show results
		var popover = $("#searchBox").data('bs.popover');
		popover.options.content = '<div id="searchRes"><ul class="nav nav-list">' + html +'</ul></div>';
		
		//Show box
		$("#searchBox").popover("show");
		
		// Handler for search results click
		$('#searchRes li').click(function() {
			//Hide Search results	
			$("#searchBox").popover("hide");
			//collapse menu
			//$('#menu').multilevelpushmenu('collapse');
		});	

		//handler for closing popover		
		$('.popover-title').click(function() {
			$("#searchBox").popover("hide");
		});		
	}
	else
	{
		//Clear results
		var popover = $("#searchBox").data('bs.popover');
		popover.options.content = '<div id="searchRes"><ul class="nav nav-list">' + html +'</ul></div>';
		
		//Hide results div
		$("#searchBox").popover("hide");
	}
}

// to use when finding object in menu json
function getObjects(obj, key, val) {

	var objects = [];
	
	for (var i in obj){
		if (!obj.hasOwnProperty(i)){
			continue;
		}
		if (typeof obj[i] == 'object') {
			objects = objects.concat(getObjects(obj[i], key, val));
		} 
		else if (i == key && obj[key] == val) {
			objects.push(obj);
		}
	}
	return objects;
}

//To uses when finding an array that has an object with a value
function getArray(obj, key, val, save) {
	var save =  {item:false};
	return getArrayInner(obj, key, val, save);
}

//Inner logic
function getArrayInner(obj, key, val, save) {

	var objects = [];
	
	for (var i in obj) {
		if(obj[i] instanceof Array){
			var temp = getArrayInner(obj[i], key, val, save);
			if(save.item){
				//console.log("A - ");
				//console.log(obj[i]);
				//console.log(" - A");
				objects.push(obj[i]);
				save.item = false
			}
			else if(temp.length > 0){
				objects.push(temp);
			}
		}
		else if(obj[i]instanceof Object){
			var temp = getArrayInner(obj[i], key, val, save);
			if(save.item){
				//console.log("O - ");
				//console.log(obj[i]);
				//console.log(" - O");
				objects.push(obj[i]);
			}
			else if(temp.length > 0){
				objects.push(temp);
			}
		}
		else if (i == key && obj[key] == val) {
			save.item = true;
			objects.push(obj);
		}
	}
	
	if(objects.length > 1){
		//console.log(objects);
		return objects;
	}
	else if(objects.length > 0){
		//console.log(objects[0]);
		return objects[0];
	}
	else{
		//console.log(objects);
		return objects;
	}
}