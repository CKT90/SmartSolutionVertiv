$(document).on('turbolinks:load', function() {

    $(".disable_link").bind("contextmenu",function(){
        return false;
    });

	$(document).on("click", function(e) {
  		if($(e.target).is(".disable_link") && e.button === 1) {
    e.preventDefault();
  }
});

});