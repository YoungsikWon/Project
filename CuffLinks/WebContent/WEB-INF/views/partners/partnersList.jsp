<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%
	List<Map<String,Object>> partnersList = (List<Map<String,Object>>) request.getAttribute("partnersList");
	//List<Integer> p_no = (List<Integer>)request.getAttribute("p_no");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파트너스 목록</title>
<style>
	span {
		color: black !important;
	}
</style>
</head>
<body>
<!----------------------------------------------------------------------- top 시작 -->
	<header class="header">
		<div class="ui">
	<!-- header 시작 -->
			<% if (request.getAttribute("kind") == null) {%>
				<jsp:include page="../common/menu/headerMenuLogout.jsp" />
			<% } else { %>
				<% if("클라이언트".equals(request.getAttribute("kind").toString())) {%>
       			<jsp:include page="../common/menu/headerMenu.jsp" />
		   	    <% } else { %>
        	    <jsp:include page="../common/menu/PartnersHeaderMenu.jsp" />
            	<% } %>
			<% } %>
	<!-- header 종료 -->
		</div>
	</header>
<!----------------------------------------------------------------------- top 끝 -->

	<div class="ui basicspace"><!-- navigation menu와 여백 --></div>
	
<!----------------------------------------------------------------------- main content 시작 -->
<!----------------------------------------------------------------------- main content 시작 -->
	<div class="ui container contentMain"style="height: auto;">
		
	<!-- title 시작-->
		<div class="ui container" style="height: auto;">
			<div class="content-header">
				<div class="ui two column grid container">
					<div class="column">
						<h3 class="content-text">파트너스 목록</h3>
						<small class="small-text">654,454명의 파트너스가 있습니다.</small>
					</div>
					<div class="column" style="text-align:right;margin:10px 0px;">
						<!-- 우측에 입력할 수 있는 공간 확보 -->
					</div>
				</div>
			</div>
		</div>			
	<!-- title 끝-->

	<div class="ui basicspace"><!-- login title와 main content 여백 -->	</div>

	<!-- main 입력 시작 -->
	<%for(Map<String,Object> map : partnersList){ 
		List<Map<String,Object>> intro = (List<Map<String,Object>>)map.get("intro");
		List<Map<String,Object>> cate = (List<Map<String,Object>>)map.get("cate");
		List<Map<String,Object>> skill = (List<Map<String,Object>>)map.get("skill");
		List<Map<String,Object>> pro = (List<Map<String,Object>>)map.get("pro");
		List<Map<String,Object>> port = (List<Map<String,Object>>)map.get("port");
		List<Map<String,Object>> grade = (List<Map<String,Object>>)map.get("grade");
	%>
	
		<div class="ui container">
			<div class="content-middle" style="height:auto;">
				<div class="ui grid " style="padding:20px;">
					<div class="twelve wide column " style="border-right: 1px solid #dedede; vertical-align: middle;padding: 20px; width: 60%;">
						<div class="ui items">
						<div class="item">
						    <div class="ui small circular rotate reveal image">
							  <img src="/image/wishket.png" class="visible content">
							  <img src="/image/partners1.jpg" class="hidden content">
							</div>
						    <div class="content" style="padding-left: 30px;">
						      <a class="header"><%=intro.get(0).get("P_NAME") %></a>&nbsp;&nbsp;
						      	<%
									if ("활동중".equals(intro.get(0).get("P_ACTIVITY"))) {
								%>
								<div class="ui green label"
									style="border-top-width: 0px; margin-top: 5px; margin-left: 7px;">활동가능</div>
								<%
									} else if ("활동불가능".equals(intro.get(0).get("P_ACTIVITY"))) {
								%>
								<div class="ui gray label"
									style="border-top-width: 0px; margin-top: 5px; margin-left: 7px;">활동가능</div>
								<%
									}
								%>
						      <div class="meta">
						        <%
									if ("디자인".equals( cate.get(0).get("CATE_MAIN").toString())) {
								%>
								<i class="laptop icon"></i>디자인
								<%=cate.get(0).get("CATE_MAIN").toString()%>
								&nbsp;&nbsp;
								<%
									} else if ("개발".equals(cate.get(0).get("CATE_MAIN").toString())) {
								%>
								<i class="keyboard icon"></i>개발 &nbsp;&nbsp;
								<%
									}
								%>
								<%
									if ("개인사업자".equals(intro.get(0).get("P_OPERATOR").toString())) {
								%>
								<i class="user outline icon"></i>개인사업자
								<%
									} else if ("법인사업자".equals(intro.get(0).get("P_OPERATOR").toString())) {
								%>
								<i class="building outline icon"></i>법인사업자
								<%
									} else if ("팀".equals(intro.get(0).get("P_OPERATOR").toString())) {
								%>
								<i class="users icon"></i>팀
								<%
									}
								%>
						      </div>
						      <div class="description">
						        <p></p>
						      </div>
						      <div class="extra">
						        <%=intro.get(0).get("P_ABOUTME") %>
						      </div>
						      <p style="margin-bottom: 45px;"></p>
						      	<%for(int j=0;j<5;j++){ %>
						        	<div class="ui gray label"><%=skill.get(j).get("SKILL_TEC") %></div>
						        <%} %>
						    </div>
						  </div>
						</div>
					</div>
					<div class="four wide column " style="padding: 10px;padding-left: 30px;">
						<div class="ui middle aligned divided list" style="border:0px">
							 <div class="item" style="padding-top: 20px;padding-bottom: 20px;">
								<span class="content"><div class="ui huge star rating"></div><%=grade.get(0).get("AVG_ALLPRO")%>/</span>
								<span class="right floated content">평가 <%=grade.get(0).get("EVAL_COUNT") %>개</span>
							</div>
							<div class="item" style="padding-top: 20px;padding-bottom: 20px;">
								<span class="content">계약한 프로젝트</span>
								<span class="right floated content"><%=pro.get(0).get("COUNT_PRO") %>건</span>
							</div>
							<div class="item" style="padding-top: 20px;padding-bottom: 20px;">
								<span class="content">포트폴리오</span>
								<span class="right floated content"><%=pro.get(0).get("COUNT_PORT") %>개</span>
							</div> 
						</div>
					</div>
				</div>
			</div>
		</div>
		<%} %>
	<!-- main 입력 끝-->
	</div>
<!----------------------------------------------------------------------- main content 끝 -->
<!----------------------------------------------------------------------- main content 끝 -->
	
	<div class="ui basicspace"><!-- login title와 main content 여백 -->	</div>
	
<!----------------------------------------------------------------------- footer content 시작 -->
	<!-- footer 시작-->
		<footer class="footer">
			<div class="ui inverted segment" style="height:200px; padding:25px; vertical-align:middle;">
				<jsp:include page="../common/menu/footerMenu.jsp"/>
			</div>
		</footer>
	<!-- footer 끝-->
<!----------------------------------------------------------------------- footer content 끝 -->
</body>
</html>