<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%
	List<Map<String,Object>> back_car   =(List<Map<String,Object>>)request.getAttribute("e_back_car");
	List<Map<String,Object>> back_lic   =(List<Map<String,Object>>)request.getAttribute("e_back_lic");
	List<Map<String,Object>> back_edu   =(List<Map<String,Object>>)request.getAttribute("e_back_edu");
	List<Map<String,Object>> intro   =(List<Map<String,Object>>)request.getAttribute("e_intro");

%>
<html>
<head>
<jsp:include page="../../common/ui.jsp" />
<meta charset="UTF-8">
<title>파트너스 경력,학력, 자격증</title>
<link rel="stylesheet" href="./css/partners.css" />
<link rel="stylesheet" href="./css/login.css" />
</head>
	<div class="ui container" style="padding-left: 14px;" >
	
	<!-- main 입력 시작-->
	<!-- 경력-------------------------------------------------------------------------------- -->
		<h2 align="left" style="padding-top: 20px;padding-bottom: 10px;"><%=intro.get(0).get("P_NAME") %>의 경력,학력, 자격증</h2>
		<hr class="dotted" style="" />
		<h3 style="text-align: left;p">경력</h3>
			<table class="ui fixed table"style="margin-bottom: 30px;">
			  <thead>
			    <tr><th>회사명</th>
			    <th>근무부서</th>
			    <th>직위</th>
			    <th>근무기간</th>
			  </tr>
			  </thead>
				  <tbody>
					<%for(int i=0;i<3;i++){ %>
						<tr>
							<td><%=back_car.get(i).get("CA_NAME").toString()%></td>
							<td><%=back_car.get(i).get("CA_DEPT").toString()%></td>
							<td><%=back_car.get(i).get("CA_SPOT").toString()%></td>
							<td><%=back_car.get(i).get("CA_DATE").toString()%></td>
						</tr>
					<%} %>
				</tbody>
			</table>
		</div>
	<!--학력  ------------------------------------------------------------------------------------->
	<div class="ui container"style="padding-left: 14px;" >
		<h3 style="text-align: left;">학력</h3>
			<table class="ui fixed table" style="margin-bottom: 30px;">
			  <thead>
			    <tr><th>학교명</th>
			    <th>전공</th>
			    <th>분류</th>
			    <th>상태</th>
			    <th>입학일</th>
			    <th>졸업일</th>
			  </tr></thead>
				  <tbody>
					<%for(int i=0;i<1;i++){ %>
						<tr>
							<td><%=back_edu.get(i).get("EDU_NAME").toString()%></td>
							<td><%=back_edu.get(i).get("EDU_MAJOR").toString()%></td>
							<td><%=back_edu.get(i).get("EDU_PROCESS").toString()%></td>
							<td><%=back_edu.get(i).get("EDU_CONDITION").toString()%></td>
							<td><%=back_edu.get(i).get("EDU_INDATE").toString()%></td>
							<td><%=back_edu.get(i).get("EDU_OUTDATE").toString()%></td>
						</tr>
					<%} %>
				</tbody>
			</table>
	</div>
	<div class="ui container"style="padding-left: 14px;" >
		<h3 style="text-align: left;">자격증</h3>
			<table class="ui fixed table" style="margin-bottom: 30px;">
			  <thead>
			    <tr><th>자격명</th>
			    <th>분류</th>
			    <th>취득날짜</th>
			  </tr></thead>
				  <tbody>
					<%for(int i=0;i<3;i++){ %>
						<tr>
							<td><%=back_lic.get(i).get("LIC_NAME").toString()%></td>
							<td><%=back_lic.get(i).get("LIC_AGENCY").toString()%></td>
							<td><%=back_lic.get(i).get("LIC_DATE").toString()%></td>
						</tr>
					<%} %>
				</tbody>
			</table>
	</div>
</body>
</html>