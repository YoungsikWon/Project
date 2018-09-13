<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join-(회원가입)</title>

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

	<div class="ui basicspace"><!-- navigation menu와 여백 --></div>
	
<!----------------------------------------------------------------------- main content 시작 -->
<!----------------------------------------------------------------------- main content 시작 -->
	<div class="ui container contentMain-join">
		
	<!-- title 시작-->	
		<div class="ui container">
			<div class="content-header">
				<div class="ui two column grid container">
					<div class="column">
						<h3 class="content-text">회원가입</h3>
						<small class="small-text">CuffLink에 오신 것을 환영합니다.</small>
					</div>
					<div class="column" style="text-align:right;margin:10px 0px;">
						<!-- 우측에 입력할 수 있는 공간 확보 -->
					</div>
				</div>
			</div>
		</div>		
	<!-- title 끝-->

	<div class="ui basicspace"><!-- login title와 main content 여백 -->	</div>

	<!-- main 입력 시작-->
		<div class="ui container">
			<div class="content-middle-join">
				<div class="ui two column grid container" style="padding: 20px">
					<div class="column grid" style="padding: 10px; width:60%; border-right: 1px solid #dedede;">
						<div class="ui three column grid container " >
							<div class="center column container" style="padding:10px;width:30%;height:210px; vertical-align:middle">
								<span>*</span>이용목적
							</div>
							<div class="column container" style="padding:10px;width:70%;">
								<div class="ui two column grid container" style="padding:10px;">	
									<div class="column container" style="padding:10px; width: 50%;text-align:center; vertical-align:middle; outline: dotted gray 0.5px;">
										<p>프로젝트를 의뢰하고 싶습니다</p>
										<div class="ui image">
											<img src="../image/client.jpg" style="padding:10px">
										</div>
										<div>
											<input type="radio" name="radio" checked="checked">
										</div>
										<div>
											<p>클라이언트</p>
											<hr class="garo"/>
										</div>
										<div>
											<p>의뢰할 프로젝트가 있는 <br> 기업, 개인</p>	
										</div>
									</div>
									<div class="column container" style="padding:10px; width: 50%;text-align:center; vertical-align:middle; outline: dotted gray 0.5px;">
										<p>일거리를 찾고 있습니다</p>
										<div class="ui image">
											<img src="../image/partners.jpg" style="padding:10px">
										</div>
										<div>
											<input type="radio" name="radio" checked="checked">
										</div>
										<div>
											<p>파트너스</p>
											<hr class="garo"/>
										</div>
										<div>
											<p>프로젝트의 수주를<br> 원하는 기업, 개인</p>	                     
										</div>
									</div>
								</div>
							</div>
							<div class="center column container" style="padding:10px;width:30%;">
								<span>*</span>이메일
							</div>
							<div class="ui left icon input" style="padding:10px;width:60%">
								<input type="text" placeholder="이메일" size="40px"> 
								<i class="id envelope icon"></i>
							</div>
							<div class="center-right" style="padding:0px;width:10%">
								중복
							</div>
							
							<div class="center column container" style="padding:10px;width:30%;">
								<span>*</span>아이디
							</div>
							<div class="ui left icon input" style="padding:10px;width:60%;">
								<input type="text" placeholder="아이디" size="40px"> 
								<i class="id badge icon"></i>
							</div>
							<div class="center-right" style="padding:0px;width:10%">
								중복
							</div>
					
							<div class="center column container" style="padding:10px;width:30%;">
								<span>*</span>비밀번호
							</div>
							<div class="ui left icon input" style="padding:10px;width:60%;">
								<input type="text" placeholder="비밀번호" size="40px"> 
								<i class="key icon"></i>
							</div>
							<div class="center-right" style="padding:0px;width:10%">
								중복	
							</div>
							
							<div class="center column container" style="padding:10px;width:30%;">
								<span>*</span>비밀번호 재입력
							</div>
							<div class="ui left icon input" style="padding:10px;width:60%;">
								<input type="text" placeholder="비밀번호" size="40px"> 
								<i class="key icon"></i>
							</div>
							<div class="center-right" style="padding:0px;width:10%;">
							</div>
							<div class="column container" style="padding:10px; width:30%;"></div>
							<div class="column container" style="padding:10px; width:70%;">
								<div class="ui checkbox">
									<input type="checkbox" name="example"> 
									<a href="#">이용약관</a> 및 <a href="#">개인정보 처리방침</a>에 동의합니다.
								</div>
							</div>
							
							<div class="column container" style="padding: 10px; width: 30%;"></div>
							
							<div class="column container" style="padding: 10px; width: 70%;">
								<div class="ui fluid animated fade button" tabindex="0">
									<div class="visible content">회원가입</div>
									<div class="hidden content">
										<a href="#">Join Click</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="column grid" style="padding: 10px; width: 40%;">
						<div class="content-header">
							<h4 class="content-text">기존계정이 있는 고객</h4>
							<small class="small-text">아래의 계정을 이용하실수 있습니다.</small>
						</div>
						<div class="column-login2">
							<a href="#"><img src="../image/naverLoginButton.jpg"></a>
						</div>
						<div class="column-login2">
							<a href="#"><img src="../image/facebookLoginButton.jpg"></a>
						</div>
						<div class="column-login2">
							<a href="#"><img src="../image/googleLoginButton.jpg"></a>
						</div>
						<div class="column-login2">
							<a href="#"><img src="../image/kakaoLoginButton.jpg"></a>
						</div>
						<div class="column-login2">
							<a href="#"><img src="../image/lineLoginButton.jpg"></a>
						</div>
						<div class="column-login2" style="height:10px;">
						</div>
						<div class="content-header" style="padding:10px;text-align:center">
							<div class="ui two column grid" style="padding:10px;">
								<div class="column" style="padding:20px;">
								</div>
								<div class="column">
									<div class="ui column animated fade button" tabindex="10">
										<div class="visible content">로 그 인</div>
										<div class="hidden content">
											<a href="#">Login Click</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- main 입력 끝-->
	
	</div>
<!----------------------------------------------------------------------- main content 끝 -->
<!----------------------------------------------------------------------- main content 끝 -->
	
	<div class="ui basicspace"><!-- login title와 main content 여백 -->	</div>
	
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