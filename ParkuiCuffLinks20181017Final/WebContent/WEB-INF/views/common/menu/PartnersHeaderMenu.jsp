<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Cookie[] cs = request.getCookies();
	HttpSession infoSession = request.getSession();
	Map<String, Object> info = null;
	int login_cnt = 0;
	for (int i = 0; i < cs.length; i++) {

		String cName = cs[i].getName();
		if ("id".equals(cName)) {

			info = (Map<String, Object>) infoSession.getAttribute(cs[i].getValue());

		}
	}
	String email = info.get("S_EMAIL").toString();
%>
<!-- https://fontawesome.com 웹폰트사용에 필요 채팅문의에 들어간 아이콘이미지-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<jsp:include page="../ui.jsp" />
<link rel="stylesheet" href="../../css/cuffLink.css" />
<link rel="stylesheet" href="../../css/login.css" />
<div class="ui inverted segment" style="margin-top: 0px; padding-top: 3px; padding-bottom: 3px; margin-bottom: 0px;">
	<div class="ui container">
		<a href="../partners/partnersMyWishket"><img src="/image/logo.jpg" class="ui image tiny" alt="" style="float: left; margin-right: 10px" /></a>
		<div class="ui inverted secondary pointing menu" style="margin-top: 0px;">
			<a href="/project/page" id="projectFind" class="projectFind item">프로젝트 찾기 </a> <a href="../partners/partnersList" id="partnersList" class="partnersList item">파트너스 목록 </a>
			<div class="right mini menu">
				<div class="right menu" style="padding-top: 0; padding-bottom: 0; margin-top: 0; margin-bottom: 0;">
					<div id="mrc" class="mrc" style="margin-top: 0px;">
						<div id="mrc-win" class="mrc-win" style="">음성인식대기중...</div>
						<div id="voice" class="icon-font">
							<ul>
								<li><a href="#"><i class="fas fa-microphone-alt fa-1x"></i> <span class="tool">음성인식</span></a></li>
							</ul>
						</div>
					</div>
					<%
						if (info == null) {
					%>

					<button class="ui button" style="margin-right: 10px;" onclick="location.href='/auth/login'">로그인</button>
					<button class="ui primary button" style="margin-right: 10px;" onclick="location.href='/auth/join'">회원가입</button>

					<%
						}

						else {
					%>
				</div>
			</div>
			<form id="f_logout">
				<div id="menu_list" class="ui dropdown" style="width: 150px;">
					<div class="ui dropdown fluid black button" id="out_id">
						<%
							if (info != null)
									out.print(info.get("S_ID"));
						%>
						<i class="dropdown icon" style="color: #fff;"></i>
					</div>
					<div class="menu">
						<div class="item" onclick="location.href='../partners/partnersMyWishket'">
							<i class="home icon"></i>마이 위시캣
						</div>
						<div class="item" onclick="location.href='../partners/partnersMyprofileMain?s_email=<%=email%>'">
							<i class="user icon"></i>내 프로필 보기
						</div>
						<div class="item" onclick="location.href='../partners/partnersProfile'">
							<i class="user icon"></i>계정설정
						</div>
						<div class="item" onclick="location.href='../client/logout'">
							<i class="power off icon"></i>로그아웃
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- 네비게이션메뉴 -->
<div class="submenu" style="border-bottom: groove thin;">
	<div class="ui container">
		<div class="ui secondary menu">
			<a href="../partners/partnersMyprofileMain?s_email=<%=email%>" id="partnersMyprofileMain" class="partnersMyprofileMain item"> 내 프로필 </a> 
			<a href="../partners/partnersInterestProject" id="partnersInteresProject" class="partnersInteresProject item"> 관심 프로젝트 </a> 
			<a href="../partners/partnersSupportHistory" id="partnersSupportHistory" class="partnersSupportHistory item"> 지원 내역 </a> 
			<a href="../partners/partnersProject_ing" id="partnersProject_ing" class="partnersProject_ing item"> 진행 중인 프로젝트 </a> 
			<a href="../partners/partnersCompleteProject" id="partnersCompleteProject" class="partnersCompleteProject item"> 완료한 프로젝트 </a>
		</div>
	</div>
</div>

<%
	}
%>