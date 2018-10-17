<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%
	//System.out.println("이밑으로오류");
	//Map<String,Map> map = (Map<String,Map>)request.getAttribute("partnersMyprofileMain");
	List<Map<String,Object>> intro =(List<Map<String,Object>>)request.getAttribute("e_intro");
%>
<html>
<head>
<jsp:include page="../../common/ui.jsp" />
<meta charset="UTF-8">
<title>파트너스 자기소개</title>
<link rel="stylesheet" href="./css/partners.css" />
<link rel="stylesheet" href="./css/login.css" />
</head>
<body>


	<div class="ui container" style="padding-left: 14px;">

		<!-- main 입력 시작-->

		<div class="ui column"
			style=" padding-top: 20px; padding-bottom: 0px;">
			<h2 style="text-align: left;padding-bottom: 10px;"><%=intro.get(0).get("P_NAME") %>의 자기소개</h2>
				<p></p>
				<div style="padding-bottom: 20px;">
					<hr class="dotted" style="" />
					<h3 style="text-align: left;">자기 소개</h3>
				</div>
				<div class="ui container"
					style="padding-top: 0px; padding-left: 0px; padding-right: 20px;">
					<div style="text-align: left;">
						<%=intro.get(0).get("P_ABOUTME")%>
					</div>
				</div>
		</div>
		<!-- main 입력 끝-->
	</div>

</body>
</html>