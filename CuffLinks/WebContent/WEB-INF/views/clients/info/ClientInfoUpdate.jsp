<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클라이언트 정보 등록</title>
</head>
<body>
	<!----------------------------------------------------------------------- top 시작 -->
	<header class="header">
		<div class="ui">
			<!-- header 시작 -->
			<div class="ui">
				<jsp:include page="../../common/menu/headerMenu.jsp" />
			</div>
			<!-- header 종료 -->
		</div>
	</header>
	<!----------------------------------------------------------------------- top 끝 -->

	<div class="ui basicspace">
		<!-- navigation menu와 여백 -->
	</div>

	<!--======================================================================================-->
	<!----------------------------------------------------------------------- main content 시작 -->

	<div class="ui container">

		<!-- main 입력 시작-->

		<div class="ui two column grid container" style="height: 670px">
			<div class="ui column" style="width: 20%; padding-top: 0px; padding-left: 0px; padding-right: 0px">
								
<!-- 로그인 정보 =================================================================================-->
				<div class="ui segment">
					<jsp:include page="../../auth/loginOk.jsp" />
				</div>
<!-- 로그인 정보 =================================================================================-->

<!-- 서브 메뉴 ===================================================================================-->
				<div class="ui fluid vertical menu" style="padding-right: 0px">
					<jsp:include page="./ClientInfoSubmenu.jsp" />
				</div>
<!-- 서브 메뉴 ===================================================================================-->				
			</div>
			<div class="ui column" style="padding-left: 5px; padding-top: 0px; padding-bottom: 0px; width: 80%;">
				<div class="ui container" style="padding: 20px; padding-bottom: 20px; left: 5px; border: 1px solid #dedede; height: 620px">
					<div style="padding-bottom: 20px;">
						<h3 style="text-align: left">클라이언트 정보</h3>
					</div>
					<div class="ui container" style="padding-top: 0px; padding-bottom: 30px; padding-left: 0px; padding-right: 20px;">
						<hr class="dotted" style="" />
					</div>
					<div class="ui container">
						<div class="ui two column grid container">
							<div class="center column container" style="margin-top: 0px; margin-left: 0px; margin-right: 0px; margin-bottom: 10px; width: 25%;">
								<span>*</span>클라이언트 소개<br> <br> <br> <br> <br>
								<br>
							</div>
							<div class="column container" style="padding-top: 0px; width: 75%">
								<div class="ui comments">
									<div class="field">
										<textarea style="margin: 0px; height: 196px; width: 505px;"></textarea>
									</div>
									<p>회사(개인)에 대해 간략하게 설명해주세요(150자 이내)</p>
								</div>
							</div>
							<div class="center column container"
								style="margin-top: 0px; margin-left: 0px; margin-right: 0px; margin-bottom: 0px; width: 25%;">
								홈페이지 주소
							</div>
							<div class="column container" style="padding: 10px; width: 75%">
								<div class="ui input">
									<input type="text" placeholder="홈페이지 주소를 입력하세요." size="50px">
								</div>
							</div>
							<div class="center column container" style="margin-top: 0px; margin-left: 0px; margin-right: 0px; margin-bottom: 0px; width: 25%;">

							</div>
							<div class="column container" style="padding: 10px; width: 75%; text-align:right;">
								<div class="right menu">
									<button class="ui button" style="margin-right: 10px;" onclick="window.location.href='/clients/ClientInfo'" />
										취소
									</button>
									<button class="ui primary button" style="margin-right: 10px;" onclick="window.location.href='/clients/ClientInfo'" />
										등록완료
									</button>
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

	<div class="ui basicspace">
		<!-- login title와 main content 여백 -->
	</div>

	<!----------------------------------------------------------------------- footer content 시작 -->
	<!-- footer 시작-->
	<footer class="footer">
		<div class="ui inverted segment">
			<jsp:include page="../../common/menu/footerMenu.jsp" />
		</div>
	</footer>
	<!-- footer 끝-->
	<!----------------------------------------------------------------------- footer content 끝 -->
</body>
</html>