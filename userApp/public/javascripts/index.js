$(document).ready( function () {

	var sqlParams = JSON.stringify({'qry':4});
	$.ajax('/exec_query', {
 		type: "POST",
 		contentType: "application/json",
        data: sqlParams,								
        success: function(results) {
        	var length = results.length;
        	if(length<1){
        		$('#visits_accordion_recent').append("<p>You have no recent Visits. Start your first one today!</p>");
        	}
        	else{
        		for(var i=0; i<length; i++){
	        		$('#visits_accordion_recent').append("<div class='boxVisits'><div class='recentVisit'><h4>"
						+results[i].museum +
						" - </h4></div><div class='recentVisit'><p>"
						+ procDate(results[i].visitDate) +
						"</p></div></div>");
        		} 
        	}
    	}
	});

});