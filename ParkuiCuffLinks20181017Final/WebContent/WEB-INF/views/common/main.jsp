<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<html>
<head>
<style type="text/css">
.p-intro {
	overflow: hidden;white-space: nowrap;text-overflow: ellipsis;
	}
</style>
<meta charset="UTF-8">
<jsp:include page="./ui.jsp" />
<%
	List<Map<String, Object>> main_pro = (List<Map<String, Object>>) request.getAttribute("MainProject");
%>
<title>Cufflink</title>
<link rel="stylesheet" href="/css/main.css " />
<link href="https://fonts.googleapis.com/earlyaccess/nanumgothic.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/earlyaccess/nanumbrushscript.css" rel="stylesheet">
<jsp:include page="./loading.jsp" />
<!-- 숫자 또로록 -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
<script src="/js/jquery.counterup.min.js"></script>
<script type="text/javascript">
	$(document).ready(function($) {
		$('.counter').counterUp({
			delay : 10,
			time : 1000
		});

	});
</script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<!-- //chatting -->
<link rel="stylesheet" href="../css/main.css" />
</head>
<body>

	<div class="wrap">
		<div class="ui container">
			<div class="ui secondary pointing menu" style="margin-bottom: 50px;">
				<a href="/"> <img src="/image/logo.jpg" class="ui image tiny" alt="" style="float: left; margin-right: 10px" />
				</a> <a href="/auth/login" id="projectRegister" class="projectRegister item" style="font-weight: bold">프로젝트 등록 </a> <a href="../project/page?pagenum=1" id="projectFind" class="projectFind item" style="font-weight: bold">프로젝트 찾기 </a> <a href="../partners/partnersList" id="partnersList" class="partnersList item" style="font-weight: bold">파트너스 목록 </a>
				<div class="right menu">
					<div class="item">
						<button class="ui button" style="margin-right: 10px;" onclick="location.href='/auth/login'">로그인</button>
						<button class="ui primary button" style="margin-right: 10px;" onclick="location.href='/auth/join'">회원가입</button>
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

				<div class="ui segment" style="width: 33.3%; background-color: #F5A9A9; border: 1px solid #fff;">
					<div style="background-color: #fff;">
						<h3>등록된 프로젝트</h3>
					</div>
					<h3>
						<span class="counter">14,234</span>개
					</h3>

				</div>
				<div class="ui segment" style="width: 33.3%; background-color: #F5A9A9; border: 1px solid #fff;">
					<div style="background-color: #fff;">
						<h3>프로젝트 등록 금액</h3>
					</div>
					<h3>
						<span>$</span> <span class="counter">142,030,018,631</span>원
					</h3>

				</div>
				<div class="ui segment" style="width: 33.3%; background-color: #F5A9A9; border: 1px solid #fff;">
					<div style="background-color: #fff;">
						<h3>개발회사 프리랜서</h3>
					</div>
					<h3>
						<span class="counter">54,453</span>명
					</h3>

				</div>

			</div>
		</div>
	</div>
	<div style="background-color: rgb(243, 244, 247);">
		<div class="ui container" style="padding-top: 5px; padding-bottom: 5px; font-size: 1.2em; font-weight: bold; text-align: center; background-color: #CED8F6;">
			<img src="../image/logo.png" alt="" style="margin-right: 10px;" /> 등록된 프로젝트
		</div>
		<div class="ui container" style="padding-top: 20px;">
			<div class="ui three column grid">
				<%
					for (int i = 0; i < 6; i++) {
				%>
				<div class="column">
					<div class="ui segment" style="background-color: #E0E6F8;">
						<div class="p-intro" style="background-color: #D8D8D8;">
							<a href="#" class="title" style="color: red;"><%=main_pro.get(i).get("PRO_NAME")%></a>
						</div>
						<p></p>
						<span> <i class="won sign icon"></i> <%=main_pro.get(i).get("PRO_PRICE")%>
						</span> <span class="middle"> <i class="clock outline icon"></i> <%=main_pro.get(i).get("PRO_PERIOD")%>
						</span> <span> <i class="pencil alternate icon"></i> <%=main_pro.get(i).get("PRO_SKILL")%>
						</span>
						<p></p>
						<p class="content">
							<프로젝트 진행 방식> 시작 시점에 오프라인 미팅 필요 진행 간 정기 미팅을 통해 업무 상황 공유 부탁드립니다.프로젝트 진행 방식> 시작 시점에 오프라인 미팅 필요 진행 간 정기 미팅을 통해 업무 상황 공유 부탁드립니다. 
						</p>
					</div>
				</div>
				<!-- column -->
				<%
					}
				%>
			</div>
			<!--three column  -->

		</div>
		<!-- container -->
	</div>
	<div style="height: 20px;"></div>
	<div class="ui container" style="position: relative; padding-top: 5px; padding-bottom: 5px; font-size: 1.2em; font-weight: bold; text-align: center; background-color: #CED8F6;">
		<img src="../image/logo.png" alt="" style="margin-right: 10px;" /> 클라이언트 의뢰 주변 검색
		<div class="ui mini search" style="position: absolute; top: 2px; right: 0; float: right;">
			<div class="ui icon input">
				<div class="ui search" style="">
					<!-- 지도검색 -->
					<input class="prompt" id="MapSearch" type="text" placeholder="Search countries..." style="height: 25px;"> <i class="search icon"></i>
					<!-- 지도검색 -->
				</div>
				<div class="results"></div>
			</div>
		</div>
	</div>

	<div class="ui container" style="padding-top: 0px; text-align: center; height: 480px; background-color: #dedede;">
		<div>
			<jsp:include page="../map/Mapdisplay1.jsp" />
		</div>
	</div>
	<div style="height: 30px; margin: 0 auto;" align="center"></div>

	<div class="ui container" style="padding-top: 5px; padding-bottom: 5px; font-size: 1.2em; font-weight: bold; text-align: center; background-color: #CED8F6;">
		<img src="../image/logo.png" alt="" style="margin-right: 10px;" /> 우리와 함께하는 회사
	</div>
	<div class="ui container" style="padding-top: 20px; text-align: center; background-color: #E0E6F8;">
		<div class="ui small images">
			<img class="logo" src="../image/logo1.png"> <img class="logo" src="/image/logo2.png"> <img class="logo" src="/image/logo3.png"> <img class="logo" src="/image/logo4.png"> <img class="logo" src="/image/logo5.png"> <img class="logo" src="/image/logo6.png">
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

		/* var lengt = $('.title').text().length;
		if (lengt > 16) {
			$('.title').text($('.title').text().substring(0, 16)).append('...')
		} */
	</script>

</body>
</html>