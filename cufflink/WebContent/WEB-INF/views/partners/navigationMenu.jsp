<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<div class="submenu" style="border-bottom: groove thin;">
	<div class="ui container">
		<div class="ui secondary menu">
			<a class="active item"> 내 프로필 </a> <a class="item"> 관심 프로젝트 </a> <a
				class="item"> 지원 내역 </a> <a class="item"> 진행중인 프로젝트 </a> <a
				class="item"> 완료한 프로젝트 </a>
		</div>
		<%=request.getAttribute("bns") %>
	</div>
</div>