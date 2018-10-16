<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<Map<String, Object>> getState = (List<Map<String, Object>>) request.getAttribute("getState");
Cookie[]    cs          = request.getCookies();
HttpSession infoSession = request.getSession();
Map<String,Object> info = null;
int      login_cnt = 0;
for(int i = 0; i<cs.length;i++){

String cName = cs[i].getName();
  if("id".equals(cName)){
	
	  info = (Map<String,Object>)infoSession.getAttribute(cs[i].getValue());
	
  }
}

%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/ui.jsp" />
<meta charset="UTF-8">
<title>지원 내역</title>
<link rel="stylesheet" href="/css/cuffLink.css" />
<link rel="stylesheet" href="/css/login.css" />
</head>
<body>
<script type="text/javascript">

$(document).ready(function(){
	
	
});

</script>
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

			<!-- header 시작 -->
			<%-- <div class="ui">
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
			</div> --%>
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
		<!-- ***************************************************************************************************************************20181013 수정 -->
		<div class="ui two column grid container">
			<!-- ***************************************************************************************************************************20181013 수정 -->
			<div class="ui column" style="width: 20%; padding-top: 0px; padding-left: 0px; padding-right: 0px">

				<!-- 로그인 정보 =================================================================================-->
				<div class="ui segment">
					<jsp:include page="../auth/loginOk.jsp" />
				</div>
				<!-- 로그인 정보 =================================================================================-->

				<div class="ui fluid vertical menu" style="padding-right: 0px">
					<a href="/ProjectRecruiting" class="teal item active"> <font style="vertical-align: inherit;"> 지원자 모집중 </font>
					</a>
				</div>
			</div>
			<div class="ui column" style="padding-left: 5px; padding-top: 0px; padding-bottom: 0px; width: 80%;">
				<div class="ui container" style="padding: 20px; padding-bottom: 20px; left: 5px; border: 1px solid #dedede;">
					<h3 style="text-align: left">지원자 모집 중</h3>
					<h5 style="text-align: left">지원자를 모집 중인 프로젝트를 관리할 수 있습니다.</h5>
				</div>
				<div style="height: 10px;"></div>
				<!-- ***************************************************************************************************************************20181013 수정 -->
				<div style="padding-top: 20px; padding-bottom: 20px; padding-left: 15px; padding-right: 15px; border: 1px solid #dedede; min-height: 550px; height: auto;">
					<!-- ***************************************************************************************************************************20181013 수정 -->
					<div style="height: 10px;"></div>
					<div class="ui two column grid container" style="padding-top: 0px; border: 1px solid #dedede;">
						<div class="column" style="width: 10%; padding: 20px">
							<img class="ui medium circular image" style="width: 40px;" src="../../image/process-guide-success.png">
						</div>
						<div class="column" style="width: 90%; text-align: left; padding-left: 5px">
							1. 지원자 모집 중인 프로젝트 목록입니다.<br> 2. [지원자 목록] 버튼을 클릭하여 지원자들의 지원 내역을 확인할 수 있습니다.<br> 3. 미팅을 신청하면 스케줄 매니저가 미팅 조율을 도와드립니다.<br> 4. 지원자 모집에 대한 문의는 고객센터로 연락 부탁드립니다.<br> 고객센터: (02) 0000-0000 / help@cufflink.com
						</div>
					</div>
					<!-- ***************************************************************************************************************************20181013 수정 -->
					<div style="text-align: left; padding-left: 10px; padding-top: 20px; padding-bottom: 0px"></div>
					<!-- ***************************************************************************************************************************20181013 수정 -->


					<%
						if (getState.size() <= 0) {
					%>
					<div style="text-align: left; padding-left: 10px; padding-top: 20px; padding-bottom: 0px">지원자 모집 중인 프로젝트가 없습니다.</div>
					<%
						} else {
					%>
					<%
						for (Map<String, Object> state : getState) {
					%>
					<div class="ui two column grid segment" style="position: relative; margin-top: 10px;padding: 3px; text-align: left !important;">
						<!-- 좌측 -->
						<div class="column" style="width: 80%; background-color: #dedede;">
							<h3 class="ui teal header"><%=state.get("PRO_NAME")%></h3>
							<div class="sub header" style="margin-top: 10px;">
								<i class="won sign icon"></i> 예상금액 
								<%=state.get("PRO_PRICE")%>원
								<i class="clock outline icon" style="margin-left: 20px;"></i> 예상기간 
								<%=state.get("PRO_PERIOD")%>일
							</div>
							<div class="sub header" style="margin-top: 30px;">
								<%=state.get("CATE_MAIN")%>
								<i class="angle right icon"></i>
								<%=state.get("CATE_SUB")%>
								<i class="angle right icon"></i>
								<%=state.get("PRO_ADDR")%>
							</div>
						</div>
						<div class="ui blue label" style="position: absolute !important ; left: -10px; top: -5px; padding: 10px;  height: 17px;padding-top: 3px;">모집중 </div>
						<!-- 우측 -->
						<div class="column" style="width: 20%; background-color: #dedede;">
							<div align="right"></div>
							<div class="ui container" style="padding-top: 10px; padding-bottom: 0px; padding-left: 10px; padding-right: 5px;">마감 <%=state.get("PRO_END") %> 전</div>
							<div style="padding-top: 10px; padding-bottom:10px; padding-left: 10px; padding-right: 5px;">총 1명 지원</div>
							<div class="ui black  label" style="padding: 10px; padding-right: 10px;">프로젝트 지원하기 </div>
						</div>
						
					</div>
					
				</div>
				
			</div>
			
			<%
				}
			%>
			<%
				}
			%>






			<!-- 수정전 -->
			<%-- 					<%
						if (getState.size() <= 0) {
					%>
					<!-- ***************************************************************************************************************************20181013 수정 -->
					<div style="text-align: left; padding-left: 10px; padding-top: 20px; padding-bottom: 0px; min-height: 380px; border: 1px solid #dedede;">지원자 모집 중인 프로젝트가 없습니다.</div>
					<!-- ***************************************************************************************************************************20181013 수정 -->
					<%
						} else {
					%>
					<%
						for (Map<String, Object> state : getState) {
					%>
					<div class="ui column segment" style="padding-top: 30px; padding-left: 30px; text-align: left !important;">
						<div class="ui green top left attached label">
							>>모집중<< </a>
						</div>
						<h2 class="ui teal header"><%=state.get("PRO_NAME")%></h2>
						<div class="sub header">
							<i class="won sign icon"></i> 예상금액 원 |
							<%=state.get("PRO_PRICE")%>
							<i class="clock outline icon"></i> 예상기간 일
							<%=state.get("PRO_PERIOD")%>
						</div>
						<p style="margin-bottom: 30px;"></p>
						<div class="sub header">
							cate_main
							<%=state.get("CATE_MAIN")%>
							<i class="angle right icon"></i> cate_sub
							<%=state.get("CATE_SUB")%>
							| 위치 <i class="angle right icon"></i>
						</div>
						<div class="ui section divider"></div>
					</div>
					<%
						}
					%>
					<%
						}
					%> --%>
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