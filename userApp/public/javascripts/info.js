var isLiked = false;
var isFav = false;

$(document).ready(function() {
	$("#likebtn").on('click', function(){
		var $button = $(this);
		$button.toggleClass('liked');
		isLiked = $button.hasClass('liked');
	});
	$("#favbtn").on('click', function(){
		var $button = $(this);
		$button.toggleClass('liked');
		isFav = $button.hasClass('liked');
	});

	$('#nextCheckInButton').on('click', function (e) {
		// logs a checkOut interaction
		e.preventDefault();
		var sqlParams = JSON.stringify({
			'qry' : 3,
			'params' : { 'interactionTypeId' : 4,
				'timestamp' : null
			}
		});
		$.ajax('/exec_query', {
	 		type: "POST",
	 		contentType: "application/json",
	        data: sqlParams,								
	        success: function(result) {
	        	window.location.replace('/checkIn');
	    	}
		});
		
		// track likes
		if(isLiked) {
			sqlParams = JSON.stringify({
				'qry' : 3,
				'params' : { 'interactionTypeId' : 2,
					'timestamp' : null
				}
			});
			$.ajax('/exec_query', {
		 		type: "POST",
		 		contentType: "application/json",
		        data: sqlParams,								
		        success: function(result) {
		        	window.location.replace('/checkIn');
		    	}
			});
		}

		// track favs
		if(isFav) {
			sqlParams = JSON.stringify({
				'qry' : 3,
				'params' : { 'interactionTypeId' : 3,
					'timestamp' : null
				}
			});
			$.ajax('/exec_query', {
		 		type: "POST",
		 		contentType: "application/json",
		        data: sqlParams,								
		        success: function(result) {
		        	window.location.replace('/checkIn');
		    	}
			});
		}
	});

	$('#endTourButton').on('click', function (e) {
		// logs a visitEnd interaction
		e.preventDefault();
		var sqlParams = JSON.stringify({
			'qry' : 3,
			'params' : { 'interactionTypeId' : 6,
				'timestamp' : null
			}
		});
		$.ajax('/exec_query', {
	 		type: "POST",
	 		contentType: "application/json",
	        data: sqlParams,								
	        success: function(result) {
	        	window.location.replace('/index');
	    	}
		});
		// logs a checkout interactoin
		var sqlParams2 = JSON.stringify({
			'qry' : 3,
			'params' : { 'interactionTypeId' : 4,
				'timestamp' : null
			}
		});
		$.ajax('/exec_query', {
	 		type: "POST",
	 		contentType: "application/json",
	        data: sqlParams2,								
	        success: function(result) {
	        	window.location.replace('/checkIn');
	    	}
		});

		if(isLiked) {
			sqlParams = JSON.stringify({
				'qry' : 3,
				'params' : { 'interactionTypeId' : 2,
					'timestamp' : null
				}
			});
			$.ajax('/exec_query', {
		 		type: "POST",
		 		contentType: "application/json",
		        data: sqlParams,								
		        success: function(result) {
		        	window.location.replace('/checkIn');
		    	}
			});
		}

		// track favs
		if(isFav) {
			sqlParams = JSON.stringify({
				'qry' : 3,
				'params' : { 'interactionTypeId' : 3,
					'timestamp' : null
				}
			});
			$.ajax('/exec_query', {
		 		type: "POST",
		 		contentType: "application/json",
		        data: sqlParams,								
		        success: function(result) {
		        	window.location.replace('/checkIn');
		    	}
			});
		}
	});

});