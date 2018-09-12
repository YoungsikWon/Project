<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="./ui.jsp" />
<title>Cufflink</title>
<link rel="stylesheet" href="../css/cuffLink.css" />
</head>
<body>
	<div class="wrap">
		<div class="ui container">
			<div class="ui secondary pointing menu" style="margin-bottom: 50px;">
				<a class="item"> Home </a>
				<a class="item"> Messages </a>
				<a class="item active"> Friends </a>
				<div class="right menu">
					<div class="item">
						<button class="ui button" style="margin-right: 10px;" onclick="window.location.href='./login.jsp'" />로그인</button>
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
					<h2>13,000개</h2>
				</div>
				<div class="ui segment">
					<h5>프로젝트 등록 금액</h5>
					<h2>13,000,000원</h2>
				</div>
				<div class="ui segment">
					<h5>개발회사 프리랜서</h5>
					<h2>4,300명</h2>
				</div>
			</div>
		</div>
	</div>
	<div style="background-color: rgb(243, 244, 247); height: 43em;">
		<div style="padding-top: 50px; font-size: 1.5em; text-align: center;">
			<img src="./img/logo.png" alt="" style="margin-right: 10px;" />
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
		<img src="./img/logo.png" alt="" style="margin-right: 10px;" />
		우리와 함께하는 회사
	</div>
	<div class="ui container" style="padding-top: 50px; text-align: center">
		<div class="ui small images">
			<img class="logo" src="./img/logo1.png">
			<img class="logo" src="./img/logo2.png">
			<img class="logo" src="./img/logo3.png">
			<img class="logo" src="./img/logo4.png">
			<img class="logo" src="./img/logo5.png">
			<img class="logo" src="./img/logo6.png">
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
	</script>
</body>
</html>