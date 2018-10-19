<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CuffLink 에러</title>
<style>
body {
	text-align: center; /* Quirks Mode 를 위한 가운데 정렬 */
	vertical-align: middle;
}

div {
	width: 100%; /* 정렬하려는 요소의 넓이를 반드시 지정 */
	margin: 0 auto;
}
</style>
</head>
<body onload="javascript:window_onload()">
	<div>
		<img src="/image/404500error.png" alt="에러" />
	</div>
	<div><h3 style="color:red">
	서비스 이용에 불편을 드려서 죄송합니다.<br>
	3초후에 자동으로 정상화면으로 이동합니다.</h3></div>
	<script>

 
      function window_onload(){
         setTimeout('go_url()',5000)  // 5초후 go_url() 함수를 호출한다.
      }
      function go_url(){
         location.href="/"  // 페이지 이동...
      }
 

  </script>

</body>
</html>