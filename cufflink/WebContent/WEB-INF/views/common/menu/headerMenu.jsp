<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%--  <%
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
%> --%>
<jsp:include page="../ui.jsp"/>
<link rel="stylesheet" href="/css/cuffLink.css" />
<link rel="stylesheet" href="/css/login.css" />
<div class="ui inverted segment" style="margin-top: 0px; padding-top: 3px; padding-bottom: 3px; margin-bottom: 0px;">
	<div class="ui container">
		<a href="/"><img src="/image/logo.jpg" class="ui image tiny" alt="" style="float: left; margin-right: 10px" /></a>
		<div class="ui inverted secondary pointing menu"
			style="margin-top: 0px;">
			<a	href="/ProjectFind" class="item">프로젝트 찾기 </a> 
			<a  href="/PartnersList" class="item">파트너스 목록 </a>
			<div class="right menu">
				
			</div>
			<form id = "f_logout">
			<div id = "menu_list" class="ui dropdown button">
				<div id = "out_id"></div> <i class="dropdown icon"></i>
				<div  class="menu">
					<div class="item" onclick="location.href='/PartnersMyCufflink'"><i class="home icon"></i>마이 커프링크</div>
<!-- 					<div class="item" href="/ClientMyCufflink"><i class="home icon" ></i>마이 커프링크</div> -->
					<div class="item" onclick="location.href='/PartnersInfo'"><i class="user icon"></i>파트너스 정보관리></div>
					<div class="item" onclick="location.href='/PartnersProfile'"><i class="cog icon"></i>계정설정</div>
					<div class="item" onclick="location.href='/logout'"><i class="power off icon"></i>로그아웃</div>
				</div>
			</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">

$('.ui.dropdown').dropdown({
		action : 'hide',
		on: 'hover',
	});
	
</script>