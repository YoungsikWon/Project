<%@page import="com.util.HangulConversion"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
 <%
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
  response.sendRedirect("/clients/ClientMyCufflink");
  /***********수정20181017시작***********/
  String path = "/image/partnersImg/";  
  /***********수정20181017끝***********/
 
%>
<div class="ui two column grid" style="padding-right: 0px; padding-bottom: 10px; padding-top: 10px; padding-left: 5px;">
	<div class="column" style="padding-top: 5px; padding-left: 0px; padding-right: 0px; padding-bottom: 0px;">
		<h5>클라이언트</h5>
	</div>
	<div class="column" style="padding-top: 5px; padding-right: 0px; padding-bottom: 0px; padding-left: 5px;">
		<a class="h11" href="/auth/ClientProfile">기본 정보 수정></a>
	</div>
	<div class="ui dividing header container" style="margin-top: 10px;"></div>
</div>
<div class="ui two column grid container">
	<div class="column" style="padding-left: 5px; padding-top: 10px; padding-right: 5px; padding-bottom: 5px; width: 20%;">
	<!------------------ 수정20181017 시작 ------------------>
		<img class="ui medium circular image" style="width: 40px;" src="<%=path%>${fileName}">
	<!------------------ 수정20181017 끝 -------------------->
	</div>
	<div class="column" style="padding-left: 0px; padding-right: 0px; padding-top: 5px; padding-bottom: 15px; font-size: 12px; width: 80%;">
		<%if(info!=null) out.print(info.get("S_ID"));%><br> <%if(info!=null) out.print(info.get("S_EMAIL"));%>
	</div>
</div>

