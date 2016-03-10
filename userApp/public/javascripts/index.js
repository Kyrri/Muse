$(document).ready( function () {

	var sqlParams = JSON.stringify({'qry':4});
	$.ajax('/exec_query', {
 		type: "POST",
 		contentType: "application/json",
        data: sqlParams,								
        success: function(results) {
        	var i = 0;
        	$('#visits_accordion_recent h4').each( function () {	
        		$(this).text(results[i].museum + ' on ' + procDate(results[i].visitDate));
        		i++;
        	});
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