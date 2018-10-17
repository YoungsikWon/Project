<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지원자 모집중</title>
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
		</div>
	</header>
<!----------------------------------------------------------------------- top 끝 -->

	<div class="ui basicspace"><!-- navigation menu와 여백 --></div>
	
<!--======================================================================================-->
	<!----------------------------------------------------------------------- main content 시작 -->

	<div class="ui container">

		<div class="ui two column grid container" style="height: 670px">
			<div class="ui column"
				style="width: 20%; padding-top: 0px; padding-left: 0px; padding-right: 0px">

<!-- 로그인 정보 =================================================================================-->
				<div class="ui segment">
					<jsp:include page="../../auth/loginOk.jsp" />
				</div>
<!-- 로그인 정보 =================================================================================-->
				
				<div class="ui fluid vertical menu" style="padding-right: 0px">
					<a href="/projectRecruiting" class="teal item active"> 
						<font style="vertical-align: inherit;"> 
							지원자 모집중 
						</font>
					</a> 
				</div>
			</div>
			<div class="ui column" style="padding-left: 5px; padding-top: 0px; padding-bottom: 0px; width: 80%;">
				<div class="ui container" style="padding: 20px; padding-bottom: 20px; left: 5px; border: 1px solid #dedede;">
					<h3 style="text-align: left">지원자 모집 중</h3>
					<h5 style="text-align: left">지원자를 모집 중인 프로젝트를 관리할 수 있습니다.</h5>
				</div>
				<div style="height: 10px;"></div>
				<div style="padding-top:20px;padding-bottom:20px;padding-left:15px;padding-right:15px; border: 1px solid #dedede;">
					<div style="height:10px;">
					</div>
					<div class="ui two column grid container" style="padding-top: 0px; border: 1px solid #dedede;">
						<div class="column" style="width: 10%; padding: 20px">
							<img class="ui medium circular image" style="width: 40px;" src="../../image/process-guide-success.png">
						</div>
						<div class="column" style="width: 90%; text-align: left; padding-left: 5px">
							1. 지원자 모집 중인 프로젝트 목록입니다.<br>
							2. [지원자 목록] 버튼을 클릭하여 지원자들의 지원 내역을 확인할 수 있습니다.<br>
							3. 미팅을 신청하면 스케줄 매니저가 미팅 조율을 도와드립니다.<br>
							4. 지원자 모집에 대한 문의는 고객센터로 연락 부탁드립니다.<br>
							고객센터: (02) 0000-0000 / help@cufflink.com
						</div>
					</div>
					<div style="text-align:left;padding-left:10px;padding-top:20px;padding-bottom:0px">
							지원자 모집 중인 프로젝트가 없습니다.			
					</div>
				</div>
			</div>
		</div>
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