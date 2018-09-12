<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="./ui.jsp" />
<meta charset="UTF-8">
<title>Layout</title>
</head>
<body>
<!----------------------------------------------------------------------- top 시작 -->
	<div class="ui ">
<!-- header 시작 -->
		<div class="ui inverted segment" style="margin-top: 0px; padding-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">
			<div class="ui container">
				<img src="./img/logo.jpg" class="ui image tiny" alt=""
					style="float: left; margin-right: 10px" />
				<div class="ui inverted secondary pointing menu"
					style="margin-top: 0px;">
					<a class="active item"> 프로젝트 등록 </a> <a class="item"> 프로젝트 목록 </a>
					<a class="item"> 개발자 목록 </a>
					<div class="right menu">
						<button class="ui button" style="margin-right: 10px;" onclick="move('/auth/login')">로그인</button>
						<button class="ui primary button">회원가입</button>
					</div>
				</div>
			</div>
		</div>
<!-- header 종료 -->
<!-- navigation menu 시작 -->
		<div class="submenu" style="border-bottom: groove thin;">
			<div class="ui container">
				<div class="ui secondary menu">
					<a class="active item"> 내 프로필 </a> 
					<a class="item"> 관심 프로젝트 </a> 
					<a class="item"> 지원 내역 </a> 
					<a class="item"> 진행중인 프로젝트 </a> 
					<a class="item"> 완료한 프로젝트 </a>
				</div>
			</div>
		</div>
<!-- navigation menu 종료-->
	</div>
<!----------------------------------------------------------------------- top 끝 -->

<!----------------------------------------------------------------------- main content 시작 -->

<!----------------------------------------------------------------------- main content 끝 -->
<!----------------------------------------------------------------------- footer content 시작 -->
<!----------------------------------------------------------------------- footer content 끝 -->
<script>
	function move(url){
		location.href=url
	}
</script>
</body>
</html>