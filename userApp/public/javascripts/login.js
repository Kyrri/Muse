var index_url="/index";

$(document).ready(function() {
		$('#login_form').on('submit',function(e){
			e.preventDefault();
			var login_data = $('#login_form').serialize().split("&");
			var email = login_data[0].replace("email=", "");
			var password = login_data[1].replace("password=","");
			var parameters = JSON.stringify({
				"email": email,
				"password": password
			});
			$.ajax('login',{
		 		type: "POST",
		 		contentType: "application/json",
		 		//dataType: boolean,
	            data: parameters,								
	            success: function(result) {
	            	//if user exists
	            	if(result){
	            		window.location.replace(index_url);
	            	}
	            	else{
	            		//wrong log-in, try again or sign-up
	            	} 
            	}
       		 }); 

		});

});
