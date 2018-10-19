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
<body>
	<div class="ui container" style="width: 100%; min-height: 670px;">
	
		<!-- main 입력 시작-->
		<div class="ui column" style="width: 100%; padding-top: 20px; padding-bottom: 0px;">
			<div style="width: 100%; height: 30px; background-color: #dedede; margin-bottom: 15px;">
				<h2 style="text-align: left; padding-bottom: 10px;"><%=intro.get(0).get("P_NAME")%>의 경력,학력, 자격증
				</h2>
			</div>
		<p></p>
		<!-- <hr class="dotted" style="" /> -->
		
			<div class="ui segment" style="margin-left: 10px; margin-right: 10px; padding: 10px; background-color: #dedede; height: AUTO;">
				<div>
					<div style="width: 100%; height: 20px; background-color: #CED8F6; margin-bottom: 0px;">
						<h3 style="text-align: left;">경력</h3>
					</div>
					<table class="ui selectable celled table" style="margin-bottom: 20px; margin-top: 5px;">
						<thead>
							<tr>
								<th id="partnersmytablehead">회사명</th>
								<th id="partnersmytablehead">근무부서</th>
								<th id="partnersmytablehead">직위</th>
								<th id="partnersmytablehead">근무기간</th>
							</tr>
						</thead>
						<tbody>
							<%
								for (int i = 0; i < 3; i++) {
							%>
							<tr>
								<td><%=back_car.get(i).get("CA_NAME").toString()%></td>
								<td><%=back_car.get(i).get("CA_DEPT").toString()%></td>
								<td><%=back_car.get(i).get("CA_SPOT").toString()%></td>
								<td><%=back_car.get(i).get("CA_DATE").toString()%></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
		<!--학력  ------------------------------------------------------------------------------------->
				
				
				<div class="ui container">
				<div style="width: 100%; height: 20px; background-color: #CED8F6; margin-bottom: 0px;">
					<h3 style="text-align: left;">학력</h3>
				</div>
					<table class="ui selectable celled table" style="margin-bottom: 20px; margin-top: 5px;">
						<thead>
							<tr>
								<th id="partnersmytablehead">학교명</th>
								<th id="partnersmytablehead">전공</th>
								<th id="partnersmytablehead">분류</th>
								<th id="partnersmytablehead">상태</th>
								<th id="partnersmytablehead">입학일</th>
								<th id="partnersmytablehead">졸업일</th>
							</tr>
						</thead>
						<tbody>
							<%
								for (int i = 0; i < 1; i++) {
							%>
							<tr>
								<td><%=back_edu.get(i).get("EDU_NAME").toString()%></td>
								<td><%=back_edu.get(i).get("EDU_MAJOR").toString()%></td>
								<td><%=back_edu.get(i).get("EDU_PROCESS").toString()%></td>
								<td><%=back_edu.get(i).get("EDU_CONDITION").toString()%></td>
								<td><%=back_edu.get(i).get("EDU_INDATE").toString()%></td>
								<td><%=back_edu.get(i).get("EDU_OUTDATE").toString()%></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
				
				
				<div class="ui container">
				<div style="width: 100%; height: 20px; background-color: #CED8F6; margin-bottom: 0px;">
					<h3 style="text-align: left;">자격증</h3>
				</div>
					<table class="ui selectable celled table" style="margin-bottom: 10px; margin-top: 5px;">
						<thead>
							<tr>
								<th id="partnersmytablehead">자격명</th>
								<th id="partnersmytablehead">분류</th>
								<th id="partnersmytablehead">취득날짜</th>
							</tr>
						</thead>
						<tbody>
							<%
								for (int i = 0; i < 3; i++) {
							%>
							<tr>
								<td><%=back_lic.get(i).get("LIC_NAME").toString()%></td>
								<td><%=back_lic.get(i).get("LIC_AGENCY").toString()%></td>
								<td><%=back_lic.get(i).get("LIC_DATE").toString()%></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
			</div>			
		</div>
	</div>
</body>
</html>