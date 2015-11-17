var login_url="/login";
var index_url="/";

$(document).ready(function() {
 
	//FB SDK init
  $.ajaxSetup({ cache: true });
  $.getScript('//connect.facebook.net/en_US/sdk.js', function(){
    FB.init({
      appId: '1512323399060458',
      version: 'v2.5',
      cookie: true,
      xfbml : false
      });

    //Check Log-in on load app
    FB.getLoginStatus(function(response) {
		if(response.status === "connected"){
			if(window.location.pathname===login_url){
				loadIndex();
			}
		}
		else{
			if(window.location.pathname!==login_url){
				loadLogin();
			}
		}
    });     
  });


	//log into app - there needs to be a button with id "login" on the login.jade page
	$(function(){
	 	$('#login').on('click', function(e){
			FB.login(function(response){
				if(window.location.pathname!==index_url){
					loadIndex();
				}
				else{
					//Must Log-In to Use App
				}

			}, {scope: 'public_profile, email, user_friends'});
		
		});
	});
	function loadIndex(){
		window.location.replace(index_url);
	}
	function loadLogin(){
		window.location.replace(login_url);
	}
});

