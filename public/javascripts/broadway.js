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
            $('#slide').html(html);
            prettyPrint();
        }
    });
}

