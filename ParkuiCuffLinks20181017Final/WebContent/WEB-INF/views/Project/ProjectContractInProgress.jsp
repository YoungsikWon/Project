<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<Map<String, Object>> getState = (List<Map<String, Object>>) request.getAttribute("getState");
	Map<String, Object> userInfo = (Map<String, Object>) request.getAttribute("userInfo");
%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/ui.jsp" />
<meta charset="UTF-8">
<title>진행중인 프로젝트</title>
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

		<div class="ui two column grid container" style="min-height: 670px; height: auto;">
			<div class="ui column" style="width: 20%; padding-top: 0px; padding-left: 0px; padding-right: 0px">

				<!-- 로그인 정보 =================================================================================-->
				<div class="ui segment" style=" background-color: #E6E6E6;">
					<jsp:include page="../auth/loginOk.jsp" />
				</div>
				<!-- 로그인 정보 =================================================================================-->
				<div class="ui fluid vertical menu" style="padding-right: 0px;  background-color: #E6E6E6;">
					<a href="/project/projectContractInProgress" class="teal item active"> <font style="vertical-align: inherit;"> 프로젝트 진행 중 </font>
					</a>
				</div>
				<div class="ui fluid vertical menu" style="padding-top: 10px; padding-bottom: 10px; padding-left: 15px; padding-right: 15px; background-color: #E0F8E6;">
					<div style="padding-bottom: 5px;">
						<b><h10>커프링크 사업자 등록 정보</h10></b>
					</div>
					<div style="text-align: right">
						<a href="#"><h11>자세히보기></h11></a>
					</div>
				</div>
				<div class="ui fluid vertical menu" style="padding-top: 10px; padding-bottom: 10px; padding-left: 15px; padding-right: 15px; background-color: #E0F8E6;">

					<b><font style="vertical-align: inherit;">커프링크 대금보호계좌 정보</font></b> <br>
					<br>
					<h11>은행명 : 기업은행<br>
					예금주 : (주)커프링크<br>
					계좌번호 : 000-000000-00-000</h11>

				</div>
			</div>
			<div class="ui column" style="padding-left: 5px; padding-top: 0px; padding-bottom: 0px; width: 80%;">
				<div class="ui container" style="margin-bottom: 15px;padding: 20px; padding-bottom: 20px; left: 5px; border: 1px solid #BDBDBD; background-color: #E0ECF8;">
					<h3 style="text-align: left">프로젝트 진행 중</h3>
					<h5 style="text-align: left">현재 진행 중인 프로젝트를 확인할 수 있습니다</h5>
				</div>
				<div style="height: 10px;"></div>
				<div class="ui two column grid container" style="margin-bottom: 10px;padding-top: 0px; border: 1px solid #dedede;">
					<div class="column" style="width: 10%; padding: 20px">
						<img class="ui medium circular image" style="width: 40px;" src="../../image/process-guide-success.png">
					</div>
					<div class="column" style="width: 90%; text-align: left; padding-left: 5px">
						1. 현재 진행 중인 프로젝트 목록입니다.<br> 2. 프로젝트는 대금 결제 후에 진행됩니다.<br> 3. 커프링크은
						<대금보호시스템>을 통해 프로젝트가 완료될 때까지 대금을 안전하게 보호합니다.<br>
						4. 프로젝트 진행에 대한 문의는 고객센터로 연락 부탁드립니다.<br>
						고객센터: (02) 0000-0000 / help@cufflink.com 
					</div>
				</div>
				<div style="padding-top: 20px; padding-bottom: 20px; padding-left: 15px; padding-right: 15px; border: 1px solid #dedede; min-height: 420px;">
					
					<!-- <div style="text-align: left; padding-left: 10px; padding-top: 20px; padding-bottom: 0px"></div> -->
					<%
						if (getState.size() <= 0) { 
					%>
					<div style="text-align: left; padding-left: 10px; padding-top: 20px; padding-bottom: 0px; min-height: 380px; background-color: #E6E6E6; border: 1px solid #dedede;">프로젝트 진행 내역이 없습니다.</div>
					<%
						} else {
					%>
					<%
						for (Map<String, Object> state : getState) {
					%>
					<div class="ui column segment" style="position: relative; padding-top: 0px; margin-bottom: 20px; padding-left: 30px; text-align: left !important; background-color: #E6E6E6;">
						<div class="ui label" style="position: absolute; top: -10px;left: -10px; background-color: blue; color:#fff">
							진행
						</div>
						<h2 class="ui teal header"><%=state.get("PRO_NAME")%></h2>
						<div class="sub header">
							<i class="won sign icon"></i> 예상금액
							<%=state.get("PRO_PRICE")%>원 | <i class="clock outline icon"></i> 예상기간 일
							<%=state.get("PRO_PERIOD")%>
						</div>
						<p style="margin-bottom: 30px;"></p>
						<div class="ui two column grid container">
							<div class="column" style="width: 80%;">
								<div class="column sub header" style="display: inline-block;">
									<%=state.get("CATE_MAIN")%>
									<i class="angle right icon"></i>
									<%=state.get("CATE_SUB")%>
									&nbsp;&nbsp;|&nbsp;&nbsp; 위치 <i class="angle right icon"></i>
									<%=state.get("PRO_ADDR")%>
								</div>
							</div>
						<!-- 추가 20181017 시작 -->
							<div class="column" style="width: 20%;" align="right">
								<div class="ui black right label" style="color: #fff;">
									<a href="/project/projectComplete?pro_no=<%=state.get("PRO_NO")%>&su_state=완료">완료하기</a>
								</div>
							</div>
						<!-- 추가 20181017 끝 -->
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