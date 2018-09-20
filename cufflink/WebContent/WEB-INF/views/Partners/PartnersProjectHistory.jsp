<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/ui.jsp"/>
<meta charset="UTF-8">
<title>프로젝트 히스토리</title>
<link rel="stylesheet" href="./css/cuffLink.css" />
<link rel="stylesheet" href="./css/login.css" />
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

	<div class="ui container">
	
	<!-- main 입력 시작-->

		<div class="ui two column grid container" style="height: 670px">
			<div class="ui column" style="width: 20%;padding-top: 0px;padding-left: 0px;padding-right: 0px">
<!-- 로그인 정보 =================================================================================-->
				<div class="ui segment">
					<jsp:include page="../auth/loginOk.jsp" />
				</div>
<!-- 로그인 정보 =================================================================================-->

<!-- 서브 메뉴 ===================================================================================-->
				<div class="ui fluid vertical menu" style="padding-right: 0px">
					<jsp:include page="../info/PartnersInfoSubmenu.jsp" />
				</div>
<!-- 서브 메뉴 ===================================================================================-->			
			</div>
			<div class="ui column" style="padding-left: 5px; padding-top: 0px; padding-bottom: 0px; width: 80%;">
				<div class="ui container" style="padding: 20px; padding-bottom: 30px; left: 5px; border: 1px solid #dedede; height: auto">
					<div style="padding-bottom:20px;">
						<h3 style="text-align: left">프로젝트 히스토리</h3>
					</div>
					<div class="ui container" style="padding-top: 0px; padding-bottom: 30px; padding-left: 0px; padding-right: 0px;">
						<hr class="dotted" style="" />
					</div>
					<div class="ui two column grid container" style="border:1px solid #dedede; padding-right: 20px;">
						<div class="column" style="width=50%; border-right: 1px solid #dedede;">
							<div class="ui two column grid">
								<div class="column" style="width:60%">
									프로젝트 등록
								</div>
								<div class="column" style="width:40%; text-align:right; padding-right: 20px;">
									0 건
								</div>
								<div class="column" style="width:60%">
									계약한 프로젝트
								</div>
								<div class="column" style="width:40%; text-align:right; padding-right: 20px;">
									0 건
								</div>
								<div class="column" style="width:60%">
									계약률
								</div>
								<div class="column" style="width:40%; text-align:right; padding-right: 20px;">
									0 %
								</div>
								<div class="column" style="width:60%">
									진행중인 프로젝트
								</div>
								<div class="column" style="width:40%; text-align:right; padding-right: 20px;t">
									0 건
								</div>
								<div class="column" style="width:60%">
									완료한 프로젝트
								</div>
								<div class="column" style="width:40%; text-align:right; padding-right: 20px;">
									0 건
								</div>
							</div>
							<div class="ui container" style="padding-top: 20px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px;">
								<hr class="dotted" style="" />
							</div>
							<div class="ui two column grid">
								<div class="column" style="width:60%">
									누적 완료 금액
								</div>
								<div class="column" style="width:40%; text-align:right; padding-right: 20px;">
								
								</div>
								<div class="column" style="width:60%">
								￦		
								</div>
								<div class="column" style="width:40%; text-align:right; padding-right: 20px;">
									0 원
								</div>
							</div>
						</div>
						<div class="column" style="width=50%">
							<div class="ui container" style="padding-top: 10px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px; text-align:center;">
								<h5>평균평점 <div class="ui star rating" data-rating="3"></div> 0.0 / 평가 0개</h5>
							</div>
							<div class="ui container" style="padding-top: 0px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px;">
								<hr class="dotted" style="" />
							</div>
							<div class="ui two column grid">
								<div class="column" style="padding-left: 20px; width:60%">
									전문성
								</div>
								<div class="column" style="width:40%; text-align:right">
									 <div class="ui star rating" data-rating="3"></div> 0.0
								</div>
								<div class="column" style="padding-left: 20px; width:60%">
									사전 준비
								</div>
								<div class="column" style="width:40%; text-align:right">
									 <div class="ui star rating" data-rating="3"></div> 0.0
								</div>
								<div class="column" style="padding-left: 20px; width:60%">
									의사소통
								</div>
								<div class="column" style="width:40%; text-align:right">
									 <div class="ui star rating" data-rating="3"></div> 0.0
								</div>
								<div class="column" style="padding-left: 20px; width:60%">
									일정 준수
								</div>
								<div class="column" style="width:40%; text-align:right">
									 <div class="ui star rating" data-rating="3"></div> 0.0
								</div>
								<div class="column" style="padding-left: 20px; width:60%">
									적극성
								</div>
								<div class="column" style="width:40%; text-align:right">
									 <div class="ui star rating" data-rating="3"></div> 0.0
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
					<jsp:include page="../common/menu/footerMenu.jsp"/>
			</div>
		</footer>
	<!-- footer 끝-->
<!----------------------------------------------------------------------- footer content 끝 -->
<!-- 평균평점 관련 스크립트 -->
<script type="text/javascript">
$('.ui.rating')
  .rating({
    initialRating: 2,
    maxRating: 5
  });
</script>
<!-- 평균평점 관련 스크립트 -->
</body>
</html>