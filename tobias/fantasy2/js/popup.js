function toggle(div_id) {
	var el = document.getElementById(div_id);
	if ( el.style.display == 'none' ) {	el.style.display = 'block';}
	else {el.style.display = 'none';}
}
function blanket_size(popUpDivVar) {
	if (typeof window.innerWidth != 'undefined') {
		viewportheight = window.innerHeight;
	} else {
		viewportheight = document.documentElement.clientHeight;
	}
	if ((viewportheight > document.body.parentNode.scrollHeight) && (viewportheight > document.body.parentNode.clientHeight)) {
		blanket_height = viewportheight;
	} else {
		if (document.body.parentNode.clientHeight > document.body.parentNode.scrollHeight) {
			blanket_height = document.body.parentNode.clientHeight;
		} else {
			blanket_height = document.body.parentNode.scrollHeight;
		}
	}
	var blanket = document.getElementById('blanket');
	blanket.style.height = blanket_height + 'px';
	var popUpDiv = document.getElementById(popUpDivVar);
	popUpDiv_height=blanket_height/2-200;//200 is half popup's height
	popUpDiv.style.top = popUpDiv_height + 'px';
}
function window_pos(popUpDivVar) {
	if (typeof window.innerWidth != 'undefined') {
		viewportwidth = window.innerHeight;
	} else {
		viewportwidth = document.documentElement.clientHeight;
	}
	if ((viewportwidth > document.body.parentNode.scrollWidth) && (viewportwidth > document.body.parentNode.clientWidth)) {
		window_width = viewportwidth;
	} else {
		if (document.body.parentNode.clientWidth > document.body.parentNode.scrollWidth) {
			window_width = document.body.parentNode.clientWidth;
		} else {
			window_width = document.body.parentNode.scrollWidth;
		}
	}
	var popUpDiv = document.getElementById(popUpDivVar);
	window_width=window_width/2-200;//200 is half popup's width
	popUpDiv.style.left = window_width + 'px';
}
function popup(windowname) {
	blanket_size(windowname);
	window_pos(windowname);
	toggle('blanket');
	toggle(windowname);		
}

$(document).ready(function(){
	// ajax setup
	$.ajaxSetup({
		url: 'ajaxvote.php',
		type: 'POST',
		cache: 'false'
	});

	// any voting button (up/down) clicked event
	$('.vote').click(function(){
		var self = $(this); // cache $this
		var action = self.data('action'); // grab action data up/down 
		var parent = self.parent().parent(); // grab grand parent .item
		var postid = parent.data('postid'); // grab post id from data-postid
		var score = parent.data('score'); // grab score form data-score

		// only works where is no disabled class
		if (!parent.hasClass('.disabled')) {
			// vote up action
			if (action == 'up') {
				// increase vote score and color to orange
				parent.find('.vote-score').html(++score).css({'color':'#45d68a'});
				// change vote up button color to orange
				self.css({'color':'#45d68a'});
				// send ajax request with post id & action
				$.ajax({data: {'postid' : postid, 'action' : 'up'}});
			}
			// voting down action
			else if (action == 'down'){
				// decrease vote score and color to red
				parent.find('.vote-score').html(--score).css({'color':'red'});
				// change vote up button color to red
				self.css({'color':'red'});
				// send ajax request
				$.ajax({data: {'postid' : postid, 'action' : 'down'}});
			};

			// add disabled class with .item
			parent.addClass('.disabled');
		};
	});
});


