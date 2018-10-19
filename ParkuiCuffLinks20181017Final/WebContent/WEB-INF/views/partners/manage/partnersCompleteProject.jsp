<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>

<%
	List<Map<String, Object>> list = (List<Map<String, Object>>) request.getAttribute("getStateProject");
%>
<html>
<head>
<meta charset="UTF-8">
<title>완료한 프로젝트</title>
</head>
<body>
	<!----------------------------------------------------------------------- top 시작 -->
	<header class="header">
		<div class="ui">
			<!-- header 시작 -->
			<div class="ui">
				<jsp:include page="../../common/menu/PartnersHeaderMenu.jsp" />
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

		<div class="ui two column grid container" style="height: auto; margin-bottom: 10px;">
			<div class="ui column" style="width: 20%; padding-top: 0px; padding-left: 0px; padding-right: 0px">

				<!-- 로그인 정보 =================================================================================-->
				<div id="partnersback" class="ui segment">
					<jsp:include page="../../auth/PartnersLoginOk.jsp" />
				</div>
				<!-- 로그인 정보 =================================================================================-->

				<!-- 서브 메뉴 ===================================================================================-->
				<div id="partnersback" class="ui fluid vertical menu" style="padding-right: 0px">
					<a class="teal item active"> <font style="vertical-align: inherit;"> 완료한 프로젝트 </font>
					</a>
				</div>
				<!-- 서브 메뉴 ===================================================================================-->
			</div>
			<div class="ui column" style="padding-left: 5px; padding-top: 0px; padding-bottom: 0px; width: 80%;">
				<div id="partnersback" class="ui container" style="padding: 20px; padding-bottom: 20px; left: 5px; border: 1px solid #dedede;">
					<h3 style="text-align: left">완료한 프로젝트</h3>
					<h5 class="ui grey header" style="text-align: left">성공적으로 완료한 프로젝트를 확인할 수 있습니다.</h5>
				</div>
				<div style="height: 20px;"></div>
				<div class="ui two column grid container" style="padding-top: 0px; border: 1px solid #dedede; margin-bottom: 5px;">
					<div class="column" style="width: 10%; padding: 20px">
						<img class="ui medium circular image" style="width: 40px;" src="../../image/process-guide-success.png">
					</div>
					<div class="column" style="width: 90%; text-align: left; padding-left: 5px;">
						1. 평가를 완료한 프로젝트 목록입니다.<br> 2. 클라이언트가 남긴 평가는 <strong>[프로필 정보 관리] > [프로젝트 히스토리]</strong>에서 확인할 수 있습니다.

					</div>
				</div>
				<div style="padding-top: 20px; padding-bottom: 0px; padding-left: 15px; padding-right: 15px; border: 1px solid #dedede; background-color: #dedede;">

					<%
						if (list == null && list.size() > 0) {
					%>
					<div style="text-align: left; padding-left: 10px; padding-top: 20px; padding-bottom: 0px">완료한 프로젝트가 없습니다.</div>
					<%
						}
					%>
					<%
						for (int i = 0; i < list.size(); i++) {
					%>
					<div class="ui" style="position: relative; margin-bottom: 20px; padding-left: px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px; text-align: left;">
						<div class="ui column segment" style="padding-top: 10px;" align="left">
							<!-- *********************************************************************************************************************************************20181013 수정요청사항 -->
							<div class="ui black top left attached label" style="position: absolute; top: -10px; left: -10px;">완료</div>
							<h3 class="ui teal header">
								<a href=""><%=list.get(i).get("PRO_NAME")%></a>
							</h3>
							<div class="sub header">
								<i class="won sign icon"></i>예상금액&nbsp;&nbsp;<%=list.get(i).get("PRO_PRICE")%>
								&nbsp;원 &nbsp; &nbsp; | &nbsp; &nbsp; <i class="clock outline icon"></i>예상기간&nbsp;<%=list.get(i).get("PRO_PERIOD")%>
							</div>
							<p style="margin-bottom: 30px;"></p>
							<div class="sub header" style="margin-bottom: 10px;" align="left">
								<%=list.get(i).get("CATE_MAIN")%>
								<i class="angle right icon"></i><%=list.get(i).get("CATE_SUB")%>
								&nbsp;&nbsp;|&nbsp; &nbsp; 위치<i class="angle right icon"></i><%=list.get(i).get("PRO_ADDR")%>
							</div>
						</div>
					</div>
					<%
						}
					%>
				</div>
			</div>
		</div>

		<!-- main 입력 끝-->

	</div>

	<!----------------------------------------------------------------------- main content 끝 --->
	<!--======================================================================================-->

	<!-- <div class="ui basicspace">
		login title와 main content 여백
	</div> -->

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