<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<jsp:include page="../common/ui.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join-(타사가입)</title>
<style>
	
</style>
</head>
<body style="background-color: #E6F8E0">
	<div class="column container" style="padding-top: 20px; width: 100%;" >
		<div class="ui two column grid container" style="padding: 10px;">
			<div class="column container" style="padding: 10px; width: 50%; text-align: center; vertical-align: middle; outline: dotted gray 0.5px;">
				<p>프로젝트를 의뢰하고 싶습니다</p>
				<div class="ui image">
					<img src="./image/client.jpg" style="padding: 10px">
				</div>
				<div>
					<input type="radio" name="radio" checked="checked">
				</div>
				<div>
					<p>클라이언트</p>
					<hr class="garo" />
				</div>
				<div>
					<p>
						의뢰할 프로젝트가 있는 <br> 기업, 개인
					</p>
				</div>
			</div>
			<div class="column container" style="padding: 10px; width: 50%; text-align: center; vertical-align: middle; outline: dotted gray 0.5px;">
				<p>일거리를 찾고 있습니다</p>
				<div class="ui image">
					<img src="./image/partners.jpg" style="padding: 10px">
				</div>
				<div>
					<input type="radio" name="radio" checked="checked">
				</div>
				<div>
					<p>파트너스</p>
					<hr class="garo" />
				</div>
				<div>
					<p>
						프로젝트의 수주를<br> 원하는 기업, 개인
					</p>
				</div>
			</div>
		</div>
		
		<div class="ui two column grid container">
			<div class="column" style="padding: 10px; width: 50%; text-align: right;">
				<div class="ui column animated fade button" tabindex="0">
					<div class="visible content">다 음</div>
					<div class="hidden content">
						<a href="#">Next Click</a>
					</div>
				</div>
			</div>
			<div class="column" style="padding: 10px; width: 50%; text-align: left;">
				<div class="ui column animated fade button" tabindex="0">
					<div class="visible content">취 소</div>
					<div class="hidden content">
						<a href="javascript:self.close()">Cancle Click</a>
					</div>
				</div>
			</div>
		</div>
		
	</div>
</body>
</html>