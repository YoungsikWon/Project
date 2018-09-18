<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
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
				<jsp:include page="../common/menu/navigationMenu.jsp"/>
			</div>
	<!-- navigation menu 종료-->
		</div>
	</header>
<!----------------------------------------------------------------------- top 끝 -->
	
<!--======================================================================================-->
<!----------------------------------------------------------------------- main content 시작 -->
	<div class="ui container raised segment content contentMain">
		
	<!-- title 시작-->
		<div class="ui container"> 
			<div class="content-header">
				<div class="ui two column grid container">
					<div class="column" style="text-align:left;">
						<h3 class="content-text">비밀번호 찾기</h3>
						<small class="small-text">계정의 비밀번호를 잊으셨나요?</small>
					</div>
					<div class="column" style="text-align:right;margin:10px 0px;">
						<!-- 우측에 입력할 수 있는 공간 확보 -->
					</div>
				</div>
			</div>
		</div>		
	<!-- title 끝-->

	<div class="ui basicspace"><!-- title와 main content 여백 -->	</div>

	<!-- main 입력 시작-->
		<div class="ui container">
			<div class="content-middle">
				<div class="ui two column grid container" style="padding:20px; height:auto;">
					<div class="column grid" style="border-right: 1px solid #dedede; vertical-align: middle;padding: 20px; width: 60%;">
<!-- form start ================================================================================================================================== -->						
						<form name="idpwfind">
							<div class="ui two column grid container">
								<div class="center column container" style="padding: 17px; width: 35%;">
									<span>*</span>이메일
								</div>
								<div class="column container" style="padding: 10px; width: 65%;">
									<div class="ui left icon input">
										<input type="text" placeholder="이메일" size="40px">
										<i class="id badge icon"></i>
									</div>
								</div>
								<div class="column container" style="padding: 10px; width: 35%;"></div>
								<div class="column container" style="padding: 12px; width: 65%; text-align:center;">
									<div class="cloumn container" style="width:auto;">
										<div class="ui fluid animated fade button" tabindex="0">
											<div class="visible content">비밀번호 찾기</div>
											<div class="hidden content">
												<a href="#">PassWord Find</a>
											</div>
										</div>
									</div>
								</div>
								<div class="column container" style="padding-left: 10px; padding-top:0px; padding-bottom:0px; width: 100%;">
									<hr class="garo"/>
								</div>
								<div class="column container" style="padding-left: 10px; padding-top:30px; padding-bottom:0px; width: 100%;">
									<div class="ui two column grid container" style="padding-top: 0px; border: 1px solid #dedede;">
										<div class="column" style="width: 10%; padding-left: 20px; padding-right:0px;">
											<img class="ui mini image" src="../../image/process-guide-success.png">
										</div>
										<div class="column" style="width: 85%;text-align: left; padding-left: 5px">
											1. 가입시 입력하신 이메일로 임시 주소를 발송해드립니다.<br>
											2. 임시 주소를 통해 들어오신 뒤 새로운 비밀번호를 설정할 수 있습니다.
										</div>
									</div>
								</div>
							</div>
						</form>
<!-- form end ================================================================================================================================== -->								
					</div>
					<div class="column grid" style="padding: 10px; width: 40%;">
						<div class="column-login2">
							<img src="/image/accounts_password_reset.png">
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- main 입력 끝-->
	
	</div>
<!------------------------------------------------------------------------ main content 끝 -->
<!--======================================================================================-->

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