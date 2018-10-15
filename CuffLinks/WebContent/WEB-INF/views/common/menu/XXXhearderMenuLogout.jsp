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
%>
<!-- https://fontawesome.com 웹폰트사용에 필요 채팅문의에 들어간 아이콘이미지-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<!-- //chatting -->
<jsp:include page="../ui.jsp"/>
<link rel="stylesheet" href="../../css/cuffLink.css" />
<link rel="stylesheet" href="../../css/login.css" />
<div class="ui inverted segment" style="margin-top: 0px; padding-top: 3px; padding-bottom: 3px; margin-bottom: 0px;">
	<div class="ui container">
		<a href="/"><img src="/image/logo.jpg" class="ui image tiny" alt="" style="float: left; margin-right: 10px" /></a>
		<div class="ui inverted secondary pointing menu" style="margin-top: 0px;">
			<a href="/projectRegister" class="projectRegister item">프로젝트 등록 </a> 
			<a href="/projectFind" class="projectFind item">프로젝트 찾기 </a>
		    <a href="/partnersList" class="partnersList item">파트너스 목록 </a>
			<div class="right menu">
				<button id ="b_login" class="ui button" style="margin-right: 10px;" onclick="window.location.href='/login'" />
					로그인
				</button>
				<button id = "b_join" class="ui primary button" style="margin-right: 10px;" onclick="window.location.href='/join'" />
					회원가입
				</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">

$('.ui.dropdown').dropdown({
		action : 'hide',
		on: 'hover',
	});
	
</script>