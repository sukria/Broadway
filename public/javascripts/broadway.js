function broadway_next() {
    $.ajax({
        type: "POST",
        url: "/next",
        cache: false,
        success: function(html){
            1;
        }
    });
}

function broadway_prev() {
    $.ajax({
        type: "POST",
        url: "/prev",
        cache: false,
        success: function(html){
           1; 
        }
    });
}

function broadway_first() {
    $.ajax({
        type: "POST",
        url: "/first",
        cache: false,
        success: function(html){
           1; 
        }
    });
}

function broadway_last() {
    $.ajax({
        type: "POST",
        url: "/last",
        cache: false,
        success: function(html){
           1; 
        }
    });
}


function broadway_refresh() {
    $.ajax({
        type: "POST",
        url: "/refresh_slide",
        cache: false,
		error: function(failure) {
			alert("unable to receive content");
		},
        success: function(html) {

            // replace the slide content
            if (window.broadway_effects) {
    			//$('#slide').style('display: none');
                $('#slide').html(html);
    			$('#slide').fadeIn('slow', function(){1});
            }
            else {
                $('#slide').html(html);
            }

            // syntax highlighting
            prettyPrint();

            // update the slide number (it's in the layout)
			$.ajax({
                type: 'POST', 
                url: '/current_slide',
                cache: false,
                success: function(json) {
                    slide = parseInt(json['slide']);
                    $('#slide_number').html( slide + 1);
            }});
        }
    });
}

/* init */
var KEY_RIGHT = 39;
var KEY_LEFT  = 37;
var KEY_SPACE = 0;
var KEY_ORIG  = 36;
var KEY_END   = 35;

$(document).ready(function() {

	window.pending_keypress = 0;

    // register key bindings
    $(document).keyup(function(e) {
        if(e.keyCode == KEY_LEFT && (!window.pending_keypress)) {
			window.pending_keypress = 1;
            broadway_prev();
            broadway_refresh();
			window.pending_keypress = 0;
        }
        else if (e.keyCode == KEY_RIGHT && (!window.pending_keypress)) {
			window.pending_keypress = 1;
            broadway_next();
            broadway_refresh();
			window.pending_keypress = 0;
        }
		else if (e.keyCode == KEY_ORIG && (!window.pending_keypress)) {
			window.pending_keypress = 1;
			broadway_first();
            broadway_refresh();
			window.pending_keypress = 0;
		}
		else if (e.keyCode == KEY_END && (!window.pending_keypress)) {
			window.pending_keypress = 1;
			broadway_last();
            broadway_refresh();
			window.pending_keypress = 0;
		}
    });
	broadway_refresh();
});

