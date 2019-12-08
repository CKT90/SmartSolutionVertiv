

$(document).on('turbolinks:load', function() {

  $(".menu-toggle").click(function(e) {
      e.preventDefault();
      $("#wrapper").toggleClass("toggled");
  });

  $("a.prevent").click(function (e) { 
    e.preventDefault(); 
  })

  $('a').click(function () {
    $(this).find('span.toggle-icon').toggleClass('fa-angle-left fa-angle-down');

  })

});






