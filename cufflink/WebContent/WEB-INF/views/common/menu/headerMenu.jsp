<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<jsp:include page="../ui.jsp"/>
<div class="ui inverted segment" style="margin-top: 0px; padding-top: 3px; padding-bottom: 3px; margin-bottom: 0px;">
	<div class="ui container">
		<a href="/"><img src="/image/logo.jpg" class="ui image tiny" alt="" style="float: left; margin-right: 10px" /></a>
		<div class="ui inverted secondary pointing menu" style="margin-top: 0px;">
			<a href="/projectFind" id="projectFind" class="projectFind item">프로젝트 찾기 </a> 
			<a href="/partnersList" id="partnersList" class="partnersList item">파트너스 목록 </a>
			<div class="right menu">
				<button class="ui button" style="margin-right: 10px;" onclick="window.location.href='/login'" />
					로그인
				</button>
				<button class="ui primary button" style="margin-right: 10px;" onclick="window.location.href='/join'" />
					회원가입
				</button>
			</div>
			<div class="ui dropdown button">
				twins0313 <i class="dropdown icon"></i>
				<div class="menu">
					<div class="item" onclick="location.href='/PartnersMyCuffLink'"><i class="home icon"></i>마이 커프링크</div>
					<div class="item" onclick="location.href='/ClientInfo'"><i class="user icon"></i>파트너스 정보관리></div>
					<div class="item" onclick="location.href='/ClientProfile'"><i class="cog icon"></i>계정설정</div>
					<div class="item" onclick="location.href='/'"><i class="power off icon"></i>로그아웃</div>
				</div>
			</div>
		</div>
	</div>
</div>

