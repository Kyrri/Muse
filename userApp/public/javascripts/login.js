var index_url="/index";

$(document).ready(function() {
	$('input').on('blur',function(){
		$('.feedback').text('');
	});
	$("#email").on("blur",  function(){
		if(!validateEmail(decodeURIComponent($("#email").val())) && $("#email").val().length>0){
			updateFeedback("email", "Email Invalid");
		}
		else{
			updateValidity("#email");
		}
	});
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
	 		dataType: 'JSON',
            data: parameters,								
            success: function(result) {
            	//if user exists
            	if(result.Success){
            		window.location.replace(index_url);
            	}
            	else{
            		updateFeedback(result.ErrType, result.Message);
            	} 
        	}
   		 }); 

	});
	function updateFeedback(element, newText){
		$("#FB_"+element).text(newText);
		$("#"+element).fadeIn("slow", function(){
			$(this).addClass("invalid");
		});
	}
	function updateValidity(element){
		if($(element).hasClass("invalid") && validateEmail(decodeURIComponent($(element).val()))){
			$(element).removeClass("invalid");
		}
	}
	function validateEmail(email) {
		var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		return re.test(email);
	}

	$('.enter_login').click(function (e) {
		e.preventDefault();
		$('#splashscreen').fadeOut(500);
	})

	if (localStorage.isSignedUp) {
		$('#hasSignedUp').show();
	} else {
		$('#hasNotSignedUp').show();
	}


});
