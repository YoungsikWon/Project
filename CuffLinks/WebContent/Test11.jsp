<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.3.3/dist/semantic.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.3.3/dist/semantic.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.3.3/dist/semantic.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.3.3/dist/semantic.min.css">
<script>
$(document).ready(function(){
	alert("Test");
	navigator.geolocation.getCurrentPosition(function(position){
	    console.log('latitude: ', position.coords.latitude);
	    console.log('longitude: ', position.coords.longitude);
	    alert(position.coords.latitude);
	    alert(position.coords.longitude);
	    });
	    
});

/* var watchId = navigator.geolocation.watchPosition(function(position){
	console.log('latitude: ', position.coords.latitude);
	console.log('longitude: ', position.coords.longitude);
	});
	//위치 정보 확인 종료
	navigator.geolocation.clearWatch(watchId);
 */
</script>
</head>
<body>

</body>
</html>