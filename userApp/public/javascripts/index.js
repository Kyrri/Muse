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

function procDate (date) {
	var d = new Date(date);
    return getMonthName(d.getMonth()) + ' ' + d.getDate() + ', ' + d.getFullYear();
}

function getMonthName (intMonth) {
	switch (intMonth) {
		case 0 : 
			return 'Jan';
			break;
		case 1 : 
			return 'Feb';
			break;
		case 2 : 
			return 'Mar';
			break;
		case 3 : 
			return 'Apr';
			break;
		case 4 : 
			return 'May';
			break;
		case 5 : 
			return 'Jun';
			break;
		case 6 : 
			return 'Jul';
			break;
		case 7 : 
			return 'Aug';
			break;
		case 8 : 
			return 'Sep';
			break;
		case 9 : 
			return 'Oct';
			break;
		case 10 : 
			return 'Nov';
			break;
		case 11 : 
			return 'Dec';
			break;
	}
}