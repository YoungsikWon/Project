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
				<jsp:include page="../common/menu/navigationClientMenu.jsp"/>
			</div>
	<!-- navigation menu 종료-->
		</div>
	</header>
<!----------------------------------------------------------------------- top 끝 -->

	<div class="ui basicspace"><!-- navigation menu와 여백 --></div>
	
<!--======================================================================================-->
<!----------------------------------------------------------------------- main content 시작 -->
	<div class="ui container contentMain">
		
	<!-- title 시작-->
		<div class="ui container">
			<div class="content-header">
				<div class="ui two column grid container">
					<div class="column">
						<h3 class="content-text">로그인</h3>
						<small class="small-text">CuffLink에 오신 것을 환영합니다.</small>
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
				<div class="ui two column grid container" style="padding:20px;height:400px;">
					<div class="column grid" style="border-right: 1px solid #dedede; vertical-align: middle;padding: 20px; width: 60%;">
						<div class="ui two column grid container">
							<div class="center column container" style="padding: 17px; width: 35%;">
								<span>*</span>아이디 또는 이메일
							</div>
							<div class="column container" style="padding: 10px; width: 65%;">
								<div class="ui left icon input">
									<input type="text" placeholder="아이디 또는 이메일" size="40px">
									<i class="id badge icon"></i>
								</div>
							</div>
							<div class="center column container" style="padding: 17px; width: 35%;">
								<span>*</span>비밀번호
							</div>
							<div class="column container" style="padding: 10px; width: 65%;">
								<div class="ui left icon input">
									<input type="text" placeholder="비밀번호" size="40px"> 
										<i class="key icon"></i>
								</div>
							</div>
							<div class="column container" style="padding: 10px; width: 35%;"></div>
							<div class="column container" style="padding: 10px; width: 65%;">
								<div class="ui checkbox">
									<input type="checkbox" name="example"/> 
									<label>로그인 상태 유지</label>
								</div>
							</div>
							<div class="column container" style="padding: 10px; width: 35%;"></div>
							<div class="column container" style="padding: 20px; width: 65%; text-align:center;">
								<div class="ui two column grid container" >
									<div class="cloumn container" style="width:50%;">
										<div class="ui fluid animated fade button" tabindex="0">
											<div class="visible content">로 그 인</div>
											<div class="hidden content">
												<a href="#">Login Click</a>
											</div>
										</div>
									</div>
										
									<div class="cloumn  container" style="width:50%;">
										<div class="ui fluid animated fade button" tabindex="0">
											<div class="visible content">회원가입</div>
											<div class="hidden content">
												<a href="#">Join Click</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="column container" style="padding: 10px; width: 35%;"></div>
							<div class="column container" style="padding: 10px; width: 65%;">
								<label>비밀번호를 잊으셨나요? <a href="#">아이디 비밀번호 찾기</a></label>
							</div>
						</div>
					</div>
					<div class="column grid" style="padding: 10px; width: 40%;">
						<div class="column-login2">
							<a href="#"><img src="/image/auth/naverLoginButton.jpg"></a>
						</div>
						<div class="column-login2">
							<a href="#"><img src="/image/auth/facebookLoginButton.jpg"></a>
						</div>
						<div class="column-login2">
							<a href="#"><img src="/image/auth/googleLoginButton.jpg"></a>
						</div>
						<div class="column-login2">
							<a href="#"><img src="/image/auth/kakaoLoginButton.jpg"></a>
						</div>
						<div class="column-login2">
							<a href="#"><img src="/image/auth/lineLoginButton.jpg"></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- main 입력 끝-->
	
	</div>
<!------------------------------------------------------------------------ main content 끝 -->
<!--======================================================================================-->
	
	<div class="ui basicspace"><!-- title와 main content 여백 -->	</div>
	
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