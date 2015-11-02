$(document).ready(function(){

	//Serve Image
	$(function(){
	 $('#showImage').on('click', function(e){
	 	var parameters = JSON.stringify({test: "John"});
	 	$.ajax('partial_artInfo0',{
	 		type: "POST",
	 		contentType: "application/json",
	 		dataType: "html",
            data: parameters,								
            success: function(result) {
                $('#displayImage').html(result);
            }
        }); 
	 });
	});

});