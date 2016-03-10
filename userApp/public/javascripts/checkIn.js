$(document).ready(function() {
	$("form#checkIn :text").on('input',function () {
	    if($(this).val().length == $(this).attr('maxlength')) {
	    	if($(this).next("input").length){
	    		$(this).next("input").focus();
	    	}
	    }
	});
	$("form#checkIn :text").on('focus click',function () {
	   $(this).select();
	});
	$('#checkIn').on('submit', function(e){
		e.preventDefault();
		var code = "";
		$("form#checkIn :input:text").each(function(){
			code+=$(this).val();
		});
		if(code.length!==4){
			//Not filled in, please fill in
		}
		else{
			var parameters = JSON.stringify({"code": code});
			$.ajax('/checkIn',{
		 		type: "POST",
		 		contentType: "application/json",
		 		//dataType: boolean,
				data: parameters,								
		        success: function(result) {
		        	//alert(result);
		        	//if user exists
		        	if(result){
		        		//Route to specific artpiecece
		        		window.location.replace("/info?id="+code);
		        	}
		        	else{
		        		//wrong code, try again
		        	} 
		    	}
			});
		} 
	});
});