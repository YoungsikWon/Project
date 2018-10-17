<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.3.3/dist/semantic.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.3.3/dist/semantic.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.3.3/dist/semantic.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.3.3/dist/semantic.min.css">


<script>
  // This is called with the results from from FB.getLoginStatus().
  
  $(document).ready(function(){
	 
	  $("#logout").click(function(){
		  FB.logout(function(response) {
			   // Person is now logged out
			   alert(response);
			});
	  });
	  
	  
	  $("#login").click(function(){
		  FB.login(function(response) {
			  if (response.status === 'connected') {
			    // Logged into your app and Facebook.
				  FB.api('/me?fields=id,name,email', function(response) {
					
					  var fb_data = jQuery.parseJSON(JSON.stringify(response));
					  alert(fb_data.id);
					  alert(fb_data.name);
					  alert(fb_data.email);
				
					
				    });
			  } else {
			    // The person is not logged into this app or we are unable to tell. 
				  alert("2");
			  }
			}, {scope: 'public_profile,email'}); 
	  });
	  
  });
  
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '2217900978490605',
      cookie     : true,  // enable cookies to allow the server to access 
      xfbml      : true,  // parse social plugins on this page
      version    : 'v2.8' // use graph api version 2.8
    });

    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });

  };

  // Load the SDK asynchronously
  (function(d, s, id) {
	
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "https://connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));


</script>

<button  id = "logout">로그아웃</button>
<button  id = "login">로그인</button>
<div id="status">
</div>
</body>
</html>