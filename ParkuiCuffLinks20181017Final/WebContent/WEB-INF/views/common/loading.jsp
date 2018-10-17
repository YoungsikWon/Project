<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/************************************************************************************** 로딩중 보여질 화면에 대한 설정*/
#loading {
   width: 100%;
   height: 100%;
   top: 0px;
   left: 0px;
   position: fixed;
   display: block;
   opacity: 1;
   background-color: #fff;
   z-index: 99;
   text-align: center;
   color: #000;
}

#loading-image {
   position: absolute;
   top: 35%;
   left: 47%;
   z-index: 100;
}
</style>
</head>
<body>
   <!-- 로딩중에 보여질화면에 대한 부분 -->
   <div id="loading"><img id="loading-image" src="../../image/loading4.gif" alt="Loading..." /></div>
<script>
//화면로딩완료전 보여진 로딩중화면
$(window).load(function() {    
     $('#loading').hide();  
})   
</script>
</body>
</html>