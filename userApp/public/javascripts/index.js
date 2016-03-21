$(document).ready( function () {

	var sqlParams = JSON.stringify({'qry':4});
	$.ajax('/exec_query', {
 		type: "POST",
 		contentType: "application/json",
        data: sqlParams,								
        success: function(results) {
        	var length = results.length;
        	if(length<1){
        		$('#visits-list').append("<p>You have no recent Visits. Start your first one today!</p>");
        	}
        	else{
        		for(var i=0; i<length; i++){
	        		$('#visits-list').append("<div class='boxVisits'><img id='museum-pic' src='http://i.imgur.com/szItCZn.jpg'><div class='recentVisit'><h4>"
						+results[i].museum +
						"</h4></div><div class='recentVisit'><p>"
						+ procDate(results[i].visitDate) +
						"</p><p>Views: </p></div></div>");
        		} 
        	}
    	}
	});
    $.ajax('/index', {
        type: "POST",                                  
        success: function(results) {
            if(results!=null && results!=""){
                $('#welcome').text("Welcome, "+results);
            }
        }
    });

});