var index_url="/index";

$(document).ready(function() {
		$('#login_form').on('submit',function(e){
			e.preventDefault();
			var login_data = $('#login_form').serialize().split("&");
			var email = login_data[0].replace("email=", "");
			if(!validateEmail(decodeURIComponent(email))){
				//Need valid Email
				return;
			}
			var password = login_data[1].replace("password=","");
			if(password.length<5){
				//password must be at least 5 characters
				return;
			}
			var fName = login_data[2].replace("fName=","");
			var lName = login_data[3].replace("lName=","");
			var gender = login_data[4].replace("gender=","");
			var age = login_data[5].replace("age=","");
			var parameters = JSON.stringify({
				"email": email,
				"password": password,
				"fName": fName,
				"lName": lName,
				"age": age,
				"gender": gender
			});
			$.ajax('signup',{
		 		type: "POST",
		 		contentType: "application/json",
		 		//dataType: boolean,
	            data: parameters,								
	            success: function(result) {
	            	//
	            	window.location.replace(index_url);    
            	}
       		 }); 
			//submit data to database, global-variable login made true, user is signed up
		});
		//should re-validate in server
		function validateEmail(email) {
			var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			return re.test(email);
		}

});