var Store = Store || {};

function statusChangeCallback(response){
	Store.status = response.status;
  if(response.status === "connected"){
  	// FB.api('/me/picture', function(response) {
  	//  	var profile_picture = JSON.stringify(response.data.url);
	 	// });
		 FB.api('/me', function(response) {
  			$("#sign_in").text(response.email);  	  	
	 	});
  }else{
  	$("#sign_in").text("Logare");
  }
}

$(document).ready(function() {
  $.ajaxSetup({ cache: true });
  $.getScript('//connect.facebook.net/en_UK/all.js', function(){
    FB.init({
      appId: Store.app_id,
    });
  	
  	FB.getLoginStatus(function(response) {
  			statusChangeCallback(response);
    });

  });

  $("#sign_in").on("click", function(){
  	if(Store.status != "connected"){
  	  FB.login(function(response) {
  	  	statusChangeCallback(response);
      }, {scope: 'public_profile,email'});	
  	}
    
  });

  $("#sign_out").on("click", function(){
    FB.logout(function(response) {
      statusChangeCallback(response);
    });
  });

});