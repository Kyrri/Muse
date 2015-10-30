$(document).ready(function(){

	//Serve Image
	$(function(){
	 $('#showImage').on('click', function(e){
	 	$.get('/partial_artInfo0', function(result){
	 		$('#displayImage').html(result);
	 	});   
	 });
	});



});