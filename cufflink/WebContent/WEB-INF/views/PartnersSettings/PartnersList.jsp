<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파트너스 목록</title>
</head>
<link rel="stylesheet" href="./css/cuffLink.css" />
<link rel="stylesheet" href="./css/login.css" />
</head>
<body>
<!----------------------------------------------------------------------- top 시작 -->
	<header class="header">
		<div class="ui">
	<!-- header 시작 -->
			<div class="ui">
				<jsp:include page="../common/menu/headerMenu.jsp"/>   
			</div>
	<!-- header 종료 -->
	
			<div class="ui"><!-- header와 navigation 여백 --></div>
	
	<!-- navigation menu 시작 -->
			<div class="ui navigation">
				<jsp:include page="../common/menu/navigationClientMenu.jsp"/>
			</div>
	<!-- navigation menu 종료-->
		</div>
	</header>
<!----------------------------------------------------------------------- top 끝 -->
	<div class="ui mainspace"><!-- login title와 main content 여백 -->	</div>
<!----------------------------------------------------------------------- main content 시작 -->
<!----------------------------------------------------------------------- main content 시작 -->
	<div class="ui container raised segment content"  style="padding-top: 10px; padding-bottom: 10px; margin-top: 0px; margin-bottom: 0px; height:720px; ">
		
	<!-- title 시작-->
		<div class="ui container">
			<div class="content-header">
				<div class="ui two column grid container">
					<div class="column" style="text-align:left">
						<h3 class="content-text">파트너스 목록</h3>
						<small class="small-text">53,566명의 파트너스가 있습니다.</small>
					</div>
					<div class="column" style="text-align:right;margin:10px 0px;">
						<!-- 우측에 입력할 수 있는 공간 확보 -->
					</div>
				</div>
			</div>
		</div>			
	<!-- title 끝-->

	<div class="ui mainspace"><!-- login title와 main content 여백 -->	</div>

	<!-- main 입력 시작-->
		<div class="ui container">
			<div class="content-middle-join">
				<div class="ui two column grid container" style="padding:0px;">
					<div class="column grid" style="border-right: 1px solid #dedede; vertical-align: middle;padding: 20px; width: 70%;">
<!-- form 시작 ================================================================================================================================== -->		
						<form name="p_list">
							
						</form>
<!-- form 끝 ================================================================================================================================== -->						
					</div>
					<div class="column grid" style="padding-top: 50px; width: 30%;">
						
					</div>
				</div>
			</div>
		</div>
	<!-- main 입력 끝-->
	
	</div>
<!----------------------------------------------------------------------- main content 끝 -->
<!----------------------------------------------------------------------- main content 끝 -->
	<div class="ui mainspace"><!-- login title와 main content 여백 -->	</div>	
<!----------------------------------------------------------------------- footer content 시작 -->
	<!-- footer 시작-->
		<footer class="footer">
			<div class="ui inverted segment" style="height:200px; padding:25px; vertical-align:middle;">
				<jsp:include page="../common/menu/footerMenu.jsp"/>
			</div>
		</footer>
	<!-- footer 끝-->
<!----------------------------------------------------------------------- footer content 끝 -->

</body>
</html>