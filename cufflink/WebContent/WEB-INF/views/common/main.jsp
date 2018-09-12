<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="./ui.jsp" />
<title>Cufflink</title>
<style>
.wrap {
	background-image: url("./img/배너.png");
	height: 400px;
	background-position: center; /* Center the image */
	background-repeat: no-repeat; /* Do not repeat the image */
	background-size: cover;
	.
	/* Resize the background image to cover the entire container */
}

h1 {
	font-size: 4em;
}

h2 {
	font-size: 3em;
}

h4 {
	font-size: 20px;
}

h5 {
	font-size: 16px;
	margin-top: 14px;
	margin-bottom: 20px;
}

.ui.segment {
	text-align: center !important;
}

.title {
	font-size: 1.5em;
}

span {
	padding-left: 5px;
	padding-right: 5px;
}

.middle {
	border-left: groove thin;
	border-right: groove thin;
}

.content {
	font-size: 1.2em;
}

.logo {
	margin-left: 20px !important;
}
</style>
</head>
<body>
	<div class="wrap">
		<div class="ui container">
			<div class="ui secondary pointing menu" style="margin-bottom: 50px;">
				<a class="item" href="/layout"> Home </a>
				<a class="item"> Messages </a>
				<a class="item active"> Friends </a>
				<div class="right menu">
					<div class="item">
						<button class="ui button" style="margin-right: 10px;" onclick="move('/auth/login')">로그인</button>
						<button class="ui primary button">회원가입</button>
					</div>
				</div>
			</div>
		</div>
		<p></p>
		<div style="text-align: center;">
			<h4>앱 개발, 웹 디자인, 쇼핑몰제작, 워드프레스 제작등</h4>
			<h1>빠르고 안전한 아웃소싱 플랫폼</h1>
			<h5>위시켓의 새로운 아웃소싱을 시작해 보세요</h5>
			<button class="ui button blue">
				<h4>무료로 프로젝트 등록하기</h4>
			</button>
		</div>
	</div>
	<p></p>
	<div class="ui container" style="margin-bottom: 16px;">
		<div class="ui segments">
			<div class="ui horizontal segments">
				<div class="ui segment">
					<h5>등록된 프로젝트</h5>
					<h2>13,000</h2>
					개
				</div>
				<div class="ui segment">
					<h5>프로젝트 등록 금액</h5>
					<h2>13,000,000</h2>
					원
				</div>
				<div class="ui segment">
					<h5>개발회사 프리랜서</h5>
					<h2>4,300</h2>
					명
				</div>
			</div>
		</div>
	</div>
	<div style="background-color: rgb(243, 244, 247); height: 43em;">
		<div style="padding-top: 50px; font-size: 1.5em; text-align: center;">
			<img src="/image/logo.png" alt="" style="margin-right: 10px;" />
			등록된 프로젝트
		</div>
		<div class="ui container" style="padding-top: 50px;">
			<div class="ui three column grid">
				<div class="column">
					<div class="ui segment">
						<a href="#" class="title">기 개발된 ...</a>
						<p></p>
						<span> <i class="won sign icon"></i> 1,000,000원
						</span> <span class="middle"> <i class="clock outline icon"></i>
							120일
						</span> <span> <i class="pencil alternate icon"></i> 7명지원
						</span>
						<p></p>
						<p class="content">
							<프로젝트 진행 방식> 시작 시점에 오프라인 미팅 필요 진행 간 정기 미팅을 통해 업무 상황 공유
							부탁드립니다.프로젝트 진행 방식> 시작 시점에 오프라인 미팅 필요 진행 간 정기 미팅을 통해 업무 상황 공유
							부탁드립니다. 
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="padding-top: 50px; font-size: 1.5em; text-align: center;">
		<img src="./img/logo.png" alt="" style="margin-right: 10px;" /> 우리와
		함께하는 회사
	</div>
	<div class="ui container" style="padding-top: 50px; text-align: center">
		<div class="ui small images">
			<img class="logo" src="../image/logo1.png"> <img class="logo"
				src="/image/logo2.png"> <img class="logo"
				src="/image/logo3.png"> <img class="logo"
				src="/image/logo4.png"> <img class="logo"
				src="/image/logo5.png"> <img class="logo"
				src="/image/logo6.png">
		</div>
	</div>
	<script>
		function autoSplit(len) { // 자동으로 len 길이만큼 글자수를 잘라주고 난후 ... 을 붙여준다
			var leng = $('.content').text().length;
			if (leng > 100) {
				$('.content').text($('.content').text().substring(0, len)).append('...')
			}
		}
		autoSplit(100);
		
		function move(url){
			location.href=url
		}
	</script>
</body>
</html>