//= require jquery
//= require turbolinks
//= require jquery-ui
//= require jquery-ui/effects/effect-blind
//= require jquery-fileupload/basic
//= require jquery-fileupload/vendor/tmpl
//= require jquery.turbolinks
//= require jquery_ujs
//= require select2
//= require sweetalert
//= require best_in_place
//= require best_in_place.purr
//= require jquery.purr
//= require jquery.remotipart
//= require bootstrap
//= require_self 
//= require_tree .



$(document).on('turbolinks:load', function() {
  setTimeout(function(){
    $('#flash').remove();
  }, 5000);
 });