$(document).ready(function() {
	$("#likebtn").on('click', function(){
		var isLiked = this.src.indexOf(window.location.host+'/images/like.png') != -1;
    	this.src    = isLiked  ? this.src.replace('/images/like.png', '/images/like_select.png') : this.src.replace('/images/like_select.png','/images/like.png');
	});
	$("#favbtn").on('click', function(){
		var isLiked = this.src.indexOf(window.location.host+'/images/fav.png') != -1;
    	this.src    = isLiked  ? this.src.replace('/images/fav.png', '/images/fav_select.png') : this.src.replace('/images/fav_select.png','/images/fav.png');
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
	});

});