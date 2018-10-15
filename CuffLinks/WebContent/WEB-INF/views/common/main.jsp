/<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="./ui.jsp" />

<title>Cufflink</title>
<style link rel="stylesheet" href="/css/main.css"></style>
<jsp:include page="./loading.jsp" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<!-- //chatting -->
<link rel="stylesheet" href="../css/main.css" />
</head>
<body>
	<div class="wrap">
		<div class="ui container">
			<div class="ui secondary pointing menu" style="margin-bottom: 50px;">
				<a href="/"><img src="/image/logo.jpg" class="ui image tiny"
					alt="" style="float: left; margin-right: 10px" /></a> <a
					href="/auth/login" id="projectRegister"
					class="projectRegister item">프로젝트 등록 </a> <a
					href="../project/page?pagenum=1" id="projectFind"
					class="projectFind item">프로젝트 찾기 </a> <a
					href="../partners/partnersList" id="partnersList"
					class="partnersList item">파트너스 목록 </a>
				<div class="right menu">
					<div class="item">
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

		<div style="text-align: center;">
			<h4>앱 개발, 웹 디자인, 쇼핑몰제작, 워드프레스 제작등</h4>
			<h1>안전한 아웃소싱 플랫폼</h1>
			<h5>위시켓의 새로운 아웃소싱을 시작해 보세요</h5>
			<button class="ui button blue" onclick="location.href='/auth/login'">
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
	<div style="background-color: rgb(243, 244, 247);">
		<div class="ui container"
			style="padding-top: 5px; padding-bottom: 5px; font-size: 1.5em; text-align: center; background-color: #A9D0F5; border-bottom: 1px solid #000;">
			<img src="../image/logo.png" alt="" style="margin-right: 10px;" />
			등록된 프로젝트
		</div>
		<div class="ui container" style="padding-top: 20px;">
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
	<div style="height: 20px;"></div>
	<div class="ui container"
		style="position: relative; padding-top: 5px; padding-bottom: 5px; font-size: 1.5em; text-align: center; background-color: #A9D0F5; border-bottom: 1px solid #000;">
		<img src="../image/logo.png" alt="" style="margin-right: 10px;" />
		클라이언트 의뢰 주변 검색
		<div class="ui mini search"
			style="position: absolute; top: 2px; right: 0; float: right;">
			<div class="ui icon input">
				<div class="ui search" style="">
					<input class="prompt" id="MapSearch" type="text"
						placeholder="Search countries..." style="height: 20px;"> <i
						class="search icon"></i>
				</div>
				<div class="results"></div>
			</div>
		</div>
	</div>

	<div class="ui container"
		style="padding-top: 0px; text-align: center; height: 480px; background-color: #dedede;">
		<div>
			<jsp:include page="../map/Mapdisplay1.jsp" />
		</div>
	</div>
	<div style="height: 30px; margin: 0 auto;" align="center"></div>

	<div class="ui container"
		style="padding-top: 5px; padding-bottom: 5px; font-size: 1.5em; text-align: center; background-color: #A9D0F5; border-bottom: 1px solid #000;">
		<img src="../image/logo.png" alt="" style="margin-right: 10px;" />
		우리와 함께하는 회사
	</div>
	<div class="ui container" style="padding-top: 20px; text-align: center">
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
				$('.content').text($('.content').text().substring(0, len))
					.append('...')
			}
		}
		autoSplit(100);
	</script>
</body>
</html>