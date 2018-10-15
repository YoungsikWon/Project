<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	String info = null;
	for(Cookie cookie : cookies){
		if("id".equals(cookie.getName())){
			info = cookie.getValue();
		}
	}
	Map<String,Object> user = (Map<String,Object>)request.getSession().getAttribute(info);
	String email = user.get("S_EMAIL").toString();
%>
<a href="./partnersMyprofileMain?s_email=<%=email %>" id="partnersMyprofileMain" class="partnersMyprofileMain teal item"> 
	<font style="vertical-align: inherit;"> 전체 보기 </font>
</a> 
<a href="./partnersIntroduction?s_email=<%=email %>" id="partnersIntroduction" class="partnersIntroduction teal item"> 
	<font style="vertical-align: inherit;"> 자기 소개 </font>
</a>
<a href="./partnersPortfolio?s_email=<%=email %>" id="partnersPortfolio" class="partnersPortfolio teal item"> 
	<font style="vertical-align: inherit;"> 포트폴리오 </font>
</a> 
<a href="./partnersSkill?s_email=<%=email %>" id="partnersSkill" class="partnersSkill teal item"> 
	<font style="vertical-align: inherit;"> 보유 기술 </font>
</a>
<a href="./partnersBackground?s_email=<%=email %>" id="partnersBackground" class="partnersBackground teal item"> 
	<font style="vertical-align: inherit;"> 경력, 학력, 자격증 </font>
</a> 
<a href="./partnersEvaluation?s_email=<%=email %>" id="partnersEvaluation" class="partnersEvaluation teal item"> 
	<font style="vertical-align: inherit;"> 클라이언트의 평가 </font>
</a>