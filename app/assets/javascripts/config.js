$(document).on('turbolinks:load', function() {

	$("#config_rack_q").select2({
  		minimumResultsForSearch: Infinity,
  		width: 'resolve',
	});

});