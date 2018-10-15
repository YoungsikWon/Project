<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="java.util.Map" %>
<%
	List<Map<String,Object>> skill =(List<Map<String,Object>>)request.getAttribute("e_skill");
List<Map<String,Object>> intro =(List<Map<String,Object>>)request.getAttribute("e_intro");
%>
<html>
<head>
<jsp:include page="../../common/ui.jsp" />
<meta charset="UTF-8">
<title>파트너스 보유기술</title>
<link rel="stylesheet" href="./css/partners.css" />
<link rel="stylesheet" href="./css/login.css" />
</head>
<body>
<div class="ui container" style="padding-left: 14px;">
	
	<!-- main 입력 시작-->
	<h2 align="left"style="padding-top: 20px;"><%=intro.get(0).get("P_NAME") %>의 보유기술</h2>
		<hr class="dotted" style="" />
		<h3 style="text-align: left;">보유 기술 </h3>
		<table class="ui selectable celled table" style="margin-bottom: 30px;">
	  <thead>
	    <tr>
	      <th>종류 </th>
	      <th>숙련도</th>
	      <th>경험</th>
	    </tr>
	  </thead>
	  <tbody>
		<%for(int i=0;i<5;i++){ %>
			<tr>
				<td><%=skill.get(i).get("SKILL_TEC")%>
				<%if(i<3){ %>
				<div class="ui orange label" style="padding-top: 10px pa; margin-left: 10px; padding-top: 5px; padding-bottom: 5px;">대표보유기술</div></td>
				<%} %>
				<td><%=skill.get(i).get("SKILL_PRO")%></td>
				<td><%=skill.get(i).get("SKILL_EDU")%></td>
			</tr>
			<%} %>
		</tbody>
	</table>
		
	<!-- main 입력 끝-->

	</div>
	
	
</body>
</html>