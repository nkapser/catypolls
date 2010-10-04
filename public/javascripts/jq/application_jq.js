    function add_fields(link, association, content) {
        var new_id = new Date().getTime();
        var regexp = new RegExp("new_" + association, "g")
        $(link).parent().before(content.replace(regexp, new_id));
    }

    function remove_fields(link) {
        $(link).prev("input[type=hidden]").val("1");
        $(link).closest(".fields").hide();
    }


(function($){

/*
 * about deal
 */
    // The following code will ensure only numkeys will be allowed on the form.
    $('input.numeric').keydown(function(event) {
            // Allow only backspace and delete
            if ( event.keyCode == 46 || event.keyCode == 8 ) {
            // let it happen, don't do anything
            }
            else {
                // Ensure that it is a number and stop the keypress
                if (event.keyCode < 48 || event.keyCode > 57 ) {
                    event.preventDefault();
                }
            }
        });

	$('.comment .likes').hover(function(){
		$(this).addClass('likes-high-light');
	}, function(){
		$(this).remove('likes-high-light');
	});

	$('.comment .dislikes').hover(function(){
		$(this).addClass('test');
	});
})(jQuery);



