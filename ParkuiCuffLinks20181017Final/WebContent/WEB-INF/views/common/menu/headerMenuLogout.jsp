<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- https://fontawesome.com 웹폰트사용에 필요 채팅문의에 들어간 아이콘이미지-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<jsp:include page="../ui.jsp" />
<link rel="stylesheet" href="../../css/cuffLink.css" />
<link rel="stylesheet" href="../../css/login.css" />
<div class="ui inverted segment"
	style="margin-top: 0px; padding-top: 3px; padding-bottom: 3px; margin-bottom: 0px;">
	<div class="ui container">
		<a href="/"><img src="/image/logo.jpg" class="ui image tiny"
			alt="" style="float: left; margin-right: 10px" /></a>
		<div class="ui inverted secondary pointing menu"
			style="margin-top: 0px;">
			<a href="../auth/login" id="projectRegister"
				class="projectRegister item">프로젝트 등록 </a> <a
				href="../project/page" id="projectFind"
				class="projectFind item">프로젝트 찾기 </a> <a
				href="../partners/partnersList" id="partnersList"
				class="partnersList item">파트너스 목록 </a>
			<div class="right mini menu">
				<div class="right menu"
					style="padding-top: 0; padding-bottom: 0; margin-top: 0; margin-bottom: 0;">
					<div id="mrc" class="mrc" style="margin-top: 0px;">
						<div id="mrc-win" class="mrc-win" style="">음성인식대기중...</div>
						<div id="voice" class="icon-font">
							<ul>
								<li><a href="#"><i class="fas fa-microphone-alt fa-1x"></i>
										<span class="tool">음성인식</span></a></li>
							</ul>
						</div>
					</div>

					<button class="ui button" style="margin-right: 10px;"
						onclick="location.href='/auth/login'" />
					로그인
					</button>
					<button class="ui primary button" style="margin-right: 10px;"
						onclick="location.href='/auth/join'" />
					회원가입
					</button>
				</div>
			</div>
		</div>
	</div>
</div>