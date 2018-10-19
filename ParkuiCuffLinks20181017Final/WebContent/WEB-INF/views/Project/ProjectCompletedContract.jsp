<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<Map<String, Object>> getState = (List<Map<String, Object>>) request.getAttribute("getState");
%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/ui.jsp" />
<meta charset="UTF-8">
<title>완료한 프로젝트</title>
</head>
<body>
	<!----------------------------------------------------------------------- top 시작 -->
	<header class="header">
		<div class="ui">
			<!-- header 시작 -->
			<div class="ui">
				<%
					if ("클라이언트".equals(request.getAttribute("kind").toString())) {
				%>
				<jsp:include page="../common/menu/headerMenu.jsp" />
				<%
					} else {
				%>
				<jsp:include page="../common/menu/PartnersHeaderMenu.jsp" />
				<%
					}
				%>
			</div>
			<!-- header 종료 -->

			<div class="ui">
				<!-- header와 navigation 여백 -->
			</div>

			<!-- navigation menu 시작 -->
			<!-- navigation menu 종료-->
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

		<div class="ui two column grid container" style="min-height: 670px; height: auto;">
			<div class="ui column" style="width: 20%; padding-top: 0px; padding-left: 0px; padding-right: 0px">

				<!-- 로그인 정보 =================================================================================-->
				<div class="ui segment" style="background-color: #E6E6E6;">
					<jsp:include page="../auth/loginOk.jsp" />
				</div>
				<!-- 로그인 정보 =================================================================================-->

				<!-- 서브 메뉴 ===================================================================================-->
				<div class="ui fluid vertical menu" style="padding-right: 0px; background-color: #E6E6E6;">
					<jsp:include page="./projectReviewContractSubmenu.jsp" />
				</div>
				<!-- 서브 메뉴 ===================================================================================-->
			</div>
			<div class="ui column" style="padding-left: 5px; padding-top: 0px; padding-bottom: 0px; width: 80%;">
				<div class="ui container" style="margin-bottom: 15px;padding: 20px; padding-bottom: 20px; left: 5px; border: 1px solid #dedede; background-color: #E0ECF8;">
					<h3 style="text-align: left">완료한 프로젝트</h3>
					<h5 style="text-align: left">성공적으로 완료한 프로젝트를 확인할 수 있습니다.</h5>
				</div>
				<div style="height: 10px;"></div>
				<div class="ui two column grid container" style="margin-bottom: 10px;padding-top: 0px; border: 1px solid #dedede;">
					<div class="column" style="width: 10%; padding: 20px">
						<img class="ui medium circular image" style="width: 40px;" src="../../image/process-guide-success.png">
					</div>
					<div class="column" style="width: 90%; text-align: left; padding-left: 5px">
						1. 프로젝트가 완료되어 대금이 지급된 프로젝트 목록입니다.<br> 2. 파트너가 남긴 평가는 [클라이언트 정보 관리] > [프로젝트 히스토리]에서 확인할 수 있습니다.
					</div>
				</div>
				<div style="padding-top: 20px; padding-bottom: 20px; padding-left: 15px; padding-right: 15px; border: 1px solid #dedede; min-height:420px;">
					
					<!-- ****************************************************************************************************************20181013 수정요청사항 -->
					<!-- <div style="padding: 7px;"></div> -->
					<!-- ****************************************************************************************************************20181013 수정요청사항 -->
					<%
						if (getState.size() <= 0) {
					%>
					<div style="text-align: left; padding-left: 10px; padding-top: 20px; padding-bottom: 0px;  background-color: #E6E6E6; height:40px;">평가 대기 중인 프로젝트가 없습니다.</div>
					<%
						} else {
					%>
					<%
						for (Map<String, Object> state : getState) {
					%>
					<div class="ui column segment" style="position: relative;padding-top: 0px; padding-left: 30px; text-align: left !important; background-color: #E6E6E6;">
						<div class="ui label" style="position: absolute; top: -10px;left: -10px; background-color: red; color:#fff">
							완료
						</div>
						<h2 class="ui teal header"><%=state.get("PRO_NAME")%></h2>
						<div class="sub header">
							<i class="won sign icon"></i> 예상금액
							<%=state.get("PRO_PRICE")%>원 | <i class="clock outline icon"></i> 예상기간 일
							<%=state.get("PRO_PERIOD")%>
						</div>
						<p style="margin-bottom: 30px;"></p>
						<div class="sub header">
							<%=state.get("CATE_MAIN")%>
							<i class="angle right icon"></i>
							<%=state.get("CATE_SUB")%>
							| 위치 <i class="angle right icon"></i>
							<%=state.get("PRO_ADDR")%>
						</div>
					</div>
					<%
						}
					%>
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

	<div class="ui basicspace">
		<!-- login title와 main content 여백 -->
	</div>

	<!----------------------------------------------------------------------- footer content 시작 -->
	<!-- footer 시작-->
	<footer class="footer">
		<div class="ui inverted segment">
			<jsp:include page="../common/menu/footerMenu.jsp" />
		</div>
	</footer>
	<!-- footer 끝-->
	<!----------------------------------------------------------------------- footer content 끝 -->
</body>
</html>
