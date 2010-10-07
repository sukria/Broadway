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

function broadway_refresh() {
    $.ajax({
        type: "POST",
        url: "/refresh_slide",
        cache: false,
        success: function(html) {

            // replace the slide content
            $('#slide').html(html);

            // syntax highlighting
            prettyPrint();

            // update the slide number (it's in the layout)
            $.ajax({
                type: 'POST', 
                url: '/current_slide',
                cache: false,
                success: function(json) {
                    $('#slide_number').html(json['slide'] + 1);
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

    // register key bindings
    $(document).keypress(function(e) {
        if(e.keyCode == KEY_LEFT) {
            broadway_prev();
            broadway_refresh();
        }
        else if (e.keyCode == KEY_RIGHT) {
            broadway_next();
            broadway_refresh();
        }
    });

    // display the current slide
    broadway_refresh();
});

