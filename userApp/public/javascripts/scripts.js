

jQuery(document).ready(function($) {

	// Accordion List
	$('#accordion, #visits_accordion_upcoming, #visits_accordion_recent').each(function () {
		var $accordion = $(this);

		$accordion.find('.accordion-toggle').click(function(){

			//Expand or collapse this panel
			$(this).next().slideToggle('fast');

			//Hide the other panels
			/*$accordion.find(".accordion-content").not($(this).next()).slideUp('fast');*/

		});
	});

	// Toggle Button Colors
	$("button.select").click(
		function(){
			$(this).toggleClass("selected")
		});

});
