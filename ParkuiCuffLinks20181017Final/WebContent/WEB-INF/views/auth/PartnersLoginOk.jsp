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
    //out.print("info:"+info.get("S_EMAIL").toString());
    //out.print("info2:"+"/partners/partnersMyWishket?s_email="+info.get("S_EMAIL").toString());
    response.sendRedirect("/partners/partnersMyWishket");
    //info.get("S_EMAIL").toString() ->이렇게 그냥 넘기면 특수문자때문에 .뒤로 잘려서 들어감
    //s_email="+info.get("S_EMAIL").toString()->이렇게 키 값 정해서 같이 넘겨주고 컨트롤러에서 @RequestParam Map으로 받으면 map은 덩어리째 받기 때문에 특수문자 상관없이 받음
//    response.sendRedirect("/partners/partnersMyWishket/"+info.get("S_EMAIL").toString()+"?pno="+info.get("P_NO").toString());
%>
<div class="ui two column grid" style="padding-right: 0px; padding-bottom: 10px; padding-top: 10px; padding-left: 5px;">
	<div class="column" style="padding-top: 5px; padding-left: 0px; padding-right: 0px; padding-bottom: 0px;">
		<h5>파트너스</h5>
	</div>
	<div class="column" style="padding-top: 5px; padding-right: 0px; padding-bottom: 0px; padding-left: 5px;">
		<a class="h11" href="/partners/partnersProfile">기본 정보 수정></a>
	</div>
	<div class="ui dividing header container" style="margin-top: 10px;"></div>
</div>
<div class="ui two column grid container">
	<div class="column" style="padding-left: 5px; padding-top: 10px; padding-right: 5px; padding-bottom: 5px; width: 20%;">
		<img class="ui medium circular image" style="width: 40px;" src="../../image/client.jpg">
	</div>
	<div class="column" style="padding-left: 0px; padding-right: 0px; padding-top: 5px; padding-bottom: 15px; font-size: 12px; width: 80%;">
		<%if(info!=null) out.print(info.get("S_ID"));%><br> <%if(info!=null) out.print(info.get("S_EMAIL"));%>
	</div>
</div>

