$(document).ready(function() {
	$("form#checkIn .number").on('input',function () {
		//debugger;
		var val = $(this).val();
		// 1 -> "1"
	    if ((val + "").length == 1 && /[0-9]/.test(val + "")) {
	    	if($(this).next("input").length){
	    		$(this).next("input").focus();
	    	}
	    } else {
			$(this).val("");
	    }
	});
	$("form#checkIn .number").on('focus click',function () {
	   $(this).select();
	});
	$('#checkIn').on('submit', function(e){
		e.preventDefault();
		var code = "";
		$("form#checkIn .number").each(function(){
			var val = $(this).val();
			code+=(val+"");
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
		        	if (result) {
		        		//Route to specific artpiecece
		        		window.location.replace("/info?id="+code);
		        	}
		        	else {
		        		$('#checkinFeedback').text('Invalid Code. Please enter valid code.')
		        	} 
		    	}
			});
		} 
	});
});