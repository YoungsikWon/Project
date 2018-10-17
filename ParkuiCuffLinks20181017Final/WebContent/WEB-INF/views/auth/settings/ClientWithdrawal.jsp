<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../common/ui.jsp"/>
<meta charset="UTF-8">
<title>회원탈퇴
</title>
<link rel="stylesheet" href="./css/cuffLink.css" />
<link rel="stylesheet" href="./css/login.css" />
</head>
<body>
<!----------------------------------------------------------------------- top 시작 -->
	<header class="header">
		<div class="ui">
	<!-- header 시작 -->
			<div class="ui">
				<jsp:include page="../../common/menu/headerMenu.jsp"/>
			</div>
	<!-- header 종료 -->
	
			<div class="ui"><!-- header와 navigation 여백 --></div>
	
	<!-- navigation menu 시작 -->
			<div class="ui navigation">
				<jsp:include page="../../common/menu/navigationClientMenu.jsp"/>
			</div>
	<!-- navigation menu 종료-->
		</div>
	</header>
<!----------------------------------------------------------------------- top 끝 -->

	<div class="ui basicspace"><!-- navigation menu와 여백 --></div>
	
<!--======================================================================================-->
<!----------------------------------------------------------------------- main content 시작 -->

	<div class="ui container" >
	
	<!-- main 입력 시작-->

		<div class="ui two column grid container" style="height: 700px">
			<div class="ui column" style="width: 20%;padding-top: 0px;padding-left: 0px;padding-right: 0px">
<!-- 로그인 정보 =================================================================================-->
				<div class="ui segment">
					<jsp:include page="../loginOk.jsp" />
				</div>
<!-- 로그인 정보 =================================================================================-->

<!-- 서브 메뉴 ===================================================================================-->
				<div class="ui fluid vertical menu" style="padding-right: 0px">
					<jsp:include page="./ClientProfileSubmenu.jsp" />
				</div>
<!-- 서브 메뉴 ===================================================================================-->
			</div>
			<div class="ui column" style="padding-left: 5px; padding-top: 0px; padding-bottom: 0px; padding-right: 10px; width: 80%;">
				<div class="ui container" style="padding-left: 20px; padding-top: 20px; padding-bottom: 10px; left: 5px; border: 1px solid #dedede;">
					<div>
						<h3 style="text-align: left">회원 탈퇴</h3>
					</div>
					<div class="ui two column grid container" style="padding-left: 0px; padding-top: 10px;">
						<div class="column" style="padding-left: 0px; width:60%;">
							<h5 style="text-align: left">회원 탈퇴를 신청할 수 있습니다.</h5>
						</div>
						<div class="column" style="text-align:right; padding-bottom:0px; width:40%;">
							<!-- 우측 빈공간 -->
						</div>
					</div>
				</div>
				<div style="height: 10px;"></div>
				<div class="ui container" style="padding-left: 20px; padding-right:20px; padding-top: 30px; padding-bottom: 0px; left: 5px; border: 1px solid #dedede; height:330px;">
					<div class="ui two column grid container" style="padding-top: 0px; border: 1px solid #dedede;">
						<div class="column" style="width: 10%; padding: 20px">
							<img class="ui medium circular image" style="width: 40px;" src="../../image/process-question-mark.png">
						</div>
						<div class="column" style="width: 90%;text-align: left; padding-left: 5px ">
							이메일 또는 문자메시지에 대한 불편으로 회원 탈퇴를 신청하려 하시나요?<br>
							[알림 설정]에서 받고 싶은 알림만 받도록 설정할 수 있습니다.
						</div>
					</div>
					<div style="padding-top:30px;">
						<div class="ui two column grid container">
							<div class="ui one center column container" style="padding: 17px; width: 90%; text-align: left;height: 54px;">
								<h5>보안 로그인</h5>
								개인정보 보호를 위하여 회원님의 비밀번호를 다시 한번 확인합니다.
							</div>
						
							<!-- <div class="center column container" style="padding: 17px; width: 30%; text-align: left;height: 54px;">
								<h5>보안 로그인</h5><br>
							</div>
							<div class="column container" style="padding-left: 20px; padding-top: 10px; padding-bottom: 0px; width: 60%;">
								빈공간
							</div> -->
							<div class="center column container" style="padding: 17px; width: 30%;">
								<span>*</span>이메일
							</div>
							<div class="column container" style="padding: 17px; width: 60%;">
								twins0313@naver.com
							</div>
							<div class="center column container" style="padding: 17px; width: 30%;">
								<span>*</span>비밀번호
							</div>
							<div class="column container" style="padding: 10px; width: 60%;">
								<div class="ui input">
									<input type="text" placeholder="비밀번호를 입력하세요." size="45px">
								</div>
							</div>
							<div class="center column container" style="padding: 17px; width: 30%;">
								
							</div>
							<div class="column container" style="padding: 10px; width: 60%; text-align:right">
								<div class="ui container" style="padding-right:30px; ">
									<button class="ui blue button" >로그인</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


	<!-- main 입력 끝-->

	</div>

<!----------------------------------------------------------------------- main content 끝 --->
<!--======================================================================================-->
	
	<div class="ui basicspace"><!-- login title와 main content 여백 -->	</div>
	
<!----------------------------------------------------------------------- footer content 시작 -->
	<!-- footer 시작-->
		<footer class="footer">
			<div class="ui inverted segment">
					<jsp:include page="../../common/menu/footerMenu.jsp"/>
			</div>
		</footer>
	<!-- footer 끝-->
<!----------------------------------------------------------------------- footer content 끝 -->
</body>
</html>