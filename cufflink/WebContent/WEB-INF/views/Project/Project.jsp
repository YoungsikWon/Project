<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Map<String, Map> map 
		= (Map<String, Map>)request.getAttribute("getProjectFind");
		Map<String, Object> main1 = map.get("ProjectCate_main1");//개발
		Map<String, Object> main2 = map.get("ProjectCate_main2");//디자인
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<tr>
			<td>이름만 나오게 해주세요<%=main1.get("cate_Main") %></td>
		</tr>
	 <%
 	
 %>
</body>
</html>