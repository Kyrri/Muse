$(document).ready( function () {

	$('#startVisitButton').hide();

	// make sure only one button can be selected at a time
	$('.museumList button').click( function() {
		$('.museumList button').removeClass('selected');
		$(this).addClass('selected');
		$('#startVisitButton')
		$('#startVisitButton').show();
	});

	$('#startVisitButton').bind('click', function (e) {
		//e.preventDefault(); // for debugging
		var museumId = $('.museumList button.selected');
		var sqlParams = JSON.stringify({
			'qry' : 1,
			'params' : {'museumId' : museumId.val()}
		});
		//console.log(sqlParams);
		$.ajax('exec_query',{
	 		type: "POST",
	 		contentType: "application/json",
	 		dataType: 'JSON',
            data: sqlParams,								
            success: function(results) {
            	console.log(results);
        	}
   		 });
	});
});