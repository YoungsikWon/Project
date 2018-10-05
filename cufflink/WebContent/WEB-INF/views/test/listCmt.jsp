<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="item" items="${listCmt }">
		<div>
			<div>

				${item.cwriter } : ${item.cmt } [${item.cdate }] <input
					type="button" value="삭제" onclick="doDeleteCmt('${item.cno}');" />
			</div>
		</div>
	</c:forEach>



</body>
</html>